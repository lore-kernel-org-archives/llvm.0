Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669885914B
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 19:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711221261; cv=none; b=aKP9Eoo4R1/cESmrs+KdqydrvXy2osS9LRKqhSDlTHIpwm7JL5Xjh+fVoBjYqux5+02WE/WzWzIAccXXQPEt7TbHmkUHqrCeVtqWXU5YeMqiblvAiMgdzDWyuybjlxX01CijH88mvuyoeMFNTiQ2r3ps5jKcBHU9jlBwt/pHkjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711221261; c=relaxed/simple;
	bh=m18NgGo2FWorgOirXh/+wwWWyKLlg/fRucbQqieOhHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZMMYyFugpUtb8toW7/G/6WpIQEeV/fgJwGG84gE9PKVKKWZTTDb1tmyPM3NrgDPMjelq7APFX9qMaOkml2FS0bwlWt2EhyGR7Z+w7+Ozf8WeBg6zcNM+EyiZYE8DGCGzvnKMkn2FFreTwyIcbKAO+dJKXQl4CWXpgczjSa09+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkoEEKII; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkoEEKII"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29c5f8bc830so2105218a91.2
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711221260; x=1711826060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m18NgGo2FWorgOirXh/+wwWWyKLlg/fRucbQqieOhHM=;
        b=VkoEEKIIybmItT4G86Hd0HKnidVqltxgxtYky/hAcHuMq23uyNaymTyHpm18OHlz2c
         WmyK/WT6EPC3Clko+qGmRMx6UNF0C0/MHbJ17vY/UMMxUsr4SuUkrfSQYu/7z0UVi+/j
         +cmQNma/WOzEk0s6qrltOpObEiketBuF49RqELtAOSMwcNymLumEpSLubZFqMiWaPC3x
         3MBrIFjByqlC1RY8rlFcoixE7EuzK1fv1JKxCqpjMVXxsh5rgtqTqIn151CKlG1K8151
         YOu2DygzMqWIf73XvtyukkARQuNzL5ezjIuUjGwGPNqmW9M2GneF57bqnn2KkqJ+uuOH
         KGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711221260; x=1711826060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m18NgGo2FWorgOirXh/+wwWWyKLlg/fRucbQqieOhHM=;
        b=dKXzzFRvcKIJqjBsPhYE1Kaij2kHNVyIkZigm4I1HEW0YnDhY1ila2Vqyr0zx76qp8
         4o/qPA04r/boBd3eSxr2FWYOFrXcqeQBBRb8GVzqbGmmNBRMl5ImJ+QhRAH54/VtoIO3
         7GyvxJQ8BTGS8a8MMLsa3VXWtMls1PHnBUBxRwA1fpzP8ZxSyBOuiHc6i5Xq9sDk+baE
         nKFxhakK6o+EHwk2b8szFOhb04LpKBt4AOWmg6tY8QQNVbgyZlheDzCv/gKo6Gqckx4O
         iifAXv0qn13f+Ctc+SGF/cCVCavIaLEOwqIp1U5vmOfesNPmvtMUcHA59Is4PpTwENFf
         Ym/g==
X-Forwarded-Encrypted: i=1; AJvYcCUNr4UnCx7d52cG5YwN9cBl76UYCGqQshAOQFs9IJBJKkt/JQA/kwsMmcfOssM0mt7HevFd4R2/ju/6p0MTrZjZqFk+fQ==
X-Gm-Message-State: AOJu0YzN0B/WIygg+d4RCSDJEt7R8gR9CdcZ+MPUS1TsH4xOQmXg3Pqv
	CtXsBi5vQlE9wCC8lTEFgp5RwFHx0hkW6drEFZon9p0orpejavjhmD1FxRTJTGN9YFb3HPGU2Al
	Ipy74gmVM8bdsALZEk/OQb56CVmc=
X-Google-Smtp-Source: AGHT+IFieHr7GIKgA8NSDY8f0+kxSP5yP41UkldkdC6ObMKKBwdCbcEVZVYtXOFgAvSxmZmwCpgD/3wOXn3BFAmZ1uQ=
X-Received: by 2002:a17:90b:190f:b0:2a0:40df:fa37 with SMTP id
 mp15-20020a17090b190f00b002a040dffa37mr2297623pjb.39.1711221259633; Sat, 23
 Mar 2024 12:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <20240322233838.868874-2-boqun.feng@gmail.com>
 <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch> <Zf4cP6lx7LHmt3dz@boqun-archlinux>
In-Reply-To: <Zf4cP6lx7LHmt3dz@boqun-archlinux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Mar 2024 20:13:56 +0100
Message-ID: <CANiq72=tB=uxaL9XGbnTBpXmj1pXEbxHQJDtAcA_yDiLjTVkRA@mail.gmail.com>
Subject: Re: [WIP 1/3] rust: Introduce atomic module
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, 
	David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>, 
	Luc Maranget <luc.maranget@inria.fr>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Akira Yokosawa <akiyks@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 1:03=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> I can continue to look an elegant way, now since we compile our own
> `core` crate (where Rust atomic library locates), we can certain do a
> sed trick to exclude the atomic code from Rust. It's pretty hacky, but
> maybe others know how to teach linter to help.

Yeah, but it requires copying the source and so on, like we did for
`rusttest`. I would prefer to avoid another hack like that though (and
the plan is to get rid of the existing hack anyway).

Cheers,
Miguel
