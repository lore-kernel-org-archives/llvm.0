Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A153D967D
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751164; cv=none; b=GF+mSHQmEjnA2w1/DnPVWhcPHGLYcTs9b0410ZXnymaJtEpKRgF1vTUaJwyVHNRRtKAqb3ZsaOPEunYESLKUiIL8D/HLqbLktkvNGPzFMYxWWfvM6SibVdCNkvmzpBCNiZVguStZ1YIAwWriQ8PJqPNdRRZvLluOfeTI1+ThZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751164; c=relaxed/simple;
	bh=EcRWbLjvj5+HxttCv4wwDg08ziIUS2xvxPGRsCPtXfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0ZFbt2+E/kMVTKv+7MZNseNCQ1m2sY7r+/m1b7J3hQhHlxB5XTZGQSNBtqR+Ri+71oa49koWwzSlvcCWN/U0rm9BFBbbB0BpyERFzFP79vGHME7GGvl6rmT+DiS9q0bfmsH+s/HoiM06AtNoXmxSd15+Ar840Z3rNLaXTLww90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoCQdJEV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoCQdJEV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43eb05b1875so4604796f8f.3
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751160; x=1779355960; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cp0hCjl/7HokOMvEpLytgICfRvv5ETaSkkbSuZLPs6Q=;
        b=KoCQdJEVvR5nWFU0b3WgiFxwUXQ0wwcFKBsqf7AnTYMMqk2guGDsdBOGiBsYAvxwBv
         xDz8pgmIoZ7E99YsFh28QWreOI59j2/JGuG/oe07TfWh+X611bEtIvVSnLwhoWGjGG7E
         bSOSyxfKSW7hX3kUhvbrYyOQv61epv8LO/fLaVCeEPpB01AiqAkjwFrpVGOrG4ffYo08
         xASMCqDqJvXimlIPgzJw8sqkJqH92ZL/2xOmQ9b3Ivl9QVd6paL8UTdDwDbiA9ICRBkm
         8/hJj02uk5Bj4asRAbQPgn4hb36SV2B3vX8QJrUvJBgh/6nNMWzy6H+O7PFpnsxmHnS3
         yuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751160; x=1779355960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cp0hCjl/7HokOMvEpLytgICfRvv5ETaSkkbSuZLPs6Q=;
        b=A0gAPJu4fzrv5uTYJT0XYMl6JdPcG1xP9wezsuZATMVstyufo5YCu0tMk7KhXz8+w1
         RR+BDGHoRE0h78hqXD5gHFjzErHn3DOJnHfW+9GtOFKZvbIo2/bCV/ihZ/wSTuX/C0nt
         XSX6KJebLIZmnpqB7k1uxGGjmkdLYN8PmzM7lsVjiGgxk/z1PMVxm3iYYdfBxtOjDSgA
         zwWIZLgu11PkLQv3Pys2ciVaR8lrV0u3s1keafIi8dfHPb6VA1FgFuUwn48/BV3OwMvG
         facVB7AK4Ix97KDnfXAxL53jKbQTfb24qIj8KHMrQO692T4v/4ZstBE8kIgCyywE7ySJ
         yNjg==
X-Forwarded-Encrypted: i=1; AFNElJ+d6g4Dem7V3hVtQN5TVdUC9Mvn83wo8hnHDX3udu/p4KyY8bEAunlckN+unKYThZn/cI/S@lists.linux.dev
X-Gm-Message-State: AOJu0YyDXGpcZP2L+I7geTCE8knIbQ3vqmEAjjYr9UjEzYgydI4bdYQT
	2jTzTu9FRK7sqUjwIgdUoFbsOILSTzH7fyht/O5To1N095OGT4+let/AHrEZdP9l/9Y=
X-Gm-Gg: Acq92OE2ztsWnPI43gLuDNmF66+eVm0KLtCbWoHqmZrVrWy5E9pzaH2+aKeJQaf2RtV
	2oX7znAdOZQA6lGTEqgaaCwBFikw55th0xKlZ2RKJB54DTqLndP6Gs5K8TXvITKup4/nvxJ4NtT
	xRwo7aiS1V/4IVr4CrZFe4xIktGm1JgJm9HYV3HztxY+sZMCu7Gm88VdE+Ltg8y09wf0tKKQJi8
	DPTCfJaxj8kcBeJAXER+pqoivtDCzQoZCUl8ZXtByXbs+EFoDldrMITo17C8g5e4y5hYvH/w9fi
	NaW4ddQk9sOmc1CetZ+tLW1n9dEMjCWSkO87X47ReO/+rAWootaJ4pfFN4E11YaTP3TPw08PjSO
	9c7GBl9ILh5fw+jrM7vJvP0+8WYP/7oPpjsBgGZ8BxNwDmU/CSqCf/0ZsM8rAsxjUA/PKgFTXSX
	BIMPGw7735SaLDGqsKMK4EfqjurLV21DPL6eigkfOUvjY=
X-Received: by 2002:a05:6000:1863:b0:43c:ffb1:2214 with SMTP id ffacd0b85a97d-45c57b050f5mr11407660f8f.16.1778751159863;
        Thu, 14 May 2026 02:32:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:13 +0100
Subject: [PATCH 6/6] tools/build: selftests: Remove some duplicate
 toolchain definitions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-6-6cac1a9a4c8d@linaro.org>
References: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
In-Reply-To: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, leo.yan@arm.com
X-Mailer: b4 0.14.0

Try to remove some, but not all duplicate toolchain definitions. In
these instances, their makefiles already include
tools/scripts/Makefile.include which defines these in a consistent way.

STRIP is the only one that was set with an '=', but I don't think it
was significant so that difference can be dropped.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/bpf/resolve_btfids/Makefile    | 3 ---
 tools/lib/api/Makefile               | 4 ----
 tools/lib/subcmd/Makefile            | 4 ----
 tools/lib/symbol/Makefile            | 4 ----
 tools/perf/Makefile.perf             | 6 ------
 tools/testing/selftests/bpf/Makefile | 1 -
 6 files changed, 22 deletions(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index 7672208f65e4..6fdb6302e0a2 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -20,9 +20,6 @@ HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)
 		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
 HOSTPKG_CONFIG ?= pkg-config
 CROSS_COMPILE =
 
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 8665c799e0fa..a228fdb5adba 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index 8703ab487b68..9f1ddcf0504d 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-LD ?= $(CROSS_COMPILE)ld
-AR ?= $(CROSS_COMPILE)ar
-
 RM = rm -f
 
 MAKEFLAGS += --no-print-directory
diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index 426b845edfac..d692abe8add6 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 63276bf55856..948abfd2ee8d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -174,11 +174,6 @@ endef
 
 LD += $(EXTRA_LDFLAGS)
 
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
-CLANG   ?= clang
-
 # Some distros provide the command $(CROSS_COMPILE)pkg-config for
 # searching packges installed with Multiarch. Use it for cross
 # compilation if it is existed.
@@ -213,7 +208,6 @@ FIND    = find
 INSTALL = install
 FLEX    ?= flex
 BISON   ?= bison
-STRIP   = strip
 AWK     = awk
 
 # include Makefile.config by default and rule out
diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 44ba829e5d4d..b3e356c34479 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -3,7 +3,6 @@ include ../../../build/Build.include
 include ../../../scripts/Makefile.arch
 include ../../../scripts/Makefile.include
 
-CXX ?= $(CROSS_COMPILE)g++
 OBJCOPY ?= $(CROSS_COMPILE)objcopy
 
 CURDIR := $(abspath .)

-- 
2.34.1

