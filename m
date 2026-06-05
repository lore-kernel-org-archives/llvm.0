Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4D13D331A
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 22:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696918; cv=none; b=YDn1i8OFCOJ9tTmWEGqzsSUEpLuWrK7FuwBZEb9R6LWNC7x7e2DLCIyoqjPIFS6NAp43xfUgNh41aWElqGKYiVhzQtTGyIcRVJVsm2eHB3rgoLflONT9savRd9yWz2Ykg4XE12s6y0JfRShsYf/m67HMJH6fX4Iyy1Mx6AxEvnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696918; c=relaxed/simple;
	bh=dv4UoT3DiDLV5e+jIsTNR9SdROP2j8QTT16qF0sniOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BXun7vAlsKgbKUPdIvmHlY1xNxKZGfOwSSaNeR6DA5OCgLIwRabYguCShc48dF/2d0hPNAUo7n0H9mR48uSXm4jM9VlZesp6B2tiuDycjnxf4nAIpiLlaEz5mYmsxUHe5oJVwLoG2Ua64As/EmyB9uFph4B7EutIxREt539bvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sw8qC2F5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sw8qC2F5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84236f9b638so1129373b3a.2
        for <llvm@lists.linux.dev>; Fri, 05 Jun 2026 15:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696916; x=1781301716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5mTbmbGFqfQuWANwj/hsm3FmxeOXZxoynp4ibqSmkc=;
        b=sw8qC2F5MhKzwHNsTRgRJO+4chSBM9muxdqdB21K+sBZ25SZQ3340XgfBFWV27LtTt
         lm61WAse9iDidSgtDk/7N8Pt6WAt6PdRVZ1zh8KVJJjN5SFJVwYWQnjv3vjkfA4ykuAi
         bv84mkV9haOHyVsO+H8bJHaWF+T0AN0NGTB8JlfpbHXCnXHztY+bE2Fwc4WlrXX56Lt6
         l2jW/a+ZXBqESSHtuxOS8BelMDTsA7VCorvmoqq3KcJ1JMmclGgWbib7rqnlwTtth/zP
         AEmkos/iYpEd2JfD2g+FBmHX5cjd7ecAvn3odZtDA3c6aUCrSIVKI58l1ixWAI7fcEOB
         Plwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696916; x=1781301716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+5mTbmbGFqfQuWANwj/hsm3FmxeOXZxoynp4ibqSmkc=;
        b=MxOs4BbHgdyltDiNylDeWiNTkHI5upFMwys0jBcfiCuJ25jnLKsMtdGcfXkxgZuF38
         kgltarcsJqGCwLpEs34+jc3ty4mLXu1+o8acFArAGW9A8XMfwTP3kBS7sAuiBQOoEnrl
         5ydQQnWIG5Qat5r5Bw+jrttajtAc1r7YHIZ6XHYHCAmQlTtHXqli5Ya+n1poZVuO8T7W
         A73s102byX/gvMT1jcSwBdbyjpJGb1MZstB83neHiJGd3FeZQALRVOZouL71ogRf0Ku0
         g6p4RdQyVRO2H68gvhDmDZHnvAA7Fz6yyjUGasIux7pdPw3qVo+kVPEhH9ac6i/E9NWu
         UEWg==
X-Forwarded-Encrypted: i=1; AFNElJ8fsIWZcNYP89PV3GnZGkpplCYdahmxOy+rT5CzytdtQJJMSyzfzCTbPuGiMxfM1+Eh7QG8@lists.linux.dev
X-Gm-Message-State: AOJu0YxdwXNeeX02v40ao16Xr+1r9ZCiAs7wjbw2QT8ZHN5C2bfeeftH
	bi0BBRakYxXrlC2f59iDcdcJE+0RhDldfBdZ3mTeZIr40iOGeGk8IN5jwEkK4g==
X-Gm-Gg: Acq92OErQyFFN3vV62g0vBYjCf+aKdha6wZYOFPcpAcm9Cx1CNpP1Req977cYOF3XmU
	7CgxX4Ot09xvmAFnAAHrImnfOCQDI/fvN8wh3pm6qoCRR4aQt8iFxakqST2RyZgQBJQ5ounsl4g
	LJpXeZX1rcWlcJ4BCDdLQ+gOy3nBc8WIyNK6YaqKqVsqa8xMU9eZ7XVLhKkiRojRwlXqSwF8DyA
	IAE4lal5zEtxE9a+cm5+RrJhueiA8l3edY6whT8HASYuVnStmFi14sBelHkkOdg6wKj4Qzaeaet
	0xWl92/Pa2bzO7JzPwG9UkvHYeAapYBrfrnuBixfznuQrNciNKyOyLJmJjE+zlnEroNynCWiHMA
	TPHcXwvfaHDHOVbeIihkAIJlyqUgwwItNELkAaPskH/0s+79OGFfEPwxTR17jX+VxMr8jF3LZY8
	6DtCxJRcnxd4mfUlo/3fLy0FSLcU6yEKQlH1gBLfuHntjyXfqPiYnAkRg1FcIkqjbq5+xcTdHsW
	MJ3R/5qAG7j2ykjIXZbiV/SnQKWiFkZ7qDbF7vkS69hJqXVNu1veDgZ
X-Received: by 2002:a05:6a00:3692:b0:842:5da3:9b84 with SMTP id d2e1a72fcca58-842b0fb2843mr5346862b3a.34.1780696916252;
        Fri, 05 Jun 2026 15:01:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:55 -0700 (PDT)
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
Subject: [PATCH 02/10] dmaengine: fsldma: check dma_async_device_register() return value
Date: Fri,  5 Jun 2026 15:01:26 -0700
Message-ID: <20260605220134.43295-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605220134.43295-1-rosenp@gmail.com>
References: <20260605220134.43295-1-rosenp@gmail.com>
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
index 0e2f84862261..89b88447be1b 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1293,7 +1293,11 @@ static int fsldma_of_probe(struct platform_device *op)
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

