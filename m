Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACD92F52;
	Mon, 17 Jul 2023 21:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB0C433C7;
	Mon, 17 Jul 2023 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689630810;
	bh=RztrCp1Ph4HpQPIgXscSGBp/jm5AYj1dfG5W+cuG8ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mz2b+sebjWCWr5Msft8pwybPBAgMd1UOvMh5PFSY24JMUwdqsS9xl2w7VIRyLYmw0
	 4/2zr9Pu2WEk8CKU/I2oq+vDNAuG9lODrOLecPuaINcX+CHSUdwIUVhhKrtJSJif+l
	 qk5H+lweczyr0x4LZa0tY1D/vw7ArPk6DNAmIo7Yb4jt8EPfe5LOpoRMDBJ5iK2CoL
	 14hqja0xBMBbKIv1cWKvylWEGfpny2ujgSzEDISVNhCQN7HBWlMkd+uFkqyiHPy91v
	 diSW6e9hpoIQO0OxaJfKTyFBFVuTWr0rSxa0g9OLBQ+XL51pufglEGzyBlwtEt7hsS
	 qBVLuiEO3bYsQ==
Date: Mon, 17 Jul 2023 14:53:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Tom Rix <trix@redhat.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] lib/bitmap: waive const_eval test as it breaks the build
Message-ID: <20230717215328.GA18505@dev-arch.thelio-3990X>
References: <20230717195813.29059-1-yury.norov@gmail.com>
 <20230717203105.GA2212488@dev-arch.thelio-3990X>
 <CAKwvOdmUb=JgigcHxOR2trAx+fSxsKu9nNbpAhN1hC8_RBNXeQ@mail.gmail.com>
 <ZLWzLHsGmRxpylxN@yury-ThinkPad>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLWzLHsGmRxpylxN@yury-ThinkPad>

On Mon, Jul 17, 2023 at 02:31:24PM -0700, Yury Norov wrote:
> On Mon, Jul 17, 2023 at 01:57:40PM -0700, Nick Desaulniers wrote:
> > On Mon, Jul 17, 2023 at 1:31 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > Hi Yury,
> > >
> > > On Mon, Jul 17, 2023 at 12:58:13PM -0700, Yury Norov wrote:
> > > > When building with clang, and when KASAN and GCOV_PROFILE_ALL are both
> > > > enabled, the test fails to build [1]:
> > > >
> > > > >> lib/test_bitmap.c:920:2: error: call to '__compiletime_assert_239' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
> > > >            BUILD_BUG_ON(!__builtin_constant_p(res));
> > > >            ^
> > > >    include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
> > > >            BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
> > > >            ^
> > > >    include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
> > > >    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
> > > >                                        ^
> > > >    include/linux/compiler_types.h:352:2: note: expanded from macro 'compiletime_assert'
> > > >            _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> > > >            ^
> > > >    include/linux/compiler_types.h:340:2: note: expanded from macro '_compiletime_assert'
> > > >            __compiletime_assert(condition, msg, prefix, suffix)
> > > >            ^
> > > >    include/linux/compiler_types.h:333:4: note: expanded from macro '__compiletime_assert'
> > > >                            prefix ## suffix();                             \
> > > >                            ^
> > > >    <scratch space>:185:1: note: expanded from here
> > > >    __compiletime_assert_239
> > > >
> > > > Originally it was attributed to s390, which now looks seemingly wrong. The
> > > > issue is also not related to bitmap code itself, but it breaks build for
> > > > a given configuration. So, disabling the test unless the compiler will
> > > > get fixed.
> > > >
> > > > [1] https://github.com/ClangBuiltLinux/linux/issues/1874
> > > >
> > > > Fixes: dc34d5036692 ("lib: test_bitmap: add compile-time optimization/evaluations assertions")
> > > > Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > > > ---
> > > >  lib/test_bitmap.c | 17 +++++------------
> > > >  1 file changed, 5 insertions(+), 12 deletions(-)
> > > >
> > > > diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> > > > index 187f5b2db4cf..a791fdb7a8c9 100644
> > > > --- a/lib/test_bitmap.c
> > > > +++ b/lib/test_bitmap.c
> > > > @@ -1163,6 +1163,9 @@ static void __init test_bitmap_print_buf(void)
> > > >
> > > >  static void __init test_bitmap_const_eval(void)
> > > >  {
> > > > +#if defined(CONFIG_CC_IS_CLANG) && defined(CONFIG_KASAN) && defined(CONFIG_GCOV_PROFILE_ALL)
> > > > +#warning "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled"
> > >
> > > Making this a '#warning' will basically just replace the current error
> > > with a different one in the face of CONFIG_WERROR, which seems pointless
> > > to me:
> > >
> > >   lib/test_bitmap.c:1167:2: error: "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled" [-Werror,-W#warnings]
> > >    1167 | #warning "FIXME: Clang breaks compile time evaluations when KASAN and GCOV are enabled"
> > >         |  ^
> > >   1 error generated.
> > >
> > > Could we just opt out of GCOV for test_bitmap.c if KASAN is enabled with
> > > clang? That does not seem too bad of a workaround. I highly doubt there
> > > are many people who are interested in debugging test_bitmap.c with KASAN
> > > while profiling it with GCOV when building with clang, since they would
> > > have hit this already and reported it already; as far as I can tell,
> > > only the Intel robot has reported this with a randconfig.
> > 
> > Yury, Nathan,
> > Thanks for the patches and discussion.  Yes, I think a combo of:
> > 
> > 1. Nathan's lib/Makefile change plus
> > 2. Yury's removal of the current preprocessor guards in lib/test_bitmap.c
> > 
> > make most sense.
> 
> OK, then I'll send a v2 shortly. Nathan, don't you mind if I add your
> co-developed-by for this?

Sure, no worries!

Co-developed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
