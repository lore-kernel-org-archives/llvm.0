Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034E129E9A
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556188; cv=none; b=JrFNMiP8Y9yyg/nwg8J7s41Teg/g8gfJMr7oW50BJ0OtWnu252SN4xPaI9VOHdveFuARF5SshV3AfZBzxXp1WdO0aftzyKpKw7wHHG89j5PoqdKCPA8RragN02ZAjvVsg3ejHrn/mWfOGedGZZIhgrLPCwHuLXo/Du9LZ2EoHAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556188; c=relaxed/simple;
	bh=kfVdwdCf7B9X7O5+oO8Vigvx4JOZ1iSnjiYAU8Orp7A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tn8fGV1sg2bUsLjQezhhkTAScRKl+cn/zHLhvvUXly7rkpn/JuyPal/17W05Omolwk/XxkwoFZqC12PumBARXUZzaCUgil2sxgoL2Y8nzQAna5owDhU2SM//MIe4aex3sllktgLG+FMysGZjvgVBIDXRDRjYBVoAgWewuwz0+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdZsVHFV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdZsVHFV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29b7164eef6so23481a91.2
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711556186; x=1712160986; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSCcPL9ReYBC3ieN7sRSJkCjHUDGGaoDNVjenjFddiw=;
        b=kdZsVHFV18vv7/uc9A09HEdtF4rLxAhI1tzqGeQgrBg/6LJyXDXMjaJBxd9KcSBDom
         a9NPsUJqL+DtmaoD2RdmixfNr7mkekMlxXdg5PcM/4yU79ujlB6Ngatf/N7WqhCDOCUs
         Bdzw3nVCBd8/WKByKh7cT+B41EJuZ6xHGWBkYHG29D4XctchU5Zohlb7WaqwiUCHGw3G
         8436AIKVlw12sPcu3TxgG3Hd70R2a0Tn5vIBUZFixhWMX2/77aAswnr0YpZIJ+oSpyPQ
         SKc9hWF7C4a3urApfiTn8iXGY6UxeffnOK/AKIM47IBH6k1Jl4V92CVz8XbIJXzQJGRe
         s4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711556186; x=1712160986;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSCcPL9ReYBC3ieN7sRSJkCjHUDGGaoDNVjenjFddiw=;
        b=UIytrRwJAd9XcfbbVOqPLhmN4eenAfBxhselxOk7Jx71bg4uxXB7sUHzyVQ6MtIBk0
         oMy47N4CPCPbocYHPY6XDMywdczygpirUdRA2QgYL6CXlLCUVsODHbS16+0IjwvznLjh
         Wqu7OQxlkg5n8wEdyArmcVl8zd3CYeXDSQoimTkTKazou2Ec8sw6o1cnJAyKIGnp2Hu3
         udmLcN4Ap/eYWhJnT3rcjnD1/nbO2EUnJ/KR5BlslyAD2U2QBAIrcbaxT/9psRqqAS0h
         eoUBASiIDRzCjpHcRR0syWprEtJ9XkKp4LfoXcwHkbAihqq3918+mAkuSKw0yMngVmFx
         9UOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7OO3X8IIwOMY92NbzpNAhTcaT5DYvVFNJu7E33JkLvf03EI4uqusXm8/U74o7o78rEdbERSXrqwCciwDWvCVBo3qviQ==
X-Gm-Message-State: AOJu0YwmqYjpo6DsVAyh+nSJXyIyi4F2EI38/kZMTrtxZRDqp7zo3c90
	xAAIHjf926N/FI95+hnxlj+vE46GNsxV3WBhbhdcF+LnBAmYls92DkcuniPD7xc=
X-Google-Smtp-Source: AGHT+IFb5IqfgxBvySBVcYNKgghJ48Dnwn4nEVJk9rDb4Sdzmwo0ZtCk8BBaNaurYYvMG+RdbrIyPw==
X-Received: by 2002:a17:90b:4a44:b0:29c:7845:cba with SMTP id lb4-20020a17090b4a4400b0029c78450cbamr100758pjb.36.1711556186202;
        Wed, 27 Mar 2024 09:16:26 -0700 (PDT)
Received: from smtpclient.apple ([2601:647:4d7e:dba0:5840:a196:2bf3:3600])
        by smtp.gmail.com with ESMTPSA id sl13-20020a17090b2e0d00b0029951d04dc4sm1903536pjb.54.2024.03.27.09.16.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Mar 2024 09:16:25 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
From: comex <comexk@gmail.com>
In-Reply-To: <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
Date: Wed, 27 Mar 2024 09:16:09 -0700
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Philipp Stanner <pstanner@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>,
 Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>,
 Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 kent.overstreet@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <160DB953-1588-418E-A490-381009CD8DE0@gmail.com>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
 <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
 <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
 <bu3seu56hfozsvgpdqjarbdkqo3lsjfc4lhluk5oj456xmrjc7@lfbbjxuf4rpv>
 <CAHk-=wgLGWBXvNODAkzkVHEj7zrrnTq_hzMft62nKNkaL89ZGQ@mail.gmail.com>
 <ZgIRXL5YM2AwBD0Y@gallifrey>
 <CAHk-=wjwxKD9CxYsf5x+K5fJbJa_JYZh1eKB4PT5cZJq1+foGw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)

On Mar 25, 2024, at 8:49=E2=80=AFPM, Linus Torvalds =
<torvalds@linux-foundation.org> wrote:

> But you should _start_ the design of your language memory model around
> the unsafe "raw atomic access operations" model.
>=20
> Then you can use those strictly more powerful operations, and you
> create an object model *around* it.

To some extent Rust does this already, unlike C++.

C++ allows atomics to be implemented using locks.  Partly for this =
reason,
`std::atomic<T>` is documented as not necessarily having the same
representation as `T` [1].  C++ also has strict aliasing, so even if =
those types
do have the same representation, you still can't cast `T *` to
`std::atomic<T> *`.

But Rust atomics are lower-level.  First, they are guaranteed lock-free =
[2].
Second, they are documented as having "the same in-memory representation =
as the
underlying" type [3].  (They also usually have the same alignment, =
except on
x86 where u64 is only 4-byte aligned but AtomicU64 of course needs to be =
8-byte
aligned.)  Meanwhile, Rust intentionally lacks strict aliasing.

Combined, this means it's perfectly legal in Rust to cast e.g. `&mut =
u32` to
`&AtomicU32` and perform atomic accesses on it.  Or the same with =
u64/AtomicU64
if you know the pointer is validly aligned.  This is by design; the =
Atomic
types' methods are considered the official way to perform atomic =
operations on
arbitrary memory, making it unnecessary to also stabilize 'lower-level'
intrinsics.

That said, there *are* currently some holes in Rust's atomics model, =
based on
the fact that it's mostly inherited from C++.  =46rom the documentation:

> Since C++ does not support mixing atomic and non-atomic accesses, or
> non-synchronized different-sized accesses to the same data, Rust does =
not
> support those operations either. Note that both of those restrictions =
only
> apply if the accesses are non-synchronized.
https://doc.rust-lang.org/std/sync/atomic/index.html

There are some open issues around this:

- "How can we allow read-read races between atomic and non-atomic =
accesses?"
  https://github.com/rust-lang/unsafe-code-guidelines/issues/483

  > [..] I do think we should allow such code. However, then we have to =
change
  > the way we document our atomics [..]

- "What about: mixed-size atomic accesses"
  https://github.com/rust-lang/unsafe-code-guidelines/issues/345"

  > Apparently the x86 manual says you "should" not do this [..] It is =
unclear
  > what "should" means (or what anything else here really means, =
operationally
  > speaking...)

[1] https://eel.is/c++draft/atomics#types.generic.general-3
[2] https://doc.rust-lang.org/std/sync/atomic/index.html#portability
[3] =
https://doc.rust-lang.org/nightly/std/sync/atomic/struct.AtomicU64.html

