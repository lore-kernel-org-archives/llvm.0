Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98DC4D2EFE
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043615; cv=none; b=fmU57viyaG3diFiveeQs/s8tt5FS+9KmdRSVUSBSgdf/9aD5QUUWuri0Nhc3F2CcQf3ebeoU6rDOoBBdKJ8WnXm5NY/QiCwclJEP/C8npRx20N8AvS5An1kamWKWM0sDmYCjxv/8xuFJwvgYa4IbTNK6qyF8ohQpFPXwPVQpiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043615; c=relaxed/simple;
	bh=qh8I3vnOxyJVMrriCmgL8Ppb0gIh5xcK0e99IyDGG7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtSqt4oVctFJNytKOg1MDIdDA1hIm3eP2eDqlbUFnnFPWvNYcw5K3DEShQL+/tcbcpEWRDf2sNv6yCPS9XtZc4Gh6XA7X3urPhQrY37q9znpp4xeqkBuKiHrXQycgu5i0foWrgOfNnXTSphl1P7EBdjzO2XkMx+TI60oseGB4ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGD6duok; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGD6duok"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85825bbc4fso3666233a12.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043613; x=1781648413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UhO55Yo3qdvFwINhOeOCySQ32WXkyaaxtV0xfPLwL8=;
        b=QGD6duokTSJ6TtVob9ZonYBFXYOeIop4xC9ffip74hAJADmfPlirLZc0mDEBqGkeMl
         4m5RLLtOdrQBwGGPv4epitpy+fAiaLku+ygnzsZh9YwAIPbI3kyjIpAK+arWJKj4Gr43
         bA5LOWuwYnqWQ5gBqkkS1kB+e64NpMLfgRpcZKZpsvL9NSKPea66cNA9f9P81UZ9HTD2
         FlCT6xgx/n/DXkciSeUPKc9Mnk9C6VtAiZB1l9Wq9M02DtVkteCGdWDFcGwCVgBSZhXr
         nGNBM+dEPH+hs/4DHhfPoRoiuFYxMTeUHYeDExTMAn4BdSZwr5SHquvMVQopbKx8XiHt
         582g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043613; x=1781648413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UhO55Yo3qdvFwINhOeOCySQ32WXkyaaxtV0xfPLwL8=;
        b=Qlw6/oLg3smwPW5q7bm9bSK+qfXo9mG3vFBCZfCSx7YJOMQEKny3AMNKyf4p4usS0C
         hPYGqW3nZci3XlTFjGsFfWhPwFiAw8rXyypf5pyzK2OUjlwOeTxMHmwUqQ2tT3zd2QdO
         R6pUgWWm17ee02X2corgapqI++zyzYrjlyU9FPXUcuwd1GM7iLSMEQjH9lkt0c/bULFA
         /1c7LwTrJ4M/oCjfX/65ej571LzxzHyZzej3sKhfXqtehCsxGYdGvZWW5sntQ3VMXik+
         gc1xgOJTSAr872lb5i6AOXAn1yn6QOQX0P9jKSR808cM/kidA24BSJpj913yYTSqMnQu
         cPnw==
X-Forwarded-Encrypted: i=1; AFNElJ/3PibmJr/qTX9xX8XJhKf7pSVi5+1LQ9rLRkDLxllwl/IoNN6Cr3dWNP0dA8c8/XxbTUrP@lists.linux.dev
X-Gm-Message-State: AOJu0YxkhshwgtvE8QOAAGrDDxaWxf7p47Q5fis43WiiHRQ2mq//Sw3B
	A2SsX77lQb9r7/s6/VKpbowTvpR4f8cx/YcwbiciZj2bh3R4XnrjoEzA
X-Gm-Gg: Acq92OH4U5m+dtA2o8KQwBK2mnhgyI90mDOd4o41zjieAzZyyQUzJ3oAHsHivMwwJaR
	J9PxQgYzWMDxM6w/fIXWhFAQXU2Vu/KYCXgXyjQdPOds8H5WrbpApIrcr17iLpwAPAYX11/mrTl
	DbO/l/G+S7fswMI3QWBPWKR0Rgp/HoPo15MSO1w94iQa2jJKIkVGaWsA9RIlNMMspqvf71huORf
	QGOkgn9Lz44+Do030t75bctext4Cva0NtcWJtMW69lQtp56VpXEh72Dk71l/cKtPyLw4KZzBI6p
	ttC7x5S74FykK4Odsmr1gXOsSzt7fh2KxPFjjaJiK9Y8oA/h/pZA4SujzQyJ0jCohR6w9T4XdVN
	M2fQmaRYznXzTZLknwVUkU0FXM7bx5zynmZT2eT0aagu51sZOXHw4tTHAqtkaA38sATZZQ3CAZR
	XHtWGnN/1vhWSdsIz40sZu8rDbFEETRHuZtSSqmMaIkuzrzXjDKzFMbOQ5nzdDzLHx/PcbIx/KE
	bAbbYwSapsIPBXRB9PxYGHVd1POH+KIoZ5r07Qo5cm/Qg==
X-Received: by 2002:a05:6a20:918b:b0:3b4:79fd:cba4 with SMTP id adf61e73a8af0-3b4ccdedeb9mr26932559637.12.1781043613288;
        Tue, 09 Jun 2026 15:20:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:12 -0700 (PDT)
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
Subject: [PATCHv3 14/15] dmaengine: fsldma: replace ppc-specific accessors with portable generic ones
Date: Tue,  9 Jun 2026 15:19:25 -0700
Message-ID: <20260609221926.35538-15-rosenp@gmail.com>
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
index 7d0c80121aa4..d4c9b81ade0d 100644
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

