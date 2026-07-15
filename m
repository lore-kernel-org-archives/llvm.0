Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AB383C83
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127267; cv=none; b=V06YyaQHeQY1Gpneu20GU2zyM8B9pAK0dPmTtUXbtUR5eqVvylvYniBrdAai2ZqLw97gmqewXim9WdXyAm3pW48rufvgXmz40KKkRKvya2ytzwN0XOHbEgnBBHx4vQpiwMZg6OKzHZer336VMlG16L4uWuwNVy5/5h2DIrRGSo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127267; c=relaxed/simple;
	bh=YmoPzivoUVC4z+GD4C9dgp0VaLkJZwU+d/4+hGh3yNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCqR01JI7kCLKMrRYByCS+B5PCymmDAMPDSpaw451vSRXeAvdQwT/tQAK62Mct5th3jhFauNV+/Az76W7uedGNZfYdCg1EvjTBpOJJp7aMejx6mvxpanXgZ2C9UQf/CRPIT8Lb2JhwQsIRDsiTfPAH2mhbUt6WG+xnqJQjqYTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9g5Axk4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9g5Axk4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso4584845e9.0
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 07:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784127263; x=1784732063; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3q/mBxAob+M0XblmpPoJEXspUdOZwJaSDjVW/DAN13M=;
        b=k9g5Axk4lzWakanbehbsKM8YUlG4lz2pcMSUQj1WgbbUQUpa1iDR6bpApUaFhXun43
         Mw+aLhrddiVoyO8Cv8imPhfvHcUYvUNv+hGotFpJgtzVB3Y/f9+1LSgC9PELcGAfzQnj
         4bHn3FG83MEn0uYmpFtidiFQ/t6pqoCuVvR/wRejjgcxEy3nyCrassVjcZw4hV45LZ5+
         EIjaxc/2YyVLlONPkcbe32/qd9NajsxN8aRvYXJ3Fh1hOsqMbx849Eb4KwlTRa1htcAP
         v376u1MfVQz6BqpZTlBh2SuOBevpt2VTpUBUrZ2+BUu+FxbH+Pjd7L4MC79BJBT511TZ
         rjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127263; x=1784732063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3q/mBxAob+M0XblmpPoJEXspUdOZwJaSDjVW/DAN13M=;
        b=rbN2DMC3uOrZ9hR1XspQGg3lCxH5C+8RCyckhP/pd8YkM3ZOL5otnCLFwcKzSoryUe
         7K2qOn4jrh2iEGvuf4dKP+u2p8147VjTy+E6dsbvKGkP7sW5esIcYb7mZ+kR4jf+7k2I
         WEZQukDblFTWHFvETudlaUQbI1lV+C85OYyhokaHicNkTwLoxzS7cmE3memobZ8/sie8
         6ffEEzAm+r0P/tiaijuplbZ1Ejb/ViVHhpUFKAHEG4EV9Dx0nmtmBuh7yYNDxKNjWLCk
         KUTbd+bi9tpQT0qM/VpfvS2zQ39Naj/5X3TtPTZFnGuz6CvqIDPU4J0Ybcci0hs+6diG
         yQFg==
X-Forwarded-Encrypted: i=1; AHgh+RqRiY9W+H+zXQe8G/mfWklfcxm+YXg9PfkzK4lsuMQlVChTwp8j444Svn5n//ju3Ut9bt5g@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9GeKNuWlP4kPw5zDh6eC5ynSsgbK/A8AVmrXpt7CHyl3qAVWr
	jnfBGX9SFemj++OM+k+mSsHJLh83KFcr3nvKBCpU/LPq+CnC5euVXusimL6O7lGE/6M=
X-Gm-Gg: AfdE7ckeevxrIF/J+P6vO3RpaLQXRAMEPghxlQnrbc+p4/CBfGbXSqURLg4d/hhjh2p
	3O1teDGD0xWM5py/PXJwOo+eSHIt7DLynmy75eyjyxnjIcAeAeIqiaTUzG2sT3wVyn1InOp+6+K
	M+XRTFjdTE6GFXbBSXHqAnsNCisrzpEJ/F/mhIjVj+6due2GyFJLRokfPpkvbqBPfKOFHQfKRlg
	tFCoYmVcVZv9956HRjZkHV7aMRCE+51WlVn6xtA8o9FvK9ITyPsttgQj7qiTv1YtzxybMk9RjQM
	choBb4AIW6YOqxsbnEVRDW482VtPbK5sr1/tct5l+zM7pRMQ8b5TF47pL37fkRU3Msk6+VhPOAV
	0RMSi+3YZwJ0UvxTGZtY6641ShwBtS7zpqWxiJp3Lq+MU/lblOxSWoGifYf8OlhkvFiHdZZq36k
	u2u9QKZ1x+n4lU6sQjOld/Fg==
X-Received: by 2002:a05:600c:4f8a:b0:493:e947:b24a with SMTP id 5b1f17b1804b1-493f87e72a8mr183785635e9.14.1784127262701;
        Wed, 15 Jul 2026 07:54:22 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm137649275e9.15.2026.07.15.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:54:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 15 Jul 2026 15:53:51 +0100
Subject: [PATCH v4 4/4] tools/build: selftests: Remove some duplicate
 toolchain definitions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-james-perf-llvm-version-v4-4-6dfdf984b435@linaro.org>
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
index 7672208f65e4bc245c03603634d3aa0093a91096..6fdb6302e0a28e9166175822f42cfbb4f4eb24e5 100644
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
index 8665c799e0fa7155016e8bc6968ebe76a90e1d13..a228fdb5adba8d7f8282688964a9751a06cb0c79 100644
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
index 8703ab487b68c89406fed575217b57f58e71fb01..9f1ddcf0504d993249991e0af4589db1072465d1 100644
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
index 426b845edfaccf56f7c246c281a549c18d0f3919..d692abe8add6e243d7b024fe556cc0983eb4b443 100644
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
index 4d0d7ae02e06b117487a17691c4e62a138428ac5..ca67d4b6fc38367c63123332360ccf27102fc086 100644
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
index b642ee489ea64046a9b19852780c3a6f009cbd82..a1a4ae76365955f8f7c1193a03e74bef0d344f9c 100644
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

