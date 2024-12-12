Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519CE211470
	for <llvm@lists.linux.dev>; Thu, 12 Dec 2024 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734000700; cv=none; b=AWbcYPXd8L91uJ0oEYgx4rsOC86wnkOx1gbZAtHP1qFOaMpSsUr3GWcqGVWw6AJgvhoA2mMwa9rOR3p++7zIudo86BHpW7iIwMYWrNFaN9MUNVeNDukgH0cW5uReR/85RedJUK9qSiMsvJ5akbumNaneqd88MZKhCaBs5P1C108=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734000700; c=relaxed/simple;
	bh=r8PedwbATslMjHn8HdkHK7/SPqYwOBI7VaWxxuig9FE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/FwLafX0gKkBmMQ4pBmAX6tjoStLTlNcY6Sw1u/6g5ECsxDU6ZEH5D/qJfJAet1Hsk0MmBOMoWDXCLHuon24cGFS1k6pRw4blkIE2oYxeLr6oCFX3gDMnSx95ttuCRn5cQIUoav8SbS1DLASdJdGASo6HjlqoNgQk9dIsK4v/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uy5AInZF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uy5AInZF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434ab114753so2980105e9.0
        for <llvm@lists.linux.dev>; Thu, 12 Dec 2024 02:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734000695; x=1734605495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtpsjC48mE/nmTjT+Q7/MwVuoD24o44fCuhvsg4pi50=;
        b=Uy5AInZFgFHdF9eDMby/Mhfg96v93KaC4n/zbpjVoGUt+roriemI/ufPKpO1XcDBxk
         L92lx9LiZGXrpAWU2ZzSWWy3h2fCs1p3rj8JMjCzqwlONY12mrhGK4ktJ9gnf1ECyj6o
         sKflDFF7no6cnbPo8mHdMAbGd9DrmYQG6uD3Rk86hVoz0ksPDChXjjqhyfwJ/q7anDXE
         abk/GTDjeGgRJiSTr9q0RxFKZwpMdh+BtRuyzQFeziVw+DcRu4D2Z7Cp2VjpiMrUWvGm
         heB04+how5cXybTGtEV7cclZUfuwZxOO0L9SJl05t57t4WeLldwDwCom1GpkDXKsqVzi
         TmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734000695; x=1734605495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtpsjC48mE/nmTjT+Q7/MwVuoD24o44fCuhvsg4pi50=;
        b=NeCNgNG9r1jJ/t8zAUPBrV9vd1W0M/sR8k5FbIVLDPXYgXaqjAFieN7w/Y0Zqf2k5f
         WLn2Cti6m6KLQTH65sRoridx31XOo7A1xr5Yz4s/ejqfNidDOo0nx69yai40/yL6XTs4
         pItezwCl73J72Zx3wJ3Nzxtu4366ekUgWC7IL+kpoXzy2L0pyUgiyji+7yaA3DChkx8h
         E1Reco0xN1RDzg78aM7ydq0gfW0zG5MOSZy3M6CgvJVG+92gUD8kw+pX3L8sqJ3uDd6O
         dCwrb1q6R/MBpoTN40fP6JAgqazYfhWXFHGzhbqOODND4dh0juyQcJqS4CuAeMahX4KY
         TxjA==
X-Forwarded-Encrypted: i=1; AJvYcCUrH0DXMT6g01Qilnf4Gqb/2Her8NZScCtp53XD+8m2WY+4csZJTN1jtfV0UNhgSHOStiBk@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxby4uR719vMK3oTjE1mtygvxqRSnVy3yoN13q7vWHi1BxGLNi
	phKEbbZ/cznF4gB/ya+udViwL0qgFg9XSd6yqlvgc28RCT6bOS4XZ4q5m035jI5ZlcwEy7YnAYi
	QEO9qIXd1kAjL3jVwoXBgE3orjViyrpgvOBSX
X-Gm-Gg: ASbGncut4WqkT4kd6/0nFhwUQEWEhbe5G2fnSIM58JIAOShxJemOdpU2QrFxWjp/YYg
	31QMspNEhiSd1x2IEyeZHtmP05dk683ImMuWmZxj2jvW14v/hN8TOlsjvje078MZdhC46
X-Google-Smtp-Source: AGHT+IHyygeSxJyNs1AB/t8h2oWE3zrmWEnc+tMnMhN05YyXp5Tg5F9O0X+SggrM6je5HiwFGxlS9nrxUkLK1wXEwpM=
X-Received: by 2002:a05:600c:5101:b0:434:a1d3:a331 with SMTP id
 5b1f17b1804b1-4361c3e2350mr42431505e9.22.1734000695440; Thu, 12 Dec 2024
 02:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241101060237.1185533-1-boqun.feng@gmail.com> <20241101060237.1185533-3-boqun.feng@gmail.com>
In-Reply-To: <20241101060237.1185533-3-boqun.feng@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Dec 2024 11:51:23 +0100
Message-ID: <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
Subject: Re: [RFC v2 02/13] rust: sync: Add basic atomic operation mapping framework
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

On Fri, Nov 1, 2024 at 7:03=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> Preparation for generic atomic implementation. To unify the
> ipmlementation of a generic method over `i32` and `i64`, the C side
> atomic methods need to be grouped so that in a generic method, they can
> be referred as <type>::<method>, otherwise their parameters and return
> value are different between `i32` and `i64`, which would require using
> `transmute()` to unify the type into a `T`.
>
> Introduce `AtomicIpml` to represent a basic type in Rust that has the
> direct mapping to an atomic implementation from C. This trait is sealed,
> and currently only `i32` and `i64` ipml this.

There seems to be quite a few instances of "impl" spelled as "ipml" here.

> Further, different methods are put into different `*Ops` trait groups,
> and this is for the future when smaller types like `i8`/`i16` are
> supported but only with a limited set of API (e.g. only set(), load(),
> xchg() and cmpxchg(), no add() or sub() etc).
>
> While the atomic mod is introduced, documentation is also added for
> memory models and data races.
>
> Also bump my role to the maintainer of ATOMIC INFRASTRUCTURE to reflect
> my responsiblity on the Rust atomic mod.
>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  MAINTAINERS                    |   4 +-
>  rust/kernel/sync.rs            |   1 +
>  rust/kernel/sync/atomic.rs     |  19 ++++
>  rust/kernel/sync/atomic/ops.rs | 199 +++++++++++++++++++++++++++++++++
>  4 files changed, 222 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/sync/atomic.rs
>  create mode 100644 rust/kernel/sync/atomic/ops.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b77f4495dcf4..e09471027a63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3635,7 +3635,7 @@ F:        drivers/input/touchscreen/atmel_mxt_ts.c
>  ATOMIC INFRASTRUCTURE
>  M:     Will Deacon <will@kernel.org>
>  M:     Peter Zijlstra <peterz@infradead.org>
> -R:     Boqun Feng <boqun.feng@gmail.com>
> +M:     Boqun Feng <boqun.feng@gmail.com>
>  R:     Mark Rutland <mark.rutland@arm.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Maintained
> @@ -3644,6 +3644,8 @@ F:        arch/*/include/asm/atomic*.h
>  F:     include/*/atomic*.h
>  F:     include/linux/refcount.h
>  F:     scripts/atomic/
> +F:     rust/kernel/sync/atomic.rs
> +F:     rust/kernel/sync/atomic/

This is why mod.rs files are superior :)

> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Atomic primitives.
> +//!
> +//! These primitives have the same semantics as their C counterparts: an=
d the precise definitions of
> +//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (C=
onsistency) Model is the
> +//! only model for Rust code in kernel, and Rust's own atomics should be=
 avoided.
> +//!
> +//! # Data races
> +//!
> +//! [`LKMM`] atomics have different rules regarding data races:
> +//!
> +//! - A normal read doesn't data-race with an atomic read.

This was fixed:
https://github.com/rust-lang/rust/pull/128778

> +mod private {
> +    /// Sealed trait marker to disable customized impls on atomic implem=
entation traits.
> +    pub trait Sealed {}
> +}

Just make the trait unsafe?

Alice
