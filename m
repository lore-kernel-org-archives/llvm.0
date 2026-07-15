Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACF370ACC
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078138; cv=none; b=oq8w4gLSEYHVv57XxRkFWvLDwwq67hPh99QbvXtEAQ9bv9u/dLD8GNnOkHW6GSs8vySoi+vgnJ7S6YISMnCflYzkgxX8vNiCEN4ZTiOIc4CsOp6Z2m99+xtbo7ESzzQ4XHRqH3+bqpSfAWNbDR4uHqG6MytURdTLhZNX/LZiHeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078138; c=relaxed/simple;
	bh=rsXZicNA6CgICpzQ4UlJMXAShtqDyxeuEyA3g+edfNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHFJYX368eCUKDOShklgdaS3m2xfznd2peqkY49PVcjTkXfBDM9nPP4Dytjb303KZ5d5/B/KQHa0i3Q+rcP1dQsgw//0q3bE1+h4I/10E5TpLR6DVbwlkUU45snOopyNTyyuvFhQoKhsYXVeOPVIT8ll3h0WSMSWrIWNuG754+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cI+pVbtr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cI+pVbtr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381891a9525so5264915a91.3
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078136; x=1784682936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcGjK0t9D92tDFqE5kgmtmyyKNtamGW2f/Lgn1+ZlUM=;
        b=cI+pVbtrtoImGeG8tPF6nZvn962MnPW80VksLaeynCCe8f/JnCxmz5xU39/K35yk7k
         6hpxfPpcMX+qI8Fi3WOCw1wDbOvw1uEIWzD03f8/JG8KL9SxyiipXKwIJU6UfngpJp79
         ZFkDwQNRt0uQ+5x09EY0viFEdQXBXuqCcrhpzcHedOn5gYHlinarR12L/WpUhgKXQVUK
         LyUY8nv/IDdMuKVYri2uxLD0YywPMadNiuOQCrChdIwKXDgd7kSHrVFsLOfBS+bo3ny5
         xDs7PLvBxCUVwtzgTtsXRCTvT+qLQu0Iugl6WIInjWArJVmex+yXTFuZFPH+eunhJO5c
         feBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078136; x=1784682936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcGjK0t9D92tDFqE5kgmtmyyKNtamGW2f/Lgn1+ZlUM=;
        b=Uy77KvvtaIazh2EpsgCs3XpY/xW59/HwQQ7FTZGI+xGnEk1jCP3zjScssWst55bgRS
         Mzvrtrwp6Ll6BcXZkfeFhJlM+CxbUiIg5PdFwPu8xumq01y+ZASPpJqssQAe4dkZz0ew
         yCNm0vk4nak5RoItK9iU/FbSI9hOJh8AdpVml9xFRmR08YreiQO0C2F7FlezbciqOiRA
         BIeFgQxhIhFQXJuIFQhEY2FkyiL5MCzoqPAzh6OncbTT9122HLYK4kmmcwlmJjPQC62u
         iHGNLVarztbILyZWvZfB+evQObR5bgYxAH3Ovw+QklTBDMLAt6hVyjKHCh3/o9bwfTkZ
         Gk/Q==
X-Forwarded-Encrypted: i=1; AHgh+RpWSQSNmkfdChigfc9GcFZdP7OQAhw+ztWWEuAalfRnOnywTUPB/Gh7u/U1T0qoMMwAMVqy@lists.linux.dev
X-Gm-Message-State: AOJu0YyuJt+4NdidjwqhvbaK/qLOxGOxT8B36FoU3x2A91q957qbJcOG
	rS8QwlEnzG38e2wEQFSD9p33SFgpnfNMQXiFnjYOiShD1bXgEbekU3XD
X-Gm-Gg: AfdE7ckL80GUxlU9iTouI49wKrJUzRCzm+2z9Ns8hvHnVMtIfEn35091FrYr9dWIwIH
	DY4Y0jQ/cR80v16Rvav8eqBV8OwxF3Y4r7NJoOAGKhfx+chyF9iLOmnblLIzaQXVvDHH759f3xF
	IUH2dH0w1Z9+VZl26I7GLPNsklooNaKc5agIumT1ScFlBpJtRnxIIxMiO3sFsrHSKwpH7SXK4h5
	/X8sh9gOcawAegiLT/nJ0YYCv7XMcMHDrOrDLA0x1EMFtpGYHt71MKiACy7+bK8tN5SHMdDnJkm
	EvgiKLsr9dbajQaizSg8V68Mf5uB2hgtipfWkFbgood2Yd3/Jy2cIDCqCftHc6gj8bZV5xpZt5C
	IPmQG3Ds3QYPYaHtd85sA6KVSYgpCl9Dv8iMvtKScEClctO3i8pCdVggTZ9cQmv+SyNcAFZS8NU
	oPZCPO2SbvahEXt94xQsB1J/e1Ys9Grr1RYaHRjWLwynV3FN2kuiKD+nhJOcynOpaIySG9AM2lC
	XSu/tf1N4MwfCql0y4eaDRqzW/Gb1Q9h1RdaIss9S34OPbeqM8FTpD6EhB2JQ96ow==
X-Received: by 2002:a17:90b:4cc5:b0:38e:2524:7272 with SMTP id 98e67ed59e1d1-38e25247950mr2152483a91.39.1784078136280;
        Tue, 14 Jul 2026 18:15:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm58425447eec.26.2026.07.14.18.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:15:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] crypto: hisilicon/sec: use devm_platform_ioremap_resource in sec_map_io
Date: Tue, 14 Jul 2026 18:15:33 -0700
Message-ID: <20260715011533.1278258-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence in the SEC_NUM_ADDR_REGIONS loop with
devm_platform_ioremap_resource(), which fetches the resource, requests
the region and maps it in one call. Switch the error check to
IS_ERR()/PTR_ERR() and drop the now-unused struct resource pointer.

The driver only maps indices 0 and 1 (SEC_COMMON, SEC_SAA). On hip07 the
corresponding reg regions (0xd0000000, 0xd2000000) are 0x10000 each and
disjoint, so the region reservation added by devm_ioremap_resource() is
exclusive and does not introduce overlap failures.

Built for arm64 (drivers/crypto/hisilicon/sec/sec_drv.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/hisilicon/sec/sec_drv.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/hisilicon/sec/sec_drv.c b/drivers/crypto/hisilicon/sec/sec_drv.c
index 129cb6faa0b7..2514a5e1f9b4 100644
--- a/drivers/crypto/hisilicon/sec/sec_drv.c
+++ b/drivers/crypto/hisilicon/sec/sec_drv.c
@@ -1010,25 +1010,12 @@ static void sec_queue_base_init(struct sec_dev_info *info,
 
 static int sec_map_io(struct sec_dev_info *info, struct platform_device *pdev)
 {
-	struct resource *res;
 	int i;
 
 	for (i = 0; i < SEC_NUM_ADDR_REGIONS; i++) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
-
-		if (!res) {
-			dev_err(info->dev, "Memory resource %d not found\n", i);
-			return -EINVAL;
-		}
-
-		info->regs[i] = devm_ioremap(info->dev, res->start,
-					     resource_size(res));
-		if (!info->regs[i]) {
-			dev_err(info->dev,
-				"Memory resource %d could not be remapped\n",
-				i);
-			return -EINVAL;
-		}
+		info->regs[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(info->regs[i]))
+			return PTR_ERR(info->regs[i]);
 	}
 
 	return 0;
-- 
2.55.0

