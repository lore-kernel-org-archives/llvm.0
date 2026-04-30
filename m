Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C2740B6D1
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553616; cv=none; b=GmRmZ/gEq5bw3h7jXzaOtn0nUFk2qx2Of8YKbOSGE/Q7+Gtk1otbE3ZbiSn3F4Ux5+92uETmqArIxtsgTC5W5UFw90hbfewSZAoeWpmJkDVeZm9wIL/OrMiUg0jYdnA+1z7mA4mIgoAT9V9KGJn1D8JT3GKzHYWOAyj7jqxlFBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553616; c=relaxed/simple;
	bh=0QJYdccmCS5Xa21Yb/0zhA86xvgSH0oN6kSd6sMETRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vA8usFMTrnzsUAjmnITDeQGU2TLuzFLUSem1Dhio9rG6/dz0yDIT4MX2q5bav6KRR0pJLmCqsuhhHfQOpYSR3PLS+2oVTyzpDY/FmoueDjf5PLHu/yilTGri/wBTPQs/BuMZmIz9uoldXXCRH27+v569sutt/VwY1LxyVdzJQZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TRHPG7hf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TRHPG7hf"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso5418705e9.3
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553610; x=1778158410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gd4Mjpp2AlESfBnJvdKqbI6D/125UdC7Iwt7tAYiysY=;
        b=TRHPG7hfDBEgul0aOKEegJhS1ibWgt9k+j/wetzlFcu3vnqbH+E6iChNtzv2pdDt4r
         +VejxwEQOUXgJP/A5wkXsDr5Y/i0qqHW7ZXIsz7uDDP4zopGBL0h5oWpP0/xtLraEbtg
         onjxvS9d5tiK6KGCUHRLQDBAoRj7mndgTYwbZJt3GkDtm698oJeDDhfCrw3Sz5NABV2o
         V6bs519/Qnwo0J02ZuDeYU5K70zE5CQfe9gmBifBSo5aI879czNzGAbUh5Scp1xJTFOP
         pG7vPyGbNsFlBXOOw3GuAE8fobk7Kdl+X/lI+vm9GrZ9q7x5ag0DdCzPxLfsnq7DH79a
         whwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553610; x=1778158410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gd4Mjpp2AlESfBnJvdKqbI6D/125UdC7Iwt7tAYiysY=;
        b=VzqrqsndYZ3TD34DU2vgAO4aUVel8VMhyH2sYiBk+4mDSImnZmJOoQKuP8bIfNUD2B
         RXDHXNOMLm1Q9+UflF9Cc4xUJrulbSMPxHoHU/Gzkch9LjraKnxQBUUcOJzPV8gNK4nN
         FOACa66I0k95R0rNeQbM7STVhEj7KcoKyQL32VfbsucKPXqPP1pUerZFYL0uZvHkXKyY
         OI+MYeIBY2RjVpCr0KoLfE+32YAiZlPUJtyrehBRt5QRVDqcg+G6SR+GNbmMR9MMhfPz
         v1p2tHcT64rNASsxDLnt9Mr+LsVCgF+csC5Fzno6+C2ntU3Cm02IWdNG1+Fw7325wPJ3
         MyXw==
X-Forwarded-Encrypted: i=1; AFNElJ9gnlwL1C+eBZ5l3LXTZxlrrnhwE1fr7rsBziHpk0pPVbZsXhU2AfMg4h0poRIWfNoZN9+M@lists.linux.dev
X-Gm-Message-State: AOJu0YyPaxnvswIDuJDmM8GR/n77nilKro7aKAoNbkoqRpk8DDGgnxSR
	cAKyLknWEiqW9PGEOQ9kNrCdWa6EDxsxfMVceZldjYiGNFaH4vF7/oT7qNgOV8PdvIA=
X-Gm-Gg: AeBDievT3noX4E1Hn6seEkTiG2nHP5qeVXXIEqNMilmD3oIFEjz45lBx5M8dT/Je1og
	L7KEvj5FsDzVWXXtIpqkrq/jqleDqAo1+Z6C0NOgGvNuLD7Ba15XxicJ9xaiEPbHZcz4hbl5Dl5
	8X2uhXbNLbtWM0rd8UnJ0nAZSpJDWrRngbHb1GTTM2F8YvYWgA0Nb8cfnm6RTXc0pPtLDkbCqbw
	JfORQytQ2VXBlrTbXtEqsFty6VArhZltlZ0j5s824VnTX2+S+n7+od0o3h0q0Qa8ADUTlZx7WHN
	k9adpW58ezlpqRzZjDH02ya/3CJJzxTj3AoQA7mRoWkW5ORlj+m/hNBzC30DEE01OP45Ok8aMg0
	ffoqkj95YOZAYVeufvTn569gBZAQcCT+6H+psEz9+Ra+se51RZT9HdtuQNEnC3ElXkg9a70+goX
	pqeSQ4hNY9o/y0YRPe5YMAjWHKCUd9RB4tj08=
X-Received: by 2002:a05:600c:4f09:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48a844e4a91mr42949605e9.4.1777553610189;
        Thu, 30 Apr 2026 05:53:30 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12de320ecf9sm9556673c88.2.2026.04.30.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:29 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:14 -0300
Subject: [PATCH bpf-next v10 02/11] selftests/bpf: Fix test_kmods KDIR to
 honor O= and distro kernels
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-2-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=5932;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=0QJYdccmCS5Xa21Yb/0zhA86xvgSH0oN6kSd6sMETRU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMU4QeABYcR31gwl0/12eQdG/oYP2aQIWHpQR4t6nNBPDfefkyZ6cAE/hxk4awZjAFjMiMwmX0a
 ojDiUjbm6ugk=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. On distro kernels where the source tree has
not been built, the Makefile had no fallback and would fail
unconditionally.

When O= or KBUILD_OUTPUT is set and points at a prepared kernel build
directory (one containing Module.symvers), pass it through so kbuild can
locate the correct build infrastructure (scripts, Kconfig, etc.). Note
that the module artifacts themselves still land in the M= directory,
which is test_kmods/; O= only controls where kbuild finds its build
infrastructure. Fall back to /lib/modules/$(uname -r)/build when neither
an explicit valid build directory nor an in-tree Module.symvers is
present.

A selftests-only O= value (one that does not contain Module.symvers, e.g.
a private output directory) is intentionally not treated as a kernel
build directory. Without this guard, a user invoking
"make -C tools/testing/selftests/bpf O=/tmp/out" would have test_kmods
try to use /tmp/out as the kernel build dir and fail.

The parent bpf/Makefile resolves O= and KBUILD_OUTPUT to absolute paths
before invoking the test_kmods sub-make. Without this, $(abspath ...)
inside test_kmods/Makefile would resolve relative paths against the
sub-make's CWD (test_kmods/) rather than the user's invocation directory.

When O= is passed to kbuild, also pass KBUILD_OUTPUT=$(KMOD_O_VALID)
explicitly. The parent invocation lifts KBUILD_OUTPUT into MAKEFLAGS as
a command-line variable, which would otherwise suppress kbuild's own
"KBUILD_OUTPUT := $(O)" assignment and cause it to use the inherited
KBUILD_OUTPUT instead of the validated O=.

Guard both all and clean against a missing KDIR so the step is silently
skipped rather than fatal. Make the parent Makefile's cp conditional so it
does not abort when modules were not built.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile            | 10 +++++----
 tools/testing/selftests/bpf/test_kmods/Makefile | 30 ++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6094fe99b5f6..cc6ee7a2df93 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -296,13 +296,15 @@ $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c
 # subst() turns the rule into a pattern matching rule
 $(addprefix test_kmods/,$(subst .ko,%ko,$(TEST_KMODS))): $(VMLINUX_BTF) $(RESOLVE_BTFIDS) $(wildcard test_kmods/Makefile test_kmods/*.[ch])
 	$(Q)$(RM) test_kmods/*.ko test_kmods/*.mod.o # force re-compilation
-	$(Q)$(MAKE) $(submake_extras) -C test_kmods	\
-		RESOLVE_BTFIDS=$(RESOLVE_BTFIDS)	\
+	$(Q)$(MAKE) $(submake_extras) -C test_kmods				\
+		$(if $(O),O=$(abspath $(O)))					\
+		$(if $(KBUILD_OUTPUT),KBUILD_OUTPUT=$(abspath $(KBUILD_OUTPUT)))\
+		RESOLVE_BTFIDS=$(RESOLVE_BTFIDS)				\
 		EXTRA_CFLAGS='' EXTRA_LDFLAGS=''
 
 $(TEST_KMOD_TARGETS): $(addprefix test_kmods/,$(TEST_KMODS))
 	$(call msg,MOD,,$@)
-	$(Q)cp test_kmods/$(@F) $@
+	$(Q)$(if $(PERMISSIVE),if [ -f test_kmods/$(@F) ]; then )cp test_kmods/$(@F) $@$(if $(PERMISSIVE),; fi)
 
 
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
@@ -718,7 +720,7 @@ $(TRUNNER_LIB_OBJS): $(TRUNNER_OUTPUT)/%.o:$(TOOLSDIR)/lib/%.c
 $(TRUNNER_BINARY)-extras: $(TRUNNER_EXTRA_FILES) | $(TRUNNER_OUTPUT)
 ifneq ($2:$(OUTPUT),:$(shell pwd))
 	$$(call msg,EXT-COPY,$(TRUNNER_BINARY),$(TRUNNER_EXTRA_FILES))
-	$(Q)rsync -aq $$^ $(TRUNNER_OUTPUT)/
+	$(Q)rsync -aq $(if $(PERMISSIVE),--ignore-missing-args) $$^ $(TRUNNER_OUTPUT)/
 endif
 
 # some X.test.o files have runtime dependencies on Y.bpf.o files
diff --git a/tools/testing/selftests/bpf/test_kmods/Makefile b/tools/testing/selftests/bpf/test_kmods/Makefile
index 63c4d3f6a12f..031c7454ce65 100644
--- a/tools/testing/selftests/bpf/test_kmods/Makefile
+++ b/tools/testing/selftests/bpf/test_kmods/Makefile
@@ -1,5 +1,16 @@
 TEST_KMOD_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
-KDIR ?= $(abspath $(TEST_KMOD_DIR)/../../../../..)
+SRCTREE_KDIR := $(abspath $(TEST_KMOD_DIR)/../../../../..)
+# Honor O=/KBUILD_OUTPUT only if they point at a prepared kernel build
+# directory (one containing Module.symvers); otherwise treat the value as a
+# selftests-only output directory and fall back to in-tree or distro headers.
+# The parent bpf/Makefile resolves O=/KBUILD_OUTPUT to absolute paths before
+# invoking this sub-make so relative paths still anchor to the user's
+# invocation directory.
+KMOD_O := $(or $(O),$(KBUILD_OUTPUT))
+KMOD_O_VALID := $(if $(KMOD_O),$(if $(wildcard $(KMOD_O)/Module.symvers),$(KMOD_O)))
+KDIR ?= $(if $(KMOD_O_VALID),$(SRCTREE_KDIR), \
+	    $(if $(wildcard $(SRCTREE_KDIR)/Module.symvers),$(SRCTREE_KDIR), \
+		/lib/modules/$(shell uname -r)/build))
 
 ifeq ($(V),1)
 Q =
@@ -14,8 +25,21 @@ $(foreach m,$(MODULES),$(eval obj-m += $(m:.ko=.o)))
 
 CFLAGS_bpf_testmod.o = -I$(src)
 
+# When BPF_STRICT_BUILD != 0, a missing KDIR is fatal (the default).
+# When permissive, skip silently.
+PERMISSIVE := $(filter 0,$(BPF_STRICT_BUILD))
+
 all:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) modules
+ifeq ($(PERMISSIVE),)
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+else ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID) KBUILD_OUTPUT=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.54.0

