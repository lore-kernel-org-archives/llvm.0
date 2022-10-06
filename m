Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A1440E
	for <llvm@lists.linux.dev>; Thu,  6 Oct 2022 17:17:59 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-3521c1a01b5so22821477b3.23
        for <llvm@lists.linux.dev>; Thu, 06 Oct 2022 10:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=jk5YmSyb0gph2pzBO4BfTZXMvHh05wogmHgS6+BedyQ=;
        b=gtylAjfPsEim3lOUTU9YBP3wrcVJRvZRkcfYPWNHSLMdabQLOtY3VZttvfUg+46yHH
         gK77Ql04L7LAs83Ejb3rkJ6ZDd/bEDnHtwR1F+Q1NuGcSN2H1JZjkD/kKllhEiUEbnU4
         xYUW6yxCN2UDXWFNSg3FQjewm31vRkIFGuV7BZtkNuvpXSGm5RUyaVY+v1m+mvLd1NGP
         Osp52SG9Xjz5tD5oDNGj8Tbhqx/YdwpgbNaHZvdr6Eqcn7YOb9fsVM6seGveBTtlPKzJ
         goyeGxs6hX8oj5MtHcQikWEcASEOfbTeHZHRfqNNLFslKnIgg0okB7Unmq9gwRDBijuZ
         fyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=jk5YmSyb0gph2pzBO4BfTZXMvHh05wogmHgS6+BedyQ=;
        b=FxXxIvpsvV/JhOlYAGWdmW3CKXMHZunG+CuaVTJFZYXZxVmf58bZ+s/ZL0AyYttRm4
         GjVhKk6x0O1K1wc7jB3lwoH6Deg7lbsMb0P24/smSxkAMl78+U6H0LhJd1cVUSa6N9f0
         +rusC7S8579PXq13PEwb6NN/5emMlAn3Y/y4gaX2DV51IMgmv8via6k9S/68eNVOnDfT
         55G0KCXi/OM42Q4ytwckHDt7mNPgqQ/t0bu+aIHTxv5ITzqbTAba7R0443NFu5T1ccwQ
         lCU7AlC0yov5x/p6Yd+YtoXiaApUlTsoj0aw2rGXPdzv3WHZXjQJcJLNm9zr9NSza8vi
         RMqA==
X-Gm-Message-State: ACrzQf1JG05mIuMzPPWgl8GpAxBatBkQ3g98ycZpIorgD09dNvVFQgQg
	zAas2brO3VAju+PJlbSWTinA9X7tJdS03wgDr+o=
X-Google-Smtp-Source: AMsMyM6zZoEr3wY+6sXA0eKrMp0CR8kwGYBwgAW6sKyV0o/LNgcqSDHQf00i0ypXIMW15dETQkBzT/V496+jMJdIxFc=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:b2dd:e583:b2f1:2e20])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:d6c6:0:b0:35b:aa7a:10b4 with SMTP
 id y189-20020a0dd6c6000000b0035baa7a10b4mr760824ywd.161.1665076678099; Thu,
 06 Oct 2022 10:17:58 -0700 (PDT)
Date: Thu,  6 Oct 2022 10:17:51 -0700
In-Reply-To: <202210061321.xSA91B7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202210061321.xSA91B7C-lkp@intel.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665076671; l=2656;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=IO+cdoJnNXl88Tx/AgtWaYA5qQNw59irb7FwqAfwa8U=;
 b=mL0v7oDirBdf8VvOec4LhwIiDfXocIytR+0yGA72JDjJTKljRtO4mlUgyu1LVZv5EXPKSA1mDnAj
 aDzSvzq/AWFvPc8KGB5O+9xc1JJG3X5UKl7/Z2cIEU/Xg8GeoUi7
X-Mailer: git-send-email 2.38.0.rc2.412.g84df46c1b4-goog
Message-ID: <20221006171751.3444575-1-ndesaulniers@google.com>
Subject: [PATCH v2] overflow: disable failing tests for older clang versions
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Daniel Latypov <dlatypov@google.com>, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

Building the overflow kunit tests with clang-11 fails with:

$ ./tools/testing/kunit/kunit.py run --arch=arm --make_options LLVM=1 \
overflow
...
ld.lld: error: undefined symbol: __mulodi4
...

Clang 11 and earlier generate unwanted libcalls for signed output,
unsigned input.

Disable these tests for now, but should these become used in the kernel
we might consider that as justification for dropping clang-11 support.
Keep the clang-11 build alive a little bit longer.

Avoid -Wunused-function warnings via __maybe_unused. To test W=1:

$ make LLVM=1 -j128 defconfig
$ ./scripts/config -e KUNIT -e KUNIT_ALL
$ make LLVM=1 -j128 olddefconfig lib/overflow_kunit.o W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1711
Link: https://github.com/llvm/llvm-project/commit/3203143f1356a4e4e3ada231156fc6da6e1a9f9d
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Put back previous clang-13 related BITS_PER_LONG == 64 guards; all
  BITS_PER_LONG guards would need to be updated with the condition I was
  trying to change. Otherwise kernel test robot reported instances of
  "use of undeclared identifier" errors.
* Simplify my condition; the issue has nothing to do with lp64 targets.
* Remove link from comment.
* Add instructions for W=1 testing.
* Tested with clang-11 and clang-16 (ToT).

 lib/overflow_kunit.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
index f385ca652b74..2914c9d36b0f 100644
--- a/lib/overflow_kunit.c
+++ b/lib/overflow_kunit.c
@@ -254,6 +254,7 @@ static void do_test_ ## n(struct kunit *test, const struct test_ ## n *p) \
 	check_one_op(t, fmt, mul, "*", p->b, p->a, p->prod, p->p_of);	\
 }									\
 									\
+__maybe_unused								\
 static void n ## _overflow_test(struct kunit *test) {			\
 	unsigned i;							\
 									\
@@ -720,8 +721,14 @@ static struct kunit_case overflow_test_cases[] = {
 	KUNIT_CASE(u64_u64__u64_overflow_test),
 	KUNIT_CASE(s64_s64__s64_overflow_test),
 #endif
-	KUNIT_CASE(u32_u32__u8_overflow_test),
+/*
+ * Clang 11 and earlier generate unwanted libcalls for signed output, unsigned
+ * input.
+ */
+#if !(defined(CONFIG_CC_IS_CLANG) && __clang_major__ <= 11)
 	KUNIT_CASE(u32_u32__int_overflow_test),
+#endif
+	KUNIT_CASE(u32_u32__u8_overflow_test),
 	KUNIT_CASE(u8_u8__int_overflow_test),
 	KUNIT_CASE(int_int__u8_overflow_test),
 	KUNIT_CASE(shift_sane_test),

base-commit: 833477fce7a14d43ae4c07f8ddc32fa5119471a2
-- 
2.38.0.rc2.412.g84df46c1b4-goog

