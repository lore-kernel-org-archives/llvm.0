Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1210D2C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 02:43:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AA8C611AE;
	Wed,  6 Oct 2021 02:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633488195;
	bh=MQgdRVTnbMJVvWkGZSlQjMAdeQNOwFmejBVlgfTVeCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kTn8n8T6ka9CnRdawCfnAtucbwEIWcyo8eXPkLNPYOdIA1/qy9proCCwD7nAQD82Q
	 GNJTPIJxVJzVE0V7EkLCbKgAv5h+4MKrTyoVFcKUzU/Qi6/weqYZGOHIJQDoQ2x7OI
	 nnR70T9MkUQzwNcg/PomRMAmYzV9oa11zRa7PCsORBAGCwQF0FjAUrZgFRi4JKL3wh
	 nMsLQy7pNAbSIcw4xqAQQoRwDwZw2CvOsegkpYhUBwAoSwI2pTFj8LEsE3QX3XEqbq
	 vDXWncSp3MY/krOcUR/4D98KnyikeBQ7r0Bw83PP/TDBVw4gvk1Lh2PiYJt0V7Jz6I
	 lQA9RsGsMzAuA==
Date: Tue, 5 Oct 2021 19:43:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	kasan-dev <kasan-dev@googlegroups.com>,
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
Message-ID: <YV0NPnUbElw7cTRH@archlinux-ax161>
References: <20210922205525.570068-1-nathan@kernel.org>
 <CA+fCnZdfMYvQ1o8n41dDzgJUArsUyhnb9Y_azgCVuzj6_KBifA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+fCnZdfMYvQ1o8n41dDzgJUArsUyhnb9Y_azgCVuzj6_KBifA@mail.gmail.com>

On Sun, Oct 03, 2021 at 08:04:53PM +0200, Andrey Konovalov wrote:
> On Wed, Sep 22, 2021 at 10:55 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Currently, the asan-stack parameter is only passed along if
> > CFLAGS_KASAN_SHADOW is not empty, which requires KASAN_SHADOW_OFFSET to
> > be defined in Kconfig so that the value can be checked. In RISC-V's
> > case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means that
> > asan-stack does not get disabled with clang even when CONFIG_KASAN_STACK
> > is disabled, resulting in large stack warnings with allmodconfig:
> >
> > drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c:117:12:
> > error: stack frame size (14400) exceeds limit (2048) in function
> > 'lb035q02_connect' [-Werror,-Wframe-larger-than]
> > static int lb035q02_connect(struct omap_dss_device *dssdev)
> >            ^
> > 1 error generated.
> >
> > Ensure that the value of CONFIG_KASAN_STACK is always passed along to
> > the compiler so that these warnings do not happen when
> > CONFIG_KASAN_STACK is disabled.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1453
> > References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  scripts/Makefile.kasan | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> > index 801c415bac59..b9e94c5e7097 100644
> > --- a/scripts/Makefile.kasan
> > +++ b/scripts/Makefile.kasan
> > @@ -33,10 +33,11 @@ else
> >         CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
> >          $(call cc-param,asan-globals=1) \
> >          $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
> > -        $(call cc-param,asan-stack=$(stack_enable)) \
> >          $(call cc-param,asan-instrument-allocas=1)
> >  endif
> 
> This part of code always looked weird to me.
> 
> Shouldn't we be able to pull all these options out of the else section?
> 
> Then, the code structure would make sense: first, try applying
> KASAN_SHADOW_OFFSET; if failed, use CFLAGS_KASAN_MINIMAL; and then try
> applying all these options one by one.

Prior to commit 1a69e7ce8391 ("kasan/Makefile: support LLVM style asan
parameters"), all the flags were run under one cc-option, meaning that
if $(KASAN_SHADOW_OFFSET) was not set, the whole call would fail.
However, after that commit, it is possible to do this but I was not sure
if that was intentional so I went for the minimal fix.

Cheers,
Nathan
