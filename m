Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608F3D79
	for <llvm@lists.linux.dev>; Tue, 28 Feb 2023 22:30:14 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pX8JQ-000338-00; Tue, 28 Feb 2023 23:19:08 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 44C1AC10C2; Tue, 28 Feb 2023 23:15:01 +0100 (CET)
Date: Tue, 28 Feb 2023 23:15:01 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, nathan@kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
Message-ID: <20230228221501.GA15457@alpha.franken.de>
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 28, 2023 at 07:34:59PM +0000, Jiaxun Yang wrote:
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
> 
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
> 
> Fix boot on boston board.
> 
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>  arch/mips/Kconfig           | 4 ++++
>  arch/mips/include/asm/asm.h | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
