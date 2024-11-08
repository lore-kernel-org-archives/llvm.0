Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6719A28D
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 21:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731102409; cv=none; b=Hdj4E9RyF97qwmXtjBK4V8DmtLL1K33o95Uk4crY9URkr3pmRCnTvTnXIRhm8y18oEmGBUnFIzpGZtvv/T8kYgYrf0U5oJmRQJL5dtv6M+qHZjR/hH4fbfneVnChpJVWhxvJOB1NBifNp9jRKf4qZ3DUGfkIRQJljxE7/RqEi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731102409; c=relaxed/simple;
	bh=AEoUzhmLxJcYmOfM0szL/LZNxLfEvuOcRuf2OVTMz3k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sPplnRX+th/dYyqR1pbrAhThJBcBI7+sYAS/U8Dbl/PJd1rdRVbbrLNOSJsuqODxsuti0yioj54kmYwJHrnqaKRBJ8I6BgHwH02svtQx7NGZhm5TGti3qVFV5rTQi6aGT4p+ursUlHV/J2Hr4eCJABGOI/O0hBg1pUrUR2O8c60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S1gd68VT; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S1gd68VT"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e3313b47a95so5265000276.3
        for <llvm@lists.linux.dev>; Fri, 08 Nov 2024 13:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731102406; x=1731707206; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rXaV9HHpw5oBXk26XdBSn67dU41wttYgvf+/bW2x+x0=;
        b=S1gd68VTy20L85SRmvYKrnJOuwRh2TuXvO2ZapM8tgzJdtx/ILH/LUDVcLiZUovsPw
         kMubJ5EvsFAVh9Re8mD+5KX410fjBXapg0ju8FespaIe16uwm0+jWnii2fllLvn2yDal
         F2fDyX08EUEETi+UCZLWffM7YPue3jE9pRSCMVAlqapfNa/9VIELAImRuKR74pipxZF+
         nHJ81CBCi3L4mkUHKtnYEXMSMqJqzialodlBSa3srTDEK+VWxlxYOTEFkuUyVaNf6fdl
         xiWt7VipHC4zYp6dh9bsYD6tFiFIzOp6qqw0G0zgYA+NBIvdIui1mazK6WAbbE82axaL
         4XgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731102406; x=1731707206;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXaV9HHpw5oBXk26XdBSn67dU41wttYgvf+/bW2x+x0=;
        b=p9jIPRqymMFdGUbiJ3nj97uUBo3bAJGgisOCcZfuUBobNH8Nr5Wt7aG8e5FADrCjfn
         EHz/WfvK/Yab+Y/kFBd1onHvYxOOd3urcL0n9P7QGoeNgGsIULpcFKT+zapo9rKw4a97
         vA+yGDV/cvgPLzz0hEAHFv17XImCfUbUbJkUCUUDsVdhwcgIQzWdxI0Yz2pegG5ZP1uc
         v4dA8yBzM5UywJw9vLk75nYJFKUBx3303SZFd178re6CTgo1Vbjr4iZ+jaqrov1ey5R6
         IxmuQIopgL/xUzbbx4ZySjG57HxShtY/Gzy+3GFZjB4jGKLyCXMW50uSjQGBwYTnhYLt
         L4+g==
X-Forwarded-Encrypted: i=1; AJvYcCV1g/nEU3EByqw7N9oC2cm3c+QERf29Vz8uWCubNyGz0JqolFq0eUT8xxo1oRMyifjJJoUL@lists.linux.dev
X-Gm-Message-State: AOJu0Yx96WQwFBv0k/Ed/6gvJtUiz83qfP9s6dD8VgwjdWshgcnlhsQW
	st1UPkA2LubW/PtsS/RdXAIWv8oejyCiN82C/tw2ztY2E9Mcwn8SrpVraKjaWuEIMg==
X-Google-Smtp-Source: AGHT+IFB86PGUSKJ+j1W7yv6YKMRSZZhNrTjWnqgSnyhBOaULLB3J3ivCKnVz34+e2hMdcyuXkGnsb4=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:6902:4f2:b0:e30:cdd0:fc0e with SMTP id
 3f1490d57ef6-e337f8e881dmr5357276.5.1731102406545; Fri, 08 Nov 2024 13:46:46
 -0800 (PST)
Date: Fri,  8 Nov 2024 13:46:40 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241108214640.1159739-1-xur@google.com>
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

