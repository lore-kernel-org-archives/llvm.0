Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DD33D5
	for <llvm@lists.linux.dev>; Fri, 27 Jan 2023 17:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA0CC433D2;
	Fri, 27 Jan 2023 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674842026;
	bh=I5D+KnN4ZzayWQDixcs85vgccbaebhLgzxg/xX7mDhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1gm+/d2B67hghTWu39vvjRGgcL5E/1TlJZDOe8AxBka1qpTmMHwH8zfB2FBH4pVg
	 wH62uu0uChqpijInPuLoH3HSOuyX1SWOQ+wtEw5MhWri9ndTxOaVxxjUxRZsDt5jwb
	 Hp5OF4x+PaFu5JCOay6TYuIkIK0YqDZ9QhtA/qAMrfzneIlKhcfS3ue/S0QAD2j4PZ
	 UaabDaShEHknc8kRztNNHUW2g25/4d+89KC+7YG408vwJCri7P+WqO3SMJvCFIAvGI
	 f575JJba+Exh9+tvTDZ9sHKP/bdf86AymCo4/FHWodboTeVFGxVkHnXoX9ty7cQKk7
	 xtXfSI1oigr5A==
Date: Fri, 27 Jan 2023 10:53:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: jack@suse.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] udf: remove reporting loc in debug output
Message-ID: <Y9QPqPeNCqhO2xev@dev-arch.thelio-3990X>
References: <20230127162906.872395-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127162906.872395-1-trix@redhat.com>

On Fri, Jan 27, 2023 at 08:29:06AM -0800, Tom Rix wrote:
> clang build fails with
> fs/udf/partition.c:86:28: error: variable 'loc' is uninitialized when used here [-Werror,-Wuninitialized]
>                           sb, block, partition, loc, index);
>                                                 ^~~
> 
> loc is now only know when bh is valid.  So remove reporting loc in debug output.
> 
> Fixes: 4215db46d538 ("udf: Use udf_bread() in udf_get_pblock_virt15()")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  fs/udf/partition.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/udf/partition.c b/fs/udf/partition.c
> index 92765d2f6958..5bcfe78d5cab 100644
> --- a/fs/udf/partition.c
> +++ b/fs/udf/partition.c
> @@ -82,8 +82,8 @@ uint32_t udf_get_pblock_virt15(struct super_block *sb, uint32_t block,
>  
>  	bh = udf_bread(sbi->s_vat_inode, newblock, 0, &err);
>  	if (!bh) {
> -		udf_debug("get_pblock(UDF_VIRTUAL_MAP:%p,%u,%u) VAT: %u[%u]\n",
> -			  sb, block, partition, loc, index);
> +		udf_debug("get_pblock(UDF_VIRTUAL_MAP:%p,%u,%u)\n",
> +			  sb, block, partition);
>  		return 0xFFFFFFFF;
>  	}
>  
> -- 
> 2.26.3
> 
