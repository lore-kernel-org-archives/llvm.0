Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B8522F11
	for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 21:46:30 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7926de0478eso37584039f.0
        for <llvm@lists.linux.dev>; Wed, 13 Sep 2023 14:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694641590; x=1695246390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QowXTRSSOC8IB4ueS9Xc0NCSyyqp5xMMkI7wePQSkak=;
        b=bzTovrwMEabQwphQwO/fLdVZUdU/Jh2FvmJddOuct+kI8ER0fz13M8AO5f5TGzpeji
         ePcvA/+yAjX9SW5r7G1pr8H0SddNJusMwEAgvLhJIiMIC39KSQW7G/PvTEkBjrSrikXa
         j+HKmrsMa8+M/zNEzWjAvCUfNuxqVFa1FGldG8qaHibrt0FbMk3+hWQ9MORfdBc0myzx
         VUoa7eRlItyyCWNNtehWMWq2h3opl7GHoB4gPUY91AbFWWG9HdMosFQAgabZJGhGyyAG
         7nKvdfLqkMYN44F2JSVqyRogabj2HAKzK4SlYEGoZ8FIxidOlKMpZcYbWGZX+cW8JVcn
         Vl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694641590; x=1695246390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QowXTRSSOC8IB4ueS9Xc0NCSyyqp5xMMkI7wePQSkak=;
        b=uNaG5wWXMgUCCVTmUV8z29+80CISnBhYRrZIlpkc2sAOVf4XU/sP+e5cCjdV2g8OpA
         uQkXwRvJ1KXmrt5VjgQC0s3hkUFVPg9wF1VBOP2nhfkABJLnRBGLICGtMcdHNFTyTDx3
         RNAAKTBDbLhx4w3bzZk0qsGLH1rA7wAxcUebdeHZ3Rt7lhJWufkI3Btzj8qk11Wsttot
         6omI0iCXc8Tf9elwk1PTLLebU30oC/Zgpwh6YxR3+YgFAL5yuusgYw/BWZlOXZbbxLHw
         mtGAFgGp6FcjnSA2tKjEVZku1/8nxiWOEZWHGv2Fz5NSaILRtCkU0IQ1O1pgiYHvwPsG
         FQ5w==
X-Gm-Message-State: AOJu0YxgH1cbtQLLTLTHlPEJJwFmVelUujyRXSJlo3NgELQl6RSyLs+N
	EjxGNxZYXj/xM2Lxk7nQediiOg==
X-Google-Smtp-Source: AGHT+IHU/gkz+MAiiC6NWDNP87Txd53/KstTmyp3J9ijsGKI32VL8YatV9xSuNpaaWqc2Xy5X4aa3w==
X-Received: by 2002:a05:6e02:1bee:b0:34f:1e9c:45d9 with SMTP id y14-20020a056e021bee00b0034f1e9c45d9mr4553258ilv.12.1694641590231;
        Wed, 13 Sep 2023 14:46:30 -0700 (PDT)
Received: from google.com (26.103.132.34.bc.googleusercontent.com. [34.132.103.26])
        by smtp.gmail.com with ESMTPSA id r5-20020a92c505000000b0034f37a27bb4sm44105ilg.72.2023.09.13.14.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:46:29 -0700 (PDT)
Date: Wed, 13 Sep 2023 21:46:27 +0000
From: Justin Stitt <justinstitt@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kent.overstreet@linux.dev, bfoster@redhat.com,
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH 4/7] bcachefs: Fix -Wformat in bch2_bucket_gens_invalid()
Message-ID: <20230913214627.ankymdgklzwob4ij@google.com>
References: <20230912-bcachefs-warning-fixes-v1-0-a1cc83a38836@kernel.org>
 <20230912-bcachefs-warning-fixes-v1-4-a1cc83a38836@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912-bcachefs-warning-fixes-v1-4-a1cc83a38836@kernel.org>

On Tue, Sep 12, 2023 at 12:15:41PM -0700, Nathan Chancellor wrote:
> When building bcachefs for 32-bit ARM, there is a compiler warning in
> bch2_bucket_gens_invalid() due to use of an incorrect format specifier:
>
>   fs/bcachefs/alloc_background.c:530:10: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>     529 |                 prt_printf(err, "bad val size (%lu != %zu)",
>         |                                                ~~~
>         |                                                %zu
>     530 |                        bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
>         |                        ^~~~~~~~~~~~~~~~~~~
>   fs/bcachefs/util.h:223:54: note: expanded from macro 'prt_printf'
>     223 | #define prt_printf(_out, ...)           bch2_prt_printf(_out, __VA_ARGS__)
>         |                                                               ^~~~~~~~~~~
>
> On 64-bit architectures, size_t is 'unsigned long', so there is no
> warning when using %lu but on 32-bit architectures, size_t is 'unsigned
> int'. Use '%zu', the format specifier for 'size_t', to eliminate the
> warning.
>
> Fixes: 4be0d766a7e9 ("bcachefs: bucket_gens btree")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  fs/bcachefs/alloc_background.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/bcachefs/alloc_background.c b/fs/bcachefs/alloc_background.c
> index 67e73864823c..2b0d155d1ed5 100644
> --- a/fs/bcachefs/alloc_background.c
> +++ b/fs/bcachefs/alloc_background.c
> @@ -526,7 +526,7 @@ int bch2_bucket_gens_invalid(const struct bch_fs *c, struct bkey_s_c k,
>  			     struct printbuf *err)
>  {
>  	if (bkey_val_bytes(k.k) != sizeof(struct bch_bucket_gens)) {
> -		prt_printf(err, "bad val size (%lu != %zu)",
> +		prt_printf(err, "bad val size (%zu != %zu)",
>  		       bkey_val_bytes(k.k), sizeof(struct bch_bucket_gens));
>  		return -BCH_ERR_invalid_bkey;
>  	}
>
> --
> 2.42.0
>
