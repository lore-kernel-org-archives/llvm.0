Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA5A1375
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 12:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA13C36AE3
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658752915;
	bh=7DDTMdWn3WP4svQtD7OQOkfSMIfIORyHCjYX5wDTKps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mPLBmCJsvY0ZzcKKmEBxdDpkFZuaAGIflnNNG+GyZFrWHetkMF6rk5l78m3Nbeda4
	 0R/qVLqf4ODrbzH/DfcpmiXp0/Nhzl0+MqMRiyQZruHNKUHT4oD0qkgEVvLztW4zlG
	 3e4a6z6Hzm4IAHa0KMd1xtl1q/OlZLYaWs7IlA1g0r94E9Fu5bQu92x/MuBUtnzBZ5
	 pJth2PkHRu6C2XmJAefkzgk7SOEEqovYhfUb4Dha29lAh2IENy9+HK36gdLqUVCdPV
	 O3yFmdG2OLxg0nPNZ9SzwrCe3bpgi7BGg3c1lDb77m+1OKmiYtP66xD1aLi5byFN4p
	 8ST/SKYM80a+g==
Received: by mail-oi1-f169.google.com with SMTP id v130so8091082oie.13
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 05:41:55 -0700 (PDT)
X-Gm-Message-State: AJIora+PSPUq/lWZYyUCf3t5prAhK12W7LQFOoUcXx+ugFab4sfJ6xMd
	G+HHnad7MR0tvM9UCp4Vf2n7eotFPOxIAposGEc=
X-Google-Smtp-Source: AGRyM1sHU/jyPzyi8t9IH89ICfexqJhDeXevU21NJ8I3gspBuNZS4S6/3nKMdrbGHFlIsb0EFHyyAp3D5+vbWutaVpw=
X-Received: by 2002:a05:6808:300b:b0:337:b697:b077 with SMTP id
 ay11-20020a056808300b00b00337b697b077mr5465443oib.126.1658752914321; Mon, 25
 Jul 2022 05:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202207250449.BYMZbIA2-lkp@intel.com> <Yt3KObFVIUI2mFGt@zx2c4.com>
 <CAMj1kXHTf4f+onREnWhYk-vYXkPaQtPpZz+SqFCP+Ey7+bOXkQ@mail.gmail.com> <Yt5Y/cIKIDlyFWMQ@kroah.com>
In-Reply-To: <Yt5Y/cIKIDlyFWMQ@kroah.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 Jul 2022 14:41:42 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
Message-ID: <CAMj1kXGPjFAY0y-SPZv64CRhpo9s1+__z4bya86aMcTs9=f8pw@mail.gmail.com>
Subject: Re: [linux-stable-rc:linux-5.15.y 6874/8723] arch/arm/lib/xor-neon.c:30:2:
 warning: This code requires at least version 4.6 of GCC
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kernel test robot <lkp@intel.com>, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 25 Jul 2022 at 10:49, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 25, 2022 at 07:42:07AM +0200, Ard Biesheuvel wrote:
> > On Mon, 25 Jul 2022 at 00:40, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> > >
> > > Hi Ard,
> > >
> > > On Mon, Jul 25, 2022 at 04:14:48AM +0800, kernel test robot wrote:
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> arch/arm/lib/xor-neon.c:30:2: warning: This code requires at lea=
st version 4.6 of GCC [-W#warnings]
> > > >    #warning This code requires at least version 4.6 of GCC
> > > >     ^
> > > >    1 warning generated.
> > > >
> > > >
> > > > vim +30 arch/arm/lib/xor-neon.c
> > > >
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  16
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  17  /*
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  18   * Pull in the refere=
nce implementations while instructing GCC (through
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  19   * -ftree-vectorize) =
to attempt to exploit implicit parallelism and emit
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  20   * NEON instructions.
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  21   */
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  22  #if __GNUC__ > 4 || (=
__GNUC__ =3D=3D 4 && __GNUC_MINOR__ >=3D 6)
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  23  #pragma GCC optimize =
"tree-vectorize"
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  24  #else
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  25  /*
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  26   * While older versio=
ns of GCC do not generate incorrect code, they fail to
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  27   * recognize the para=
llel nature of these functions, and emit plain ARM code,
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  28   * which is known to =
be slower than the optimized ARM code in asm-arm/xor.h.
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  29   */
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17 @30  #warning This code re=
quires at least version 4.6 of GCC
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  31  #endif
> > > > 01956597cbc46d Ard Biesheuvel 2013-05-17  32
> > >
> > > Does this file need a depends on =E2=89=A54.6 thing in Kconfig? Or is=
 something
> > > else happening here since 4.6 isn't even supported by the kernel thes=
e
> > > days?
> > >
> >
> > Hi Jason,
> >
> > This is explained/fixed in
> >
> > commit a69cb445f7d129abf7c50d48c8a8eca7c8d5df15
> > Author: Ard Biesheuvel <ardb@kernel.org>
> > Date:   Sat Feb 5 16:23:46 2022 +0100
> >
> >     crypto: arm/xor - make vectorized C code Clang-friendly
> >
> >     The ARM version of the accelerated XOR routines are simply the 8-wa=
y C
> >     routines passed through the auto-vectorizer with SIMD codegen enabl=
ed.
> >     This used to require GCC version 4.6 at least, but given that 5.1 i=
s now
> >     the baseline, this check is no longer necessary, and actually
> >     misidentifies Clang as GCC < 4.6 as Clang defines the GCC major/min=
or as
> >     well, but makes no attempt at doing this in a way that conveys feat=
ure
> >     parity with a certain version of GCC (which would not be a great id=
ea in
> >     the first place).
> >
> > which landed in v5.18. Note that the patch depends on its parent,
> > which touches many different architectures, so it may not be
> > backportable cleanly.
>
> I would love to backport this as it bugs me to no end on some various
> gerrit systems all the time.  I'll look into it later this week unless
> someone beats me to it :)
>

If backporting is an issue, we could just drop this warning - GCC
before 4.6 hasn't been supported for a while anyway, and Clang never
had the SIMD accelerated XOR to begin with (it needs the __restrict
annotations that the parent patch introduces)
