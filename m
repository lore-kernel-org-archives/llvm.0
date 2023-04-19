Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B2FD300
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 22:15:20 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1ppG52-0007kL-00; Thu, 20 Apr 2023 00:15:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D827AC0117; Thu, 20 Apr 2023 00:15:00 +0200 (CEST)
Date: Thu, 20 Apr 2023 00:15:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
Message-ID: <20230419221500.GA17797@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
> On Wed, Apr 19, 2023 at 9:50 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> >
> >
> > > 2023年4月18日 21:07，Nick Desaulniers <ndesaulniers@google.com> 写道：
> > >
> > > On Fri, Apr 14, 2023 at 1:07 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> > >>
> > >> LLVM does not implement some of -march options. However those options
> > >> are not mandatory for kernel to build for those CPUs.
> > >>
> > >> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> > >> we can get those kernel to build with LLVM.
> > >>
> > >> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> > >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > >
> > > Thanks for the patch! Maybe it's more obvious to folks who work on
> > > mips, but how did you determine that say `p5600` is `mips32r5` or
> > > `r10000` is `mips4`?
> >
> > Wikipedia [1] should fit the purpose.
> >
> > [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
> 
> Mostly! Though I was not able to verify:
> - p5600

mips32r5

> - r5500

mips4

> - rm5200

mips4

> - sb1

mips64r1

all information taken from datasheets.

> - loongson*

probably depends on the exact type, but as I don't have datasheets
I can't say what it is exactly, probaly mips32r2/mips64r2.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
