Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E382D9EC7
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 15:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740421; cv=none; b=X8+PknYRJ6SOm9qQZUzp2V+u85A/NPhT/gpCpMGEDVppi9aPyCpQs+S86GQzyDHAkhMItz6LJQSda0b/+GMCcjDy5oYXDWNQmiLqUxco+q/vRszaMXaHvf+1WgXZG/MU7YvdIFsAN6CfIDBUG9FRQbylM5euCW6r1O2fyPpjn0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740421; c=relaxed/simple;
	bh=o8G/GiS3BgpSMcQjDR0YaltTp78U2/bL2JRaBINbDzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNnSZMvu1p0ldbpJgNcmMv4O9a6NQjZwdAJAQJLiK+ggZ5TCyeJeppuyQHajTa4cVMCQ6+I5tjG73Uomy5hX8SuoP6lM2qm3nhbPKN0gwGXnLq3F8tTA6UYhiZXT+9BNCxwv6d5fYQgbnA59Si7vjwP/P6GjmJQ0jTBQu0+OU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ0kk3J9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ0kk3J9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b997ae045b7so127424a12.2
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 07:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763740419; x=1764345219; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8G/GiS3BgpSMcQjDR0YaltTp78U2/bL2JRaBINbDzg=;
        b=aJ0kk3J917gnkgQWeaMEapPpDle2LfrAdM5oEcTTlMqXUFDpOHAwoBHCdzrYLitA/R
         Fso30UfrRlUePfm7VelAKmMPUhTttG4DBvf36xPDCbDjNfKqIInO4cEDkIQth8vU+Okl
         JchLByUbRT9BKGKU+PD0NBeotPcVsHZ3hapIyguqmxmsMTNI0LGymL7MKvAl+X2MyH1o
         8eGZwHTxTkTQwClna8UXDoQ3KD6qcF9kWoxjt1EXgtcNlTpUQZ8yc8w7aCJNJQNnHFXO
         C3xlen6w/JMLYOQEQKOEiLNMDPZt82W2lhtHEV72ZkQ38KUq45qqzt2aw1SisKwCefDe
         jFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763740419; x=1764345219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o8G/GiS3BgpSMcQjDR0YaltTp78U2/bL2JRaBINbDzg=;
        b=MpedRVNGApkHNyxcjrzBuY6Gi+ZB4VrI5+go4gdAs0oLcqiFKcY9rfrGrdFZhpUFbB
         DRxNCUl2YZVYnW+NrT9kf4t70n3XIrU9gU6e0XBldwIyI69tONfGs5vKbMVlL9MNFrJL
         2ETS27+cgsoB3R4kxl6k+uWJJdyH5G9U4Lyg3H8HAnfhlyY5v42hpm0SD2GSS6uY9Mzm
         AsiAF8Xd44zY+4glwzDmxZ5GDtPb4hOb1gFOoHozt8rx2ZTZdAh3lbRcjvd9pdy4ZpGm
         VmNFpWX1O4VF9QX17rdz75Od0mVchIgtZIq/GZscZfgtCv9vGoXI6l+Dd42dPPgp7qSr
         9JRw==
X-Forwarded-Encrypted: i=1; AJvYcCV/VYAtRIUbg++dnuOwHa25B1Vb0BCbkjGKGoy0Sm7onK85VJlqh2jKO7caH/cp2T3nqaBy@lists.linux.dev
X-Gm-Message-State: AOJu0YwAU95x/G4W/jGuelTxZCWi3/Ofh2LKEL73lK+0kI2ALkiL8tiX
	2Rq45IMNLt5+WexIRbOiZa2gIM/HGk+rL7sjw7wsSn3rblMbDEA1VTn+XkJcXtAg280yvqGpgVz
	QJvSFtnezbiTBvDemo9PV4VWU9d764fs=
X-Gm-Gg: ASbGncsMYT9IUltVUqv1Rkqv3EV3LdgoL9ttJsaT9T/d201fOZYVuL8Pd6lh9zwDZNw
	wNT3MDCFEVMyDHNikWZXyjZOh2TCYx2TZJYzqWqPaamWuqfHzBHMP//QZt3aJtWwXfODo87JQvD
	QvXfo0CH9bJu1BZ1g0T7YfGnGgkFm8uAYaTNbifMu38qkhVvDMJ4vhpT72UXNh4aTwMnMyzhJGz
	Gkg60o8FPb6fj/i8m7TsGOzWLFDRUpYJDD+0OokXv1ZAxVlJ7UPvsEUeAp978w5bXba+KLVcmb0
	arDSxsS2SiM6+uNpfuIPku3CK29fkDSaatMcAw+8yJFu/Mdent/75KlPJRy5l+ZllypoS0Zki1v
	quwKtWQDXnluxRQ==
X-Google-Smtp-Source: AGHT+IE80rH3S5mme1u+IJwOq/sIvyrD3Dee35LwU0XcyKYPnuq51W6MPRq6DMJIHtT17xiUFz2IOXTHbZpcDVp5NTo=
X-Received: by 2002:a05:7301:4084:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a724bbea18mr684670eec.2.1763740418736; Fri, 21 Nov 2025
 07:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <aSB623GKVDR2TBc3@google.com>
In-Reply-To: <aSB623GKVDR2TBc3@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 16:53:26 +0100
X-Gm-Features: AWmQ_bkrKrD1LedPEBlofRSnoNSYkwRg-euNzc3m1wmopbl2OlxvUyeW0rVWqPc
Message-ID: <CANiq72kUk_R0HGbX4eW9iucCXergJqBBeutnh7cb8SNAzGjG+g@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 3:44=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> You say that this kind of thing would be a compiler bug, but I don't
> think the compiler devs folks would agree with us on that at all. I
> mean, sure, it's a bug in the sense that it's a missed optimization, but
> it's not a correctness bug.

> I'm not advocating for adding unsafe blocks to skip bounds checks.
>
> And, fine, there are probably a few cases where it works reliably and
> has no real replacement. Such as the VTABLE_DEFAULT_ERROR check. But I
> do not think bounds checks are a place where it's a good idea.

There may be no guarantees, but it is a similar situation as for C
compilers in the kernel.

Compilers can of course change behavior and have bugs and so on, and
thus avoiding to rely on it as much as possible is a good idea, but I
think it is a good idea to get build asserts reliably working as much
as possible for certain use cases. In particular, I don't see why
simple (local-enough) bounds checks cannot be one of those (it may not
be today, but it could).

Of course, the best would be to get the language to a point where it
supports this sort of thing natively. But that is a longer road.

And, in some situations, there may be no good alternative (i.e. const
eval / generics / macros may be too painful to apply), and thus people
may end up adding `unsafe` instead, which isn't great.

In addition, I think upstream probably wants to know about this sort
of this, i.e. sometimes the changes may be unintended (i.e. if we see
it changing in a new nightly) and they probably like to hear about
"obvious" optimizations not being applied, since they are potential
easy wins for them (or, rather, avoiding regressions), as Gary
mentions. That is also part of the value of building the kernel in
compiler CIs etc.

Cheers,
Miguel
