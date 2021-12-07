Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41429CA
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 19:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26981C341C1;
	Tue,  7 Dec 2021 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638904905;
	bh=mvX5tAy6KlNae9Blwvk34y0UVLzYMaI0B0F0NLzdk8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0DT0/QiPQxcHA1bv9yiNe5LBdH7TkldApWAlb1BULLp7Q42yklKO0THv0aHdE0qI
	 OclAzPvVjg9qSTgdbIKkQ2QfPxB440qrzlYvfLajqdIH3hQQw3fp6e0aingjGGidwj
	 Lhvp6GrbmUxNLSPdoJngCscNS8oudVhv5HSBdXMHby8ECSVaUjgD8fSNSWtLhQTc0i
	 9uq71qyExIMqQc0SLw7S4sgl8P/j5AVS1GCL0BZgOkzPNQ6I+djNqw9d3g+d1/uAHO
	 K80VcbDcFG9jGOCVQBP1PufO82r0ks5F+WbRaRdELf2W0QOeT3/q4IWHCGa88m6Ocn
	 pUEIcI8ah9buA==
Date: Tue, 7 Dec 2021 12:21:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: phoebe.pf.w@gmail.com, Arnd Bergmann <arnd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev
Subject: Re: [PATCH] power: reset: ltc2952: fix float conversion error
Message-ID: <Ya+0RKps7oAvdWl8@archlinux-ax161>
References: <20211204220249.591482-1-arnd@kernel.org>
 <CAKwvOdnZSyfZaa1crQ15DGNNj8JBspnM0xxOF3D2mTt96Ftfgw@mail.gmail.com>
 <Ya+wlfX7ZPb95mZ4@archlinux-ax161>
 <CAKwvOdkxFrO0+WWqcQ9ZVHbT+TVpks1gE-SWG8yUF5U7E+HPHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkxFrO0+WWqcQ9ZVHbT+TVpks1gE-SWG8yUF5U7E+HPHw@mail.gmail.com>

On Tue, Dec 07, 2021 at 11:16:31AM -0800, Nick Desaulniers wrote:
> (Minus most folks, plus Phoebe)
> 
> On Tue, Dec 7, 2021 at 11:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, Dec 07, 2021 at 10:41:24AM -0800, Nick Desaulniers wrote:
> > > On Sat, Dec 4, 2021 at 2:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > clang-14 does not like the way this driver converts a 'long double'
> > > > to an integer when the target architecture disables floating point
> > > > support:
> > > >
> > > > drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux' does not support it
> > > >         data->wde_interval = 300L * 1E6L;
> > > >                                   ^
> > > >
> > > > Turn this into pure integer math and make it more readable at the
> > > > same time using the NSEC_PER_MSEC macro instead.
> > > >
> > > > Fixes: 6647156c00cc ("power: reset: add LTC2952 poweroff driver")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Thanks for the patch! The change in clang-14 (ToT) that triggered this
> > > has had another patch on top reverting these diagnostics.
> > > https://reviews.llvm.org/D114162
> >
> > I can still reproduce this failure on current ToT (33e3554ea33d) on
> > x86_64 allmodconfig; it seems like that patch only fixes it for 32-bit
> > x86.
> 
> As a heads up Phoebe, in case there's any interest in doing something
> similar to https://reviews.llvm.org/D114162 but for 64b.

Phoebe pointed out on our issue tracker that GCC will error when long
double is used with -mno-80837 as well:

https://github.com/ClangBuiltLinux/linux/issues/1497#issuecomment-983245202

It just appears that GCC is able to avoid these errors in the particular
cases that the kernel triggers in clang:

https://github.com/ClangBuiltLinux/linux/issues/1497#issuecomment-983739365

Cheers,
Nathan
