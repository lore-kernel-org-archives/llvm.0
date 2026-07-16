Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7F446852
	for <llvm@lists.linux.dev>; Thu, 16 Jul 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225811; cv=none; b=jEEt85q1pAVuAAY3zxJsvOF9XXQvMFZfvG3ZQa+ak8lxPcPq4I/Izq4c6X+29zxlnqymomRbvPjxrMOWxa0vKGLthTeLK+jFUearsgdHALaBcBci8r+3R0nZ1c39eSVdKF0qQZGUSCfu9+taTLXLOV+JYji1Zx/oi7WPM/kjJug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225811; c=relaxed/simple;
	bh=Efbsu1xIE7s436CBwuioeeP26PbwIsZHvSLfo8w9864=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jQeV5yJQ/BUnXxgbGPjlK3t5anC31z9avyz7A2qAfmGn26eUo1Uf5OIy1fdGuHZkjxC6xERW3cgUHsJyLZcsXyu/Osem92VXt8DeNhsQ0izP4fqPbdnTfmtJ6l1g3JP7T3XYYWjyWQ5RNWaWKI93UXLbNYBhGibYeHbbKX57+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNgH+y8W; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNgH+y8W"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so79464755ad.1
        for <llvm@lists.linux.dev>; Thu, 16 Jul 2026 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225806; x=1784830606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80kzqQxDPzxzS+os3KIXMK4OJKPHHq+HrsLNx95GDVs=;
        b=SNgH+y8WTwYMgFFTSteTuGk/HX+3/4/5OufSOJ3HgVVeyDrpx+rL1hWFwS/JJWKB/S
         ZJssOMSLw03WRz8FiYorRJc/iLzX4LEgMVxLXpjLt+p8ta0GFzYFQ3qeKNd/TrZkSa6y
         ypNXVKIGQhfQ/of4VE48hKzmdKmPqIbVgAbG4Xe+GixT46qXBDuEzv79eUmkrKSUib47
         dB//uY1Wjvc8dtV867LybshyDtHhK9xRM8RdiBoBxKIPzYKnBGw1alrsbtCSqDksgLKs
         HyevFBNn5UUfmo4SFW1MAeK0yb/+HPJHyRIBmDtXp6QmGeMIOMRupiU8hhMDyIX4KtBb
         d31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225806; x=1784830606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80kzqQxDPzxzS+os3KIXMK4OJKPHHq+HrsLNx95GDVs=;
        b=LTgISwadhHBh7Kxa5gLE742QGSHSYg3S1RoDa5RsxfYVFARsn8CqiJvbE0gaLbcnbH
         vOsEueK1xRRHiZ7W7y5ID3uI0hBr3baSMRIVxdpUkSFEe8zl+2WQQP8f2ehl+fTJmNPt
         +ksKls5+9CNcPWCBsAbNnOq7e+tWqyY90AyZopi9an3wYSd1C79rE47vkT4Fj71nThf8
         LUgZGRidy94we8WpjnG09sfE8p7P4ta1keBBwCMv5v/4oWBbAg6UnY2YlJmjMJny3nvF
         omgc2eaU1fOaKRpxVNq7H2ENCYWKkuvx1NBNAmkCc88FVlVrSbOn6018eN3jFk7GD+RR
         iwKw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/vDHRJsoRpfSFLMi74HAPLuBbaAiXuLChyAIQM1H1Y1oprvUb/SFprSxkda5BqQpbAQ7r@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9JKtIFSIb8V0fVi2vDLTtjow+WR3NJGvOhP1SViassMM1Tb8q
	qmrot1iIQYTyNqgo/DNVNmN2qIPln5liE2SolcntQNMAM0o/7snNz45W
X-Gm-Gg: AfdE7ckU4uvFWXkVlZAuyplxsXEGRda/BRNFqGpbiRzRe99/OdSEeMl9rYBYXYIAhMe
	9pExz+RuEt6ya1ykwXaLr20xvEk/OtWV3DZDtexDHGOx1m7AMbSpm2rhJn7xsDfwyvH5uLZseGE
	B69Fa1gJyTzvc9MuhP3A4zfiMztbFwf5TbtodNaT30nAnYA3GfiX6ux2uj+RpBh+xzreYq7+R1x
	kp59mDpPxm3cDWSY1mRPjQ9e+HPpH8ZAF3zU0tqAMO+NL0DhBznfp2h7ETDVQ/tGcM50y85/V7H
	wqfXs4eaj+XVbxWnb43CposDroqNaDoPjH8Hf/cAvru4mnh9in42S/byhjshBH9oKOzd6J9fvPb
	+T3+bZFd/UWGEbNrTTC19SlOjey7XRKT2WhkSghurC395sQIFHi7t4BbX3BY8l3k2NoKm7d+6a6
	Op5UW4G7nU3D4dK3mawEDU0ACcfxTthPt43K64p9UP2qmKd5sd2yqZhK7yqofk5bRowjdNshe1P
	3Ru34XcayNsec5apSFEJIfK2g2K0TOcvh2QdMcMYfFkMsvfK9rIOOg=
X-Received: by 2002:a17:903:1aee:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf03d9dba9mr87376235ad.25.1784225806229;
        Thu, 16 Jul 2026 11:16:46 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de4fsm24689575ad.44.2026.07.16.11.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:16:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] gpio: logicvc: use devm_platform_get_and_ioremap_resource()
Date: Thu, 16 Jul 2026 11:16:44 -0700
Message-ID: <20260716181644.101450-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the regmap fallback path, replace of_address_to_resource() plus
devm_ioremap_resource() with devm_platform_get_and_ioremap_resource(),
which looks up the resource and maps it in one call. The helper returns a
pointer to the resource, so update resource_size() to dereference it.

Drop the now-unused linux/of_address.h include; of_node is still used by
syscon_node_to_regmap() and platform_get_resource() resolves the same MEM
resource that of_address_to_resource(of_node, 0) did.

Built for ARM (multi_v7_defconfig + CONFIG_GPIO_LOGICVC) with LLVM=1;
drivers/gpio/gpio-logicvc.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove unused ret.
 drivers/gpio/gpio-logicvc.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
index cb9dbcc290ad..697370f43002 100644
--- a/drivers/gpio/gpio-logicvc.c
+++ b/drivers/gpio/gpio-logicvc.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
@@ -91,7 +90,6 @@ static int logicvc_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *of_node = dev->of_node;
 	struct logicvc_gpio *logicvc;
-	int ret;

 	logicvc = devm_kzalloc(dev, sizeof(*logicvc), GFP_KERNEL);
 	if (!logicvc)
@@ -102,20 +100,14 @@ static int logicvc_gpio_probe(struct platform_device *pdev)

 	/* Grab our own regmap if that fails. */
 	if (IS_ERR(logicvc->regmap)) {
-		struct resource res;
+		struct resource *res;
 		void __iomem *base;

-		ret = of_address_to_resource(of_node, 0, &res);
-		if (ret) {
-			dev_err(dev, "Failed to get resource from address\n");
-			return ret;
-		}
-
-		base = devm_ioremap_resource(dev, &res);
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 		if (IS_ERR(base))
 			return PTR_ERR(base);

-		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
+		logicvc_gpio_regmap_config.max_register = resource_size(res) -
 			logicvc_gpio_regmap_config.reg_stride;

 		logicvc->regmap =
--
2.55.0

