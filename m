Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3254CA286
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349117; cv=pass; b=Mfa1hSf/A21upRJReUPX0dsAFCXNn5Hm9a8mNRIOlbHoUlFCAi6f3ZiwndCZmI37B+2Y/5V8b/d+W9j/y+XoptoHUyOl3ftweNj3E9QjkDugg5zSs/mPeKkNm1azEROK2oYP8j9nWg2gN4n2sy4EBYP1tiRxTv2dyp2lsbfE6+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349117; c=relaxed/simple;
	bh=iF3MsUaiv9wYvTwNatTrzedOqyxinRERB8Oc68E6Mdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOfS35SEAB3n0E6U5APtUIsXM6N8KXtM+BKj+x9GjiRddzqatqjrJP73K+n8qyC8qmbmg/aTgE3f5k10kZ4lb7JogVYXllkYRoFp/cnp/pLvYYX/Cg0IC7c415iEGR33tj9Gm6BDtdL4z1f4RcC9k5zhqwib3KNhWgEPyakEK9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G24kGuvw; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G24kGuvw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso1847609a12.3
        for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 11:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785349107; cv=none;
        d=google.com; s=arc-20260327;
        b=dp85AZoZ6ZwqKl+Z/4WGR3hPyxVY/KJRM2PAL+lS/ziLGRcIsZxhprSfsDQCOwA84T
         WubNe+oi0PTAG9q4iEBzROrpycCQUsOygPae1ntrnPbyDcbXwgc5kG4q6NoWpLlSAo+z
         PE+gnhpJ3NiP438yHwrdaKUyG34ZzfVpq0ccwAhtOiJyv4o//eFgwacdDvahww4wHbng
         GONxKl3kKE4LlBmelJiL9T1uN5qsfcXI6nX5rUu41RWyIRlF9r9hU0SCGiSfZIKqSZmV
         JFFFrhutZdfaxzEY0ZgsiQcZ216FVzgbx8U5W7e0DE+TlKol0QOqotPM2RjNb6CgPpee
         YzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        fh=CVZutePVkf4mciHg3avg+4t1PqMG34PIHqZy8bGld8o=;
        b=Qw3/+kq2itztNW6EXTfysgWlyzNi1zoatDRetKgKhJC/IHobeTUlMUU0Q32rsfu50y
         8RXqvCimVZgAtQqLbt5aSL5QHmmujpoU0rH1gc7Fp9L21/Eb/IF1jyrLLcHAX82Z+hXa
         hWr9fF0hsc29YnWF9JAaKSw9qb1sMCaLMHuRV/aLNM4u+z1mH9dNM3ep3zg/46J4PfLx
         k6/fP00JKFezAQTa60XXvZ8p2cBQN5SIf1uq1m1BiZdAXInT1it4OhJ4ovqDVwTDbajp
         kx1ymBFO1Ibtqsn/HnWQQe2AM9u+/9MSksJxyag5xDi4GmH8bDOw9AKgJ69ACcBWFHUe
         kRNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785349107; x=1785953907; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        b=G24kGuvw1n+4Nm7KABWrSG4+tFb3QRrD8svLwMRGgbBcoVi2GY0nc3sEjREzIP5Fra
         0fLvY2MvWMBG0vUFcdykRYLNIAXHHyKiD4TtXe2T8CG3Yva6/E2pHLYdU7zeJ951/6sY
         YXhrycgbdVBjj/hT0ZBDJdgGMM/ukJYTIICnhggp7SGkC86tBLDAxJHZ76ZnOeZXiVIT
         Bo0bkORvDq1Eq9g6n8VQ4C6gP9oLJFPFLnpHMyGuAgNgpTe6G6/3XOwdNXhfl9/OG/xo
         2DnF8rw4TbdFIqkni5m8+y6c0bad8Hu52dHApVKKkEHqq9BKWNxZ6Tj5uVdeC0hVmwc7
         BOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349107; x=1785953907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcCuHqVYCKL4ZVfAAcjqS5FtBduw+dbkV1WkEbl+SbI=;
        b=NbjjxBfoBB9cF7wGSclxylUaHv1MoVP3Lz4Na1Gl9d0TP7P/tORbLBNJQQd9C3zJ8E
         vi+YJ//3VrJ6Z3vuV1T7lNbdOZZ2xHgoMcnJ77e2Jb+wx4Z80GWM8YHD8moxoMdOwluO
         moa31sp0U6mT4ajPJuvf/0GBy2gnxk7aVe+/B3H9uztLDBIZz0USnfNjKWhFSUiGxJAQ
         GSUoCTJbmPqXr+CQ+gZztc6oX5oEbkyrqXVlhVkTZDcitPYiGNuxDqX6G7hfEy7ZCyZ7
         hOmihb8kKcmz28pn9bYW9i7UeXIDXDGFBw4e1bPMWt27a1TPfhl/9tDERa9+uXWT9ui/
         Qwng==
X-Forwarded-Encrypted: i=1; AHgh+RoQjtn/gX/QVkfYWWfhVnTJIKFWfBJY2cHdPt0uQRC7zLfZ8ZtfQx8yPSpVUx0tFLhzwYWQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0YdNMFif3l8LaeTQmDcQHG7bFB2l5stMXhmoxhDagPgICg2Eu
	LIBwAGSiIdesNw1b3IMZdQt8Zdvp5+AXZnUeUvsog5yZKXF2bwvStv/NJOdQRsM+bDgMUus76Cs
	Wxm3HXimdtQWTc8ok7R9Urdp5HUGnRHY=
X-Gm-Gg: AR+sD12vHyuJPraAYgpaI20XC+xT/oUo7uFnVz1SwcRPFVa5d5p+IgJTWJGuc2C8yRt
	dDyMWTcFPcykJdZAcIev4B318nwytc1c7cTuM92hcSJqYD9d62ji49nlSlhKOniNYxuvlmp1dl7
	uHLxrh7jF3SxDDx7eqNA4R6Sdmt7fCHCX0sie2YXyKvES4SYWqpR+dzWZJm++jbhYuJgguukq3D
	bDvQqHamxwyLDkCECZjc37vd9+ZiAjyz+TaKR7BfsX55urcSmHT1ncuxitBKDnJXZ4yqzZcp9lx
	sa7T1tVv/DmDsuxcfa0t28MzJuRbv1CrNn3aV+I6+WwDxWxyU2gKF/c6FqjdNXyIdH4fdPBf/mA
	9FUz34VAWk+y9ChOI9sWxesljhHiq2h+kyKa0ph7DsfsiU2IaVf/xgJ334rwS4cWFoE31Sjn8e/
	E2MDktM8Owsy5l7MxoybXPUrQawhizJQw9OT3cOnu45hDucICSL0cFYsSdhEnG47SVCQ==
X-Received: by 2002:a05:6402:e0c:b0:698:be4d:ca2a with SMTP id
 4fb4d7f45d1cf-6a034a398cfmr4241255a12.15.1785349107364; Wed, 29 Jul 2026
 11:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716205811.800920-1-rosenp@gmail.com> <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
In-Reply-To: <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 11:18:15 -0700
X-Gm-Features: AUfX_mxrjUfVZ84R9XbJRtIPW_yLO3WV_Dd3HDwSinvRF3cFNjojFlllhS1HjGw
Message-ID: <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com>
Subject: Re: [PATCHv2] PCI: xilinx: use fwnode_irq_get() for INTx IRQ lookup
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Michal Simek <michal.simek@amd.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 9:00=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev), 0)
> > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivalent t=
o
> > the previous call, but uses the generic firmware-node API.
> >
>
> What is the benefit of using fwnode API for OF only driver?
I get conflicting information. Apparently of_irq_get needs a call to
irq_dispose_mapping but fwnode_irq_get does not. irq_of_parse_and_map
definitely does.
>
> - Mani
>
> > Unlike irq_of_parse_and_map(), fwnode_irq_get() returns a positive IRQ =
or
> > a negative errno and never 0 (it rewrites 0 to -EINVAL). Store the resu=
lt
> > in an int and check for irq < 0, returning the error (including
> > -EPROBE_DEFER). This also adds the error handling the previous code
> > lacked, where irq_of_parse_and_map() failures were passed straight into
> > devm_request_irq().
> >
> > Built for ARM (multi_v7_defconfig + CONFIG_PCIE_XILINX) with LLVM=3D1;
> > drivers/pci/controller/pcie-xilinx.o compiles cleanly.
> >
> > Assisted-by: opencode:hy3-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: use dev_err_probe to handle EPROBE_DEFER.
> >  drivers/pci/controller/pcie-xilinx.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/control=
ler/pcie-xilinx.c
> > index 4aa139abac16..58532296182f 100644
> > --- a/drivers/pci/controller/pcie-xilinx.c
> > +++ b/drivers/pci/controller/pcie-xilinx.c
> > @@ -20,10 +20,10 @@
> >  #include <linux/of_address.h>
> >  #include <linux/of_pci.h>
> >  #include <linux/of_platform.h>
> > -#include <linux/of_irq.h>
> >  #include <linux/pci.h>
> >  #include <linux/pci-ecam.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >
> >  #include "../pci.h"
> >
> > @@ -535,7 +535,7 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie =
*pcie)
> >       struct device *dev =3D pcie->dev;
> >       struct device_node *node =3D dev->of_node;
> >       struct resource regs;
> > -     unsigned int irq;
> > +     int irq;
> >       int err;
> >
> >       err =3D of_address_to_resource(node, 0, &regs);
> > @@ -548,7 +548,10 @@ static int xilinx_pcie_parse_dt(struct xilinx_pcie=
 *pcie)
> >       if (IS_ERR(pcie->reg_base))
> >               return PTR_ERR(pcie->reg_base);
> >
> > -     irq =3D irq_of_parse_and_map(node, 0);
> > +     irq =3D fwnode_irq_get(dev_fwnode(dev), 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> >       err =3D devm_request_irq(dev, irq, xilinx_pcie_intr_handler,
> >                              IRQF_SHARED | IRQF_NO_THREAD,
> >                              "xilinx-pcie", pcie);
> > @@ -585,10 +588,8 @@ static int xilinx_pcie_probe(struct platform_devic=
e *pdev)
> >       pcie->dev =3D dev;
> >
> >       err =3D xilinx_pcie_parse_dt(pcie);
> > -     if (err) {
> > -             dev_err(dev, "Parsing DT failed\n");
> > -             return err;
> > -     }
> > +     if (err)
> > +             return dev_err_probe(dev, err, "Parsing DT failed\n");
> >
> >       xilinx_pcie_init_port(pcie);
> >
> > --
> > 2.55.0
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
