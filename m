Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F611B4F02
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387537; cv=none; b=E/T2Q8MeznvKXaIReTSdTBrOODK6M8fzbbnpTJKAN2SrkStdQQEKQ7YzchX3pjhPAcxfRiygAFogq+zNIdcKezRxo5Nn3NJCLPmnEB8KbxwsnZtyL3JiJcWO4vVRUa2F6QAA3o+QBD1F1v+Rk00+UXsmdvjQnPl1CYsV8IQH4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387537; c=relaxed/simple;
	bh=l+YYGTm2zzIcbCgqHlNlez++LIbLtqhh+Pn409TvJho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHrxCUaxdvz5GkOVWHyGE7H1t3xjpqD5VLIjCRNIps7gGkxveK64M0yoZ0jxc68yyFdU/hcfsuMWZ2psZblT0bYxSRhoejTi3xv0Gi4YrnkW8sDMbbVhq4m7rFOHTwPAtpPstjLt5mIAKDSMNDytvcmDe2T3ORp0Ct0XHKAnWgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aa/B0fCB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aa/B0fCB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd730so33074835e9.2
        for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737387533; x=1737992333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUNH5OV+WC/QzjXwldloXCvwJvNBFYqSY2qbuibPXTY=;
        b=Aa/B0fCB7Een434+WLMBmNkKYVoB2fA3hxfjFbHFFbU8te/B87Har4QFVFGAkpslxx
         MzP/Bm/xQHLdrKcrlnbX6dFZUiHI2r8FhVGZBu68Y9tiT4+bGIUIQa5012OAJiJ1FwHO
         TvkQD2yl6o3Zy8PZC0zxiBysWj+eKxoR0977YqDWH8/QKyJOgrcTLZ9PA0Zr1wDId/S8
         MzyDLBdrTaPYz5BZTiA/CeRQdp27aK3IZ6HuByssthvrpS+p0vAmAJ2DkdsKGFNqdKdL
         Ypjm1aLZ80+Hxj05mcpqyWRpSCReO+sbJhcOsaiUn4zk8HPYRBkD5vu2N2O6SrSgOmqz
         fFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737387533; x=1737992333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUNH5OV+WC/QzjXwldloXCvwJvNBFYqSY2qbuibPXTY=;
        b=pN1VA/PxzKe7Gz9AOdwaA4erSBsa1Zl5S6Se3qR3vb60C1a5bpZ19GpsMVqzwFqv/H
         3WDZemdQ2NtVsBlfaOf7rlWJ9cM+kE54fL4Nqxjdvr35IDX2HsuITyaEYbOeWk27ov2d
         fcoHaIOmYH59w6lluPvAuseUKS9sbQ4EjD7vU7ZxGYOShEpY1fcOzpIjIFpVw4kx20jy
         I/DbPz33ZS2Mtl4S/niTIyz9+V4FNYmpiydUP5Gzrxk/CoiQtwhPyw3bhJaKWUbEMXwl
         Pyn6W381aUeq++R5xrC12UaMxZTSCNfhMnftq9Gm6fBZzhT08DoJQBz9IrjjSpfkpl44
         Kzig==
X-Forwarded-Encrypted: i=1; AJvYcCVU2GRzPcfS7heAIYkEUZJGa+u4liSIkaYVh3ciFPgJrgmkOZ/qquB88rg4LWBwC3iwaDM/@lists.linux.dev
X-Gm-Message-State: AOJu0YwWBDZY4SngXO3PVGyrbSTHVeN3pVa9FVhw1x2DB7eQLd2elqXk
	mCp93JE1YQO9Deea8tvEgl3ciYqQlT1Io/x3wRJE2K9FYU8OiEDc
X-Gm-Gg: ASbGncsD9p6tTwL4+G6BF2cmnvmnoXrCJqtdMXRiLoc9eD228lV0ci0Ph/xbAZFRJ2r
	8DA/OmvQh3gmEXRZ7+iEDG8EM3qC4sxlJcdXlCUm/U0ubo8EjcuOFwJivBO0N4JK+MTfnjQ9yKy
	hFS3pKUq+k4pnu15iPbQuh/yFIoP4Sf5/vWgj6taHOWTKEL2PxwO1nXbrKcWWFSplqsobce9kGz
	fc/NclS/sGiagh63pMD5dfOqn3yfpbZk1VPJob1tzXp5U5hcoUhHblgStzwcCxNTJ6115EBa56X
	2RmVCC9RsT1FdfDq6m6chRrhruAbmuPcj6QFMco=
X-Google-Smtp-Source: AGHT+IFq/N1M/Fzfqtl5Tsax6f2eFNQebWQPzXxA/LFVpMMquGf/Nb5tqY6jgvqwOtRwfXgtC13vBQ==
X-Received: by 2002:a05:600c:4508:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-438913e1c00mr147505135e9.11.1737387532941;
        Mon, 20 Jan 2025 07:38:52 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438904084e7sm144141375e9.6.2025.01.20.07.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:38:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pmdomain: airoha: Fix compilation error with Clang-20 and Thumb2 mode
Date: Mon, 20 Jan 2025 16:38:09 +0100
Message-ID: <20250120153817.11807-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
hooks are inserted via the -pg switch.

This is a known issue and similar driver workaround this with a Makefile
ifdef. Exact workaround are applied in
drivers/firmware/arm_scmi/transports/Makefile and other similar driver.

Suggested-by: Sudeep Holla <sudeep.holla@arm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501201840.XmpHXpQ4-lkp@intel.com/
Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pmdomain/mediatek/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
index 0f6edce9239b..18ba92e3c418 100644
--- a/drivers/pmdomain/mediatek/Makefile
+++ b/drivers/pmdomain/mediatek/Makefile
@@ -2,3 +2,10 @@
 obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
 obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN) 	+= airoha-cpu-pmdomain.o
+
+ifeq ($(CONFIG_THUMB2_KERNEL)$(CONFIG_CC_IS_CLANG),yy)
+# The use of R7 in the SMCCC conflicts with the compiler's use of R7 as a frame
+# pointer in Thumb2 mode, which is forcibly enabled by Clang when profiling
+# hooks are inserted via the -pg switch.
+CFLAGS_REMOVE_airoha-cpu-pmdomain.o += $(CC_FLAGS_FTRACE)
+endif
-- 
2.47.1

