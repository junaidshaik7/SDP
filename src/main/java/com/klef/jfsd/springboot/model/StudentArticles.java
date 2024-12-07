package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class StudentArticles 
{
		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private String articleTitle;
	    private String articleDescription;
	    private String articlecategory;
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getArticleTitle() {
			return articleTitle;
		}
		public void setArticleTitle(String articleTitle) {
			this.articleTitle = articleTitle;
		}
		public String getArticleDescription() {
			return articleDescription;
		}
		public void setArticleDescription(String articleDescription) {
			this.articleDescription = articleDescription;
		}
		public String getArticlecategory() {
			return articlecategory;
		}
		public void setArticlecategory(String articlecategory) {
			this.articlecategory = articlecategory;
		}
	    

}
