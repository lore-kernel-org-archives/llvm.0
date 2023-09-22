Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945524446B
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:19 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690bccb0d8aso2049400b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405259; x=1696010059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRKN2/xBrWvsqRPQDODOVPiV3fGRN8WGAkKDB21KTao=;
        b=PF+mJ4NCzcbMSUz0zU/2chtXxju9G7Q9hPWkFH7MoPq5BJFWiy5p7QgK7mWikS9JVc
         DSyCPsmAokz5yl1Wv05mthtMUWdLn70VHB2HmSSb0Jjn00Mi6PokTaHPPqik+Q749Q3U
         3N+QvsGhzJ50XxyZZ1FklVoqciBBpKJ/KLmRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405259; x=1696010059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRKN2/xBrWvsqRPQDODOVPiV3fGRN8WGAkKDB21KTao=;
        b=BwJLnGGNTeETPT1GKD5zSTJMVnEiwDvH8qcvgIMFziMI2Aslyh087Vq5cxb6M4PV0d
         1fTCnYHBiJqAv4Hho3F8bTJoL7VZNMQG8FO/FPWoZKVah2klU/If1ayc2XChB+8Ff+88
         PF7NuYdrvTMvoQKe7tpXhVUWRrCONIulIqgqt+B/MB0RrFiMBlsC2ghcaa7juOm/zdtz
         hCDLV9nTWVh8eEA4wQBg9zDiCK6Qs6I/UWb31e0Zq9v0pBFGd5COc877FmPWasiQY4CW
         uifEHyDGQUirv3XCk3BAo3veXtGn+7Cu0eUqEo2N5jb+8044NIdeXevcJne4HA5rXFEY
         OIHQ==
X-Gm-Message-State: AOJu0YwrT22QoUekkGf2/E8m1NKpcVR7rUVSaSTlYqi0XQ4LpGsfWp8i
	OC2YU9d8lBCg6RY2tMkUNafD2hOk6oW1BYoIX2c40Q==
X-Google-Smtp-Source: AGHT+IHaCKf2H2xl/vEMZDs+B2JWCIWeEjv/kL2lXURkoNqtvf0o9Oh8l386aSVv3+k7z5cEewn2EQ==
X-Received: by 2002:a05:6a20:7f91:b0:135:38b5:7e58 with SMTP id d17-20020a056a207f9100b0013538b57e58mr339189pzj.37.1695405258962;
        Fri, 22 Sep 2023 10:54:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id kb14-20020a170903338e00b001bb3beb2bc6sm3779500plb.65.2023.09.22.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:18 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] accel/ivpu: Annotate struct ivpu_job with __counted_by
Date: Fri, 22 Sep 2023 10:54:17 -0700
Message-Id: <20230922175416.work.272-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=keescook@chromium.org;
 h=from:subject:message-id; bh=m5lQ9Sc4/fHR/XZEOUiHgj1+UhlsVXVLOdUWy7uMxzY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTJ38ytmDtxaYz7ESHW4iJMEWaDISXcxNUPY
 fkE4hcFocOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UyQAKCRCJcvTf3G3A
 JvleD/4vxM9D+I+pVT/pVESSzmlw2BdKA8ww1Ze0HR9ifWWboneaUfZDM7gMmUqspaDaCL7H+g1
 Rn59P2QOYB61Ua67yMFGDFiUuQBLWULgd1+hbwV4iCPXLeeDtKF6KS2H13CtmCKui3/sfLZm2bb
 AkHVoh2LqFCxR8NejyT0txBBbE98UFkfbNFQQNg7vzNgFDdDP1XOzXL/ujf5ZQ3FZoryHa4Py53
 Ys46mRjWXc4AuqPpqMfIYAZDVvki6i5Rbox2zSFtRUDpkPf8cI63lIvws23RphDJutzGtV32jma
 ZtVA96fnHaAjIGOyC8Z8x3p06lYhtpUKpIUGHdb35Tc9T6j2oGdfHyvgeUXdNV8FfBvOsUs6Zvs
 xAHKumyqUUKvgP+MrI7ENxu/s4pST3zlfSU82orWyLgvis4FaeD7IZ7h7iIr/7L1CtowukN62UL
 YKBMNCIKulmCuOS2YmNefWgVp3lrwxBZPdkwOrrVwMtfjnyqRB+9jqt3BgtIgxEMhtJAyyHcrzi
 Nh9MKqcBUV0Mkc39kL+ed9pk7kHv67HEmvOPUeUSPr5hnKPfXCyzgJ6Dm8lrt3w6X6yQfhj7Z7F
 FZgjOe1Xd6JGHlvkbLkNyp+RHwdyr4ovCQzLTrPvdrWX49N4f2ID9UdrVZnPwPFQlD6cFKQ9lqg
 CfmV4zY GUVf7B9A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ivpu_job.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/accel/ivpu/ivpu_job.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_job.h b/drivers/accel/ivpu/ivpu_job.h
index aa1f0b9479b0..5514c2d8a609 100644
--- a/drivers/accel/ivpu/ivpu_job.h
+++ b/drivers/accel/ivpu/ivpu_job.h
@@ -51,7 +51,7 @@ struct ivpu_job {
 	u32 job_id;
 	u32 engine_idx;
 	size_t bo_count;
-	struct ivpu_bo *bos[];
+	struct ivpu_bo *bos[] __counted_by(bo_count);
 };
 
 int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
-- 
2.34.1

