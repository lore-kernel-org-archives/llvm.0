Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161673D62
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 20:56:00 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 204-20020a2510d5000000b006be7970889cso14550974ybq.21
        for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 13:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYxJs2vRth6XEldvpd7cCs72Yhted4rknZIaH3l0kX4=;
        b=TuUPF111ikwTGiQiA1pvT8abbak3tcqv/wR29Z1fj7pKh1P7MvVH2Zd+0g78s0t7AL
         VgBafkzWaczA/kbcKtASceofDWzHEKret+UfCmury9gZ9C0cwnRytdAwonUuht3QseYx
         fmPk+w5ufFKv9d3tXJ0DfikUNsXsVsnrLcL0b023Uzyd3YZD+qPwNRWDWpIrnl1jdiSv
         ZwDDotGgKixWZ6rzcpaX+aoQHzRpSPytzEj5Vw7TVjif3mK36haJTtYLlLhKamfG8zIS
         cKrO6ATcExQLMn1+PuZcKp9Vw0Lw0r5KbEthrZoxexVlCsEwLRaiNUzuxLmaN0/f5DQI
         nomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xYxJs2vRth6XEldvpd7cCs72Yhted4rknZIaH3l0kX4=;
        b=TIVh4CtqwkkU5Hi5L/286h5Fs+7VDH1Bx9dqFX/T1KfyKlyroh28TKvJ8Opwjo2qap
         flTT3dyxTwhoDQ4s/f5uJwlg+tYtaqGzVcWeMBjQBKG8E1MY5mCiIbKmM2i2PSd6eXNW
         doovRAS8lDS/4Fr9Nf7Gj0hsElMzHwkIpmekszLB99NouSLIbbtReWOYjMy6i5jmFP4P
         l0g5W/6rxnJf1kFkbZPZjRxwFAnQVc5VN8X2qiQkhF3gcutAxSLWjVz+ZfoXl4BF6yUm
         aKs+NwL9cPN6fn6WaHXHM+D1JmtgK7iVBtCGB5dZLdtAk4r2AImuUne3quEKbyNqAenH
         6ZnQ==
X-Gm-Message-State: ACrzQf3qG1QQi1IlB9+R5PkPLgzcTHEnshXYUZrd/F903OsnTNj9nJdY
	2bWtpgO2QeTwHK3pBkvgH9f49Ji5WWcPFnppMLY=
X-Google-Smtp-Source: AMsMyM44+ntM8yviuIiZd5PKWLhSqxXCty8/o0mGlNcfuIBxiQ8sWjXRRjlkrJ1CNPB2WgZ9p8UgzDXvtSKDrjMNU3c=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:4ed2:3edd:ee48:33e0])
 (user=ndesaulniers job=sendgmr) by 2002:a81:844f:0:b0:356:9481:8792 with SMTP
 id u76-20020a81844f000000b0035694818792mr24950381ywf.138.1665521760039; Tue,
 11 Oct 2022 13:56:00 -0700 (PDT)
Date: Tue, 11 Oct 2022 13:55:47 -0700
In-Reply-To: <c8f87abd-9d66-40cf-bcea-e2b1388d3030@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <c8f87abd-9d66-40cf-bcea-e2b1388d3030@app.fastmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665521747; l=3390;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=X+cvnL0/9tWxHyPq7VqQPGifcP15h1D7GusdoDV01Dc=;
 b=CZMzazlI/uts3rfQLikQnvuAXx1USm8fEHeveny4RE2lc4TgnvaA/U/CgBI03pAmME3GBnCfpqE/
 8SdrJm7jBd8WA+xub5iAXZc8sLRfqYF+fPqzy+U2qQFkSXV9sBYM
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221011205547.14553-1-ndesaulniers@google.com>
Subject: [PATCH v2] fs/select: mark do_select noinline_for_stack
From: Nick Desaulniers <ndesaulniers@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Xiaoming Ni <nixiaoming@huawei.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Andi Kleen <ak@linux.intel.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	"Darrick J. Wong" <darrick.wong@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Effectively a revert of
commit ad312f95d41c ("fs/select: avoid clang stack usage warning")

Various configs can still push the stack useage of core_sys_select()
over the CONFIG_FRAME_WARN threshold (1024B on 32b targets).

  fs/select.c:619:5: error: stack frame size of 1048 bytes in function
  'core_sys_select' [-Werror,-Wframe-larger-than=]

core_sys_select() has a large stack allocation for `stack_fds` where it
tries to do something equivalent to "small string optimization" to
potentially avoid a kmalloc.

core_sys_select() calls do_select() which has another potentially large
stack allocation, `table`. Both of these values depend on
FRONTEND_STACK_ALLOC.

Mix those two large allocation with register spills which are
exacerbated by various configs and compiler versions and we can just
barely exceed the 1024B limit.

Rather than keep trying to find the right value of MAX_STACK_ALLOC or
FRONTEND_STACK_ALLOC, mark do_select() as noinline_for_stack.

The intent of FRONTEND_STACK_ALLOC is to help potentially avoid a
dynamic memory allocation. In that spirit, restore the previous
threshold but separate the stack frames.

Many tests of various configs for different architectures and various
versions of GCC were performed; do_select() was never inlined into
core_sys_select() or compat_core_sys_select(). The kernel is built with
the GCC specific flag `-fconserve-stack` which can limit inlining
depending on per-target thresholds of callee stack size, which helps
avoid the issue when using GCC. Clang is being more aggressive and not
considering the stack size when decided whether to inline or not. We may
consider using the clang-16+ flag `-finline-max-stacksize=` in the
future.

Link: https://lore.kernel.org/lkml/20221006222124.aabaemy7ofop7ccz@google.com/
Fixes: ad312f95d41c ("fs/select: avoid clang stack usage warning")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Drop the 32b specific guard, since I could reproduce the no-inlining
  w/ aarch64-linux-gnu-gcc-10 ARCH=arm64 defconfig, and per Arnd.
* Drop references to 32b in commit message.
* Add new paragraph in commit message at the end about -fconserve-stack
  and -finline-max-stacksize=.
* s/malloc/kmalloc/ in commit message.

 fs/select.c          | 1 +
 include/linux/poll.h | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/select.c b/fs/select.c
index 0ee55af1a55c..794e2a91b1fa 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -476,6 +476,7 @@ static inline void wait_key_set(poll_table *wait, unsigned long in,
 		wait->_key |= POLLOUT_SET;
 }
 
+noinline_for_stack
 static int do_select(int n, fd_set_bits *fds, struct timespec64 *end_time)
 {
 	ktime_t expire, *to = NULL;
diff --git a/include/linux/poll.h b/include/linux/poll.h
index a9e0e1c2d1f2..d1ea4f3714a8 100644
--- a/include/linux/poll.h
+++ b/include/linux/poll.h
@@ -14,11 +14,7 @@
 
 /* ~832 bytes of stack space used max in sys_select/sys_poll before allocating
    additional memory. */
-#ifdef __clang__
-#define MAX_STACK_ALLOC 768
-#else
 #define MAX_STACK_ALLOC 832
-#endif
 #define FRONTEND_STACK_ALLOC	256
 #define SELECT_STACK_ALLOC	FRONTEND_STACK_ALLOC
 #define POLL_STACK_ALLOC	FRONTEND_STACK_ALLOC
-- 
2.38.0.rc2.412.g84df46c1b4-goog

