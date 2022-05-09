Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8937E
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 12:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652099493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gEOVNDDSpKASfNP7Ge49MOGYJd/s6CThQbdN++TPQOc=;
	b=acTMg3p/3bjAcOM8TzAzviGHgy6li3VzjDn6iPepjVxeBk718zKqOTTD+BLhH18HmDywX1
	B2jEh/NFZEWWf1p97CBBTlZEn+Zvm1eGv3KoUX7B8le1X7x1NerAYdLTrzdEDcy+NwiBqh
	e/H5FYq2usztnoKTq8G4X5AXNXo5Hgs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-7T1RgE8qMleWhjuUmchFfQ-1; Mon, 09 May 2022 08:31:32 -0400
X-MC-Unique: 7T1RgE8qMleWhjuUmchFfQ-1
Received: by mail-qv1-f70.google.com with SMTP id d13-20020a05621421cd00b0045a99874ae5so11649571qvh.14
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 05:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gEOVNDDSpKASfNP7Ge49MOGYJd/s6CThQbdN++TPQOc=;
        b=JtomHNg22srElB2GOgU0Ze/ra2FrupT42zw6ZTmAzgSEQlKxn03MZSJgpq5prXerFg
         rkO50I3cXk/D7eOG3Rl9m4v9RBHeRBKh4aVXQtXEESof5timrRelRDhnKSLfQ+WsL2Je
         wx7MsXtBQ8ITvd/8IZygK8LA2KFI1Cdgdz5PIWw8avryzxoOJE+OBDC7YBokLt+K/y32
         wEVeuF1WUMEVwQeBW96lfU/VP1RZ2ELJLrBDJ12OL1NHuG24POtnb076LjYlwwJS4CrA
         Iek9SO7n8fRZGasq/N/xoT0Im+xl1B28sOCHwsc5D3aM7oEeBelL8K/C1wrielkqFVoC
         efig==
X-Gm-Message-State: AOAM531IiDdkr1zc1H4x3WZYeLwX+tdBlvr4EFcpigIdAM/axqoia7MC
	EN1I0MFsdrgnoj4TPDALIlbHdG/SresTESClxO+90RhVMQiIcB9HOPMst/6kc2PnhezztxUyBd9
	+Dov9008WH27SXQ==
X-Received: by 2002:ac8:5954:0:b0:2f3:7d71:869e with SMTP id 20-20020ac85954000000b002f37d71869emr14705071qtz.183.1652099491278;
        Mon, 09 May 2022 05:31:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxHsEqi5MAo7TiJ6W+7CBlLKlZqhZAzL8aK4UMWuppI0cXur/TKjXyNde7+COugsYcZctc+w==
X-Received: by 2002:ac8:5954:0:b0:2f3:7d71:869e with SMTP id 20-20020ac85954000000b002f37d71869emr14705046qtz.183.1652099491002;
        Mon, 09 May 2022 05:31:31 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o27-20020a05620a15db00b0069fc13ce203sm6736097qkm.52.2022.05.09.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 05:31:30 -0700 (PDT)
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
Subject: [PATCH] mm/shmem: initialize folio to NULL
Date: Mon,  9 May 2022 08:31:16 -0400
Message-Id: <20220509123116.3169267-1-trix@redhat.com>
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
mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  if (!page) {
       ^~~~~
The error handler for !page jumps to an if-check for an unset folio.
So initialize folio to NULL.

Fixes: 2b58b3f33ba2 ("mm/shmem: convert shmem_swapin_page() to shmem_swapin_folio()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 107f1e4dd0aa..7faaa61ff7fa 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1682,7 +1682,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	struct mm_struct *charge_mm = vma ? vma->vm_mm : NULL;
 	struct page *page;
-	struct folio *folio;
+	struct folio *folio = NULL;
 	swp_entry_t swap;
 	int error;
 
-- 
2.27.0

