Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108036;
	b=GTPHBKOEYrsMls4oBLQPTSnhKZ/k2yoL2uZy8wGt3DK0hYR+K8SciQPhaHG4KutTvitw
	 Vat+33eG4N4oNLOfT1BRtCo5ZnKrbQpNApQu0i/Kz4BfPmk1MP5RGgCxw6NAVOVgXi6GN
	 C0bxeOwFXTf15yD961uQkGjLb0PFCNy0UqLtDBDnO5EDiry603IlgJ07HrmUnMZ7FNY20
	 Wk1WmwQ+oXN0SyJsTmaBsPIvdagd/2Nd2LH1IU3ia4+pZ6MXyd/pY/tFYJk7nqYky+ang
	 VOu/fgVhGidw2Dcrqc4N2q74Ds8UrcLNvGCzjCMVIMEfhzLi5VJXxU8iiSVvJ7AW2ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
	b=KgGJR4O9GkWyurUzmr4DtGC+ZXi68AST5HoFoK6ORUFNdphqKuehqz2+tttJUdaRFJyR
	 41Msx1jOKFEPHebCPHUKfz5ngTc+NNW06SX1hHwpkg8lcxPGp9SW1av1mxYkIhB0aJyuC
	 wZlzKNnp1TDGHXHOKq+01QTTzT2hAwnMX8C3fJBZz/Tpfp/8Z0CWXS4lzSRmEIylQLaH2
	 yzDz09J1dlsahaiBpbEQn4GRlTTWP5DsAKzqJsVMBA+//EuYermeXN36LjiRPtQD0sH9w
	 NmcaTdG15ex9ZldFD97H845u8jzjm7FRIRUOBMfiKPqiyf7A5BeUbKqJisZiKsiCzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSxGuQWQ;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E4606A33E
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E7E4606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSxGuQWQ
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5384e381fbbso31703b6e.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108034; x=1795712834; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
        b=kSxGuQWQhcx4chPep6/fuQ4b9By7JIO3rokpjMwHPKkhb14YWHO3lF9eVKbE5YcK0s
         Pb6LKgQ52KW+cKCMIQbY6o82K43v4Cl2iIk/8Xmr/D44YjWFc2AFH99bREnDWgobKrP+
         np4QpVLNZDONCQDRqo2kwkIv3xX9cH/DeUGPAlx3t1pUErzwU0Rn1B2qNV3t16CxkIeX
         vVvaNUaZ2/XQKxGUKHeyS96OELXcgfEggqjBAYqCoeon0sMBPhmw1VNbM+fyMmg0j/7f
         6Ms6XPOZJYu1UUGK/KSxaRuA5G6i1jG172QjY2HpDt1XZiwqJh7tTpz44PqObPRUH5Mj
         z28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108034; x=1795712834;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
        b=1duVeazBVo+ko9bb1wnP96dqTC2v9fwZfUJnLhmskPDU+G08pxybDZ0u0BUSmBiOsU
         h/O+NEDV2tSFEqSh7qlbuXyrhGkKRJDANr53wN+NHes4sR1Xkh3amgPG3KHcYMAVo3Cm
         WLqXQjiOcVV5Enm+W5etRcUnjC90umf6rAkdBTRAP3qDY7NpXHWHr/HRdeOnvTUWvuov
         LWsLATwAzL6cQxr9GOcl+2WmW94HQGXL+AoEPHnqZQdp1ZGOWP2bAjjgZ7ANmt9LT0Rd
         A5ez8Ja2DByROy+/fbG9R+9uOWNxB1OztiNBZc5C1ikV3wzAUltfLXZE4TDcfh8w4Lky
         4Hkw==
X-Forwarded-Encrypted: i=1; AL+hErH5YdUEDoJocodj0okGqPq4PEBVpWjRFsXILL2lnzixpabDJJsNIGzUm0I9/iSnenKhNrHl@lists.linux.dev
X-Gm-Message-State: APuU4Z8z1bOpWOAF3aUkn3h+U/Cu3ekWI35gzaAlyUjmrdZgcMDGEh3C
	Rlqh7NYtAIkd7l9blYLBs/0RqIZpLMPRf4AE5cJTHUw9HHtn6VVDlvJpAwfUnY9jrNf+ZOAL98t
	B+y0+7qcM6A==
X-Received: from oibkf8.prod.google.com ([2002:a05:6808:4788:b0:4f2:da8a:16de])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3503:b0:4f5:eaac:5151
 with SMTP id 5614622812f47-57a0b0414a8mr598706b6e.39.1795108034097; Thu, 19
 Nov 2026 09:07:14 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:05 -0800
In-Reply-To: <cover.1795106955.git.irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106955.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <6fcb1e5c7545f8bcfee9ac9a3abd296c475aa1b7.1795106955.git.irogers@google.com>
Subject: [PATCH 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARED
set, every iteration of the cursor loop hits 'continue' without assigning
'r', returning uninitialized stack memory to amdgpu_bo_create().

Initialize 'r' to 0.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0f86777250fc..280fcdfb9cca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2675,7 +2675,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	bool vm_needs_flush = false;
-	int r;
+	int r = 0;
 
 	if (!entity)
 		return -EINVAL;
-- 
2.56.1.708.g77570a6a1d-goog

