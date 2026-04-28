Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDA393DC8
	for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 23:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419929; cv=none; b=a1UcXbgGqduS6SRzj57b3YeOc/VbnxZMZuzaZNUGf0MrwM5R2rM/FBHqBcAIoH0cEt/vXb/hLITR0G4UvIU2gnsMWQ8hxYJlkKtzGDXyWPG7ex0NgBl7PmL7ZRWUeY2Zqzbbbv8rpMEMSPCAzCZut4r6yp2DAnT+Ujijr4YjNik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419929; c=relaxed/simple;
	bh=GPft9EUuymX/ePLsx8D1NAl+xxMNBZzC0iSHAXYAKbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caC3D/+QoQXJ6ms4ssdYTQ64VCjdA1U9bKn8eP2o8a4Z9k0ahE3eKkv7XUeV6ppc4nN8nGGAZa7cEhZ8RFljyvNt9j1XWWPU/1eqskP+E0GsFuqcgGdUebqvaAmMEmN7L2eeAv+goXjlfHZ0882QW0D+B16FrOhyWnSYX0Di4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jswuudw/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jswuudw/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so115848105e9.2
        for <llvm@lists.linux.dev>; Tue, 28 Apr 2026 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777419926; x=1778024726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GtYCp4rJQ2CdnwGIUcHG8UWOZSQ5VpjJC/jcAlis1wY=;
        b=Jswuudw/R9jlmIj0LHNZNElMrGC2F7hZ4KO4ZbMETWHoy6hE4zsOAr89qfO6+Kb8pz
         HPjBXQSmmGTrUw60W3k/ahoMI4MTFRzJrvJ4F7ClkHvORSohZoySlQwIuOsd6Zk2MK0T
         iX/0tQ5qmAR3IE20C8tfPanYyCSKGKPY/FNsFTlcG+J09sKMTKl3qNUDnf2uJdEcMn6z
         eZY1Tv4wlaEsrUwb+0XEgvQnT1PAIrU/UQDX0WT9tBE0E28olcg1h03eK67BokapPKd6
         dZFWE2vUn2O/frztrqo9wtq6C/AwSKpTbqR9wkGOmODkGCR1BT71Yf6/uJzkhzOav0ed
         N3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419926; x=1778024726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GtYCp4rJQ2CdnwGIUcHG8UWOZSQ5VpjJC/jcAlis1wY=;
        b=WizWinqRLwoYISfUiU51Bs3QZt4SitGv4wpgdsItmjB7wBoSNf7D784ADZ3SRl9iIY
         n1NNomf2S+KSwWuIIk16khORTbJT3KPuYt+JxzYI7q4M7Z4nXqIUKziBSx9c1gseZXCI
         l+ZhEx8Og5XNP0oVeTPXTobDw5/hfIWxG2iR/4AAbTCUrX3UzAaIGvJ+u78OqN5zPY6Y
         4yNLdgBJh1ht/m3jvnfz0lgZIL5NKQGjKJSx4g0nyLS5NnHtJQVpRIU+WdXPdG1qMOg/
         MYiY6E7EEG/QeT/WmgWHcApRhp1iQ8zcrF4u7OZ+Nl3chKvBWltKWDjOWoUze56TtvoX
         1PFw==
X-Forwarded-Encrypted: i=1; AFNElJ9flUmW4T/SLTfR6eJUsjkDgNu0ayTkou/y6yhVOZ1HXfH/9egALmn8pMbNzYbl3btN4OJn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/H0CPY/I/YAzVJScUPaAOHL9dn/TpDe1bpndL+ElrhcyKhgYb
	Ai53Aq8DPWsAPRNsXK5jaHkquVxZhhL4xa0c5LHo7/pP30GHtGX5eK6DStqtrXDdtRo=
X-Gm-Gg: AeBDiesZgBgeCtDAF8WNuwbibmStmBjOvR711ckRKx40HeU/IjbQXdgzMAJPhhIRgee
	OPz4/zgbG21ebldowNREiRwUtNDH3dsksuVq6K2WhmeE9mYlvc1+/BUoGBE7Aw+tgq3K9Th51gB
	cp1C4rm8APwhll+qIphPAj4xsSl2dMDvCLBkn/wOIEw9sSfZPqkPrmAaOXB40Vem+WB5G4AJUkM
	UI+LAVimCgkTrljcIDzRRcOkABYtDfzBlmIaeuhZYsSP6oZ/XoeTUTm3jZ1zk35iHXMCrl1rWlf
	o7aaJZxNUiNXoNZwTOmef1Mtsejlq8Od9zKzdGk1Zs3fb6yPVmxcrrP1TIU/6mBKodSWB+EKkiE
	iv8sUA8chIxsgDwraZBVpFH8e/1wsjrqI6WpylY27l+Z/BDiSncQUAFc6NjM/+leoXJ1E+iZWHt
	jpsUJMowHON08Uua5C+fF/kH24
X-Received: by 2002:a05:600c:6304:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48a77ae04aamr79854575e9.6.1777419926057;
        Tue, 28 Apr 2026 16:45:26 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62982135e26sm225938137.3.2026.04.28.16.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 16:45:25 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 28 Apr 2026 20:45:03 -0300
Subject: [PATCH bpf-next v8 02/11] selftests/bpf: Fix test_kmods KDIR to
 honor O= and distro kernels
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260428-selftests-bpf_misconfig-v8-2-bf02cf97dbcb@suse.com>
References: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
In-Reply-To: <20260428-selftests-bpf_misconfig-v8-0-bf02cf97dbcb@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777419912; l=5258;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=GPft9EUuymX/ePLsx8D1NAl+xxMNBZzC0iSHAXYAKbI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBh0V0v/XirpUaW7a5NSaeQFZb0bBC0Q55UNG58qrd0MeApRr3pt6OFEYcVcT9EYRkUjvrhb2qL
 z7+F/KpaTBAI=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

test_kmods/Makefile always pointed KDIR at the kernel source tree root,
ignoring O= and KBUILD_OUTPUT. On distro kernels where the source tree has
not been built, there was no fallback and the build would fail
unconditionally.

When O= or KBUILD_OUTPUT points at a prepared kernel build directory (one
containing Module.symvers), pass it through so kbuild can locate the
correct build infrastructure. Note that module artifacts still land in the
M= directory (test_kmods/); O= only controls where kbuild finds its build
infrastructure. Fall back to /lib/modules/$(uname -r)/build when neither an
explicit valid build directory nor an in-tree Module.symvers is present.

A selftests-only O= value (one that does not contain Module.symvers) is
intentionally not treated as a kernel build directory to avoid passing an
unrelated directory to kbuild. The parent bpf/Makefile resolves O= and
KBUILD_OUTPUT to absolute paths before invoking the test_kmods sub-make so
relative paths anchor to the user's invocation directory rather than the
sub-make's CWD.

Guard the clean target against a missing KDIR unconditionally. In
permissive mode, also guard the all target and make the parent Makefile's
cp step conditional so that a missing or unbuilt module does not abort the
build.

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
index 63c4d3f6a12f..dcba595b4b99 100644
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
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+else ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) modules
+endif
 
 clean:
-	$(Q)$(MAKE) -C $(KDIR) M=$(TEST_KMOD_DIR) clean
+ifneq ("$(wildcard $(KDIR))", "")
+	$(Q)$(MAKE) -C $(KDIR) $(if $(KMOD_O_VALID),O=$(KMOD_O_VALID),KBUILD_OUTPUT=) \
+		M=$(TEST_KMOD_DIR) clean
+endif

-- 
2.54.0

