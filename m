Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743E7A
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 09:32:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id y5so1311427wmi.0
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Anr/HpsJ2V3LE7H1qAJzQqqWy2ZK47ULNqlFEib6tU=;
        b=P7ly3xMyPOrr3B0325E0teDM/lnRIOn9XJo7vDUt6oM76ogcTuQmAW6QSIVXm06n6x
         clY6WFc+TmNkhiQfhXRr8z+8+GnhlhufGuUcCpWy72mXjFb/viNp1REsO6MooFRkqJKW
         LiKPKOSqw2QbIhK8uF5COvxCOU35Ijtfx4xyKac9cRmg7dMheotudn9S9JZ3N7Tn7SyF
         7Dz20E21T8NXyZywwDBROSordMx0mgKNb9BsZ3K4K7lDo/5eowmZTV2onhx2j37l5Ond
         fYQvlVkhQXEtA1WzjBBIhYtMWPIIrs+qS4YVXWl27BzzfOPOQwSa5ZBSDUWT2SW3Pkd/
         Wtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Anr/HpsJ2V3LE7H1qAJzQqqWy2ZK47ULNqlFEib6tU=;
        b=YrparfGY4lI3FL6oyf7cJUMGMmwKKjhs8Z3pkYVSngekxHWSltxrN7Hfof1EEoRuQt
         0m28L28BFWy2e1J+uaHMmAcnr5Xvxfeay0w/MmR1BlyUraxbfZW4ksYMwsCLChV7IGmy
         IIRoRssNg0Vq+ZAR6y2+lHEzXptxfkB21l8CW0zOM0ooCQ5y8YlIu99CzeTHN7tYlztO
         HVl0UfLiZcnETF135xg6XQ/nI0yfoh5j/jR18Va7O6MX/ErEacWGTJiCrKRFGX1K9uyA
         COBdQuz/ntPSJ4D55z2XcqyEJoRan2b1usfSqxJ2iyrgSu/iJmyMiy4KrmAp9dCM/QE3
         +HvQ==
X-Gm-Message-State: AOAM532g+42mETAX1ewUHED1HebXSQ4w3jJ9R/XuuE9bgJn8KH7TSauS
	QxHn1jPN+0yzh1ltNDfmlao=
X-Google-Smtp-Source: ABdhPJwoCKrFbFoCIBMTdfn2qSE6TEQIPQ9CT9XkwjlSqgeqEjqMCQ0M7IbjTCUATIRzbiSlEcckPw==
X-Received: by 2002:a05:600c:20b:b0:381:263:b5d6 with SMTP id 11-20020a05600c020b00b003810263b5d6mr1904829wmi.73.1645781561681;
        Fri, 25 Feb 2022 01:32:41 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id x2-20020a7bc762000000b00380fd1ba4ebsm7733046wmk.9.2022.02.25.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 01:32:21 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] iommu/arm-smmu: remove redundant assignment to variable res
Date: Fri, 25 Feb 2022 09:32:05 +0000
Message-Id: <20220225093205.170973-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable res is being assigned a value that isn't being read
later. The assignment is redundant and can be removed.

Cleans up clang scan warning:
drivers/iommu/arm/arm-smmu/arm-smmu.c:2109:10: warning: Although the
value stored to 'res' is used in the enclosing expression, the value
is never actually read from 'res' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4bc75c4ce402..f83d2c32b5a9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2106,7 +2106,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return PTR_ERR(smmu);
 
 	num_irqs = 0;
-	while ((res = platform_get_resource(pdev, IORESOURCE_IRQ, num_irqs))) {
+	while (platform_get_resource(pdev, IORESOURCE_IRQ, num_irqs)) {
 		num_irqs++;
 		if (num_irqs > smmu->num_global_irqs)
 			smmu->num_context_irqs++;
-- 
2.34.1

