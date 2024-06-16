Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A06CF9EC
	for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 15:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718550911; cv=none; b=IXWcv/X/mV6C5fxoSpNlyJMkiJqWc9BPrzPBZZNyYIpqy6U7LveQkoC7QsTyd88pcFF97BvF8LbyqGTeGDwOiYjnh7VRZgoiSKIkc9gij/xhOU6CIiRtm8ciuVF+jIZDBb1ast/t5sU9SBJKIwz08JsfwWfpPKbFu3Ksx3x9i5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718550911; c=relaxed/simple;
	bh=RAT6eJkvQNBYzHrJe9vp69HJtSQHPhlPr8onQuHx9II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ7qUAP0vD7M4CnD0d0q9YE9tzc9j0oEVJX6D5O4mN8I2YIXMvEc1xOROoYFrlxxQjJhql7Gfv4LfW1e5vOe/c+tbuCrt7M1jweIvTWhOgAwqytYD2GUW3r50LiN+SnDdSSj/VIZu9kgGJXbKAdXH9s+pqZWU+IY232OO7F4xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSsQWrwW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSsQWrwW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so2200737a12.2
        for <llvm@lists.linux.dev>; Sun, 16 Jun 2024 08:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718550909; x=1719155709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAT6eJkvQNBYzHrJe9vp69HJtSQHPhlPr8onQuHx9II=;
        b=CSsQWrwW7KaTu1ygg9FPdzvcdJwzMJAbn9+WFhmDnjsHgE6f3ZOoziOi8HdVbE1PAW
         NJcLL5ksyianKKcskD2FSLFA7VqpHuh5PqRsexFoy5tLrL16wOC5DECMeLzXLQpY4J7L
         5xSqTVUF66MPz6nBa4NhpP84C9djSRS9mHCkqZUWKKZ3ZAcqHE8o7WCMJJ0vjE/dpBWJ
         PCWY68q/EmtGmL7lWdmD3PWaM3csj+fKa6VChWMIYggkCUxOpk2hTxnJuHK0XPUGNrDM
         vwRoxdlYISxA4cz5jiRZCpah5O4EeEuUYVsrOd8IvOe0hdvu1Qxtyx8wDYAaikkn2bJ8
         /4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718550909; x=1719155709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAT6eJkvQNBYzHrJe9vp69HJtSQHPhlPr8onQuHx9II=;
        b=qyqB22Vj6oRC8/Ol+w8ZWEBRy6U+vTW4aibFpRUl2XcYcEg0qQtg44MGhuqNPhLK8/
         SmK9p4ttWpDV9g1EqCyEfAMhLwgqdQS9aMdom+cGIDUmNHfEw/2xjq8+rGnCZgpAF7gx
         0g580zzVbkyrgKmDujSsW2CdYkntI9QpTzc4MDk5E5g8ZJtG5otj6DnSnRg9VwM3QFCZ
         VC4ZZjGkzKPQD846CB2wfhs3sczLbb7ptm1D+AJqv813WaY548yh77AyxenP95ETubes
         K3vBreWVa+n7Rr8WBN+KENqph+ZNbBJd4KHRHUjMOTrpP4Pn33reoV5XNJSy5LWgT1Bb
         agIQ==
X-Forwarded-Encrypted: i=1; AJvYcCURpR292AKxkQYzW/dWzKJcBgn2XDKCztbjSlqEB9/gUALp9aNk0xLVaP5Bluj7LlRtCYIw/3Fr1b9rqHcb9ErS4HvC9g==
X-Gm-Message-State: AOJu0YwLGDyUtnVbK05jO4GmFZqHW0uLVZ6zU0eu+IFR33tgqmm7bz+d
	t1DkTIwdf9+FI8gGrp2VV3E5LQZUVZKbg26u3eXi+oeoncpX9sRejUzUoBUZR3yjBQPwX3nxk64
	kBQpJKk8FcSHwoGX7p+dkOhuX304=
X-Google-Smtp-Source: AGHT+IExmw4UHjrDbI2Fok1Zstrtac7O3xd+idP6ayK7NE1EvBrJI1L9WqD6wi1jWXgLJrEp0r+SENj7fdmcskqJ//Q=
X-Received: by 2002:a05:6a20:4924:b0:1bc:9a9e:364c with SMTP id
 adf61e73a8af0-1bc9a9e3735mr472152637.49.1718550909151; Sun, 16 Jun 2024
 08:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZmseosxVQXdsQjNB@boqun-archlinux> <CANiq72myhoCCWs7j0eZuxfoYMbTez7cPa795T57+gz2Dpd+xAw@mail.gmail.com>
 <ZmtC7h7v1t6XJ6EI@boqun-archlinux> <CANiq72=JdqTRPiUfT=-YMTTN+bHeAe2Pba8nERxU3cN8Q-BEOw@mail.gmail.com>
 <ZmxUxaIwHWnB42h-@Boquns-Mac-mini.home> <c1c45a2e-afdf-40a6-9f44-142752368d5e@proton.me>
 <ZmzvVr7lYfR6Dpca@Boquns-Mac-mini.home> <b692945b-8fa4-4918-93f6-783fbcde375c@proton.me>
 <Zm4R0XwTpsASpBhx@Boquns-Mac-mini.home> <5lwylk6fhlvqfgxmt7xdoxdrhtvmplo5kazpdbt3kxpnlltxit@v5xbpiv3dnqq>
 <Zm7zvt7cNT2YpiIi@Boquns-Mac-mini.home>
In-Reply-To: <Zm7zvt7cNT2YpiIi@Boquns-Mac-mini.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 16 Jun 2024 17:14:56 +0200
Message-ID: <CANiq72mz=OzzHJJyOPeWcxEtppP+v0KUq63_u5NB7-R84avaPg@mail.gmail.com>
Subject: Re: [RFC 2/2] rust: sync: Add atomic support
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Benno Lossin <benno.lossin@proton.me>, 
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
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
	Trevor Gross <tmgross@umich.edu>, dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 4:16=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Hmm? Have you seen the email I replied to John, a broader Rust community
> seems doesn't appreciate the idea of generic atomics.

I don't think we can easily draw that conclusion from those download
numbers / dependent crates.

portable-atomic may be more popular simply because it provides
features for platforms the standard library does not. The interface
being generic or not may have nothing to do with it. Or perhaps
because it has a 1.x version, while the other doesn't, etc.

In fact, the atomic crate is essentially about providing `Atomic<T>`,
so one could argue that all those downloads are precisely from people
that want a generic atomic.

Moreover, I noticed portable-atomic's issue #1 in GitHub is,
precisely, adding `Atomic<T>` support. The maintainer has a PR for
that updated over time, most recently a few hours ago.

There is also `AtomicCell<T>` from crossbeam, which is the first
feature listed in its docs.

Anyway...

The way I see it, both approaches seem similar (i.e. for what we are
going to use them for today, at least) and neither apparently has a
major downside today for those use cases (apart from needed refactors
later to go to another approach).

(By the "generic approach", by the way, I mean just providing
`Atomic<{i32,i64}>`, not a complex design)

So it is up to you on what you send for the non-RFC patches, of
course, and if nobody has the time / wants to do the work for the
"simple" generic approach, then we can just go ahead with this for the
moment. But I think it would be nice to at least consider the "simple"
generic approach to see how much worse it would be.

Other bits to consider, that perhaps give you arguments for one or the
other: consequences on the compilation time, on inlining, on the error
messages for new users, on the generated documentation, on how easy to
grep they are, etc.

Cheers,
Miguel
