Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797191DED5B
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783988887; cv=none; b=Cw93r937VNokQDm5Bi770/BOA5QI+y/mzSGZ+KBhD4eB0NibiXq1BmEJGYAvN26xdN895ytEZ42zF3Zp5g15WhVtrTsBKHzmSSIFYmg/Per0UNcDXmt/Vb0fN0zzjaqJjJ/Ki+dJJS+H10Q4cxErokPTPFAQ3nU2jp8oR4Jx1Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783988887; c=relaxed/simple;
	bh=5iy63XHbqBSfeIqFa1/srtHbQ/+BlH6A+g/VbecZvj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnNfsm1D8T4s+FSTDsX/XB0cOzbut3U5Nju8TYuRARKeh2NDDUqAm2Fo2L+N9x6HGIJMCwcym6XIrhgiY1EcF5UOaMZyxt6eRDoiBvxbohJ02fRE0vnhCom2iIpgw5XcNI/FnLsFjqdQ5eSkgNDEmdYzvkj9JNxya8YvZfe33fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPK40pZE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPK40pZE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8487b7b4066so3419400b3a.1
        for <llvm@lists.linux.dev>; Mon, 13 Jul 2026 17:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783988886; x=1784593686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R35+AhKuoC4oYnI/b9RPi99MFz3JDij1EKLCf/1SkNo=;
        b=KPK40pZE4RMigZl2ZILyYQaDrkpNOnG+h3r3+kOfj+W30Gol6oswV34bhlVjcufbwn
         l56JXDub5sYLaVGf7jczSjl/y4e6LYU/RwxvxF4GCbxt+0Aj6LRr17lXh9oMEgChI640
         sq0ZxpSnTLvGAGQ8jAcN9wo0SznSAPhsnbagjLWReAw2DTC7joRg7S+iESJKOnhkHQ0m
         Wp92EetyPumEC8QBfKeIkfLCcG9kYKolLUSISVFeR9e8uH8FPT1LMTi/sl/6hunws+Ut
         OP7obWnmQEhCv2s70Kqji31MBTUUXbbndvLQ0lNGFN1gADRGnSwp0eNDyLf+q+yura9F
         Bq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783988886; x=1784593686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R35+AhKuoC4oYnI/b9RPi99MFz3JDij1EKLCf/1SkNo=;
        b=qw8XYBooq6RzHIYTjRc2nZD/QJhj3GIK0rCFymne1vm6ZWX/Ot3qEZST2y/smTcNqM
         idndLi4XkOXhwHqh+Cvcx9OeMlsSp2z1yzDxC/C1ifGXjAUg0/G4zPM/55wG31EfKqVU
         XKiqNVvOnXKh6+8puzvCfx5v7OcSOBrfbdUQsAx+YVVMSp9HRqXOyh0X+7OdBYHaAkP9
         uX6JCh8zvh2irNgQVk4xm3Oo2o9kzmvKSjruiPO69fqeUT6epUDPmM9qPehsH+rxUNU7
         Za/qOIJW7BOLqnNnSyJIWYK2VKaDEOW1FSn4EJWol6HOIwE6ZnAd5RqBNEJYMo9x+CMn
         2JAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoP/RXRCJbstLF7xs8aMHx9WCfD4BgU0CRfFW4GnETiCoXrCcc4LvQC2ymzJ051xjsVB1eJ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwkvp6RrXSwjl/FxWzZR99VbvL3Gbo0GuGQsOwemcO5Qo74/Nw
	Jmh5XI2Ny33eqxEvp9w6xOjzg5lTOJpvY1zs265RQZwhOiI5YtsRPzz2
X-Gm-Gg: AfdE7cmVayoCkR2sLux8VTe3eEN4zVxaQBBKiqxLGZRYL85vi+k5x0mGaECzdSYZFx7
	KB+2ecUeD7S4rc4mvoiKKcL56A3BHt16fPV8YhoPlBL3YtaVDUEmSpNLxeIixYuRmp5zQ7+zG0B
	kRex67fd7hUd9RBaUTMJTAKEKQq2c3CTHDrg8pRQa2PmM2PNGDjT8TbTuo8Inj91LVkwdEnWb7a
	QoUVGg1Fet680n8ZIIK3XIA1rQzHnIiMf7ptjDQD4FoB6ECzz2x/CXtchKjebJ5IMz3PyMAJ/V5
	pqT9hOjQcjunjWISz6dKtxd1+Q7miElnDOKkHBaN7okE+zv59lcFh81GqvpyKd29+9X7Ar8lGOx
	lOMLg1wJXFsGWSZMVO7cTkTZgX2FZ4N/Iy7yLgD18V+3TSpLLGi/4YphmlZ7qDmW/Y9qfVf6AHo
	ipM0U4F9eYNV4FC3GnxpO2q6VudQO96AHapbg2nbj6rrx2t7G6JRUMyfnqmdspx8GD30eI48DDo
	15RIwXL9kKOclFPhWFoG87mnRyNDvJaF2JfKY/TD6zONhZN0VRNE0D/YY/FEdRxsg==
X-Received: by 2002:a05:6a00:12e9:b0:848:662c:cb85 with SMTP id d2e1a72fcca58-848895dc921mr10952862b3a.6.1783988885724;
        Mon, 13 Jul 2026 17:28:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f81a5absm537906b3a.54.2026.07.13.17.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 17:28:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] dmaengine: mv_xor: use devm_platform_ioremap_resource()
Date: Mon, 13 Jul 2026 17:28:03 -0700
Message-ID: <20260714002803.1414307-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the two open-coded platform_get_resource() plus devm_ioremap()
sequences with devm_platform_ioremap_resource() for the low and high XOR
register windows. This folds the resource lookup and mapping into a
single call and returns an ERR_PTR on failure, checked with IS_ERR() and
propagated via PTR_ERR().

devm_platform_ioremap_resource() reserves the region via
devm_request_mem_region(), which requires non-overlapping reg ranges. All
XOR nodes in the Marvell DTS describe two distinct 0x100 register windows
that do not overlap each other, and sibling XOR nodes interleave without
overlapping, so the newly-reserving mapping introduces no region
conflict.

Built for ARM (defconfig + CONFIG_MV_XOR) with LLVM=1;
drivers/dma/mv_xor.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/mv_xor.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 25ed61f1b089..fe2e6b9ec185 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1309,7 +1309,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 	const struct mbus_dram_target_info *dram;
 	struct mv_xor_device *xordev;
 	struct mv_xor_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct resource *res;
 	unsigned int max_engines, max_channels;
 	int i, ret;
 
@@ -1319,23 +1318,13 @@ static int mv_xor_probe(struct platform_device *pdev)
 	if (!xordev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
+	xordev->xor_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xordev->xor_base))
+		return PTR_ERR(xordev->xor_base);
 
-	xordev->xor_base = devm_ioremap(&pdev->dev, res->start,
-					resource_size(res));
-	if (!xordev->xor_base)
-		return -EBUSY;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -ENODEV;
-
-	xordev->xor_high_base = devm_ioremap(&pdev->dev, res->start,
-					     resource_size(res));
-	if (!xordev->xor_high_base)
-		return -EBUSY;
+	xordev->xor_high_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(xordev->xor_high_base))
+		return PTR_ERR(xordev->xor_high_base);
 
 	platform_set_drvdata(pdev, xordev);
 
-- 
2.55.0

