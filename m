Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4A182
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 02:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22770C385A1;
	Wed,  6 Apr 2022 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649212263;
	bh=OEz1OieAEVLpYShok1rv8Y+hnxwh95YbTkBGw64pwW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDLdOejqAdW9XOVth+WrjU+baIxSjLNJPcLDSEueYZr2QjP9LMESEcvtOFLlgiewO
	 Ps5fBlEm8jcfnSFUDjLKK2MW1JXiV5NHyKsbPRWzprAxblhXP6HPis+AAOt1Q1AdEq
	 M5gsFaLhjIyTE1JAKGLphHUMKLy/oo+VPYNbfk/otKFbSk3U67nX8OeBlVoIBrYv9b
	 G/iMDtWoX8KafxRdEb/a3aD2QEfzknVMK3HVwr28GGnk1EDt7veCWcOonOCuFSpDlK
	 xusJTTlbBMm9a3uYjtm7F/cU8qm6tFgV2ToNFSRaT4s7iSbF9VzmFd2aTRs1FrO2UX
	 GRec1GFwCjC1A==
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH v8 1/4] bootconfig: Make the bootconfig.o as a normal object file
Date: Wed,  6 Apr 2022 11:30:59 +0900
Message-Id: <164921225875.1090670.15565363126983098971.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <164921224829.1090670.9700650651725930602.stgit@devnote2>
References: <164921224829.1090670.9700650651725930602.stgit@devnote2>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Since the APIs defined in the bootconfig.o are not individually used,
it is meaningless to build it as library by lib-y. Use obj-y for that.

Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 Changes in v6:
  - Newly added.
---
 lib/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Makefile b/lib/Makefile
index 353bc09ce38d..4fc48543dc8f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -276,7 +276,7 @@ $(foreach file, $(libfdt_files), \
 	$(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
 lib-$(CONFIG_LIBFDT) += $(libfdt_files)
 
-lib-$(CONFIG_BOOT_CONFIG) += bootconfig.o
+obj-$(CONFIG_BOOT_CONFIG) += bootconfig.o
 
 obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o

