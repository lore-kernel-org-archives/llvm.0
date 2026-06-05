Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B13D88FA
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696924; cv=none; b=Sui/DTymzIiQZpgRR0WJ8znhjx+lAZD1fL94KYYNKSemyorxykfqDY3Q2GNzwoxJ960vDxODxb62vfa9sjZSCszAC1FT6xV+r7vvZnvBT1kpFWt+2Uguzbo9j5bI2vh1Fhx0EDUH+yDKUBzh09E2M7Cg2/gWgrxW3afOUUJhXM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696924; c=relaxed/simple;
	bh=M1tCipKgh6sdfzfNx6Ayc+P63xEC6ccKKNUWUXQ278s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEcPES3QZJGIVCLCxKnPUuVt/VC1w/AFMZ9VigOjaunS8/aWy5UVD+EA7x1DhkZf8J0KpmQHyzHoKl3v9T6MMbIvQIb6t/npbvrd41M9bNBA/R8bJ1JWQADOs0gf6j8VG6/tiNQW8njXRnzK36QcF6OA6gAWJexOoPqPcWPSCK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiIf7nhG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiIf7nhG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8423f52af13so1719462b3a.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696922; x=1781301722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h60AiEE0ezQWif9mmBIRZAGzyRJ5Mypr0bfFicKOUY=;
        b=TiIf7nhGy2Rt69OoxxFh5prJugLRXLO3xQqpJfGVrHpOhd6YCvgqV0IkbKpp4jSi2V
         SFrJaXsrcpX1AMV+BZHfC7n+laFK+Po6GzXrJ0mPa0qhYjJbBP1nXbz+zXxczeAHl705
         RLk+xzToC0x7vzJa58mnQTVd8TCnVqbQg3RdzodJB75VviqiDohmAi5L98ZTy/nWBeQF
         x5UkPVRbB1R0RkTafjxFG/G4ib8WMlbnY+ayVUH1H6vjSvaHUySccjiz6ZFusCOUnuKf
         IA7lALzY+AzOP6hxxfD/0WuCb2oQFuwPH9LrgZlndP0f1KFAcKo75VCBCJC18J/BUtmX
         Hwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696922; x=1781301722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3h60AiEE0ezQWif9mmBIRZAGzyRJ5Mypr0bfFicKOUY=;
        b=PPAcOHWNU0IK/J5rkMxKzz9T9YT2LRiVL2xWH4LY/v5e5hjvhwAPr2bUftfxCvjewk
         6pi7ug9zenTz+68fcoNuY9rBgcL2Jw7wS6fy99RtUJT/hURtoWc6wMUy9/aneMyVhuKZ
         w71FQlSwnOds8SZICnknxwO/YmnbiRdw99p+QqPNXm18SOHadx0hFybaYP5/mAc3uRkQ
         ebftMn3Q9ZcMbSfklgCDmvw7gywLfMjPozZLwFVNikpwlcYBPCzh20qpSvKwNKfc29eo
         PkK/74xTO+r/vQhgAu1ErofU1ttB9FVVhcVzUfgdHbse5uj3heKbP8vpw+Jps4tQ21W+
         wBvw==
X-Forwarded-Encrypted: i=1; AFNElJ8MC7AnM7qwQFjDh0C8s2LwbHYaR5VmdpCjeySUVY7NmqU7HUf/MoYED5B/kVvRG4plStfQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2/8tcSmP2W6yDrX3p4HPBNVgAGvAU6UCn7IzGF1FbjYITYPzu
	n4azLGE8qzBn6cosgytnCi3JkpWUKLf9+Ww0NN0mbvYfuTvJy2OxvTQr
X-Gm-Gg: Acq92OFrTvEWW3pJ2rweUZ49dna424XTNz1Qc1lHqkZX61lylBRlfJ6LJ8eAbaWNFmy
	fg1Y6Ajxrwnz5q/qlClGBIikeFRsDboDvrpGzRP28KZ3d3523vTOp58dzYJGffJ4uxnbawKnquQ
	6NuP0FFlJskgm0HvCHkTd+SGrPpu5DUtRjtv4xO1KQtECv/77doJV/QNjaQGX+oCFsZhtmnisBQ
	R/ojO7kxc05g4EQQlUrqzWN95PK9NK7inTXpXwN89sid8/yKeLyyzu66GD3Hq9DtsVnpAlhT/FT
	S+itsNOv6Ja1LyUbyRFSrDmPLTLUrnnRjslfNxUdsEUg/hpKunwnTMa+XCannTFOMJyM0MG/pSh
	xga0oytGseWpkLVkj62n/N1IIGQHg9BoNdTXZ+mmyMqOGRahFzo9/GXiu9dCs3jnjAZgUx4U7Ox
	9LrweYZBXeVrlrUlpEF6/0DSTlLxGbl8gj97u2s5g0a/c4muiBAW/37+1foSl4Zkov2FlRGWh7h
	OnPmM+GxmePAF3aS6cNx7CP5DxHGHYCoYZjQ53qAYHiZA==
X-Received: by 2002:a05:6a00:13a7:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-842b0f5477emr5790548b3a.24.1780696922232;
        Fri, 05 Jun 2026 15:02:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:01 -0700 (PDT)
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
Subject: [PATCH 06/10] dmaengine: fsldma: convert channel allocation to devm_kzalloc
Date: Fri,  5 Jun 2026 15:01:30 -0700
Message-ID: <20260605220134.43295-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert fsl_dma_chan_probe from kzalloc_obj to devm_kzalloc, tying
the channel lifetime to the parent DMA device. This removes the
need for kfree(chan) in both the probe error path and the remove
function.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 2a6a247761a4..ee6e595c2972 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1111,11 +1111,9 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
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
@@ -1197,9 +1195,6 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 out_iounmap_regs:
 	iounmap(chan->regs);
-out_free_chan:
-	kfree(chan);
-out_return:
 	return err;
 }
 
@@ -1208,7 +1203,6 @@ static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 	tasklet_kill(&chan->tasklet);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-	kfree(chan);
 }
 
 static int fsldma_of_probe(struct platform_device *op)
-- 
2.54.0

