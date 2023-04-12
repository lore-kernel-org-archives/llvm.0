Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03898566C
	for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 13:33:41 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pmabN-0000FF-03; Wed, 12 Apr 2023 15:33:33 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CC1A6C2458; Wed, 12 Apr 2023 15:31:58 +0200 (CEST)
Date: Wed, 12 Apr 2023 15:31:58 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH 7/8] MIPS: octeon_switch: Remove duplicated labels
Message-ID: <20230412133158.GD11717@alpha.franken.de>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-8-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409104309.13887-8-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Apr 09, 2023 at 11:43:08AM +0100, Jiaxun Yang wrote:
> EXPORT macro already have labels defined by itself.
> Remove duplicated labels outside to silent assembler warnings.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/kernel/octeon_switch.S | 6 ------
>  1 file changed, 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
