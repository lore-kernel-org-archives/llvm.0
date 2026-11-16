Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868123;
	b=1Gcl9mdbxMCG2uqyERTCHpD6RtBwOXWdVbnt1tFivi3G/6hsHe0MxpblEf+xp5txxbM1
	 K7ilofBpD/9OGl77VRRLsALRB3uOCaK+8TSLXXOaNrftIeoHgqYm3edXJpYupG85LQzYY
	 dnf2RBGHzrnty1LZIEGkgjgTJ3gJ00foGAM85ivvauxwGwrI1y18CtRVMeIEWlthZVdyl
	 70QCa+QvPrfQVvZOAiQWIaAXHBnofnlB9UxKM80xGi/yatXMk0ayJK45G1YMJ64mw87/I
	 QLqs8AL5WPVmPEDO6HIxpAS3XQSJc9L5yY6N6XDPz9rQK/8ldp4R2aM47udEkaFMpEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
	b=OxXqUbHgkxsWtjH0+BAzQjW90F6UPIzup70nRg78nm8jGzfVgyxG5qHMSho7ca9azEOY
	 POt9RVvKBrWiGihsm7m7v2ESm9xwLDIQNrZ/fABXOWCcrMdN/SQHlASfleK2579J0cjLa
	 OivFbP1yfjQ+5VonEJ7U5VFX4nsy0YKAZkENygnpLSIiCK4b13NxxsUXP0kK5JGs7n59f
	 reg8mbF3s71e+M/Hz7GJL7CYJMfSuMKc2Q8RisVJX3kbZN3ncuvU0ef6T7dtL6frXFsAC
	 hEet+qPwUaiMf5yxZIUzRUAohfuhebpQ60G7n6DknCP8v+cKhwjo8sIs9NQYc2/UetQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJcFh3o8;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C2606A89C
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 22:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7C2606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJcFh3o8
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49134c8509fso3864184f8f.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 14:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794868121; x=1795472921; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
        b=SJcFh3o8AhWiUtVn4WC0pTBXBsJRNXVns3CznIXZeg6eUU0nfYLB1ILLHDVuJ1M5/R
         BMJB7jbAM+1jhoi2Lv3NGOnaZgzY1bOjf8Cc7Ghc5C0yqEhB/1Ll/p6bdaKUmlg3XE47
         2q8baYoXugD7JA2lnaFplKsAUqZokYPa8+SfZEizTUcMWxRI2Q5Cihd0PpvQ9xDrkBbA
         seUJ2JGv+9/58VCNirvqsbSudOLSqpHEPMqeuNeZIshJJ4nyg2K2BCe9zAJtkYPtextj
         jJMb/77ZBL7XotcDSqXf4LqJlDWbnZ128XFE5ex9+VCAuSFB7sAkSWIIa/fZx7HRFOoa
         vARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868121; x=1795472921;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN+xjqjb98UaRHMjBVBOXaIhAP0+1stF7wDJi81/iGY=;
        b=c/bG6jMXrztxNzuGhCOcTBn1DPSZVkYspIwfhWcMRhgZF16towigXR1eUR8yDvPrk8
         PmobCuZezJjJgCgZ7frDVbHOxczjGJv71KYTJebOMtIDiLu5czMfdj3irbxu9qDAu7cw
         7GlUzfrwoJeEXNmpmscqCGbaPSjV3RA4j8qvEzH3YBDsd9cyjhBERdbhOR4k+HhRkUtu
         taqDaucswLd8AAfXHmET+OIrviPyrQts/tfmHpuv5Vqe9thpHz1Fg/CHA8zy8LWdTaxl
         2pDuNG2OO0E3PWsGzKlw90OUAVrBbEkdwKjiKmRnohZcKOVAYpIEiEpapU0x7yGyJLZ4
         5cCw==
X-Forwarded-Encrypted: i=1; AL+hErFLGmY8aB56An5g/CuXrRXlpypfa3TLXULtVSyVbsXIYM/zgJPfq4x2CAZa5WXj4mihOLlW@lists.linux.dev
X-Gm-Message-State: APuU4Z9fBzeiJ5LriMusKn0L6feTHr7+D+ZtoRIrztraWnbGqz9FbDyb
	s8mkCDXeVY4MvlQcCw2B4Oe+OWOj1UGi5jLCW8LggAHIh13nwsGWe9le
X-Gm-Gg: AZFdTZdFehAm++YRLcnvhNTfM5KXV2BhUqd88BpXur/EgzsbBkwLi75VkAGw+Hn0Kd9
	s8Pp/+TRFralxZSgpq4W1mxzuntS/ecduZ3NM6tyzpkPnbux5jQDpNh7xiW5idV3/ad2CGksCFu
	p261BC6PXU2AmWfNZjt1jtJRvneP8O3VxaLVdI+7x7IHlij1bejknWgsj4OMyme6fVfvA2C+RQr
	zfLPyPiWt1Mwgam6dw91JdX7lDbAUIBRp9olNNAER2o2UFzjEGVirwwjZTsFgssXURUvC6a2Wd3
	EdUHR+30wGbE5IrWCYfRjjRu516GHIBs0ANwvKa4rh/7vNCX36KaX0sHE37AYq+ERQyqLtdT+By
	ZDmTIm+Rwr7ZpAAZaZIlzHGFfI2sQlpTmu+7r8RhZmjYzNyehlgZREJGVLaxGMc6xbIqlau3o/4
	cZvCiKHsx+nWwW/9lqmrf3PX0WnRr/u2czeeokWx/EH8LhwRZgI++iaYEfFPvF9A1QJny0XbM6J
	mbwmFfMDpwv7AOTtxnfUEg9eTksYxzyYihyeCpT8K86ZJNy/NhpxswW1BW7XCXgDwGpnZVtLBYW
	5De3GECzC+8C8StxHnU0C135uEC/nGLum7n5zqiHpHzbgCELmHxyKegPEE5sku627A==
X-Received: by 2002:a05:6000:2513:b0:48e:47e6:fdfb with SMTP id ffacd0b85a97d-49c70ed7c9cmr23140856f8f.13.1794868121017;
        Mon, 16 Nov 2026 14:28:41 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a32155283bsm2125683f8f.37.2026.11.16.14.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:28:40 -0800 (PST)
Date: Mon, 16 Nov 2026 22:28:39 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Borislav Petkov
 <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] x86/build: Do not allow X86_NATIVE_CPU to be enabled on
 non-x86_64 hosts
Message-ID: <20261116222839.4b4a04f2@pumpkin>
In-Reply-To: <20261116191120.GC1036192@ax162>
References: <20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org>
	<20261114202524.GBavjDtC9Z3j7PrV3Y@fat_crate.local>
	<20261114204605.GA173332@ax162>
	<20261114205806.GCavjLXgsKNNwK0zLz@fat_crate.local>
	<CAKwvOd=f+ib1XVvFfiW2mF8NoWo1jr55fJo=QOuZCJmzQCVmtg@mail.gmail.com>
	<20261116191120.GC1036192@ax162>
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

On Mon, 16 Nov 2026 12:11:20 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Mon, Nov 16, 2026 at 10:28:54AM -0800, Nick Desaulniers wrote:
> > On Sat, Nov 14, 2026 at 12:58=E2=80=AFPM Borislav Petkov <bp@alien8.de>=
 wrote: =20
> > >
> > > (If it were me, I'd simply whack that native thing. It is such a wast=
e of
> > > energy). =20
> >=20
> > There's always KCFLAGS.  i.e. we _could_ remove it from the x86 build,
> > and <whoever cares> could still do
> >=20
> > $ make KCFLAGS=3D"-march=3Dnative" ...
> >=20
> > (I'm agreeing with Boris here) =20
>=20
> I have no objections to deleting X86_NATIVE_CPU but as Ingo notes in the
> v2, people do use this and it is much more convenient for a regular user
> to adjust this single configuration option in their local configuration
> file than fiddling with KCFLAGS (potentially having to modify their
> distribution's packaging file in the process).

It would certainly also be nice to put something in the .config file
(or at least in the obj directory) that selects the correct compiler
for the kernel being built.
Otherwise it is easy to forget to request a cross compiler (etc).
(Maybe there is - but I've not found it.)

David

>=20
> > Nathan,
> > Was there a bug on file against clang for this?  I can picture a fix
> > in my head for this... =20
>=20
> I am not sure I ever found one. I can file one later today.
>=20

