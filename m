Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337388526E;
	Fri, 24 May 2024 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716543181; cv=none; b=pq7FVChBDT1RciHkcqdd0DLFKEzVbnESNcu7y+SCSTzet4j34LwjNf2BstGS0mwA0GvEvulzNW5ZUcrfSIZpPTtphDcexKKG/09Ch8GL92F2Z5YGrZmXT4gbQlRScalOaTrAXC1k1dW9lPnO1q0S9cYI5rcQh9zPkdATC+NtIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716543181; c=relaxed/simple;
	bh=2RrLOS91XoKFHAFTx+37jUWVutB0E1TVUDdeeyeIG+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4iS/+QZHofND7L8WbfiEdb3/kyC+5PTr3D2Y00hrUVvdM+X066hkFZZz/g3JQx05tniMqZbEzNj+uia4bewfm1X4JlXT8mx8ne9cpDWOVgZyS6RkzreE2pfkBqLIk/rUEc0C83Y+9xTGJW8iaavi4xHkHQkulgwV6rWM3wjUiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+5SMxqP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+5SMxqP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4202959b060so62009115e9.2;
        Fri, 24 May 2024 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716543178; x=1717147978; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/N78wdGhHYwk+WAeb4KOPaNgXTFF+oTiWHimI1zWv+w=;
        b=D+5SMxqPElKFzj9SOri729X3DyEnqni026sPQWgtFTznPHUQWbRoWiW2L7mxpsVHDT
         WGl+PThkj7jtMt9CJkRDLmz6j+2VWnSzI0p2D/lAkIEsek6j47Nn6LYEy0qEsogJ47NU
         PVczvsB0iIzN2Y0eF0q5jCeyh6dZiAD837us51FpJnGaSakqNEiNfTAZt7xbJje6lrut
         DPqud1+FRvXl9C3MrqQVayfQ92iJsVsJ5qQTCdp6W2tQau0GjriAzaqBFec+qmBaq94j
         u129EINshVci2UuwexK4kEP5Tt1MoDQPwqjFdptvpcd9SGhl9vAPuGFx92fZhD/YZQ21
         WYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716543178; x=1717147978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/N78wdGhHYwk+WAeb4KOPaNgXTFF+oTiWHimI1zWv+w=;
        b=bz9eca8vH3GwA+PTl+8QBbuN8PHymwJqw6WREnt1b2QF+HFPM4OXzzUUujUgClITDw
         M4cgNkjI0lYsE2/ojQ7LtcgSCxyhLi+uFeXlmL5aYexuGyo8BY322O4PDhfPtVgljWF2
         UfsUpFGw3fSKtNwLUHrldEvQ53qmOBqvZiQ2jjrqkpMX2gEUODMpMcMvSpG+dfgt5C65
         fYTT8aXXTDwTfDt5dctpPlZ6rHxvoA+6pAvhix8ODBQdl+b2cu7xXyoxPsczCBsJ1GQ6
         3NMtHbzG4PL86J/4A2JzpCXVpLWwYga9lq8KZhZTQ6wvEqdKqUPidAUQQCT11XKDiNiU
         1Ijw==
X-Forwarded-Encrypted: i=1; AJvYcCUriweqtrbO4a7VqLl0Lxivb8/lEmxJA0N2G6IxFNGYyY3PSPbnjhn662wNf4BWH9d8Mj03EotDW/DCXW/0Z7tTXpJl8hahhQv198cboBK2IX4aGzJ7EdLGPqGipG+QY+PeIxo=
X-Gm-Message-State: AOJu0YzZwAhb+5Dkt+EmLPeWyi+GlChVDwDqU73eMR0LwxKXB4Oj/IPE
	pyqAbS+eSDIkqDFzgLbbzo10ZntxgQgHvYRhzjc7LAH+Xv1SxyCsUk81uT1U3AOEq3b8FhhlyyI
	qZMdsRrDm47Xkt9mESzKgj8RD2ps=
X-Google-Smtp-Source: AGHT+IG85r6fzf+Rn3oq43J6zk37pMjCk/MUQ1CH01rTPdQh47I++Z/WHoEVeJOT8Si3w4cgr4HsmuiiPelOESdHSTI=
X-Received: by 2002:a5d:6983:0:b0:354:fb81:19d7 with SMTP id
 ffacd0b85a97d-3552fdc86e4mr1000287f8f.44.1716543178271; Fri, 24 May 2024
 02:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405011208.qsZQwChO-lkp@intel.com> <20240501132359.488616-1-skseofh@gmail.com>
 <20240522143129.GA3244910-robh@kernel.org>
In-Reply-To: <20240522143129.GA3244910-robh@kernel.org>
From: DaeRo Lee <skseofh@gmail.com>
Date: Fri, 24 May 2024 18:32:46 +0900
Message-ID: <CAATEi5=pe+A8bUp=JqoMUcqQWp9uZ+4b0A92QxVRmsNj0H0ayw@mail.gmail.com>
Subject: Re: [PATCH v2] of: of_reserved_mem: clean-up reserved memory with no-map
To: Rob Herring <robh@kernel.org>
Cc: lkp@intel.com, daero_le.lee@samsung.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, rppt@kernel.org, saravanak@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 5=EC=9B=94 22=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 11:31, =
Rob Herring <robh@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, May 01, 2024 at 10:23:59PM +0900, skseofh@gmail.com wrote:
> > From: Daero Lee <daero_le.lee@samsung.com>
> >
> > In early_init_dt_reserve_memory we only add memory w/o no-map flag to
> > memblock.reserved. But we need to add memory w/ no-map flag to
> > memblock.reserved, because NOMAP and memblock.reserved are semantically
> > different.
> >
> > Signed-off-by: Daero Lee <daero_le.lee@samsung.com>
> > ---
> >  drivers/of/of_reserved_mem.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index 8236ecae2953..d00a17a9cebc 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -81,6 +81,7 @@ static void __init fdt_reserved_mem_save_node(unsigne=
d long node, const char *un
> >  static int __init early_init_dt_reserve_memory(phys_addr_t base,
> >                                              phys_addr_t size, bool nom=
ap)
> >  {
> > +     int err =3D 0;
> >       if (nomap) {
> >               /*
> >                * If the memory is already reserved (by another region),=
 we
> > @@ -91,7 +92,10 @@ static int __init early_init_dt_reserve_memory(phys_=
addr_t base,
> >                   memblock_is_region_reserved(base, size))
> >                       return -EBUSY;
> >
> > -             return memblock_mark_nomap(base, size);
> > +
> > +             err =3D memblock_mark_nomap(base, size);
>
> The last time this was touched, it was to make the handling aligned with
> EFI memory map handling. Is that still going to be the case with this
> change? Or does EFI memory map handling have the same issue?
Can I get more information about EFI memory map handling that you're saying=
?

1) Are you talking about uefi_mem in the reserved-memory node like below?
 ex) arm64/boot/dts/qcom/qcs404.dtsi
                uefi_mem: memory@9f800000 {
                        reg =3D <0 0x9f800000 0 0x800000>;
                        no-map;
                };

2) Or, about handling EFI memory map function efi_init() -> reserve_regions=
()?

>
> > +             if (err)
> > +                     return err;
> >       }
> >       return memblock_reserve(base, size);
> >  }
> > --
> > 2.25.1
> >
