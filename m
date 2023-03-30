Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2021FC4
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680182481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UMgOcaBYHmqhOkJHME9qiHTqpNNGWfEaKghbG+Vz4mM=;
	b=Mmn6aVqwqMgWLjsePJTZTQzdaQ/9U5qGgk0j+mtNFF8CJQ++9zufQ7blWLzjlUCnOa1ysw
	3M82YEQi6BPjcTp6iyjfgB7ndzum3dtHXjjDQXRjTVxrGs/5T2IhYbKnm26mMHsj4k7x73
	YTHLRXXQY7S2Dr0PDJZml4MCcbEAmrU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-mAcUr0leNWaMrH8-RMlI-A-1; Thu, 30 Mar 2023 09:21:18 -0400
X-MC-Unique: mAcUr0leNWaMrH8-RMlI-A-1
Received: by mail-qt1-f198.google.com with SMTP id v10-20020a05622a130a00b003e4ee70e001so6400047qtk.6
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680182478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMgOcaBYHmqhOkJHME9qiHTqpNNGWfEaKghbG+Vz4mM=;
        b=3SX+mCdDnUemmJ7pWM5HwLtt1A/S8dBYPhCI83iAYzbGZzhLw/j9W5o4iFy6zxgSVp
         ocMEDmRKFS/IZjdkumDJGJjmJk7TRcTFlPO4Iyy2sWDVcNnDHf/Ele1cpOhz0ow5xFYp
         TAEe8Nsusq+D20wDVmo+RP+qDWtoboU+aHoxRIHXg0DOm/d0mVITyWbYl0ljC8SOXS0w
         j3+lkPNFPmbNkJf4uIAN1BMT0K9aKq1p8DaLbXTE7y0lXQ1UenoKdlx8RHoiHCnRnvvI
         GpX3JlKMtWj5FnOCm/97mYfeQU1yeDwPXeNt0n92RXu2qyFO46lRd2zqPWciTLL6BZ7n
         SP3A==
X-Gm-Message-State: AAQBX9d471gHPHOnrp1TjRLYPmwQXUFUepFn4BfhdHycxsVzAtaLGvod
	kkxSnWugu9q/faq8JDtcTzboQ2jqcQp+Ev3yGz72ETNzmpb5YmhJmvqYFjriI+GQ46DPsNoQ9J5
	PqCu8+dnUOdGjhQ==
X-Received: by 2002:ac8:57c2:0:b0:3b6:3a12:2bf9 with SMTP id w2-20020ac857c2000000b003b63a122bf9mr41512592qta.2.1680182477790;
        Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/gzHee0RWTGrj5XptDSoc7k80mtN1LbJfu1rmyF743GurwDMiR8L9IeT+B4QfnE1T3ZSvMjQ==
X-Received: by 2002:ac8:57c2:0:b0:3b6:3a12:2bf9 with SMTP id w2-20020ac857c2000000b003b63a122bf9mr41512554qta.2.1680182477546;
        Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id fu48-20020a05622a5db000b003b9b8ec742csm17026168qtb.14.2023.03.30.06.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ccaulfie@redhat.com,
	teigland@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] fs: dlm: remove unused count_match variable
Date: Thu, 30 Mar 2023 09:21:14 -0400
Message-Id: <20230330132114.1826399-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
fs/dlm/dir.c:67:26: error: variable
  'count_match' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned int count = 0, count_match = 0, count_bad = 0, count_add = 0;
                                ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/dlm/dir.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index fb1981654bb2..982f7a5570fe 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -64,7 +64,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
 	char *b, *last_name = NULL;
 	int error = -ENOMEM, last_len, nodeid, result;
 	uint16_t namelen;
-	unsigned int count = 0, count_match = 0, count_bad = 0, count_add = 0;
+	unsigned int count = 0, count_bad = 0, count_add = 0;
 
 	log_rinfo(ls, "dlm_recover_directory");
 
@@ -158,14 +158,6 @@ int dlm_recover_directory(struct dlm_ls *ls)
 							     b, namelen);
 				}
 
-				/* The name was found in rsbtbl, and the
-				 * master nodeid matches memb->nodeid. */
-
-				if (result == DLM_LU_MATCH &&
-				    nodeid == memb->nodeid) {
-					count_match++;
-				}
-
 				/* The name was not found in rsbtbl and was
 				 * added with memb->nodeid as the master. */
 
-- 
2.27.0

