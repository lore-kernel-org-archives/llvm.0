Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CD73E51F1;
	Mon, 23 Mar 2026 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774299342; cv=none; b=FBoE+HZou9/l1kpnORDKPJKVtM9qsojOZomQYsRL5jbc3dPLan1VxpmpfxR1yYvOtQZKpRVZE0DvVvFb/Nh8NJrGG7HMUA4v8qfVljKk98+RffI9/X+X/lgbuqigKiHAjVbyRasI1ZTvouQKJSaf9RyUJiQFWdzV1f+7p5FQVkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774299342; c=relaxed/simple;
	bh=bXDsNZkol4rGNmXf4f6JJ+4NSTwVh9smZTUaoIwZfw8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=is3twNCIj81CgDm3zXxhu8XY930IAmfYeoEbkyB/uks5XsZea6Uh2xPW+kgtNZhTJpG/sYduJqA/lwJ14i8R+g2FwDirWlkdZFJfGsaXx5AxULh8A6cel/gSWIuM0uJP7NYHD/WikURrVjYYtI44ByvkjUnyaVMOpya3RLyfx6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipoo2V1r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipoo2V1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE70C2BC9E;
	Mon, 23 Mar 2026 20:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774299342;
	bh=bXDsNZkol4rGNmXf4f6JJ+4NSTwVh9smZTUaoIwZfw8=;
	h=From:To:Cc:Subject:Date:From;
	b=ipoo2V1rFWbHawxbK3KPE5meRleljltEWCMANGRkGlXdotgzW13rsilxUFeydxnvm
	 fAZPKKtE4WRWtPmhfHmSasJK0enROGbQhtbPpUofMF04lrX5TZUywKbKN1vSZ/2IcL
	 lnfKsu9xxA5lgzGAdPBxZx2dasQBAvwNOePA6HhoHwGUw7bhnEcGRPXMX7Zkjic5mH
	 oYYKBw86MPov4cGaxQUUUPLS6vf1lghTIsC7dSA0/XgJceBmX/QQKDWj7kcr1Pf1a6
	 m3h+ZuUejdaS0lGil5G3STEtKOheDvtIOLR25F+sPrKEQYasQLYgS4rmKRKnx1I98/
	 g5B9UsXoLYPDg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] bug: avoid format attribute warning for clang as well
Date: Mon, 23 Mar 2026 21:55:16 +0100
Message-Id: <20260323205534.1284284-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Like gcc, clang-22 now also warns about a function that it
incorrectly identifies as a printf-style format:

lib/bug.c:190:22: error: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of '__warn_printf' [-Werror,-Wmissing-format-attribute]
  179 | static void __warn_printf(const char *fmt, struct pt_regs *regs)
      | __attribute__((format(printf, 1, 0)))
  180 | {
  181 |         if (!fmt)
  182 |                 return;
  183 |
  184 | #ifdef HAVE_ARCH_BUG_FORMAT_ARGS
  185 |         if (regs) {
  186 |                 struct arch_va_list _args;
  187 |                 va_list *args = __warn_args(&_args, regs);
  188 |
  189 |                 if (args) {
  190 |                         vprintk(fmt, *args);
      |                                           ^

Revert the change that added a gcc-specific workaround, and instead add
the generic annotation that avoid the warning.

Fixes: d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Suggested-by: Brendan Jackman <jackmanb@google.com>
Link: https://lore.kernel.org/all/20251208141618.2805983-1-andriy.shevchenko@linux.intel.com/T/#u
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Replace my earlier patch with Andy's solution
---
 lib/bug.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/bug.c b/lib/bug.c
index bbc301097749..224f4cfa4aa3 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -173,10 +173,8 @@ struct bug_entry *find_bug(unsigned long bugaddr)
 	return module_find_bug(bugaddr);
 }
 
-__diag_push();
-__diag_ignore(GCC, all, "-Wsuggest-attribute=format",
-	      "Not a valid __printf() conversion candidate.");
-static void __warn_printf(const char *fmt, struct pt_regs *regs)
+static __printf(1, 0)
+void __warn_printf(const char *fmt, struct pt_regs *regs)
 {
 	if (!fmt)
 		return;
@@ -195,7 +193,6 @@ static void __warn_printf(const char *fmt, struct pt_regs *regs)
 
 	printk("%s", fmt);
 }
-__diag_pop();
 
 static enum bug_trap_type __report_bug(struct bug_entry *bug, unsigned long bugaddr, struct pt_regs *regs)
 {
-- 
2.39.5

