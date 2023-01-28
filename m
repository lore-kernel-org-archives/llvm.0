Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E86FBB
	for <llvm@lists.linux.dev>; Sat, 28 Jan 2023 17:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AB3C4339B;
	Sat, 28 Jan 2023 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927530;
	bh=v3mGrohSr9bDJCU80FA5vw5BtHfkP5BeWMETdmxm4ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJ77Hd9pAM2KjrvlAv7HMI+wb6gmzEBp0khlIkiklt15F6IdOiKaoQ+ctKHDdQQ3T
	 Qwnwxnnkn5iiRHWRcnoWV31HAMhIAQM7rVeQdBApeS1+eoijx2RAWdhOuY5XHpduAU
	 tibyai5jwb+Md3UW01iGzsg7n/R1hBXfCVX6cU7qBm4P3IQVWSrjMdg0XNQYTQlek5
	 U8fR58y7chseduKcSV+NUyCOt9P6tYeFnBkHe9/r9AUGTB5Hu1WSyeGEOXRrxBE+ET
	 jzoHbWkQ0pA0v5bYufGHaQ2HtDv5ObWbzyMldFkbbgky27DnJx3IJIkpDhQlS7ozsm
	 92FgL92Q9Wfuw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Subject: [PATCH 2/4] kbuild: deb-pkg: create source package without cleaning
Date: Sun, 29 Jan 2023 02:38:41 +0900
Message-Id: <20230128173843.765212-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128173843.765212-1-masahiroy@kernel.org>
References: <20230128173843.765212-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you run 'make deb-pkg', all objects are lost due to 'make clean',
which makes the incremental builds impossible.

Instead of cleaning, pass the exclude list to tar's --exclude-from
option.

Previously, *.diff.gz contained some check-in files such as
.clang-format, .cocciconfig.

With this commit, *.diff.gz will only contain the .config and debian/.
The other source files will go into the tarball.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.package | 27 ++++++++++++++++++++++-----
 scripts/package/mkdebian | 27 +++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index dfbf40454a99..cb135c99a273 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -50,6 +50,21 @@ fi ; \
 tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
 	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3)
 
+# Source Tarball
+# ---------------------------------------------------------------------------
+
+quiet_cmd_exclude_list = GEN     $@
+      cmd_exclude_list = $(srctree)/scripts/gen-exclude.py --prefix=./ --rootdir=$(srctree) > $@; echo "./$@" >> $@
+
+.exclude-list: FORCE
+	$(call cmd,exclude_list)
+
+quiet_cmd_tar = TAR     $@
+      cmd_tar = tar -I $(KGZIP) -c -f $@ -C $(srctree) --exclude-from=$< --exclude=./$@ --transform 's:^\.:linux:S' .
+
+%.tar.gz: .exclude-list
+	$(call cmd,tar)
+
 # rpm-pkg
 # ---------------------------------------------------------------------------
 PHONY += rpm-pkg
@@ -81,12 +96,11 @@ binrpm-pkg:
 
 PHONY += deb-pkg
 deb-pkg:
-	$(MAKE) clean
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
-	$(call cmd,src_tar,$(KDEB_SOURCENAME))
-	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
-		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) --source-option=-sP -i.git -us -uc
+	$(Q)origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
+		$(MAKE) -f $(srctree)/scripts/Makefile.package ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) \
+		--build=source,binary --source-option=-sP -nc -us -uc
 
 PHONY += bindeb-pkg
 bindeb-pkg:
@@ -174,4 +188,7 @@ help:
 	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
 	@echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source tarball'
 
+PHONY += FORCE
+FORCE:
+
 .PHONY: $(PHONY)
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index c3bbef7a6754..12c057ffbe6e 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -84,6 +84,8 @@ set_debarch() {
 	fi
 }
 
+rm -rf debian
+
 # Some variables and settings used throughout the script
 version=$KERNELRELEASE
 if [ -n "$KDEB_PKGVERSION" ]; then
@@ -135,6 +137,31 @@ fi
 mkdir -p debian/source/
 echo "1.0" > debian/source/format
 
+cat<<'EOF' > debian/source/local-options
+#
+# Ugly: ignore anything except .config or debian/
+# (is there a cleaner way to do this?)
+#
+diff-ignore
+
+extend-diff-ignore = ^[^.d]
+
+extend-diff-ignore = ^\.[^c]
+extend-diff-ignore = ^\.c($|[^o])
+extend-diff-ignore = ^\.co($|[^n])
+extend-diff-ignore = ^\.con($|[^f])
+extend-diff-ignore = ^\.conf($|[^i])
+extend-diff-ignore = ^\.confi($|[^g])
+extend-diff-ignore = ^\.config.
+
+extend-diff-ignore = ^d($|[^e])
+extend-diff-ignore = ^de($|[^b])
+extend-diff-ignore = ^deb($|[^i])
+extend-diff-ignore = ^debi($|[^a])
+extend-diff-ignore = ^debia($|[^n])
+extend-diff-ignore = ^debian[^/]
+EOF
+
 echo $debarch > debian/arch
 extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
 extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
-- 
2.34.1

