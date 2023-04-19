Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB103D2FD
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:53:58 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-52091c58109so230519a12.2
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681941238; x=1684533238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8iHanY7fwyxMAC+40k2hC5PB13EWng94w0vOBJ90SQ=;
        b=qHXH/QEPdhfNUubovbW2N/tO1b/Cf9V9pOr4tjVtzyoUiD2aJpz58/QOC6orq7L4RS
         KwtQmYBSyAEUEYT/K+noG9KXEodKAYZColxmjFNmASfWWPvr0wwQypJzfTPHlavOuXrR
         e7W20zZl7AZSzBcHLMhaHJcpeEXBVJy/1G4aUlcRkCp9Am0NWRWTpritQjIQeYbsFIdo
         /Y4XLIOIjK0OvPn152AwXWNd7b8doRZWKLgNIcp8ysckM6ry6QdkklWHv7w17qtVwFcG
         GHzJPYuxFai5e6xvaVXT5fO1SMlFJL+a0hQbT64r8ei3PKsZqWpSX3qKaGaZOrmEXMJ2
         gcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681941238; x=1684533238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8iHanY7fwyxMAC+40k2hC5PB13EWng94w0vOBJ90SQ=;
        b=Uo5lOqey64XzFJ0Jg5cBBpgp3x2dgzPFC4WaaOUxMkDT0ziQa3diQnEn+/HspAExo2
         HdEw84L6fhR6TBnyvqHgb7X/KNGzccv2EZx+Z1tA0/xtMuuiLULRZk3J5pFGcERRBzyE
         8rh7PF0nPD0z3Ti66i8Hj4RErb2FfNI8b9lGJ5GegmfhwdlQhgaLlZDttr4b5y5uzy3m
         jMqcqRWdoUOjV2C3oJbADSlDoYrBEEJk56cXqW/1jlES8z6eyjYOUIYe61rrR7e5boIw
         S/AbCv1s8CX0oaVH0Gh079kOKoUEDDXTIENRB3TWMoEM1q7xHzK8Jol3iLLOvfEiFK/x
         bgjA==
X-Gm-Message-State: AAQBX9f6mNVuw5WI36XWJVJQvRp+aqQTUsTh00RAN2AUwb6y5TaVuURj
	fgRe3BZ+dVuPnBJH1BX9CL+87MVdjH3r+/+mAz9OiBVK/J1mCwGPh5a3mg==
X-Google-Smtp-Source: AKy350au7CHiEJh3jH0BOBk7n3u4G+wlWReJVqLi7dJNUMc2sVuxMTkPvY3TekaRVMIqFKa4nmdijy5uBsrs/pUwlaw=
X-Received: by 2002:a17:90a:4307:b0:247:96e0:2ebf with SMTP id
 q7-20020a17090a430700b0024796e02ebfmr4202460pjg.1.1681941237996; Wed, 19 Apr
 2023 14:53:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304081828.zjGcFUyE-lkp@intel.com> <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
 <ZD+1BQd8Phqk3lzv@gondor.apana.org.au>
In-Reply-To: <ZD+1BQd8Phqk3lzv@gondor.apana.org.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:53:45 -0700
Message-ID: <CAKwvOdmi26QmGKsoZGauj+qBBaqvH7v6ryohQDmwLA_Mht5doA@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm/sha256-neon - Fix clang function cast warnings
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:32=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> Instead of casting the function which upsets clang for some reason,
> change the assembly function siganture instead.

Thanks for the patch, same comments as the sha1 patch:
https://lore.kernel.org/oe-kbuild-all/CAKwvOdm2VyCzfmG6707osmtyniV-oL-ism08=
kER49D7p_7x+Rg@mail.gmail.com/
though sha256_block_data_order_neon is defined in
arch/arm/crypto/sha256-armv4.pl and does not have any comments about
the function signature.
Also, I see a few more casts to sha256_block_fn:

arch/arm/crypto/sha256_glue.c
37:                             (sha256_block_fn *)sha256_block_data_order)=
;
44:                             (sha256_block_fn *)sha256_block_data_order)=
;
52:                           (sha256_block_fn *)sha256_block_data_order);

arch/arm/crypto/sha2-ce-glue.c
41:                           (sha256_block_fn *)sha2_ce_transform);
56:                                   (sha256_block_fn *)sha2_ce_transform)=
;
57:     sha256_base_do_finalize(desc, (sha256_block_fn *)sha2_ce_transform)=
;

Can those be cleaned up, too? (Either in this patch or a follow up?)

>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@int=
el.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/arm/crypto/sha256_neon_glue.c b/arch/arm/crypto/sha256_=
neon_glue.c
> index 701706262ef3..ccdcfff71910 100644
> --- a/arch/arm/crypto/sha256_neon_glue.c
> +++ b/arch/arm/crypto/sha256_neon_glue.c
> @@ -21,8 +21,8 @@
>
>  #include "sha256_glue.h"
>
> -asmlinkage void sha256_block_data_order_neon(u32 *digest, const void *da=
ta,
> -                                            unsigned int num_blks);
> +asmlinkage void sha256_block_data_order_neon(struct sha256_state *digest=
,
> +                                            const u8 *data, int num_blks=
);
>
>  static int crypto_sha256_neon_update(struct shash_desc *desc, const u8 *=
data,
>                                      unsigned int len)
> @@ -34,8 +34,7 @@ static int crypto_sha256_neon_update(struct shash_desc =
*desc, const u8 *data,
>                 return crypto_sha256_arm_update(desc, data, len);
>
>         kernel_neon_begin();
> -       sha256_base_do_update(desc, data, len,
> -                       (sha256_block_fn *)sha256_block_data_order_neon);
> +       sha256_base_do_update(desc, data, len, sha256_block_data_order_ne=
on);
>         kernel_neon_end();
>
>         return 0;
> @@ -50,9 +49,8 @@ static int crypto_sha256_neon_finup(struct shash_desc *=
desc, const u8 *data,
>         kernel_neon_begin();
>         if (len)
>                 sha256_base_do_update(desc, data, len,
> -                       (sha256_block_fn *)sha256_block_data_order_neon);
> -       sha256_base_do_finalize(desc,
> -                       (sha256_block_fn *)sha256_block_data_order_neon);
> +                                     sha256_block_data_order_neon);
> +       sha256_base_do_finalize(desc, sha256_block_data_order_neon);
>         kernel_neon_end();
>
>         return sha256_base_finish(desc, out);
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>


--=20
Thanks,
~Nick Desaulniers
