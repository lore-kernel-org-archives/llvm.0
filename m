Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3575A15BB
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 07:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="252Jgaih"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d9a541b720aso5818697276.0
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 23:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701156270; x=1701761070; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8A55muWkSvzSnrtuE06G95D3EwTRR81H/qJIXehCNYE=;
        b=252JgaihApkBi4nN3wqxBXd0Km85cuJxZuzlnAZp+wplmGISqXv8oILjIhjskl1Ae2
         mdsJHR4UiCNIhHKKwoAUwvnpZbXKWxui55KVc2pB64Otr9GZKwG+dDnrzAy3YAI6dv6x
         TioXrmBR3jNB9NjJjJtop0ooWEV+mYTTMftWyTHVsYRD0egIzXIR/M3EjIEJLmRNQ5YH
         E2avy9WQRzoMA528Qf6kJG3htqMXcBQYBG0jVqtUC4cpbD/2i0sEqkCcdwC1ueQKoMs/
         G0iBZ+M+Vh/zNq37hMk+36Pl+QrQ9kpF93pam+WBlgC+4lpSKSNj1I9pO2lNBfbfPo8p
         dmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156270; x=1701761070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A55muWkSvzSnrtuE06G95D3EwTRR81H/qJIXehCNYE=;
        b=VmTp+YBIQhDsObC8J0dtcIOCPVNVafLeJ6SD++i4dsJT4tSb+geSmAxg10XUzrLT1l
         RIT61yx0SdNMWgSK2ua01Dk6CWtJemEzzz8roetyY8XzBPiLWKQCD8/wrEiyfvSE+eyw
         dW96QGie7Afgl0YDC7YR/wKJddjXoUWwdRKMFM/UNNe/5qbuNHEviySFiozC/lrmIeDF
         6aTaqWPmyQbhoh5faqWDzxp89JxCNPbM7MxuosAaKX/hnptyANtiSPJa9LJukxRqAfpA
         GCG+ArxvrflQarqr6dfDYHmJp8Fq8jiZgUIiW2wtafSiQfTkFp7UNxyaqN5MwlNJXJ7U
         PjRA==
X-Gm-Message-State: AOJu0YxN/IpqyA4EHTCT/VRzBjr55MlG4ldbYn3De8O5Wl1b0pfRFiws
	GomzMrdJISWOvi4ybhu+bAW1S1AACDQlwA==
X-Google-Smtp-Source: AGHT+IE7kvRypcJMNH1aBvRFoLiB9G1ImGLyl3WTQDpglv6t886iGoKBRHmMrlJFektQzH1GywC4p5ZQUuyHDQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:738c:0:b0:d90:e580:88e5 with SMTP id
 o134-20020a25738c000000b00d90e58088e5mr390789ybc.10.1701156270109; Mon, 27
 Nov 2023 23:24:30 -0800 (PST)
Date: Tue, 28 Nov 2023 15:24:06 +0800
In-Reply-To: <20231128072410.952662-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231128072410.952662-1-davidgow@google.com>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231128072410.952662-2-davidgow@google.com>
Subject: [PATCH v2 2/3] drm/tests: Use KUNIT_DEFINE_ACTION_WRAPPER()
From: David Gow <davidgow@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, dlatypov@google.com
Cc: David Gow <davidgow@google.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"

In order to pass functions to kunit_add_action(), they need to be of the
kunit_action_t type. While casting the function pointer can work, it
will break control-flow integrity.

drm_kunit_helpers already defines wrappers, but we now have a macro
which does this automatically. Using this greatly reduces the
boilerplate needed.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: David Gow <davidgow@google.com>
---

No changes since v1:
https://lore.kernel.org/linux-kselftest/20231110200830.1832556-2-davidgow@google.com/

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
2.43.0.rc1.413.gea7ed67945-goog

