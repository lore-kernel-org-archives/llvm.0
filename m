Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C11A9B33
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 21:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102599; cv=none; b=AaHkDmkeU1SSH7U1U3LzFcRDK7kL1lUA9ZsglRBvCh76fHZvRuVjUaxmStRjkvDEcs6N4w8bFE8yuxeLr3mMSmD5+8jYtnK35DIEQWzCkYNIFpb7jwKIM+DaQoPfZ5ddAmgavjW1awABfOtlg/Z68wjf/ZuhiZZ8DUzU8c3oMe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102599; c=relaxed/simple;
	bh=1yrF4jnXLhnSfWIojTz1DEjyYTazYPoSLrO9bq3y4RI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oV5v2ZvF+B3Fg2WmOxDo9YFfgmcUlguVTAbU19lx5LvbNoySMsFKmTpsOfIH07pV4v8hXesuJRsVc+i1lAhiv2XMB+rJlPj3WqG51dQzkbTtDqe2/cO45gG7XZe3Ii9U5f4kvBhzwKm/IwTNsdd37gqggSWSxgo4jNn9gWpYaUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmMl6joU; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmMl6joU"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6eae6aba6d4so14361437b3.3
        for <llvm@lists.linux.dev>; Fri, 08 Nov 2024 13:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731102597; x=1731707397; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Af4hMZ20VDS1C3kB5ShD2dxZfce4JKGeXzwvkb+Jdoc=;
        b=LmMl6joUJcfqYLHSdOr6waEI+t03iKnnk6+3LQaFv3o7OtrcC91CL9ujEjEiMwWICp
         Ibuhza8D3ITDowPyQXSFGOyS3eZ34B9K9B6+9lx7+BJp/yUHXrNJI83DieUJcMHn/wD9
         p1UcKmdwcSZ2sS49QjrxyymGJwI4KgUQ+0iOdY0vp6r/iyty3H274xMXVINTfgCLhJlC
         pJBThgQWyynCJNeFcAR5hl8Z60FSCV6/QDG+Jdn6Qw+eJ4C4Yk7JnnDzZUHL5GAduA7Q
         zGmxHjhc2ttgMYuv9vb5fZ6dRApRt3yOwHfptfRrC8WRbLznIO/JHOXwXle7FQgv2aRD
         k/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731102597; x=1731707397;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Af4hMZ20VDS1C3kB5ShD2dxZfce4JKGeXzwvkb+Jdoc=;
        b=GD2uVQdqtavPuXDRh/VoG32fD56GblCfKHhBz0A/5xerifcy7D4CynR2JEzyjysMdI
         W+0b58YqRWCjhF0vkhQL4YRQtSkGggtnvIlrpRh18BRHgb8D0HPAxQEUmt3dpY+2Mp+z
         uY8ICGs5DrEFKHIof4Gpu0iNtNm1DICyJlNaUpXsRUuXFcNgFVd7jnE8YqwOC5vpYiNQ
         +pxSz8KL/ryf6qlwvl/c4BE6qsu+uUYUga+sbtnQHX9lkL5ac54UkpHGrmrs2TdIcl5Y
         +Q8+uA4gORPOgSHoZeqnO3xZ9tGJ6SwvZccpB8zatShVnOAENhZbygT79A7uy9qgp/xw
         aYcw==
X-Forwarded-Encrypted: i=1; AJvYcCUERc/uPM1hYmgh3D+Kp2RgH7G0QO3kTKEhT7GQh1lj1ElEO+Jc9rQEVa+Ni3zcmRDTgB/K@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu3NxkdaH8m5K2Vr+IKVJat9E1KqTTaJVMFqXuc0Hbqf3dhwhZ
	0qkp2GgluVSNW2h0wwx44V/1n3l4UKst9qstZpngBLqe1yWUe7++9u9Aurr5gZ6y4A==
X-Google-Smtp-Source: AGHT+IGY5DjIqopeDmsWhcIroI1hvNOh14a/8IP8B3zDQoN6tNo8YsyS7v29bZZQV4LsFJ1jdq4Wj30=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a0d:de02:0:b0:6e3:f12:1ad3 with SMTP id
 00721157ae682-6eaddfb6818mr536407b3.6.1731102597002; Fri, 08 Nov 2024
 13:49:57 -0800 (PST)
Date: Fri,  8 Nov 2024 13:49:53 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108214953.1160765-1-xur@google.com>
Subject: [PATCH v2] kbuild: Fix Propeller build option
From: Rong Xu <xur@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The '-fbasic-block-sections=labels' option has been deprecated in tip
of tree clang (20.0.0) [1]. While the option still works, a warning is
emitted:

  clang: warning: argument '-fbasic-block-sections=labels' is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]

Add a version check to set the proper option.

Link: https://github.com/llvm/llvm-project/pull/110039 [1]

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>

---
ChangeLog in V2
Integrated suggestions from Nathan Chancellor.
(1) improved commit message
(2) added links to the comments
(3) used ld.lld version in the version check for lld
---

Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.propeller | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 344190717e47..48a660128e25 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -5,7 +5,14 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
   KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
-  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  # Starting with Clang v20, the '-fbasic-block-sections=labels' option is
+  # deprecated. Use the recommended '-fbasic-block-address-map' option.
+  # Link: https://github.com/llvm/llvm-project/pull/110039
+  ifeq ($(call clang-min-version, 200000),y)
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
+  else
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  endif
 endif
 
 # Propeller requires debug information to embed module names in the profiles.
@@ -21,7 +28,11 @@ ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
     KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
-    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
+       KBUILD_LDFLAGS += --lto-basic-block-address-map
+    else
+       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    endif
   endif
 endif
 

base-commit: 0dcc2d1066150787017a71f035145c566597dec7
-- 
2.47.0.277.g8800431eea-goog

