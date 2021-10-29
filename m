Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220EF2C83
	for <llvm@lists.linux.dev>; Fri, 29 Oct 2021 11:34:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32D0F61166;
	Fri, 29 Oct 2021 11:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635507247;
	bh=zklhndCE8vUwFiObARuJ15ZvqswT4LJwk/JZJaWF/Uk=;
	h=From:To:Cc:Subject:Date:From;
	b=JmkgnCNIHdwyvDqdsVhEQ0NpbfRITV04X29RG2Inv2o3nviWLPyw1tY2SHcpanefC
	 2DAd0XYdaVGywn+3uaD7K4YhlGPEnSklccnkVlzrQZ2tAtsG65T4vFbF8YBoImXxkU
	 YQZokiiKpo4rL18ZvXvWLszSWwT+SnjUhnqVbQpU1aq7g/bAxRUHEuIPfU33U18Sg5
	 pSAUv7hq5JQPeLXuEfJT3PkO+YFQ+OWFLF0vXKYpuc/0CGyHKhfgZvJmhpxb4YnSbc
	 PTE0oaQHoUc4lVbcj0vgIujwe+A1IF2C24Jy/zQE1IDJ1zZGKwSpAPj1W4mc99eqhR
	 rwidY8cZOc1NQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jan Kara <jack@suse.cz>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Amir Goldstein <amir73il@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] samples: fanotify: add CC_CAN_LINK dependency
Date: Fri, 29 Oct 2021 13:33:35 +0200
Message-Id: <20211029113403.848239-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When using a cross tools that only works for kernels, the
newn sample can end up with a link failure such as:

/usr/bin/ld: unrecognised emulation mode: aarch64linux
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pep i386pe
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make[5]: *** [/git/arm-soc/scripts/Makefile.userprogs:28: samples/fanotify/fs-monitor] Error 1

Add a Kconfig dependency, similar to the one we use for
other samples.

Fixes: 5451093081db ("samples: Add fs error monitoring example")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 samples/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 147a16dafaf8..83f12c1e9ca6 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -122,7 +122,7 @@ config SAMPLE_CONNECTOR
 
 config SAMPLE_FANOTIFY_ERROR
 	bool "Build fanotify error monitoring sample"
-	depends on FANOTIFY
+	depends on CC_CAN_LINK && FANOTIFY
 	help
 	  When enabled, this builds an example code that uses the
 	  FAN_FS_ERROR fanotify mechanism to monitor filesystem
-- 
2.29.2

