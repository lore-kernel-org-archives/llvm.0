Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45CD2594
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 13:13:49 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pol9R-0000YG-00; Tue, 18 Apr 2023 15:13:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B9773C0115; Tue, 18 Apr 2023 15:08:23 +0200 (CEST)
Date: Tue, 18 Apr 2023 15:08:23 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	ndesaulniers@google.com, nathan@kernel.org
Subject: Re: [PATCH v2 2/7] MIPS: Add toolchain feature dependency for
 microMIPS smartMIPS
Message-ID: <20230418130823.GA12456@alpha.franken.de>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-3-jiaxun.yang@flygoat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414080701.15503-3-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 14, 2023 at 09:06:56AM +0100, Jiaxun Yang wrote:
> microMIPS smartMIPS kernel can only be compiled if they are supported
> by toolchain.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/mips/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 41ac4dc5aae4..0b270562c3eb 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2360,7 +2360,7 @@ config CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS
>  	  Select this if you want neither microMIPS nor SmartMIPS support
>  
>  config CPU_HAS_SMARTMIPS
> -	depends on SYS_SUPPORTS_SMARTMIPS
> +	depends on SYS_SUPPORTS_SMARTMIPS && CC_HAS_SMARTMIPS
>  	bool "SmartMIPS"
>  	help
>  	  SmartMIPS is a extension of the MIPS32 architecture aimed at
> @@ -2373,6 +2373,7 @@ config CPU_HAS_SMARTMIPS
>  
>  config CPU_MICROMIPS
>  	depends on 32BIT && SYS_SUPPORTS_MICROMIPS && !CPU_MIPSR6
> +	depends on CC_HAS_MICROMIPS
>  	bool "microMIPS"
>  	help
>  	  When this option is enabled the kernel will be built using the

hmm, with this change the options will silently be dropped. I prefer
the error message, that the compiler doesn't support what is configured.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
