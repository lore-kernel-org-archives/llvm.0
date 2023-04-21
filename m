Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7527E28E2
	for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 10:48:57 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1ppoJw-0006No-00; Fri, 21 Apr 2023 12:48:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C7410C0129; Fri, 21 Apr 2023 12:48:32 +0200 (CEST)
Date: Fri, 21 Apr 2023 12:48:32 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH 5/8] MIPS: mipsregs: Parse fp and sp register by name in
 parse_r
Message-ID: <20230421104832.GA9238@alpha.franken.de>
References: <20230409104309.13887-1-jiaxun.yang@flygoat.com>
 <20230409104309.13887-6-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409104309.13887-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Apr 09, 2023 at 11:43:06AM +0100, Jiaxun Yang wrote:
> parse_r helper is used to parse register number from oprand,
> it only handles oprand which use number to refer register before.
> 
> However compiler may use $gp and $sp to reference register 29 and
> 30. Handle this situation by adding relevant match name.

are you sure the compiler is doing that ? Which compiler is this ?
To me this feels more like missing #defines from asm/regdef.h for
some inline assembly stuff...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
