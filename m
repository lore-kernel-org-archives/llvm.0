Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DEA53BE
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 14:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734100384; cv=none; b=OqDSKwHOf0vVP3/5knEDdzzXgPxjNXOD9qDg3g/0mgenzT6u+zgqc1is77keuUJOW9wx1tFz6iAL2mJrZ6v20nTdONV2YafTS4FK/Ds3VVjGtI3u5QkgU4QbWxLrh+H8daRWJkNNWLgkPq8BwHR/dny+KJQ+ui2H2Ldpra3RwK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734100384; c=relaxed/simple;
	bh=EuJufx1aFMmSDDvNPI6DU4SHOlqB0i/fifV9p+FF0lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9P5nQa2ZV3BWZDiZ3vW+N66ez0kiAzqyD8iiRbkuNYsrIpf600DoLbPjA6qWkb+I2mnpDwde2fQBlvDzdH4AS+qfaFzSIQ5aKpYjaU4BP+KQCJ6sincMwzs1K/HZpShbiBsCXBI6fPQYL5ff4sygK6ecrBN4zPWDfkrEwJOr/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GWHCQTCp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GWHCQTCp"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862f32a33eso885328f8f.3
        for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 06:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734100381; x=1734705181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YS9LGudJur7kGbLspdnTQuWDC+hZFSTpArars9lBeLQ=;
        b=GWHCQTCp7kOiFOCCoRlknIC/isbtyi+j8dkRWHyc1sDm15OaKMuYJqQnhO9yNA60V9
         lEYO8G15fHICKG9qkqHnlIBrVC81e7na/8oDyR5p4UqtQLeCLPM8OZKNFyGD4FJgTx/1
         WaR7KKvvPgyEQ1Szx2o/IP0CU4nMq8tQBPM6X9kECMy0Rqpj5x8RYzDcTT3Lf7KC9sn8
         KxBShW1voV2ze6uTu853XMB+7r+n+MeUoF2V0xiY+tV9hVoJkDIKNqkIt6o18tBhdvNj
         Q7U/eiKjT6RF5cdEMMDIfmHocWej/mSN/MlxT0a8L9OHNWuuDdr5SKAnuWsAEWSwFMSW
         fm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100381; x=1734705181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YS9LGudJur7kGbLspdnTQuWDC+hZFSTpArars9lBeLQ=;
        b=aSCacqU0zWy23fI8nlFCVjUYuXn2cAfWqE612PTqVcvkTWp3jeuKC/cM6Zj9YP91xa
         1L/54+ZiVPkSmzJSxk6IDTdG9udvxreJlValq4LkJENibfMd7N7igYL5TdXYFRNf/4xB
         fgo1zv8O+yTSc9iNYr7xQKKisZX42Y1FbQc8VG1wx59nlWB0bnwid/1NAeNBLb10ZfJA
         U22MY8/FmSXlqiHLn1Le1zlw21hhSBZpS6RXE7fMSMhaae3XGMtekTfDZIHAraYPJqfF
         yBp1ZQrvNAvzsxRUw4gXk1D4QX9JHK5EeFAwv7jgoB2AOOUwq2Z4UaZJmP8VAneFQg3J
         LVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/l+9HhasUt0tI0i4Hn2lddkAgWUnjajj9R8dX5hh8pJsdAgqQV2F2/OU4+5OJ854pNQnb@lists.linux.dev
X-Gm-Message-State: AOJu0YwbIH5bPFdIHb0En0RicXw1vtlrmqDSS8sTVraD1fyAdFa42MZp
	Jn1fIzKihqBZryQbUmvw1JXjxtU9YirZshd9qJ1GxFHBll2OrTp8YI9TlRvc1qm5urLPHuYHpYn
	Ky5LZxS3q6xlDA8bIjoGKgtzUREWuw08h6XTB
X-Gm-Gg: ASbGncuLaIcQ00805sWRVUfmQV+9EPpIr7IbRWsEkqd4qc5/rr5d6RnUKdIErZXRIn/
	xBsNpqsoT8C4BuBn3MYzIsZfil1McKdO5iFMKdqw=
X-Google-Smtp-Source: AGHT+IGvvc8SEIVkqPspUBW11+fwBIw/V0dhqL0RuVU+1lBeUhFdbOVUzhj6j5lBdtbpP2FKdq6ekBfVUhokO3//J1Y=
X-Received: by 2002:a05:6000:2ad:b0:385:ee59:44eb with SMTP id
 ffacd0b85a97d-3888e0bd28amr2583040f8f.33.1734100380695; Fri, 13 Dec 2024
 06:33:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com> <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
 <Z1seogLmy5H8-hXn@boqun-archlinux>
In-Reply-To: <Z1seogLmy5H8-hXn@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Dec 2024 15:32:47 +0100
Message-ID: <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>
Subject: Re: [RFC v2 04/13] rust: sync: atomic: Add generic atomics
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, lkmm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 6:34=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Dec 12, 2024 at 11:57:07AM +0100, Alice Ryhl wrote:
> [...]
> > > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/at=
omic/generic.rs
> > > new file mode 100644
> > > index 000000000000..204da38e2691
> > > --- /dev/null
> > > +++ b/rust/kernel/sync/atomic/generic.rs
> > > @@ -0,0 +1,253 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +
> > > +//! Generic atomic primitives.
> > > +
> > > +use super::ops::*;
> > > +use super::ordering::*;
> > > +use crate::types::Opaque;
> > > +
> > > +/// A generic atomic variable.
> > > +///
> > > +/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to=
 be chosen.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// Doing an atomic operation while holding a reference of [`Self`] =
won't cause a data race, this
> > > +/// is guaranteed by the safety requirement of [`Self::from_ptr`] an=
d the extra safety requirement
> > > +/// of the usage on pointers returned by [`Self::as_ptr`].
> > > +#[repr(transparent)]
> > > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> > > +
> > > +// SAFETY: `Atomic<T>` is safe to share among execution contexts bec=
ause all accesses are atomic.
> > > +unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
> >
> > Surely it should also be Send?
> >
>
> It's `Send` here because `Opaque<T>` is `Send` when `T` is `Send`. And
> in patch #9, I changed the definition of `AllowAtomic`, which is not a
> subtrait of `Send` anymore, and an `impl Send` block was added there.
>
> > > +/// Atomics that support basic atomic operations.
> > > +///
> > > +/// TODO: Unless the `impl` is a `#[repr(transparet)]` new type of a=
n existing [`AllowAtomic`], the
> > > +/// impl block should be only done in atomic mod. And currently only=
 basic integer types can
> > > +/// implement this trait in atomic mod.
> >
> > What's up with this TODO? Can't you just write an appropriate safety
> > requirement?
> >
>
> Because the limited scope of types that allows atomic is an artificial
> choice, i.e. we want to start with a limited number of types and make
> forward progress, and the types that we don't want to support atomics
> for now are not because of safety reasons, but more of a lack of
> users/motivations. So I don't think this is something we should use
> safety requirement to describe.

I found the wording very confusing. Could you reword it to say
something about future possibilities?

> > > +/// # Safety
> > > +///
> > > +/// [`Self`] must have the same size and alignment as [`Self::Repr`]=
.
> > > +pub unsafe trait AllowAtomic: Sized + Send + Copy {
> > > +    /// The backing atomic implementation type.
> > > +    type Repr: AtomicImpl;
> > > +
> > > +    /// Converts into a [`Self::Repr`].
> > > +    fn into_repr(self) -> Self::Repr;
> > > +
> > > +    /// Converts from a [`Self::Repr`].
> > > +    fn from_repr(repr: Self::Repr) -> Self;
> >
> > What do you need these methods for?
> >
>
> Converting a `AtomicImpl` value (currently only `i32` and `i64`) to a
> `AllowAtomic` value without using transmute in `impl` block of
> `Atomic<T>`. Any better idea?

You could use transmute?

Alice
