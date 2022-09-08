Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE1C7C
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 12:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A976C433D6;
	Thu,  8 Sep 2022 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662639743;
	bh=c865XJLe4Z2ZkQVpfIUa6NvVVbhj/DHk8R5Iswb7/6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/B3/7aQ1H23MpMbYOEAHsluM/ebsaOP4LrfJ7XKXwjf1NzoAKOPAndPh/In2tlkt
	 ebeFZS7zjnMeFSz/5+4qcQhXuGe4zRMUpVS73l+JkhyphP/ep0SoFwhiyhXhAJ9gOx
	 W7RVone1Ma83uzslTrBWwAXX9IKRDFOtJvwGPVj4jEebb02TTUZShuPIXDn8Vouka9
	 a4vLscqy9qtW1Xw6GnXMNCai8U7QAv1FVnGw2Z8JgxgmXfjjZ0yEv9KkvfOE8RTRDA
	 axW/PvmWAHYAOdJOOcd9IqT5h+lCaV2DPl7ptgyVHsElEUhXCsd2l1yXf0z14TfJ/p
	 VO5vmUyqDJVEg==
Date: Thu, 8 Sep 2022 13:22:16 +0100
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] MIPS: BCM47XX: Cast memcmp() of function to (void *)
Message-ID: <YxneeP/9zOHNnt1E@work>
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

Don't we have the same problem at line 162?

(next-20220908)arch/mips/bcm47xx/prom.c:
161         for (extmem = 128 << 20; extmem < 512 << 20; extmem <<= 1) {
162                 if (!memcmp(prom_init, (void *)(off + extmem), 16))
163                         break;
164         }

--
Gustavo

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
> 
