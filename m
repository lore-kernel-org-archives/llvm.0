Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EE47E0
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 05:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9F5C340ED;
	Thu, 31 Mar 2022 05:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648706174;
	bh=jLjZOnXI/ACGnxXl3tZNcFkD6L1cKyv9i4IjbKr7Ueg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKgfxFIF5/aQoZPIhCFXNWPYQ+8y/O/fj7g4Z0Qkis+vGDCEXVzjMI9lCS4EjLRN3
	 UnxfgV2ZYIDw2mvD3igr1yvuickWSjwaPgnZkoEAcqMfVFjkZC3UYAD6OMoF04D4c9
	 mY2AoZ54e5+DbSAqOdMipOHhczECRtlLV6Gz7Xdf0HO/mWHvuGwscURFR5xhNreZB4
	 V7n2uTK5ij9gzARhepX/LwF5NBVuFOX3bPbOtSHob3y6wx7zmbB9mKXVen9V59O7//
	 ldVqATKFQVlOOLiRekE4gHiws616gP+/ATh9muRnaeYU+Zkly0lHw11mQvI4kASANx
	 tRhMTQrEtPBug==
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
Subject: [PATCH v6 1/4] bootconfig: Make the bootconfig.o as a normal object file
Date: Thu, 31 Mar 2022 14:56:10 +0900
Message-Id: <164870617012.127053.3864577306553523861.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <164870615889.127053.9055569952366814752.stgit@devnote2>
References: <164870615889.127053.9055569952366814752.stgit@devnote2>
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
index 6b9ffc1bd1ee..08053df16c7c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -279,7 +279,7 @@ $(foreach file, $(libfdt_files), \
 	$(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
 lib-$(CONFIG_LIBFDT) += $(libfdt_files)
 
-lib-$(CONFIG_BOOT_CONFIG) += bootconfig.o
+obj-$(CONFIG_BOOT_CONFIG) += bootconfig.o
 
 obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o

