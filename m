Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0A952E043
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911786; cv=none; b=CsSaWVAfKenqcj+WoaPZ1TvixW05DpCgZI65xHaNHd68d6DDqjy3a4NjarCh7YW19JEnykZ6gGJctWp7VKvTiTwpvaH+IDgSIq1b/aq9amUvMqgxrDxbIfwWmoEwKY77QlNlzNFOv7BqpYQ8Xo4VNcvaJshogBCJnmP/Kslc5+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911786; c=relaxed/simple;
	bh=txHUBulABd3m0OF7Y53+6fpuw2qvy7g4Ft1wH9BXuaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2p8EGWOCdP3lE7L8DX08458FNf4mdyC/CIn2vwFXPNYJuLf4HkxKDxgrv1O5TzO1SZYJ8gjFBElkV7VxhplLpfTi05o7lCbjCEuJOSVbOoQu7quL0Z/7uTsjX7G/0GcHla6KbvdMRNj/1IDw+kwO7Qrn6lhg/c9d+JAEwEJlHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKbyv8Nl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKbyv8Nl"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so4463417a12.2
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 16:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911782; x=1789516582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKqFigUfUBeSnFW0KPe67v5MSiJ+XREL1Pj3ehWoLGc=;
        b=CKbyv8Nl//hKlwmhC4TG+bboOhvOceJ9BwQ1hWBjkREdGoFfKQz3wUR7kMr366Wnsc
         4N4mMJIuynPH2yoMJI8eaxhXs7AqXhzdr0dcGThR/nZj1VREBTO7YRf4Z6H56erXdlMH
         scAwoD/uBnxKuEHBtt0uZRQzRh2xEq6mTP5yBnua1gU5hJ6+G/O/alZe+3JV8zH9GRlU
         s7C2TmvfqN69hMXxR5vqWre4IyGsuqbuONQdyimBgu3rxGLK4lcWhWkQkmuQ0Xh1BbKW
         AsiwGhSF8uJ2iDuJZRD/OpqjdbAc/VLENjjdmSEsXBQ1z7s31WPIo6LbvZ8IQlRGWosG
         iuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911782; x=1789516582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKqFigUfUBeSnFW0KPe67v5MSiJ+XREL1Pj3ehWoLGc=;
        b=LorFjADBeKaAr4w4Snd2rpHs0zmi2/NC5nUj9OuwgHVaLMfKsBfpsGM91+nA4rlpAw
         2oqd11XWQx43asFs8bjBA7BsSmpWPq9/nsr1EOLriT/kkJqyYoOz/LGTEwnGQW75aNzV
         h0ALhqT/hcYsuLRXGyhgkeH0vWF9B3f/webv9zwSoy6ll0g+6jIAgWNHe84sintbV9wx
         Y5Rs0h2hAENcVHuUlIjkNwwJfcY/dACTAonQ0Ti8reut5wKh7/FrruIzgPttti/axq1d
         nmndX6RHOQIyDtfD2RqJNV/YnK3ubZg0No4h1sqgKzNluO3PvERRDiNUsqIZNtMf+att
         +Img==
X-Forwarded-Encrypted: i=1; AKwUvBw0CSBh0SQRzLFIK27AaNWONiGOg4S422tWwOKnnPCqJOBl/80iLo1DGacGEV1y991+7Vlg@lists.linux.dev
X-Gm-Message-State: AFuF++k2UPKwGWrIEI4mL8NyFfeMuMIQfIZXkhGY/QXoyKnFflG0+woL
	/+PpUoCTCKxMzSrg0s/+G2xP9fXvvh1+6mbmRnovlEXAZvmHZuhcbBbW
X-Gm-Gg: AYBFou04Vb4K0Fhgowg0iyMuKILgg/DCrDiNzMQ3WLb47u/iaLGqEdoLRlNRmUIbO8V
	RQMWewrffqRvMoVeiNFvOJo+iGKFQX6JoDrwo+/Nq3GS3riOsp7mo7m1ryDCIIxiP2wtcUOcYrj
	9B7kGgyBaDxOnPX/ibCoEMZpjC5tGlxZ4ayvu4FQIxjiw502VncnCBsOBt3i9M1/wMK+OEgl1QU
	BQph7FAt9eIQWLUYYvI9k95qL3BJVrHNwyp95dhI/hL2fdmUf6Dk6oVk7GW7DztSAtWHLJiaYKn
	3Eqds5+0YgKCg9z0OcXaRtZesUrVt5YMYmZPyesj6g6NF9NAAmX5+JAE5csdNz1iZ/9Qdn1zjld
	TC2JKSSVFv67tXfrmEyb47hpwvIPD4+mED9veoXiQ9Ipfjm+20vIud6vnqa2VxMlAfHm5KoJjoT
	V9Ly193Ly3b7Yw388EnQvTRxOWJjrTCi36SDyW5dcUpjqxj/YWUu+hYxU=
X-Received: by 2002:a17:90b:3809:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-39b260d333amr48826313a91.2.1788911781836;
        Tue, 08 Sep 2026 16:56:21 -0700 (PDT)
Received: from localhost ([2a03:2880:9ff:6b::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm33162529c88.6.2026.09.08.16.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:56:21 -0700 (PDT)
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	David Vernet <void@manifault.com>,
	Eduard Zingerman <eddyz87@gmail.com>
Cc: Viktor Malik <vmalik@redhat.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ziyang Men <ziyang.meme@gmail.com>,
	kernel-team@meta.com,
	linux-kselftest@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-input@vger.kernel.org,
	sched-ext@lists.linux.dev,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] selftests/sched_ext: build BPF schedulers via the shared lib.bpf.mk
Date: Tue,  8 Sep 2026 16:55:52 -0700
Message-ID: <20260908235552.2610256-5-ziyang.meme@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908235552.2610256-1-ziyang.meme@gmail.com>
References: <20260908235552.2610256-1-ziyang.meme@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_ext carries its own ~130 lines of libbpf + bpftool + vmlinux.h +
BPF-object + skeleton build machinery.  Replace it with an include of the
shared tools/testing/selftests/lib.bpf.mk, making sched_ext the third
in-tree consumer of that fragment, after selftests/cgroup and
selftests/hid.

All generated skeletons and subskeletons keep the same public API, and
the runner is built and linked the same way.

Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
Suggested-by: Mykola Lysenko <mykolal@meta.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Ziyang Men <ziyang.meme@gmail.com>
---
 tools/testing/selftests/sched_ext/Makefile | 149 ++++-----------------
 1 file changed, 26 insertions(+), 123 deletions(-)

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index 5d2dffca0e91..856fe7dea685 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -14,48 +14,29 @@ CURDIR := $(abspath .)
 REPOROOT := $(abspath ../../../..)
 TOOLSDIR := $(REPOROOT)/tools
 LIBDIR := $(TOOLSDIR)/lib
-BPFDIR := $(LIBDIR)/bpf
 TOOLSINCDIR := $(TOOLSDIR)/include
-BPFTOOLDIR := $(TOOLSDIR)/bpf/bpftool
-APIDIR := $(TOOLSINCDIR)/uapi
 GENDIR := $(REPOROOT)/include/generated
 GENHDR := $(GENDIR)/autoconf.h
-SCXTOOLSDIR := $(TOOLSDIR)/sched_ext
 SCXTOOLSINCDIR := $(TOOLSDIR)/sched_ext/include
 
-OUTPUT_DIR := $(OUTPUT)/build
-OBJ_DIR := $(OUTPUT_DIR)/obj
-INCLUDE_DIR := $(OUTPUT_DIR)/include
-BPFOBJ_DIR := $(OBJ_DIR)/libbpf
-SCXOBJ_DIR := $(OBJ_DIR)/sched_ext
-BPFOBJ := $(BPFOBJ_DIR)/libbpf.a
-LIBBPF_OUTPUT := $(OBJ_DIR)/libbpf/libbpf.a
-
-DEFAULT_BPFTOOL := $(OUTPUT_DIR)/host/sbin/bpftool
-HOST_OBJ_DIR := $(OBJ_DIR)/host/bpftool
-HOST_LIBBPF_OUTPUT := $(OBJ_DIR)/host/libbpf/
-HOST_LIBBPF_DESTDIR := $(OUTPUT_DIR)/host/
-HOST_DESTDIR := $(OUTPUT_DIR)/host/
-
-VMLINUX_BTF_PATHS ?= $(if $(O),$(O)/vmlinux)					\
-		     $(if $(KBUILD_OUTPUT),$(KBUILD_OUTPUT)/vmlinux)		\
-		     ../../../../vmlinux					\
-		     /sys/kernel/btf/vmlinux					\
-		     /boot/vmlinux-$(shell uname -r)
-VMLINUX_BTF ?= $(abspath $(firstword $(wildcard $(VMLINUX_BTF_PATHS))))
-ifeq ($(VMLINUX_BTF),)
-$(error Cannot find a vmlinux for VMLINUX_BTF at any of "$(VMLINUX_BTF_PATHS)")
-endif
+# Build scheduler skeletons and subskeletons with the shared BPF rules.
+BPF_SRCS        := $(wildcard *.bpf.c)
+BPF_SKEL_EXT    := .bpf.skel.h
+BPF_GEN_SUBSKEL := 1
+# Preserve the existing build/ layout.
+BPF_OBJ_DIR  := $(OUTPUT)/build/obj/sched_ext
+BPF_SKEL_DIR := $(OUTPUT)/build/include
+SCXOBJ_DIR   := $(BPF_OBJ_DIR)
 
-BPFTOOL ?= $(DEFAULT_BPFTOOL)
+include ../lib.bpf.mk
 
 ifneq ($(wildcard $(GENHDR)),)
   GENFLAGS := -DHAVE_GENHDR
 endif
 
 CFLAGS += -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)			\
-	  -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)				\
-	  -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include -I$(SCXTOOLSINCDIR)
+	  -I$(GENDIR) -I$(LIBDIR) -I$(TOOLSINCDIR) -I$(APIDIR)			\
+	  -I$(CURDIR)/include -I$(SCXTOOLSINCDIR)
 
 # Silence some warnings when compiled with clang
 ifneq ($(LLVM),)
@@ -64,102 +45,26 @@ endif
 
 LDFLAGS = -lelf -lz -lpthread -lzstd
 
-IS_LITTLE_ENDIAN = $(shell $(CC) -dM -E - </dev/null |				\
-			grep 'define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__')
-
-# Get Clang's default includes on this system, as opposed to those seen by
-# '-target bpf'. This fixes "missing" files on some architectures/distros,
-# such as asm/byteorder.h, asm/socket.h, asm/sockios.h, sys/cdefs.h etc.
-#
-# Use '-idirafter': Don't interfere with include mechanics except where the
-# build would have failed anyways.
-define get_sys_includes
-$(shell $(1) $(2) -v -E - </dev/null 2>&1 \
-	| sed -n '/<...> search starts here:/,/End of search list./{ s| \(/.*\)|-idirafter \1|p }') \
-$(shell $(1) $(2) -dM -E - </dev/null | grep '__riscv_xlen ' | awk '{printf("-D__riscv_xlen=%d -D__BITS_PER_LONG=%d", $$3, $$3)}')
-endef
-
-ifneq ($(CROSS_COMPILE),)
-CLANG_TARGET_ARCH = --target=$(notdir $(CROSS_COMPILE:%-=%))
-endif
-
-CLANG_SYS_INCLUDES = $(call get_sys_includes,$(CLANG),$(CLANG_TARGET_ARCH))
-
-BPF_CFLAGS = -g -D__TARGET_ARCH_$(SRCARCH)					\
-	     $(if $(IS_LITTLE_ENDIAN),-mlittle-endian,-mbig-endian)		\
+# Preserve the scheduler-specific flags; the shared recipe adds target flags.
+BPF_CFLAGS = -g -D__TARGET_ARCH_$(SRCARCH) $(MENDIAN)				\
 	     -I$(CURDIR)/include -I$(CURDIR)/include/bpf-compat			\
 	     -I$(INCLUDE_DIR) -I$(APIDIR) -I$(SCXTOOLSINCDIR)			\
 	     -I$(REPOROOT)/include						\
-	     $(CLANG_SYS_INCLUDES) 						\
+	     $(CLANG_SYS_INCLUDES)						\
 	     -Wall -Wno-compare-distinct-pointer-types				\
 	     -Wno-incompatible-function-pointer-types				\
 	     -Wno-microsoft-anon-tag						\
 	     -fms-extensions							\
-	     -O2 -mcpu=v3
-
-# sort removes libbpf duplicates when not cross-building
-MAKE_DIRS := $(sort $(OBJ_DIR)/libbpf $(OBJ_DIR)/libbpf				\
-	       $(OBJ_DIR)/bpftool $(OBJ_DIR)/resolve_btfids			\
-	       $(HOST_OBJ_DIR) $(INCLUDE_DIR) $(SCXOBJ_DIR))
-
-$(MAKE_DIRS):
-	$(call msg,MKDIR,,$@)
-	$(Q)mkdir -p $@
-
-$(BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)			\
-	   $(APIDIR)/linux/bpf.h						\
-	   | $(OBJ_DIR)/libbpf
-	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/	\
-		    ARCH=$(ARCH) CC="$(CC)" CROSS_COMPILE=$(CROSS_COMPILE)	\
-		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
-		    DESTDIR=$(OUTPUT_DIR) prefix= all install_headers
-
-$(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)	\
-		    $(LIBBPF_OUTPUT) | $(HOST_OBJ_DIR)
-	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)				\
-		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD)		\
-		    EXTRA_CFLAGS='-g -O0'					\
-		    OUTPUT=$(HOST_OBJ_DIR)/					\
-		    LIBBPF_OUTPUT=$(HOST_LIBBPF_OUTPUT)				\
-		    LIBBPF_DESTDIR=$(HOST_LIBBPF_DESTDIR)			\
-		    prefix= DESTDIR=$(HOST_DESTDIR) install-bin
-
-$(INCLUDE_DIR)/vmlinux.h: $(VMLINUX_BTF) $(BPFTOOL) | $(INCLUDE_DIR)
-ifeq ($(VMLINUX_H),)
-	$(call msg,GEN,,$@)
-	$(Q)$(BPFTOOL) btf dump file $(VMLINUX_BTF) format c > $@
-else
-	$(call msg,CP,,$@)
-	$(Q)cp "$(VMLINUX_H)" $@
-endif
-
-$(SCXOBJ_DIR)/%.bpf.o: %.bpf.c $(INCLUDE_DIR)/vmlinux.h	| $(BPFOBJ) $(SCXOBJ_DIR)
-	$(call msg,CLNG-BPF,,$(notdir $@))
-	$(Q)$(CLANG) $(BPF_CFLAGS) -target bpf -c $< -o $@
+	     $(BPF_EXTRA_CFLAGS)
 
-$(INCLUDE_DIR)/%.bpf.skel.h: $(SCXOBJ_DIR)/%.bpf.o $(INCLUDE_DIR)/vmlinux.h $(BPFTOOL) | $(INCLUDE_DIR)
-	$(eval sched=$(notdir $@))
-	$(call msg,GEN-SKEL,,$(sched))
-	$(Q)$(BPFTOOL) gen object $(<:.o=.linked1.o) $<
-	$(Q)$(BPFTOOL) gen object $(<:.o=.linked2.o) $(<:.o=.linked1.o)
-	$(Q)$(BPFTOOL) gen object $(<:.o=.linked3.o) $(<:.o=.linked2.o)
-	$(Q)diff $(<:.o=.linked2.o) $(<:.o=.linked3.o)
-	$(Q)$(BPFTOOL) gen skeleton $(<:.o=.linked3.o) name $(subst .bpf.skel.h,,$(sched)) > $@
-	$(Q)$(BPFTOOL) gen subskeleton $(<:.o=.linked3.o) name $(subst .bpf.skel.h,,$(sched)) > $(@:.skel.h=.subskel.h)
+EXTRA_CLEAN += $(OUTPUT)/build
 
 ################
 # C schedulers #
 ################
 
-override define CLEAN
-	rm -rf $(OUTPUT_DIR)
-	rm -f $(TEST_GEN_PROGS)
-endef
-
-# Every testcase takes all of the BPF progs are dependencies by default. This
-# allows testcases to load any BPF scheduler, which is useful for testcases
-# that don't need their own prog to run their test.
-all_test_bpfprogs := $(foreach prog,$(wildcard *.bpf.c),$(INCLUDE_DIR)/$(patsubst %.c,%.skel.h,$(prog)))
+# Build every scheduler before each test.
+all_test_bpfprogs := $(BPF_SKELS)
 
 auto-test-targets :=			\
 	create_dsq			\
@@ -195,24 +100,22 @@ auto-test-targets :=			\
 testcase-targets := $(addsuffix .o,$(addprefix $(SCXOBJ_DIR)/,$(auto-test-targets)))
 
 $(SCXOBJ_DIR)/runner.o: runner.c | $(SCXOBJ_DIR) $(BPFOBJ)
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) -c $< -o $@
 
 # Create all of the test targets object files, whose testcase objects will be
 # registered into the runner in ELF constructors.
-#
-# Note that we must do double expansion here in order to support conditionally
-# compiling BPF object files only if one is present, as the wildcard Make
-# function doesn't support using implicit rules otherwise.
 $(testcase-targets): $(SCXOBJ_DIR)/%.o: %.c $(SCXOBJ_DIR)/runner.o $(all_test_bpfprogs) | $(SCXOBJ_DIR)
-	$(eval test=$(patsubst %.o,%.c,$(notdir $@)))
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) -c $< -o $@
 
 $(SCXOBJ_DIR)/util.o: util.c | $(SCXOBJ_DIR)
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(call msg,CC,,$@)
+	$(Q)$(CC) $(CFLAGS) -c $< -o $@
 
 $(OUTPUT)/runner: $(SCXOBJ_DIR)/runner.o $(SCXOBJ_DIR)/util.o $(BPFOBJ) $(testcase-targets)
-	@echo "$(testcase-targets)"
-	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
+	$(call msg,BINARY,,$@)
+	$(Q)$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
 
 .DEFAULT_GOAL := all
 
-- 
2.53.0-Meta

