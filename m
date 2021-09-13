Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBF33FC4
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 22:09:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ECD861056;
	Mon, 13 Sep 2021 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631570970;
	bh=IePkNmKFbdLFCj1jfB5UusK9wK0C5A0MxJXpkPLT5QY=;
	h=From:To:Cc:Subject:Date:From;
	b=HTRoX2Pn+mJqjk3XvyOuZ0vEchdG2RGsBOvwA9zB2dI+vj0D8KH6Uig75MWVdRpcW
	 LK/kfh9t83wy6U8IKQnHRYZ9K9YoG06ZrcdnTbqGVp35VYdaqNRDl4LCx4QhghebeJ
	 zpyDiIo9ZTBmq+YYTQWqTZc9i3PPwzzgbOGyZyIDSsjD8lmREhP6z0eRum2N7OISgK
	 Ks3hwiUgaZ0Os/XUxwDzMQZbv/dqcy3u4Vc0sH/pj9zNpUeO3CfhUraeFhjdqjYQ+B
	 wHLCcTMyOvZAnA9NNVHOmKtA7iFFPIYe/FxHg3igG5GFxwmrF8vOqVFm8MdJ3QVgNp
	 HY2YDpLzumxKA==
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] tools: compiler-gcc.h: Guard error attribute use with __has_attribute
Date: Mon, 13 Sep 2021 15:09:00 -0700
Message-Id: <20210913220900.142820-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

When building objtool with HOSTCC=clang, there are several errors along
the lines of

orc_dump.c:201:28: error: unknown attribute 'error' ignored
[-Werror,-Wunknown-attributes]

This occurs after commit 4e59869aa655 ("compiler-gcc.h: drop checks for
older GCC versions"), which removed the GCC_VERSION gating. The removed
version check just so happened to prevent __compiletime_error() from
being defined with clang because it pretends to be GCC 4.2.1 for
compatibility but the error attribute was not added to clang until
14.0.0.

Commit 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h
mutually exclusive") and commit a3f8a30f3f00 ("Compiler Attributes: use
feature checks instead of version checks") refactored the handling of
attributes in the main kernel to avoid situations like this but that
refactoring has never been done for the tools directory.

Refactoring is a rather large undertaking and this has never been an
issue before so instead, just guard the definition of
__compiletime_error() with __has_attribute() so that there are no more
errors.

Fixes: 4e59869aa655 ("compiler-gcc.h: drop checks for older GCC versions")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 tools/include/linux/compiler-gcc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
index 43d9a46d36f0..8816f06fc6c7 100644
--- a/tools/include/linux/compiler-gcc.h
+++ b/tools/include/linux/compiler-gcc.h
@@ -16,7 +16,9 @@
 # define __fallthrough __attribute__ ((fallthrough))
 #endif
 
-#define __compiletime_error(message) __attribute__((error(message)))
+#if __has_attribute(__error__)
+# define __compiletime_error(message) __attribute__((error(message)))
+#endif
 
 /* &a[0] degrades to a pointer: a different type from an array */
 #define __must_be_array(a)	BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))

base-commit: 316346243be6df12799c0b64b788e06bad97c30b
-- 
2.33.0

