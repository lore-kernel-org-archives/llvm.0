Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DC24C6C
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 18:53:52 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso9363099pjj.1
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 10:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McwjLSLaytCtK7tV2i/coh6cpneHZuWc7h/cZMMLVaQ=;
        b=qS5kgw9dlzff3cynK7hHxw9gR3U0R6hubv+YKcGJnsGj3VYm2oM+4O8weoW2p2sZyw
         c20WORhh8vLskTonGbwQkhF8S2qVv87wVcmcCnpfCuniNqBKPpM3SHHkZI1UBVKT3hdc
         /YYE0ThFOusvkuKpKTcnSmn257veUPiLnnl1YAaAZJfOWUdbvmQIunP9HnqoMI57Y1p3
         wrQfbe6PsnVJTG7l7cwGBJAlOs7W0U1A2yfEgqIt4vCTpNWdhS6rmjOn1/dRvj6lItI7
         5a4xFx3R6iXDH5namFQ8U8M1i30J62YRRSyRjFQ671TIwRe1D0dHHSvemmvCUID/eKhv
         rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McwjLSLaytCtK7tV2i/coh6cpneHZuWc7h/cZMMLVaQ=;
        b=MFEvcJ+wMUsQq2ibwnlBAYzkFVB9tQikYikn9fUGjcKjTSV+HhesXYDwyvlyJ18X8M
         F22M/FWNxgaTSXuUYWP4digi4pOLtlIb52FU2qXSHw7Mzmnx/AmwCSmCyIRIp06fyvQP
         SmUbYpTkzFy3khM2goG3/dwfMwTBYjXEVuD88yhFCVHPtkZlc0uZNzNrTkNaJ/wgBEyF
         UK2+qEgqbX2ee+hCLtJ5XcLK37zDWQwXNpaRv7E4TL5Mzx3j1rpgxuF4Rr3lQ/TvWg3L
         ZHTiKCxCpJTCHM/ZMPEri3ld66bEx3ixYADUC3FPqyc9GlpGIPgb0WCe2QVL6eWdt0dZ
         cFLA==
X-Gm-Message-State: AOAM530kABMSbrBvnAwm3LPit2HNR7HZAUNZpsG6gf/jDDMj9UCugNve
	a7GdGk85GkZnbfWZJjzkOt0=
X-Google-Smtp-Source: ABdhPJzQQSZPxtLkIpcflnhLn+ubFoe7B07qM/ToZ1Aq0GEshzZY7TCT7UmLcClTvTCsiaUJa7UVgQ==
X-Received: by 2002:a17:902:da82:b0:14d:c6d8:822f with SMTP id j2-20020a170902da8200b0014dc6d8822fmr8509644plx.55.1645210432081;
        Fri, 18 Feb 2022 10:53:52 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9005:88cd:7443:8052:dc37:e678])
        by smtp.gmail.com with ESMTPSA id p2sm125106pjo.38.2022.02.18.10.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 10:53:51 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	desaulniers@google.com,
	Felix.Kuehling@amd.com,
	Oak.Zeng@amd.com,
	nirmoy.das@amd.com,
	jonathan.kim@amd.com,
	kevin1.wang@amd.com,
	tzimmermann@suse.de,
	Philip.Yang@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/amdgpu: Initialize value of r in amdgpu_fill_buffer()
Date: Sat, 19 Feb 2022 00:23:12 +0530
Message-Id: <20220218185312.34464-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot reported warning ->
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2129:2: warning: Undefined
or garbage value returned to caller [clang-analyzer-core.
uninitialized.UndefReturn]

Initialize r inside amdgpu_fill_buffer().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 414a22dddc78..5fafb223177f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2089,7 +2089,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
-	int r;
+	int r = 0;
 
 	if (!adev->mman.buffer_funcs_enabled) {
 		DRM_ERROR("Trying to clear memory with ring turned off.\n");
-- 
2.25.1

