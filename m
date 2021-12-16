Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A629CA
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 16:50:48 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e5so11887096wrc.5
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 08:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PSj7odpkITXsYB6KPKrMVfI/4wK2fmXegdumHZrochE=;
        b=dFx0Hwhzmk2igT16BZ1rlhq6dmsS0U34aPp3se+PKa/ZzjcDBS4H2B6kjCKxkKkUnm
         o6bbpnrimMR8LF6ECf0WtkhDh2EwsMnPD6NRoVWZ3Tp4DtDLktxL0iVIpTPJq2V9Qwv6
         EDxc97Zgs3TzNCmdnVAg6l87mbVeDbDElCjbimhMjpYcC+UqtEaWuZuyaDlBvmrhV5H0
         LRsmVCx6Se20pdD0St80++FeXjiaE5H5VQbQWFA1Q/Letg6FRFrHEiDgCnA3MCGh4ySD
         9Lz7jsukzN4m0l8WSFRE3c+xHkqiPX22/GW9xWqMudL/aDViMXN4MXRY7GYpluZ56GZy
         ZNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PSj7odpkITXsYB6KPKrMVfI/4wK2fmXegdumHZrochE=;
        b=KQKUkv//t4JsWyoFjCEceM3BG1fw9p47YGPDpZTtM3QXtygmdPpoy2B5Xx7WV7XkFX
         4grTIuFV6fjA27TJnDBmddxIVE/N1JTZtVl9lgGuS9IkSpaV7QGZTeIH/UnVUplO7dur
         bBX/cfKlhFrBkdqSK2AQPgOUz3Ns/xx0IVirsGDxoeEKQ6fby7HPZGAWSG63pRDyQKOg
         7pNZse+LFZTuKEggVI0qaRBPkz6LlM9aCawylurJVfBWYpA37GiiGnb+YPF3CZ5Bn9jT
         J8BowsVGPxbs33YdHtW5N6U34lUGricLJ17DyaP+HD6hM19ZdNXLK3qzFbLw5unB0OLX
         Dl0Q==
X-Gm-Message-State: AOAM5337g5m9HUea2GCoFcdOf4u0c/g6J8qLOP804p0TA/kz5qg0c43K
	gYqg92zYrItrX8deSFq9WOTSxA==
X-Google-Smtp-Source: ABdhPJx+P9oqyIfuP9A1UsCS0C6AIk2H9RaJ+5KI1+5kFgW3KWUsbTT45+vSVithjhZ/h43RdNIdIQ==
X-Received: by 2002:a5d:4b0a:: with SMTP id v10mr2043375wrq.294.1639673447321;
        Thu, 16 Dec 2021 08:50:47 -0800 (PST)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id y15sm7438906wry.72.2021.12.16.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:50:47 -0800 (PST)
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
	quentin@isovalent.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH bpf-next v2 1/6] tools: Help cross-building with clang
Date: Thu, 16 Dec 2021 16:38:38 +0000
Message-Id: <20211216163842.829836-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211216163842.829836-1-jean-philippe@linaro.org>
References: <20211216163842.829836-1-jean-philippe@linaro.org>
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

Acked-by: Quentin Monnet <quentin@isovalent.com>
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
2.34.1

