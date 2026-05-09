Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BE61DB356
	for <llvm@lists.linux.dev>; Sat,  9 May 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778286982; cv=none; b=b3Y4yNkFAhCUwgDtX6DZ2X8V6S/BJZyTWD+HXOrmEnrj5XqJId2l5nN7DU7AlMs1kLjJtZZzEt4bejrFQD7Ea+WrpCeEeLZM5GQlewD0PSokaFwVlYXT/dx7GJKbLNHdiOahp9cl8N8lxeFi2JBSpX5rc1Ax+8UcWvjBbFp4Ih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778286982; c=relaxed/simple;
	bh=SoX9G1f2128v047CqPSyVLgjJ8UzLro5Z+kOziH0xUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tNcYScTw/cV+yxtHFyxuJ1GjCrhRM2czok13lJBD0Q2lQ4epYwxT14dIoDZ6tmgDAZC/PqYGNHqNvb1yrrhLKr32gVcrfLOVV6fjWhWqmqeaZtP8f7qPOfdX5lML4oY1K2AEUbCIcs5fz768/pqg+gVzVN5Yzopuk8BhMvAnCJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSi0Km4z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSi0Km4z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso1679515a91.2
        for <llvm@lists.linux.dev>; Fri, 08 May 2026 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286981; x=1778891781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=DSi0Km4z74SBp5Z9wHUaSTeAAhtJWOZAZf0dxe5LNCER2gda/WU6aqu/vMFtZi029X
         dVje1iBUUC9o2BBsM3hlCmDLKeh03EsP8fyZaT1UJIgYOtoYpVkbzisUS10eSEom/gpi
         BQsuJVBJDu4Gwe+wuYJ9+HT9NMwYS6ijKtlaflaFvup88Rm8YiXkqkk5ISfrGJVdPN9O
         cWd/On557AKEb7u2wBoTIivVuF1o6otyIAFcf6KwF2yLg+BJuDvSZDK9/eA6U10NCQ+9
         4tlrb+zIkEPw5vfBN55nilPdvDotMR9ac0PsvKEg97Cmt5eI9y4WR56ImgLPeWLk62ex
         mgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286981; x=1778891781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=l0hRC4sIO8EyfGSDmk8QjpdR9u1npsRkIk5MjxwKaqhN0tb64EBKhtlDTtmX/tXDtx
         EJsmJZjF+G+js196VpuWD8o8MtXZfSBz6UHJ6C6WK/P3+HHMokX5vfuBegppGyZkRQ4Y
         FKOPMFnwTOHnrNxsHFPuYkTpgtcscs/tTdhLBJFoly/18GRKJunGWQSpOjpegjXM4yTk
         rQxZXgPYLWn5vXsgM9Kmp2qSt5d+TmWzUaUIJo6LwkwqLOCnDiUKPc2sMkvzU50G6Vq7
         gzBBC5Lrav0cIrIOfLclcp/njqCmkphCrXraoIfF8W6wyTFjG3N4DwjNvGOnffe9sLKM
         GcIg==
X-Forwarded-Encrypted: i=1; AFNElJ85e9xAZRhUF5rMSIpaKyZik8gdFGfj/rlXeMdksrlt4s2ODxD/i3Sw79GIb6EdvE1FV0dS@lists.linux.dev
X-Gm-Message-State: AOJu0YyiqEoAlu44YpMQPBjvX6hhEs7H+tq1uFqLCWqTcyMjQU6b3bWg
	Oe5WO4T5hcOMnB87QgwV+R7e+xAZd3XbyusFS0dA6puUxZw1QWNi/ygV
X-Gm-Gg: Acq92OFg8R2FqMyuF1vJqJ+szcNobKR238CWmA7Vj3gLCVb/XL+FPwXn9ijRzW8dceh
	/5SCWEEFrwddKhH6ZSflgmQzlIwhMI4a7rcM0IAhXewsptOoB+PSvbEelEnZjIbAMsiaz61VeC1
	ZcPIkBB9Etx4IEZ3mzYFlnhUDduUcz8FrlUWV5eOeWIYWu464DXLKfds89eUcrv+8avQ8OvhPce
	w+5YtH79J+Llh/M65/9b+i9Hh89C9GJockWxRaOcGeJfistnAxBBH8K92WD/eqexdTS78+kYwbg
	IUe/WjYbPcAGCAnfixEeTVi+YvRjj54lLL9WuRxaQEuYukTaRPqoiSQNIBZJW63mnLsGDfUXcip
	ulRVKfgETdCoFl3cM2SfDbMM5Y5bPTQKykRM/QFBK2WCWS3xFv1OTHhH5qlS3/j8gaJRTO3L3sQ
	PvnIEAPfv41q5o/GslPpzM62JkxY757Y9UYnBJCXZUwTcy5i2N2TVuu4B0A4YQQRzzdnsDNx5Aw
	C5QNliZrtkmc1Vu2fgbsTle4WTwSKRLokg=
X-Received: by 2002:a17:90b:5343:b0:367:d9cb:fdb3 with SMTP id 98e67ed59e1d1-367d9cc08dbmr72836a91.24.1778286980922;
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d609dd0asm288566a91.0.2026.05.08.17.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:36:02 -0700
Message-ID: <20260509003602.956186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
for the parent Makefile descent instead of ARCH_ROCKCHIP.

The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
so this exposes the existing build coverage to other architectures without
selecting the Rockchip platform.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/rockchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile         | 2 +-
 drivers/clk/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3aa6241fd2ec..4b81757f9090 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -141,7 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
 obj-y					+= renesas/
-obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
+obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-y					+= socfpga/
diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 7e1433502061..85133498f013 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -3,7 +3,7 @@
 
 config COMMON_CLK_ROCKCHIP
 	bool "Rockchip clock controller common support"
-	depends on ARCH_ROCKCHIP
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	default ARCH_ROCKCHIP
 	help
 	  Say y here to enable common clock controller for Rockchip platforms.
-- 
2.54.0

