Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40210E0
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 15:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A1BC34113;
	Mon, 16 May 2022 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652716581;
	bh=pwSfhH/HA5ZWdWjfwL705LozCp1iZETX4zwonXvMW/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7CtKaEyAB8ODvl7ny9zrvtVhJK+Pl5lMh0P1rsukAk5RWs1K6KfkNv/vH2Awf7OF
	 EA0Hc8HpnO7w7xSsl4RlQxpU4MApGVJeYisEZzXd8bN9buQ+U4ha0G0KZ45ygIePC3
	 gQycdxuqZHpP5w6pXQ3sjeWRVGnJXdbva7+JhV0kOBM7uK+Cej6RVnEQyLUrycg1+e
	 CQKPfvOW2I5DKIs6nhLbTbmL+3aX1BFPGQHu0FzVzT2jS2m5QsYDEZK5pkRH2JpjVP
	 recO/Al2ZQ27MmwGbXbW3B/ZYC7Z0uxo+kdQxCoW134be3ANFq78C1gQpby+TqBC2n
	 bWXSrDiBEuEUA==
Date: Mon, 16 May 2022 08:56:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, ndesaulniers@google.com,
	ricky_wu@realtek.com, kai.heng.feng@canonical.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] misc: rtsx: Set setting_reg2 before use.
Message-ID: <YoJ0I/XPoj1B/+mm@dev-arch.thelio-3990X>
References: <20220516130047.3887590-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516130047.3887590-1-trix@redhat.com>

On Mon, May 16, 2022 at 09:00:47AM -0400, Tom Rix wrote:
> The clang build fails with
> rts5261.c:406:13: error: variable 'setting_reg2' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         } else if (efuse_valid == 0) {
>                    ^~~~~~~~~~~~~~~~
> 
> setting_reg2 is set in this block
>   if (efuse_valid == 2 || efuse_valid == 3) {
> ..
>   } else if (efuse_valid == 0) {
>     // default
> ..
>   }
> But efuse_valid can also have a value of 1.
> Change the 'else if' to 'else' to make the second block the default.
> 
> Fixes: b1c5f3085149 ("misc: rtsx: add rts5261 efuse function")
> Signed-off-by: Tom Rix <trix@redhat.com>

I am not sure if this fix is correct from a functional standpoint (i.e.
is treating efuse_valid == 1 the same as efuse_valid == 0 correct?) but
it is better than not handling this value altogether. For what it's
worth:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

As a side note, it is unfortunate that this change made it into -next
when there was an outstanding report about this warning:

https://lore.kernel.org/202205100220.WyAyhKap-lkp@intel.com/

> ---
>  drivers/misc/cardreader/rts5261.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
> index 749cc5a46d13..f22634b14dc8 100644
> --- a/drivers/misc/cardreader/rts5261.c
> +++ b/drivers/misc/cardreader/rts5261.c
> @@ -403,7 +403,7 @@ static void rts5261_init_from_hw(struct rtsx_pcr *pcr)
>  			setting_reg1 = PCR_SETTING_REG4;
>  			setting_reg2 = PCR_SETTING_REG5;
>  		}
> -	} else if (efuse_valid == 0) {
> +	} else {
>  		// default
>  		setting_reg1 = PCR_SETTING_REG1;
>  		setting_reg2 = PCR_SETTING_REG2;
> -- 
> 2.27.0
> 

Cheers,
Nathan
