Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1CF32B998
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602966; cv=none; b=G2QCmVJu0UMsFX2eDsLBn46O5DK8HDRNCZZq29byKTVvOQsTDAT5ePMdK7lanrQHU2rOqN+EQUF7bonHgCqpBC5bSr/PofdL/sL6RSY5THDbmFgyivWjWjzdMKcGl1boDBcin1cMvO2nN3Z9hYl2BXtMzi8KV015lHx3uXsZZvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602966; c=relaxed/simple;
	bh=SpOlLR5RnFo8iIKIWl4mbtRGkAQPWiArijnvyIW/b4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cTRzVynw9nuy24IX8svUqK5ghv90ljDcM/ZVVoBzRRlpnyTlR63/l+3urI7v5tthHPox7pQJdJsJtSZRgoomvBJeJ3TQkPYWKMg1EL919rhC5MYIVmsIv2l8SiiM4lVc6ljhDDFEsBQXcQOS225xdFoSxn4vtRhVmJvvhBsTu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v2gTpxTg; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v2gTpxTg"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-33bc5d7c289so9626214a91.0
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 15:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761602962; x=1762207762; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MABumZwH6isM2C1P4GdxLdhOL8tfk2ZitqwVmPx6KfQ=;
        b=v2gTpxTgTAL1gU2TzbuiwV0tHYI5oT78BmdUoJsWMZfgTIi7p2avIwOry/3deKGKYg
         wDlmn9xIXgT97YxuplOj5DyyjaYkyNcx3x56a+E3o0HDpKwZvbvZlpJ3oweckLfJYZ7G
         zHeMgaJ2yTXQMLgLKw+NpMBP8h5KhTZ6+28mhIuZBHOJFKr65ZHfK+77q9aox2jKl1uR
         ya1D/dHCdycf3MJ251YkQyfqxBGBS7l1vqeYFOY3ciGrL9wqDLNDp3bldajzgioeJ3j9
         oJAmTCpO/ZYVKDnTVZq/5qNDUOHdDr+NQ6+OWNF8GkZKnM/R+6oFcGCM8MMomuQTx+DV
         JxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602962; x=1762207762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MABumZwH6isM2C1P4GdxLdhOL8tfk2ZitqwVmPx6KfQ=;
        b=JFQLPmBYYzyz0L9fW47x/rPtaI92GECyw+/8HCA7pZlqmeo/1abvWV4HLlFZD+j7Fe
         Z+Uy1BBG0V5Bo+7g+nFRY5EvzRtjw13JpmLEdS67yN/ZrGBFzQ9BbFn78jw6Y/Y/Ixji
         6ZEcrN0f8fd0FAQISYuUpmebg7x2RmbZ2kvmeDI74+tyEth83Fa7fEZk+eSvmuKRmOfG
         pdS5nlwpVd3kJ/eSJq6b78lVkj0TiKmZbqqVJV80tDwT2nGtTeCZEAc0v9Jv0YNWwqs8
         EZhmhT2C/8RJCaGpc9JdAAyBOVSZ862AAA5V5YwSuRWGq2cnRKg8nV09/1MQ+J2Msyw0
         LqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+UHJH9YLua9Vyte5Qf5XDO0OHBV3CUOFLwK+WcbZKP3p4CafNDjMyq4iD7GKtD0ffvnmO@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9Y2UcN64GasIdsmRDUz23QyEFejgTqjkke7xa6pMapHcQvVlx
	BD6GphzjfYJnSR+UGySW41sOAhxoxOronltTsb4hJ+SEfPEgQAIZbwJjQCQEwWfPnU5oZA==
X-Google-Smtp-Source: AGHT+IF0SDbxWzAiNDxQIpBAoHx/djb9jE9MDJkbzGhBOaTqIZMZmehEEKhvBV1cY6HmFg3/3gSb9Lg=
X-Received: from pjbnm10.prod.google.com ([2002:a17:90b:19ca:b0:33b:b0fe:e54d])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e50:b0:32e:64ca:e84a
 with SMTP id 98e67ed59e1d1-340279f1b38mr1606499a91.12.1761602962615; Mon, 27
 Oct 2025 15:09:22 -0700 (PDT)
Date: Mon, 27 Oct 2025 22:09:14 +0000
In-Reply-To: <20251027220914.2665978-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251027220914.2665978-1-xur@google.com>
X-Mailer: git-send-email 2.51.1.838.g19442a804e-goog
Message-ID: <20251027220914.2665978-3-xur@google.com>
Subject: [PATCH v4 2/2] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

Add distributed ThinLTO build support for the Linux kernel.
This new mode offers several advantages: (1) Increased
flexibility in handling user-specified build options.
(2) Improved user-friendliness for developers. (3) Greater
convenience for integrating with objtool and livepatch.

Note that "distributed" in this context refers to a term
that differentiates in-process ThinLTO builds by invoking
backend compilation through the linker, not necessarily
building in distributed environments.

Distributed ThinLTO is enabled via the
`CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
 > make LLVM=1 defconfig
 > scripts/config -e LTO_CLANG_THIN_DIST
 > make LLVM=1 oldconfig
 > make LLVM=1 vmlinux -j <..>

The build flow proceeds in four stages:
  1. Perform FE compilation, mirroring the in-process ThinLTO mode.
  2. Thin-link the generated IR files and object files.
  3. Find all IR files and perform BE compilation, using the flags
    stored in the .*.o.cmd files.
  4. Link the BE results to generate the final vmlinux.o.

NOTE: This patch currently implements the build for the main kernel
image (vmlinux) only. Kernel module support is planned for a
subsequent patch.

Tested on the following arch: x86, arm64, loongarch, and
riscv.

The earlier implementation details can be found here:
https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934

Signed-off-by: Rong Xu <xur@google.com>
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 .gitignore                 |  2 ++
 Makefile                   |  9 +++++----
 arch/Kconfig               | 19 ++++++++++++++++++
 scripts/Makefile.lib       |  7 +++++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_a | 37 +++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++++++++---
 7 files changed, 122 insertions(+), 7 deletions(-)
 create mode 100644 scripts/Makefile.thinlto

diff --git a/.gitignore b/.gitignore
index 86a1ba0d90353..d34f28ca55400 100644
--- a/.gitignore
+++ b/.gitignore
@@ -55,6 +55,7 @@
 *.zst
 Module.symvers
 dtbs-list
+builtin.order
 modules.order
 
 #
@@ -66,6 +67,7 @@ modules.order
 /vmlinux.32
 /vmlinux.map
 /vmlinux.symvers
+/vmlinux.thinlto-index
 /vmlinux.unstripped
 /vmlinux-gdb.py
 /vmlinuz
diff --git a/Makefile b/Makefile
index 89a25bac2bbab..a608a082599d9 100644
--- a/Makefile
+++ b/Makefile
@@ -1000,10 +1000,10 @@ export CC_FLAGS_SCS
 endif
 
 ifdef CONFIG_LTO_CLANG
-ifdef CONFIG_LTO_CLANG_THIN
-CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
-else
+ifdef CONFIG_LTO_CLANG_FULL
 CC_FLAGS_LTO	:= -flto
+else
+CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
 endif
 CC_FLAGS_LTO	+= -fvisibility=hidden
 
@@ -1572,6 +1572,7 @@ endif # CONFIG_MODULES
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
+	       vmlinux.thinlto-index builtin.order \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
                .builtin-dtbs-list .builtin-dtb.S
@@ -2014,7 +2015,7 @@ clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
-		-o -name '*.ko.*' \
+		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
 		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
 		-o -name '*.dt.yaml' -o -name 'dtbs-list' \
diff --git a/arch/Kconfig b/arch/Kconfig
index 74ff011335322..f323ff2f12f87 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -864,6 +864,25 @@ config LTO_CLANG_THIN
 	    https://clang.llvm.org/docs/ThinLTO.html
 
 	  If unsure, say Y.
+
+config LTO_CLANG_THIN_DIST
+	bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
+	depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
+	select LTO_CLANG
+	help
+	  This option enables Clang's ThinLTO in distributed build mode.
+	  In this mode, the linker performs the thin-link, generating
+	  ThinLTO index files. Subsequently, the build system explicitly
+	  invokes ThinLTO backend compilation using these index files
+	  and pre-linked IR objects. The resulting native object files
+	  are with the .thinlto-native.o suffix.
+
+	  This build mode offers improved visibility into the ThinLTO
+	  process through explicit subcommand exposure. It also makes
+	  final native object files directly available, benefiting
+	  tools like objtool and kpatch. Additionally, it provides
+	  crucial granular control over back-end options, enabling
+	  module-specific compiler options, and simplifies debugging.
 endchoice
 
 config ARCH_SUPPORTS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66f..65470adaa89ca 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -239,6 +239,12 @@ ifdef CONFIG_LTO_CLANG
 cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
 endif
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Save the _c_flags, sliently.
+quiet_cmd_save_c_flags =
+      cmd_save_c_flags = printf '\n%s\n' 'saved_c_flags_$@ := $(_c_flags)' >> $(dot-target).cmd
+endif
+
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single) \
@@ -246,6 +252,7 @@ quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd,save_c_flags)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
diff --git a/scripts/Makefile.thinlto b/scripts/Makefile.thinlto
new file mode 100644
index 0000000000000..03349ac69de5f
--- /dev/null
+++ b/scripts/Makefile.thinlto
@@ -0,0 +1,40 @@
+PHONY := __default
+__default:
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+native-objs := $(patsubst %.o,%.thinlto-native.o,$(call read-file, vmlinux.thinlto-index))
+
+__default: $(native-objs)
+
+# Generate .thinlto-native.o (obj) from .o (bitcode) and .thinlto.bc (summary) files
+# ---------------------------------------------------------------------------
+quiet_cmd_cc_o_bc = CC $(quiet_modtag)  $@
+      be_flags = $(shell sed -n '/saved_c_flags_/s/.*:= //p' \
+		 $(dir $(<)).$(notdir $(<)).cmd)
+      cmd_cc_o_bc = \
+      $(CC) $(be_flags) -x ir -fno-lto -Wno-unused-command-line-argument \
+      -fthinlto-index=$(word 2, $^) -c -o $@ $<
+
+targets += $(native-objs)
+$(native-objs): %.thinlto-native.o: %.o %.o.thinlto.bc   FORCE
+	$(call if_changed,cc_o_bc)
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2f..382cebe1ee571 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -21,6 +21,41 @@ targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_builtin_fixup)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+
+quiet_cmd_builtin.order = GEN     $@
+      cmd_builtin.order = $(AR) t $< > $@
+
+targets += builtin.order
+builtin.order: built-in-fixup.a FORCE
+	$(call if_changed,builtin.order)
+
+quiet_cmd_ld_thinlto_index = LD      $@
+      cmd_ld_thinlto_index = \
+	$(LD) $(KBUILD_LDFLAGS) -r --thinlto-index-only=$@ @$<
+
+targets += vmlinux.thinlto-index
+vmlinux.thinlto-index: builtin.order FORCE
+	$(call if_changed,ld_thinlto_index)
+
+quiet_cmd_ar_vmlinux.a = GEN     $@
+      cmd_ar_vmlinux.a =					\
+	rm -f $@;						\
+	while read -r obj; do					\
+		if grep -q $${obj} $(word 2, $^); then		\
+			echo $${obj%.o}.thinlto-native.o;	\
+		else						\
+			echo $${obj};				\
+		fi;						\
+	done < $< | xargs $(AR) cDPrS --thin $@
+
+targets += vmlinux.a
+vmlinux.a: builtin.order vmlinux.thinlto-index FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.thinlto
+	$(call if_changed,ar_vmlinux.a)
+
+else
+
 # vmlinux.a
 # ---------------------------------------------------------------------------
 
@@ -28,6 +63,8 @@ targets += vmlinux.a
 vmlinux.a: built-in-fixup.a FORCE
 	$(call if_changed,copy)
 
+endif
+
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 47c8aa2a69392..38f62eb4bd8ba 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1473,13 +1473,22 @@ static void extract_crcs_for_object(const char *object, struct module *mod)
 	char cmd_file[PATH_MAX];
 	char *buf, *p;
 	const char *base;
-	int dirlen, ret;
+	int dirlen, baselen_without_suffix, ret;
 
 	base = get_basename(object);
 	dirlen = base - object;
 
-	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%s.cmd",
-		       dirlen, object, base);
+	baselen_without_suffix = strlen(object) - dirlen - strlen(".o");
+
+	/*
+	 * When CONFIG_LTO_CLANG_THIN_DIST=y, the ELF is *.thinlto-native.o
+	 * but the symbol CRCs are recorded in *.o.cmd file.
+	 */
+	if (strends(object, ".thinlto-native.o"))
+		baselen_without_suffix -= strlen(".thinlto-native");
+
+	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%.*s.o.cmd",
+		       dirlen, object, baselen_without_suffix, base);
 	if (ret >= sizeof(cmd_file)) {
 		error("%s: too long path was truncated\n", cmd_file);
 		return;
-- 
2.51.1.838.g19442a804e-goog

