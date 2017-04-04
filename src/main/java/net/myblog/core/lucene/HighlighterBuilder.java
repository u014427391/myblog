package net.myblog.core.lucene;

import org.apache.commons.validator.ISBNValidator;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;

/**
 * @description 对Lucene高亮查询操作进行封装(修改中)
 * @author Nicky
 * @date 2017年4月3日
 */
public class HighlighterBuilder {
	
	private static Highlighter instance;
	
	public static Highlighter getHighlighter(QueryScorer scorer){
		if(instance == null){
			Fragmenter fragmenter = new SimpleSpanFragmenter(scorer); //得分高的片段
			SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
			instance =  new Highlighter(simpleHTMLFormatter, scorer); //高亮显示
			instance.setTextFragmenter(fragmenter);
		}
		return instance;
	}

}
