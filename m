Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38653B7AF
	for <llvm@lists.linux.dev>; Fri, 10 Nov 2023 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0mloQDIa"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a7cf717bacso33891217b3.1
        for <llvm@lists.linux.dev>; Fri, 10 Nov 2023 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699646923; x=1700251723; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=51fJBfx3imxlXxpJCLaVZXz5cvn77oR86IbzpiZXKNs=;
        b=0mloQDIajvy6bP2W7dxoM+cpYwlAtACpNv1Y0q4WeLj/A0Jl9sc5J8ZOZNP986IMOO
         ZfxtK4inqB8mNkfXol5LfktSKmAj/TeYxCob3Yj3bCKOhRc2hk4oXl3Rh/XW1f9ixvuT
         1k6KKOne83/CulgCW8HNoKU3A+dY71HRWIXmLZIDGOcwEcLKoSX6mS4MDQjI5etDjbW4
         6B5Oa4D/asC1c2GLPDf0a2hV49tCd/C7AQysqPP48Yshr7ew7NQwtXxWal/9I1cC/tDD
         Z+kgFtk5KbUBaiMWR4Sr4Mbyk6PTUswA42YNuSCVS2Sr1CwPaBG2xQojVXbJvpf28DwH
         9eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699646923; x=1700251723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=51fJBfx3imxlXxpJCLaVZXz5cvn77oR86IbzpiZXKNs=;
        b=Zn08KGOv3Q3gcBKc0FFcVIG3839+5fvLCAnv/lKCYppio0eu0QICeMBY2aIcKdaGTt
         HbDzh3PWsEO2AtPDcySdW7KeVSe6AC6aHFk1eaLx36q4bO5esHuZRq7TrGPldsQcFzh/
         2Akfge2UzZP9x4R3+iRJOrTtFNLaZaPYaV8q/UYuYYHu2VTJAS2QF27azQqFftd+6vMY
         9j5jTZwOYafcJKTADPNSe/aNeGSh1MLhZzKEuxKg14N7UwEkVpDMtQRuqCrRoh0SM7kV
         RWowZOVfkQLNkhlg0XZijHIroe2xeFYkNszj4bu8wAC7ZBMSb520pSZyvr7SiGvYAPMj
         GsGw==
X-Gm-Message-State: AOJu0Yw0ng2/Pq83Lmy7segh5eO3OD0+yeG/YN7JiTfUKsz1wlEiU8X1
	VD43839fpQXJWk+1oKRGOaoMIJHhSxvJyQ==
X-Google-Smtp-Source: AGHT+IGDK07iaPg+g9N2kLo9bN2a5OkVBolpHXkG2QTgPQJFeKS5zwURLPQj7RWzYTJuEXCxK3CW75e1iydlNQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:182:b0:d9a:ec95:9687 with SMTP
 id t2-20020a056902018200b00d9aec959687mr3348ybh.11.1699646922890; Fri, 10 Nov
 2023 12:08:42 -0800 (PST)
Date: Sat, 11 Nov 2023 04:08:27 +0800
In-Reply-To: <20231110200830.1832556-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231110200830.1832556-2-davidgow@google.com>
Subject: [PATCH 2/3] drm/tests: Use KUNIT_DEFINE_ACTION_WRAPPER()
From: David Gow <davidgow@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, dlatypov@google.com, 
	Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <davidgow@google.com>, 
	"=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mairacanal@riseup.net>, Sami Tolvanen <samitolvanen@google.com>, 
	kunit-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Benjamin Berg <benjamin.berg@intel.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

In order to pass functions to kunit_add_action(), they need to be of the
kunit_action_t type. While casting the function pointer can work, it
will break control-flow integrity.

drm_kunit_helpers already defines wrappers, but we now have a macro
which does this automatically. Using this greatly reduces the
boilerplate needed.

Signed-off-by: David Gow <davidgow@google.com>
---

This patch should be a no-op, just moving to use a standard macro to
implement these wrappers rather than hand-coding them.

Let me know if you'd prefer to take these in separately via the drm
trees, or if you're okay with having this whole series go via
kselftest/kunit.

Cheers,
-- David

---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 30 +++++++----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index bccb33b900f3..c251e6b34de0 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -27,27 +27,15 @@ static struct platform_driver fake_platform_driver = {
 	},
 };
 
-static void kunit_action_platform_driver_unregister(void *ptr)
-{
-	struct platform_driver *drv = ptr;
-
-	platform_driver_unregister(drv);
-
-}
-
-static void kunit_action_platform_device_put(void *ptr)
-{
-	struct platform_device *pdev = ptr;
-
-	platform_device_put(pdev);
-}
-
-static void kunit_action_platform_device_del(void *ptr)
-{
-	struct platform_device *pdev = ptr;
-
-	platform_device_del(pdev);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_driver_unregister,
+			    platform_driver_unregister,
+			    struct platform_driver *);
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_put,
+			    platform_device_put,
+			    struct platform_device *);
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_platform_device_del,
+			    platform_device_del,
+			    struct platform_device *);
 
 /**
  * drm_kunit_helper_alloc_device - Allocate a mock device for a KUnit test
-- 
2.42.0.869.gea05f2083d-goog

