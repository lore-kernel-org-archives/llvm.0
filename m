Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6381DB13A
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 05:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778303490; cv=none; b=Yn43mwdFhy4XcwPu0Wu5d6fReoyp2pM/tJkPyyDbt4YUeYTV9sp6QJqsxMXC6oOY/C2U6tcadjOiV7MAoFeShWCvoYw9J5XOz8IlEkx4PNeahwg3rKVurfWgsso21daIQP6FCeGJ0s/7gJK76mAAJenmetoM1ffW40okwytgmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778303490; c=relaxed/simple;
	bh=vqf9cXRfFn9C97UZ7Rrp6ta1EJUwME/SlnC8suh7SYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PR6BpXNCu/UMJKCvt1UEspjxEj9hpxtNOpzemg7LjCbOQgOt+KI48w5EvanqyozR8yjReqGFwTd21eIropsa/TfG/2Nfk/d7zL7fOyg4fTllOp7IpVeR0q3kLLEW9Bx1lZqheOHeDglrZUKyRS/+uWEwW8SA/UkT5LYZDXFXkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJz5tntf; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJz5tntf"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so24349295ad.3
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 22:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303488; x=1778908288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zmbb0GtvOQ3Ohjh7GZ3z5cRx9zjtJUSAuN49gAkn1Qo=;
        b=GJz5tntfvE0HxqFlw4JR2JzNMChQtmeT3wVilCunXHoQ2ZYPfwHJijbeeB/s02AbZs
         Uii0z+jgKPJaR64ndXnGcHUcR8lHsIHJkFUqZkHugL8GSLrhGHHPXoeYNRfgVGunH/62
         DPUy3PC1a8HWNNHaNnV/e67r02Kz0ExQ6CJ/bY3SSz1bzVd306QK9A5pGntm60fudt2o
         N6nnKleHl6rmPfsrB//UODkxEH8+OrnWvahnwwUOdEfnnkvrFjTB/aoVXnZ3NWmsKqM9
         bz7u3LlrCJD+p7naK/xzNOZj99bYqOCAEibJ/O9HlMNXTSqrTsFSfRD70fmlZIJCdPiV
         nIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303488; x=1778908288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zmbb0GtvOQ3Ohjh7GZ3z5cRx9zjtJUSAuN49gAkn1Qo=;
        b=BRosWZjee6WqM3EQpYjDbK+o1tiqqtHE4yoSDivoAoh3L2I5Kp0VDWzlPMD3xnux1P
         yM4WjhvAOVcLEJ51UIDCo779vN/ZO5422Utsh41VNnsKg4QURZl1uqnQaLdBoxnRBrJP
         Bd2V/5Cxk7JSRRfBzL+K+f8kgUvODx38qFisVIs/83cbaUuKFNe3THGYLr7vICo1DzM1
         Km5vl06hOJbLSD3xvbC73kAflD8Kx0kE/FNiA3bepaymvqsQ/AvZbmzqP5PmHCx1oVMM
         ZB0+MkN6tDy42s0RRIiTCB5Qm65IHEArZFjqjTNAWg1OKnZiFc0glcCZk5MVm9VUG/WE
         BDzw==
X-Forwarded-Encrypted: i=1; AFNElJ+rMwNarU0YqhxOV3KOCUx5Sq4QxSKtLGTXGCI5Yc3pO+TPpcMj/pgcbDQaGXFN24h46oaO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1D+ugW9Nac9Cg0s/uC9MRHMVYv4wqsrH63ThmA5q6Nuyjl/rg
	6MTmBfT0FnZjUD0qshJqZk16xcoCK0qMr65tLGRpV/AwOlUiG88oZ8hA
X-Gm-Gg: Acq92OHo/QSHudqXqfoT907/OEASxBSVUng7uqHKb5ivSBU/3laY2q7JhSTe5nnCOLQ
	a5Ox1rYeiS8gWMfKFSKcndU2qmfmtyYloehQZDAQ7kcZC/XUO4qQ5XjItgkLUQd6qUW5m9mWEtr
	Rnf86AslRsF2pQhQT4aJPuZbJf77IQ5uA94xWQysvcK5MYFcloHIC4Ennztnz/aHhuiajtloxk4
	mKdBYlQqSxq1VkO9RC9amkmYd/WL53Drqta+mqZbGE9umbLQQSTftarS8gj/62nWurhGzXSPOXg
	tyzkglGDYeu0bhoiwPhzZNKvq8fIRiQn76/UjqJ4KEEpW7ZO8j/S79yZ/LegwgKjxuC3gMMPbwH
	ad3au2DUSFKvKe4FNtnCRc1Ohpa27n2/9yBWo7OaqoqAA0qWB0xKPrPUvmP4A1o1Rx1fWCJgxVn
	Mq1epZ8NLFcxwj99/wScBNbUxa9PRbGZX4h9Dx1dcK8znlrH0693G+0FGJA3bpML7OKkTaU5112
	crOGqvLspPbqoLubsyo+ZBZ+tvPUrZNWhU=
X-Received: by 2002:a17:903:1cd:b0:2ba:36f4:5844 with SMTP id d9443c01a7336-2ba78f63de4mr161628525ad.7.1778303487952;
        Fri, 08 May 2026 22:11:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2709bsm41892915ad.5.2026.05.08.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:11:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: hisilicon: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 22:11:10 -0700
Message-ID: <20260509051110.1061393-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HiSilicon clock symbols already depend on ARCH_HISI or COMPILE_TEST,
but the parent clock Makefile only descends into the hisilicon directory
when ARCH_HISI is enabled.

Add a hidden family gate selected by the HiSilicon clock and reset symbols,
default it for ARCH_HISI, and use it for the parent Makefile descent.  This
keeps existing platform builds unchanged while allowing compile-test
coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/hisilicon/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile          |  2 +-
 drivers/clk/hisilicon/Kconfig | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 4b81757f9090..b20a0445828b 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -120,7 +120,7 @@ obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_COMMON_CLK_DAVINCI)	+= davinci/
 obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
-obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
+obj-$(CONFIG_COMMON_CLK_HISI)		+= hisilicon/
 obj-y					+= imgtec/
 obj-y					+= imx/
 obj-y					+= ingenic/
diff --git a/drivers/clk/hisilicon/Kconfig b/drivers/clk/hisilicon/Kconfig
index c1ec75aa4ccd..e70bcfa9105b 100644
--- a/drivers/clk/hisilicon/Kconfig
+++ b/drivers/clk/hisilicon/Kconfig
@@ -1,8 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config COMMON_CLK_HISI
+	bool
+	default ARCH_HISI
+
 config COMMON_CLK_HI3516CV300
 	tristate "HI3516CV300 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3516cv300.
@@ -11,6 +16,7 @@ config COMMON_CLK_HI3519
 	tristate "Hi3519 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3519.
@@ -19,6 +25,7 @@ config COMMON_CLK_HI3559A
 	bool "Hi3559A Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3559a.
@@ -26,6 +33,7 @@ config COMMON_CLK_HI3559A
 config COMMON_CLK_HI3660
 	bool "Hi3660 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3660.
@@ -33,6 +41,7 @@ config COMMON_CLK_HI3660
 config COMMON_CLK_HI3670
 	bool "Hi3670 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3670.
@@ -41,6 +50,7 @@ config COMMON_CLK_HI3798CV200
 	tristate "Hi3798CV200 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
 	select RESET_HISI
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the clock driver for hi3798cv200.
@@ -48,6 +58,7 @@ config COMMON_CLK_HI3798CV200
 config COMMON_CLK_HI6220
 	bool "Hi6220 Clock Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	default ARCH_HISI
 	help
 	  Build the Hisilicon Hi6220 clock driver based on the common clock framework.
@@ -55,6 +66,7 @@ config COMMON_CLK_HI6220
 config RESET_HISI
 	bool "HiSilicon Reset Controller Driver"
 	depends on ARCH_HISI || COMPILE_TEST
+	select COMMON_CLK_HISI
 	select RESET_CONTROLLER
 	help
 	  Build reset controller driver for HiSilicon device chipsets.
@@ -63,6 +75,7 @@ config STUB_CLK_HI6220
 	bool "Hi6220 Stub Clock Driver" if EXPERT
 	depends on (COMMON_CLK_HI6220 || COMPILE_TEST)
 	depends on MAILBOX
+	select COMMON_CLK_HISI
 	default COMMON_CLK_HI6220
 	help
 	  Build the Hisilicon Hi6220 stub clock driver.
@@ -71,6 +84,7 @@ config STUB_CLK_HI3660
 	bool "Hi3660 Stub Clock Driver" if EXPERT
 	depends on (COMMON_CLK_HI3660 || COMPILE_TEST)
 	depends on MAILBOX
+	select COMMON_CLK_HISI
 	default COMMON_CLK_HI3660
 	help
 	  Build the Hisilicon Hi3660 stub clock driver.
-- 
2.54.0

