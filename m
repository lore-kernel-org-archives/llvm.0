Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC2D13342F
	for <llvm@lists.linux.dev>; Wed,  7 Aug 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047665; cv=none; b=S2xAqmJTVuZihmecrvlDl6dfZMZn+KmEuhtBC2npjtcjf8KphpmoAttLrKcEXiKLfA0mIcr6lNWMzRM+nvHMriAi0Y82WbIoMvFJN20I9u0H7VTt/7RJVzCKrX/LmkqUlv1UG7MBgBIhizwsfrCvMqdjl4xmMG6oPliM1QRhAAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047665; c=relaxed/simple;
	bh=bnQHhyxtaLGDQyQRpgbmjXhmrP9N64R0hZVoFnzGj0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGAscJDTtT/RRlZjX+J/4Ux8+iOFgubF3j+yhqU7Z48Zfu1+FVU93YLtseyEj4PlxgaTzxf1XEvf/B26a9eNv7Lkp50V0NP2lWmoOjUPsUgGCXHhBwZfn8J0MYcrlOElIrLIQ7suzdXAv4VgcABjRrxPW3T5h1m/KNLX6f6j2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=H3Sqh4qh; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="H3Sqh4qh"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-65fe1239f12so289237b3.0
        for <llvm@lists.linux.dev>; Wed, 07 Aug 2024 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1723047661; x=1723652461; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
        b=H3Sqh4qhn3cJyDFgCOvtIlSOzOKx/lC0qSp6Rfl4YlZ8vEPbUpMJkjGfFdJXcSjNeB
         h0Pagr4Cf/cVpbsCWxiCoWGLM/Al+HS4CULgQQji4B5Ovz8hTWgJsT31lwGBapz3zNpj
         wk0i2QF58Rm2hq/DhxpgxdNu3dpGzg9adryl2Tt6S2eiQCMAbdO4Fu5ivQ6mOGqjFQob
         n+8scjO8zW2GrzGNQf3yHTdA1JJ1PmW+fN6qMR0eqdm6cI0gS2v5g+oYcyHY+85o2VoV
         2aWPGktNAkgmgu8wk9LHbotJmUxrnEgktCvidtIv7VoRCshSSFNR3rHWJwULqpaHCynu
         9ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723047661; x=1723652461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLIeHC32QQFW2KzLfSivT5ewKagCTjZMp/GPtEGBlcs=;
        b=C0s3AsVd6X7xQyox5chS2ShbryxP9rUJs+cPZJWjwP37hrjJjmaoFElDFJ4Z1+ldwY
         MJ37EUywrvSz+WdTfxitbhov9GR17/fztaDtv/rGlNrZnypJWrk7mtUpH+opAaqM/KhH
         f3bP0Bnwr5ShutSH8DYyEoIUAJ0yHYbpRnNNa2A0UQrU7XxvsdTsdUqMnX12U0zCaJzg
         5/3WB4O9RsP6Z+5NRN7AG0NFr2fUc7UaKfUJwKvRXDtSHB2wR/inTjlHEFsg4h+MSDEW
         pORBFG95vmwG2nOkNjGFwk69V6xjrxB/OxCB93bbuOnCZU+aieD65SeZ46f2Ohu4X0j1
         ruhg==
X-Forwarded-Encrypted: i=1; AJvYcCV1b52BLGO+lFu73IXV4/10xZP15zyA82PBq6wvmiloU9yA4W+5+gS0IT9pY5EU8daWbp3TjMxonXJM6LuIQcM3dfnsdQ==
X-Gm-Message-State: AOJu0YyxS4qM0AEd+aGP+PecrQzy7OL2SvqYVFFIDcFqdLKC7zmPREVR
	3+4PK/MU32eewysyUgZIYt/vMfRJSz0xLB7vpz13Ea3AacPh9BAy+mY+Wbsqnyd6TawMbqTaUPp
	FeusGdK/jv5K0TtAmDprMmpA6CPbIXFJ83rq2
X-Google-Smtp-Source: AGHT+IFlMQZM11eMhKYm88nwqqB//YSwgE91qY+0p4KKcANp0MWW6pOsqJvjDDmdPT/npZIBCFW4JUe0qIrb5ggxQJM=
X-Received: by 2002:a05:6902:1506:b0:e08:631a:742c with SMTP id
 3f1490d57ef6-e0bde2cf614mr20513586276.16.1723047660711; Wed, 07 Aug 2024
 09:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
 <20240807-outgoing-charcoal-collie-0ee37e@lindesnes> <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ21o+cQQaLD1xkwSX0ma8hvB29DMDquy5VjHcBWwhGPw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 7 Aug 2024 12:20:49 -0400
Message-ID: <CAHC9VhS5e4=CK=svEPz=3zGm_FxDXdMoS4M7BUKj8z4sUf17Bw@mail.gmail.com>
Subject: Re: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
To: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, 
	selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 11:45=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Aug 8, 2024 at 12:39=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Wed, Aug 07, 2024 at 01:09:20AM +0200, Daniel Gomez via B4 Relay wro=
te:
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > The genheaders requires the bitsperlong.h and posix_types.h headers.
> > > To ensure these headers are found during compilation on macOS hosts,
> > > add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
> > > adjustment allows the compiler to locate all necessary headers when t=
hey
> > > are not available by default on macOS.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > > ---
> > >  scripts/selinux/genheaders/Makefile | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/ge=
nheaders/Makefile
> > > index 1faf7f07e8db..017149c90f8e 100644
> > > --- a/scripts/selinux/genheaders/Makefile
> > > +++ b/scripts/selinux/genheaders/Makefile
> > > @@ -2,4 +2,5 @@
> > >  hostprogs-always-y +=3D genheaders
> > >  HOST_EXTRACFLAGS +=3D \
> > >       -I$(srctree)/include/uapi -I$(srctree)/include \
> > > -     -I$(srctree)/security/selinux/include
> > > +     -I$(srctree)/security/selinux/include \
> > > +     -I$(srctree)/usr/include
> >
> > 'make headers' composes the UAPI header tree in $(objtree)/usr/include.
> > So, if you build out-of-source, -I$(srctree)/usr/include will not match=
.
> > Just remove the '$(srctree)/' prefix as '$(objtree)/' is always '.'.
>
> Right.
>
> > But I am suspecting that this break cross-building.
>
> Right.
>
> We cannot do this.

Thanks for the review and catching this :)

--=20
paul-moore.com
