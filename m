Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773C63201
	for <llvm@lists.linux.dev>; Wed,  1 Feb 2023 23:14:39 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso4635787pju.0
        for <llvm@lists.linux.dev>; Wed, 01 Feb 2023 15:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFIM4C5atXHVLvz2rYvQqRO5oe5CXRLVhG4Y2WIPWCM=;
        b=RjcmLjC6j4HJmsqqUj3IYFr3gTER/0CfLHzkonLsmQK4mha5W73Ww6XyvbdwrddbB4
         0LM+zzapKvXidMwOGQyON8IYej0+/VwtcDf1t2JgjGiyrVSBVxTyHZF0iWI0K9Sd8XY7
         JAT9cTSw2zkl/kjrEs5X3pi0sdx9UrfBP656Ari83qUMZb1TQZHK/UNAZ3a11exUpl4T
         deGYYilJ87FlhKHPRYqE8d30GWNP0Z4oX7jh82JnA0Q39No64VrL8LKIbgkJrVDWayFV
         Jo9jg3Gc7SjEzV29RJ56Sqewrz4R9JEFrPdpgDNKihDEsNYtyvojBg8tPHH686h8a5yp
         sIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFIM4C5atXHVLvz2rYvQqRO5oe5CXRLVhG4Y2WIPWCM=;
        b=hfPvbl+6cJ5wTuwpHOeofoTpBU20wVcTFwDjzI9vdzyG1fzgOAZoXOIR4toG5/Zsui
         tZjnco4FwpgaYMHQlHwAuJ7Koi7x1H5ZH1U459TqGEk1I2LZX6P/r6C2r0NDyO0PIOMT
         OQeRU2TUlqo4sibv/xLhQWzaZUU93+9YfP6gtHj0W/3y9lv0ezi0aUoVl7ZCGnpE+9u+
         glEeY3NdEjYUgk/TF8lNcanFGq1tKPwihYPwhClHs+ExBCTUKvDSq6sukCLEqF7y5Wd7
         iFsJcM7u2CdYYchheRR4mA5Waqj53SDCbxTHlWQW3Ki3DUXIH4BBFLI7mUTSViIiRQXQ
         c27w==
X-Gm-Message-State: AO0yUKVDpKgAtxW/kFLmmonzywK0k6mcIW5lq8wCnZODcCBD9X7VRWbu
	Imq23Vgm5WqZrKcBCJFdPulVQQ==
X-Google-Smtp-Source: AK7set8zbrNyAs2bnFB+ImWFnRtySQ0uM3iN4+USnPB9165NQN26ofVDH8bHcqrwTbOU4R3vjWaFUQ==
X-Received: by 2002:a05:6a21:6d95:b0:bc:8c5e:ed0d with SMTP id wl21-20020a056a216d9500b000bc8c5eed0dmr5900717pzb.40.1675293278613;
        Wed, 01 Feb 2023 15:14:38 -0800 (PST)
Received: from google.com ([2620:15c:2d1:203:341e:6979:102e:c9d9])
        by smtp.gmail.com with ESMTPSA id o16-20020a656150000000b004db367c10b0sm11066399pgv.46.2023.02.01.15.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:14:38 -0800 (PST)
Date: Wed, 1 Feb 2023 15:14:33 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Tom Rix <trix@redhat.com>
Cc: jack@suse.com, nathan@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] udf: remove reporting loc in debug output
Message-ID: <Y9ryWROdCrKYWBzY@google.com>
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

typo: s/know/known/

> 
> Fixes: 4215db46d538 ("udf: Use udf_bread() in udf_get_pblock_virt15()")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks Tom, kernelci has also been reporting this.
https://lore.kernel.org/linux-next/?q=error%3A+variable+%27loc%27+is+uninitialized+when+used+here

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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
> 
