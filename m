Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F22626E2D
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:20:02 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59b5d4a8242so18633887b3.0
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726401; x=1695331201; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lStqQ9ffAu7tg36ET64D7TH2ZuxYOmdso1Dvk1E923U=;
        b=TPnh+MyUWLY0G8AqJHvozjmM0tFMLxYCVqkZCY7a9einNfcuVOQp+42R5AEHR+2yZy
         vlGUW9wBa3wtIxXgPkiB1Vzl/xn9qiq1K7WuT1H1DZNCGhAjtq7ItCm8Dozsc8OYVTZG
         9YPbWIKbNH/S/zegbJvF76nbE1eHq76MuYweVYkNmufmAso5c8yyW4TqwyNjJdCfdaJ1
         9EMEQQMcC1BF0sm0WXCD8AZDE4LF68AwlqYg1QP2EIYME9TSwyLsrLBNPkTOasgLcfSj
         5IpU+pP21y1ZrTqG/30buXQEM3i4YKmSh9YgtAyJAfox0vgzdM4S1e0ss7JK9yn73szk
         MHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726401; x=1695331201;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lStqQ9ffAu7tg36ET64D7TH2ZuxYOmdso1Dvk1E923U=;
        b=JF3qI7sz8U1upqQL+5Y9G42tvrg4xquMJ/SOYTyRgFt40373cSJY2soyz0Cd5Ajy0Q
         poUNoYrMdNW9ppp38Zrt1peb7c9ZpPUfy5+++YVNOjEPJ+Pjq7N/vWVyRf4LmaHsJC2W
         0dh8E5jZMwyIDdmAEZrhAX8hv7BoJ455qCQ/9a1Vh4X3rMrgwshCgS8KIb+bIq6Rx+mr
         fK/y921jCUo3OYYk8DzmMwLObhsfQ4w4Br0Ks8q0TFx7ccK3zCWDo3ApGScmWwNTRdVF
         qBcpPlbczghzTY/cEduSipmRTitIQER1Z1AfI37uTaPNvugQ5lyFZWuQmyrnbiqkinUj
         F35Q==
X-Gm-Message-State: AOJu0YwK6HFje/MlKwNxH+W88QKcaMuR+5gNfvT2VMrYq1qiu3Ee74Gr
	+vgZ5Sp/62w8vUo6Fi0/oeIvENIMO9EK
X-Google-Smtp-Source: AGHT+IFjRA5JUeGKSzOoa0TZAwd/2W6FhxzDTZAadOlCrpO4Vx/AQT0GBgpQR7QF6AbHQOEP6z9/0YF3A9DO
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a25:ad87:0:b0:d80:eb4:9ca with SMTP id
 z7-20020a25ad87000000b00d800eb409camr162274ybi.0.1694726401718; Thu, 14 Sep
 2023 14:20:01 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:45 -0700
In-Reply-To: <20230914211948.814999-1-irogers@google.com>
Message-Id: <20230914211948.814999-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 2/5] perf build: Default BUILD_BPF_SKEL, warn/disable for
 missing deps
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

LIBBPF is dependent on zlib so move the NO_ZLIB and feature check
early to avoid statically building when zlib is disabled. This avoids
a linkage failure with perf and static libbpf when zlib isn't
specified.

Move BUILD_BPF_SKEL logic to one place and if not defined set
BUILD_BPF_SKEL to 1. Detect dependencies of building with BPF
skeletons and warn/disable if the dependencies aren't present.

Change Makefile.perf to contain BPF skeleton logic dependent on the
Makefile.config result and refresh the comment about BUILD_BPF_SKEL.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 78 ++++++++++++++++++++++++--------------
 tools/perf/Makefile.perf   |  8 ++--
 2 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index d66b52407e19..f5ccbfc1a444 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -216,12 +216,6 @@ ifeq ($(call get-executable,$(BISON)),)
   dummy := $(error Error: $(BISON) is missing on this system, please install it)
 endif
 
-ifeq ($(BUILD_BPF_SKEL),1)
-  ifeq ($(call get-executable,$(CLANG)),)
-    dummy := $(error $(CLANG) is missing on this system, please install it to be able to build with BUILD_BPF_SKEL=1)
-  endif
-endif
-
 ifneq ($(OUTPUT),)
   ifeq ($(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\).\([0-9]\+\)/\1\2\3/g') \>\= 371), 1)
     BISON_FILE_PREFIX_MAP := --file-prefix-map=$(OUTPUT)=
@@ -530,6 +524,16 @@ ifdef CORESIGHT
   endif
 endif
 
+ifndef NO_ZLIB
+  ifeq ($(feature-zlib), 1)
+    CFLAGS += -DHAVE_ZLIB_SUPPORT
+    EXTLIBS += -lz
+    $(call detected,CONFIG_ZLIB)
+  else
+    NO_ZLIB := 1
+  endif
+endif
+
 ifndef NO_LIBELF
   CFLAGS += -DHAVE_LIBELF_SUPPORT
   EXTLIBS += -lelf
@@ -571,22 +575,28 @@ ifndef NO_LIBELF
 
   ifndef NO_LIBBPF
     ifeq ($(feature-bpf), 1)
-      CFLAGS += -DHAVE_LIBBPF_SUPPORT
-      $(call detected,CONFIG_LIBBPF)
-
       # detecting libbpf without LIBBPF_DYNAMIC, so make VF=1 shows libbpf detection status
       $(call feature_check,libbpf)
 
       ifdef LIBBPF_DYNAMIC
         ifeq ($(feature-libbpf), 1)
           EXTLIBS += -lbpf
+          CFLAGS += -DHAVE_LIBBPF_SUPPORT
+          $(call detected,CONFIG_LIBBPF)
           $(call detected,CONFIG_LIBBPF_DYNAMIC)
         else
           dummy := $(error Error: No libbpf devel library found or older than v1.0, please install/update libbpf-devel);
         endif
       else
-        # Libbpf will be built as a static library from tools/lib/bpf.
-	LIBBPF_STATIC := 1
+        ifeq ($(NO_ZLIB), 1)
+          dummy := $(warning Warning: Statically building libbpf not possible as zlib is missing)
+          NO_LIBBPF := 1
+        else
+          # Libbpf will be built as a static library from tools/lib/bpf.
+          LIBBPF_STATIC := 1
+          $(call detected,CONFIG_LIBBPF)
+          CFLAGS += -DHAVE_LIBBPF_SUPPORT
+        endif
       endif
     endif
   endif # NO_LIBBPF
@@ -663,16 +673,36 @@ ifndef NO_LIBBPF
   endif
 endif
 
-ifdef BUILD_BPF_SKEL
-  $(call feature_check,clang-bpf-co-re)
-  ifeq ($(feature-clang-bpf-co-re), 0)
-    dummy := $(error Error: clang too old/not installed. Please install recent clang to build with BUILD_BPF_SKEL)
-  endif
+ifndef BUILD_BPF_SKEL
+  # BPF skeletons control a large number of perf features, by default
+  # they are enabled.
+  BUILD_BPF_SKEL := 1
+endif
+
+ifeq ($(BUILD_BPF_SKEL),1)
   ifeq ($(filter -DHAVE_LIBBPF_SUPPORT, $(CFLAGS)),)
-    dummy := $(error Error: BPF skeleton support requires libbpf)
+    dummy := $(warning Warning: Disabled BPF skeletons as libbpf is required)
+    BUILD_BPF_SKEL := 0
+  else ifeq ($(filter -DHAVE_LIBELF_SUPPORT, $(CFLAGS)),)
+    dummy := $(warning Warning: Disabled BPF skeletons as libelf is required by bpftool)
+    BUILD_BPF_SKEL := 0
+  else ifeq ($(filter -DHAVE_ZLIB_SUPPORT, $(CFLAGS)),)
+    dummy := $(warning Warning: Disabled BPF skeletons as zlib is required by bpftool)
+    BUILD_BPF_SKEL := 0
+  else ifeq ($(call get-executable,$(CLANG)),)
+    dummy := $(warning Warning: Disabled BPF skeletons as clang ($(CLANG)) is missing)
+    BUILD_BPF_SKEL := 0
+  else
+    $(call feature_check,clang-bpf-co-re)
+    ifeq ($(feature-clang-bpf-co-re), 0)
+      dummy := $(warning Warning: Disabled BPF skeletons as clang is too old)
+      BUILD_BPF_SKEL := 0
+    endif
+  endif
+  ifeq ($(BUILD_BPF_SKEL),1)
+    $(call detected,CONFIG_PERF_BPF_SKEL)
+    CFLAGS += -DHAVE_BPF_SKEL
   endif
-  $(call detected,CONFIG_PERF_BPF_SKEL)
-  CFLAGS += -DHAVE_BPF_SKEL
 endif
 
 ifndef GEN_VMLINUX_H
@@ -946,16 +976,6 @@ ifndef NO_DEMANGLE
   endif
 endif
 
-ifndef NO_ZLIB
-  ifeq ($(feature-zlib), 1)
-    CFLAGS += -DHAVE_ZLIB_SUPPORT
-    EXTLIBS += -lz
-    $(call detected,CONFIG_ZLIB)
-  else
-    NO_ZLIB := 1
-  endif
-endif
-
 ifndef NO_LZMA
   ifeq ($(feature-lzma), 1)
     CFLAGS += -DHAVE_LZMA_SUPPORT
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 8d0f6d2bbc7a..98604e396ac3 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -120,7 +120,7 @@ include ../scripts/utilities.mak
 #
 # Define NO_LIBDEBUGINFOD if you do not want support debuginfod
 #
-# Define BUILD_BPF_SKEL to enable BPF skeletons
+# Set BUILD_BPF_SKEL to 0 to override BUILD_BPF_SKEL and not build BPF skeletons
 #
 # Define BUILD_NONDISTRO to enable building an linking against libbfd and
 # libiberty distribution license incompatible libraries.
@@ -1042,7 +1042,7 @@ SKELETONS += $(SKEL_OUT)/augmented_raw_syscalls.skel.h
 $(SKEL_TMP_OUT) $(LIBAPI_OUTPUT) $(LIBBPF_OUTPUT) $(LIBPERF_OUTPUT) $(LIBSUBCMD_OUTPUT) $(LIBSYMBOL_OUTPUT):
 	$(Q)$(MKDIR) -p $@
 
-ifdef BUILD_BPF_SKEL
+ifeq ($(CONFIG_PERF_BPF_SKEL),y)
 BPFTOOL := $(SKEL_TMP_OUT)/bootstrap/bpftool
 # Get Clang's default includes on this system, as opposed to those seen by
 # '--target=bpf'. This fixes "missing" files on some architectures/distros,
@@ -1120,11 +1120,11 @@ bpf-skel: $(SKELETONS)
 
 .PRECIOUS: $(SKEL_TMP_OUT)/%.bpf.o
 
-else # BUILD_BPF_SKEL
+else # CONFIG_PERF_BPF_SKEL
 
 bpf-skel:
 
-endif # BUILD_BPF_SKEL
+endif # CONFIG_PERF_BPF_SKEL
 
 bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
-- 
2.42.0.459.ge4e396fd5e-goog

