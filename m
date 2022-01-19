Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F3168
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 22:46:30 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso17708473wmj.2
        for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 14:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dozCW/4nG3udLwOhRUS1K5kLFfVXF4cNdQjF1vkmvlo=;
        b=eTuSHohyTQB9Bmao7dqcPpa5iKgzaCjRBmINJezn9uUIsQIY4xO+7pmWpTVF4wcLIG
         gJPXwv1OyMMCfBpUj3UrZY4ymzGYu8uV2D+/V4rKdRa1tf2kSDeSAPHIhrbq3GEkyV/7
         C3v8D1BvXLf9U8Y8NdhEF5iNRuFqvH1l5RVHHLHoyJgogkZtBpV9PDF6+AeUMZovg6/2
         ruYB4kiA9sXp+gcvkbgN4aAXJbtYldRjVg3Ajg9nVpI5yw2rPc0necow6Xz3WD5D9hXi
         /UoIXE4A+U9vwKr8XaOIB+wRLsKWr9PzhocGZQrqTgWc4YTeI1xNTRZn+Ie5sofugWDE
         GFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dozCW/4nG3udLwOhRUS1K5kLFfVXF4cNdQjF1vkmvlo=;
        b=0lVYTq2cAkJBmr33/aUMek8CdxUG+w2vDpaKT3eJHVv1DzIqA9zuUpOyQ8Q2GQ93uy
         gTerG8AqVbRfytpr6/4eChy4KCRMCRJPCvweF9WBLuk2N8WLpRHFuIMIpIo7uK0hmJnX
         WfnX8HKhopSkXMPPuEok7U4dBT5nmQwSy1V6dfELLiJx8mV/cP03YeB4rwL8v0NqnWL7
         bIG0ZK16iD6FKwa4S8sP5D++vuUCV+Zvxo/EMKzGCR/CPBeyui/MHsplFlsj/5cDdJBt
         sgC1OOFPr9vXgVHZuSGNuiRCgdMNY4LGfOGf8AXbVjPCfaQNvRs++/FfOEzNGH95KHdV
         bexA==
X-Gm-Message-State: AOAM5306MESnyEapMylHu63r60CSBM8qeoVygsds0Vc+CevBVf2JWy/9
	8g2YirDndBuenaNMy68cSeA=
X-Google-Smtp-Source: ABdhPJxOGEhjagNWyMQplUIULkMwQHFIt60zMdvuUb+Ib7Lu3QRBbFO1q1Qqx/xdRqaQeI+pXzRlvQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr4298033wmh.170.1642632389084;
        Wed, 19 Jan 2022 14:46:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t17sm1109531wrs.10.2022.01.19.14.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 14:46:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui.Pan@amd.com,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/radeon: remove redundant assignment to reg
Date: Wed, 19 Jan 2022 22:46:28 +0000
Message-Id: <20220119224628.123084-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer reg is being assigned a value that is not read, the
exit path via label 'out' never accesses it. The assignment is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/gpu/drm/radeon/radeon_object.c:570:3: warning: Value
stored to 'reg' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 56ede9d63b12..87536d205593 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -567,7 +567,6 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
 		return 0;
 
 	if (bo->surface_reg >= 0) {
-		reg = &rdev->surface_regs[bo->surface_reg];
 		i = bo->surface_reg;
 		goto out;
 	}
-- 
2.33.1

