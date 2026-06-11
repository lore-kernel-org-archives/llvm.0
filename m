Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D61331ECF
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150008; cv=none; b=hvAWgXtJ0/ngV8Ri0Y/8It1/xGfrqcB8aF1Q4g0vHwJjZ2ogd9VDLAfKWhVLx0eavr1SlKgsHAWkHBRBoxCV/+rrJ9z32KjWhmjtrN5eAspQRVG75oKdYnn3cK3Jf9f9nd/rxwU6013oqDRiszJC7gvyhlV9+qavtC4RmiDOrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150008; c=relaxed/simple;
	bh=SOI5HmXjnx5R6WLI2V3ZreO6yRicXxjdlFUUoqrXGOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dV266qfbJlSn40zT/82yA1Jw3Uvkak3S6dm0NoYTqe3lPMeVkd4VQsdoOdiYP7awL/INOucK84/P0rbK/blCK+YVgTocbUutHYtVu8TBy2/VVIgaK3wfVOeezwOXJ2MkkO/5fCYUAqp5qbr0CNJxczl0jB5nTH7WSGZJCI3UKsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2V+ODad; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2V+ODad"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b9033d230so268132a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781150004; x=1781754804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwl7yp6z2DJ8E/UGfDrMntTB6a7fFKpl/92m0Qbl/AQ=;
        b=a2V+ODadg8JoP5fuvvTdWTyalLci392hW+vZr0hwdI+8GP0tN+hf7ubgv0L9GmaGQd
         sREuQl9/ZDsZP0GjR+msUwwSluqpQYhSOpmoPIxFX9KBW8t/WFmOZD063ZUqbdm8VcY9
         F9OWS/mx2VBQFSt5sFRmrtDYfnpfZAwjxe9ctc8JkDiTTT8NheUTEC1wpB2GaGRbCfyd
         Ih+cnuMSGN9JUqbiufIc/m3I6sDfDXT1F77kQPaqsa/ID4gCnMARe5wfERcKjuKtgpAJ
         tFdbBOIeHcBjT75FMZtbtiSkVYtWE+oWtxTc3PKYVNgsB7aaFTlCjGawWZMZ5toKa9DW
         0Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781150004; x=1781754804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwl7yp6z2DJ8E/UGfDrMntTB6a7fFKpl/92m0Qbl/AQ=;
        b=W3CeoCDrmhTQamVKGSVqNRZOj/qmvdwq0UfhArkMfMSlGkV/KyXtT3pMsbpKIU/HFp
         SVWUE6W9Ib0r+bZ405jlIlTAPJG+2UgMfCQU9Wd98XdCrDJp3puJkIH9PJ3/rFkAb81S
         MHnG58ETRI2Z36cOI7Kt2nIlb07LZGzqoyrNTnb3FVowZlXlnIAJ76PLl7DwredyHa1i
         Lu9sqpj8IlEaN+7NDMt6q/z8pYdkMJLnNOSMybYi0yGB0Vtc5jAShZaD8cpoz+hK9xqv
         Nrf7R89che8t0QVr46nF+QI+dZS4djcWwf54DSZXPOm+z4rpjnal1a/EKSrdaI6z+R78
         nAMw==
X-Forwarded-Encrypted: i=1; AFNElJ+2S7sINnmGBipsg7cGps+SEqMmtNhhx2XN/+aIToxFBGgbCrY8q4twCE1GRBZRHbA1Xvyc@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4huiIB/8UK+ksulEcF9Dpt1+y/YWSbC6O+48r89bdwbJvW0MM
	/lEMjT971DlmT1dTZlRPGjHP/kJiB+5GuRsoVcGYiYiRRTIj2BpnayCq
X-Gm-Gg: Acq92OE2rn/lT8APV1+M0L4OEGNy7/RXFw30+z4PRV61Pym4u873pv8UwK9BfX0UYyu
	ypg3tywWliVBJRghUDqOCW3mE1J1hwILZWM63w55fEU021N7qgKMbYLQum7KBESy6QZzoHBzmKN
	52ofuOBMfy0AKmnGpYcCs4enhwfyNhLliPazpaOKeX7NqlBGDM7uVC9Xh0F3QK/8oagA/Mo1GIw
	Myjn5757OsvlwWYCHe3M/4/43+Gr1cv9BlOqZPWuDQeyJVh2bWFHfQ7xtTHviybxQ/3y+Ncpjsg
	2GMl94078OTMj6UKWqum0LBiZzmLGpiN/u6JSrSes08a9nzR4E1A3r03pVrCjWPpjH2AT00QzsU
	x9PV2UL+Oyb+X0ig9tomIoGwIGDOqxfZY+UHQPgtHykkHY/b4D8igwyfxBQ0prspFnVYllCbBoT
	02bV/aAj0gcipg16/vh6GI5HyqdSbpqAxfb5f+sBluKNguH+RrvB/PqxAkXXrxStT7iBwC6exTW
	uLj0X160LI2JwrogBYgCNQaz+PYXXaQhirHW8vnp76c4A==
X-Received: by 2002:a17:90b:580d:b0:36d:630a:c4e4 with SMTP id 98e67ed59e1d1-37800fee6f0mr745354a91.3.1781150004392;
        Wed, 10 Jun 2026 20:53:24 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:23 -0700 (PDT)
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
Subject: [PATCHv4 14/15] dmaengine: fsldma: replace ppc-specific accessors with portable generic ones
Date: Wed, 10 Jun 2026 20:52:44 -0700
Message-ID: <20260611035245.13439-15-rosenp@gmail.com>
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
index 0ee3d719ae95..157db416eaaf 100644
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
@@ -1007,8 +1009,7 @@ static irqreturn_t fsldma_ctrl_irq(int irq, void *data)
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

