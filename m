Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AE41E45
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:32:18 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c434c33ec0so20759075ad.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695403938; x=1696008738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7mFLDUO5Hv4nuyIM6aHVjhOJF2f1Ccv+t7gCPQABb0=;
        b=U/KI5oXACpyl0zZScmXjbm6j394N9t1x5sYu3o1f664zysFTDh6iCp/V5bcyzsWIYr
         bAP4Sa37O0VCItHCRDDyoLy0VQDQhqNWhmFwZWMY44zckJS103NEsxmARuTZIiBIFTJH
         0moKbVGCt19RWXDwqOnPDw/9TLdt8c4kBnkMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695403938; x=1696008738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7mFLDUO5Hv4nuyIM6aHVjhOJF2f1Ccv+t7gCPQABb0=;
        b=S5BZZoIbEwetodR/7mA+4biAVrUFbcg4kn3/aSbGCllafIJOxwduNveC6NThZyYqs4
         7hxsHeeHHCvrWwRKY2VyysbDTe8v8QtpBW6jgmeLkZ9Q6BFYmngiV6S15qsz8LrS84fn
         1nvhc3SgiJ1Ma4RoXCOEFymItw/9rd0+iUa9VUUXSSOjjX8cpSAWNlhUVwaEXkuQOL9G
         wlggjimaZHowAdFnyIbSEjYPT3XyY0tvD4ezhHF+U0qY/WGlEB9ZbWKNDgoGYM0+wZVI
         jkpa49YqqNnIgPZS2DbvzO4bCscgyF4Lz8T4Ipn48hMgUKoLcfmzElYLK8AV/hPAfkuv
         RpzA==
X-Gm-Message-State: AOJu0Yz0a8U0R8sPJn+vVDVfliR8fkm/ZDnqlqOmK609tSAzods9s+ix
	nW36IfVcEunMu0dzB4UpD+vhew==
X-Google-Smtp-Source: AGHT+IE6F6K7CDwEaF3fHkMJFZDdCooH5rNl5USI0rssAlTS7mc8rdfuFtX4TpzsK8su4KRyBFD88Q==
X-Received: by 2002:a17:902:e847:b0:1b6:bced:1dc2 with SMTP id t7-20020a170902e84700b001b6bced1dc2mr224040plg.0.1695403938058;
        Fri, 22 Sep 2023 10:32:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jf2-20020a170903268200b001b8c6662094sm3752514plb.188.2023.09.22.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:32:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Xiaojian Du <Xiaojian.Du@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Kevin Wang <kevin1.wang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Emma Anholt <emma@anholt.net>,
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
Subject: [PATCH 1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
Date: Fri, 22 Sep 2023 10:32:06 -0700
Message-Id: <20230922173216.3823169-1-keescook@chromium.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=keescook@chromium.org;
 h=from:subject; bh=kCvC5X4RJuHaoweqFnQ9xMUwIDOFINcpTmqcFOUOp9g=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+dzQGoS9m8Q71IG/SluCNIy0Np4uBUNCXIF
 2oTBIaso6OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PnQAKCRCJcvTf3G3A
 JjY9EACkZXMo7wzxY4THEhXZJmkYixLA2UlloTPXgPy8CvMUYiNLBwVLSqoh/h/5MhgdgB+pVHX
 gjEPVRbNLsQ1sMYLw31nppSpdtNmrx+qI2Xv8/FCIrTsOHuBoHSi+9nwoY2LW7IEx8xVxDORb01
 i9WnFgRMl8JlxFCnGrKgYtrWpQVCGXMfpunpsPAAmh2g5Yfkoo8Yodegj0WGJdFnSQzp2irODLS
 4fzO25EG9TH3jtCwjZItDt5m0cT8oO2gC1LVyKm/WXFfllivnEC967z9zUAtQtABdtjhtosOPHC
 1jSJ119A0nTIyM6aLwtiK32qSZA2Of2ooijB8afmhRUb5Jb+iPKwLmRnvY+TycfX8U8VtGQBkbA
 PsbT82Qj4Qqirr4cuxGVW/oAnE7XDwMh8IEHMNP1n3XOmEtlx7TVlgUKL774++kkLb5/dO90oUm
 DGOwxoXK9G23PdRFLUZ82z/F0glCWWkDrqrmKUkcKnY7rdSxGYAapRKXY6YbnmQ3EA3hqkEBXtV
 Df/r+VTS0EiXZ6VrmE54NZ2HQTkIjn/3uMxtp2UVPqb2tn6zRXFLAI85C3NUtvV2TNniYKdU/mB
 V12ppntQS4AmfEbCBhZc3biSLzO4h5eErGTnBoeVzf8NDuINYiUgr2+IDcyvEE0XObVZcrukMxP e9S9RTOiaW+wWUw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct smu10_voltage_dependency_table.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
index 808e0ecbe1f0..42adc2a3dcbc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
@@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
 
 struct smu10_voltage_dependency_table {
 	uint32_t count;
-	struct smu10_clock_voltage_dependency_record entries[];
+	struct smu10_clock_voltage_dependency_record entries[] __counted_by(count);
 };
 
 struct smu10_clock_voltage_information {
-- 
2.34.1

