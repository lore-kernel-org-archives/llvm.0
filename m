Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506B03C2F
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 08:48:44 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1ppPy5-0003nT-00; Thu, 20 Apr 2023 10:48:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D2308C0119; Thu, 20 Apr 2023 10:06:21 +0200 (CEST)
Date: Thu, 20 Apr 2023 10:06:21 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
Message-ID: <20230420080621.GA6908@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
 <B02E6819-A25F-4588-8CDA-D7C5A2E5B0B6@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B02E6819-A25F-4588-8CDA-D7C5A2E5B0B6@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 20, 2023 at 12:36:41AM +0100, Jiaxun Yang wrote:
> >>> Wikipedia [1] should fit the purpose.
> >>> 
> >>> [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
> >> 
> >> Mostly! Though I was not able to verify:
> >> - p5600
> > 
> > mips32r5
> 
> On wikipedia’s “Imagination Technologies” section.
> 
> > 
> >> - r5500
> > 
> > mips4
> > 
> >> - rm5200
> > 
> > mips4
> 
> I think those are all R5000 derivatives?

yes, which makes them mips4. Vr5500 is special as it supports out-of-order
execution.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
