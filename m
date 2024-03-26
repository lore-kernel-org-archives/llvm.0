Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1C12AAC7
	for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711432622; cv=none; b=QgQ5fDNx/UzVH9YROv8f2/eTw7efvSbBqjtV1nrp8k2g2R76zW43w3f8uPYEp4bsGyj5LGKuMGmWyEtFW+OS/HPEJvG2lrOZ2FrzPor4EFjGizH2C4cuO9lM0/FbvnNlqRquZ0akECgmpVR2k2QRQPUt6yhL1pAlQ9fSB//X/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711432622; c=relaxed/simple;
	bh=ND9Y2sxlabnYJnhIIV0KvAzdrK9FLJxwJWh3pj7SGmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX1F3euAITHf+EkpM+Bnb1c9uPIiatAam4jVRn92PTeDtfqNaz33+f88bB7N6HqwBb3jGC4JayNWq91YJaf+7BJ0jMQbJtgZ/tifAwPpDA35Z0FFpOfsNeq1RbuS2XuDBCR5ER1xo+hsqZ0BpU8SMx85KdacvGZKgNiA3bWe91w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=h5hgyvmo; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="h5hgyvmo"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a5a11b59dso56830967b3.0
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1711432620; x=1712037420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPkjY6tTJjq9XlGXu2wl3SzG0jXY288ke/okKd5Kw2o=;
        b=h5hgyvmohEJAuUWqK7siG59VCgsxsdfjpM/g3bh7qcftB0M+imNinfeUfW5FC4A+QU
         4QF7wusantN2obDXk57Sojq2iwpHcyvEr7MyvxAAuTZmpsqRyMf9NQPGNOh3qtCrXgnx
         EzGk7hv2M4IbR8t5dHTS0HxrYzbl45vRxKGWYmgf1XOjcX/vaeay1Etebx/wvOXGQsra
         jeH8YNwyMOXy54p6HmOo6Vh0DHRk7CKEDuk9r0yld4Ny7UKWykQOfyZp4SIXirXrENUl
         r37SpN9NjuboCynmz+V1g9ncX+hgXaAorYwG+X9PLILLBzYR6uHb+0cqhkwNtjFZanZr
         oFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711432620; x=1712037420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPkjY6tTJjq9XlGXu2wl3SzG0jXY288ke/okKd5Kw2o=;
        b=gYHoPjkVnhyY2nTRLonGezy00HQCCWZrym84LuFjynvyS2qcfEGSpZxriscdnBCcie
         JlbmSF7FwTTq0TJWT7D6Tdmdc4FeEhCEhHj9KWPwUhysxxgSESoBPZ3hc0+/CvDVKIaT
         9qRBnbD4CjDjcUJO2EsW+I8zD/HTv8uvaeRP3p2AhekemWpvNYIw/JQLn7hfyqIjGhma
         mtrpLFVA4N8x/F45giUvOMH9aa+r+3ooh4uuY/3UshvImKSDRoJsfj24c2NvAZx7l+LR
         meKjVvBCmwYgASkI5O4eLTz8ydDSvqw0XAJ2cfd1OkaOXVKXfqx/UTsc8p6s7HszN3vg
         dVhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhsPUqQRvcO9L4R+VPkRVGDODFaNkZ5XGpXPuoKeu3chebUHLudpmbB+NGA8jT1+omIyu89xG5QMlE8OFiqq1SmCO54w==
X-Gm-Message-State: AOJu0Ywnm9Nk2jf3JrbevnTtcvM28hWKvDDyLmMkfAU5TgnesjiQWj8t
	4/xxOkV4n64qko1NnzthG+tKysBdMvcfynu6VWSizNWDMi0ZDFj+evn9W+AYHjXgJ7joQBWAw0s
	YTG/K7Fzdu6tbSp9BLG7/iupouf8ozbD6FjmPSA==
X-Google-Smtp-Source: AGHT+IEZ5qdBLVvKB5XTD+4JNcNopYd0Qw8YU24zs9LsT+BKNrCyfLvgj0YV5WuY7LflHPoWR30CvJt+jqecqoOosTk=
X-Received: by 2002:a25:2fd2:0:b0:dc2:398b:fa08 with SMTP id
 v201-20020a252fd2000000b00dc2398bfa08mr6083186ybv.31.1711432619981; Mon, 25
 Mar 2024 22:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <20240322233838.868874-2-boqun.feng@gmail.com>
 <068a5983-8216-48a5-9eb5-784a42026836@lunn.ch> <CAH5fLggdVDccDwBa3z+3YfjKFLegh7ZvcSzfhnEbAGSk=THKrw@mail.gmail.com>
 <497668ec-c2d5-4cb4-9c2d-8e6f7129a42e@lunn.ch>
In-Reply-To: <497668ec-c2d5-4cb4-9c2d-8e6f7129a42e@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 26 Mar 2024 01:56:48 -0400
Message-ID: <CALNs47uEE9f73mtoXtJ52wS4nCOjTVxUtyPfQexF1mzHg6W5JA@mail.gmail.com>
Subject: Re: [WIP 1/3] rust: Introduce atomic module
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nicholas Piggin <npiggin@gmail.com>, David Howells <dhowells@redhat.com>, 
	Jade Alglave <j.alglave@ucl.ac.uk>, Luc Maranget <luc.maranget@inria.fr>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, kent.overstreet@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, torvalds@linux-foundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 10:10=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> > > Is it possible to somehow poison rusts own atomics?  I would not be
> > > too surprised if somebody with good Rust knowledge but new to the
> > > kernel tries using Rusts atomics. Either getting the compiler to fail
> > > the build, or it throws an Opps on first invocation would be good.
> >
> > We could try to get a flag added to the Rust standard library that
> > removes the core::sync::atomic module entirely, then pass that flag.
>
> Just looking down the road a bit, are there other features in the
> standard library which are not applicable to Linux kernel space?
> Ideally we want a solution not just for atomics but a generic solution
> which can disable a collection of features? Maybe one by one?

Clippy is an easy way to do this via the disallowed_* lints.
disallowed_types [1] would be applicable here to forbid
`core::atomic::Atomic*`.

I don't think KCI currently checks clippy, but we probably want that
at some point.

- Trevor

[1]: https://rust-lang.github.io/rust-clippy/master/index.html#/disallowed_=
types

> And i assume somebody will try to use Rust in uboot/barebox. It
> probably has similar requirements to the Linux kernel? But what about
> Zephyr? Or VxWorks? Darwin?
>
>         Andrew
>
