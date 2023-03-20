Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BE7B
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 23:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679353934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8OXg4VI8cm6vRN/hId3npmgyDD4BW9c8No9p4EZybmM=;
	b=bxYxTa20CZivNqnpUecAKMZC5iHCnkeE0+T8Ieco0z2AV9enwfkOJFdjZsac0T+9h9OuHc
	rMhXGtNvqHfl3cGkWMMivRUQ/06GQ9sSO7v+c+HKYTkRHX7wOKFtVgXJQ7QroW45/RJ3OT
	XToR8bfh+V08jT2t8g2tdSOiCRzGvXM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-21iDvVhEOoGPJxGWSBYs5w-1; Mon, 20 Mar 2023 19:12:13 -0400
X-MC-Unique: 21iDvVhEOoGPJxGWSBYs5w-1
Received: by mail-qt1-f200.google.com with SMTP id i2-20020ac84882000000b003d6fee1d438so7817836qtq.1
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 16:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OXg4VI8cm6vRN/hId3npmgyDD4BW9c8No9p4EZybmM=;
        b=1VxeSRSrubEa0SeA8OIm9V2FbdrixafYbeuFiZjtgeW0rEBYEI93Xdn63w7SXR2gQ1
         8x05lIIiRZ0LANuDgQZ68dZfYwUBkixlFcFHYrOZ5888MVhzP/eAS70k9XscDMk7zH+X
         6mKZZ8+7v3XqShQQB4qd2nFM0Mno9gmZFb8ktsJxQCp/IE854mfjkD4bIR/66SeimkYu
         Xpz2ojKi4mX/tn7lVg2pMtOu2lQWxZe3V3HGHz8sp91YhiFP/Z+W/DPws74DCB1tsjNp
         AWYcCqjiQWx8UoJYASQtT5fzPTESVa+Hsq/j7fynJ5+a27nZcY5UwDJyL9/tupzVzfdz
         8q/w==
X-Gm-Message-State: AO0yUKVuZAtGPI0bMRU25rL8lpEmEHJSRLBDnkWaUquEsrconzQR4snq
	FeZnhNTH5yiWK0lPnNeYKPSGlNwkwnoECHbS0+YIWTXBMzL0qKu/7aFoJtjg6jYZ7PhVofFfhEu
	P2T3t3kVmqnNTYA==
X-Received: by 2002:a05:6214:e6a:b0:5b3:4b99:7af8 with SMTP id jz10-20020a0562140e6a00b005b34b997af8mr998488qvb.21.1679353933194;
        Mon, 20 Mar 2023 16:12:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WMLf2/hC3NpULLTuNzWukCaLGaPzgM3n1zv6eFgYYW5UjHVNHtsaQFRkKcay04SkrmfZlyQ==
X-Received: by 2002:a05:6214:e6a:b0:5b3:4b99:7af8 with SMTP id jz10-20020a0562140e6a00b005b34b997af8mr998476qvb.21.1679353932932;
        Mon, 20 Mar 2023 16:12:12 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o10-20020a05620a0d4a00b0074281812276sm1755579qkl.97.2023.03.20.16.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:12:12 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: peter.ujfalusi@gmail.com,
	vkoul@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] dmaengine: ti: edma: remove unused edma_and function
Date: Mon, 20 Mar 2023 19:12:09 -0400
Message-Id: <20230320231209.1728940-1-trix@redhat.com>
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
drivers/dma/ti/edma.c:321:20: error: unused function
  'edma_and' [-Werror,-Wunused-function]
static inline void edma_and(struct edma_cc *ecc, int offset, unsigned and)
                   ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/dma/ti/edma.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index fa06d7e6d8e3..9ea91c640c32 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -318,14 +318,6 @@ static inline void edma_modify(struct edma_cc *ecc, int offset, unsigned and,
 	edma_write(ecc, offset, val);
 }
 
-static inline void edma_and(struct edma_cc *ecc, int offset, unsigned and)
-{
-	unsigned val = edma_read(ecc, offset);
-
-	val &= and;
-	edma_write(ecc, offset, val);
-}
-
 static inline void edma_or(struct edma_cc *ecc, int offset, unsigned or)
 {
 	unsigned val = edma_read(ecc, offset);
-- 
2.27.0

