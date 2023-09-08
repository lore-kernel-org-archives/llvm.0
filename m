Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28E63CD
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 16:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76524C433D9;
	Fri,  8 Sep 2023 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694191938;
	bh=5LDnx1kiSNw+cr0KJs7Lcc/o++ZlvaW4rZe2kw+298o=;
	h=Subject:To:Cc:From:Date:From;
	b=gDlw2+MmdtVMA5KaWUkuxSZuu5jZMyjgAIHaVlDHGBh1xhuIBI3j3eBq37H8FnUTr
	 dYXWopRNf4cgwD2RZMK3KGW93ghWkREKBVaLGMQB3CZuHfnVsAopJVJuOXBWVqO3rV
	 FZwnbN4fkCaiPVTklBe5v3VbxliShKMxvfzubyuA=
Subject: Patch "tools lib subcmd: Add dependency test to install_headers" has been added to the 6.1-stable tree
To: acme@redhat.com,alexander.shishkin@linux.intel.com,eranian@google.com,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,jpoimboe@kernel.org,llvm@lists.linux.dev,mark.rutland@arm.com,masahiroy@kernel.org,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,nicolas@fjasle.eu,peterz@infradead.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 08 Sep 2023 17:52:15 +0100
Message-ID: <2023090815-desktop-moonscape-77e1@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    tools lib subcmd: Add dependency test to install_headers

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     tools-lib-subcmd-add-dependency-test-to-install_headers.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5d890591db6bed8ca69bd4bfe0cdaca372973033 Mon Sep 17 00:00:00 2001
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Dec 2022 20:57:41 -0800
Subject: tools lib subcmd: Add dependency test to install_headers

From: Ian Rogers <irogers@google.com>

commit 5d890591db6bed8ca69bd4bfe0cdaca372973033 upstream.

Compute the headers to be installed from their source headers and make
each have its own build target to install it. Using dependencies
avoids headers being reinstalled and getting a new timestamp which
then causes files that depend on the header to be rebuilt.

Signed-off-by: Ian Rogers <irogers@google.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: bpf@vger.kernel.org
Cc: llvm@lists.linux.dev
Link: https://lore.kernel.org/r/20221202045743.2639466-4-irogers@google.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/lib/subcmd/Makefile |   23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -89,10 +89,10 @@ define do_install_mkdir
 endef
 
 define do_install
-	if [ ! -d '$(DESTDIR_SQ)$2' ]; then             \
-		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$2'; \
+	if [ ! -d '$2' ]; then             \
+		$(INSTALL) -d -m 755 '$2'; \
 	fi;                                             \
-	$(INSTALL) $1 $(if $3,-m $3,) '$(DESTDIR_SQ)$2'
+	$(INSTALL) $1 $(if $3,-m $3,) '$2'
 endef
 
 install_lib: $(LIBFILE)
@@ -100,13 +100,16 @@ install_lib: $(LIBFILE)
 		$(call do_install_mkdir,$(libdir_SQ)); \
 		cp -fpR $(LIBFILE) $(DESTDIR)$(libdir_SQ)
 
-install_headers:
-	$(call QUIET_INSTALL, libsubcmd_headers) \
-		$(call do_install,exec-cmd.h,$(prefix)/include/subcmd,644); \
-		$(call do_install,help.h,$(prefix)/include/subcmd,644); \
-		$(call do_install,pager.h,$(prefix)/include/subcmd,644); \
-		$(call do_install,parse-options.h,$(prefix)/include/subcmd,644); \
-		$(call do_install,run-command.h,$(prefix)/include/subcmd,644);
+HDRS := exec-cmd.h help.h pager.h parse-options.h run-command.h
+INSTALL_HDRS_PFX := $(DESTDIR)$(prefix)/include/subcmd
+INSTALL_HDRS := $(addprefix $(INSTALL_HDRS_PFX)/, $(HDRS))
+
+$(INSTALL_HDRS): $(INSTALL_HDRS_PFX)/%.h: %.h
+	$(call QUIET_INSTALL, $@) \
+		$(call do_install,$<,$(INSTALL_HDRS_PFX)/,644)
+
+install_headers: $(INSTALL_HDRS)
+	$(call QUIET_INSTALL, libsubcmd_headers)
 
 install: install_lib install_headers
 


Patches currently in stable-queue which might be from irogers@google.com are

queue-6.1/tools-lib-subcmd-make-install_headers-clearer.patch
queue-6.1/tools-resolve_btfids-compile-resolve_btfids-as-host-program.patch
queue-6.1/tools-lib-subcmd-add-install-target.patch
queue-6.1/tools-resolve_btfids-install-subcmd-headers.patch
queue-6.1/tools-resolve_btfids-tidy-host_overrides.patch
queue-6.1/tools-resolve_btfids-pass-hostcflags-as-extra_cflags-to-prepare-targets.patch
queue-6.1/tools-lib-subcmd-add-dependency-test-to-install_headers.patch
queue-6.1/tools-resolve_btfids-alter-how-hostcc-is-forced.patch
