Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A238536C9CE;
	Fri, 20 Mar 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041334; cv=none; b=mVITefB2bC5k8lRS5FsQliMJzK22r7U4SovGKDRoph3Cpw+mntgjrlty+YiMVJF0kQEvLSFzuMC/lpFTnqgz6LAMGTRnlJOr2Eb3u7gvczYU1q9bTbVV+JZ9hWs0c4SUB9WPmvu/bXM7pvW0Gda5SJ/gr3te4uXo2Qe8Ei+Ar9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041334; c=relaxed/simple;
	bh=csKLUf7y3E2BBLslrtaxu3wMNwA8IU1Jx5o2zubmCoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CabM57bhLcsBHMXum5G/1ri8JHAkti6WBpfA0l3+GFw50R8AkuXUYBnRb6OV+ELXqZtirskfKfPVJT+supqWeDMEATWoth+w2IYNy3Lc3U5XvkgzsPGMPX30gdnfVs138ui6cafeCmA2MBwGiuCD7ybx477nRXJI0lAej7/j9Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rE5jZlt5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rE5jZlt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296F3C4CEF7;
	Fri, 20 Mar 2026 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774041334;
	bh=csKLUf7y3E2BBLslrtaxu3wMNwA8IU1Jx5o2zubmCoA=;
	h=From:To:Cc:Subject:Date:From;
	b=rE5jZlt5LTQFurZbBN5sDlM/PrJaZuk3sVzsDJ43H6lMhnYot+i9vrFHKPzcEloq5
	 21e3JuQmEtZMo01tabvZM39wqBfZQQSUs3wCkEtbef2oMlw6CN+r1MU0SYSD/Ytp/N
	 gx2BW7SXKLNRXMhzqIOP41mX+R/PCYj7WlN2dqgg8XKuBxINgm/2x0unxl58l192Qs
	 iIiB+wbjd4FHNeZaE7WyUxn9BEd68VzqlD3dwR1/BP+DiMAQP2D/fjYUJ4RffbZBAy
	 giRhsasAI2EIors4Fu/i0sn3Qhozg1MMbG4jBfDn4EoKV34lRjAcWTr3nfMOIhGGYt
	 4oyzPIWNT5hRg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Brendan Jackman <jackmanb@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] bug: shut up format attribute warning for clang as well
Date: Fri, 20 Mar 2026 22:14:25 +0100
Message-Id: <20260320211528.2474389-1-arnd@kernel.org>
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

Turn off this warning for all compilers and versions.

Fixes: d36067d6ea00 ("bug: Hush suggest-attribute=format for __warn_printf()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/bug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/bug.c b/lib/bug.c
index bbc301097749..374feb144f0b 100644
--- a/lib/bug.c
+++ b/lib/bug.c
@@ -174,8 +174,7 @@ struct bug_entry *find_bug(unsigned long bugaddr)
 }
 
 __diag_push();
-__diag_ignore(GCC, all, "-Wsuggest-attribute=format",
-	      "Not a valid __printf() conversion candidate.");
+__diag_ignore_all("-Wmissing-format-attribute", "Not a valid __printf() conversion candidate.");
 static void __warn_printf(const char *fmt, struct pt_regs *regs)
 {
 	if (!fmt)
-- 
2.39.5

