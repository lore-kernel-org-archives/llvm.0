Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401B62943C
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:32:24 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c1ff5b741cso22793525ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403943; x=1696008743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+TspM6FqnyWCQqgdT3WqLoCMBUMYLUrvB7POKzIF40=;
        b=HODtsO9eFpdwDXzf/Zn/x+uzg5IM3plsXz9Xcd9CQhTn3HuwJJn9u4CiTDoNvwb5Du
         tUIFkaEm0YV/e72rZcCzrII5SvEZACT55oOkbFZXvhXHKIbbO4yvf5p38uuYIIgORuer
         aTC+hqZP13GRiiY/xkhuvzJMmxCIQzbyTOlDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403943; x=1696008743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+TspM6FqnyWCQqgdT3WqLoCMBUMYLUrvB7POKzIF40=;
        b=H7+yWbkNRey7w3Qxo87FxYYeOXkp/wtk6Z2AsH1R2fbRn3bBLG0uoE/XNwgZf06lhB
         bTwO2JvxV4ce7o9PUcQIhAIKtIS1by5oFUjmJJNx8WgVvLoVzzJ8sGmMDoI/ttJFf3Gp
         suYbsu7ThO0ES/EBhEiv4B7zU7rYVDHT3hOQy7leop5zil8LKNqqLt9tnZQwBaTq6XvC
         OxHZH6EppkE17q8LTZiY7CbiNJT2j9cViHAu4w6kOedLwZHertAYM9WMk2WH89ROYjrc
         IifZst5zQ+ndxzNrE2Ha5ygedC6pWJ0yvpClKO7ea6l/AaBEkaTILHIgORfyt1Gc9acB
         HisQ==
X-Gm-Message-State: AOJu0YwAnSwt7+S5W7Jav39fzFI1P4A5e+XtHkUmF+Q2RMPQZXu2oBy2
	29AQnFLKnqmwWAtfhOjAZ4Vdlw==
X-Google-Smtp-Source: AGHT+IGM2cgwn42K1WN8W9Zq/dfNXRG8PNtjzN+GwImGnEoLu2Sgi5BNiv1fIm5lYau2SjWWAldPQg==
X-Received: by 2002:a17:90a:2a4a:b0:26d:2bac:a0bb with SMTP id d10-20020a17090a2a4a00b0026d2baca0bbmr347669pjg.6.1695403943655;
        Fri, 22 Sep 2023 10:32:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id gq7-20020a17090b104700b0025bd4db25f0sm3547696pjb.53.2023.09.22.10.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Xiaojian Du <Xiaojian.Du@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Kevin Wang <kevin1.wang@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
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
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
Date: Fri, 22 Sep 2023 10:32:11 -0700
Message-Id: <20230922173216.3823169-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1277; i=keescook@chromium.org;
 h=from:subject; bh=4ERTESaqnYz8ImDqyHPyzXy0AuquVom9vq+hq0gy89g=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+eg2zdwhFFl6K23RVdCG+VU9OV+t2/BviGN
 QnAc1heAtyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JvO0D/4+c0QkeKEEEd/HWEG0VvFv4kIlOeqfDMOPwJ1QkN1jVwlbiQVdn9lWjRgUq77jqzdpagc
 0e9qirU7jL0cbTe+JOBsFEQkZYwnIV0EUxV5Wb9g3csLF1vPRQafhR8984UzEKRtulAS9kQTSMT
 xYBkkYy+pbMJZNux38iCGgJFdWD057RPEazeM0Aatd5kaNk0HGNFRG/lz7HPcD9XIged7BCjFe4
 O5fJlM/WnYAAAK2cZn9AtONFzhR65gyQwb4pt0CXxC/kBS6pb6GBT8V9AsVWH8zu6CsMIVjafAT
 OdJEF/tJGI7jp48gN51zXgv1VAdOAJOLBc/kciYavjyryrGgXYANueMuiXx+r42kxUG0yZkO3/X
 uq+N33+UiId1hMftODv6WGPcCbwFJtgAfev1bfSRgKYiKQyjWPcbW5NPGeYVKKsvsew1qqGZWpN
 ASd96EwnB4kIHBeIp1k14aTdlgBVRePuuE2Vrf/gjb9uTNMh605/Yq2hNu83sG0S0fKskR2pH6r
 /VbQ9GYa6Dm3r4bYE6S0RRzMROjl3MXFBv4R99QF1UUF4V4iGgkcUUE3tdB+iCxIW1I5SuGR620
 4ajKmF3Z9xPkw56NlVdKBjnhCKGSlHNQv+Rh5xh0IeFJzR6f8SO8/u45ADDZHCkCqxoc7tiLP68 zupfltyyH8r66bw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct vc4_perfmon.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index bf66499765fb..ab61e96e7e14 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -76,7 +76,7 @@ struct vc4_perfmon {
 	 * Note that counter values can't be reset, but you can fake a reset by
 	 * destroying the perfmon and creating a new one.
 	 */
-	u64 counters[];
+	u64 counters[] __counted_by(ncounters);
 };
 
 struct vc4_dev {
-- 
2.34.1

