Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E84205AC8
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 10:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169450; cv=none; b=eO9UNghwzQ4NSlnL5NBjFO9oCZCGsXcoUqjVpG5uVl8NGLiaBNiLnpEWSC608o/JEbeJYzu/6/AgrsF9tanQrQ2M4+B+/fOA8HG6/DEEk4eZNnbJd4zq14dPEm+S+HZQuLzxGgEmD8gyvbGtGbi5+vwZkuWWqjdd2Z/NJDtpWa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169450; c=relaxed/simple;
	bh=llg0domLWIKPFm2rb3BZir48nLFe6AvnxeCjrY+USvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgfTCvd3ohTdnRw3ply+zcygiVo/sbPy2Nt9my2VhgQ4BDe37fCeSgbEnxw1MTU7tJBhtQ6NfmSa7f0NNK0Lybib1gYn9nWc5+SCq6vHLeqsfQQ98dG/Yg2NJ2BDbYjJf9JFmqep/xyo9NwbJxSvkyyFSrHR9YvlL4EgWYRzB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NozI8aJm; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NozI8aJm"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so7662321fa.1
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741169447; x=1741774247; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6sJPgBFhipyGWeJK1GttBGiwRcJZd7KKopxjGpBJHY=;
        b=NozI8aJmNbBUWBULhQOr1YbsXRO8SH5Qt2/26U7d0PWR/k7yo+2soJElsZe7pkVKkF
         Tw6BPl2xGD+bp1fvtnOB94Jyr/NMJkMZrzJP227HFtcE3fV2kr9GvD1nclUl+raP3kYL
         ORfxgOoQ2nb+WCriGAlv23DGBa6cNc58bWyxWIRNEmVJobeNzRGOuXICRIHQY4sAxdQ9
         P3BIqdrqc28CWyaYoBS99uC45B0ercqpJOa3QGXhDQ1sGyuYtiEYrlCWkR2wpqxoF1qS
         GYoX9UbzJxGIEsJdyBhV9Se/JU0IC7f8VD3We0awklUrIePuMqKuCctcSoerU5WyOaAN
         BwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741169447; x=1741774247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6sJPgBFhipyGWeJK1GttBGiwRcJZd7KKopxjGpBJHY=;
        b=kBlFhWLJuXMnWp4J+c1MECa3/uqJxdSt/3vvNWuUcYrAXwqMgVfnOc0xFCYeEqgO6i
         gP/4fGwH0z/+f2lX/sws3oX1ZSgf5OGZEbX+rKrsxq3PbGrKPqEuXS6/g0Lbaxg0QUyk
         LMCPiZORBqRASesYSw6r2UikeTu68oxeK2O/3TZVC0cSelRF7e+ncVuOF37znG34ZWcq
         dnCWZXGgG0Kqqul2E/dNmUQX53IC5gRWfnXDXhXF4NUKCJ+B12z7OxlarEdz/5HARchE
         WjpZCu922vfaBNAiQ+uD6sjm8fjt9p56cImLQWzemaT2ogg+Wzot1yo+mfpW4TiFl5QK
         fnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5/z0isFke9QzblSh3DWd26iv+wGNu1Vi9rRZT/tz2rzsnksQXbqAkexgj3CVjgpBOnz+3@lists.linux.dev
X-Gm-Message-State: AOJu0YwqxTBDv+4gKzYJYPeylFXnm/YacsV0cBWLn6Sy2n9CFeKaJXjc
	ZlHxWaVg45oKsHQacTadvNHkJwCQpe9P5G0aWHWWOiJy9DLEgelSBKJBQpxnJt/xo7yFvxPQW7J
	aOsTNqdXNtFWAbXnLmWJTC2Og8D8=
X-Gm-Gg: ASbGnctiEwB8sCIzIifpZ/8lreyJD23CmDgSw4vlyZatvsQc47efcLbTPqNi8UbI9tm
	8kvkFCimcEBskjmYBa2VZbhFyAN8terb1ls0MIhJiBCRssJ26FV828OZWMQph9sOlPQqYEk/y8w
	XGQ5wctHAaV9kRsaR6r1gE08MXeQ==
X-Google-Smtp-Source: AGHT+IEURqWpoFonECBt8ISCyOLd+8RPbOZV7uLgtcPcEzt6+VvkWezBr6q5FXj/MkUUIbpTM4yfNKzX8SLCGwJcBkA=
X-Received: by 2002:a05:651c:2207:b0:30b:c3ce:ea51 with SMTP id
 38308e7fff4ca-30bd7cd5c0cmr6897361fa.15.1741169446164; Wed, 05 Mar 2025
 02:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304213216.108925-1-ebiggers@kernel.org>
In-Reply-To: <20250304213216.108925-1-ebiggers@kernel.org>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 5 Mar 2025 11:10:40 +0100
X-Gm-Features: AQ5f1JoL3EYBkezeivq6kAevMSsSR0Ei1buWNTADmjgUBeYw4D_is9BtgZdT5AU
Message-ID: <CAFULd4Y8=zov8Yov3n4rhwT7JO0YxaEQJ56hq1Hd7TB=yQjWQw@mail.gmail.com>
Subject: Re: [PATCH] x86/crc32: optimize tail handling for crc32c short inputs
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	David Laight <david.laight.linux@gmail.com>, linux-crypto@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 10:26=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> For handling the 0 <=3D len < sizeof(unsigned long) bytes left at the end=
,
> do a 4-2-1 step-down instead of a byte-at-a-time loop.  This allows
> taking advantage of wider CRC instructions.  Note that crc32c-3way.S
> already uses this same optimization too.
>
> crc_kunit shows an improvement of about 25% for len=3D127.
>
> Suggested-by: H. Peter Anvin <hpa@zytor.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

LGTM.

Acked-by: Uros Bizjak <ubizjak@gmail.com>

Thanks,
Uros.

> ---
>
> This applies to
> https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/lo=
g/?h=3Dcrc-next
>
>  arch/x86/lib/crc32-glue.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
> index 4b4721176799a..e3f93b17ac3f1 100644
> --- a/arch/x86/lib/crc32-glue.c
> +++ b/arch/x86/lib/crc32-glue.c
> @@ -55,11 +55,19 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
>
>         for (num_longs =3D len / sizeof(unsigned long);
>              num_longs !=3D 0; num_longs--, p +=3D sizeof(unsigned long))
>                 asm(CRC32_INST : "+r" (crc) : ASM_INPUT_RM (*(unsigned lo=
ng *)p));
>
> -       for (len %=3D sizeof(unsigned long); len; len--, p++)
> +       if (sizeof(unsigned long) > 4 && (len & 4)) {
> +               asm("crc32l %1, %0" : "+r" (crc) : ASM_INPUT_RM (*(u32 *)=
p));
> +               p +=3D 4;
> +       }
> +       if (len & 2) {
> +               asm("crc32w %1, %0" : "+r" (crc) : ASM_INPUT_RM (*(u16 *)=
p));
> +               p +=3D 2;
> +       }
> +       if (len & 1)
>                 asm("crc32b %1, %0" : "+r" (crc) : ASM_INPUT_RM (*p));
>
>         return crc;
>  }
>  EXPORT_SYMBOL(crc32c_arch);
>
> base-commit: 13f3d13d88b5dcba104a204fcbee61c75f8407d0
> --
> 2.48.1
>
