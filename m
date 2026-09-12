Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351B41D10B
	for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789207404; cv=none; b=Nqs467hvItWPBeur40m7umlDM5mU+QzeWuPx5g79SpZ1WR5agB5EZo/p3j6l+qJzhXAZYYrxJOtx99j7mepVHhaRkok6OV7m0ykIPwfTvKnouPozWqRFA/GWUL3Jnf2XRcdcPV/N2yRq+rdSbAlqTkHBNeGrFinMK7tVrfGx7m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789207404; c=relaxed/simple;
	bh=8sojs+se8QPBJyJ3S7gUk1OtieiG2IMnEQyGHnpeALo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+6QAbwH4QZzuQqnTHntITk1+JhuM3UoS0etas8biKP8eyQlD0ibOBHIQEDuyl2BLYDObGOVzivDZix695inDQelpMldp+KQx8RTH1wds9e28/a+Glwx/5cpND9z+mdDsKKna+IIDbDDGnrLIA5q1QaMdjipuPv1B04gAKXtcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dH78EBiU; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dH78EBiU"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso300928f8f.0
        for <llvm@lists.linux.dev>; Sat, 12 Sep 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789207400; x=1789812200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=dH78EBiUf8C4qwlXx45L0kJQUrTu40vGP8j7ZsNcnAMlFoZSD+TBFroI7ggbmSP9fx
         gnUuX2C2GCf5cD3hJvj0S8bVFUN1Ln2/fVSqYAEwH+DiCvZ+C/FreuLeaDNkw4KwRbml
         MYFU9LUfsjj/Ro6YFi86LonQC4xyr/ZPybuQXPIWq2RjLEaq4tZF1inVlKgSPPlJAfNB
         7+9GaLNsqm0Woa+uj3QYGE4Wi5NC/TX0ooTUVCfg3Fjbdlo+2G+kgmLLM252fS61GISc
         uxSNfPzFqLEKvwHdeTCy5rAGUFuqzXkR41l3mkaRa16ylH6Aq0FDzu8nEisq9Jtj/Hja
         XofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789207400; x=1789812200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78QJrighesf7VQwGx1w3HgeMelr4wZOukxrUbALylpM=;
        b=Ruhz1zhleDa/8L2xFntWiCnU5NERbF+YPFDvV3CC+//bZ7YbOYP07n4GaTTMHDppBN
         djGaFIol5WhLaK2pevVy6ASQNSPN4/wGg3vVXDqgA4zMHKS9CmQqugNPAzjHcVcAr2Li
         7OXWlY6oLqjqmS+UVBjTgVxcxnzGj/JSGKYy6S1CyvFovThCPDxzCCB+XmdYTEhMl7kx
         3J03mZXGmkTo5kt4QVPSyGHqhlpFcDOJ4u1+niA+5w3vV3zIUjn7gISKjcwxYSVpzPVe
         PLk2yqu6UhZBcuqWO20S5MHEkpshSBTkjiryewnR63opEQd0F4aBvTYh0nJnnAtofpte
         XwUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXX8y9IeqLuw9nSz30lDLYmX+PXse3gxfX4DB6zym4GXhcwVZlMAsDjvGVpNjsZma6qTeo@lists.linux.dev
X-Gm-Message-State: AFuF++la5UtIM+L9vKmTnnSiPK58Ku0GQHG0YJVVdznsuSEJkGLUT51T
	+3v+xawWHxGphxKlNByUKoVjjhgOzxZBSbu5x93Z470kW4pSudz6PFj+
X-Gm-Gg: AYBFou2o7pyFF5XjSNl4xKb75FjFuVQlRN9eh0k0X1QZcT1Xs609QhhWE1/igcit6Rs
	gY7Shhqd5lQfNdkd7OpavEJFgO9P1V8ufk70gX/NzrpCuoyxJULzhMljKaKMOITpjkyz9QT+hPM
	agaW/JfqnfLtPuLPqZT56K+KBG6eTFpsw5ng5f09oq2GYxCyvXVqhO9sj6dzua5B+IzKoiyABBB
	oX1Vq+O8+g3ARxfbnGFc4RBuYVLnmcmuYbWhVUzxNWbY1+QTru2VEjamPxDJMoRb2Blg5K/+4/T
	q6SPrSRaHhfH2ujtXE31WAm4RD3T5Iw9BEF88OW2Vm+6ZTRwbblsq8+ifLcCX2QAiNd93956AQY
	amjDj3raQaijZX7zlkEKPVXwx3ioaaWWEM3oAgEZcADknwZSmcKhmg/g35QCC3F3/3IPJy1aJtK
	vy7dkSaG+I7Z8JveCeef8y9PFgjqucVx/Dj7S8N86pgcQ6FBjCycvRN4OGZ96o3GmXoAnnpEFy/
	QaMAOSwGQ4yXjr3AAzE5AGKyITOvwIxONDoZ18Gd2RE5S4=
X-Received: by 2002:a5d:5848:0:b0:481:512b:f0e7 with SMTP id ffacd0b85a97d-486f6c0a974mr2053384f8f.17.1789207400506;
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm7428212f8f.0.2026.09.12.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:03:20 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:03:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260912110318.23bb6619@pumpkin>
In-Reply-To: <178901395292.3971858.13236774094648272066.b4-review@b4>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 09 Sep 2026 21:19:12 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..3c92c87254a3 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> >  
> > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > +
> > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > +
> > +config CC_HAS_NO_ADDRSIG
> > +	def_bool $(cc-option,-fno-addrsig)  
> 
> I am generally in favor of this proposal since I think these checks
> should be cached by Kconfig where possible to clear up running them
> twice. That said, I wonder if we should pick a better dumping ground for
> these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> scripts/Kconfig.tools or something?
> 
> I also worry about backsliding and growing cc-option checks. Should we
> update the documentation to state that it is preferrable for these
> checks to live in Kconfig so that they can be properly cached?
> 

Thought...
Can some/all of the checks be done by running 'cc --help=xxx' once and
parsing the result?

Although I'm not really sure that shaving off 0.2 seconds really matters.
(I know the little bits add up, but there are much bigger delays.)

One thing that does annoy me is the delay before the first compile when
you do a -j1 build. I've not looked at what is being run.
This is all made worse because gmake doesn't stop on errors very well.
I fixed that in NetBSD's make about 25 years ago.
(IIRC it mostly required always getting a new token from the pipe.)

David
