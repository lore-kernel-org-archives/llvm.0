Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0EF35F185
	for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 23:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783984907; cv=none; b=I1fodoO/Qu0dvTukY3w24bwvB9iAt6ckN0K+ws1UmJu9w+DqI5HRpapNdxbjspVoW4QXeNeAqXDtE9/P9FGd+M1Pgu1KDaeS7Koec33Q/7BLdjR3+YbupWq9FapdTIAz83YpReeWB54aMnxb7RUDVRxfAhRRKFh04m1P3DClYiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783984907; c=relaxed/simple;
	bh=aHq2z5wJgiJJGtDTjASWD2AVN48KvlxybLZ9/CTioZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WnJ99uFjUd4YPveqO/e1pBorV6KrtXx65VAZaN3ANZ8YgDx8IAI4Kh1fVvW+o0Gy8/RVBxJntN75a0K00UvdfuDEX4ifobmg/k9xvTkryHUrccmCiP+WCH0Dj351ZtnA4LYCicp+8UdhadT8sCZkmtKrNbbrNzJuF+btrFA3Xqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCGctLZ+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCGctLZ+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso98277b3a.1
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 16:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783984905; x=1784589705; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmt8IO5aqVfL3mDoyy5CaJovs80770UZpxeBY54vlPs=;
        b=kCGctLZ+6dwjoOkrmbLPrXqXule3D+MbOxOHhTbne8s+HY7b02h6RPL9XANTtADIny
         hFA/xh3mff1dzPVJ9x7CTprBWii6EOmvwhcXPsKLxGkvOPwdqEIW2/0L+yD/b3hAZC5i
         crZSQz4N3MVWSDPDL3+TGzoGijA91ntPYk3K7lLwnjX57GHNT0+iELZRttA5//90B2Oo
         ZD3uBFqt4HtpHIOxJZXO1rFKgCxrA22fiut8mHDN6oOd4B7obuH0/2yiefcUF5aIG1nF
         ZNsWBl2VYCLJlt3QuYk/Jt6/W3wCvMO7Phnz9RCkpesHSBu6yam9Phpvbz0TAUTWmPpr
         6g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783984905; x=1784589705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmt8IO5aqVfL3mDoyy5CaJovs80770UZpxeBY54vlPs=;
        b=WPVwHum3vKEusl5XFIKUuPZvsbqRiVS9PXX35va8/GeTSDoAJCchBdUgEu3YswmVmD
         AZIvoT/C5deCb7R5cyIL97/1EwU/Cu5k90cgqSwJlhJQxCwAMIBCJ++AZumAfGbVjQla
         uXgDk/Bn1vzE64jtXMrkeEh2IY5RFuK16o5fw1TA1Jkn/T+SnfEBnqCc5tmCk1TODLIo
         unyhr/NbaIaSmAMsvbwTi+pvuu6Bdxv/Tj8YT/fj6m0zs1fEDb9HYqdkqMjuJbag+q/2
         Ww57dolFIcPltTOJDoUAlNM5v8qeoTBpkEENOabDeJTGj1HU6pEHF/KxW40WYzWN3AjZ
         C6wg==
X-Forwarded-Encrypted: i=1; AHgh+RqTCV62O9qndA3bGuKU5YGSGcr7KZaULz76b24cz/8SarP2tBKMC778TYOxIu6XlGYBWOFf@lists.linux.dev
X-Gm-Message-State: AOJu0YwN5onI49Gae74HfUW1iVK/upzMpZdgo/8gUDGvYJDsck9VUIBt
	+5LG6ewx1pRBv2Lk34EAysGJb6Dv2DAtenABCCaReWkcLwbUATLFCT+w
X-Gm-Gg: AfdE7cnNbBduCANC1/su+n4o4S+qoGVcQcIIthjJAR5bw73U2IBqrS+1XAWD94hdpsc
	UUs57mg+9PLsO3Q14rghyJlEBhM1wmotiAGF8cg3JSlpQCbrz+aj/twq2oGDo9Dq+PuOoqD4y6J
	zNmy4fifR9MSsU3qlBfW1ehLB9Iy79Lu22iBb/4Luuhufk2Bp35NHw2PE+qcQnHZkFZuWHDxLJX
	MvzCy40hlOH4+9jTCzson4wEm3QQzD+SlmgccPedhgYPHf4KYdZsfS9WvRBdBKfxSvTRYt0tpmd
	HDG+MYZgFwH90l2X1qb+A54PA6hDKnerMqOiWh5f/oWL/PGmJdL7p4M21goslDUi8VBMbIAyPYa
	86dEWrYzpTlgDm/ca00krWcVG9cf8RHI84MiW5V98zMxCUrTEvOuwxvFH0O08yiPxh0ZDMquXeV
	InW4znIRTdlQo18psdFKWEavb2RO3CyYh1HFovL9beN3LI5r/d9Bvlk5C5WxKUKeF00kDkku6bg
	kAIKc/vX0akaoS8P22nKLgFqBgnvotaUKEEcWdn3gnOLeYS0H+J9kLAZ8OkNuPGIxnJnXj41D1+
X-Received: by 2002:a05:6a00:368b:b0:848:6dd5:f61 with SMTP id d2e1a72fcca58-8488971d44amr10074793b3a.44.1783984905296;
        Mon, 13 Jul 2026 16:21:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7e9711sm476090b3a.50.2026.07.13.16.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 16:21:44 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ata: pata_rb532_cf: use devm_platform_ioremap_resource()
Date: Mon, 13 Jul 2026 16:21:43 -0700
Message-ID: <20260713232143.1114497-1-rosenp@gmail.com>
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
failure, checked with IS_ERR() and propagated via PTR_ERR(). Similar to
platform_get_irq(), it can return -EPROBE_DEFER so move it early.

The pata-rb532-cf platform device (arch/mips/rb532/devices.c) provides a
single IORESOURCE_MEM window at the DEV1BASE chip-select, distinct from
the other RB532 chip-selects, so the region reservation now performed by
devm_platform_ioremap_resource() introduces no conflict. The mapped size
is unchanged. Drop the redundant error message, as
devm_platform_ioremap_resource() already logs on failure.

Built for MIPS (rb532_defconfig) with LLVM=1;
drivers/ata/pata_rb532_cf.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/pata_rb532_cf.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/ata/pata_rb532_cf.c b/drivers/ata/pata_rb532_cf.c
index fd81e75c9402..0144e597707e 100644
--- a/drivers/ata/pata_rb532_cf.c
+++ b/drivers/ata/pata_rb532_cf.c
@@ -103,16 +103,14 @@ static int rb532_pata_driver_probe(struct platform_device *pdev)
 {
 	int irq;
 	struct gpio_desc *gpiod;
-	struct resource *res;
 	struct ata_host *ah;
 	struct rb532_cf_info *info;
+	void __iomem *iobase;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "no IOMEM resource found\n");
-		return -EINVAL;
-	}
+	iobase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(iobase))
+		return PTR_ERR(iobase);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -139,11 +137,7 @@ static int rb532_pata_driver_probe(struct platform_device *pdev)
 	ah->private_data = info;
 	info->gpio_line = gpiod;
 	info->irq = irq;
-
-	info->iobase = devm_ioremap(&pdev->dev, res->start,
-				resource_size(res));
-	if (!info->iobase)
-		return -ENOMEM;
+	info->iobase = iobase;
 
 	rb532_pata_setup_ports(ah);
 
-- 
2.55.0

