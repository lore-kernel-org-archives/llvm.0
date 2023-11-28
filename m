Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A19134A0
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sv0dW4Q9"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db410931c23so6274588276.2
        for <llvm@lists.linux.dev>; Mon, 27 Nov 2023 23:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701156274; x=1701761074; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hL9Tqag7AJX6zAdbbkbaDwLX0iVjHOEY+HYssYNlBSs=;
        b=sv0dW4Q9ASYjQi8fGEQRT6e2TCn5E1LXlR7js7cOTeGhLQII31V8X1ZqWPwiZjBCNf
         kxDXjwewFoHa7JnJMW892yjL+ZU9QaHRnCq0r/LtivsXHdlXELQySi3fmfr5AIA+c+pO
         sMB9Q51+DocPNyuy+coGItoiTY4Af23lBr1Ho7wuF+1nk4h5Y+QMnC6GjgqjlSN6Er7Z
         LquAtQvj9o6JTzk2mEn+PSi8985MWF/Z69aQLdBW2F6Vpn3bgxm/2JzAW7sr291jyN75
         9CDAUEdWVpY2yHqGPJln0AmQzPl8x5zI128SgMO6wJ+JG1fzFhCCNMHKyGAgVLBHV2DW
         6rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156274; x=1701761074;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hL9Tqag7AJX6zAdbbkbaDwLX0iVjHOEY+HYssYNlBSs=;
        b=WM+EbEH/N1EDlV/7ChnRjjJDBw/Mxa2F0dz93LxzHBLar16mjlYhYfOD+CMNLoN0fE
         G+8TWK7X39hG18mU+FnQlP/HhKbNhE5ww39ZuB43d3barhp+ZLn+MqnYtVez6d5nXZTL
         2xD6BhHwP4DEPKD5Ha3K9xpkHdBHCMQSKIbywx3QREinXnwiynZePnod74w95MNpdFWb
         50ynrvnS1kFpHNOlWqGHxv6Fbux3IpnfmYQVZ5iHCxmnsSp+jtY1AEBR9RW/32R/B3fr
         QJ9P/DUhwTs8SWz4MDekwIpp2w1pfcOFjzAouLzQIOc3MKpFq8VaP0+ro00ZgegQs9C3
         PFYw==
X-Gm-Message-State: AOJu0YzBhxEw+HqK1gpB5jf53+UmAA8vS9Ta6G4zJiMVme8mztaw6/Sm
	cICvfM4cdJ2QXzdWQqQWGDDTi8QRXDsGTQ==
X-Google-Smtp-Source: AGHT+IGoRIHKr3JyrbM3tkKrf0PmKkWlRFIRiSnxD6FAHnrPxKsZM4C/FRkjkDW0SuhziYxtsE89EeXxGNnLEA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:3741:0:b0:db5:2a4:aef1 with SMTP id
 e62-20020a253741000000b00db502a4aef1mr30191yba.13.1701156274525; Mon, 27 Nov
 2023 23:24:34 -0800 (PST)
Date: Tue, 28 Nov 2023 15:24:07 +0800
In-Reply-To: <20231128072410.952662-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231128072410.952662-1-davidgow@google.com>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231128072410.952662-3-davidgow@google.com>
Subject: [PATCH v2 3/3] drm/vc4: tests: Use KUNIT_DEFINE_ACTION_WRAPPER
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

vc4_mock already defines such a wrapper for drm_dev_unregister(), but it
involves less boilerplate to use the new macro, so replace the manual
implementation.

Signed-off-by: David Gow <davidgow@google.com>
---

No changes since v1:
https://lore.kernel.org/linux-kselftest/20231110200830.1832556-3-davidgow@google.com/

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
2.43.0.rc1.413.gea7ed67945-goog

