Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED1D43682
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:32:20 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690bc3f82a7so2327103b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403940; x=1696008740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q96X+e6e2GphA8WEKNidppfkY54O3UO5SgYggFHsXis=;
        b=oZ+fIsddi0AC5pAbEtx2uwMvHgYk60uM3X9H2pWpuVL5IrYu7DcAU2Y4aGfujE6C5N
         1M0GbRZ8VhziAQE2ANkGMxMszRw2Tb2jb8wfGhpMUW3EL/fBR3rtKtuMeWK5Uq/17w52
         5T/Fag7OxgAY0ln3hGR7khzA/XY4lReg1w8zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403940; x=1696008740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q96X+e6e2GphA8WEKNidppfkY54O3UO5SgYggFHsXis=;
        b=ENwEe6ytCWf1/zJ7KAKjtf4M4RP9HMVb4mwsA9C/E3WBYJX3x/9kICHSXtQLDQPCce
         OE7E7VMsRsV8vpp1pDzsHTFnGT7XG4rjO3UjGl5mepGnVc/fBcM45UQIIsL31Yx5bYXU
         /OR94G6NEQGHjK2XUqMQSLT0LX5Gyv/72DniwbxsXijhiaADxOCdgvAaylmbuVWvlP9l
         6lBh8VJTVvcwStk3rETx1ni3vJW+FxgHhjITqsfKDmb0F2G6W8kJDqVMFa0nu8ASnLC/
         1S0zJpHWsOdlfUd2/j1GFrZRo0RylJZD4f4OpJonhDt2D6R55EhQd0lbeZ6GHdv2l6hW
         4BGw==
X-Gm-Message-State: AOJu0YwMOv6VR5ysfvkJjILqLIkWdM1pmwyboMdyH34i822HipLioHne
	Y+oTqkpdTZKLfquExSaoZoT7zg==
X-Google-Smtp-Source: AGHT+IGXr1Sat+m9Td0MGaNcSAWB3dRra4hS8nmW8pMNrVJgFfBDLEWjUeK3DqEHM0m4IjyMLEfwlA==
X-Received: by 2002:a05:6a20:9756:b0:14d:9bd1:6361 with SMTP id hs22-20020a056a20975600b0014d9bd16361mr200432pzc.11.1695403939966;
        Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u74-20020a63794d000000b00565e2ad12e5sm3318350pgc.91.2023.09.22.10.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	John Harrison <john.c.harrison@Intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Emma Anholt <emma@anholt.net>,
	Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Xiaojian Du <Xiaojian.Du@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Kevin Wang <kevin1.wang@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
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
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
Date: Fri, 22 Sep 2023 10:32:08 -0700
Message-Id: <20230922173216.3823169-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=keescook@chromium.org;
 h=from:subject; bh=SbNV7tt6Hho3aemFjM+WsFyDqpMFvSNtroJg7EF/6LY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+e99M+BFyGmat9Yjgpanw6UekhSMQhhAVfe
 PzecbdVf2uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JhPmD/oDoTfSn61jeN+hZ6qtbqMVL0umbxgqdZnXY/WBbLuBKV20tcaMAcUgkDgD7IZTf9vLT7N
 QvsK/I3NzdeyXN9KRjg9P26c5TGRnuFhT5ow/Mmpjw2ZfwY/adYsynGhgMsY1zCzocr9Klih2M5
 ONqETCgHopA10PwXUTZcfeylbqK62rRaYAWtkuoi0RcYjB0ba0MiguwtlB6nrG6fwv2owEKE9yZ
 q2M6NVTsjfrdnESUtkpr+ZQMSdTP4DYj6WZCs8PEing/sqS9G43U/93adZtoUdXHfx6OIvtf4kR
 QVJDI5f2FtS/OLpfsJPETvUFATNLl9zt+qYEEI6Xo/nwVAIDi10lef4gFjjLtPRlK+1R5w0hwDl
 vKJUW0WgT4cnNhXnSosMUxrlYOzDiiFUv22K7MRCjwllhPuoEqIvmEu2skXTbfOi++COJZQENGW
 mjr4E/cj8Pue9+KM7OxnSvfWccW9jLZfobZ+Mt3QO0uwzIKFw3tbN6roSBWKQjPzGVWZBhoB7P/
 YBx8LyLPlIme4RIAinnRTvKcRBVmPKq0z5qb+ZrfdbS5SyUax0buA8IufSmAFbFNMVWiehiR7kj
 m3qIzz42RIlit5ahExdpEPXkGeqqxLI86EouMV1p14sfdA6bPnL2FdLAyVYLHh92VJ7BRKvGmB7 gVsy2dUkMQ94AOw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct perf_series.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: John Harrison <john.c.harrison@Intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index a9b79888c193..acae30a04a94 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -1924,7 +1924,7 @@ struct perf_stats {
 struct perf_series {
 	struct drm_i915_private *i915;
 	unsigned int nengines;
-	struct intel_context *ce[];
+	struct intel_context *ce[] __counted_by(nengines);
 };
 
 static int cmp_u32(const void *A, const void *B)
-- 
2.34.1

