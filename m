Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF2B2C86
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 19:23:48 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso73991wms.2
        for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 11:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDICyqBCyU2udumcBVTu0p9pr75weFjqtozx/DNW2VQ=;
        b=d+i6bSB5J837uvpw9A53cC9RuzjeZR9tJhOOhDEqV7sFkpNKnHnx/G1nXFZZpeWN7D
         9XSJ+aXLqHPo1uCxNWcKrsU0LMmMt9WdMnj0+JDRD0BuIuANjEUZWyAHWpPpMLmY5lPG
         lnXb8y86ANZVrM/w5c9Ylr8Hv8/RjwdZGVk9aawzzA9DtLq03S/qWpeeN5aqt0tlFoBc
         sf2m87y4jl+L+BY1udLO7FzLCWwPXeOuRS8WTxrfIABuJhkNqbw5pAgjRgXe9RTYk1vy
         Kd9q75+WvgebWhzHCVFQIbSgbop1ednOMU5+eAzr7cbTnSGF4MBtToH5Wez5Mx+Dxi7u
         b1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDICyqBCyU2udumcBVTu0p9pr75weFjqtozx/DNW2VQ=;
        b=vJ9e9+2+ATO0OdVDttVKEG9mwXvBgp6ujvIJ4f5oIhFbu0qC5depVcg2iO1hOHaTzw
         RAnpcL6CywyaMtkoIL+denCX9bNQJRU439bae8XBNa2L8WNfW1g2OH+qQvWaGufmwVxN
         QgWdZ5M81zcpVlm4LoKrJjXFu02L/gcqfaayrTeuqs8QcnpH9wgya2mZHf3fPra790Ob
         KWjpP8/qATik6CHWLmHmdCq4K5sn/p9aqljS4g2L8hq+noQLPLQ7Dl/MsormdhxTvOeM
         qtA6hbPHnEBHDtZvBabBQL43rdMgD8rlreZYv1XwkFaaGKgLRkIuQE8JOpn8FJnASvnA
         V5Ag==
X-Gm-Message-State: AOAM530Yt1j8RKXIXefOvA0XEIJSzn5yOStApM+LGSNk4AIoFjOa2jxv
	vToKzzbJU3ExKs/GrMrJgmq26g==
X-Google-Smtp-Source: ABdhPJyuQ3q0UHvKGua2+rO2YKZoAB/o+s0tV/BFVxOAryYMi3xaTsIOv5qNfnWUKjHc6GerxF3Y3Q==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id g7mr32984997wmq.138.1637609026989;
        Mon, 22 Nov 2021 11:23:46 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id b188sm9916150wmd.45.2021.11.22.11.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:23:46 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	shuah@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: kafai@fb.com,
	songliubraving@fb.com,
	yhs@fb.com,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next 1/6] tools: Help cross-building with clang
Date: Mon, 22 Nov 2021 19:20:15 +0000
Message-Id: <20211122192019.1277299-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211122192019.1277299-1-jean-philippe@linaro.org>
References: <20211122192019.1277299-1-jean-philippe@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cross-compilation with clang uses the -target parameter rather than a
toolchain prefix. Just like the kernel Makefile, add that parameter to
CFLAGS when CROSS_COMPILE is set.

Unlike the kernel Makefile, we use the --sysroot and --gcc-toolchain
options because unlike the kernel, tools require standard libraries.
Commit c91d4e47e10e ("Makefile: Remove '--gcc-toolchain' flag") provides
some background about --gcc-toolchain. Normally clang finds on its own
the additional utilities and libraries that it needs (for example GNU ld
or glibc). On some systems however, this autodetection doesn't work.
There, our only recourse is asking GCC directly, and pass the result to
--sysroot and --gcc-toolchain. Of course that only works when a cross
GCC is available.

Autodetection worked fine on Debian, but to use the aarch64-linux-gnu
toolchain from Archlinux I needed both --sysroot (for crt1.o) and
--gcc-toolchain (for crtbegin.o, -lgcc). The --prefix parameter wasn't
needed there, but it might be useful on other distributions.

Use the CLANG_CROSS_FLAGS variable instead of CLANG_FLAGS because it
allows tools such as bpftool, that need to build both host and target
binaries, to easily filter out the cross-build flags from CFLAGS.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Most tools I looked at needed additional changes to support cross-build
with clang. I've only done the work for bpf tools.
---
 tools/scripts/Makefile.include | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 071312f5eb92..b0be5f40a3f1 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -87,7 +87,18 @@ LLVM_STRIP	?= llvm-strip
 
 ifeq ($(CC_NO_CLANG), 1)
 EXTRA_WARNINGS += -Wstrict-aliasing=3
-endif
+
+else ifneq ($(CROSS_COMPILE),)
+CLANG_CROSS_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)gcc))
+ifneq ($(GCC_TOOLCHAIN_DIR),)
+CLANG_CROSS_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
+CLANG_CROSS_FLAGS += --sysroot=$(shell $(CROSS_COMPILE)gcc -print-sysroot)
+CLANG_CROSS_FLAGS += --gcc-toolchain=$(realpath $(GCC_TOOLCHAIN_DIR)/..)
+endif # GCC_TOOLCHAIN_DIR
+CFLAGS += $(CLANG_CROSS_FLAGS)
+AFLAGS += $(CLANG_CROSS_FLAGS)
+endif # CROSS_COMPILE
 
 # Hack to avoid type-punned warnings on old systems such as RHEL5:
 # We should be changing CFLAGS and checking gcc version, but this
-- 
2.33.1

