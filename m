Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCDB7D6A
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 02:59:37 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id d14so1455495ual.9
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 19:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CKHvTi4YwJXZJRGwVfRL/R88FULwtUdHKdHzSiNxiUI=;
        b=bxp0HgYTcP7xWd+2+ngcf/N+fj5uqCx1pqSdm2Hxx/eCl96Ydvt3uxLvIsGstcz7/1
         HMcQ7NEzww2XOZV4zsflNCY7eP3eBONkdo0UGFcuiNrTWs4ytrdfRqSmPT2a3r7GEWrq
         pHt+E+JQqOTJiuaBgW02qyPMw4kvn1DMWi3aApYLRw3noVN71QkCqdcFkzKlICxBF7G1
         5TSFOOm1SMGnCTaIVGtOko8QVt9QtPwcCYQwQtfLbG93o7J81+x88sFX0EM5NDJOEPAI
         tKlsbEerlaQhhPOVUOe2amRtykWPxG/4NIDyxueIyawhRz0MN4FLrQtxFHzZ/iFUQGBH
         Oe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CKHvTi4YwJXZJRGwVfRL/R88FULwtUdHKdHzSiNxiUI=;
        b=Zm70G4+3NEj3KFmoW9/uyGz3k93vckMgogKdppIq3dMUwLs9hjAUkjLLLChITA7KEg
         T1aduV0jDwLP97W88gcAyU2SCJkWzSl4Wf47gmTCwUiqeHNa79KMMAUEF1mSvbhxq84V
         cN1gHqcFDOROWRD31P/LJnwXOSo19TcqUQ9zB42VgawcUrDdcPF7e8asUWg79Jnrim8D
         NQLhwxfZFCEbRyQyM3mANz/NZpTYCjH55nPw/9ROOaxpk4NQLh3WOZdtnJvJAwfT9aQ6
         jR4EGA58xkrRXHMEoxFHfEoaRt26S130Lu3eR4ghaWUWKDR5CubCx72UmDEneMsKtrpo
         vQiQ==
X-Gm-Message-State: ACgBeo01QaecTxKcUcbZolG8Y4DySF0V0o8Kjiwm2EAJtWzp95620v/K
	Kl1QUG7aku7QhsVET0fv0H16XPeZrXzcgtN7f7wuMw==
X-Google-Smtp-Source: AA6agR4vrKugMncNQTjKe9Uv+geBOGHnKMSIYbmveMarldKIsOEUnMPeyJ7VXT9c3Y/iopeUkD6lKEEMjk6YAOAvaKM=
X-Received: by 2002:a05:6130:1102:b0:38c:49b4:bbc3 with SMTP id
 ce2-20020a056130110200b0038c49b4bbc3mr12440605uab.107.1662173976584; Fri, 02
 Sep 2022 19:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902204351.2521805-1-keescook@chromium.org> <20220902204351.2521805-3-keescook@chromium.org>
In-Reply-To: <20220902204351.2521805-3-keescook@chromium.org>
From: David Gow <davidgow@google.com>
Date: Sat, 3 Sep 2022 10:59:24 +0800
Message-ID: <CABVgOS=Ru4Eu03T71svLA=j9jizGro44n3h59pQYw33QYPfLaQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] fortify: Add KUnit test for FORTIFY_SOURCE internals
To: Kees Cook <keescook@chromium.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Yury Norov <yury.norov@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Sander Vanheule <sander@svanheule.net>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Isabella Basso <isabbasso@riseup.net>, 
	Eric Dumazet <edumazet@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Eric Biggers <ebiggers@google.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 3, 2022 at 4:43 AM Kees Cook <keescook@chromium.org> wrote:
>
> Add lib/fortify_kunit.c KUnit test for checking the expected behavioral
> characteristics of FORTIFY_SOURCE internals.
>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> Cc: David Gow <davidgow@google.com>
> Cc: Yury Norov <yury.norov@gmail.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Sander Vanheule <sander@svanheule.net>
> Cc: linux-hardening@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Overall, this looks good. It's a bit of a shame FORTIFY_SOURCE doesn't
work under UML, but I tested it on everything else I had to hand and
it looked good.

One tiny typo in a comment below, but otherwise this is:

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  MAINTAINERS         |  1 +
>  lib/Kconfig.debug   |  9 ++++++
>  lib/Makefile        |  1 +
>  lib/fortify_kunit.c | 77 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 88 insertions(+)
>  create mode 100644 lib/fortify_kunit.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d7f64dc0efe..640115472199 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8002,6 +8002,7 @@ L:        linux-hardening@vger.kernel.org
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
>  F:     include/linux/fortify-string.h
> +F:     lib/fortify_kunit.c
>  F:     lib/test_fortify/*
>  F:     scripts/test_fortify.sh
>  K:     \b__NO_FORTIFY\b
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 36455953d306..1f267c0ddffd 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2542,6 +2542,15 @@ config STACKINIT_KUNIT_TEST
>           CONFIG_GCC_PLUGIN_STRUCTLEAK, CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF,
>           or CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.
>
> +config FORTIFY_KUNIT_TEST
> +       tristate "Test fortified str*() and mem*() function internals at runtime" if !KUNIT_ALL_TESTS
> +       depends on KUNIT && FORTIFY_SOURCE
> +       default KUNIT_ALL_TESTS
> +       help
> +         Builds unit tests for checking internals of FORTIFY_SOURCE as used
> +         by the str*() and mem*() family of functions. For testing runtime
> +         traps of FORTIFY_SOURCE, see LKDTM's "FORTIFY_*" tests.
> +
>  config TEST_UDELAY
>         tristate "udelay test driver"
>         help
> diff --git a/lib/Makefile b/lib/Makefile
> index f545140ed9e7..4ee1ceae945a 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -381,6 +381,7 @@ obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
>  obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
>  CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
>  obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
> +obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
>
>  obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
>
> diff --git a/lib/fortify_kunit.c b/lib/fortify_kunit.c
> new file mode 100644
> index 000000000000..4d7930b65107
> --- /dev/null
> +++ b/lib/fortify_kunit.c
> @@ -0,0 +1,77 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Runtime test cases for CONFIG_FORTIFY_SOURCE that aren't expected to
> + * Oops th kernel on success. (For those, see drivers/misc/lkdtm/fortify.c)

Nit: Oops _the_ kernel

> + *
> + * For corner cases with UBSAN, try testing with:
> + *
> + * ./tools/testing/kunit/kunit.py run --arch=x86_64 \
> + *     --kconfig_add CONFIG_FORTIFY_SOURCE=y \
> + *     --kconfig_add CONFIG_UBSAN=y \
> + *     --kconfig_add CONFIG_UBSAN_TRAP=y \
> + *     --kconfig_add CONFIG_UBSAN_BOUNDS=y \
> + *     --kconfig_add CONFIG_UBSAN_LOCAL_BOUNDS=y \
> + *     --make_options LLVM=1 fortify
> + */
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <kunit/test.h>
> +#include <linux/string.h>
> +#include <linux/init.h>
> +
> +static const char array_of_10[] = "this is 10";
> +static const char *ptr_of_11 = "this is 11!";
> +static char array_unknown[] = "compiler thinks I might change";
> +
> +static void known_sizes_test(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, __compiletime_strlen("88888888"), 8);
> +       KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_of_10), 10);
> +       KUNIT_EXPECT_EQ(test, __compiletime_strlen(ptr_of_11), 11);
> +
> +       KUNIT_EXPECT_EQ(test, __compiletime_strlen(array_unknown), SIZE_MAX);
> +       /* Externally defined and dynamically sized string pointer: */
> +       KUNIT_EXPECT_EQ(test, __compiletime_strlen(saved_command_line), SIZE_MAX);
> +}
> +
> +/* This is volatile so the optimizer can't perform DCE below. */
> +static volatile int pick;
> +
> +/* Not inline to keep optimizer from figuring out which string we want. */
> +static noinline size_t want_minus_one(int pick)
> +{
> +       const char *str;
> +
> +       switch (pick) {
> +       case 1:
> +               str = "4444";
> +               break;
> +       case 2:
> +               str = "333";
> +               break;
> +       default:
> +               str = "1";
> +               break;
> +       }
> +       return __compiletime_strlen(str);
> +}
> +
> +static void control_flow_split_test(struct kunit *test)
> +{
> +       KUNIT_EXPECT_EQ(test, want_minus_one(pick), SIZE_MAX);
> +}
> +
> +static struct kunit_case fortify_test_cases[] = {
> +       KUNIT_CASE(known_sizes_test),
> +       KUNIT_CASE(control_flow_split_test),
> +       {}
> +};
> +
> +static struct kunit_suite fortify_test_suite = {
> +       .name = "fortify",
> +       .test_cases = fortify_test_cases,
> +};
> +
> +kunit_test_suite(fortify_test_suite);
> +
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
