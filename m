Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A41852
	for <llvm@lists.linux.dev>; Fri, 27 May 2022 10:04:48 +0000 (UTC)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 24RA2hPX029808;
	Fri, 27 May 2022 19:02:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24RA2hPX029808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653645772;
	bh=/LDGWcsQ86eGZ6AnM0sm302Ykct401VHcmgP1DL7HYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rRtdN563IfYIa8UJiH9R6JJ+H+T8TUQiUgBziOGfpObJBS0vJgoUxq8MvApQYo5aV
	 O71PUr/VsqixjttnfTjeyypDUIv9rUsWLb4ujUwS/UU5A03nVQausNmzgYsgiYd43r
	 05WZFD8zP5J7ZoAldPOyNxWUv3GVaKzQh/fXLSxQJdNBqhfrcpQX3n4pdcni0SDM0A
	 4+PlqZsMPV/nyTcr799AAberdlGpzsfkVc30H9yuFqKcDiiHcXF143AZUtVsD/9Vme
	 2qvC268JrtUk4pUuE7NcTuPbeplTB5qsk4W8ZllSNgK7otYw7cd9E5l9gvfBKOKbTn
	 KnhUoIuWymdYA==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <n.schier@avm.de>, Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: [PATCH v7 7/8] kbuild: add cmd_and_savecmd macro
Date: Fri, 27 May 2022 19:01:54 +0900
Message-Id: <20220527100155.1996314-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220527100155.1996314-1-masahiroy@kernel.org>
References: <20220527100155.1996314-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate out the command execution part of if_changed, as we did
for if_changed_dep.

This allows us to reuse it in if_changed_rule.

  define rule_foo
          $(call cmd_and_savecmd,foo)
          $(call cmd,bar)
  endef

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM-14 (x86-64)
---

(no changes since v4)

Changes in v4:
  - New.
    Resent of my previous submission.
    https://lore.kernel.org/all/20210831074004.3195284-10-masahiroy@kernel.org/

 scripts/Kbuild.include | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 455a0a6ce12d..ece44b735061 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -142,9 +142,11 @@ check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequisite is missing)
 if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(if-changed-cond),                                        \
+if_changed = $(if $(if-changed-cond),$(cmd_and_savecmd),@:)
+
+cmd_and_savecmd =                                                            \
 	$(cmd);                                                              \
-	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
+	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd
 
 # Execute the command and also postprocess generated .d dependencies file.
 if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
-- 
2.32.0

