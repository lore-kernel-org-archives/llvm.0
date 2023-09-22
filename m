Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8343690
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:42:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso20775035ad.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695404534; x=1696009334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDHDeV42Frwj7XYTpJqGl5ND8N8KbUFLGf1moqK0weE=;
        b=K0R1W/dLRELAiXDIdzVS4IChkbUmiJPOlsFAkL2KLTNHZl7yevYLTQduj0m6zqFwIu
         eUukQn6p1PJ5OLKtiSpGizsRr13vJ3x7UShNz9/enSaGUXjyRELFtYNwH5laS9X53II4
         0xHwsi9XfVAXMyJl58XQ4l3aeN3saVY8j/whk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404534; x=1696009334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDHDeV42Frwj7XYTpJqGl5ND8N8KbUFLGf1moqK0weE=;
        b=mLlj44AP5mUcjQ2nv7OuBJJOtkLAku3Onj8H5ibDOiRSJmYqa4gLIismGZ4vqYix/x
         6pxSv5TXOELn3BluGmWsbFNyZswlG+7bpR0z4waXCH3CfFZwD3jr/9XCJ3kx4/ITlGbn
         6qTsN8/r30OfVdBiW9KjrNacrscfufhAHm22/qrEJEjcU2f298FCtS3XN+rs1ubfzJZw
         a713II4v1eZq4keE2xek7K2paQlWxsN914vqvH2V1due47OiwR06+uwdDiZDqGgUowAk
         Ghq+wz9bYnRhTzC5n6gCY3hRWdNg+4dnLYYgECYRAAghf+IFS9ogUVQzSxd0pWhan9La
         7s4Q==
X-Gm-Message-State: AOJu0YxlimGc8vMgwb6JQWHo/g6jiylcoHEFiH4OvEUjq7ps8dT0t/KM
	uj5Po2o0KgB+sfM8F89ZZWIbuw==
X-Google-Smtp-Source: AGHT+IGrotoWlyQLkbK6Whf4OiNGUyhA4I63WbY8Ewuxyx3hCVqXIcaVt+Ft6DWt7mPQfxETuKi2Cg==
X-Received: by 2002:a17:902:f812:b0:1c5:6f3c:94fe with SMTP id ix18-20020a170902f81200b001c56f3c94femr128683plb.69.1695404533773;
        Fri, 22 Sep 2023 10:42:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902b78300b001bdd68b3f4bsm3751544pls.295.2023.09.22.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:42:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Emma Anholt <emma@anholt.net>,
	Melissa Wen <mwen@igalia.com>,
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
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zackr@vmware.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
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
Subject: [PATCH 9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
Date: Fri, 22 Sep 2023 10:32:14 -0700
Message-Id: <20230922173216.3823169-9-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=keescook@chromium.org;
 h=from:subject; bh=SnNIrp1FHi4lB0nFNYirvVw5/7/jvEw6i/lP/RJRA6A=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+e3L4G5PZF7SaBMxHwj62ZCFc4FzMHTqhT9
 tfDr8MgF6uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JnkWEACXtjUq16fS873Hx8yyB8djpvoH6XVS+/OuSPCo2t7GIoIpy1zBkPiH2Ei14JMNlHdMGGy
 8yOKrl1rGoQOP3jjY04cxJWy1h5uFFHAxW6VGYIBsbbFRIqAXuVC4UKEN+qYZ97MTJmwc0eHVdX
 Z441sTRctCLNHoMhSAQn6O3TWU2+/QOV8cz2Ls8cuKVLErRruCIa6OzHgGSnhC5Rq1OWXZyJNiQ
 1aWVoVn67WL0VqIe3RW1cZvMnlWNTbgZP1DUee1eLb7MmfT7XMLkW6Jz/8rTfAeSUSsLhxKbIcO
 ZpXIWrrfcefYP4Dz3BMU6z9OLUAHdpdLEnnvQyDviUPLmbRyS5mdJpKrC9XT7FTANcayQSTonRu
 M12CaA8ASNf3ak1iu7o4DhTMZeHyb2Wpz2kwj4Nyg6YzYpRNC2gtRkBRdxIJn60r90kd27Yxl7Y
 Hb+w/DnzIvunJlaIiKWIEE9lJfyZWF2fgi9gcXtI26HlMj/Jn9jmdHnLwh96IqxloMmooRdvULL
 NK01ICP7mB/XJ36KSBZv5ss3B5LUV9OwyC4T2xpvqKmG/iSr65/EUsg0AYInGQ5v0STKkN7TYFV
 abYOWvuq0o/pltuNX+Gpbsn9+VvBaxhF2CeSHtOP8ARhgkctRhQJ2+OhqQ35i3SIQBBSkeCOxlL 2y59f7fhlJo6LCg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct v3d_perfmon.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Emma Anholt <emma@anholt.net>
Cc: Melissa Wen <mwen@igalia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7f664a4b2a75..106454f28956 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -59,7 +59,7 @@ struct v3d_perfmon {
 	 * values can't be reset, but you can fake a reset by
 	 * destroying the perfmon and creating a new one.
 	 */
-	u64 values[];
+	u64 values[] __counted_by(ncounters);
 };
 
 struct v3d_dev {
-- 
2.34.1

