Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C28F366566
	for <llvm@lists.linux.dev>; Wed,  1 Jul 2026 03:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782875476; cv=pass; b=p7U8YA2LfVCouHXmfvTM1wO96gwjwX15poNKM5PDt6hYeRsOnLpEm0vnMcS1vDmZW3KNwcZLCCHnZRCsV8MQuQKtNA5Gxzzh9o8gdCCgHN9ywerMo1hxw2Hc2KPqBjy/Uotp1dcKcNsVTKvXlyZCr5mgPkt+Uj8vAY6zvBTkkxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782875476; c=relaxed/simple;
	bh=0uOca1qt2gUEPBJfSHH0c1IQv17V7spgn+tiXL+gnJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOXsLWoEdpKWYYE3Ig50VDy8g7pmU5ag90TiH5aH3DZQC9qtrq47oXDFq/7KHr0/lI0FB9q1H/KjwHyXzHXkM7044JIi69bmdkuws0X3E6Axr3Lz/8PqDcxtRxVo1qBQ1exzSyw+WCY5ywcQ/do3tjNDCkAJAEp4gCp8BFoE2Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hoYl57Za; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hoYl57Za"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9f6b94a49so112474a34.3
        for <llvm@lists.linux.dev>; Tue, 30 Jun 2026 20:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782875474; cv=none;
        d=google.com; s=arc-20260327;
        b=kASRjHvoidSRyy2XzgbpFZKQZoATHzwGmy+Ucg8SMk3Edy66UIiSi5OShCus/C5LW3
         3n9dbf14uewFb4iEM4FaG5n0LwBkPpYCnsxtzc6BGj2D0KorJkOqfXArO6ULs762BPPQ
         4BChQZ8Qa/eP5qPTUwhXcZqvRQwmLzYz2q8PyiaSHfEKV+0XYgO7S9mK1bfUiHHEKwbo
         Fq1aawzEMQnuC0MDeYzWACfMg0TqHTT0gmzssPGDc2EsIGlipFidW+MDjyLDQSK2qDxt
         bcXqTmATExH0Jjbc0BVbNTPnrQPLdDUJ3hHO9EJFL02BdlowwFS1athG7nAEfDGosv3H
         XeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        fh=1/lW68LwsH+gskr1FIfwyHnPD+03zqWGAd/fTiFJS3g=;
        b=C5GvHs4MDFYloIzZZKmDewm6KA6OOKl6RpBc1IDs4QASc5OCp7FeiTMcnJ+kxrCFuv
         oYhWnDniuPsTZPQK8ChVYQ75lQzbNm2Up4YtYMSC5LIeIXLxZR9OxjGRZmOI5mxuPC4a
         xqiL3e2PPtlC+3RCfJkwWLEyH49dHYNeNXRBKgWFDrRD6zt3GxtSBr3G4kvXi13qeqjD
         R19lMn6s5y5EJZ7/45H/zWufoR9+W4DTf0BYWucB8SK20kKbsexUn4lJ9ePH+yI8RpFB
         FHpaVDhaNVFJ978MqNJdppBVBL63wwvG6Bpj/2pOQiN2G0opkhpNNDoF0yFhGvXWTCLo
         ri8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782875473; x=1783480273; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        b=hoYl57ZajTmSdrGBG8M1eZsewnOto94rE2dUreQ9OiMAIwvDhezQuIf/iwjYKHP0/r
         WDRuJTGukH+fQ/5QlYijcLUb5Q/j3dWe3FQbztUYpJquykVkOvsj40y3dtY2rZ7FaRRt
         IjCG6uEbhp4D/DW1p9Yob4akjMT6MM0MG1TLYWa6xoGs+pPM0nW7ttziKz4u/msZk6UI
         caedjGbO9nMphI2D5t9dFHJUI5wv9Di11IGRMFmMuas7iTjER9dwArUgfefI4viSIGv+
         Uw+B8791aJ/gLcEhnbvE1v9DsXFObPCZa6vKHawWspkPQOcNdkSrHLDBMjLBSPV19gtV
         V/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782875474; x=1783480274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AW+XVWe2JL0df9uuAdxaZgi837urm1REze6zO62j7wg=;
        b=SiGBOnfeM7G35QGOAAoPBhohQzsRePzYaZ28nW9j1ZI0yrrQ71B8m4fGsqDvNcVmx3
         8nHax62VcALhqSIPd8d+nqEeGwyEIEkYDqOFH/52sbe8SoRflNJyUWGJN5XF7yHbZz+J
         +C7WM7g5MCO02Et6iVbNCILPW2aXxflfA1+fsRomFZJNcSYRkcz0kSOgkxt92jllmV6k
         3XMglftzwBcWLND3XNcGJhy9dECBPusE3QaaV+YcnqyQmcVEn443gxnqUqXArBXssOf0
         xNXtfIAvpRYdUvEHUF5q6zmR54/uN+qIKY0bI3B95ULcTlmgQxL9CrlK5izQLRs53Y9s
         zO3w==
X-Forwarded-Encrypted: i=1; AFNElJ8UrKSrhh3dKhQ0HyTpdxDxm+Wl6jfw56Qogk3gFAJrbMs6k5qBz7DEmwzn/ZZMUmlXBvsf@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7hGw+keF+mSaVHYgvoMGfX9lnWFDYlD7TFjuETeJS0OexV3ZS
	bcypzeA2nZsdpuZf0hMm8nRQH107VwkSqz87k3BGoVVdULKgaWl3v+LMZipmTlZ2npDzUm+MgYg
	B54Qm7ETm+5SgKZhbeCbcLhzZcDV+ViGv736wRz1Dow==
X-Gm-Gg: AfdE7ckeqfYVUdXTz6MtoWr2BEK7MdjhNNiVkz4qKKfnvEMdlufxo0UaJY/FoZ3AYtf
	m8ubTSE2QZPP1SkXKb74aKR5XqRKjJjXM/Lfji6gYawLdkGIJ0KX4bMPyWv5AYOdpbXB8elBlrL
	sbQl4QoLgrFopse4/xXCQ9SsLOsjcd8pU3mtlAcja2RkC+ilE/molTTOoAeMNigL5iKIcYXX3tE
	M8EDos5CUlgkGSHqLihWW4h+A+5IXrBo/M3qPtmyA9el1ksFqWL8Fdf5sOBx9w3a+7NWlVI6o8=
X-Received: by 2002:a05:6830:4901:b0:7dc:c4ae:a689 with SMTP id
 46e09a7af769-7e9ec586d01mr4829708a34.2.1782875473497; Tue, 30 Jun 2026
 20:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505062026.91724-1-cuiyunhui@bytedance.com>
 <20260505062026.91724-2-cuiyunhui@bytedance.com> <3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com>
In-Reply-To: <3720c3a4-cc0d-4ba8-97ae-35def0189e2e@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 11:11:02 +0800
X-Gm-Features: AVVi8CfCZ39PlUVHuhvVesQ30Ayu5byi3NLY-dGR5ZLniizemgTSehNq4vDg6QE
Message-ID: <CAEEQ3wn8AFVqWZAiXfQd4a1ZzH=2L8qRX4W3S=KcmQ5FORjn+Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, pulehui@huawei.com, 
	puranjay@kernel.org, Thomas Huth <thuth@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zong Li <zong.li@sifive.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Thomas Gleixner <tglx@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, seanwascoding@gmail.com, 
	Andy Chiu <andybnac@gmail.com>, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, qingfang.deng@siflower.com.cn, 
	Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, May 5, 2026 at 2:34=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, May 5, 2026, at 08:20, Yunhui Cui wrote:
> > The RISC-V PIO helpers derive I/O addresses from PCI_IOBASE in ins*(),
> > outs*(), and ioport_map().
> >
> > Under configurations where I/O port support is not available, these
> > expressions can still be formed during compilation and trigger
> > -Wnull-pointer-arithmetic warnings from clang.
>
> If a driver attempts to use ISA port operations in a configuration
> without CONFIG_HAS_IOPORT, there is a NULL pointer warning because
> this is actually a NULL pointer access that will crash the
> kernel if the driver is ever loaded. You should not attempt
> to shut up the useful warning here but instead make sure every
> such code has a proper 'depends on HAS_IOPORT' dependency.

Thanks for the review.

I agree that NULL-pointer arithmetic warnings can point to real missing
HAS_IOPORT dependencies in drivers, and we should not hide those globally.

You are right about the generic ioport_map() change: the helper is already
guarded by CONFIG_HAS_IOPORT_MAP, so the extra CONFIG_HAS_IOPORT check is
redundant. I will drop that change.

For the RISC-V ins*/outs* helpers, they use PIO-specific fences
(__io_pbr()/__io_par() and __io_pbw()/__io_paw()), while the asm-generic
helpers would go through readsb()/writesb() and use normal MMIO string
ordering. So removing them would change ordering semantics.

I will keep the RISC-V helpers for now and only guard the port-I/O
variants with CONFIG_HAS_IOPORT.

>
> >
> > +#ifdef CONFIG_HAS_IOPORT
> >  __io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
> >  __io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
> >  __io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
> > -#define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, =
count)
> > -#define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, =
count)
> > -#define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, =
count)
> > +#define insb(addr, buffer, count) __insb(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#define insw(addr, buffer, count) __insw(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#define insl(addr, buffer, count) __insl(PCI_IO_ADDR(addr), buffer, co=
unt)
> > +#endif
>
> Can you try to remove the custom accessors altogether and
> use the ones from asm-generic instead? These should already
> have the correct behavior all the time, in particular they
> already come with the correct #ifdef check that is apparently
> missing in the riscv version.
>
> > diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> > index ca5a1ce6f0f89..d799e5ccc9437 100644
> > --- a/include/asm-generic/io.h
> > +++ b/include/asm-generic/io.h
> > @@ -1205,8 +1205,12 @@ static inline void __iomem
> > *ioremap_np(phys_addr_t offset, size_t size)
> >  #define ioport_map ioport_map
> >  static inline void __iomem *ioport_map(unsigned long port, unsigned
> > int nr)
> >  {
> > +#ifdef CONFIG_HAS_IOPORT
> >       port &=3D IO_SPACE_LIMIT;
> >       return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
> > +#else
> > +     return NULL;
> > +#endif
> >  }
>
> The function definition here is guarded by the #ifdef CONFIG_HAS_IOPORT_M=
AP
> check, which should already prevent it from being visible when
> CONFIG_HAS_IOPORT is disabled.
>
>      Arnd

Thanks,
Yunhui
