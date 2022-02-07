Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D86729CA
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 17:40:34 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1nH7yl-0006Gx-01; Mon, 07 Feb 2022 18:39:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 66847C2116; Mon,  7 Feb 2022 18:35:50 +0100 (CET)
Date: Mon, 7 Feb 2022 18:35:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] MIPS: Loongson64: Clean up use of cc-ifversion
Message-ID: <20220207173550.GB16822@alpha.franken.de>
References: <20220125221925.3547683-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125221925.3547683-1-nathan@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 25, 2022 at 03:19:24PM -0700, Nathan Chancellor wrote:
> This Makefile checks that GCC is 4.9 or newer, which is redundant after
> commit 76ae847497bc ("Documentation: raise minimum supported version of
> GCC to 5.1"), so cc-option can be removed.
> 
> Clang does not support -march=loongson3a so it needs to continue to use
> -march=mips64r2, which no longer needs cc-option because all supported
> clang versions recognize this flag.
> 
> -march=loonson3a can be used unconditionally with GCC because the
> minimum supported GCC version has been bumped past 4.9.0, which won't
> have the bug mentioned in the comment. The _MIPS_ISA macro redefinition
> can be removed at the same time for the same reason.
> 
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> v1 -> v2: https://lore.kernel.org/r/20220120214001.1879469-1-nathan@kernel.org/
> 
> * Eliminate ld-option call (Jiaxun).
> * Eliminate _MIPS_ISA macro redefinitions (Nick).
> 
>  arch/mips/loongson64/Platform | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
