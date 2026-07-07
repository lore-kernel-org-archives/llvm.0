Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5E3BE14A
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783454252; cv=pass; b=RzHMbiGyF1R/l+eY1n7F9EZgGt01lGLKc5v18Sj5CCVY+UqA54OYzTspDqAzPU9p/i4eYOmob9NiCNCMmMZmYl+8SXUYm10Kee50RuxouMqVbnqV5WGnwKe0XUbA4OIcsxobAIWU8h/8hvcoicsYR+wmE+sMBPcvFiHO1NoHx1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783454252; c=relaxed/simple;
	bh=+4LGUwruSca6T/12Q76TuwR8e5qnyL223i6zRC1/Kh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwatzfVLOlZmdjyOsg9DYG0tFFJzdsKOWpOJJeiaSs00N/xMQIRAgrzycEi17zp7t3XYdxZnD45Dkz854tbhfERJCcOHr0wOZUa8OthRC6MrlCrOFJT8OSn49DFrlA/m11kcqzNWDkfonQPtNRtmTIztF1zkMbn07bfGx+d/EIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhjyxEEm; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhjyxEEm"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698b558a792so45816a12.1
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 12:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783454249; cv=none;
        d=google.com; s=arc-20260327;
        b=hEnjj5YOnBWmfE1HRNIaaeB2HaendwG3p4kDtz0gweASeiTuj8Nv0E1z3eERtGPd2t
         EsAnHEDIFs4yAK6bt2cwYyIoC6hhZnDAZs4bwxvc+EPamIqHEIjhFDSRZUD6dBAvWbIl
         B4ja8mLoar9aIBAaA81hDdrZqjXsz1/cXdQLo0NZ4ubEQAfVkgL/CU+FMiFwv4QkPGpa
         n7h8YNn0VMJsu2cCWRlfStYv4cWEAui2v90NsCU6J4StBx3rV/I8yyr25YrUfwqwFM5+
         J8P175EWRdsfmDa9lmeU5kA3u073HNihkw1UBfD5T0NI+whTpZ0lied2Fv0y4i6uhUqx
         Maiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6fd1+Z+F0tbkYg37tULYg3QGW6SNWpeWQyaq5mTNYc=;
        fh=I//1A+XlwXeaikcrmr2TILaX6S9ZB34D2V/QE4PtiQE=;
        b=bu02gwi19yXs0AS+/ZMZPOXtglXtd2wEGhtHm8LhnXBDvkPZ5FnpYINsyY5W2g+eAh
         TnTv/C9H/Y+Woy6/1W5lZLRhCcfm2dd51oHQ/Jc5H02gFQWLYWX1L2imm743q1A3xz3Y
         GApheeBJ1EPAHpdy86dPAcg2v6q/ehV9Stq7NU6LkvIlneq2uEHo79pNboy1ccIXYAYc
         pQ8gAIfqoUDNrxhnKr5AuPaFJ9/WUG7x7Q6IV8e/iwOxp55YiqN7JrimTMLA3KoddlIy
         drBRdDJxgYQDXN303lMykt2IGX71kXeJdZFV/R4vZOykjOTlhYEaWj/VMrVRRYUGyItx
         GSLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783454249; x=1784059049; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N6fd1+Z+F0tbkYg37tULYg3QGW6SNWpeWQyaq5mTNYc=;
        b=IhjyxEEmqmhsI5mW8Hwr3r1AgXOfogHEcuWJUthJg25bYv3oiypljiQHI7KjhRigEt
         pOqvrLJXqqJtmKukv1SfAdqO7v3Mu2Va303Cw28kvo1m8jcb4ryq1A+PZype/BJLAMZ4
         HcnlaylZAegnmrWpJiBdiqhGCWen6gTpmqCgEWbJxhb4JSC8chpcfIwnkUntUDudEKxv
         i1Hzu+o7EGXqDuGGDq9a8BNqLmNpycA9WTRc+pmsLNKONV/Xh43RYiwUL03k/4+UNzyy
         rsfmo2BkG54Z3bVL4oVmTsV6NAr3Hyay4orW3zXu+CcQrCNMSJ+W0j/1fOBpr1atYRso
         /TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783454249; x=1784059049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N6fd1+Z+F0tbkYg37tULYg3QGW6SNWpeWQyaq5mTNYc=;
        b=RIo3lIo66xN/JW5MCB20pXyHa1Xq/VwB0KncPnfuJJIjxLXvmEjcXGTDrQS3tjCeuk
         WU/B7irJbMeq8A7zAEA2Si8VOYal4ekDfx6kNBmu+ZVBbFHGPF6dyw2YuExhZcOi49xv
         wSo0JKaDWsqOETWlpfGxPYpjiFnywPPnXGdwwyNZWBvQWdYdbhfJm5cjMIXR5ka3UNA6
         h4qvib1UyBR65cXB2MWBmsD779GyTVWlHsDzOMF95SBN0rZRltr9HQIupBrtFFmo1+NL
         4qauRl4TuSxowYrUo5XkdxFFvq9jAKDwdqFuyQrpKX4CFRCzy/uDzBG6THoDIzJ9V6Z2
         HHJg==
X-Forwarded-Encrypted: i=1; AHgh+RpFqk7aOlJx5Lv8CpeMQDDe6wfKSPYwVGC1i36M0u/DJdEiqz33hLA9roUv9eVntYLyUrnL@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl7j1Xwwva/FOF3MTE8zvQbdAPWaAJ5z/7NRVfDw6y90d7K+8R
	m8KAYcUEf2jPGR6vRH6IpfYguB+i17AYZ1on7EcQasU8uP/hvM97JqGLYMGYgM/HHiwa6otkkSJ
	DQ+qO6pw2wFBv4EdHTq1CR08J7Lqiqtk=
X-Gm-Gg: AfdE7cn9NwBPUE3W4qCYjKtCiwYULpnLZgCGucvRq29rltY4/KrZRnx8nHuoQOcJLFa
	GHaWN5QP5c6wSrs5v2fHD+xF3WWARCw9LYeh/BKNO9pJLLXtn16y+KJXy9xQpemmemIvFN+e9DP
	R3wBRg1iDsyaZlXHE4qh1YJBFhEYJrVUvKFDiOanDuOfJrtVcqkI2xSxc6tA1hH1eIOhxyrbrbZ
	5Xj6f9GdV/ay3niEs3wWS8qVIfOZFH501KU0bt/QE+T3IeoAJFYJnuYxbeFZkp1UM8aeMZ7Z4ZG
	UgPxnxV5rozrsNMzAtxu8VDbcgD3IIal9QdAU1iL1j15I6xGS+XRRKnuTXWBTf2g8YRadk459dS
	KTGmZDAb/kXOqWclYXou9gy/dDm8=
X-Received: by 2002:a50:c908:0:b0:695:dcb2:7438 with SMTP id
 4fb4d7f45d1cf-69a85bb6f42mr2799076a12.28.1783454248743; Tue, 07 Jul 2026
 12:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528201250.135691-1-rosenp@gmail.com> <2026070710-bronzing-handwork-33fe@gregkh>
In-Reply-To: <2026070710-bronzing-handwork-33fe@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 7 Jul 2026 12:57:15 -0700
X-Gm-Features: AVVi8CeaIqRF6fJFEAyvv0HZBSS_tjuP3_hlEWu5a78DgN_764QeXBU9rnOAp_I
Message-ID: <CAKxU2N-3AFcyPPuoqQXoNvAO4Ht1Lunhb5q=qdBXYnYLnaH1cA@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_pci: fix -Winitializer-overrides for
 Brainboxes UC-260/271/701/756 entries
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:21=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 28, 2026 at 01:12:50PM -0700, Rosen Penev wrote:
> > PCI_VDEVICE() expands to set .class=3D0 and .class_mask=3D0, but the Br=
ainboxes
> >  UC-260/271/701/756 entries immediately override those fields. This cau=
ses
> >  a build error with clang -Werror,-Winitializer-overrides.
> >
> > Fix by expanding PCI_VDEVICE() manually, omitting the trailing
> >  .class/.class_mask zeroes so each field is set exactly once.
> >
> > Found with W=3D1
> >
> > Assisted-by: Opencode:Big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_pci.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/82=
50/8250_pci.c
> > index 3e5bc9e8d269..0513f4b3c093 100644
> > --- a/drivers/tty/serial/8250/8250_pci.c
> > +++ b/drivers/tty/serial/8250/8250_pci.c
> > @@ -5394,12 +5394,14 @@ static const struct pci_device_id serial_pci_tb=
l[] =3D {
> >        * Brainboxes UC-260/271/701/756
> >        */
> >       {
> > -             PCI_VDEVICE(INTASHIELD, 0x0D21),
> > +             .vendor =3D PCI_VENDOR_ID_INTASHIELD, .device =3D 0x0D21,
> > +             .subvendor =3D PCI_ANY_ID, .subdevice =3D PCI_ANY_ID,
> >               .class =3D PCI_CLASS_COMMUNICATION_MULTISERIAL << 8,
> >               .class_mask =3D 0xffff00,
> >               .driver_data =3D pbn_b2_4_115200,
> >       }, {
> > -             PCI_VDEVICE(INTASHIELD, 0x0E34),
> > +             .vendor =3D PCI_VENDOR_ID_INTASHIELD, .device =3D 0x0E34,
> > +             .subvendor =3D PCI_ANY_ID, .subdevice =3D PCI_ANY_ID,
> >               .class =3D PCI_CLASS_COMMUNICATION_MULTISERIAL << 8,
> >               .class_mask =3D 0xffff00,
> >               .driver_data =3D pbn_b2_4_115200,
> > --
> > 2.54.0
> >
>
> Does not apply to the current tree :(
This appears to have been fixed in 426e83cab1f5d53069ac7030cb03e2d7c6367ef1
