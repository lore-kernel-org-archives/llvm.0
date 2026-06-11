Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442A8331A57
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150002; cv=none; b=MAjf62R1u/efmkth2db16rc9OwYUvcdukKJAfourNhyvoYmVnaZKLk8ZfY5C+/PIbSXd015BDufh2PI3tHzf5aNdPxOwBjS7KM8inYzC6U8TLEHPPkDIw+tS/ZNwKdiu4ZH/s2obRU4K9ZvSlx4qYzNaJE+zGm2BgnqToqS/3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150002; c=relaxed/simple;
	bh=PGNeHFjQkdZFVCBNSlBrOzGYn37IRrmrGpkyMACc34M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9ief4jiA1xcoGjkIgT8/BTMKtqMqBQM4flGBfGAaUDBIFEDGlRXrpEXDGEKOzDyfbLed4fFSJmtyUwerAxdOktgg1sPKLeW05FX+9g77GqbfWRobQ53vHQ8r6MoTmRGw4hIHvR8Qwnb5MTV2+fQ67p7nYE4KXzk3xBRWVzjtqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isUopMl6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isUopMl6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso7406253a91.2
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149995; x=1781754795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8RAk798iHkOqMUF+266tq7iD91rBE+7QMl47XALgu8=;
        b=isUopMl6UKKsdGxf38bJYai2q7jXfceKcInXk5GsOwNMKnVmxTaIUGlHnLQubaDrAg
         bBLX6QnzNLuywOnuBftmkveLiWw7T/OAymdbpIAn+pHh0SOKf9DdDQO7BQVEp2aOHlpt
         rU8xLJK2ucKsoPhMMAyuBKlC4F+FBvbJeqbLG0LUY/waLNBCWhuNIXEx08lV73r8lYVi
         Oka+LjDc0miNEC+q7rAtuRPpFrEUyCdlJ4FEi3vSknJmlNADQqpMlkC+nWPiE15pkmFf
         eAitSoZZXe0pIP6V64pD1lzNp82SfiJFvvFt00r/rnyQlBl+hvIncYSIiqbbC7LEb80B
         ALMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149995; x=1781754795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8RAk798iHkOqMUF+266tq7iD91rBE+7QMl47XALgu8=;
        b=nUxZZ8L5erzMXT/uiubfcqqSdP13c/mCGXJsVBrxFVSs5bx2/h34A2/fGzNx3L3lNb
         gvjeZaCBOa+fHBSOhoPpO6afdMRcXF8WAoSwCzVYjwUTj3DPSjOqf5W1ddqWHq0Z7M/Q
         JmDTQZ6NwVmD0eQo0p0HXlc+bZtyqvV0jk3y3LEN09yyo9CiTJDMQqFVJQl25Gkdi5lG
         1N7CeY7lMwu1NX0gdcfqPgvt/7R9IbY/IXOSPRWW12WE3Mv0pqn1nR2d3+5ONkljbGTT
         ipZ+9LqB1Uxoyujd3g1mJbI/9zZZ0+d9DTbbZlKxts++Mi9ltJKhLrkBoCprFWFwgF+5
         Xa8g==
X-Forwarded-Encrypted: i=1; AFNElJ8LvD2CDGI2JvXI1FAE/ZTwU4OoyXCQe0T6/XvG+pBhAk1rpNzMTKebIzcodVqZQDT+joiJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwWuzutw3EUE+RF+H6aecVaQGzlFt1nWsZ0XCpID2bvSRnid9RY
	zZhKgRaaSLWLnUyRwuqjGpcidKt0g+fWiGtr1ImZRBlWObmasluE+bGir4uylQ==
X-Gm-Gg: Acq92OGNxagRQ9A4lmNSpQn7qSpUvMS9A9Qyslw/z/VoaNu8NJcPoBujlqB1R104iDQ
	RgiKQTWySoBGO9svSwKQJIjxKRmwM2fyScxlt5YZ14D3waX+k6SNWBzSw6vDYl+zCiblkhdVYVe
	EGBGJxztkOe0LOBqWc3KlAr67o8sRlvkM4h/AGayp1h8RFjxGJ4JJNvUY4VALqkMQSJUSOc8zkl
	IXzwMeF4pEDcfBiOZOKP+HlBOSOSwoHRnTqCrVUEAEjmn0PwztZNumebioLQYwfXLCT6D2s6HQd
	jt0Hcuu0blsC4qHMtW00/tYqgEMSSCtLSH+5hkjViDh2z7JW3XZ2oLPmn8eEHXI/f70MSZppSa8
	WnsFJklzueq+2kyORtGaoNrw/2WDD7K6pHoBevni2SufPkDcmhpGvBRGSEYsK8Z5hgetbCw+wgu
	+iHmC3n84l4EOkWwbYUZZapZXXqZ0U1i3qWcuJCjrthCmQckspUnFeRv0dKD9/isjiK6/iUTBhm
	tM2qGno8bDIjiid5mG/nFSiiJrVKIi0ky0vcLraBUK4bw==
X-Received: by 2002:a17:90b:1642:b0:369:7421:75c3 with SMTP id 98e67ed59e1d1-377a5915432mr1202815a91.16.1781149995246;
        Wed, 10 Jun 2026 20:53:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 08/15] dmaengine: fsldma: convert to platform_get_irq_optional()
Date: Wed, 10 Jun 2026 20:52:38 -0700
Message-ID: <20260611035245.13439-9-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-controller irq_of_parse_and_map() call with
platform_get_irq_optional(). The controller IRQ is optional when absent
(-ENXIO) and the driver falls back to per-channel IRQs. Any other error is
treated as fatal. The corresponding irq_dispose_mapping() calls in the
probe error path and remove function are removed.

The per-channel IRQ mapping in fsl_dma_chan_probe() uses a child
device_node rather than the platform device's of_node, so it is not
converted here.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsldma.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index c04a7fbd2ed0..eba194d64105 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1213,7 +1213,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	spin_unlock_bh(&chan->desc_lock);
 
 	tasklet_kill(&chan->tasklet);
-	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
 	kfree(chan);
@@ -1248,7 +1247,14 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
-	fdev->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+	fdev->irq = platform_get_irq_optional(op, 0);
+	if (fdev->irq < 0) {
+		if (fdev->irq != -ENXIO) {
+			err = fdev->irq;
+			goto out_iounmap;
+		}
+		fdev->irq = 0;
+	}
 
 	dma_cap_set(DMA_MEMCPY, fdev->common.cap_mask);
 	dma_cap_set(DMA_SLAVE, fdev->common.cap_mask);
@@ -1317,7 +1323,7 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
+out_iounmap:
 	iounmap(fdev->regs);
 out_free:
 	kfree(fdev);
@@ -1353,7 +1359,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (chans[i])
 			fsl_dma_chan_remove(chans[i]);
 	}
-	irq_dispose_mapping(fdev->irq);
 
 	iounmap(fdev->regs);
 	kfree(fdev);
-- 
2.54.0

