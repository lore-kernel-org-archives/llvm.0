Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFB38F
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 05:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F775C341D0
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658727739;
	bh=cp0CiWhsLOGiW6ay0talOFoY1ercg5rJDsTxsaScIAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hDa0wwPGjZkjiOUXLx/2awdt3wj8wnZMWLhhtIx85Srlz0LcMT2epDwOsxi9ue8fV
	 lStxdSBgg1/Vt5ntVDEW2uY9B/A263sYzkLHv8e8KSU2np1/Qh7jNuSDG3aoLyjXN4
	 odE4c2LScIhwX5eNA95J8jo0lNmEPp7M5ByUGhQOhgpbSPa4NeofDPxU2A+k54l3V3
	 7tcVmUHFsjhwK86DM2VMfsAVyUn1HjktA3UCSpJ8XesMzv941mTgHNcUeBwyG24mq5
	 HSLs6t0PdHVw0rOckTR9mwsrfQoDMkPpoN7uFvB87y2nxpvj03EJqpUuNFXaO1U6Jx
	 4orSdV7CH/W3g==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-10d845dcf92so13475234fac.12
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 22:42:19 -0700 (PDT)
X-Gm-Message-State: AJIora8+ftfommdMGu1ap2fA2lpwXFGwimDMln8NF7EQPbOUwP7AFZQQ
	p/vUyj+QC9klnwIsRtD+snczOhh5647xJyA5750=
X-Google-Smtp-Source: AGRyM1tG8EBiQaGDFyadERDa/uZZl7iZWoVBoNcGM5gjlO8yt0f+Dfu0x8Gs/pEBIq77wyrns6nMAfxIROf3WstNzv4=
X-Received: by 2002:a05:6870:a90a:b0:10d:9e83:98a6 with SMTP id
 eq10-20020a056870a90a00b0010d9e8398a6mr8869444oab.228.1658727738555; Sun, 24
 Jul 2022 22:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207250449.BYMZbIA2-lkp@intel.com> <Yt3KObFVIUI2mFGt@zx2c4.com>
In-Reply-To: <Yt3KObFVIUI2mFGt@zx2c4.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Jul 2022 07:42:07 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com>
Message-ID: <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 6874/8723] arch/arm/lib/xor-neon.c:30:2:
 warning: This code requires at least version 4.6 of GCC
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: kernel test robot <lkp@intel.com>, "Justin M. Forbes" <jforbes@fedoraproject.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Jul 2022 at 00:40, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Ard,
>
> On Mon, Jul 25, 2022 at 04:14:48AM +0800, kernel test robot wrote:
> > All warnings (new ones prefixed by >>):
> >
> > >> arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least v=
ersion 4.6 of GCC [-W#warnings]
> >    #warning This code requires at least version 4.6 of GCC
> >     ^
> >    1 warning generated.
> >
> >
> > vim +30 arch/arm/lib/xor-neon.c
> >
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  16
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  17  /*
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  18   * Pull in the reference =
implementations while instructing GCC (through
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  19   * -ftree-vectorize) to a=
ttempt to exploit implicit parallelism and emit
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  20   * NEON instructions.
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  21   */
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  22  #if __GNUC__ > 4 || (__GN=
UC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6)
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  23  #pragma GCC optimize "tre=
e-vectorize"
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  24  #else
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  25  /*
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  26   * While older versions o=
f GCC do not generate incorrect code, they fail to
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  27   * recognize the parallel=
 nature of these functions, and emit plain ARM code,
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  28   * which is known to be s=
lower than the optimized ARM code in asm-arm/xor.h.
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  29   */
> > 01956597cbc46d Ard Biesheuvel 2013-05-17 @30  #warning This code requir=
es at least version 4.6 of GCC
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  31  #endif
> > 01956597cbc46d Ard Biesheuvel 2013-05-17  32
>
> Does this file need a depends on =E2=89=A54.6 thing in Kconfig? Or is som=
ething
> else happening here since 4.6 isn't even supported by the kernel these
> days?
>

Hi Jason,

This is explained/fixed in

commit a69cb445f7d129abf7c50d48c8a8eca7c8d5df15
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Sat Feb 5 16:23:46 2022 +0100

    crypto: arm/xor - make vectorized C code Clang-friendly

    The ARM version of the accelerated XOR routines are simply the 8-way C
    routines passed through the auto-vectorizer with SIMD codegen enabled.
    This used to require GCC version 4.6 at least, but given that 5.1 is no=
w
    the baseline, this check is no longer necessary, and actually
    misidentifies Clang as GCC < 4.6 as Clang defines the GCC major/minor a=
s
    well, but makes no attempt at doing this in a way that conveys feature
    parity with a certain version of GCC (which would not be a great idea i=
n
    the first place).

which landed in v5.18. Note that the patch depends on its parent,
which touches many different architectures, so it may not be
backportable cleanly.
