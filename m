Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CF2C80
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 16:55:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DB9D6101D;
	Thu, 14 Oct 2021 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634230522;
	bh=SK9fa8kBvKfk0pw+RnBE/3/wOfdzkDkUl60TS++n7Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URMDQCzgsfwoK5y/yNeoJ9JNO/8oJ2NMHAFhAdOy1sGEmtF9XAAISro92Op+4CLCV
	 yz8pYDFNRFzXaJjjZZNkQmS6xjCt/ghBTpBe7izXZK2HZZK1u2FLlZOLXSvNd4nD06
	 5CanmAIdF34pzRmAIif5Q64GJtcQ5TngqgFvJeW3E9bfmHJTfsyZGGGL7cjuetxvNQ
	 DjWaqDEAhLYF/YM9Is2bNH9fPhtpTop86L1W5TtLmWjFVRN3MvUgUa0tbyI4Tl/rs+
	 ROpY6NxCNDMdit7BPa0iEvomWIMDs3JszoYmWYSAtxoUAU4nwX7pJmq+LQ7+RU+IFc
	 BqEp9rvWIEb2A==
Date: Thu, 14 Oct 2021 09:55:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: elver@google.com, akpm@linux-foundation.org, ryabinin.a.a@gmail.com,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-mm@kvack.org
Subject: Re: [PATCH] kasan: Always respect CONFIG_KASAN_STACK
Message-ID: <YWhg8/UzjJsB51Gd@archlinux-ax161>
References: <YUyWYpDl2Dmegz0a@archlinux-ax161>
 <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-b5f8a6a0-c3e8-4d25-9daa-346fdc8a2e5e@palmerdabbelt-glaptop>

On Fri, Oct 08, 2021 at 11:46:55AM -0700, Palmer Dabbelt wrote:
> On Thu, 23 Sep 2021 07:59:46 PDT (-0700), nathan@kernel.org wrote:
> > On Thu, Sep 23, 2021 at 12:07:17PM +0200, Marco Elver wrote:
> > > On Wed, 22 Sept 2021 at 22:55, Nathan Chancellor <nathan@kernel.org> wrote:
> > > > Currently, the asan-stack parameter is only passed along if
> > > > CFLAGS_KASAN_SHADOW is not empty, which requires KASAN_SHADOW_OFFSET to
> > > > be defined in Kconfig so that the value can be checked. In RISC-V's
> > > > case, KASAN_SHADOW_OFFSET is not defined in Kconfig, which means that
> > > > asan-stack does not get disabled with clang even when CONFIG_KASAN_STACK
> > > > is disabled, resulting in large stack warnings with allmodconfig:
> > > >
> > > > drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c:117:12:
> > > > error: stack frame size (14400) exceeds limit (2048) in function
> > > > 'lb035q02_connect' [-Werror,-Wframe-larger-than]
> > > > static int lb035q02_connect(struct omap_dss_device *dssdev)
> > > >            ^
> > > > 1 error generated.
> > > >
> > > > Ensure that the value of CONFIG_KASAN_STACK is always passed along to
> > > > the compiler so that these warnings do not happen when
> > > > CONFIG_KASAN_STACK is disabled.
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1453
> > > > References: 6baec880d7a5 ("kasan: turn off asan-stack for clang-8 and earlier")
> > > > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > > 
> > > Reviewed-by: Marco Elver <elver@google.com>
> > 
> > Thanks!
> > 
> > > [ Which tree are you planning to take it through? ]
> > 
> > Gah, I was intending for it to go through -mm, then I cc'd neither
> > Andrew nor linux-mm... :/ Andrew, do you want me to resend or can you
> > grab it from LKML?
> 
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> (assuming you still want it through somewhere else)

Thanks, it is now in mainline as commit 19532869feb9 ("kasan: always
respect CONFIG_KASAN_STACK").

> > > Note, arch/riscv/include/asm/kasan.h mentions KASAN_SHADOW_OFFSET in
> > > comment (copied from arm64). Did RISC-V just forget to copy over the
> > > Kconfig option?
> > 
> > I do see it defined in that file as well but you are right that they did
> > not copy the Kconfig logic, even though it was present in the tree when
> > RISC-V KASAN was implemented. Perhaps they should so that they get
> > access to the other flags in the "else" branch?
> 
> Ya, looks like we just screwed this up.  I'm seeing some warnings like
> 
>    cc1: warning: ‘-fsanitize=kernel-address’ with stack protection is not supported without ‘-fasan-shadow-offset=’ for this target

Hmmm, I thought I did a GCC build with this change but I must not have
:/ 

> which is how I ended up here, I'm assuming that's what you're talking about
> here?  LMK if you were planning on sending along a fix or if you want me to
> go figure it out.

I took a look at moving the logic into Kconfig like arm64 before sending
this change and I did not really understand it well enough to do so. I
think it would be best if you were able to do that so that nothing gets
messed up.

Cheers,
Nathan
