Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E351C2B
	for <llvm@lists.linux.dev>; Sun, 11 Dec 2022 13:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DE3C433EF;
	Sun, 11 Dec 2022 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670763863;
	bh=Xic9HRp6xQVGQZjjCvAaASkUaXZAG9Z4CIG2ZfttFHY=;
	h=From:To:Cc:Subject:Date:From;
	b=hXIVlWe8x7vJgwKNkFoAfdOLZpnLVZQAkgfiJgA1zgEfno1WvyijqCjZehXZvfQRA
	 fgoQRHOD8fz5nF46cOLpTaimBzeb3WV+xzGgpq1yP7uQ02mbLv4eNG5XrBMrDvyqFc
	 mz8T3HeyKuwOL7VlS4mL1x8stSN/ZwIplQ9WdCIWryyv+mzui0ORvluTFVCsyw0vV0
	 yxMoMDJKYWc5fSGQilbhO8vTWhnNzDBm4tpb8o9llm39P4CkDGv8p0rzLwCwsTL6yE
	 PpZTjVGhgX4PBoKflzZ8apiiCjecKIU/jxKpjVt+7JiHOApv6KIv+dFedXqDg0/lDR
	 HYDzsuXnkHLyg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-modules@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] kbuild: change module.order to list *.o instead of *.ko
Date: Sun, 11 Dec 2022 22:04:07 +0900
Message-Id: <20221211130408.2800314-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/Makefile.build replaces the suffix .o with .ko, then
scripts/Makefile.modpost calls the sed command to change .ko back
to the original .o suffix.

Instead of converting the suffixes back-and-forth, store the .o paths
in modules.order, and replace it with .ko in 'make modules_install'.

This avoids the unneeded sed command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                                    |  2 +-
 scripts/Makefile.build                      |  2 +-
 scripts/Makefile.modfinal                   |  6 +++---
 scripts/Makefile.modinst                    |  2 +-
 scripts/Makefile.modpost                    |  7 +++++--
 scripts/clang-tools/gen_compile_commands.py |  8 ++++----
 scripts/mod/modpost.c                       | 11 ++++-------
 scripts/modules-check.sh                    |  2 +-
 8 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/Makefile b/Makefile
index 8b5930d521fc..669e25970917 100644
--- a/Makefile
+++ b/Makefile
@@ -1569,7 +1569,7 @@ __modinst_pre:
 		rm -f $(MODLIB)/build ; \
 		ln -s $(CURDIR) $(MODLIB)/build ; \
 	fi
-	@sed 's:^:kernel/:' modules.order > $(MODLIB)/modules.order
+	@sed 's:^\(.*\)\.o$$:kernel/\1.ko:' modules.order > $(MODLIB)/modules.order
 	@cp -f modules.builtin $(MODLIB)/
 	@cp -f $(objtree)/modules.builtin.modinfo $(MODLIB)/
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 799df12b53f3..267eb7aac5b2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -435,7 +435,7 @@ $(obj)/built-in.a: $(real-obj-y) FORCE
 # modules.order unless contained modules are updated.
 
 cmd_modules_order = { $(foreach m, $(real-prereqs), \
-	$(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.o,%.ko,$m));) :; } \
+	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
 	> $@
 
 $(obj)/modules.order: $(obj-m) FORCE
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 83f2797e530c..a30d5b08eee9 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -15,7 +15,7 @@ include $(srctree)/scripts/Makefile.lib
 # find all modules listed in modules.order
 modules := $(call read-file, $(MODORDER))
 
-__modfinal: $(modules)
+__modfinal: $(modules:%.o=%.ko)
 	@:
 
 # modname and part-of-module are set to make c_flags define proper module flags
@@ -57,13 +57,13 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-$(modules): %.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
+%.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 
-targets += $(modules) $(modules:.ko=.mod.o)
+targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 65aac6be78ec..836391e5d209 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -26,7 +26,7 @@ suffix-$(CONFIG_MODULE_COMPRESS_GZIP)	:= .gz
 suffix-$(CONFIG_MODULE_COMPRESS_XZ)	:= .xz
 suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)	:= .zst
 
-modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
+modules := $(patsubst $(extmod_prefix)%.o, $(dst)/%.ko$(suffix-y), $(modules))
 
 __modinst: $(modules)
 	@:
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 55a72f5eb76d..f814a6acd200 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -107,7 +107,10 @@ ifneq ($(KBUILD_MODPOST_WARN)$(missing-input),)
 modpost-args += -w
 endif
 
-modorder-if-needed := $(if $(KBUILD_MODULES), $(MODORDER))
+ifdef KBUILD_MODULES
+modorder-if-needed := $(MODORDER)
+modpost-args += -T $(MODORDER)
+endif
 
 MODPOST = scripts/mod/modpost
 
@@ -119,7 +122,7 @@ quiet_cmd_modpost = MODPOST $@
 		echo >&2 "WARNING: $(missing-input) is missing."; \
 		echo >&2 "         Modules may not have dependencies or modversions."; \
 		echo >&2 "         You may get many unresolved symbol warnings.";) \
-	sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) -T - $(vmlinux.o-if-present)
+	$(MODPOST) $(modpost-args) $(vmlinux.o-if-present)
 
 targets += $(output-symdump)
 $(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(module.symvers-if-present) $(MODPOST) FORCE
diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index d800b2c0af97..0227522959a4 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -138,10 +138,10 @@ def cmdfiles_for_modorder(modorder):
     """
     with open(modorder) as f:
         for line in f:
-            ko = line.rstrip()
-            base, ext = os.path.splitext(ko)
-            if ext != '.ko':
-                sys.exit('{}: module path must end with .ko'.format(ko))
+            obj = line.rstrip()
+            base, ext = os.path.splitext(obj)
+            if ext != '.o':
+                sys.exit('{}: module path must end with .o'.format(obj))
             mod = base + '.mod'
             # Read from *.mod, to get a list of objects that compose the module.
             with open(mod) as m:
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 56d856f2e511..b48838a71bf6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1856,11 +1856,9 @@ static void read_symbols_from_files(const char *filename)
 	FILE *in = stdin;
 	char fname[PATH_MAX];
 
-	if (strcmp(filename, "-") != 0) {
-		in = fopen(filename, "r");
-		if (!in)
-			fatal("Can't open filenames file %s: %m", filename);
-	}
+	in = fopen(filename, "r");
+	if (!in)
+		fatal("Can't open filenames file %s: %m", filename);
 
 	while (fgets(fname, PATH_MAX, in) != NULL) {
 		if (strends(fname, "\n"))
@@ -1868,8 +1866,7 @@ static void read_symbols_from_files(const char *filename)
 		read_symbols(fname);
 	}
 
-	if (in != stdin)
-		fclose(in);
+	fclose(in);
 }
 
 #define SZ 500
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index e06327722263..4c8da90de78e 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -16,7 +16,7 @@ check_same_name_modules()
 	for m in $(sed 's:.*/::' "$1" | sort | uniq -d)
 	do
 		echo "error: the following would cause module name conflict:" >&2
-		sed -n "/\/$m/s:^:  :p" "$1" >&2
+		sed -n "/\/$m/s:^\(.*\)\.o\$:  \1.ko:p" "$1" >&2
 		exit_code=1
 	done
 }
-- 
2.34.1

