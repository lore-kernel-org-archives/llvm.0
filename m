Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69735893
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742154; cv=none; b=eII9+uL0oVatvtwFythGbiRxcsf+DgOXI8cP5/bjLLnjWLBytzT00L+9Uz25fVyV65FjQCbqHvRbB+pvwA/61QZQOZ8eRal7iINyR7+8ieMQL5BQmFIJaQCi91ciBFL5DJyghUrakvcHhKs3F22A4VxhCQ1rZnS6j6m/fZVrM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742154; c=relaxed/simple;
	bh=hlcsJhUrLyBo5++wlhrrLrw8VUbuI1LW8vlmxLrWUg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h3jCCeOB8FlMf6jSzTzQqOvu7kcgMFJUDEDMmU3O4QQqPhDCRci09K1eNBQbXkbRFfs0n2Soi3yZyKnb0TInpHnv4hV6mXZvDjhlNrVs9STtrhbLgRU74JWUvWpG4Iwm1dZnyNyPp36KTVMqWcoWE3zUz6Nsr7sy/l1vJ0gC9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJfgmuYR; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJfgmuYR"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2598612a12.3
        for <llvm@lists.linux.dev>; Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742152; x=1789346952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=IJfgmuYR8XjIp9icqVQ9y6wBfS/uxsiofDOy05ckPleDa0z4WFB0hjqoyGAWH/Jnwh
         ej9iu3zsNFW0CUgCuPtx2ayDqoBMp/wbOQW2w9YWuhH7dLsBeslZM3QrKUOY+mAzXbTh
         pyioAoHDdlQSHcQFnrAIXPdhuczN4YMaTlQkMI3CTS9iKSp1Ba2oj4WMIqzqZ6L0faLi
         CVpwrvfCmsj88qysE3LJ31sYOU6NZ6DqndKtRYtSGqCbmQyHuoRBlwqsRWEjMrf0liJA
         GZCuCXb9T2NFGXz54KYuZ0M3BxnsgUHKTXocJ2Pwfi4wpcRt3cBkOPTw6b3lzZQGGRLr
         eKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742152; x=1789346952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=Zac7ogtPuERLz3d/afp5NxER3RDfmDPxVcmsWt+ufGUrR29bOrCVggnEN4d006whB4
         TL93b/i6w96ZV39hU9JOrZgPObnRoVxWdC8dY1XvcjU63CCTLDgBYs3/UKiFMu4Qdlps
         8eNtE0KZA/6Crht2SW/f65ySihVWYgAO8vD+jlM7b+yIVuEnmixw87S9qzi5fJyJeJYD
         g9udO5q+TqtgUFuAPxVJ9jlRJCtMDwOwqF63S4fnzyXUdPBslQkMP6Kv+JIS/1OvYrEw
         9wLJJajo1BQS5HT85Iz4tyARaGvayo8NIHaI91FrScuvT0gca0E+0ZW+QqFmsbPJqKeP
         3arQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5xkrpCb+uzeUXsFEEShGJ/9sXaNePcP9tH7yA+lcx4DcrpFp+6HBqkKNqTOrBgEPemyom@lists.linux.dev
X-Gm-Message-State: AFuF++lU3PU69ErZmhJF1A9TxxPSskz6Gv4HpNMDL6oMbXiomT6NvwAe
	y+XvG20dRNJt7aIIu6krr+2almqy9X2q0GwPEUVAl2sQDiD0zSJGCpnO
X-Gm-Gg: AYBFou3TnyEdAfppIunNPRq/uHxd1B7ylC+C0z2kWXGHilO9+UD4Fn9PZWIRj94BWcR
	C92R7aJt+ekAhjjOjXXlTvFNJPAIcPj8v/3qFO5x/XRK1CKrJfGnxPcKejqEChxMOYvg+NBDhlx
	ldJjgDNuV6UX+lxB83sATkVfVdlwiKOgFlsbSDnWWa6RrGIQ2RNgq4kUmALt3dfva8Ybo3Nyino
	ZfcStJuhU6p+CftBjJiF9rFK+UkSIDdyAdgjwhRDIh3xLVx5I0qJixhlEDgzsfgnJoYNBqgpwog
	kg3EV5EvHb85P0Iqd8k1ICC7791WiWnyT+jdsTu7b15X8kKaxyC2hRRwbVf3y7Nni3GguyESHoJ
	0kD/9Wtl+rwuy/e3J74D2FM8j0VsXgKHUeh+NcNeW+bHniCTCKnwC4eUU0F5z2ofw05jHBGSxDU
	Rr7jR6AmOii/pTIr2OkJG1GvxWz0aiUDVUQEx5ArYZkc9MYgF74mS4mvRx4hXgNUQxFLhu6CPn/
	8hhUpH27RNbFEXILWjbc+ZUGEgjpAQ1ciQYtq+j5RsA2OwsfmNWZF1s1+QP1r6/NI0Vzp1l08Ky
	rRaXgSINQRDvGTxgU+IaxZn16SEkwuGY763iCLw=
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr31242218637.27.1788742152360;
        Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm22771048eec.9.2026.09.06.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:49:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mtd: docg3: use devm_platform_ioremap_resource()
Date: Sun,  6 Sep 2026 17:49:10 -0700
Message-ID: <20260907004910.226013-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource(IORESOURCE_MEM, 0) plus
devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and
returns an ERR_PTR checked with IS_ERR()/PTR_ERR().

The canonical docg3 register window is DOC_IOSPACE_SIZE (0x2000), which is
the size any platform provides for this device, so mapping the full
resource is equivalent to the previous fixed-size devm_ioremap().

Built for ARM (multi_v7_defconfig + CONFIG_MTD_DOCG3) with LLVM=1;
drivers/mtd/devices/docg3.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/devices/docg3.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..bbdf3bfb0e70 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1971,25 +1971,15 @@ static int __init docg3_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtd_info *mtd;
-	struct resource *ress;
 	void __iomem *base;
 	int ret, floor;
 	struct docg3_cascade *cascade;
 
-	ret = -ENXIO;
-	ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!ress) {
-		dev_err(dev, "No I/O memory resource defined\n");
-		return ret;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	ret = -ENOMEM;
-	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
-	if (!base) {
-		dev_err(dev, "devm_ioremap dev failed\n");
-		return ret;
-	}
-
 	cascade = devm_kcalloc(dev, DOC_MAX_NBFLOORS, sizeof(*cascade),
 			       GFP_KERNEL);
 	if (!cascade)
-- 
2.55.0

