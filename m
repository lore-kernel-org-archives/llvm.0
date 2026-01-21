Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6827D3EDADA;
	Wed, 21 Jan 2026 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011814; cv=none; b=SPXnnDr78dEeJ7mylCMj6nObaFZ8+oyrBKNd7e1tvS0B3ezxck9kYkPg0eRWbUcWj2XOa78C7LbRKELAv6OnRgYN1+oZOWdrCtoC1wr+5bFddoNN3wZqX1L1xd9necISCFzAyhh08dULEBt3/v3uF9xeTs3zTcXpssFyTuye4KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011814; c=relaxed/simple;
	bh=BZ7ocKcu4BhNRqGDxy2G2f+cqwyxisbsmhpDL/toFZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q2ECJwoUJBfdm4svTkMZp8z7FmqnHjjJmoA1UOiSXZjM2XzHFn2poPGXKA0xJdpOWyjmIDvkFaUnAZgUTBSGjRCrJ9Vh3LJXNuA0XXwxOgvSwAHHNtA9C3MhCol44L2/3VsOo1lRy0v65qbXvW9uqV4/D/G8pi4/12x5KzL0FyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqzKyLMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqzKyLMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ADFC4CEF1;
	Wed, 21 Jan 2026 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011813;
	bh=BZ7ocKcu4BhNRqGDxy2G2f+cqwyxisbsmhpDL/toFZQ=;
	h=From:Date:Subject:To:Cc:From;
	b=tqzKyLMzq2YFvhJxlgk7dN3lfqFbOd6YyYEmh5NDL9M385QiKTN0ZEm4+a//6QPgO
	 D54IpjfAOS7BSTRqW9o8acFD8KoOvS+DKKYVMqCGlvYPfmYEasz41s/b8qcQZHwact
	 DdXY4rcUzqhmqa+pfKgHnRtkdwzaFb6/Vw+ep31zMvP3lgH+Crozt3qNOvdUw0hdYT
	 zL8kAcPW7CORZ3Y2Ds8mcpUXoZ4/pEh23gLWBwEQ4X6FQYTv2Kq3cBR7AnwcU5p8U+
	 IMMuZWU6OpdE9zUUhKxRzSoTg+ro00Rz9STbPkL65Gn7jXANZSa7PhqFDZ8qPpoQ4Q
	 fphRkz8VzhAkA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 21 Jan 2026 11:10:08 -0500
Subject: [PATCH v3] printf: convert test_hashed into macro
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-printf-kunit-printf-attr-v3-1-4144f337ec8b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NzQqDMBAGX0VybiSJ+NeT71E8aNzoVo2SRGkR3
 73R4rWUPQ18O7MRCwbBknuwEQMrWpy0h+gWENlVugWKjWcimIi5YAmdDWqnaL9odBdUzhnK8yj
 JlYzTWjHi32cDCl+n+lF+2S71E6Q7fMeiQ+sm8z7bKz92f2RWTv0lmchYVse8YUU7VjiEchrJk
 VnFJUoY579EwouipkkVKBkJlhY9GA1DOJmWlPu+fwAkp3nGHAEAAA==
X-Change-ID: 20251206-printf-kunit-printf-attr-19369fc57bf0
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
 oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769011811; l=2103;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=BZ7ocKcu4BhNRqGDxy2G2f+cqwyxisbsmhpDL/toFZQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QG9HKrWrYFUXnemgk5gkmCkO9XcpEJpv/BqIl8jtXIliYTDl2mMcF+oyKdLmRcFXaZce9AvHO6i
 8LQvFZITgpAU=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This allows the compiler to check the arguments against the __printf()
attribute on __test(). This produces better diagnostics when incorrect
inputs are passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512061600.89CKQ3ag-lkp@intel.com/
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v3:
- Added parentheses to function references.
- Changed escaped newline indentation to tabs.
- Link to v2: https://patch.msgid.link/20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org

Changes in v2:
- Convert test_hashed to macro rather than try to annotate it in a way
  that is compatible with both clang and gcc.
- Link to v1: https://patch.msgid.link/20251206-printf-kunit-printf-attr-v1-1-1682808b51d0@gmail.com
---
 lib/tests/printf_kunit.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index 7617e5b8b02c..f6f21b445ece 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -266,15 +266,17 @@ hash_pointer(struct kunit *kunittest)
 	KUNIT_EXPECT_MEMNEQ(kunittest, buf, PTR_STR, PTR_WIDTH);
 }
 
-static void
-test_hashed(struct kunit *kunittest, const char *fmt, const void *p)
-{
-	char buf[PLAIN_BUF_SIZE];
-
-	plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);
-
-	test(buf, fmt, p);
-}
+/*
+ * This is a macro so that the compiler can compare its arguments to the
+ * __printf() attribute on __test(). This cannot be a function with a __printf()
+ * attribute because GCC requires __printf() functions to be variadic.
+ */
+#define test_hashed(kunittest, fmt, p)						\
+	do {									\
+		char buf[PLAIN_BUF_SIZE];					\
+		plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE);	\
+		test(buf, fmt, p);						\
+	} while (0)
 
 /*
  * NULL pointers aren't hashed.

---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20251206-printf-kunit-printf-attr-19369fc57bf0

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

