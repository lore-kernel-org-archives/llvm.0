Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116D2F25
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:56:41 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-09.nifty.com with ESMTP id 24BGnJnI027965
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:49:19 +0900
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 24BGlWc5031975;
	Thu, 12 May 2022 01:47:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24BGlWc5031975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652287663;
	bh=OcOEuS6jEbLubdZRYm9mI6nzM08ugGxo0tuefY4hIgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jXi1gJPHIE2xagfeR2MNcfLTDFlg9D5O9cnkBMlaoyva8Do8oJfp6T+S9S4xs+LXI
	 mbrFTqdzrHF0wP0OVeZc1gHvb856yx+ZfDsW6UnXoSwnaZLi6xTmLkkNem16UBBP7G
	 Mv9n97/BoZmFifFt7YxrYZJQzzWpLiqvfELN1kUyI23LFUQWDtOBBq+cP+7B+29kaS
	 heJui4xv66QP7cK5llyJUm9hDLvTD/WnVJAdHb5C1xVoNZfo0IQHttkWQBZvPgU0k4
	 LhNu07C+jWfwR7Z1xyAiP00Tzt2EkDe7UTV97+1Ytkg7hTmnpbuDpNBg7j27PDMu7c
	 tiqDnu6ifEqMQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>, linux-modules@vger.kernel.org,
        llvm@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v5 10/12] kbuild: make *.mod rule robust against too long argument error
Date: Thu, 12 May 2022 01:45:12 +0900
Message-Id: <20220511164514.2741934-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220511164514.2741934-1-masahiroy@kernel.org>
References: <20220511164514.2741934-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like built-in.a, the command length of the *.mod rule scales with
the depth of the directory times the number of objects in the Makefile.

Add $(obj)/ by the shell command (awk) instead of by Make's builtin
function.

In-tree modules still have some room to the limit (ARG_MAX=2097152),
but this is more future-proof for big modules in a deep directory.

For example, you can build i915 as a module (CONFIG_DRM_I915=m) and
compare drivers/gpu/drm/i915/.i915.mod.cmd with/without this commit.

The issue is more critical for external modules because the M= path
can be very long as Jeff Johnson reported before [1].

[1] https://lore.kernel.org/linux-kbuild/4c02050c4e95e4cb8cc04282695f8404@codeaurora.org/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---

(no changes since v2)

Changes in v2:
  - New patch

 scripts/Makefile.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f1a355df7aa..f546b5f1f33f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -270,8 +270,8 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
-cmd_mod = echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)) | \
-	$(AWK) -v RS='( |\n)' '!x[$$0]++' > $@
+cmd_mod = echo $(call real-search, $*.o, .o, -objs -y -m) | \
+	$(AWK) -v RS='( |\n)' '!x[$$0]++ { print("$(obj)/"$$0) }' > $@
 
 $(obj)/%.mod: FORCE
 	$(call if_changed,mod)
-- 
2.32.0

