library(pttR)
library(dplyr)

# # index2df() ###
# idx_df <- index2df('gossiping', newest = 1)
# View(idx_df)
# idx_df <- index2df('gossiping',
                   # search_term = '魯蛇',
                   # search_page = 1:2)


# # post2df() 1 post ###
# pst_df <- post2df('https://www.ptt.cc/bbs/Gossiping/M.1538062733.A.568.html')
# View(pst_df)
# str(pst_df)
# pst_df$comment[[1]]



# # post2df 吃 vector ###
# pst_df <- idx_df$link[1:5] %>%
  # as_url() %>%
  # post2df()
# View(pst_df)


# # Segmentation 1 ### 
# pst_df <- post2df('https://www.ptt.cc/bbs/Gossiping/M.1537945316.A.015.html')
# pst_df_segged <- pst_df %>%
  # mutate(content = seg_content(content),
         # comment = seg_comment(comment))
# pst_df_segged$content
# pst_df_segged$comment[[1]]$comment

# # Segmentation 2 ### 
# new <- c('庫洛洛', '念能力', '西索')
#
# pst_df_segged <- pst_df %>%
#   mutate(content = seg_content(content, words = new),
#          comment = seg_comment(comment, words = new))
# pst_df_segged$comment[[1]]$comment
