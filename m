Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432D333429
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150002; cv=none; b=Nwzw0EqogUa3KLqIrzr1aLtGVUauXr17kc6HIOMHxxWNy8aKmDjH75T1kAmgSeO9tfym9Y3smLw5i2NsGqmxOYsufarC/zrkflZeu6qEbfMoY3sI+worRuojOTU9i510zc/fh5RqTPtX7YYgc8J2l2vOAuoEVexHaTmeq5fsNMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150002; c=relaxed/simple;
	bh=US673kb/X8Z8RqJZ4fkrI1dtQ4jRRXybN/z0dPlMBx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeiC18STx+XlbVKQ2CyVrLKoUFJTyjjRusXlxoY+UGEswlaPGOe9lwKtvk4j26XylmskLQK6TQLRAi63keyTiVZnN7F0/jaaerfesAvuX1bZVY3GzLx1tEo4Z5F+PhpDg25pNQiICHGJYQbHT15BUG0TezazYNKfi9vwg0U5zGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogR79bM8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogR79bM8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so3176699a91.0
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149997; x=1781754797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Y9CBzltffMyeyjO+tKHgWOm91RTvExE1MCtYJb7pE=;
        b=ogR79bM8UayJw7eqGgrjhquVX3VuradNaioXjoDC7FXj+QOoc0PqNUiJt/3AmmDc8t
         qVP7P6KtpMgUHgKMewxytMR6dhVqUuwryY/SvbKRwQvcbLLOIbVeJSSatu2ac6p3DES9
         uAYKbFnXS43603xT+9JRfQ8I8z9EEa1/5RK6bdkeXQohx/VnEonMTs1u8oYZ/rMV0hYo
         3z5DKOo9OixVLwC2CEwrMWms9ixtjxFUy+YGn5JMi3Us2yHBLIOsbqYDK5if7D+rOmuc
         3UfW17HpmePuBU8QDY/TaD6qeHkTBTA2mffAoUVsKin9dMat5PCRFE2AIMosUnGbsGQC
         BzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149997; x=1781754797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3Y9CBzltffMyeyjO+tKHgWOm91RTvExE1MCtYJb7pE=;
        b=Ktzf92wZWGF4H3D1RorNZvwL7+2KVKL5rOvm31sLDRUzu7o4iUcjyX0KRj6jjiVfyj
         5K1kKFuvdHowVdb2gQZ5+0fUlcU9kXcON4ZnTT5lrYuogi6XAkEVAZLUNYUS3y1qXAPp
         XVom+Y5IPNPYu8V9D7v8wWkKZdAUCef7W4m50RcM8mZiF0oAlobIndeeeNONWj5EV6ku
         Sy1zeT6MWY/mcF6SSJahODcMsreGlAIwthm4O4qu0uzZPUfehd/pWh0g8jkBvRbAp7Uv
         pOBM8BHa4ENJKhNoTatbnidGBbflGUGlyEgEDIAHheCpAFfJojNYvsClwJbOh9jayK6f
         yyOw==
X-Forwarded-Encrypted: i=1; AFNElJ88SRRh+m0jddOeZ2jGgiSo/YAXyA2O3mD8ScK6KFjFBlsiv/V84F/FQIifoE60clt0jm0C@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu/90x+/Ji0YFTgMWfeJOnBFCdTQEgkM8haTxnCD44xPBhlRn1
	Rj/L8iqor5SkFBjQLyjbneh/53edF37frMTb4m8q9+aBTwRzxktg/Xpr
X-Gm-Gg: Acq92OGihORDyhjvX2ssWoDhOW7UqFAvDXgI5EpYpt0UKWy1rAasyO+612aU3VpBf7g
	t+zg+DErPRhekjzFGBk7P3I9nB+rjJ8LvK+3PwrHtuBnJTVUq59GPjmrWUH8ffj2NQjEgz0Cb8R
	BWpOgmGmji5KTNv1CfEP2t95QcW/y0rpX0WZtvRJWhdkk8OMYIaWYyCx5Z52b9Hc6qqH00fKAAP
	TYT6hR+tgYRYDaAhvbl8cIlcnGyC70C2qogrRwpsbmPfO859zYQ/qIV2YZNuCVaWE8SXABmAcE6
	wPgsGnwLfOu63dvC32DQYK0frxtCIjTNj/Ou/VtrZ2eY0Qs8sSKN16wbkaDLvLo6yZ3mraDsoie
	wHjwOcnkeURy/t3+p97udDlfXjJHYVRC8s39KKzPI6kfQUeDqMzgvaRvhvV94t+sVlMh/ufZ4Mz
	cxlH4FexbdWsnSGsvsDaO4T2WJoqG/OYe7RqQmCtrTUq6Z1VClQjozmdw/5SaruwV7sCiu7pCWH
	M7+mG8YG0LqLxDhV+UNS1nF90ntFJiucbIQwxCr/xNslQ==
X-Received: by 2002:a17:90b:5905:b0:36d:649b:ea46 with SMTP id 98e67ed59e1d1-3779beb2b77mr1242498a91.2.1781149996617;
        Wed, 10 Jun 2026 20:53:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:16 -0700 (PDT)
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
Subject: [PATCHv4 09/15] dmaengine: fsldma: use devm_kzalloc() to simplify code
Date: Wed, 10 Jun 2026 20:52:39 -0700
Message-ID: <20260611035245.13439-10-rosenp@gmail.com>
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

Convert fdev allocation from kzalloc_obj() to devm_kzalloc() to simplify
the probe error and remove paths by dropping the explicit kfree.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index eba194d64105..c3d2b24f8f07 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1222,29 +1222,25 @@ static void fsldma_device_release(struct dma_device *dma_dev);
 
 static int fsldma_of_probe(struct platform_device *op)
 {
+	struct device *dev = &op->dev;
 	struct fsldma_device *fdev;
 	struct device_node *child;
 	unsigned int i;
 	int err;
 
-	fdev = kzalloc_obj(*fdev);
-	if (!fdev) {
-		err = -ENOMEM;
-		goto out_return;
-	}
+	fdev = devm_kzalloc(dev, sizeof(*fdev), GFP_KERNEL);
+	if (!fdev)
+		return -ENOMEM;
 
-	fdev->dev = &op->dev;
+	fdev->dev = dev;
 	INIT_LIST_HEAD(&fdev->common.channels);
 	/* The DMA address bits supported for this device. */
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
 	fdev->regs = of_iomap(op->dev.of_node, 0);
-	if (!fdev->regs) {
-		dev_err(&op->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free;
-	}
+	if (!fdev->regs)
+		return dev_err_probe(&op->dev, -ENOMEM, "unable to ioremap registers\n");
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
 	fdev->irq = platform_get_irq_optional(op, 0);
@@ -1325,9 +1321,6 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 out_iounmap:
 	iounmap(fdev->regs);
-out_free:
-	kfree(fdev);
-out_return:
 	return err;
 }
 
@@ -1361,7 +1354,6 @@ static void fsldma_of_remove(struct platform_device *op)
 	}
 
 	iounmap(fdev->regs);
-	kfree(fdev);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

