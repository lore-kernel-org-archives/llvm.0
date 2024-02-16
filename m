Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E565012F361
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708109794; cv=none; b=dHr2uAoS7L2uSmgwo4YtLDlKIzUP3+g5TC6ROqABOBUODXLfrH/K2zclM1gvzjJjbllIFvM9fD4uuKBbCZ2iYV8r9ily2DCYJ0KspQXgMTygsnrhsL0FTc7jc0VC2xMR5728lkGkON2MgBsi1OtzdnF+xZjityigFrimHon4FLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708109794; c=relaxed/simple;
	bh=wRWbVWAEKVkxJsdndgxagEHlaVTNcRJCTLDdOqr5zAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CB5676+6aXk4+jjABCAvqpQnkcIDpEEcm0vf22CUvhw3RPRyOkLGbjo7OLxpPo/1bE7cNEsPwYvmuWUFHu+XkGelzWlP/O2KL1IxQPtyRZ9z43F263A+7J5XVeFL5fDSfC86OTnFlfQ6GgEWiRpZP2ZxvyBhhhuP9Dl28bND1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2WbUwiq/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2WbUwiq/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3cfacf0eadso275754266b.2
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 10:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708109791; x=1708714591; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE/HFK8ZkQBK0NOQoyAka/SpFeDf9gV8qZ6Feq04yvY=;
        b=2WbUwiq/4Oaz6rVNW/B1N4yC/PBjigyNo+gTn2SSeFp8xq1vXmfNGEAWklssEH8F8C
         G/Iaqo1Dxx+ZVRuCxk22BHRh3gXyWIXYa383XfqtNq1uTYNPI8vXAVuqlL4XHqazctgL
         Kh9nY82dtQhEZjU8W1rv3Hz+mIrNNZOfKM8ozxl587ZjcNBorZJ15xxS1htbUpVjHPZF
         525QBq+jVrn8JL+CSYr4sOcNQyxna9MJyuhVMN4FgRx947v2lsv1JYkJrSmCgcrqMOD/
         5k7FcRsuSAdJBxe2j4B9Lu3wUPgk+feJDKpbdFn99QCQt9xjWO4JXOgvWr3CQkqYh4FZ
         eUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109791; x=1708714591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE/HFK8ZkQBK0NOQoyAka/SpFeDf9gV8qZ6Feq04yvY=;
        b=bCWBquomsu20IBN74L3GYi3WVTV2WFvu1qs9b1uVs/ws6l95kWtY7GQEOtJ6OwRZpm
         DtcUPeA543HjrbStGkg8I759JMktGGxiSyim5CFgpYrBKYdeZY/XtYMEqIi9D33Z8pX7
         Emp+wuC2XSAvJGK5PXwBnCP/A7MkggeGdxfexzZcmx9LS6VlVVbGFeDbUjiQ+Z9I7Ox2
         uUO9HWNTXqkhjz+UoPS4DNenek7DkGdHQK/hqRo00YpbZT7LJvy7mUeotIMzjnPs47MY
         FgNGtHFKGW2C8tm0VDvDxNl3h1A8S9CVlsfS+UrEmdRW0Inp9i2vV7qehd5CFA+6uPuV
         4r6g==
X-Forwarded-Encrypted: i=1; AJvYcCW+PKZjZukN6u/Lb+5AQY6XnG8lWAsQWnyQirqnVEj9QuuQLMjxFp0vlwkNywQF2aGht0Sg3f3fMortEceTUTb1a/cmgQ==
X-Gm-Message-State: AOJu0Yw3Nf7Yum04K2Q33mD8qPeiRTUhMNce85Q2L5Iou/7IogVQROe+
	Zd8Je3k6WdP1cXBZUEQyBIIx7eMxBk8x0+RTZUEEgPRma+KC0cMYv51Vp7tnH30cehACscEsOgR
	YtgNaK2VSinAQAvfFz9Jb74ZFUiqRMJd002J1
X-Google-Smtp-Source: AGHT+IFp78DbQechB0DTN7tbQDGsBKYQ1Zyk8Gs2l+SlA4DTOzSIcgkQHJdlamOu2SKiEkm8ULNQuqRmXmt3YRpZigc=
X-Received: by 2002:a17:906:b09a:b0:a3b:e9d9:bf6a with SMTP id
 x26-20020a170906b09a00b00a3be9d9bf6amr4326843ejy.40.1708109791012; Fri, 16
 Feb 2024 10:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240216163201.1901744-1-arnd@kernel.org>
In-Reply-To: <20240216163201.1901744-1-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 16 Feb 2024 10:56:18 -0800
Message-ID: <CAFhGd8qmR+EPVUDt0DVttxm3aBQpdL2i4XbFZ3_ko6Li=mVH3A@mail.gmail.com>
Subject: Re: [PATCH] media: dvb-frontends: avoid stack overflow warnings with clang
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Mark Brown <broonie@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 16, 2024 at 8:32=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> A previous patch worked around a KASAN issue in stv0367, now a similar
> problem showed up with clang:
>
> drivers/media/dvb-frontends/stv0367.c:1222:12: error: stack frame size (3=
624) exceeds limit (2048) in 'stv0367ter_set_frontend' [-Werror,-Wframe-lar=
ger-than]
>  1214 | static int stv0367ter_set_frontend(struct dvb_frontend *fe)
>
> Rework the stv0367_writereg() function to be simpler and mark both
> register access functions as noinline_for_stack so the temporary
> i2c_msg structures do not get duplicated on the stack when KASAN_STACK
> is enabled.
>
> Fixes: 3cd890dbe2a4 ("media: dvb-frontends: fix i2c access helpers for KA=
SAN")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/dvb-frontends/stv0367.c | 34 +++++++--------------------
>  1 file changed, 8 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/dvb-frontends/stv0367.c b/drivers/media/dvb-fr=
ontends/stv0367.c
> index 48326434488c..72540ef4e5f8 100644
> --- a/drivers/media/dvb-frontends/stv0367.c
> +++ b/drivers/media/dvb-frontends/stv0367.c
> @@ -118,50 +118,32 @@ static const s32 stv0367cab_RF_LookUp2[RF_LOOKUP_TA=
BLE2_SIZE][RF_LOOKUP_TABLE2_S
>         }
>  };
>
> -static
> -int stv0367_writeregs(struct stv0367_state *state, u16 reg, u8 *data, in=
t len)
> +static noinline_for_stack
> +int stv0367_writereg(struct stv0367_state *state, u16 reg, u8 data)
>  {
> -       u8 buf[MAX_XFER_SIZE];
> +       u8 buf[3] =3D { MSB(reg), LSB(reg), data };
>         struct i2c_msg msg =3D {
>                 .addr =3D state->config->demod_address,
>                 .flags =3D 0,
>                 .buf =3D buf,
> -               .len =3D len + 2
> +               .len =3D 3,
>         };
>         int ret;
>
> -       if (2 + len > sizeof(buf)) {
> -               printk(KERN_WARNING
> -                      "%s: i2c wr reg=3D%04x: len=3D%d is too big!\n",
> -                      KBUILD_MODNAME, reg, len);
> -               return -EINVAL;
> -       }
> -
> -
> -       buf[0] =3D MSB(reg);
> -       buf[1] =3D LSB(reg);
> -       memcpy(buf + 2, data, len);

I'm curious why a copy was made at all.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> -
>         if (i2cdebug)
>                 printk(KERN_DEBUG "%s: [%02x] %02x: %02x\n", __func__,
> -                       state->config->demod_address, reg, buf[2]);
> +                       state->config->demod_address, reg, data);
>
>         ret =3D i2c_transfer(state->i2c, &msg, 1);
>         if (ret !=3D 1)
>                 printk(KERN_ERR "%s: i2c write error! ([%02x] %02x: %02x)=
\n",
> -                       __func__, state->config->demod_address, reg, buf[=
2]);
> +                       __func__, state->config->demod_address, reg, data=
);
>
>         return (ret !=3D 1) ? -EREMOTEIO : 0;
>  }
>
> -static int stv0367_writereg(struct stv0367_state *state, u16 reg, u8 dat=
a)
> -{
> -       u8 tmp =3D data; /* see gcc.gnu.org/bugzilla/show_bug.cgi?id=3D81=
715 */
> -
> -       return stv0367_writeregs(state, reg, &tmp, 1);
> -}
> -
> -static u8 stv0367_readreg(struct stv0367_state *state, u16 reg)
> +static noinline_for_stack
> +u8 stv0367_readreg(struct stv0367_state *state, u16 reg)
>  {
>         u8 b0[] =3D { 0, 0 };
>         u8 b1[] =3D { 0 };
> --
> 2.39.2
>

Thanks
Justin
