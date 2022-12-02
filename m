Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E907B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 04:58:22 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 187-20020a250dc4000000b006f8cd26bfcfso2453009ybn.13
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 20:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhcm838vqRbviJVINtawNn6TNcB3z9aWYltBLm5HIxk=;
        b=PxVUhm64KsR6Mi0JEzZpmyH+ESj3GpUqdRBullEc2TxUiMuvpELl5BPD4CkqSSATx1
         aL6QaAxPJ3htK3byYaO89DGkDpFn1KRa3HgX8lWZRHnSpFb4Eb4ZQlu1Bsc7xyTIEHsI
         NOQ5J2WyixET0VOdWUYOypZJWpIZu6Q2rBfTJbftC7WMaCjfbvjIt6BwSwWzoNKVXFT1
         iEFe4fokWc/5rSyeeF0LHkHUZaAr/CLM+4B7/Jsf4BLyWytkbkPraQCiZSTjYKK4ts5S
         lOpUyFOSGaKEaT+gnY6PBMdyeS0ijyebSTbrKj6NyIoNfnMC/OT3aQZf+IMcUZsDZj+5
         xiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhcm838vqRbviJVINtawNn6TNcB3z9aWYltBLm5HIxk=;
        b=TzkEiEB97csuwYh7UOmVhWfcJcHQ/MMPvc6HXiLmZQ34pXOHl/91oXAngNgOocy7V6
         dLX20lI35C8YMnuKhVjTb9zoQy7WE1T4RJe+f0Ejeq7F4IEpNfs0f1p13CFXImG+c0Ae
         xlUDM6TLcvN4uQ5ejdAV25QGI+M0gcVRQa1D29oEEPs6wVWHKcAqRuJBUtg0dvwkM99S
         QE12kpwRFKf/jBGLnRkUpn8Eee5zgIGakiCschoMYWoenN+UA9gX2zEFtzaWU29nW7Ig
         0tgdDGTEi5MUWXKX0ALSAvsUU+43BFG08mON6gmqBNg64ZMqTJLOV7kW/TRSHYACDHFH
         YgaQ==
X-Gm-Message-State: ANoB5plSjvrA7dxYd8as//Ny9HdB4PK5a4risxABvTc/nDCixIGr0jXn
	anN+PgzyIAQxtdgDDCfvQ7q3xFV2ah+w
X-Google-Smtp-Source: AA0mqf5CfUr1ni1ydhOijcrKDrUH6Q4Z/fxX0gKX0+scEkSznJvNYmEWVgOtlPAgSNKl/d+ltip8dBgQpasK
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:e3b0:e3d1:6040:add2])
 (user=irogers job=sendgmr) by 2002:a25:3454:0:b0:6f9:41dd:faef with SMTP id
 b81-20020a253454000000b006f941ddfaefmr14632533yba.87.1669957101240; Thu, 01
 Dec 2022 20:58:21 -0800 (PST)
Date: Thu,  1 Dec 2022 20:57:41 -0800
In-Reply-To: <20221202045743.2639466-1-irogers@google.com>
Message-Id: <20221202045743.2639466-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20221202045743.2639466-1-irogers@google.com>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Subject: [PATCH 3/5] tools lib subcmd: Add dependency test to install_headers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Compute the headers to be installed from their source headers and make
each have its own build target to install it. Using dependencies
avoids headers being reinstalled and getting a new timestamp which
then causes files that depend on the header to be rebuilt.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/lib/subcmd/Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index 9a316d8b89df..b87213263a5e 100644
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
 
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

