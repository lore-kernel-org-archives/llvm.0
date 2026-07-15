Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED61F7575
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 02:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784081978; cv=none; b=mWZ5DqpaJcpSjPYM2KUDDpaiWpZxDkAMVienNm5XARvURl7dOnvlTXC3wk75XJ/36EVowVMnS/qf0cxQyuL0mWKMlXa77i7rxFdfJX8p+O3xn24ARmlT+dd9cbESFdDb7Q4/G2iOI4kFEu+CcaGhh7hyizm2tPtzLx23f9jjKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784081978; c=relaxed/simple;
	bh=9hNvJLwHoOEou8LLYeKhtdn5GPgGf0qbTrk5z2xNAq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQyKN/JyLEJ5i0STonDq5cFaolTlDnEx0V0ag3IS2w8ohtlcnPEII8i3tIsTnx2itJqDAgGBI7jRQ1aKyBx0iuwBWRTcm/YyBh5Mc3nmJVV+qTLmmQDCK73aV2W33TepFlsfpqrWC6RFhdPWhqTo6pW5wsn/66PBaPgAaasYkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYMRFvoH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYMRFvoH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso54741335ad.1
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784081976; x=1784686776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=fYMRFvoHYdFTXZspal9iW/suUcMsPeZpz/KF7h+Xr3f1gqQ5CWDXibi4bjd+cxqUxx
         9EiozUUwtxmaqcM8rHXUS+czbt7aiPk3urPRgdFG5jacXUMpTmT/s3GIuBiwVXCX7WtB
         eDDjOXCbQdGvzP3kX+0S12bChAoQ6wYzmdeRWNJFXfzPoxYBCLhjXPH9mXeZ47TKu405
         iadIr8LYize/fY3i1kYV0FQ/JqDP6KA9QHFKSLKW6Oin4Hi3Dom8T2MGOqk568jElcYj
         3ATIqDCYGzKYuTDjqozh/BuoGRqAdn1FcRongBdWTm6fgWRhCGHu+HZUJhn2n5FroIZH
         xdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784081976; x=1784686776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+A/CsOvZ5kwNPw68MEUIBx9OhApXOPeGcI1WPKSM0g=;
        b=Sa3HLqw6L/6bIYkuOH1CWVIcwqlzcoa3a2NVkF6lEDxmc8Q5nVDPrOCde9pkQ4pLNB
         CM81xEELr0+Kpo4MFKbIfn5J/UEsMUGt8j88CP7LC3jabqiAQiMp1UJBAvAP9M/Agwoc
         Ez7aZ6uoqI+OLqJx9Y4njhGHd9+I/qNlP8Ggfvya0+gGjd1a7BEkOpSwp9q/YcKWIk87
         PVLxQ/u2xamMcR1+vkNPulfjBUP/K+SQn9ke6eMuaN1PTjpVWYesM/bCvKcAK5HKOAyA
         KDZaOYysmWz77XxejrUD540BFbXuJ7OyyT4pg9IxwdEDcWAbXAJyacaK7d6HTcq4rfUo
         RJ0w==
X-Forwarded-Encrypted: i=1; AHgh+RqRCl9BAEDMrb4DaFmd3BlQtj3KVvWSO8dlyPLNVAPt53LnnE/1WYut5QcD59FoSiJ/mo9D@lists.linux.dev
X-Gm-Message-State: AOJu0YwprwigmDc+FGskVjV7t2CeK+buo5ny/+sA9YfHpFJ4q504f+Wa
	NKgEAqCkqX69fxVypboMdXoZduEjJuMoHGZX+1atG6HllffNFllThR4g
X-Gm-Gg: AfdE7ckbFbstBWOKOEQd0fnJM5/1iW/v4yqfFkRijUQ2/3nmoc0DpmgyLiVth+K+7vL
	f7sRA8ILcxnr61uR2ZVRlp38riEO0yp3dOo5CrqutdVoWdKvjUm/YAUYl9CQCwAI9XHFb/0lAYE
	NdJXSZoQbjcGELqgVa8QM49ZoET330I4FWyv0YRmJGot0a9xLqrEmMjcvoXuBb9sVmoBfJFuLP2
	Z+oUKXHwEtSZcRp1rWcf6A7ZcHQJCwLi4UxVXcFceIKglQDW3Rv8+/R5ZAAWIrJwovXPe5IZ2KN
	cJSbgMQn4eDXDnQi11Qlicf31FvhKQMa642sVEUW/MmJWeJFa8S65qSwNuvrdKzB5JL9m/MYzoJ
	SJRuQsT9u1qrPyotQZ1c/DXsny6DPqMUW8r4CbJHSrA1rIaQo8k1aBdK7/H7+ZNKJGA/vFiOPYK
	rk0BU/1rAKIdiRWDFMc0TZe8cTCL4TxX6runWvtuMxKsqP6MTXEPBIHW/x3lphGpr4SFEU34St+
	u8MxUCSwlg3QlpyfMHHIsC/TaD9hf/1XVcJZP6ehw6VG8Lw7o1pn+fZLPcqxrmNtQ==
X-Received: by 2002:a05:6a20:3d92:b0:3c0:9c1a:893e with SMTP id adf61e73a8af0-3c34d8c599fmr6957139637.70.1784081976192;
        Tue, 14 Jul 2026 19:19:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca7f626fb78sm8653754a12.13.2026.07.14.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:19:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 19:19:33 -0700
Message-ID: <20260715021933.1551663-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Built for ARM (mxs_defconfig + CONFIG_RTC_DRV_STMP) with LLVM=1;
drivers/rtc/rtc-stmp3xxx.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-stmp3xxx.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..05f128ccf827 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -245,28 +245,21 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
 	int err;
 
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
+	rtc_data->io = io;
 	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
-- 
2.55.0

