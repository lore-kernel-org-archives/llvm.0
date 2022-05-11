Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99742F34
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:55:39 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-02.nifty.com with ESMTP id 24BGnJ9j003088
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 01:49:19 +0900
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 24BGlWc4031975;
	Thu, 12 May 2022 01:47:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24BGlWc4031975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1652287662;
	bh=tcr+72ZYpbdDhhd7b5O3qNkSWb92WQKtLNqtDxevyAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1xN57X9s6ScLJ/Z2hb1pNWWGLy1nt5xrcw/SRTDzpwMQbvnE8A08WHb1tRL2DBKCO
	 +pXkDzpxbY81fwxbG0a4ZZkdXAogExaeNGygVj8OuLcQNuJ7AiRunzbNiBtIc7spg1
	 8+kVanlYtmiRWoi0IcsTtPqIxwux0W9L6x/FwUyQ60BvJ379AzCT3xh3/e9TxPIp5S
	 Pc8nBrjlOMjG0duMJdm6spy738mTTr+f+FFcKcDaOyjaayqqqYRWWVZ0bHOrh9LfyX
	 sMYGko/4vxzWoqMu0AiEUGkSvhzF7286ufk7BC0AMXMVPovVKTcm1HkwUoJrVQMncw
	 9gXlUynDCRMKg==
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
Subject: [PATCH v5 09/12] kbuild: make built-in.a rule robust against too long argument error
Date: Thu, 12 May 2022 01:45:11 +0900
Message-Id: <20220511164514.2741934-10-masahiroy@kernel.org>
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

Kbuild runs at the top of objtree instead of changing the working
directory to subdirectories. I think this design is nice overall but
some commands have a scalability issue.

The build command of built-in.a is one of them whose length scales with:

    O(D * N)

Here, D is the length of the directory path (i.e. $(obj)/ prefix),
N is the number of objects in the Makefile, O() is the big O notation.

The deeper directory the Makefile directory is located, the more easily
it will hit the too long argument error.

We can make it better. Trim the $(obj)/ by Make's builtin function, and
restore it by a shell command (sed).

With this, the command length scales with:

    O(D + N)

In-tree modules still have some room to the limit (ARG_MAX=2097152),
but this is more future-proof for big modules in a deep directory.

For example, you can build i915 as builtin (CONFIG_DRM_I915=y) and
compare drivers/gpu/drm/i915/.built-in.a.cmd with/without this commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---

(no changes since v2)

Changes in v2:
  - New patch

 scripts/Makefile.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c2a173b3fd60..8f1a355df7aa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -374,7 +374,10 @@ $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 #
 
 quiet_cmd_ar_builtin = AR      $@
-      cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
+      cmd_ar_builtin = rm -f $@; \
+		echo $(patsubst $(obj)/%,%,$(real-prereqs)) | \
+		sed -E 's:([^ ]+):$(obj)/\1:g' | \
+		xargs $(AR) cDPrST $@
 
 $(obj)/built-in.a: $(real-obj-y) FORCE
 	$(call if_changed,ar_builtin)
-- 
2.32.0

