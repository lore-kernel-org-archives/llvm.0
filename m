Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE4F2374E
	for <llvm@lists.linux.dev>; Mon,  5 Feb 2024 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139335; cv=none; b=F1PFCD7KGLRsm/+/D9aYD9E3Zw9SafB59J3QBsp3Ruvw8mNNBj0V4+nf3qWzX+baJh991Dxr8OEZSdS5frjuwu3FgH9j+HaQks/VVIgZBODPwgONcvy600JJLS/fufaLE+OB9TN7SMlnvHhO+HBm4eAZQ2U0YnTTn7VDq376bfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139335; c=relaxed/simple;
	bh=MM5/PVuu+Ozx/sCBwUh+DYuUf420ZVMqN7zEjFxWg8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWOosYEjyT1QpuCa/P3JtHpSkvnz+foyZ8j9EeXz6t6RtnPS50Pl/pSsZSWA5PFhRVwkpgnH9I6vzYZCnRRMKItKvlqM0gME8DkS0JJLSIAgqhu1nEZLdcv7NntovkhVF4Sstujuhq5c36xpIg/XBl8JKeTvuMODdlsxH94LW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIb4nciE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIb4nciE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707139332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIOs5oLKwmUHXU8QbeznJvmgtQddL9JBz6AuSst5Dak=;
	b=MIb4nciE7zLNwGqW5XiJhV0/2ZlqfMZfpFqhFZ199Eo6DhA+S1Xn5O2t8jFPa0ONO/kfSA
	PTQFEHPB07RafEblBfeZ81/IFojr9U4A34y0IUefHsGvetz/gl02m/PvhtIQP1TN+vqWXi
	0awSRipJwlOzPILnwpCGFYBZV4qiUPo=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-dqv3IpsDMSClW-REHXlYyw-1; Mon, 05 Feb 2024 08:22:09 -0500
X-MC-Unique: dqv3IpsDMSClW-REHXlYyw-1
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-46d3b546328so20687137.3
        for <llvm@lists.linux.dev>; Mon, 05 Feb 2024 05:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139329; x=1707744129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIOs5oLKwmUHXU8QbeznJvmgtQddL9JBz6AuSst5Dak=;
        b=lmavYeOX8E9wGE8/6IUnVwlPCSmtNGFLXlWDyGpPwtKlRb2TkDZXHs5zizKq6+D9fI
         YQfxOM8+WQtTx5K8ZWa2XGK0CgvCl18VuT6H/Z3/AT3+X7Uwehq8mTRC6ZDlQMKac03l
         Cjp0T7dAiM1JibfDL8D5hU9BSzdbS9KCEOukhDVHDFLTSadAVZ5imaa/LtQpk44/g2e5
         r+eT3ptBL83GKvPniArTKN94TRrm8xQtyWIRpnBfhAN2dNdhFWZK+R8d0hToJm3BOMtG
         gCd+FozIvrnwvNKm3FtV6P/FDHQ4mhnsT5y56WzzKvMeXygl8vj1zALegKqJZWSTqzuL
         /edg==
X-Gm-Message-State: AOJu0YxAUt2v1v5CO6nd7uCtJAYe9HNGS/WOIBW921eUGT9QbgOKfsPA
	NjdAxvYXbQhQOpPGf3hlpT2iqEKmsSiZC0D94zV9CYauFiDYcLPAzKj79xA5JK/YpAti5VQgQM4
	EfzDQLtuVngSQQGlpwkjmPLjaQpZ3k7FglE0XCg34kCLWT/EN7hiW/uormjwdLFw6d2Swx6mPBV
	lFBw7+V50+oWJ+WOluMFeBWPys7g==
X-Received: by 2002:a05:6102:227a:b0:46d:25b2:45ca with SMTP id v26-20020a056102227a00b0046d25b245camr2430379vsd.3.1707139328786;
        Mon, 05 Feb 2024 05:22:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTqYUjiIYeYl3PqTmLdMiBhcx1hHiK2OI7YlynV/pIuRwn3MzuIAwA1MFAoxSSU6bLHrFbZTOiRaU2u8nol5U=
X-Received: by 2002:a05:6102:227a:b0:46d:25b2:45ca with SMTP id
 v26-20020a056102227a00b0046d25b245camr2430352vsd.3.1707139328286; Mon, 05 Feb
 2024 05:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <ZbjHTMhQ4Z9lRR6L@t14s> <87v873870m.fsf@mail.lhotse>
In-Reply-To: <87v873870m.fsf@mail.lhotse>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 5 Feb 2024 14:21:52 +0100
Message-ID: <CAASaF6w9SRoj+Kn6=UaReBNNfL_rrKo-4rvtCj=iF4Nd3Zpw-g@mail.gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 12:50=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Jan Stancek <jstancek@redhat.com> writes:
> > On Tue, Nov 21, 2023 at 10:51:34AM +1000, Nicholas Piggin wrote:
> >>On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> >>> crtsavres.o is linked to modules. However, as explained in commit
> >>> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> >>> and always-y"), 'make modules' does not build extra-y.
> >>>
> >>> For example, the following command fails:
> >>>
> >>>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3=
_defconfig modules
> >>>     [snip]
> >>>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
> >>>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fi=
le or directory
> >>>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/=
cell/spufs/spufs.ko] Error 1
> >>>   make[2]: *** [Makefile:1844: modules] Error 2
> >>>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: _=
_build_one_by_one] Error 2
> >>>   make: *** [Makefile:234: __sub-make] Error 2
> >>>
> >>
> >>Thanks. Is this the correct Fixes tag?
> >>
> >>Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
> >>
> >>Hmm, looks like LLD might just do this now automatically for us
> >>too without --save-restore-funcs (https://reviews.llvm.org/D79977).
> >>But we probably still need it for older versions, so we still need
> >>your patch.
> >
> > Hi,
> >
> > I'm still seeing the error of crtsavres.o missing when building externa=
l modules
> > after "make LLVM=3D1 modules_prepare". Should it be built also in archp=
repare?
>
> Or modules_prepare?
>
> Example patch below.

I tested your patch with my setup and that works for me as well.

>
> cheers
>
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 051247027da0..82cdef40a9cd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -59,6 +59,11 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>  KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
>  else
>  KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> +
> +crtsavres_prepare: scripts
> +       $(MAKE) $(build)=3Darch/powerpc/lib arch/powerpc/lib/crtsavres.o
> +
> +modules_prepare: crtsavres_prepare
>  endif
>
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>

