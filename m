Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C229168
	for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 16:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371A3C36AE9;
	Fri, 31 Dec 2021 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640969664;
	bh=rvg6wZRVQUU4lpCX5Q8pmgTeUuHLBdlRzgcEDddaL60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIopv7WjtNwg2I+/VhiCEmWKJA3Tp1CfYoB9KDs2x8I6fLKM/8volT7GuscQVzWs0
	 4W609XGbmX/wgGnDbQaEZi78ZWSGGAKnaapOTTOW3B22ltwqmUndOzNxtVXNQaKX8q
	 gq3S3GleuaHGqpUVSk8u1fvG9CXNaeb4Piqe7S3oMtRFCrmKSjgdXzLt2NsMG8CrUr
	 BanPbFsEiEi7ytq9i7+dL0cU0jv+EME5GaLSECaJm9JmFPfUdmEYyr1CeREoPZkk9B
	 9Pmxe0u9r58Cuv2Chi9G4xslNjW+6xAQ14SNUxoCRVzrO4B0kDE2ISiNRE8JDLSI0P
	 cab1GSHv+NJ3g==
Date: Fri, 31 Dec 2021 09:54:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: cgel.zte@gmail.com
Cc: ndesaulniers@google.com, keescook@chromium.org, wang.yong12@zte.com.cn,
	xu.xin16@zte.com.cn, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH linux-next] tools: compiler-gcc.h::Keep compatible with
 non-clang compilers.
Message-ID: <Yc81vBwPo/aHMfXB@archlinux-ax161>
References: <20211231100833.590691-1-xu.xin16@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211231100833.590691-1-xu.xin16@zte.com.cn>

On Fri, Dec 31, 2021 at 10:08:33AM +0000, cgel.zte@gmail.com wrote:
> From: xu xin <xu.xin16@zte.com.cn>
> 
> When HOSTC = gcc (GCC) 4.8.5, there is an error occurring as follows:
> error: Undefined __has_attribute.
> 
> This problem is introduced by commit d0ee23f9d78be ("tools:
> compiler-gcc.h: Guard error attribute use with __has_attribute").

Yes, sorry for breaking this. It has been discussed here with some ideas
for a resolution but I never got any feedback so I never carried it
through, thank you for picking it up.

https://lore.kernel.org/r/c1b1a299-c60d-28a4-07ab-1ecd211d6da9@i-love.sakura.ne.jp/

This patch should probably be sent straight to Linus next time it is
sent, as he directly applied both my commit and the one that it was
fixing. Nick and I do not pick up patches currently although Kees might
be willing to take this one.

> To solve it, this patch is given to keep the comatibility.

                                               ^ compatibility

Might be worth adding "with older GCC versions" at the end of that
sentence.

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Co-developed-by: wangyong <wang.yong12@zte.com.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
> ---
>  tools/include/linux/compiler-gcc.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/include/linux/compiler-gcc.h b/tools/include/linux/compiler-gcc.h
> index 8816f06fc6c7..7da593d3cb91 100644
> --- a/tools/include/linux/compiler-gcc.h
> +++ b/tools/include/linux/compiler-gcc.h
> @@ -16,6 +16,11 @@
>  # define __fallthrough __attribute__ ((fallthrough))
>  #endif
>  
> +
> +#ifndef __has_attribute
> +# define __has_attribute(x) 0  /* Compatibility with non-clang compilers. */

This comment is not really accurate; it implies that clang is the only
one that defines __has_attribute() but GCC 5.x or newer supports
__has_attribute().  A more accurate comment might be:

/* Compatibility with GCC < 5.x */

> +#endif
> +
>  #if __has_attribute(__error__)
>  # define __compiletime_error(message) __attribute__((error(message)))
>  #endif
> -- 
> 2.25.1
> 
