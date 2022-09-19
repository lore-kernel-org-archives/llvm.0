Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECC07C
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 15:44:30 +0000 (UTC)
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1oaI6u-0005ft-05; Mon, 19 Sep 2022 16:51:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BAE67C12F2; Mon, 19 Sep 2022 16:49:36 +0200 (CEST)
Date: Mon, 19 Sep 2022 16:49:36 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Kees Cook <keescook@chromium.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM47XX: Cast memcmp() of function to (void *)
Message-ID: <20220919144936.GE7674@alpha.franken.de>
References: <20220907230556.73536-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907230556.73536-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Sep 07, 2022 at 04:05:56PM -0700, Kees Cook wrote:
> Clang is especially sensitive about argument type matching when using
> __overloaded functions (like memcmp(), etc). Help it see that function
> pointers are just "void *". Avoids this error:
> 
> arch/mips/bcm47xx/prom.c:89:8: error: no matching function for call to 'memcmp'
>                    if (!memcmp(prom_init, prom_init + mem, 32))
>                         ^~~~~~
> include/linux/string.h:156:12: note: candidate function not viable: no known conversion from 'void (void)' to 'const void *' for 1st argument extern int memcmp(const void *,const void *,__kernel_size_t);
> 
> Cc: Hauke Mehrtens <hauke@hauke-m.de>
> Cc: "Rafał Miłecki" <zajec5@gmail.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: llvm@lists.linux.dev
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/lkml/202209080652.sz2d68e5-lkp@intel.com
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  arch/mips/bcm47xx/prom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/bcm47xx/prom.c b/arch/mips/bcm47xx/prom.c
> index ab203e66ba0d..eb5c04a24531 100644
> --- a/arch/mips/bcm47xx/prom.c
> +++ b/arch/mips/bcm47xx/prom.c
> @@ -86,7 +86,7 @@ static __init void prom_init_mem(void)
>  			pr_debug("Assume 128MB RAM\n");
>  			break;
>  		}
> -		if (!memcmp(prom_init, prom_init + mem, 32))
> +		if (!memcmp((void *)prom_init, (void *)prom_init + mem, 32))
>  			break;
>  	}
>  	lowmem = mem;
> -- 
> 2.34.1

applied to mips-next with the second memcmp(prom_init changed as well.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
