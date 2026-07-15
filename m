Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127B4397E92
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127266; cv=none; b=a2WfMMc0M0uINiS11SQINeZOr0RkYA7RqRNFJf1JC6LhdVatq1jJmUus1tnEf6NMR8qJk1gHyamdYngJKXVLmMAaROK6JFklyogNIzxlccMFvQAE+EfdhHKILj1BYjStObmSdT4vzfKMkl3FNfZWIzpGNyzS6G+6BoCvnyGewnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127266; c=relaxed/simple;
	bh=vierWn7zWoMEGxDcMMkTIOifh9Esb5HXc5nNQCPMiog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2bF8twNVv0qXUGjlwfzFgCYvH2WtB0tQZw4yCMgi0l0LPRAqAkd9dT7bD+dgD9PnVMCj7D+gH0gJO0j8R4Qyvgw6Z4Q3wfV1huE9dBQgaFFiB0lZudjncr8u6b2BsBy04VCa1tHJhRPJDLJLnBf61uypqsCuNn8mWG4Bzb/vRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X9jxi/kT; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X9jxi/kT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so30418255e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784127259; x=1784732059; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=X9jxi/kT3HJNQI7/MWihVeFT9Cotus/z4f1Yqzs4TKz0W7osHe2n7c+F1DlF3oVM/y
         TCBEOSuS771vbzwfL6DzpSBuxqlJI8gJa3WGf6wTlftiW5vOLmncKDmYF860JRYG40Pe
         HoO74DJYU15IYPfCjaRNetsgNKid1bNa7Jn21dWrGlz4Z4bJBq5WLojHqWRQVSHZNj7y
         uHD6q5oZW0yz1OwYiw03KjIrAUSiGGLxffwSOgNsQcxpBiiRf1CcIJPnQhimKjW9xzJe
         8TpDF68z4ljzzaVRUl6OnNBnGSDBNIird/h6qOzWuaTd7ClTD4NyzS7SWt+r3uZdbu/r
         QUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127259; x=1784732059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=Ykxx9alpy+fXPT7OTMkkAVfOVz3kIjYDuUrfig5THgKt5scFqfBsiM7mcqtelMbfa0
         AYHaMgtZ2sYVElO3WseiYwKtF8TpLqGIVeoJj1UYAUP+n/p8BfFKWmFMYGzI7TP9K/4G
         zRWGlrBBUlaOn9AEFswgIyY5P6bmJ3Ou42KdA0OxFMrSbRjDCgUNbhGQgAEG9cmqshm8
         iJVeb/UKF8PntmBJO/CHbCh1YMO01Yc1Ltd2aOgnDZBpB3tT6lh1JYpx7ZwIs7T64Mea
         m4PEyXoFuxswUTsruvjbhl+9bZWOst9ndlyZWtkD0TJ3NfxZOdPtg4v1PIrOL4/1kZwH
         JL9g==
X-Forwarded-Encrypted: i=1; AHgh+RovuxOKhzE3qD2EvYlq82LAmVreizK9dTKYt8jUB4XExG7MSLstIRFCyn6SpC/Kd9RbHjFR@lists.linux.dev
X-Gm-Message-State: AOJu0YyN0aAutkO7Go5IEPE+6nx14sYJ6cj4LqqVZ0E8EdyGGCVo0P2+
	DMkGrA8AWvbUWfh0rdo0azn1oPp8c02szoZ7/Vy4Ot3J/LnHI0Shh2MdiKFmmFOSkns=
X-Gm-Gg: AfdE7clf85AHi187Vu0EG6BChW4+nbubJFiH8Muew2+vkFe+TEwtSjW/XC6kIdmgCTM
	1we1jop/qHpob3cgx29FzmRT861IUy4squYKqiOSeh1F8hqUrDrx5QIRjxLj587iIC+zPsmxsjI
	9Bn4SDErN62Rno9hsmOlyZOtLFjf9kpaC6UzuM9y3XGT2RHKLvQUYCZDANBSkGSkOhMadC6bpTv
	9PfXQ8PD7IxunM+5jvp6YKoEckAC0yA6oT7qPU1AmhgQNY69+BLhpvNoYE53xYrQzL663WV6Mra
	wqjV4dZ2d64mypY7S1+1m+RHylWw1UzV6UNjkKyE+CsgATGorx3e8usfywkgOzGIy7EtrA/3/HR
	fdxxcZA1FINj1UGZ1mgPhh/aonKEWSZVzArRdfEXNIgXyGiTH9eV4TEVC8QhP3/tTNkjVyf1DDQ
	apHe+BuO3AcPzdjBqbgl3jBA==
X-Received: by 2002:a05:600c:c16e:b0:493:c8cf:27bd with SMTP id 5b1f17b1804b1-49515904fa9mr98446325e9.19.1784127259252;
        Wed, 15 Jul 2026 07:54:19 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm137649275e9.15.2026.07.15.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:54:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 15 Jul 2026 15:53:49 +0100
Subject: [PATCH v4 2/4] tools/build: Indent if else blocks
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-james-perf-llvm-version-v4-2-6dfdf984b435@linaro.org>
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

These blocks are quite big and unreadable without indentation. Indent
them.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/scripts/Makefile.include | 76 +++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 7022e78208a236604a681d45b1ff4f2128f412e5..e81e5b479c563321e458b2a7ad8fca2b4607a254 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -52,46 +52,46 @@ define allow-override
 endef
 
 ifneq ($(LLVM),)
-ifneq ($(filter %/,$(LLVM)),)
-LLVM_PREFIX := $(LLVM)
-else ifneq ($(filter -%,$(LLVM)),)
-LLVM_SUFFIX := $(LLVM)
-else ifneq ($(LLVM),1)
-$(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
-endif
+  ifneq ($(filter %/,$(LLVM)),)
+    LLVM_PREFIX := $(LLVM)
+  else ifneq ($(filter -%,$(LLVM)),)
+    LLVM_SUFFIX := $(LLVM)
+  else ifneq ($(LLVM),1)
+    $(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
+  endif
 
-$(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
-$(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
-$(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
-$(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
-$(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
-$(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
-$(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
-$(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
-$(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
-$(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
-$(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
+  $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+  $(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+  $(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+  $(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+  $(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+  $(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
+  $(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+  $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
+  $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
 else
-# Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
-$(call allow-override,CC,$(CROSS_COMPILE)gcc)
-$(call allow-override,AR,$(CROSS_COMPILE)ar)
-$(call allow-override,LD,$(CROSS_COMPILE)ld)
-$(call allow-override,CXX,$(CROSS_COMPILE)g++)
-$(call allow-override,STRIP,$(CROSS_COMPILE)strip)
-
-# Host versions aren't prefixed
-$(call allow-override,HOSTAR,ar)
-$(call allow-override,HOSTCC,gcc)
-$(call allow-override,HOSTLD,ld)
-
-# Some tools still require Clang, LLC and/or LLVM utils
-$(call allow-override,CLANG,clang)
-$(call allow-override,LLC,llc)
-$(call allow-override,LLVM_CONFIG,llvm-config)
-$(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
-$(call allow-override,LLVM_STRIP,llvm-strip)
+  # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
+  $(call allow-override,CC,$(CROSS_COMPILE)gcc)
+  $(call allow-override,AR,$(CROSS_COMPILE)ar)
+  $(call allow-override,LD,$(CROSS_COMPILE)ld)
+  $(call allow-override,CXX,$(CROSS_COMPILE)g++)
+  $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
+
+  # Host versions aren't prefixed
+  $(call allow-override,HOSTAR,ar)
+  $(call allow-override,HOSTCC,gcc)
+  $(call allow-override,HOSTLD,ld)
+
+  # Some tools still require Clang, LLC and/or LLVM utils
+  $(call allow-override,CLANG,clang)
+  $(call allow-override,LLC,llc)
+  $(call allow-override,LLVM_CONFIG,llvm-config)
+  $(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
+  $(call allow-override,LLVM_STRIP,llvm-strip)
 endif
 
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)

-- 
2.34.1

