package kr.or.test;

public class XmlUtils {
	private static XmlFormatter formatter = new XmlFormatter();

	private static final int DEFAULT_INDENT_NUM_CHARS = 4;

	public static String formatXml(String s)
	{
		if( s == null )
			return s;

		return formatter.format(s, DEFAULT_INDENT_NUM_CHARS, 0);
	}

	public static String formatXml(String s, int initialIndent)
	{
		if( s == null )
			return s;

		return formatter.format(s, DEFAULT_INDENT_NUM_CHARS, initialIndent);
	}

	private static class XmlFormatter
	{


		// XML 노드의 값이 여기에 지정된 글자수가 넘어가면 노드와 같은 줄이 아니라 다음 줄에 표시된다.
		private static final int SINGLE_LINE_CHAR_NUMS = 500;

		// [2013-05-29] hskang - synchronized 를 걸 필요가 없으므로 성능 향상을 위해서 뺐음.
		// 이 메서드 안에서는 멤버변수를 사용하지 않음. 파라미터는 Stack에 저장되므로 멀티 쓰레드라 하더라도 공유하지 않음.
		// public synchronized String format(String s, int initialIndent)
		public String format(String s, int indentNumChars, int initialIndent)
		{
			boolean singleLine = false;

			int indent = initialIndent;
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < s.length(); i++)
			{
				char currentChar = s.charAt(i);
				if (currentChar == '<')
				{
					char nextChar = s.charAt(i + 1);
					if (nextChar == '/')
						indent -= indentNumChars;
					if (!singleLine) // Don't indent before closing element if
						// we're creating opening and closing
						// elements on a single line.
						sb.append(buildWhitespace(indent));
					if (nextChar != '?' && nextChar != '!' && nextChar != '/')
						indent += indentNumChars;
					singleLine = false; // Reset flag.
				}
				sb.append(currentChar);
				if (currentChar == '>')
				{
					if (s.charAt(i - 1) == '/')
					{
						indent -= indentNumChars;
					}

					int nextStartElementPos = s.indexOf('<', i);

					if (nextStartElementPos > i + 1)
					{
						String textBetweenElements = s.substring(i + 1, nextStartElementPos);

						if( textBetweenElements.trim().length() == 0 ) {
							textBetweenElements = "\n";
							sb.append(textBetweenElements);
						} else {

							if( textBetweenElements.length() > SINGLE_LINE_CHAR_NUMS )
							{
								sb.append("\n" + buildWhitespace(indent) + textBetweenElements + "\n");
							} else {
								sb.append(textBetweenElements);
								singleLine = true;
							}
						}
						i = nextStartElementPos - 1;
					} else if( nextStartElementPos == i + 1 )
					{
						sb.append("\n");
					}
				}
			}
			return sb.toString();
		}
	}

	private static StringBuilder buildWhitespace(int numChars)
	{
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < numChars; i++)
			sb.append(" ");
		return sb;
	}
}