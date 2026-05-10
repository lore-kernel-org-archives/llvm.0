Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228A52D8DB0
	for <llvm@lists.linux.dev>; Sun, 10 May 2026 19:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442666; cv=none; b=TQ1kQ+uIvtlYlL5dGeIpwTejEfTHUN5mACDxRcHvMIVFQUBDJ4JUynsGONlpu86YZJ9e5gIHrsLQduQ5MV/A/TJ1gnN9ARXJSYR+VajPnYD90+MJAt943BfdS3rc9MJ8qTVs3idGLOHrxYNADdkUKBCzuQRjEL1SoGnJ2M16OIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442666; c=relaxed/simple;
	bh=qy67ampRMVZqwRmzsjjdQbT6QLi6VuaEBZYT1/MTvEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCoGi30wdH3nDkbb0pIX6ABtGmRXcXmtg3fbeRt70KGoYTzb59ZIM/U+fh3bZsfD6rWfH5Nl6WFNUc1iXaVIG77fgu403rFy0NcaOQa1Dhtk00xz6TszyzMxJJNLEKhHULbPG5WwDmWZPIFdu+UWmWMv/gkkZfNzifuMsB+b9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcIh3eyg; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcIh3eyg"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c80203b9d7bso1359875a12.0
        for <llvm@lists.linux.dev>; Sun, 10 May 2026 12:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442664; x=1779047464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iI1RsUJy3jPss5H1NJck2z9ijXsiYtxqAXvRNgtOYk=;
        b=CcIh3eygyF0cqaMeFcpRCerVQJVDRNT9Wq52mrH0+indCdD5BHRz5Li94UMmaQ/ven
         IwY2smkNFbvcIy20d4llbMjlyGyONJBS6V4B9aO0zJ39nb2vANJ2cHOsGTaPHAI4EvG7
         fp8GIQ5F5Fms3+5KJyxqshmgS6EvMEHFYpzLAV8+XgvubhcWJlAbsWiJT8MQz7Ct84N/
         j+8YVc41rx3tDaOQA7BwGGouZX7n8MlcrSkRFj6XRdgVmiGv+7qxEqdHsdYMPykSaLPd
         cqSoD8FwyBy8eEBDsmXDv2dIYraQ/e/2Aj5hp4QX60meUnLOqdLTE+qGsqxiIErGHD5L
         j/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442664; x=1779047464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iI1RsUJy3jPss5H1NJck2z9ijXsiYtxqAXvRNgtOYk=;
        b=Aaj19gQ6JFqjkOnMs3KoKw2ysCyTcgeoAJMtdsorM6BTfZp01uLQZ9fqQxZrNZXxuV
         dxedNx4G/ZnHUVilb5PUhnfE3xc1VW5Byp6m+7E4n1wE9k3pEHVPOe64kNqztvJTFm/M
         7K8yTpfrhgqPftufXIsn8kCi06s6n5gTIufuJgYIh05DOCIz5DAhC0yygH1m9/qfkwEC
         tP21GRblVsWBtFQzQYy/fo2zHi5v9UMV3F+JN2fuUV2Bpb3sYchzoB8Gw6qAGp1VKK4E
         NUJOAB8m/Fu6EMyOxkISXu5B9SE6oMpVaP6OVB0Rfj94MMVj55rcVtxywq6WzLhcPiVT
         8fpA==
X-Forwarded-Encrypted: i=1; AFNElJ9l6r72qaao0I/WDanzOozLhyi0xUfKA8ubBSXF/4FUNRF/WpsWPXe11Z8mCcU4dxODmdz+@lists.linux.dev
X-Gm-Message-State: AOJu0YzO51cf8PAMnSceJSBk1u+FYfKWNwBF0Y93cW0gSu+TaHCf+h/1
	D90tTmVhiyOdRnb0UxkYI+PBmzjbHH89rlgX3q8sneSTRAP2nh7VYlqk
X-Gm-Gg: Acq92OEzvMq2lYNDUayCMVmKpahuBnm6/kqGdevcFjmLOuyukU1syy38OyGs9quYZpM
	xaUaqU/WXIeGzsyTeSb2eJ6hg8/C0lqK27g7IANs/JFj61SIj/gBWOu7qXdMbKX7KgAIiGKBIF8
	vanQD6Vw+SjdDneyDEg2JGNx8HA+8hNMtQwfH7UZFkA3Pza1+RqeZdamn4+mKiUctkIATosX6lM
	cLlhYG7WgcFRmmUCwK2SuFZg616adgFK58cFKRUt/9myu25ueeeSXy8LBsQgRAOAYOm+LIr3jFa
	j1ZpJWam2i7bHMWGRpCTSgrQSa6iGdXkuV1xw1G6AasAmRDPD2IvFMZ7VMsfmROnNYguHHdr/UJ
	Kr4n8mOiJPobWJ2JopnkaHDZyHM53ZabmEBd0tHh4dYq6PiIMOWNLKBSoy5fuVhcM7rn65ueHRv
	uqnPsTx8LOAkH5Ui9UQeWBEnkacNGaAulSFnjV9Tkr+TkkvvOus8GmUZb4DDbkv3QiF5LA1E4IG
	1FilmLvUJxmr8FAOelYsvdbGq7IQESWoxc=
X-Received: by 2002:a17:903:1a68:b0:2bc:7486:21cf with SMTP id d9443c01a7336-2bc748623e7mr86956865ad.36.1778442664283;
        Sun, 10 May 2026 12:51:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm84439455ad.74.2026.05.10.12.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] irqchip/mvebu: Allow EBU irqchips to be compile-tested
Date: Sun, 10 May 2026 12:50:47 -0700
Message-ID: <20260510195047.10143-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Marvell EBU interrupt controller Kconfig symbols are hidden and
selected only by platform code. This prevents build coverage for the
drivers on other architectures even though the code only needs OF and
MMIO support.

Add COMPILE_TEST prompts and the required dependencies for the GICP,
ICU, ODMI, PIC and SEI irqchips. While touching PIC for this coverage,
use GENMASK() and BIT() for its masks so that 32-bit platforms can
compile this safely without running into issues.

Tested: make LLVM=1 ARCH=s390 drivers/irqchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/irqchip/Kconfig         | 31 ++++++++++++++++++++++++++-----
 drivers/irqchip/irq-mvebu-pic.c |  8 ++++----
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index e7d559472790..cf3aea96866b 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -451,22 +451,43 @@ config MSCC_OCELOT_IRQ
 	select GENERIC_IRQ_CHIP
 
 config MVEBU_GICP
+	bool "Marvell EBU GICP interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
 	select IRQ_MSI_LIB
-	bool
+	help
+	  Support the Marvell EBU GICP interrupt controller.
 
 config MVEBU_ICU
-	bool
+	bool "Marvell EBU ICU interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	select GENERIC_MSI_IRQ
+	help
+	  Support the Marvell EBU ICU interrupt controller.
 
 config MVEBU_ODMI
-	bool
+	bool "Marvell EBU ODMI interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
 	select IRQ_MSI_LIB
 	select GENERIC_MSI_IRQ
+	help
+	  Support the Marvell EBU ODMI interrupt controller.
 
 config MVEBU_PIC
-	bool
+	bool "Marvell EBU PIC interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	help
+	  Support the Marvell EBU PIC interrupt controller.
 
 config MVEBU_SEI
-        bool
+	bool "Marvell EBU SEI interrupt controller" if COMPILE_TEST
+	depends on OF
+	depends on HAS_IOMEM
+	help
+	  Support the Marvell EBU SEI interrupt controller.
 
 config LS_EXTIRQ
 	bool "Freescale Layerscape external IRQ support" if COMPILE_TEST
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 10b85128183a..95090d8efc06 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -24,7 +24,7 @@
 #define PIC_MASK	       0x4
 
 #define PIC_MAX_IRQS		32
-#define PIC_MAX_IRQ_MASK	((1UL << PIC_MAX_IRQS) - 1)
+#define PIC_MAX_IRQ_MASK	GENMASK(PIC_MAX_IRQS - 1, 0)
 
 struct mvebu_pic {
 	void __iomem *base;
@@ -44,7 +44,7 @@ static void mvebu_pic_eoi_irq(struct irq_data *d)
 {
 	struct mvebu_pic *pic = irq_data_get_irq_chip_data(d);
 
-	writel(1 << d->hwirq, pic->base + PIC_CAUSE);
+	writel(BIT(d->hwirq), pic->base + PIC_CAUSE);
 }
 
 static void mvebu_pic_mask_irq(struct irq_data *d)
@@ -53,7 +53,7 @@ static void mvebu_pic_mask_irq(struct irq_data *d)
 	u32 reg;
 
 	reg =  readl(pic->base + PIC_MASK);
-	reg |= (1 << d->hwirq);
+	reg |= BIT(d->hwirq);
 	writel(reg, pic->base + PIC_MASK);
 }
 
@@ -63,7 +63,7 @@ static void mvebu_pic_unmask_irq(struct irq_data *d)
 	u32 reg;
 
 	reg = readl(pic->base + PIC_MASK);
-	reg &= ~(1 << d->hwirq);
+	reg &= ~BIT(d->hwirq);
 	writel(reg, pic->base + PIC_MASK);
 }
 
-- 
2.54.0

