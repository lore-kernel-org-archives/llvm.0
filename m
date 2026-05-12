Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A1F3ABD91
	for <llvm@lists.linux.dev>; Tue, 12 May 2026 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616844; cv=pass; b=HgghPup1lOU5HFETQjqMBSUFHUHnlCRrF5jgAubtkHGi3zhjprg1wBWJ/1P78ZiX9p2zYTDdknKP/FeaP66IYn0iL86XfTSD3wXVe9SEDAZfvsn9H7yOxXorzrqBLuojV0DWXqkMNgakC3lMJBld5ZjxBTxHyavfmiOF7bwe5gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616844; c=relaxed/simple;
	bh=aw73wrlsT9ay/mNTPbpByGZ+dtyGQl7PfwCRhoX2vyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I0qQYLuAlHOBSXYVtM+Mqtfehuw5yZXNLLFXP7K9xH9bkG/JcFzcS1tWXNSWF9088aSXWp5NWmUqSkDB+F5mtvDH6Vi8hRLEVT0IPs9NTx5EfuRGZ9crpwOBkcsuFerCweUfWvA2tqs3W0Uw/bBcl55weIkWORpsjVeeoRYPJg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPDj2Ab0; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPDj2Ab0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-67c4aaf76ecso9310762a12.3
        for <llvm@lists.linux.dev>; Tue, 12 May 2026 13:14:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778616840; cv=none;
        d=google.com; s=arc-20240605;
        b=BjBAxuRPQO1g+LVqbKjsoAZF/kuR/ZGKOu7Gn2SWviSyeT1K1B9IgBzwGeaw3b/lE7
         FZAobbw3XcLehjEhiRQplpQKmNJBMk0LXkuIeFAXXeXWgar69a+0IpvMkUTT9RPa+cMK
         l81uh8rq/igjRmSJvTt3dwLWkU2yprsLoDzTPfVMx32k+QvjQ3kryq1YBOMdwDg6pZPg
         K1y9waDNSee7nPU0m1VFLcn4+wo0YYq9O2DFcsaQ+Uo1XaXHx89kG4mLwEfBUdsGIt0l
         WfPR+Yt8qzFtqeIR7JgSPMGh80KlQrut6+JIKOWYO2HAVIY4/Hav0I9YY5FhSjZmrLXN
         Q+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        fh=CAyItwDd3bzmGouVOmNJzWVqdAckvK8MjfGeGu2wmDs=;
        b=DMacKTMkXAskG2bGL2xqa8rB8oarcylM7pVbDXJQx4ffwRY8JbfMXj8IIiB7hz9N0/
         Hp9Hpr0aHO4u005LJrTkMQLJFR69t1R7IRrUDekeseqAYw5g2Z1Cv0RBFC5e+iS5yw9r
         DoZGyRb0jcCGDu5pIr5JKvHL3GGULvrtMgT5fJpg/+zfLIg16HFj9DmLIApsRuQuXdMm
         h0z/MqBTqnVKQ+jGvFzvGheZpPrSeT1oySEBfX8+RyvvYmMyblVIIY9qc327YKbugmG5
         mbI/yO53A+f9IVNOiMmT1fDT75Rieeb/sIcETOPPh7kPH+s6Fr9Cw48I+odeRXE6B2wR
         bbTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778616840; x=1779221640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        b=OPDj2Ab06OYythlxO1mIx6Fbh1CRrBwnGBMXx6JPi5ftSm+xr2fMkgs5KtA9V9i/Ba
         NhAhVpXOOmDC7e8IKXhuEpvARjIdi6mJsl4SGUt1oKlCsrJf2ryLGMjubWTrQbEdPg1Q
         vRtuzYhco7GbZ8UucWuIrxJ5V/Hwu5hxxJjM6Tgj/BrYJ0SoddlSExpa6jHrI5xsaj5D
         uVnSgIxtGK49ATFL2JZcoG5DX4Qc8qG+CcKTt9tgU5MBhODY3eliiOVtuIA9dLitDAAP
         UHYZ1i8+jQ4RJ5lusUpSsRERQJtE30qzzU9rm1L/RQodotp1TZtNubzsMtgHQMnn4iaQ
         KY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778616840; x=1779221640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdYjIIJuX5fr70Sxdo/ccQur00O9l14SS6MC5vYG7jo=;
        b=naUhs0iW26YIy973VueXPeLQv7OeR9GGvnn67+VmboH0IWeH/Ii0aQH8BH4Vdkhfan
         2PBElhjZNUR8gpSxDRehMH4uX3skPzcGuK7HVEMsbIlm+O/BjYPFP6REVzli6NJUA3Dy
         x5e0GEgpl5qPXLG8s0gAfKCgh6WF9xCjOfzJHiGK0XDQie1VwYVEEW6JTz9qxX21nGL+
         fR8ibnCC1GTy8aWpK8zycaeSX+8O6shGv4PtceT58Dn8xMIn6E1mA6sbvK7HAWagAtcp
         wtadTQfu/5egFB4v0Y5r65vOF35NFO4fghQGKnIy+GbBYqtX/7c9NqSvlUvZI7cUaiX9
         8iFw==
X-Forwarded-Encrypted: i=1; AFNElJ8o6ed0q+W7UqPZOPmCNF2GMa5p1YvK2145eHK9jlRA3DKq1Om7acf7arj+MyRgbO+ncj97@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs0KmYFUIDuT7kPWioVWWvOjUr5iCd1quBXimCWkj6Essf6Pjr
	pLu5AgL1QPVB/JcokO+LJ9WvPj91rivBrWNxKsowvPYQ+iCFEAjnmg1AqGTAySHx1flvEuB1iqM
	PW9KdYbrtSgXbIydsJEIIo57zgOWo61Q=
X-Gm-Gg: Acq92OGfB96t6ll8sD1EGnCmn8XHcV1z7fDE9acHsh2KUJuxhGKUDrndIhroXNAmbIP
	XpBqRVOOoiI077KeGWwhqUGsVSaDxCMuzuQXIIq7+ZFIJhvM+j8qITvR0/aBypMrZkOYHXj70kY
	bETqHCjLZ47tQy2ALCdpl4Fs6Y8UvBo7/b0TPTh2WbJMJte4gDx+mVIoL55GJDEex6QYO4usab/
	q6Z9xT4lexgj8On1MdCNPDYT6VKGBg+lHqV31YHCK/dQ1x+hV7/EAzv2WsutKMQIR4zqaKnvK/L
	RidwQ9htmSv+l0mJvZT3j3Ty77O/XzugRiqlCxcmanpSGXnHoB57lquVi+gB5+ybIZdkNVuHeVC
	nN094sEnayAkxyX14TqxdvPmuz28BKmGvdR6Fd7FhsLNmQf6MiwFITfWLSR7VzbDtSulm
X-Received: by 2002:aa7:c403:0:b0:67b:7d77:14da with SMTP id
 4fb4d7f45d1cf-682558f09b7mr127673a12.8.1778616839575; Tue, 12 May 2026
 13:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509003327.955942-1-rosenp@gmail.com> <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
In-Reply-To: <CAMRc=MfwDx8RTwaJb48ta=gppJGNwfXMOMNiNvQoRa9ibUh60w@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 12 May 2026 13:13:47 -0700
X-Gm-Features: AVHnY4KIcweIsFs1__LMQ5JPb-kIJnCjK_nHRWwFViSB2kG-QHGPVeam3sXQfm4
Message-ID: <CAKxU2N_XgMqc6tSzEFCrZhoWBwv-Xb+fn7O+Jfg0gVN0sQkKjg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: allow COMPILE_TEST builds
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 3:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Sat, 9 May 2026 02:33:27 +0200, Rosen Penev <rosenp@gmail.com> said:
> > The Intel Sodaville GPIO driver uses PCI/MMIO and generic GPIO helpers,=
 and
> > builds outside X86.  Move its Kconfig entry out of the X86-only port-I/=
O
> > menu and allow it to be selected with COMPILE_TEST.
> >
> > Tested with:
> > make LLVM=3D1 ARCH=3Dloongarch drivers/gpio/gpio-sodaville.o
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/gpio/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index f8e34b16fd99..9e1ed0f451b9 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1908,16 +1908,16 @@ config GPIO_RDC321X
> >         Support for the RDC R321x SoC GPIOs over southbridge
> >         PCI configuration space.
> >
> > +endmenu
> > +
> >  config GPIO_SODAVILLE
> >       bool "Intel Sodaville GPIO support"
> > -     depends on X86 && OF
> > +     depends on (X86 || COMPILE_TEST) && OF
> >       select GPIO_GENERIC
> >       select GENERIC_IRQ_CHIP
> >       help
> >         Say Y here to support Intel Sodaville GPIO.
> >
> > -endmenu
> > -
> >  menu "SPI GPIO expanders"
> >       depends on SPI_MASTER
> >
> > --
> > 2.54.0
> >
> >
>
> I don't mind it but I'll wait for an Ack from Intel GPIO maintainers.
This commit was slop. Will redo.
>
> Bart
