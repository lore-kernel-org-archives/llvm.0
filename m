Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DE33D4
	for <llvm@lists.linux.dev>; Sun,  9 Oct 2022 20:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6FCC433D7;
	Sun,  9 Oct 2022 20:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665348711;
	bh=hzbiDCjgP4PWpxtEpRK2mCWbxYUpFdc6paCISbBKNxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q6k609cnK5afOOBAPLIUIqgT/I8fH8LtGVQ6vYbBhNuMVryy4pyPASLKpLjYIwAHY
	 aeRYL8JbLR4ztn6xgTEnlWpejHG1BYWIqT5/AQsEMcFOj+hoAn7ALtRyZG/rRqoW+s
	 RcTx75cbXMHq3IremtGkinwOKNobHzI9o3FByuDBxYm+reey/GaoUCcy8DOQSvtJd+
	 Kpd+nvQvwEsiy0Mi24KQODpe5EuYPHCsRvDVzxJ/GHyD48u4d0FfxYHxAMQWtKco+T
	 XPmaYFtA9UkNO3c+NpSoTUaN+eTb/3K9FYrX4/e6TJ7w7veTWIyA26s7vQ6m1L93M6
	 cwvvJLUYmVhzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	David Gow <davidgow@google.com>,
	Yury Norov <yury.norov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.0 08/18] fortify: Fix __compiletime_strlen() under UBSAN_BOUNDS_LOCAL
Date: Sun,  9 Oct 2022 16:51:25 -0400
Message-Id: <20221009205136.1201774-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009205136.1201774-1-sashal@kernel.org>
References: <20221009205136.1201774-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Kees Cook <keescook@chromium.org>

[ Upstream commit d07c0acb4f41cc42a0d97530946965b3e4fa68c1 ]

With CONFIG_FORTIFY=y and CONFIG_UBSAN_LOCAL_BOUNDS=y enabled, we observe
a runtime panic while running Android's Compatibility Test Suite's (CTS)
android.hardware.input.cts.tests. This is stemming from a strlen()
call in hidinput_allocate().

__compiletime_strlen() is implemented in terms of __builtin_object_size(),
then does an array access to check for NUL-termination. A quirk of
__builtin_object_size() is that for strings whose values are runtime
dependent, __builtin_object_size(str, 1 or 0) returns the maximum size
of possible values when those sizes are determinable at compile time.
Example:

  static const char *v = "FOO BAR";
  static const char *y = "FOO BA";
  unsigned long x (int z) {
      // Returns 8, which is:
      // max(__builtin_object_size(v, 1), __builtin_object_size(y, 1))
      return __builtin_object_size(z ? v : y, 1);
  }

So when FORTIFY_SOURCE is enabled, the current implementation of
__compiletime_strlen() will try to access beyond the end of y at runtime
using the size of v. Mixed with UBSAN_LOCAL_BOUNDS we get a fault.

hidinput_allocate() has a local C string whose value is control flow
dependent on a switch statement, so __builtin_object_size(str, 1)
evaluates to the maximum string length, making all other cases fault on
the last character check. hidinput_allocate() could be cleaned up to
avoid runtime calls to strlen() since the local variable can only have
literal values, so there's no benefit to trying to fortify the strlen
call site there.

Perform a __builtin_constant_p() check against index 0 earlier in the
macro to filter out the control-flow-dependant case. Add a KUnit test
for checking the expected behavioral characteristics of FORTIFY_SOURCE
internals.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Tom Rix <trix@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: David Gow <davidgow@google.com>
Cc: Yury Norov <yury.norov@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Sander Vanheule <sander@svanheule.net>
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Android Treehugger Robot
Link: https://android-review.googlesource.com/c/kernel/common/+/2206839
Co-developed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/fortify-string.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
index 3b401fa0f374..fce2fb2fc962 100644
--- a/include/linux/fortify-string.h
+++ b/include/linux/fortify-string.h
@@ -19,7 +19,8 @@ void __write_overflow_field(size_t avail, size_t wanted) __compiletime_warning("
 	unsigned char *__p = (unsigned char *)(p);		\
 	size_t __ret = (size_t)-1;				\
 	size_t __p_size = __builtin_object_size(p, 1);		\
-	if (__p_size != (size_t)-1) {				\
+	if (__p_size != (size_t)-1 &&				\
+	    __builtin_constant_p(*__p)) {			\
 		size_t __p_len = __p_size - 1;			\
 		if (__builtin_constant_p(__p[__p_len]) &&	\
 		    __p[__p_len] == '\0')			\
-- 
2.35.1

