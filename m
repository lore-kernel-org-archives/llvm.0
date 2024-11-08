Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD6719C571
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731042645; cv=none; b=JuKn6QAkslDDxFACpEUtHQkqYdeFArXjUdtFyR8zfj+TuOIAqYRO1WKvHO+IhIr3wo/zjY+G9sIvTlWM/NbVKO4g5/8Sr8TjgG204jJ8v5gD5UJV1vNb5T5ZrnU7hS7BQMRR6tZq+6dYT0+INagcGz7kw3DL/fFfjZsm9vHxu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731042645; c=relaxed/simple;
	bh=Yq1YwQgYCpmlssJrskTFSgD3vH6McUCJKDtujoaa7YM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=efvyp8XHvhXAExWV8RVuDqZfhmhdpl1Aw/DBC07U8PXYQvEUQkkUx+dO7YXnZqXKnaX6oIBKK9tpgrkl5cyQDfNk4/bA5UXRqYJiHP9TxcCuxNeIgN6gWTE+V74aOA/qFGPmlQ2ojsuyLexhN74i8osNzFN4YRu8YvF33E29gM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3+ujKYs4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3+ujKYs4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ea8794f354so34156947b3.2
        for <llvm@lists.linux.dev>; Thu, 07 Nov 2024 21:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731042643; x=1731647443; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7tQ1L3QpbUskwFQP7JuUlt5UgFJLV/ai+rpO7iRmQ00=;
        b=3+ujKYs44t3JiO8wb5qDiVRoyHLmPSdZZaqdPF5YBg5+yHlIEEptRYBfPatSxltiBe
         dq/j23kRFPhi4MQVQXbWl248GV2gvelV4np0UBM2DQ1fX4VLQO8nSpplumlExncxQPS5
         YV5bgOqoABGRx1GUnpKaKnUUP44wslFCSlRNgUcfJM/xBAQiZAC0VXAth06tKwM6nxZl
         2AayhwmUv5YpCIZiF+logMM273GvrXkwYKyYxjm32s7nwi3wusux2D0zw1U4AKqQt71D
         /2Lm2Jnqk7RfxElCOREpYqF/n1HZO23DTUDzxg7hTLpA0p5vmiB01mpaVia7p7SScpEa
         4n8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731042643; x=1731647443;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tQ1L3QpbUskwFQP7JuUlt5UgFJLV/ai+rpO7iRmQ00=;
        b=m+uUyELCFIoT/AKo8KGwN4a3rW3U/MVqcehDQdRA3KZgsZUYxHkNd8aJPtss0mL3XK
         mHMSUM3OwuqhFfJlweBKsAHA937TF3XYI+ZtgDgIX61crCLnYbjGp9PpwLmwKT3p79lh
         YnTA+eLD+sPQC4XnaOOfehfZ7bDeJuPdvQT8PQ+jVNakmw+SgSccn5L6TvAQyXUG1hAq
         GMnJJ0M6YeHqi0XIW23pUD47r/6tbBasvbmHSeRtiAhVNoPEqumbwlzjiDx7UVQkdDjE
         0Kh5uSSbPWBgTVZB/uoPLCFXX2wJ0/gQMzAlDpxe/XPsfEs1xICXOjI+cGGuCtD4DTK4
         ZoHg==
X-Forwarded-Encrypted: i=1; AJvYcCXLIjXWTC8/MlGbNTxR6kFOU4gSCn2ChxK4EeB7ljhQqsIpEvdWqP9FGJ50BZXvXekSp+lc@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8z4kbZ7HPTrbPWgP5mljUYUSAQhyr3NR6P1IWYVCVA0u2GLWx
	jcsCdrc9plt6eFX562tmo8CsOi6a+qd5zULPd3bDY+nQ/FkM/oBZp2CxRoSHSV9Zwg==
X-Google-Smtp-Source: AGHT+IHaHqfWXbqtq7zwFlKahwo2sjCXng6SVwY/38LfDsmjxFvxkfhDNrVTdIO2OlZ20Ep93DJFQow=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:3505:b0:69b:c01:82a5 with SMTP id
 00721157ae682-6eaddff0e00mr262967b3.7.1731042642840; Thu, 07 Nov 2024
 21:10:42 -0800 (PST)
Date: Thu,  7 Nov 2024 21:10:30 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108051030.2918950-1-xur@google.com>
Subject: [PATCH] kbuild: Fix Propeller build option
From: Rong Xu <xur@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The '-fbasic-block-sections=labels' option has been deprecated with
the following llvm patch:
https://github.com/llvm/llvm-project/pull/110039

The old option still works, but with a warning like
  clang: warning: argument '-fbasic-block-sections=labels' \
  is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]

Currently, the option change is only in the ToT clang (v20) and not yet
released in v19.

This patch adds a check to the Makefile to set the proper option.

If the option change is later integrated in v19.x, we need to update the
check accordingly.

Signed-off-by: Rong Xu <xur@google.com>
Reported-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.propeller | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
index 344190717e47..1a68ea0d1fe4 100644
--- a/scripts/Makefile.propeller
+++ b/scripts/Makefile.propeller
@@ -5,7 +5,13 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
   CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
   KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
 else
-  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  # Staring with clang v20, the '-fbasic-block-sections=labels' option is
+  # deprecated. Use the recommended '-fbasic-block-address-map' option.
+  ifeq ($(call clang-min-version, 200000),y)
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
+  else
+    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
+  endif
 endif
 
 # Propeller requires debug information to embed module names in the profiles.
@@ -21,7 +27,11 @@ ifdef CONFIG_LTO_CLANG_THIN
   ifdef CLANG_PROPELLER_PROFILE_PREFIX
     KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
   else
-    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    ifeq ($(call clang-min-version, 200000),y)
+       KBUILD_LDFLAGS += --lto-basic-block-address-map
+    else
+       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
+    endif
   endif
 endif
 

base-commit: 0dcc2d1066150787017a71f035145c566597dec7
-- 
2.47.0.277.g8800431eea-goog

