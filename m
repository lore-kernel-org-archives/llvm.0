Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830F1306484;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=m5gAg6dThIC9FC80nhGq12d6gMvN65Q/x0R/zunC7nlyZmql9NohNBbnAe+FTA+7dHxYrNFWt3Q+2qXPArBSEz3xz+fzB7s9GvagOqfJELchQ9UXH6rBV4iIWyESQHS9JW+yvCqMx9PacIGPKyYVLNM3MlEfuPfpdHZvPx8yrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=lrdZawkRIwStzU2yfc2G77xAk+2MIGzDv7SZmR0L4QE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2un+ISlOrakoJ5jpJxWqTyaq+REYaYRA5YWXoRRXSnXYHJfje8vj3H+KQXXmOa13hihPJ5GUXLvtfu3N5QEjOLIy0ipH+hlNBCc9sXYv0U1paRYfBiZUC0yt2rv8R7iEG2DRHTHx4O3IFQ3mWB8ghZ3zeMu833t9e2/KLk3L34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drjKcERv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drjKcERv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8D7C4CEFF;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196507;
	bh=lrdZawkRIwStzU2yfc2G77xAk+2MIGzDv7SZmR0L4QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=drjKcERv3ds/ll+B1cKCoCPs+B3qKzaHO85s/sTpjkRMOFt4nwNKaG7kVkg8Y5DPx
	 aO0q0ng3EJeg4OleEkrOUgTESugQ5v/ry/Q6XzEHyLfLImzrq5KGVfsx3l1gRlFJQ+
	 HnDsKtlUvZSDPMPIKRzdEl3xXKQI2rw+fXBF0wEbyBzZyT9Q0z+8noNS2aCaC3vwuy
	 wpnzcAAQp6I4ExAUxaGmgMPBZlTJ/jpFhVuh7Wo0LHpGP/5avvOqxGUZzTI98W0wqy
	 W8y5GixDKD54LDh/Lme9vROqRzN/gql7+1fXIlHzmwpT1+q0mzTYdK2dUntVKJfyl4
	 TGz6nmZDB54Dg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crte-1pvJ;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <mchehab+huawei@kernel.org>,
	Benno Lossin <mchehab+huawei@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <mchehab+huawei@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v8 22/24] tools/docs: sphinx-build-wrapper: move rust doc builder to wrapper
Date: Thu, 18 Sep 2025 13:54:56 +0200
Message-ID: <fa1235ccf859f6ebfeef7ffba0ebde2015a75042.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Simplify even further the docs Makefile by moving rust build logic
to the wrapper.

After this change, running make on an environment with rust enabled
works as expected.

With CONFIG_RUST:

    $ make O=/tmp/foo LLVM=1 SPHINXDIRS=peci htmldocs
    make[1]: Entrando no diretório '/tmp/foo'

    Using alabaster theme
    Using Python kernel-doc
      GEN     Makefile
      DESCEND objtool
      CC      arch/x86/kernel/asm-offsets.s
      INSTALL libsubcmd_headers
      CALL    /new_devel/docs/scripts/checksyscalls.sh
      RUSTC L rust/core.o
      BINDGEN rust/bindings/bindings_generated.rs
      BINDGEN rust/bindings/bindings_helpers_generated.rs
    ...

Without it:
    $ make SPHINXDIRS=peci htmldocs
    Using alabaster theme
    Using Python kernel-doc

Both work as it is it is supposed to do.

After the change, it is also possible to build directly with the script
by passing "--rustodoc".

if CONFIG_RUST, this works fine:

    $ ./tools/docs/sphinx-build-wrapper --sphinxdirs peci --rustdoc -- htmldocs
    Using alabaster theme
    Using Python kernel-doc
      SYNC    include/config/auto.conf
    ...
      RUSTC L rust/core.o
    ...

If not, it will produce a warning that RUST may be disabled:

    $ ./tools/docs/sphinx-build-wrapper --sphinxdirs peci --rustdoc -- htmldocs
    Using alabaster theme
    Using Python kernel-doc
    ***
    *** Configuration file ".config" not found!
    ***
    *** Please run some configurator (e.g. "make oldconfig" or
    *** "make menuconfig" or "make xconfig").
    ***
    make[1]: *** [/new_devel/docs/Makefile:829: .config] Error 1
    make: *** [Makefile:248: __sub-make] Error 2
    Ignored errors when building rustdoc: Command '['make', 'LLVM=1', 'rustdoc']' returned non-zero exit status 2.. Is RUST enabled?

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile          | 29 +++++-----------
 tools/docs/sphinx-build-wrapper | 59 ++++++++++++++++++---------------
 2 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index aa42b2cb7030..b32f68387dfc 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -23,6 +23,7 @@ SPHINXOPTS    =
 SPHINXDIRS    = .
 DOCS_THEME    =
 DOCS_CSS      =
+RUSTDOC       =
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
@@ -42,6 +43,10 @@ FONTS_CONF_DENY_VF ?= $(HOME)/deny-vf
 # User-friendly check for sphinx-build
 HAVE_SPHINX := $(shell if which $(SPHINXBUILD) >/dev/null 2>&1; then echo 1; else echo 0; fi)
 
+ifeq ($(CONFIG_RUST),y)
+	RUSTDOC="--rustdoc"
+endif
+
 ifeq ($(HAVE_SPHINX),0)
 
 .DEFAULT:
@@ -53,10 +58,10 @@ ifeq ($(HAVE_SPHINX),0)
 else # HAVE_SPHINX
 
 # Common documentation targets
-mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
+htmldocs mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
 	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
-	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
-		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
+	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ $(RUSTDOC)\
+		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" $(RUSTDOC)\
 		--builddir="$(BUILDDIR)" --deny-vf=$(FONTS_CONF_DENY_VF) \
 		--theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)
 
@@ -67,24 +72,6 @@ pdfdocs:
 	@echo "  SKIP    Sphinx $@ target."
 endif
 
-# HTML main logic is identical to other targets. However, if rust is enabled,
-# an extra step at the end is required to generate rustdoc.
-htmldocs:
-	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
-	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
-		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
-		--builddir="$(BUILDDIR)" \
-		--theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)
-# If Rust support is available and .config exists, add rustdoc generated contents.
-# If there are any, the errors from this make rustdoc will be displayed but
-# won't stop the execution of htmldocs
-
-ifneq ($(wildcard $(srctree)/.config),)
-ifeq ($(CONFIG_RUST),y)
-	$(Q)$(MAKE) rustdoc || true
-endif
-endif
-
 endif # HAVE_SPHINX
 
 # The following targets are independent of HAVE_SPHINX, and the rules should
diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 7a6eb41837e6..e24486dede76 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -96,14 +96,6 @@ class SphinxBuilder:
     with the Kernel.
     """
 
-    def is_rust_enabled(self):
-        """Check if rust is enabled at .config"""
-        config_path = os.path.join(self.srctree, ".config")
-        if os.path.isfile(config_path):
-            with open(config_path, "r", encoding="utf-8") as f:
-                return "CONFIG_RUST=y" in f.read()
-        return False
-
     def get_path(self, path, use_cwd=False, abs_path=False):
         """
         Ancillary routine to handle patches the right way, as shell does.
@@ -218,8 +210,6 @@ class SphinxBuilder:
                                                       "scripts/kernel-doc.py"))
         self.builddir = self.get_path(builddir, use_cwd=True, abs_path=True)
 
-        self.config_rust = self.is_rust_enabled()
-
         #
         # Get directory locations for LaTeX build toolchain
         #
@@ -274,7 +264,7 @@ class SphinxBuilder:
 
             return subprocess.call(cmd, *args, **pwargs)
 
-    def handle_html(self, css, output_dir):
+    def handle_html(self, css, output_dir, rustdoc):
         """
         Extra steps for HTML and epub output.
 
@@ -282,20 +272,34 @@ class SphinxBuilder:
         copied to the output _static directory
         """
 
-        if not css:
-            return
+        if css:
+            css = os.path.expanduser(css)
+            if not css.startswith("/"):
+                css = os.path.join(self.srctree, css)
 
-        css = os.path.expanduser(css)
-        if not css.startswith("/"):
-            css = os.path.join(self.srctree, css)
+            static_dir = os.path.join(output_dir, "_static")
+            os.makedirs(static_dir, exist_ok=True)
 
-        static_dir = os.path.join(output_dir, "_static")
-        os.makedirs(static_dir, exist_ok=True)
+            try:
+                shutil.copy2(css, static_dir)
+            except (OSError, IOError) as e:
+                print(f"Warning: Failed to copy CSS: {e}", file=sys.stderr)
 
-        try:
-            shutil.copy2(css, static_dir)
-        except (OSError, IOError) as e:
-            print(f"Warning: Failed to copy CSS: {e}", file=sys.stderr)
+        if rustdoc:
+            if "MAKE" in self.env:
+                cmd = [self.env["MAKE"]]
+            else:
+                cmd = ["make", "LLVM=1"]
+
+            cmd += [ "rustdoc"]
+            if self.verbose:
+                print(" ".join(cmd))
+
+            try:
+                subprocess.run(cmd, check=True)
+            except subprocess.CalledProcessError as e:
+                print(f"Ignored errors when building rustdoc: {e}. Is RUST enabled?",
+                      file=sys.stderr)
 
     def build_pdf_file(self, latex_cmd, from_dir, path):
         """Builds a single pdf file using latex_cmd"""
@@ -576,7 +580,7 @@ class SphinxBuilder:
         shutil.rmtree(self.builddir, ignore_errors=True)
 
     def build(self, target, sphinxdirs=None, conf="conf.py",
-              theme=None, css=None, paper=None, deny_vf=None):
+              theme=None, css=None, paper=None, deny_vf=None, rustdoc=False):
         """
         Build documentation using Sphinx. This is the core function of this
         module. It prepares all arguments required by sphinx-build.
@@ -623,7 +627,7 @@ class SphinxBuilder:
 
             args.extend(["-D", f"latex_elements.papersize={paper}paper"])
 
-        if self.config_rust:
+        if rustdoc:
             args.extend(["-t", "rustdoc"])
 
         if conf:
@@ -699,7 +703,7 @@ class SphinxBuilder:
             # Ensure that each html/epub output will have needed static files
             #
             if target in ["htmldocs", "epubdocs"]:
-                self.handle_html(css, output_dir)
+                self.handle_html(css, output_dir, rustdoc)
 
         #
         # Step 2: Some targets (PDF and info) require an extra step once
@@ -756,6 +760,9 @@ def main():
     parser.add_argument('--deny-vf',
                         help="Configuration to deny variable fonts on pdf builds")
 
+    parser.add_argument('--rustdoc', action="store_true",
+                        help="Enable rustdoc build. Requires CONFIG_RUST")
+
     parser.add_argument("-v", "--verbose", action='store_true',
                         help="place build in verbose mode")
 
@@ -775,7 +782,7 @@ def main():
 
     builder.build(args.target, sphinxdirs=args.sphinxdirs, conf=args.conf,
                   theme=args.theme, css=args.css, paper=args.paper,
-                  deny_vf=args.deny_vf)
+                  rustdoc=args.rustdoc, deny_vf=args.deny_vf)
 
 if __name__ == "__main__":
     main()
-- 
2.51.0

