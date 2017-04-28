package net.myblog.core.lucene;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.LogByteSizeMergePolicy;
import org.apache.lucene.index.LogMergePolicy;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class IndexWriterBuilder {
	
	protected static IndexWriter writer;
	
	public static IndexWriter getWriter(String indexPath)throws IOException{
		Directory dir = FSDirectory.open(new File(indexPath));
		if(writer==null){
			/**使用最细粒度分词**/
			Analyzer analyzer = new IKAnalyzer(false);
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_47,analyzer);
			LogMergePolicy mergePolicy = new LogByteSizeMergePolicy();
			//达到5个文件就合并，默认情况为10个
			mergePolicy.setMergeFactor(5);
			config.setMergePolicy(mergePolicy);
			config.setOpenMode(OpenMode.CREATE_OR_APPEND);
			writer = new IndexWriter(dir, config);
		}
		return writer;
	}

}
