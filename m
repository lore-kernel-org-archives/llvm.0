Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBD037D13A
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 03:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782703698; cv=none; b=V4dQB4Qc1+f5vaWWjwnJBwVQYaHr10OGreCcruVJopiwc1LjgV5EOBCH8xgZNo9sNR20pGK5ACm/DCXsU8qvwT9uzjCbyZ7HAfeZxoYrMujHezh8K4ZvVp8oh/NojN/JhM8O9v1G+I+7Qdi2NxwzSQ5ITbgRGSsQa5S3R4f4qw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782703698; c=relaxed/simple;
	bh=yGoH8IaOmzsv5qmZmnXquKbu3+/JzCiDe89ZF27Npgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Om8vi8IrnFHy5yjOOn+4S0AUR4hkrWkCcraQgaMfc9teMvnuAap67XHnfTT1BE+pIZqFamiXwvlhI59dNdDB6kQl2y7hSsf1jt6qbL7iSOPkN9XXeBQhgbx4pzjz38XO/d/MYvfuNiGW4jZiNlmheYMhJJSMMEEz+N4wT5ea7uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnB9bgbR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnB9bgbR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84783bce476so450964b3a.0
        for <llvm@lists.linux.dev>; Sun, 28 Jun 2026 20:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782703697; x=1783308497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uoog9qhwEH/PM5VZgEmA1A5PD5C88Zoi6u7AyRNBDsE=;
        b=GnB9bgbRR2EOEeqb0WLmtTbXiISSU7gqqU3pH11B33asrQQ3sOtTU7Z01XNxdQOgwn
         c/ISNcBLSleCPxUYCQzb48XlOE2km5G90LTMptqVhz2yC4cmeOY5eLqp1Iz3asvD4Uav
         071htUPYNHvvFAKC1jgcuwuHjXZ2tLBiTezSb96BeKbsSij7/0cAcbaFDlDz8NH1Yupk
         Z86pXfGzJS5pE8gdmamK1IC9hc83LvtrsJ4Mf2wJBa/KI2afiCTB+29CIG66FMAQyODp
         Fy69Mrbam1V21LXMPNXWCP1o8gpKE8sxtysY7cxbi5rnleLfmSjijXgnNWKYOhPdJcn1
         leIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782703697; x=1783308497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uoog9qhwEH/PM5VZgEmA1A5PD5C88Zoi6u7AyRNBDsE=;
        b=lot2mfQijRH73lCTLnOCgtSk3JaXR/YQmBwIn+/pnbp9XcO0MdXIaaLialN+eR5hji
         8wul9D82f53nfQc5uT0UcVXOOPIxIpjzMuNB/Fvik4RATwknmfYnh2Kh373cK7RMgjch
         9QDX1UrFTv8HVmyEXaAO/o6jiW8LLIfkcbewK8x5UkRIU6SFI5aN5Z/JsBFdyX7P0LAK
         w3yMwsMcVenOh67SrICGFk2Zk1bwygrxJDk5K+70tLvKCkGfOjaZ6we26+ixL+WbEKDM
         apbCDHOpQKnRrOyutNb7AQMjkX62tOHILhvMzJJRA8cqKSqa8gpFf/3Vt1lo9J50nitI
         ZjSQ==
X-Forwarded-Encrypted: i=1; AHgh+RquW474+KiGa54k1KjzyOR7uVBAftsRq5iVWoOlODsM6Cy36GaoBZ9Qgn/YVP1cS5NWBxJ7@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5redO08TQ7CNRZDpD98bvxm6XruRzdbn73EAiKOCB/YdmLjRd
	1dNDpgSdihAboSbC/Bnwk0Op38trtf3fSYV8cno2cVlyPBb3EWCpqpCI
X-Gm-Gg: AfdE7cmuXky3/DZKaO52HRYR4mYoFk6ldCCQQ80m1sz+qjyXI5CcbNK57GNwCOnIPNi
	nsEs0wvAEyn16JWdDUs/18nEBYgNxtgnjnjnFRj+WXnqOQX74Cs+JQIFgdyRu8LIaI+5TKWh3IR
	g0Iv9G6Bz4cWnQ5jlzDkro+j05d2BPUD7huMY4LoR4oVEBcQoYmpg5GBvx+zp07HqBwREOoqYIk
	+Tg30lVK7JLaD7e+4LEsTmrU2no3ZOvEBXMzzdIRRUANV2hSEhhH03h3IFL/P0rMbuCxbWgA8xq
	6rHsDEBYCmbteC5Nkd8cN0S4UJEeVo8kFjtcFvMDo7AYgP4Npo8r2FAyLyHpqTeodqme4Ftgvvi
	YGYlPkaNFAUmT7jmD6mMAdcxzpkHYfVI/QPg1u7Ftti1dCcCQG3JH8rLgeZQxd/7EPNxKJOE99c
	65Ly427V3mX5qRRa70KFAYt3a8E9CUDPf+5UQ7TdTkjkOfGWY5p34zmU+wMaodMURtWaSrpaS8K
	mmmPpgZGw==
X-Received: by 2002:a05:6a00:9452:b0:847:82dc:450e with SMTP id d2e1a72fcca58-84782dc4955mr1525887b3a.8.1782703696785;
        Sun, 28 Jun 2026 20:28:16 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845d8560fbasm3624666b3a.15.2026.06.28.20.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 20:28:15 -0700 (PDT)
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
Subject: [PATCH] clk: thead: allow COMPILE_TEST builds
Date: Sun, 28 Jun 2026 20:28:14 -0700
Message-ID: <20260629032814.2344879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_THEAD_TH1520_AP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/thead for ARCH_THEAD.  Use the
TH1520 AP clock symbol for the directory gate instead.

This lets the driver build on other 64-bit architectures selected for
compile testing without selecting the T-HEAD platform.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/thead/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 68145ad91035..d651e4ed3462 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -157,7 +157,7 @@ obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
 obj-$(CONFIG_CLK_TEGRA)			+= tegra/
 obj-y					+= tenstorrent/
-obj-$(CONFIG_ARCH_THEAD)		+= thead/
+obj-$(CONFIG_CLK_THEAD_TH1520_AP)	+= thead/
 obj-y					+= ti/
 obj-$(CONFIG_CLK_UNIPHIER)		+= uniphier/
 obj-$(CONFIG_ARCH_U8500)		+= ux500/
-- 
2.54.0

