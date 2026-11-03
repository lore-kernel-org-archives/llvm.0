Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745530;
	b=cQZIoAIsxmCwZm1Se+NCh14b80LUD3B+9MhpIoVwBobupq57agsuolcfBmVRPgsWu0cb
	 YSyBaNkFa70q3aMTsHZnJRGSJY/tP94XvhRxxyAGpWG2NX4XzL3xP9jl6kCoegNIgMErl
	 wr2DeI2I2sIkKcPEs6jBgeGl0tzfLC1ALQvgXPWrFo4owWTMiCEV35wOfKG/ePqdZsZPn
	 CJbOVI1mENPnmrG94Vp98GHBX/29ltOhvPyjjsx5pBRTeQU53CcaLt1Rv89bYY/Fb/6ZK
	 fjcPTM+mnaSZ1tmNp1Ut41ktGElHtSuIZPo5v+sJoTiMuwEc0we9EMfxQ8QaH42cSpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
	b=ZcP32nqvnydA5OdyREy8ypwq3qL471AWYIuOw23Mjtuqs6h4ZpI6r26aHiPY54Hu/jbr
	 V8oA8OgMOZBCffCNvwNQiCspY0UzI+E3ooSaRZCuC1778eFnTbcX2eHN+IxW+kqmqioxo
	 emvYDdtTfTU+KM1R6nwSGo5BB8w8wNpJKD3HZyZ+7YxRDLdPNu9fzZEIUM0hDWWBJ8tjj
	 /AxcJCd9hc/ciLdjJlEWwpYiTsfKNQ8zsP8eHNCwtNVZ8G1sg1RBKYwoSg+s/bPqrcRzt
	 AFeEsJIJ/w3Trt6ww+L1KoD0rySX9w7KsirpuanBQvqt1eXpjs99e8oIKXLA0nKUgBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AfNX/iBZ";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49212606A328
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 22:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49212606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfNX/iBZ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so66965e9.0
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 14:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745529; x=1794350329; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=AfNX/iBZzWYunfBfXrZorcmHzCrhQURxMIS232iVh/FJev6H0C+KbKjY7ftZ9X10w/
         KGUH5P2XxoxGGgfeuuLlWqXCjO52hdAOiIRr/iKpCQPijbnMWTeXmHbsp/OD94tPU2aF
         /kEZTKb8uDACEaSFYDWJoNYkCan1Yn3U8HTRLanFTByUjPHSTEWYWFCCJ6Iq81iTxYYS
         rOVHE+PhLprYkRcXdSrGd85JqZz8CoO7owXtD9jQ4iSzu97fMjGY/L0Yw5CvD6Me90uU
         +EdMobtOwvp9r5BrJoBYaNmm6J9MAnZGQSR5DTcAD1rrzc4UvZIAqZAD7yUKIEWCaUJj
         RSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745529; x=1794350329;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y4hWEy3KCqBGcgLZyC88t/BtG1nVv31oLpGNCBZoVw=;
        b=NZgpss69JhSLEQG2WBtfyMmuBGc3BJDeo7klIR9jKL5bOBwVFW3uvXhRg/3ejiM9X3
         LrCM5M0uYQwJnh8L8M98yWKhpo0Z3V0nD1x7v7h8n0kXfDSUMqM7GMLbwH1qu0T0oNrZ
         lInYocOGmAY9axVpxVpfOdmJco7sXV1/wxRTyqHcw09m/ZExvfIXmdlNWh20lboAc/XY
         e5YbWMDZZsFrWBQD+gygpuW/K9i9npM1Nh+ujmSnGXHqwO34N6J5J5mM2t3reP3Zw66f
         28tLe6p8gsorLPTD5aC59cwcv4v8J0xF3eRKbwgKgZrfLQJoN9LtONzy3hgNA5ZpjAil
         dYnw==
X-Forwarded-Encrypted: i=1; AKwUvByT0niO3kjRi73UTFhiiWlmMj1H8fxqCJgJXmtuEWAgTQ7CzpX/OPxVbjLePhETeWyU9a+S@lists.linux.dev
X-Gm-Message-State: APuU4Z9jC/gxt0KwgkuOYpE0CHsPxp58Wh+RP6AUyqzvKiJWfTMTtEku
	qTd3TBwA+gw/9fgoBQfKiYxFl9H023f0xVqyG8h/rsIQqzBjdOKUKeSM
X-Gm-Gg: AYBFou0MGjE9uRIYov2WLZ6egT+BVtXs2Adz7k2ZVfHMYdZYvOX/8r3WQYTPq226KL3
	INwKAW201LVPND0WfQYoMgtjrmrifRyG+eQhDhP8mrd+NBKNDYnYOBDnGamtmFhZOun6E49Q/ma
	mmvSILczB7M6+YnluipUX3d+u6gymB5d64ZpkQwomwzPLAhjkN3pYfWi2A8LBldxvXI8sXsHuBo
	SHEt/Da3i2GbFicK3AA9c45zVx2TnolYhdngnWAAHvK8fkp6Dw3HfqL/leLOBe2ZG6E45i4Exc5
	wOj9upLo0cUmS5tFo6W7XRHR4EfB/vfbPpGicGpg2jneto9WY7Momc1U6ZU+EIE5S7sR7MvSib3
	v2q4obKCvImJ7y8qZdhaGukaG4j+UQuagDDQQYo3XtOXZLWUzEJJvPwIUBDsaPlIkFqaOK8ifNS
	kkZsu6snDNU8+khHlJp7mtXsFPz2tUna2jaSnIPFM5XGBNsKEINwanoWFIPEt3rnDx7lceB5NnW
	/ROB1sRPIh2orE7cMwinAs3V5BkeJrQeHIHQ5oE7XLEMgSfamNq/PCkkTqhAxRnaslDLVFmh6nV
	2jcISzVsHT5Y7Gf2tcVDBjplmJUqATsu9nQqQGO7Okj3UAnQqz98afoPxes66Ra0a4yFRHfctcr
	3D9ffkdiy2Q==
X-Received: by 2002:a05:600c:6555:b0:4a1:d45a:3ae9 with SMTP id 5b1f17b1804b1-4aa8b05fa4bmr341420665e9.15.1793745528451;
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18104bsm467832f8f.6.2026.11.03.14.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:38:48 -0800 (PST)
Date: Tue, 3 Nov 2026 22:38:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Demian Shulhan <demyansh@gmail.com>
Cc: saeed bishara <saeed.bishara.os@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Eric Biggers <ebiggers@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, Ard Biesheuvel
 <ardb@kernel.org>, Robin Murphy <robin.murphy@arm.com>, David Gow
 <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 netdev@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Message-ID: <20261103223846.5e6a1dfc@pumpkin>
In-Reply-To: <CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
References: <20260927131838.6774-1-demyansh@gmail.com>
	<20260927184414.6c0c8867@pumpkin>
	<CAOLeWCt+yFs29yWg6DrRH42HD9ConLgTEbW=wMKtEoTW5ROHvw@mail.gmail.com>
	<CAHfVqdX4AmqXs_oD5OCjU8R5ts=98=RmgCmJ3D5gLyk=Xtrfkw@mail.gmail.com>
	<CAOLeWCu4NiedyXmoLwwnTvJitRwgg6PQq9LApO=k36ktN3-XWA@mail.gmail.com>
	<20261102161426.2403d308@pumpkin>
	<CAOLeWCviRtGMhGJQx3HHFQOze439576PQqr4tmvjGkMMfYfcog@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 16:47:29 +0100
Demian Shulhan <demyansh@gmail.com> wrote:

> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4 =20
> Agreed, that is a nice loop for the sum-only case, one dependent op on
> the sum chain and no builtin needed.
> For the copy case I tried the same form on x86 (Zen 3, GCC 15, Clang
> 19-22, -O2) with a store added, against csum-copy_64.S, as posted it ran
> at 0.85x of the asm with GCC and 0.73-0.76x with Clang (which rewrites
> it into setb/adc), and ~0.8x unrolled 2x/4x - a bit slower than the
> posted 4-accumulator loop (0.88-0.95x).

I just added *(u64 *)(dest + count) =3D val to one of my loops.
gcc just replaces the 'add from memory' with mov/mov/add.

I'm now confused though, I seem to be getting different output from earlier.
With -Os (which I didn't think I was passing) clang is refusing to do the
'offset from end of buffer' loop.
With -O2 it bloats everything by unrolling 4 times and adding lots of
extra instructions.
(AFAICT the optimiser has a completely incorrect cpu model.)

If the compiler doesn't generate the expected code it is all pointless.
The xor parity code loop had to be in the asm block to stop the compiler
changing it to a much slower form.

For the checksum code I have managed to work out how many bytes/clock
the code was generating and getting it to (reasonably) match the expected
values.
But you have to use relatively short buffers to avoid D-cache effects.

David

>=20
> =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:=
14 David Laight <david.laight.linux@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>=20
>=20
> >
> > On Mon, 2 Nov 2026 16:14:06 +0100
> > Demian Shulhan <demyansh@gmail.com> wrote:
> > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation. =20
> > > Depends. I think __builtin_addcll() is needed to get roughly the same
> > > performance as the asm version. In my tests GCC on arm64 turns it
> > > into adds + cset instead of adcs like on x86.
> > > But I will look at it, thanks! =20
> >
> > The C version I posted earlier has the loop:
> >     buf +=3D count;
> >     count =3D -count;
> >     sum =3D carry =3D 0;
> >     do {
> >         val =3D *(u64 *)(buf + count);
> >         sum +=3D val;
> >         carry +=3D sum < val;
> >     } while ((count +=3D 8));
> >
> > for aarch64 you get:
> > .L4:
> >         ldr     x1, [x0, x4]
> >         adds    x2, x2, x1
> >         cinc    x3, x3, cs      # adc $0,%rxx on x86
> >         adds    x4, x4, 8
> >         bne     .L4
> >
> > I suspect that is close to optimal - especially for fast cpu with
> > out of order execution.
> >
> > https://godbolt.org/z/eso79K7Wq
> >
> > David
> > =20
> > >
> > > =D0=BF=D0=BD, 2 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE=
 12:44 saeed bishara <saeed.bishara.os@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:=
 =20
> > > >
> > > > On Sun, Nov 1, 2026 at 3:34=E2=80=AFPM Demian Shulhan <demyansh@gma=
il.com> wrote: =20
> > > > >
> > > > > I would prefer to keep only the scalar version of the fused copy+=
csum.
> > > > > It reads the data once instead of twice, and on real Armv9 hardwa=
re it
> > > > > cuts end-to-end cycles/byte for bulk TCP over WireGuard by 3-12%
> > > > > depending on the core (+6-8% throughput). It uses only general-pu=
rpose
> > > > > registers, so there is no FPSIMD state to save and it is safe in =
any
> > > > > context.
> > > > >
> > > > > If you are OK with the scalar path, I can send v2 with NEON dropp=
ed,
> > > > > the scalar path only, and the KUnit fix for the x86 zero-length c=
ase
> > > > > Jakub reported.
> > > > > =20
> > > > The scalar path seems like generic C code and not restricted to arm=
64,
> > > > curious how that performs against existing (e.g. x86) assembly
> > > > optimized implementation.
> > > > saeed =20
> > =20

