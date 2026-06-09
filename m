Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC66541167C
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043608; cv=none; b=mQtGz9yz4tTrG017EKxzlAF5M9rPKNO3tlrujj6wRc4qhEcQMGgMt4TDmykHy0wcR7AHXLLmRAt1Z9Mgm7+lx3vxgNB8hHkqZgXfrkGzlNvnAnX1IHLCmtcv9SCXNMOEg4S6nQ+OPGd9s4j8KBJRRO8VkA5AFxAqZCIngt9XqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043608; c=relaxed/simple;
	bh=Gx3zpLu6WtzzCPNIoXGM3SzeP5Zd9wP8Spx+zDr1Wyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKU8xDhts9wv6UJl9YMRavjtYL9Onunn0HQ7jA9v0L12/xBntBe4k+wCXy7e5LrNbY63wAr4VFzvhNv465+kkqSa/NH6D4J4hbS+JKlbKUqfgMlubYnkJ8rh3u/XR7w2JPtoFzHj/+dTf0gxiYctM/2uN767wfMGQa9ZGGAkbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdhkjzoD; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdhkjzoD"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso1003640a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043606; x=1781648406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=RdhkjzoD0WkkB87quA6f3xcC4s775ZXrI2AvcD90tdDDBOJuH/T7W+jmkg2KbpOQfA
         05vfK4674SeET7EwUPCQnanU7IuSFi+KFdqkJXJS0Xv3bpIJgr5rSTU0NP9rfPPdmal6
         d77VCX3baej89KeOmTOAn04DW6DTXnQX5zj2Y00efqxjSUUXy3xDa9MLsvS3d96ZEeUa
         OQkM3OAVuyY9k51oKbghAfrc2J5ea9TkXMuYMvVPkmpBj701pZehgq+7Pv9kgW+kQ9CI
         mrPqTvoZbor06hC8iyCWVC/jIzuNNcFD7XXe5xT+3x1j8Cb7ADqZ2bSOmVUgKBk3cX1i
         SbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043606; x=1781648406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zh/mpsi9dKYVr7XXt/nowqZiSrF2hHl6kTiAGF+2p2s=;
        b=W1kV0rwMa+T8tB8fJUpZw9MRQImDIMXINd2N4N9ocnLYdGYO+EvZOctR2zjQwVzTRV
         tl56LOln5k5IqL/zFgII+pQ4dx6LrveM58+NLAyX6n1SIMjyExr8GEE+cUx+V/BqO3Br
         gWiji7nL+E2gYIYYxupkgUpYQqBauhz+fLHBb1OtXKpnFtOsMFOr4QFBG0C6fs0trLCs
         ZRVTGPWLM22Ry6wzJ+THgr85RemKZa82MclFbrKJrHCOAWGXvJk2s0OUWPnr5vvQu6ko
         VUdzSy6LT7Cf5dTQ0pZnKOA7WnwTg7GlEn38yKR8fo4fnohGHRi9RXyFsoIJCbjvSd/u
         u5Og==
X-Forwarded-Encrypted: i=1; AFNElJ8mTcucgXE7osVOBcyRmFDC6SMc+fjtyMgDCnoTEEFUXckdXSkZSinEXCW8WA0jZKt/u/6S@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvh2UWsQKZWnPXwFcPJ+zNKyK/QG7JqBuSME3kkUvEPIcVt9ig
	akl7tYRj7+ThhTGhjc40NmP97aH83my9N35uiolaiVanjCjdmpZEWFwG
X-Gm-Gg: Acq92OGmzltxdCtINKSBvvx/FhyVPNYM4jzkauNrfPyVDBd+1okpDhzZSzuqW/vnzBx
	SHCLSeOe0gze8L+ANUeWhXQn7xTuKNY+HWtmUWh83gCpbeZ3x5P0HIsD8WMcSMu0m7DlGs//wtS
	7ksafVcqn3UyXEz7VsFC4co0GhX6HVLb4crlBFioBE+Iiq/Jp8AiqmntghfV7/xiqk9zsCc7LVo
	TUoqukM/hs4PJc1R77phfVRB4vYUxG/xHlg0a1Veg2hx3xlcJgT3HaCGUvct6jp47sd8JNzQFX4
	aHQNjh+Tw3xtGVnAARCTRvrUDN8Keb5SyrWqUAC+q+8ZDoerga33aTHK9w3jGv86BzmJIteHU0o
	FfcugJEZz2E3CnDgEfxVIB07ZSM9EhqnzbLInK8d+EtQuRyGVaf2lFweB10eCP3ZWoxINvAdmLP
	VU4k5b0bSiLn7maTqBEf+M6dW6wF+6v1AbO9DDdNAMDzwUBGVGSoDu8hXB4B120hOiCQNv3qE3b
	rx3CcJ/yx7FYQXGpz+X5Ebf5BFtocyYSSPsH3Dtz9mQRA==
X-Received: by 2002:a05:6a21:350f:b0:398:9379:d04d with SMTP id adf61e73a8af0-3b53be59e67mr4919030637.24.1781043606091;
        Tue, 09 Jun 2026 15:20:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:05 -0700 (PDT)
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
Subject: [PATCHv3 11/15] dmaengine: fsldma: convert channel allocation to devm_kzalloc()
Date: Tue,  9 Jun 2026 15:19:22 -0700
Message-ID: <20260609221926.35538-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_dma_chan_probe from kzalloc_obj() to devm_kzalloc(), tying
the channel lifetime to the parent DMA device. Remove kfree(chan) in both
the probe error path and the remove function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index e4a3315a7d9d..0df09789187d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1114,11 +1114,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 	int err;
 
 	/* alloc channel */
-	chan = kzalloc_obj(*chan);
-	if (!chan) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	chan = devm_kzalloc(fdev->dev, sizeof(*chan), GFP_KERNEL);
+	if (!chan)
+		return -ENOMEM;
 
 	/* ioremap registers for use */
 	chan->regs = of_iomap(node, 0);
@@ -1200,9 +1198,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 out_iounmap_regs:
 	iounmap(chan->regs);
-out_free_chan:
-	kfree(chan);
-out_return:
 	return err;
 }
 
@@ -1215,7 +1210,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-	kfree(chan);
 }
 
 static void fsldma_device_release(struct dma_device *dma_dev);
-- 
2.54.0

