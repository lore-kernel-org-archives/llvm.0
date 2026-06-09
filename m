Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A2411663
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043605; cv=none; b=aO8Xrd911HsLZwezHzrwqH7dKb+7kVzk2u9JJdeU947uOi5GNnVFVeTSR7PHgpKckfjSNHRdezC1lc+D+LWNI7Y+YuLSEx23SowmBE9G6Wueoh134YrnG3uIYyQ8lgUxSPKXDnedo82rTHxjaxL2sGXpIqR9hdD+iO52XPZjX5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043605; c=relaxed/simple;
	bh=mMIyKUxGwOQ8VAAYDDOeEGrsfwtY2nZkynSELcs+FUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzW7v+cGWIj19gIPKvKb2l1lcQpNO73w/f4x7xOKJZaOyIFSv6z544FNRA4xjmlJEq3WkWgBqlm1gNm7CzOK80wg9Zbu9RM4ASOtWE2WmZknkMLXQRo2/7mZGgi9N3x3CMYvDHGWso4uyrP6pmI4xqGKScxW8BU9CZ2RkzRt7Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAk6ueua; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAk6ueua"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c86484d35d1so64365a12.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043602; x=1781648402; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQhRsjTa8nt00Vhb5aXmUlX4VLfCEPtM7YH8ZPQELfs=;
        b=nAk6ueuaoDH5PVW9RC+BSvlE+p6y2GGOrl2maohECuBxHI/ZtFufiOx7uNXPaYl1Ro
         nUSO44fV6Hxq+VJ66ZMXLvrLvS0YZbF+/tiBkBQKRIJCkq9XMnLpKAwbzDnODXt78Vpr
         OQbwbq+V2fvqOgscjyx5htqrva/DV00k+gq9OiEx166ayzK0o1puYi1gEeLcjMwKWuRS
         sMKQQ2/6JLJFvuUkWGO8C30Zoyw77catbNPIB058lq9QUZnjMJ9WPWV/puOC7OxlXfl4
         Nw7nxBijNtUUUA7NRaX9zLM/VtwRer9PRz7GhNqEsEmS6XKoVDSTm1+yxplZ/p8/O5rO
         8Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043602; x=1781648402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQhRsjTa8nt00Vhb5aXmUlX4VLfCEPtM7YH8ZPQELfs=;
        b=BPqjybrs1s6NHHIlAx9Bof4iK3hoHodI/Qc55W4qIvkKIzSm03SRfIrcRUGiHi9Yai
         GlNxHTRJjT/lkjZJAlhdzQjomGAyEd/pQoMDSeo/KTsT1De6CHXp/DXyBhTqdqh8MywR
         MOQbPsj9/c92CbwQlw7QRXwwIJdXgxjp7CC6fBfP0BFnZmI+FAVOlo86iRpybqB5UNr1
         fbCq8FRndw8Qp/f5+E6av2RmJz6P7Rsed5F51A2PoNauLeRCA5dTzJ5AGZZLEhgmMv7g
         OcKO/K4TV8UMPh4x0+lX7n3+uLENgZoa71fzFaFs6WpRkAbPluG2M7WQrbCsU8EQWGo9
         n7lg==
X-Forwarded-Encrypted: i=1; AFNElJ9OVHRrguxyumaoWnzirc/3H5Bnc15iYZKQuVpi5QdQf8tbEQmnB6OKnvrNLAWI5404HwV/@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9gatco5ENm4NcK3yL9kh6Udszhoaf5XakFHSNafq970EAUtCj
	+AzE+Y5KWuFdZBFMBhK+AeFP27V+l6PVZa4fhsmN+wCJzUW7ihGuv3p4
X-Gm-Gg: Acq92OGHOYCg0THdPqkeFh6ZNSzMc79QPcezbWIC+0pnJbK9M/5/UrPFieoltloC/SN
	ZGSoJmSoaZhgcUO3he2bOzIVik2rKJbnsLFSPOFvLh4VyPfUs6sn9fh8b4X5Q9YjtG0hI2MI5KV
	G4X1H+dBE6OHz0485wBO1jebQAQV2GQ4ym/9iJr7Qg4vWZF3p+kW4F9jlM9HJoYsuTfUlJMR0fn
	UnWAAmtc/BNkCgfvLt9gN2v9Igusnq5eRgCIKlwKCqQ43ygpvZCpscwu7W83ZGHF13f9HOnzNzU
	3yXDGANpy2198x51ru5dS4fzB+LcZYXhX9Hw2MRCByS6KPROvGfQbkYVmFbbfWfgeXjs/2vW7br
	dQJJ07Kf3QAKSelwIUyTvs7wRXGjmdVx4Gf75N3JMyblqRxdf3PZN2zjhSPcxxADnBp0VBi8jZE
	0zEG1K3U8Y8yOAeWgxWrgQM3bG7HqSuxC4VWT510ZEkNVHznJnfN5kXU2vt8nEpivq6v80p6v53
	9fvvyPwkyw3Hkat5wwzgcCGWcpGU+a/ZWR4S7hlb6Ju4PR02Is43mGo
X-Received: by 2002:a05:6a21:a94:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3b4ccd76836mr27046937637.12.1781043602200;
        Tue, 09 Jun 2026 15:20:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:01 -0700 (PDT)
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
Subject: [PATCHv3 09/15] dmaengine: fsldma: use devm for kzalloc()
Date: Tue,  9 Jun 2026 15:19:20 -0700
Message-ID: <20260609221926.35538-10-rosenp@gmail.com>
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

Convert fdev allocation from kzalloc_obj() to devm_kzalloc() to simplify
the probe error and remove paths by dropping the explicit kfree.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index eba194d64105..dac12de06ef5 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1222,18 +1222,17 @@ static void fsldma_device_release(struct dma_device *dma_dev);
 
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
@@ -1242,8 +1241,7 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->regs = of_iomap(op->dev.of_node, 0);
 	if (!fdev->regs) {
 		dev_err(&op->dev, "unable to ioremap registers\n");
-		err = -ENOMEM;
-		goto out_free;
+		return -ENOMEM;
 	}
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
@@ -1325,9 +1323,6 @@ static int fsldma_of_probe(struct platform_device *op)
 	}
 out_iounmap:
 	iounmap(fdev->regs);
-out_free:
-	kfree(fdev);
-out_return:
 	return err;
 }
 
@@ -1361,7 +1356,6 @@ static void fsldma_of_remove(struct platform_device *op)
 	}
 
 	iounmap(fdev->regs);
-	kfree(fdev);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

