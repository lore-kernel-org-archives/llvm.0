Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FC7491
	for <llvm@lists.linux.dev>; Tue,  8 Mar 2022 21:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B2AC340EC;
	Tue,  8 Mar 2022 21:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646776629;
	bh=eGD/su/n2B61nqlOmpuFpZhwnQeDphrdFbvHLaijoSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b7OJ9Rf2Y+g8br7xVIjyOlcfvW8+SyMmqJCm6j/ZXEEyA4S+LY+3b8r4799BuOLYk
	 TLWFQ5r2ZbzLJTRSMjAzXn/8CWEfEfz1etzwIxlED128hvB271uttJhrCazgihEbWI
	 ZL1t0qMlBb2KK9yZ1W+SfHMT4ii+vS/0aMPrtuDh443A3/VIYXgiF7k4hXqJeKl8C9
	 NIjUTtcubyLdk09OagrHy1D+bABzL0S6Jg3Seoq8jjBHPgnXrOeqAzoMcl/uKsiSOv
	 th/iWa4NXq8H+a/FDexq0GqMBOEUlcUVL//Cz2ehBBxRMMuabOH5nsxZdwJ6hBII3t
	 FbwQteQSri0DA==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: alexs@kernel.org,
	arnd@arndb.de,
	arnd@kernel.org,
	dsterba@suse.com,
	elver@google.com,
	jani.nikula@intel.com,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	mark.rutland@arm.com,
	ndesaulniers@google.com,
	ojeda@kernel.org,
	torvalds@linux-foundation.org
Subject: [PATCH 4/4] Kbuild: use -std=gnu11 for KBUILD_USERCFLAGS
Date: Tue,  8 Mar 2022 22:56:15 +0100
Message-Id: <20220308215615.14183-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220308215615.14183-1-arnd@kernel.org>
References: <20220308215615.14183-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As we change the C language standard for the kernel from gnu89 to
gnu11, it makes sense to also update the version for user space
compilation.

Some users have older native compilers than what they use for
kernel builds, so I considered using gnu99 as the default version
for wider compatibility with gcc-4.6 and earlier.

However, testing with older compilers showed that we already require
HOSTCC version 5.1 as well because a lot of host tools include
linux/compiler.h that uses __has_attribute():

  CC      tools/objtool/exec-cmd.o
In file included from tools/include/linux/compiler_types.h:36:0,
                 from tools/include/linux/compiler.h:5,
                 from exec-cmd.c:2:
tools/include/linux/compiler-gcc.h:19:5: error: "__has_attribute" is not defined [-Werror=undef]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1ba8dc523952..e0b11ddd0760 100644
--- a/Makefile
+++ b/Makefile
@@ -432,7 +432,7 @@ HOSTCXX	= g++
 endif
 
 KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
-			 -O2 -fomit-frame-pointer -std=gnu89 \
+			 -O2 -fomit-frame-pointer -std=gnu11 \
 			 -Wdeclaration-after-statement
 KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)
 KBUILD_USERLDFLAGS := $(USERLDFLAGS)
-- 
2.29.2

