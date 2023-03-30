Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3C1D304
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 23:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680220685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1xy3Si82hsoX5OufaGVk7KtbhEZkZn8SmKdNVmGxaE4=;
	b=W8wa1kdtqeYU39pOzvcAQCaSk4uqN0+eFEwK4Tqw+BIwMF4ka8FHCO0nkCgbbPD3k0781t
	kohwas48JeAhcHgNycomAN0X95xjOnF9WTRC/p7uNI3Pc48BOwzXybmDH4AzK04gb6zJt/
	RQj6sA4qhkgLx1oBrtkx7CSvEk+yC/s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-1ZWAZyFGP1CHkv-wv0cu5A-1; Thu, 30 Mar 2023 19:58:03 -0400
X-MC-Unique: 1ZWAZyFGP1CHkv-wv0cu5A-1
Received: by mail-qv1-f71.google.com with SMTP id v8-20020a0ccd88000000b005c1927d1609so8994012qvm.12
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 16:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680220683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xy3Si82hsoX5OufaGVk7KtbhEZkZn8SmKdNVmGxaE4=;
        b=q2KwFXAX63199zkEinrsVO3tEt9BCJ5n9K/k4HaM5sAMwhwjNDHoVW49d5Ig+mv41P
         Ps7UqpW+GEH3r43d0bau3pzkTK6BMm5mJ4ZZ2TM+B/Upo9VvpozQ2xFkH92D1us48/HW
         HXQOm5WQIzTHdS66bAgm78TcoO2ixnuqSmRVZgHP2+A/SYFftnZPniRitw9Eh7ZGx6Op
         UUwvSkAfeEg306iS3qGwOxj6fWOH+qWFy6aGKQmb4gqpgnKx1irTx+7XZin/3AmjNsnf
         oByjX2YGtTudbhHrK9AHnDg8B3LIjjPTf5XadKXmGVdilkLo79U5n7kw+h2VUabRQ0jG
         7fQw==
X-Gm-Message-State: AO0yUKW3+B67SA1eo5uNpo+T/eQfcoZbLNvL/pbtdKr6igGEdlsZ6OOA
	bFLLaHboD8pIOiwTBr+ib9SA6dB5+f27roMHHZCODg/Trr2KTD+nmoP3O75u3r0lVFZ+ddIkhfu
	KlrjZmuOcBnmgPg==
X-Received: by 2002:ac8:5a81:0:b0:3e3:9532:fa06 with SMTP id c1-20020ac85a81000000b003e39532fa06mr41800164qtc.45.1680220683456;
        Thu, 30 Mar 2023 16:58:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set+jNIid0RKyvmGE9Vcm0M+oEDEwii4d1YpbtTLE1M5k3iMBeqHTdXCI512CI6VH0VLZqDCgMg==
X-Received: by 2002:ac8:5a81:0:b0:3e3:9532:fa06 with SMTP id c1-20020ac85a81000000b003e39532fa06mr41800149qtc.45.1680220683222;
        Thu, 30 Mar 2023 16:58:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i2-20020ac84882000000b003d5aae2182dsm229182qtq.29.2023.03.30.16.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:58:02 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: dennis.dalessandro@cornelisnetworks.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] IB/qib: remove unused cnt variable
Date: Thu, 30 Mar 2023 19:58:00 -0400
Message-Id: <20230330235800.1845815-1-trix@redhat.com>
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
drivers/infiniband/hw/qib/qib_file_ops.c:487:20: error: variable
  'cnt' set but not used [-Werror,-Wunused-but-set-variable]
        u32 tid, ctxttid, cnt, limit, tidcnt;
                          ^
drivers/infiniband/hw/qib/qib_file_ops.c:1771:9: error: variable
  'cnt' set but not used [-Werror,-Wunused-but-set-variable]
        int i, cnt = 0, maxtid = ctxt_tidbase + dd->rcvtidcnt;
               ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/infiniband/hw/qib/qib_file_ops.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/hw/qib/qib_file_ops.c b/drivers/infiniband/hw/qib/qib_file_ops.c
index 108520e53928..bf0c90eb3129 100644
--- a/drivers/infiniband/hw/qib/qib_file_ops.c
+++ b/drivers/infiniband/hw/qib/qib_file_ops.c
@@ -484,7 +484,7 @@ static int qib_tid_free(struct qib_ctxtdata *rcd, unsigned subctxt,
 			const struct qib_tid_info *ti)
 {
 	int ret = 0;
-	u32 tid, ctxttid, cnt, limit, tidcnt;
+	u32 tid, ctxttid, limit, tidcnt;
 	struct qib_devdata *dd = rcd->dd;
 	u64 __iomem *tidbase;
 	unsigned long tidmap[8];
@@ -520,7 +520,7 @@ static int qib_tid_free(struct qib_ctxtdata *rcd, unsigned subctxt,
 		/* just in case size changes in future */
 		limit = tidcnt;
 	tid = find_first_bit(tidmap, limit);
-	for (cnt = 0; tid < limit; tid++) {
+	for (; tid < limit; tid++) {
 		/*
 		 * small optimization; if we detect a run of 3 or so without
 		 * any set, use find_first_bit again.  That's mainly to
@@ -530,7 +530,7 @@ static int qib_tid_free(struct qib_ctxtdata *rcd, unsigned subctxt,
 		 */
 		if (!test_bit(tid, tidmap))
 			continue;
-		cnt++;
+
 		if (dd->pageshadow[ctxttid + tid]) {
 			struct page *p;
 			dma_addr_t phys;
@@ -1768,7 +1768,7 @@ static void unlock_expected_tids(struct qib_ctxtdata *rcd)
 {
 	struct qib_devdata *dd = rcd->dd;
 	int ctxt_tidbase = rcd->ctxt * dd->rcvtidcnt;
-	int i, cnt = 0, maxtid = ctxt_tidbase + dd->rcvtidcnt;
+	int i, maxtid = ctxt_tidbase + dd->rcvtidcnt;
 
 	for (i = ctxt_tidbase; i < maxtid; i++) {
 		struct page *p = dd->pageshadow[i];
@@ -1783,7 +1783,6 @@ static void unlock_expected_tids(struct qib_ctxtdata *rcd)
 		dma_unmap_page(&dd->pcidev->dev, phys, PAGE_SIZE,
 			       DMA_FROM_DEVICE);
 		qib_release_user_pages(&p, 1);
-		cnt++;
 	}
 }
 
-- 
2.27.0

