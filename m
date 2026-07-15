Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10200477E42
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119194; cv=none; b=hAIqXUV2hOOh5fwMOl8Z4c4xJy3C7XSRgbdnrAg6yoZvhmY6e7ZLWZ13J70qP4DaE5R6V9FYuqrVFz99xnMBhG1txNrmpulLMy/bTIzP3i3PNUqHgVq5rLiX6+aJ30JDgnwkMJxoLB+vOX5S2dwSzLpfLoVKQUzuwVCyFLrqSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119194; c=relaxed/simple;
	bh=vierWn7zWoMEGxDcMMkTIOifh9Esb5HXc5nNQCPMiog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwWUki2Elbo3w5bj5PzHbL5uPgpmYkWUynTuOgNLEoXuGp4Itt1+/wVVZcoF8bNWJTq2bHfIJIRe/ttWXmeUMR/WuGZgBPFlM5BFvyT0JMT3oQ8/A6fntCaCGx06LzxdE1kW3BYHXGoWHrHZqie/cGqKraPDV6JPHIgaQM8nBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgcxN7YZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgcxN7YZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso3721820f8f.3
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784119190; x=1784723990; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=XgcxN7YZ+fGiJ/JT3z65J7FDGd7vr34CU1IneTDvCD4lKE2MvQjEqBBymwWxTWbGPk
         UTCLdoj6hBTfH+6bzjmaiQ2AmJOb8X/09+gP0TlFlFE6+myuDgmtrn1eW9M0Ld/2bGlZ
         EsayaCW5zQkBKZqMUq5E1+f/SgYtOSPr3EF12D9954n3/NoDMcgqWraShHPqq6I3GXjG
         8mokVj8BqsUq4/oO1VWpFiJU8gBY3ZC3hKAMwPOfjnT15NgaGbG7vJxd5vOko8PeHn1T
         BuwXRAFLSraFlpZqgyiAJX/WGz+53MvawMIa6XzDrbXShFdmGxR87tvSsXRsqqSeuYxW
         UqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119190; x=1784723990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MEBbHm347NmLeqhspnJuPdrAD7nLfIZv8YQWBcbqgbU=;
        b=CNZ1S2xghXWzpBBwFPIX87UCOII+2N3gTDkMVc3HCCYVgi2EQjl8ch2getLF8HYocx
         pDX5CXNMKSH3ovz1yTQvd7iEnfoBjnTFzSgMByviAI8EuJEw8fzy5hbDmD62oDkmRcLS
         nOS7Tt7moZN0byPqrhB/ZuNN2ibica5bMYWzwmSKChENYKA74xxyBdbw1UEO+9dOiAY3
         60WYNFT2xodRBfjH9X4wBi6lBufSoZqjX8/QnFYc7wMzlLShCuf8Q0jxACuH8OSwuZsq
         eTkztvIAx2TslTcTJ4MWOIkrK54dGKPuIzggwj+vI5Onsbuq0ZIXf+w8CaBc5qD0cFUh
         Zs2g==
X-Forwarded-Encrypted: i=1; AHgh+Rr5fj2BQa4CMLRXi8ZCtfLjl7EKkGA1z1OSC1KlDXU5h9zyPxU6vKc3sxfbEzGb+C/zzsPz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsjrr5UA0QWEz7jpfwjZ/IqWUxHvyTdTfUtcJhGp+b7SxJCalr
	NxrcYjmygxdZ2Lj+Ns8K91Qbz+qLvB40V/ylHInIh+9MyNLA3vnxsBv0yLYMpENVrLE=
X-Gm-Gg: AfdE7cm4wEkEpoYUr2Gz76YlDRGWE6n43K+H85UbwtL94oo71Z9pOvd6br1NJsL51Y+
	Rsnj3bBTmwbTh+eLQ4aSe0toAtsQYUjbfHjWPr8J7pynZLiLu8LdXDU6T+MxOSAu1n8vYjsfuZ1
	mGEtqhRS4tNOLF9bDfPxAWVNJdOPMCzKlYbWPJQAFPTg/XNRqtTsh4DoYlmSN429i8c1EBwjNis
	n2BYARMsHTDeg42I0FowNYVjZqtU3Jwnb9K5B+4p0CFd+XVJkXiuOQwPIZONVN7/3r27v0NdoCX
	Y3Dqi0lIyNhm4ZwFVIdlevtxmrDxltanvZgy3Z6IDTKFapAW+hSvQBprgpHWVX0MpZuwKso84Ql
	sydky6J2PqJwfB0exT1VUMXLHxGE+xHgFV96zB7mE/rA+5mauhtGdag4XYabSML48secj9jkTKI
	ZUHAwWdwwY8iwFOh6AXiid2g==
X-Received: by 2002:a05:600c:1d9a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-495384a43aemr83497955e9.36.1784119189932;
        Wed, 15 Jul 2026 05:39:49 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c710facsm32360695e9.2.2026.07.15.05.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:39:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 15 Jul 2026 13:39:18 +0100
Subject: [PATCH v3 2/5] tools/build: Indent if else blocks
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-james-perf-llvm-version-v3-2-8854bfe5af7e@linaro.org>
References: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
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

