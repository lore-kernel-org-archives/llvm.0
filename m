Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B098D3E715A
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696932; cv=none; b=UZfvjrcbvPSAb6gYOiLCXV0oEYEDjlt+FsQn20mzO+SfiwjB+DgMzKDeBRyCy/1zo/hWflp3SkduljdgH39CZV5ZLCljfb8lWyO5kKsCpa9zXeHjfMZ+ekPs3WJqznd424IZOXNvkKi7gxYM7pNWe/EwFZyR13vQHYgoDKHJUcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696932; c=relaxed/simple;
	bh=5w6tsBgfpFcK6p2n/K6AqHvbyJ9yiri4PsQmj2ASk4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSLvMrYUBeaYNMh6FlEMDOddT1KZ3NJKnaXlulzghEeq01+5CTBHrhOeDJBSZimA0NzMv0DAEAn8uzHPQRgDPSjLooE8u6Mctq/czXk1KMOkknY+BChS7j/O5JUzZC2z4zj1ehKZhjW2Q6kfZ2WvU7rZxLfu9WXJoAZ+mnMFwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1SsxAD6; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1SsxAD6"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-842288702fbso1049760b3a.1
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696930; x=1781301730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCrOV/66FRzdEdHCWluMsQiKmBFsYBQNgpZa33W4dWo=;
        b=j1SsxAD6ETadbqloSYlPLyUYPJStA944yCl8+wR95M6XkymfUQ3hSQonaYH21T6BRb
         TdIDjHW+Oc5jyX8dEQ6kCq5NrN3F9fAGInorVfNvS9ZX9j9MF2xt9StrF9B55sE+tu1u
         Z1F5/rk81Yve1qWUeAFZfruzxF12pysJwxkiX3Xdl9qMvS5krMj9gjnsmH8bK8vJAWn4
         4Zbfaf+HR71wCrwhF7USuGZYU+g4ZDziCOWx5UbmQpk8iQ8cDwrVncpS/BebKAWEgJFe
         jyNUjrLb6J9tsYn17GHMVz8yv4UXm+Z47B9Ea5dgbkDcktrPurDKcnR9r2aH6Lw9wFR0
         /Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696930; x=1781301730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lCrOV/66FRzdEdHCWluMsQiKmBFsYBQNgpZa33W4dWo=;
        b=OnY8GczOcIFXx0UqepLR0IKCib87nB5jWKZXelNIq72ZpiLTL5XjzyRq3Bbl+DE5S2
         Q1oVmNEd8rsHuSzWiDTi8HjMEo+YLu1zBZBToPWlEcHPWur8cBS3kqAW/kJWsmo5XrMq
         xX3eL/KfpGf/WU3J3N0DAPe/qQEs1PgPh5I11nIFpDMG/noRTcwu8JO7yF/PIcHQ0FvP
         pCB92eTb1A028xHqO5/Nm05Z8ksvls1yX6/UO+ponFoq/3BdjCD/vP+T325AJyemiFIx
         +XY4jCVgi2eLgMflE6/pTdnRK3JumgP+m1NBM3EgGjTypGaGpLJkCUT9j/F7evg1DtoR
         MP7w==
X-Forwarded-Encrypted: i=1; AFNElJ8zClVCsomdSeBaqFHSA+FaGOd82lK5qXnjOuEwhVSzr2223/FfOM4jpg/I2UsUwsKw4mPs@lists.linux.dev
X-Gm-Message-State: AOJu0YwMZ5paYqQLSHVh+Z06tKK+jn8zyUKSzdCBE6uZDSHpaZVltPFy
	tCp2MCRCtmvy+uzbpcOQophMeOAMZOgkQXZy3aiYsHeSvhQfHx5l2QCl
X-Gm-Gg: Acq92OGrf8UX82/aUHM6/j6ayclCZVsBIXnEzlKbOjvrz/4l58qzE6V2fM6YcL18VCY
	0y/EkLqMvttPjaOOIUlxX4pCSmKVZskt3VAfuycXIKw9exyJZIzH0c+A+bZLzl6c3Vl56fPDKSS
	bb8KXY7bPs7A35mSUZ8DSa1iFTlLIKVIanttuEVOHWsUcTebXd28V3PZ2Bc1bHB7B292yNCTL//
	0aHTpgEtHR1Qsr0FMYm3ftK1bY5/AC6MKma13iefWxGMDqcM8lsWaqXkhzRXCkU8GBdmqHNIUlU
	NArV5DLnw1O4UUkQIhLG3HcioP5/SbirMmReGoKPpDo6I8xH8sDQEOTeRjxmPd+/U9Ps/YxiuJc
	ErTTG5zbRMMwAyKm622p36bpADng1NFZ4/ahcP1WP3WjBbbdGSQ5fq/YzHnWSrh4q3oXs7OrCkB
	WYgR3N2qWZnK3/EYi4Z6cvbJCnyCT/iTzDAVr2XYWw+dApaVexH7NlXu54sbisPQwEvTqZHd54U
	/0rCd4x8G4wrs6lhjErVyzlB+zHt7+kdVAgSV6Ot5ZnVw==
X-Received: by 2002:aa7:88c6:0:b0:834:e5a2:d089 with SMTP id d2e1a72fcca58-842b109cf44mr5622300b3a.33.1780696929651;
        Fri, 05 Jun 2026 15:02:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:02:08 -0700 (PDT)
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
Subject: [PATCH 10/10] dmaengine: fsldma: replace ppc-specific accessors with portable generic ones
Date: Fri,  5 Jun 2026 15:01:34 -0700
Message-ID: <20260605220134.43295-11-rosenp@gmail.com>
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

- Convert remaining in_be32/in_le32 calls to FSL_DMA_IN macro
- Replace __ilog2 with generic ilog2 (pull in linux/log2.h)
- Add linux/io.h include
- Expand non-PPC accessor support from ARM-only to all architectures
- Guard 64-bit generic accessors with CONFIG_64BIT; provide
  emulation using 32-bit accessors on 32-bit platforms

Add COMPILE_TEST support as a result for extra compile coverage.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig  |  2 +-
 drivers/dma/fsldma.c | 11 ++++++-----
 drivers/dma/fsldma.h | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 302021540d76..9b13e7aa31c7 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -206,7 +206,7 @@ config EP93XX_DMA
 
 config FSL_DMA
 	tristate "Freescale Elo series DMA support"
-	depends on FSL_SOC
+	depends on FSL_SOC || COMPILE_TEST
 	select DMA_ENGINE
 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	help
diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 01c9cd27e795..a7c1f1b4c9ac 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -32,6 +32,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/log2.h>
 #include <linux/fsldma.h>
 #include "dmaengine.h"
 #include "fsldma.h"
@@ -266,7 +268,7 @@ static void fsl_chan_set_src_loop_size(struct fsldma_chan *chan, int size)
 	case 4:
 	case 8:
 		mode &= ~FSL_DMA_MR_SAHTS_MASK;
-		mode |= FSL_DMA_MR_SAHE | (__ilog2(size) << 14);
+		mode |= FSL_DMA_MR_SAHE | (ilog2(size) << 14);
 		break;
 	}
 
@@ -299,7 +301,7 @@ static void fsl_chan_set_dst_loop_size(struct fsldma_chan *chan, int size)
 	case 4:
 	case 8:
 		mode &= ~FSL_DMA_MR_DAHTS_MASK;
-		mode |= FSL_DMA_MR_DAHE | (__ilog2(size) << 16);
+		mode |= FSL_DMA_MR_DAHE | (ilog2(size) << 16);
 		break;
 	}
 
@@ -326,7 +328,7 @@ static void fsl_chan_set_request_count(struct fsldma_chan *chan, int size)
 
 	mode = get_mr(chan);
 	mode &= ~FSL_DMA_MR_BWC_MASK;
-	mode |= (__ilog2(size) << 24) & FSL_DMA_MR_BWC_MASK;
+	mode |= (ilog2(size) << 24) & FSL_DMA_MR_BWC_MASK;
 
 	set_mr(chan, mode);
 }
@@ -1004,8 +1006,7 @@ static irqreturn_t fsldma_ctrl_irq(int irq, void *data)
 	u32 gsr, mask;
 	int i;
 
-	gsr = (fdev->feature & FSL_DMA_BIG_ENDIAN) ? in_be32(fdev->regs)
-						   : in_le32(fdev->regs);
+	gsr = FSL_DMA_IN(fdev, fdev->regs, 32);
 	mask = 0xff000000;
 	dev_dbg(fdev->dev, "IRQ: gsr 0x%.8x\n", gsr);
 
diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index d7b7a3138b85..01f93123b233 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -232,17 +232,46 @@ static void fsl_iowrite64be(u64 val, u64 __iomem *addr)
 	out_be32((u32 __iomem *)addr + 1, (u32)val);
 }
 #endif
-#endif
-
-#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
+#else
 #define fsl_ioread32(p)		ioread32(p)
 #define fsl_ioread32be(p)	ioread32be(p)
 #define fsl_iowrite32(v, p)	iowrite32(v, p)
 #define fsl_iowrite32be(v, p)	iowrite32be(v, p)
+
+#ifdef CONFIG_64BIT
 #define fsl_ioread64(p)		ioread64(p)
 #define fsl_ioread64be(p)	ioread64be(p)
 #define fsl_iowrite64(v, p)	iowrite64(v, p)
 #define fsl_iowrite64be(v, p)	iowrite64be(v, p)
+#else
+static inline u64 fsl_ioread64(const u64 __iomem *addr)
+{
+	u32 val_lo = ioread32((u32 __iomem *)addr);
+	u32 val_hi = ioread32((u32 __iomem *)addr + 1);
+
+	return ((u64)val_hi << 32) + val_lo;
+}
+
+static inline void fsl_iowrite64(u64 val, u64 __iomem *addr)
+{
+	iowrite32(val >> 32, (u32 __iomem *)addr + 1);
+	iowrite32((u32)val, (u32 __iomem *)addr);
+}
+
+static inline u64 fsl_ioread64be(const u64 __iomem *addr)
+{
+	u32 val_hi = ioread32be((u32 __iomem *)addr);
+	u32 val_lo = ioread32be((u32 __iomem *)addr + 1);
+
+	return ((u64)val_hi << 32) + val_lo;
+}
+
+static inline void fsl_iowrite64be(u64 val, u64 __iomem *addr)
+{
+	iowrite32be(val >> 32, (u32 __iomem *)addr);
+	iowrite32be((u32)val, (u32 __iomem *)addr + 1);
+}
+#endif
 #endif
 
 #define FSL_DMA_IN(fsl_dma, addr, width)			\
-- 
2.54.0

