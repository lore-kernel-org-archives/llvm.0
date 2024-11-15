Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 140ED10E3
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 02:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731637980; cv=none; b=OrvqXeBZjwddbP7cs43ytcEskx9KdAogLVaorEJX+FJrnXeV/uv5DvilL2vTt5b/jU82VPtghvxU9iQT5JU/fWNWzFw7YwkGeOgl16AfsDknOZbRBcMLY80OXeQJpzhpA54FJdtvTQb+/21X046+RD6y+flJeQ78vmKQu0YEnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731637980; c=relaxed/simple;
	bh=QbQ5UfyTZEJzQO34MWfS+X2qlDIJc6GDRUyFUdxypZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type; b=efM2ltbHvFXr+gY8P77/9lq0QAKgEQVTVrgb+Xr47iCujNsxL7osYqyEJvbgD9vqJYy6n3TC4btp+0fri1LaycFAsaFRgnoCCycJy75x2f+kX5paAzMje9RTG2RETRFQHeYzZGB+RzyK91dQG9mw/BYv0riRHvPc50f5mWVlwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id B2CF26018EEEC;
	Fri, 15 Nov 2024 10:32:49 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: stuyoder@gmail.com,
	laurentiu.tudor@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	dan.carpenter@linaro.org
Cc: Su Hui <suhui@nfschina.com>,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 1/2] bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
Date: Fri, 15 Nov 2024 10:32:06 +0800
Message-Id: <20241115023206.3722933-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241115023206.3722933-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang static checker(scan-build) warning：
drivers/bus/fsl-mc/fsl-mc-bus.c: line 909, column 2
Attempt to free released memory.

When 'obj_desc->type' == "dprc" and begin to free 'mc_bus' and 'mc_dev',
there is a double free problem because of 'mc_dev = &mc_bus->mc_dev'.
Add a judgment to fix this problem.

Fixes: a042fbed0290 ("staging: fsl-mc: simplify couple of deallocations")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - using is_fsl_mc_bus_dprc().  
 https://lore.kernel.org/all/20241114082751.3475110-1-suhui@nfschina.com/

 drivers/bus/fsl-mc/fsl-mc-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 930d8a3ba722..319a081a29ef 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -905,8 +905,10 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 
 error_cleanup_dev:
 	kfree(mc_dev->regions);
-	kfree(mc_bus);
-	kfree(mc_dev);
+	if (is_fsl_mc_bus_dprc(mc_dev))
+		kfree(mc_bus);
+	else
+		kfree(mc_dev);
 
 	return error;
 }
-- 
2.30.2

