Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064932943C
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:32:19 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c47309a8ccso28297445ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403939; x=1696008739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+ctTEyoq7sOv+FAZHxESomcnOOr3ZQuAJoEIOqh0C4=;
        b=jXJO7+/1xLwHwxUEpVafDMZBjhLIi6u3vhY7qL3cmRsCKFhnkjJOVCA+zfejbUEX/O
         lIz/wvyaXAEX//74XfBGuGQoTetLu2rBSFO6UhSiIoLSg3FwwWZvcJLeszQiphpzJxVq
         YzEs6R9KxSwL1Vru6RmwrAyl0WRS+9UhhKV0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403939; x=1696008739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+ctTEyoq7sOv+FAZHxESomcnOOr3ZQuAJoEIOqh0C4=;
        b=bvHWrfuH/VC0tonzxqs9tJMv6lZuI/BbjHWwawKJeZKiOwcDyeLQ4DFHunVClqq+mz
         K7wjLn5oCNKzxt6s5me8roKfDrs0j5+/FZJVHxPpJG6+Q+tdNwZSz/8yNk8Ik4ZawRHu
         IFIGLg7Mh4Uzig0ll8VGpvJNiR4WwBEmEsIzASfux/lVjdH2Y2ETy4HJLR4fT+V3IEN1
         klBNx9vMQDX9CM85eD3Ymkj3DjnOI2hpPFPs3zFPZh4vb4Vn6fDL5OTG8x0Z7zvLg4jl
         ceDMBvsdAD/BxuDHg1qHxgoTosgbCPzVBYHoquw/ovRoCL+e86LEbGjnDp495O5vChtp
         mbjg==
X-Gm-Message-State: AOJu0Yzd1o0EkfBFFmVRUt2VvCN/fBV2wIEFJ07VL/h3QHR9wic5QnuP
	tjUowL35B68cBoLBEzuwcApRqw==
X-Google-Smtp-Source: AGHT+IGC6/6NdvEqz8he++fdJuEaamt9Op5nnYZ05uajn7JWoal4nRh6sAA+e6vH/dWEyyl5jl0kkA==
X-Received: by 2002:a17:903:32cf:b0:1c0:e87e:52ba with SMTP id i15-20020a17090332cf00b001c0e87e52bamr547482plr.2.1695403939425;
        Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001c57aac6e5esm3763379plx.23.2023.09.22.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:32:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Emma Anholt <emma@anholt.net>,
	Evan Quan <evan.quan@amd.com>,
	Xiaojian Du <Xiaojian.Du@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Kevin Wang <kevin1.wang@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	John Harrison <john.c.harrison@Intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zackr@vmware.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Melissa Wen <mwen@igalia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Le Ma <le.ma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	Lang Yu <Lang.Yu@amd.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
Date: Fri, 22 Sep 2023 10:32:07 -0700
Message-Id: <20230922173216.3823169-2-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428; i=keescook@chromium.org;
 h=from:subject; bh=i2UpbGfuADbvlbxlhkLDZa/xyj6FED75tdnO2fZlmjo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+dEehHl9nbm4bhCFwpbMmpO3Xxql5kFxhRj
 Diayf24WdaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PnQAKCRCJcvTf3G3A
 JvkkEACyRaaPJcAJJrT69OHPNJ7Sh8M7AKH2fzwSzceuPqxB6RysYYS6VR2iPdaDZg9zSS+vTbb
 fL60uv9o1ah81G8VJPhZppP9CtgmmA8a42Bpbs53luiTn/LGzycDXWPETOIgJGNsrJMgTFQyPMo
 241VVShLmM8kxtLnJkLOnDZEqzjh4lSZG5ygNcH9YpR0LH3S9yhYSaBm0oamf3UpID1Xs/g89RE
 2GjQlWgZzPdM7WCNcNNAIhK00fTWSD5DmnFGm50TziH8XWc8eGZZ2VknCk1GbO1UtJO7OW7lysZ
 dzxYyw9Eifo8NVwr14wp43rm0towIlCQv++/9z7OLpwblt6E0YNRNpTjv9DQV+xS5euSf4ETfjV
 IJ9vdSq6WjnidZkTBKdhROCuszJxRQ9b3HqXm169h7IYEdXvDeMvTQ2xgv9UwiFYpPlLImhrCYh
 r/oOkRSzfxf22LJvTsqX/WXIRpOCLm1gQa2ApJjyfzEXAegAaVehjC7856bxlgo+pE5tqm7PAvm
 JLb5hweD/O8L+7Tf7ij2oggZ9HmU2VGBIGVs0/EP7R6GeKLWO5KBBVa3/aADP01hJ2ZTfyjJsLl
 NqBiuVwLDZSWs6x18B1633XvJJtLwLIUg5eA8U/N4Q1qXUMezt3ySBuq4TSxO56Xod8iBUwzCfw TsBbpN+0JCLa/Ag==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ip_hw_instance.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index d1bc7b212520..be4c97a3d7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -662,7 +662,7 @@ struct ip_hw_instance {
 	u8  harvest;
 
 	int num_base_addresses;
-	u32 base_addr[];
+	u32 base_addr[] __counted_by(num_base_addresses);
 };
 
 struct ip_hw_id {
-- 
2.34.1

