Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD46F7E
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652099558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YyVeP8FyL2hyCQ2N083n40aBu6xoSDc160MDLkcNums=;
	b=Wgm8AiDdqwh3oV89T1UEfmU+ma534R6QsB8dqfyTMqZl9YkIToAyZBJz/X7gPCmebNE+Qv
	LYWz7Rscz31/0zIY3oBNhIc+IPMmjFf41J3H8mMOvIkcJK8925d7/yjwmon758v0mJ1zRf
	uegO3tvq+XYXEnrjHl13Y+9kw2u+Yjc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-LaIg9sJgNXyzGXosea0qTA-1; Mon, 09 May 2022 08:32:37 -0400
X-MC-Unique: LaIg9sJgNXyzGXosea0qTA-1
Received: by mail-qt1-f200.google.com with SMTP id i11-20020ac85e4b000000b002f3d8c3a96dso2773385qtx.9
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 05:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyVeP8FyL2hyCQ2N083n40aBu6xoSDc160MDLkcNums=;
        b=xP2TTjLEjuRKvX3Cv8NuaMdqDD9byjuPbZqTOkVJSsgjDyiAJVYSSDY0JouKO9LDmN
         QvNotpJDGnC/9C+IPGoYa6uWE+HBbqpZ3KPnEyhCAxRT1JY3du3Becs7GL7TBF1xmh4T
         SMGrVyz0ATQgEZ1vJQ62MqIhpCmdbVVwL1Ou/bbFjpLnHXmZ+gMu1cC6e6Lo3h22Z8/n
         3Jcdo04/KFM7i3h3KoCBHNx4m7yGyZVUd/wQlsnlGuXxp1ejBdKyZx50/rsRLVID7AdI
         XO1ZyV5DqWH8Ney+nrHB6hvCygPkwajYitva2YsOJ9qJrck+o0FvDlKevSFltPP9Sm7r
         g8Lg==
X-Gm-Message-State: AOAM530pyfrIpPQwgm6wFtL3lBDFBBHbSZA9ja8QJEdaE3SqPr7oiCIw
	T6nuyMZk0e5uOaNzfM7BChi5fTS1Rn4wuRUOFYPChVGmMUV63e5myS7tpq5Szz0qEw40VqiwlUq
	v1zXreYHeS82raQ==
X-Received: by 2002:a05:6214:3012:b0:45a:afde:568b with SMTP id ke18-20020a056214301200b0045aafde568bmr12922423qvb.2.1652099556896;
        Mon, 09 May 2022 05:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR0DnU583XohtUlCS3huesd3t60jnAeqmFyQSwk+kv9UkI5PNlzULAHfpsImS/2Qvu9b+YRQ==
X-Received: by 2002:a05:6214:3012:b0:45a:afde:568b with SMTP id ke18-20020a056214301200b0045aafde568bmr12922403qvb.2.1652099556686;
        Mon, 09 May 2022 05:32:36 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t134-20020a37aa8c000000b0069fc13ce23bsm6818499qke.108.2022.05.09.05.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 05:32:36 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: hughd@google.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	willy@infradead.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mm/shmem: restore setting of page variable
Date: Mon,  9 May 2022 08:32:32 -0400
Message-Id: <20220509123232.3428667-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clang build fails with
mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used here [-Werror,-Wuninitialized]
  if (!page)
       ^~~~

In the commit listed in the fixes, there was a change to the
from
  page = shmem_alloc_page(..);
to
  page = &shmem_alloc_folio(..)->page;
But in this case, instead of replacing, the setting of page was
deleted.  So restore page with its new api.

Fixes: b0bb08b2d5f3 ("mm/shmem: turn shmem_alloc_page() into shmem_alloc_folio()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 mm/shmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 7faaa61ff7fa..a2234f19b711 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2334,6 +2334,7 @@ int shmem_mfill_atomic_pte(struct mm_struct *dst_mm,
 
 	if (!*pagep) {
 		ret = -ENOMEM;
+		page = &shmem_alloc_folio(gfp, info, pgoff)->page;
 		if (!page)
 			goto out_unacct_blocks;
 
-- 
2.27.0

