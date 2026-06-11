Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D872A33B970
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149995; cv=none; b=UtwmG9CawooPhbwFdidYBAriz6BByWhx6SCS+QJ3LQ9GIMnOynQKuxmakjTOvfMfKu+7littSHoHW1DII3+6Ae0yjLMc3XLQSTXrsK151LjlZAaeWUrVJpu6wF3f+Ao40FZQpgbpVJ2mqd9k9wwS+nDE744Df10DVIZmohyHlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149995; c=relaxed/simple;
	bh=lyTXMgabiZFV1r5MchNd6Qy8eKJqo3LxCHLLSTQ8EzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YfVygR3FpH4b2PFEWkdsOVya1SSUT15HHI+Nlyz7ryKm3Fu90tWO+YF9QJizXjCAKEN4lYvJXJXRsqySFLeRCmDXgaz6DDk1UU5y49cGOO8I2Lp1PFoOrWdlaCBBw6HhEPQGD0n5PvHLCE/JnmRK4jzJlxtFyXH4UjY9FuppMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqSUTdNf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqSUTdNf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso6582908a91.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 20:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149991; x=1781754791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=MqSUTdNf9u+Qjw2WEg6qACwDLB9uixRpAkLZ1mEEf2G+DoUDmcRhnAdSNgAF02Bhi6
         uNiYqXpd4/I8Dve1E0FzE98n5Y0oU6RbMhwY4o42Nc4/Pa/rvE4SoVUoeV5heHnEt8XS
         QXudDjJr+eQGFIEAn264LkeuSR724LNuLj3UlPVbqWouDM9cQCdPZkynnx5WLdb5cZqS
         yThpp9dgCNAUwrgrmObFc4CR//zk6p4bd/XGPnHgHsYNzRfobCIcYkzBmWLoybdpV1CK
         XyyZiyxkbHiq+JqH1IoizsDxow22vHojdJUnmlL8f7dlcEk5+tW6J3i/sF8tjchu44c4
         GmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149991; x=1781754791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Axf2i08FEMNQcDQLuzX7KUZnp7l0NF95o4nFAH7q5yc=;
        b=NS55OsnAJ2yS281zRKZnrt5+58WytMCvtdCGJRKrf+VcQA2y448Kc34HUZWjlNuFvh
         t8rJB25ovuGGYCsT2fDpah3fkZUHjBCt9KSMLSFd79g/hZKr/P9q0Rpu7sozfVJ92o/C
         useKELIiEh5ptfQD8xseRzFfGQvli+EmYDnMO0f7dgLB4Q/sMuRzJ572+eUnXd0IJF1y
         mk9GHTFM/2ZWhtoOvhewHvJ150EDsOqm7GJDG6uZ1Xs6pzEvuEtg2BmEgr7VLtzqs8uV
         wrByQI7JBgMfpM1l4sgfWm8BMmCuAeZcqcdAo8Sc8ac9BgB0L2oK1Lzw1d/Qk+jkVy+Q
         5PWQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W12l/PMGjm1Pz3r8ZsDpnVofvDb9pNmn7uAJS0voASk/V5CdfG62vYRHsfnhd401J2GZm@lists.linux.dev
X-Gm-Message-State: AOJu0YwddHGgmYkXfjCAZqP0GD0qoczB1TE4FkuKOSmC6uYbjoAjcEMa
	wu6qhca4yr9mT4NmJlkc123ebqdKy4rLf6UpBHLQpqU2g11+e4gfCdyU
X-Gm-Gg: Acq92OHdvmsuZJcAezzyOnYJY6jt5Y79DUi6OWWte0HwglLoztfJEIN7oyZzsriMIzE
	hrHnQDC9v7LYF3FoO69lwOySXUV2OBHiZ4394VX5LFJMg+Hn4nt+yz2C7uevB3jawUGpLPFteVr
	jNA5v4fdZlgUDYw3u+aFiSardJwHcVR/azDQnc6nzEzc7c6ui0GxteWiVosqvwzMUk0Vx+k/pS1
	FK9aE0TBw52uQgpRfhH2XRrDUWnLVEcC8Kp14/GprXv8ttvghYM7/oT9pyvV33jHhw2ZI8C8ZL0
	Nhkc6fUra9ezr5xpxoBiwnctdILtS4WdA10vw8elZlvd4ywR6obH6U5NG46WOD8Xl3hpcCj6WEu
	49WdS0G95lmyXx9c+9tmU8JYFoeOdijy1XvAbbENw319e/AtY6XRIffKM8UW4Xx1N7PXc1/TzjG
	71GaNj52BTe9U2NwDu8URqkTILiDZu2hv7L1xSUl++f53KxUnXJNWfF5ognSdZXB5/Pcnfwxl/3
	PwtSSusKRLcaUr6LrQG8nZAqVGBFAspd9d6oKDnqeCmzQ==
X-Received: by 2002:a17:90b:2dc8:b0:366:10f1:3d86 with SMTP id 98e67ed59e1d1-377aa799f69mr1529495a91.22.1781149991227;
        Wed, 10 Jun 2026 20:53:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377522a188asm910131a91.3.2026.06.10.20.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:53:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv4 05/15] dmaengine: fsldma: check dma_async_device_register() return value
Date: Wed, 10 Jun 2026 20:52:35 -0700
Message-ID: <20260611035245.13439-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611035245.13439-1-rosenp@gmail.com>
References: <20260611035245.13439-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return value of dma_async_device_register() in the probe
path and propagate errors instead of silently returning success.
Previously, a registration failure would cause a NULL pointer
dereference in list_del_rcu() during remove when
dma_async_device_unregister() tried to remove the device's
global_node from a list it was never added to.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 43d817f6ded1..3009e1531292 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1303,7 +1303,11 @@ static int fsldma_of_probe(struct platform_device *op)
 		goto out_free_fdev;
 	}
 
-	dma_async_device_register(&fdev->common);
+	err = dma_async_device_register(&fdev->common);
+	if (err) {
+		dev_err(fdev->dev, "unable to register DMA device\n");
+		goto out_free_fdev;
+	}
 	return 0;
 
 out_free_fdev:
-- 
2.54.0

