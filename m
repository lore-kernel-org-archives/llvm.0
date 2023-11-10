Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1373620323
	for <llvm@lists.linux.dev>; Fri, 10 Nov 2023 20:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dw8pjKCV"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-da07b5e6f75so2849247276.0
        for <llvm@lists.linux.dev>; Fri, 10 Nov 2023 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699646927; x=1700251727; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IAkJ89LUqtxG0K+MSJnco+XQD27u+TKLaVoOcPh4bOc=;
        b=Dw8pjKCV1Rab3I9zJrnrsXdSmc8SXxy5bQhV5xVuI+/KkRgkexd2/RBYQKB9zjENJy
         TfgI1tCG1xK+0z0eMUMgNevE53RPvHAi5CAIIwcTlrVcBTbEWeGC06uXK575KZGQp8rL
         QpOJJGjWc5oV2yTT6gEUd3iMGsS9wU443pI9IU4xSzYiZTXbewIyutFB8t3sba5FZR0Q
         ukPLemAugOtD0PyO3lOZh4R5N/YrqhxtlzYPRYrc5x++Gkbd8qO1yN79PxUies/cO0DE
         IfJfJycv2+GVbVqse+Lj6eDlfECDuJMWk2fdYtLg46imC2JJTZkQy3nEDveuaBa9dEWi
         RX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699646927; x=1700251727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAkJ89LUqtxG0K+MSJnco+XQD27u+TKLaVoOcPh4bOc=;
        b=j1dbM4OBDpNci7Riz/ZYHeaJy6SxcO/qAIjSFQW3kPRqfJ+3VoZ8Q5I5l0FdRELdfe
         sPfecM0c0ouYhLB9znVZ+CpPemD0CKSEzpV2iJzfhn33iDZCM7ySHzwo8gMgeCnEPIaz
         2wdRP1ZGScwC7PKuOrfFXdgW44R2F4IrLMXT/qC6mkmFjmwbYbAUVNgZHm1ZgLNX9k6a
         sVh/IW7hbSTskerZ0rtgvoNR7ZkiPIJA9CevIxE2FTXxW+oDcIO6Tg93E0Cy+yGzNRak
         h6epGtVmhws8mKPLMtrPRl9/VPfMoxI21JSPA6oUOe9nf0mb3n1fPHaRZ7OEbQYQIgrG
         2o2Q==
X-Gm-Message-State: AOJu0Yxbuul1ELdx78/oS4J9PNEJ/Jbw+S9eAQ84ByxK9eXMWlKMVRO6
	8yKkkyAHZEsQWkaP0Fw8cjWddzN9UhVw8w==
X-Google-Smtp-Source: AGHT+IG2qICxw/Ih6W1d00Yw7wl6gZh00iMH2vxhyvW4HtVTUR9T6SIeeV3AzuFmY7j3gx/bERyrecNPMvP5+g==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:18d:b0:d89:42d7:e72d with SMTP
 id t13-20020a056902018d00b00d8942d7e72dmr141489ybh.3.1699646927074; Fri, 10
 Nov 2023 12:08:47 -0800 (PST)
Date: Sat, 11 Nov 2023 04:08:28 +0800
In-Reply-To: <20231110200830.1832556-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231110200830.1832556-3-davidgow@google.com>
Subject: [PATCH 3/3] drm/vc4: tests: Use KUNIT_DEFINE_ACTION_WRAPPER
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

vc4_mock already defines such a wrapper for drm_dev_unregister(), but it
involves less boilerplate to use the new macro, so replace the manual
implementation.

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
 drivers/gpu/drm/vc4/tests/vc4_mock.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 63ca46f4cb35..becb3dbaa548 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -153,12 +153,9 @@ static int __build_mock(struct kunit *test, struct drm_device *drm,
 	return 0;
 }
 
-static void kunit_action_drm_dev_unregister(void *ptr)
-{
-	struct drm_device *drm = ptr;
-
-	drm_dev_unregister(drm);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_drm_dev_unregister,
+			    drm_dev_unregister,
+			    struct drm_device *);
 
 static struct vc4_dev *__mock_device(struct kunit *test, bool is_vc5)
 {
-- 
2.42.0.869.gea05f2083d-goog

