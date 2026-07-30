Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7F466B47
	for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 18:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437685; cv=pass; b=JydE8Q1K4DHbrYGvE8cOwO+Dp36GX1o4l9jI2MgiQhlFQ7RYUkRyAy5wPf4zMCnZuFJholWfgEXG3pF/IRVi9vP0PCOXBRjhS6cSpRedfmts+gqT1XC/i+FWA+HZqVT7kb0RB0IoNYyEHVvG/CxxymrmDLkGdbvdKxr36L9RVw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437685; c=relaxed/simple;
	bh=IkiGNHJjuO9hKYHK/tR6r4ZiK3H5t1JWZZSj7hulEqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLZJlmuFSW0R/N4c/loOfh+EJGRtpm84XoHoxqQC1OKsi/8oqEryBcU+kQRcjKIOcaeQzNUzhuNbsrX3wynmQkkx4EdhSfiJPoZQ73mBezscekl1iltDZT0lR5iQJ8pqTha8MVWChfc4M4oYo9Qa0VkFRAVDtGZ+x6LFSBTscz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvF1AgzS; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvF1AgzS"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so327427a12.0
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 11:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785437682; cv=none;
        d=google.com; s=arc-20260327;
        b=lhPcIZrOCJHc0Dk5pMtDNW5rpQaTrmOaKNNq+smvdgD93TivXr/U94oF/Op0XC2Ifv
         1DLorvLUMj68xljMeBah9CIeho4rMfUnbzekwihM4cgv8+FCZKKK9M2oaO2ngI5cG6+8
         LGw+OR5mDiGp5aHnx8kuXN9wqUvE6GUZJlFbk3AKFEWvFJVXVebBJqcCfuNSnMGUJlEs
         KtFkWwWM9H1LdIQjNirGta7m6fC6jdhHbd7w5MbqiWgk+C5bzgRxTEiVzZ92r37d7tf5
         2fPlRabmYHHszASRnfp+A6eKSOcvIIJlSVgAX0sF5EMV2PHpaozRlxxc1EQQozaeKe5J
         8TbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        fh=L8l0AuzXGXJEYWIpAEnr+jwcw6OtZKWEIHBfZXB4y+k=;
        b=bhjj2D32UbrhgrKo5O6eyXfibby3oMiFarQTFmPA+rLI4NcrDXIwoDidh3majNBuAr
         QVL1b6S+y5xkK3srAhswj5q4LnkvGdsK41IBEdX6y4jFVJO0upH6dQsbD78GI7A6uXi6
         U+P3D/MY0OoOc+VyUgyRdfN3ji8xMeXlUN4qiKvpG9csC3kgP7mv1itw8NIxnc4tx/Rm
         CUwd+XkLjfS328eBKGIXYksp/sojD54pMoBsmRglxjLJ9CJzIWRAmodLWHBldjn/EHlc
         HSl91Jws4vczKaqyYt4JkpL8x1/8UybSoSol5TKJ86S0cU2lGoRStdPrfvpuzDQJZc3E
         vRCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785437682; x=1786042482; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        b=XvF1AgzSTOgXsp49tzy+37l2F779+P18zYOtFpmPTc9hlUvjXydmgndBqXGHF7gM/m
         7N6TwRO+hCF7Y4wFWE8JPyX46WNDvdejdeRA+UUIXjqrxiWOe/ItIVwvG2KUpPVG6PbD
         u9PWOMwexDLcXwD+qXUs5QneAzqp2E7F7z6bC9g3IC+EfsKNf+asBw8rkHNJuyGCoqql
         ZOZBp3mH6VpNvbwtFDeOTxI49nRwFwO2rxrpE8OR30F1tOvJnI9okqPrVhW0X4mda6Ho
         UscVVfw4K05IxZJ6QDxfhp1Bb+vr6nd/AnDJYbm/NCsKyS6REfiCc/N17d3ChlkHADRd
         Pj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785437682; x=1786042482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u97Ilxc+wS2K+t2W8mxBSQTwx/SU+RUBSrYOhBVp320=;
        b=B51WCHBB9CGVq639xUdUZKYJjBKOw51hFqOxNsqUioIAWupKWJbnBt/o4+FgcyWXFU
         7tP6kx+0sTzMgG9k4qUFioJC2sT+jLXsqDXZDv6+o/4vxwTBqMgoSmLBDGs28vgHX5OP
         VpWdp4er84lHkGrnpU1Xs93e6/T/Xw9XLwxqXd4iVSUddiUXWRT0jp3/+e9D20I2SvcM
         P6FFFGo5uOF3O3H2WqHM2R4mb+XadjEVgtJQOEHVoGF7+7aQL2wwfzfkOkVQ3BtzEO50
         +0tQXwJo1UYAA2SE52K+m6Iy9T9ZtjSv6GQVnFb5rFgr+DpZD9oaJ4E8r0x7NJlpI/3U
         r89g==
X-Forwarded-Encrypted: i=1; AHgh+RrO7l5iubFkYjgfLWGTaAvDDqnmhXhNHo43+VieF+Oa+fVmOvmLpHDyRWOHpmNwRTaSXV9F@lists.linux.dev
X-Gm-Message-State: AOJu0YzyZyZ6sxrM0FRcUMfddQJPW7ICxKLo2ZEDSImmyRlWcanrzgaC
	AKn/nMj5ao78vA60VAqB2NR6IWjxRmYJaAj6qAZYg8zj22pDlYxcdPlVMWjTSiZz9AYwQB1/wG9
	9zTbYMRH/G3TeooiwFz4vAJsOpqatKGY=
X-Gm-Gg: AR+sD10UOi1iEzM6HXzWupZuCevDlzA63G8viLFrK90WtrREpGyLg7mDFd6E31e08ww
	kWLvkGzBJuDDL3Et2d0PVvuMEqRO8sdU7qhZUtXTJCHRZdO4zDhqVn3cMZAqWETTu4GcXfYYl0A
	xD04JLxtPrxO4GOsovC/0Pylj/Lx/gRETkLS3B+VaRxdRw7sTYiUhC1f1B0z4MFsWgdmmQ4LP1p
	lTu+MdA1bBZcrwlFemJ24L9iTKqQR45exYjpPiK8ETRgzA1xaYaAWNOn9/wXDZOEMWB7DLZ+fjh
	2c5owQh7j+l4UOehc20u5CPE6YoNNpZYFU605BlJ1tO7GBy6ZjdyrIYxMS+73Cb2nhCLlZUe/xH
	4W9BdGsyPims9ETAKzBWJXoLWJojdQ0kXwZf6agwd9l+VqedIz0t7m2WfVWpwxNo5EpsOgU/iq9
	plEZU4ic4hqo4OHAxXEBoeWmM5IaS+UuQQ3vjrCHd8ypDlw1SdA9580uCyKP3IaKlnig==
X-Received: by 2002:a17:907:3cc4:b0:c1a:5d49:f9d3 with SMTP id
 a640c23a62f3a-c1fa5845675mr174898466b.47.1785437681452; Thu, 30 Jul 2026
 11:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716205811.800920-1-rosenp@gmail.com> <g3gtckpqgacw44jqqb5hb3oejpelxvbba47tdwsvksxbbskygp@mcwtsbypoyar>
 <CAKxU2N_f1nN4Oo94V9MY6Q-wp66j=3kodfMs0BeXVGB9XivvNA@mail.gmail.com> <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
In-Reply-To: <5ea47pp3ctiieqahn3mkcg3dqrlmwdgdjyv6pa65qmjuqop4lb@tbax2lojuwkr>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 11:54:29 -0700
X-Gm-Features: AUfX_mwQA3n8phj6W2IouoFwXDxL9pe2fUfCvfsSUCFuG6D4skJUDTBpP3OqTjk
Message-ID: <CAKxU2N-2Vj1pugC_L=jhMS06CA34_-a-txZCrAoUtrRwFQ1Stg@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 8:48=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Jul 29, 2026 at 11:18:15AM -0700, Rosen Penev wrote:
> > On Wed, Jul 29, 2026 at 9:00=E2=80=AFAM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > On Thu, Jul 16, 2026 at 01:58:11PM -0700, Rosen Penev wrote:
> > > > Replace irq_of_parse_and_map() with fwnode_irq_get(dev_fwnode(dev),=
 0)
> > > > in xilinx_pcie_parse_dt(). For an OF-backed device this is equivale=
nt to
> > > > the previous call, but uses the generic firmware-node API.
> > > >
> > >
> > > What is the benefit of using fwnode API for OF only driver?
> > I get conflicting information. Apparently of_irq_get needs a call to
> > irq_dispose_mapping but fwnode_irq_get does not.
>
> That's not true. fwnode_irq_get() becomes a wrapper to of_irq_get() if OF=
 is
> used. So both needs a call to irq_dispose_mapping() in the error path.
I don't see  irq_dispose_mapping() for fwnode_irq_get() in the codebase.
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
