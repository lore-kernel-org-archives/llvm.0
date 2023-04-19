Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B0D2FD
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:46:10 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b52ad6311so429594b3a.2
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940770; x=1684532770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eNA55poY27sJGkFBB9ELAvckRSp+Hs3DdUKmyP8I/c=;
        b=Wu+EO2gLZK7bRlRXhOue6NYns1NGF7FgYObfpP2p7tSWYpnQJon+eZ1th/qgEPsbeT
         n6YG0IH0XPWgIbKKR/M3vjqnEh+7YqJN4K0V0IqQN1geeWosh3pj/m3nQmPs69zCTXOO
         F3hp3XJG3srHyjCAcvzWdXQrY8iGq+h3sroGuLR4nVCU/CgUPdhjHcZiGoQBwmYQOq6q
         6nHpbRCJtMdALeo1UBhlq4sGLfDBin4I4t5N2QYN2KQWrLWqqQOZulXn7jLCyO4SF5D1
         ADWe84kC/4VIG85xthR+4jmVpFZfD4HWvnk92BW52dBG9a56AAf+S53ye2pt6Wt1zQqu
         4zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940770; x=1684532770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5eNA55poY27sJGkFBB9ELAvckRSp+Hs3DdUKmyP8I/c=;
        b=T6XqkhoGTeW+8+E92v9nmGXWQCVw3GQkeuOV35al0TA+8aNpFE696pwJDt4jY39ByP
         lLA5LOZTtVP39frae4hYdRPvh0ocU+eiz0m7wwuoPB9KpUT1V+01h6+VUDGTfPg5Iu/W
         3it1pFrYdC0tNae33Ow8R1tVRor3LLGf8f4W+EMepyHWSE0jlhbW2/s+j3w385G7GBu5
         RL6oh7+dIp0waRu30yGssR1+bn7z+QYQGyDy0xwxb4BH3/+W7Vhj721pqHUKmTUW8X/V
         6w/qpgilJCMZr3aioICc2JC+RgO2si37QSa8iDUYKhVGM9ZjtaiuXlrBEqi+OR71ES7L
         MjTg==
X-Gm-Message-State: AAQBX9dVFh6gWy+UK3Kif4oXEmM+PjzyD4bZM72HeUk/AO1dJ9oVuQHE
	LLUfN7XTPxCLb8nV+GkZE2Y4Tg0JlDTqlsJUzXxv/w==
X-Google-Smtp-Source: AKy350bL48Q9SK3cJudoJ6xx9ltTOmsUb9nCB/69hFqPx6lo5kbFN2yYSkaFZsBy9oE0K351LWgmiL9hiI5w4oDtC+Q=
X-Received: by 2002:a17:90b:4c4f:b0:247:78e7:8739 with SMTP id
 np15-20020a17090b4c4f00b0024778e78739mr4187323pjb.0.1681940770255; Wed, 19
 Apr 2023 14:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304081828.zjGcFUyE-lkp@intel.com> <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
In-Reply-To: <ZD+0DJq1NHmMSSja@gondor.apana.org.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:45:58 -0700
Message-ID: <CAKwvOdm2VyCzfmG6707osmtyniV-oL-ism08kER49D7p_7x+Rg@mail.gmail.com>
Subject: Re: [PATCH] crypto: arm/sha1-neon - Fix clang function cast warnings
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: kernel test robot <lkp@intel.com>, Robert Elliott <elliott@hpe.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:27=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> Instead of casting the function which upsets clang for some reason,
> change the assembly function siganture instead.

s/siganture/signature/

Thanks for the patch!  Perhaps worth noting in the commit message that
this fixes an instance of -Wcast-function-type-strict triggered for
W=3D1 builds, which helps us catch potential kCFI violations at compile
time rather than runtime.

After this patch, there's only 4 more users of the sha1_block_fn
typedef, consider if that typedef is a candidate for removal now?

Also, you should update the comment in
arch/arm/crypto/sha1-armv7-neon.S above the assembler implementation
on L288-289 to reflect this revised fn signature, in this patch.

>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@int=
el.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
>
> diff --git a/arch/arm/crypto/sha1_neon_glue.c b/arch/arm/crypto/sha1_neon=
_glue.c
> index cfe36ae0f3f5..9c70b87e69f7 100644
> --- a/arch/arm/crypto/sha1_neon_glue.c
> +++ b/arch/arm/crypto/sha1_neon_glue.c
> @@ -26,8 +26,8 @@
>
>  #include "sha1.h"
>
> -asmlinkage void sha1_transform_neon(void *state_h, const char *data,
> -                                   unsigned int rounds);
> +asmlinkage void sha1_transform_neon(struct sha1_state *state_h,
> +                                   const u8 *data, int rounds);
>
>  static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
>                           unsigned int len)
> @@ -39,8 +39,7 @@ static int sha1_neon_update(struct shash_desc *desc, co=
nst u8 *data,
>                 return sha1_update_arm(desc, data, len);
>
>         kernel_neon_begin();
> -       sha1_base_do_update(desc, data, len,
> -                           (sha1_block_fn *)sha1_transform_neon);
> +       sha1_base_do_update(desc, data, len, sha1_transform_neon);
>         kernel_neon_end();
>
>         return 0;
> @@ -54,9 +53,8 @@ static int sha1_neon_finup(struct shash_desc *desc, con=
st u8 *data,
>
>         kernel_neon_begin();
>         if (len)
> -               sha1_base_do_update(desc, data, len,
> -                                   (sha1_block_fn *)sha1_transform_neon)=
;
> -       sha1_base_do_finalize(desc, (sha1_block_fn *)sha1_transform_neon)=
;
> +               sha1_base_do_update(desc, data, len, sha1_transform_neon)=
;
> +       sha1_base_do_finalize(desc, sha1_transform_neon);
>         kernel_neon_end();
>
>         return sha1_base_finish(desc, out);
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
>


--=20
Thanks,
~Nick Desaulniers
