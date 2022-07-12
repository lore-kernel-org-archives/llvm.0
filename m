Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62194C95
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657657581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uitgsVWXbdrv8zFt2LqySt7cam5rPIej+nIiQV98pw0=;
	b=Rxy6jj6Adj6QqcsCyqF31mmbsNioGXiArgQcxcMf/JNXum3mGtJPf2cBnbe3WYl+MZ2uzs
	p9X69RrgNn43objY4uBFeTO062LvIwJDRyjgVD4LP+CGUKgr2NbzaBb3aN8YtRchJtRkxM
	OtPpNrIAd/cSCZo7cNKOFzSt3bj9aBs=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-3G0E8Up_OTmJ5y8PZqPIRg-1; Tue, 12 Jul 2022 16:26:20 -0400
X-MC-Unique: 3G0E8Up_OTmJ5y8PZqPIRg-1
Received: by mail-oi1-f200.google.com with SMTP id o9-20020acaf009000000b0032f4e886b80so5849858oih.5
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 13:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uitgsVWXbdrv8zFt2LqySt7cam5rPIej+nIiQV98pw0=;
        b=QQqPpOC7SOA03jEdGwIaiYs13h/jLwd3xKMEQ/pLRydxX83ZHmDXrIPVJrj/QyCWrV
         /sjCfYf5ugCW8CI1rtBlTH0VXdhmOv6b9hqqoDYhl53Xf3mn1V4HPpsz2hI1HGSFOwzW
         XyFQhNjem3iB70u/4euNs1DHsZLI6lNrumpW+5q0LgUNyE5Y6Npv51I7jUTw+w+G0++I
         USGSdCjXFaCgNbJAR6lLnc4dki2IaJOhJHCMgpQAPOcLG7jQKEPCU581Di842UdolWuF
         9fPoXVeYm4nT1AQBmPjr1E7mdsRGcG83XTIbWdJP5Rll5KBGHixlQbk33aPuGqVRypCJ
         Q5fg==
X-Gm-Message-State: AJIora8Pmlbm6DgYmwM7Jnane56baqZK8ZLull3Mwn5yKiJTLOIVu40e
	qmV9RPVomEXZhd2pums/yqreTXNZDKQN2i3hWIcekt1Y0xdvs5hzzwIJhMD7OJy1Ps0nLUgpj5+
	wNWEpNrN3Lbczmg==
X-Received: by 2002:a05:6830:608d:b0:616:ecd7:de2 with SMTP id by13-20020a056830608d00b00616ecd70de2mr9966414otb.119.1657657578770;
        Tue, 12 Jul 2022 13:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9ZClxcrqJht1T6mxLG+napIslBEJNktJNzhxGbv3GvFDTtH6eVOCwyrB0kLgCN4MgD4pEBw==
X-Received: by 2002:a05:6830:608d:b0:616:ecd7:de2 with SMTP id by13-20020a056830608d00b00616ecd70de2mr9966403otb.119.1657657578577;
        Tue, 12 Jul 2022 13:26:18 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id k26-20020a056830151a00b006168bc4caacsm3992119otp.67.2022.07.12.13.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 13:26:18 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com,
	viro@zeniv.linux.org.uk
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] block: move initialization of i to its definition
Date: Tue, 12 Jul 2022 16:26:08 -0400
Message-Id: <20220712202608.630259-1-trix@redhat.com>
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

clang build fails with
block/bio.c:1232:6: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (unlikely(!size)) {

In this check, the code jumps to 'end:' over the loop that initializes 'i'.
Move the initialization of i to its definition.

Fixes: 9a6469060316 ("block: convert to advancing variants of iov_iter_get_pages{,_alloc}()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 block/bio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index a98b90489ae0..aff36ca7cabb 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1199,7 +1199,7 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 	struct bio_vec *bv = bio->bi_io_vec + bio->bi_vcnt;
 	struct page **pages = (struct page **)bv;
 	ssize_t size, left;
-	unsigned len, i;
+	unsigned len, i = 0;
 	size_t offset, trim;
 	int ret = 0;
 
@@ -1234,7 +1234,7 @@ static int __bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 		goto out;
 	}
 
-	for (left = size, i = 0; left > 0; left -= len, i++) {
+	for (left = size; left > 0; left -= len, i++) {
 		struct page *page = pages[i];
 
 		len = min_t(size_t, PAGE_SIZE - offset, left);
-- 
2.27.0

