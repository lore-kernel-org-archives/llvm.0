Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A27F
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711154182; cv=none; b=XuLdcJcAOvhvZC3shYk7sQPp6epkWdqbBLi00CdFWq4hYNmoSLV1wDgkhfQUHzCoqxpwoehBOHQvKP1R+gv4bP5aZG7YBTPaES/Vojbxtp5hjBwB7Z0+JH6zOhBckhMh7F2+bvHG8wPLXdtMq2mBa1n4PCNntt5Hx2OIljUjg8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711154182; c=relaxed/simple;
	bh=j7JyDQ2Yopzv+1fWqR18eqoGt0JNvJeLXCqR09mac8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+g24kn9PvOFLvbVdBsv1aQJtanI430i8MCaxRTR0vNHX2aG7sdINpa09prJdSAMkhJiw6eK2jyHy05ncpnKnOYFUoYwonEa4uSVI7DG4VHl8VezPxols2cbY8uEBDi22RDXvSE1LUobVqxr5eCsl02Sq5cUtUhvDelFfkC8Ef4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LcTqmUTB; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LcTqmUTB"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513cf9bacf1so3660993e87.0
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711154178; x=1711758978; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNrld7J3rRC7RvH2KCmmyzFGDmF8jJ8gCeKdRT3S6xQ=;
        b=LcTqmUTBThlq5bpVN9IBtrKguIOaVcBO7lDNlE5UCANALFGUAlERz1LtzzZdOujBQI
         AM/LDeiVHDVt2bthM2Q3sdraTRDoCKPnbkY1f9gv6TuROsm8AvX66eb7WW3t66OLgG+D
         7gFStQTgy4HA62ZZ96NPDNWWNs3bbeQXMI0w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711154178; x=1711758978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNrld7J3rRC7RvH2KCmmyzFGDmF8jJ8gCeKdRT3S6xQ=;
        b=nlskFfCAgCcr6Li+67a55iEK0h+3dVfER4BfXBWKOPoOZl+5KWGFJci5vi5jau7cDY
         jTQehbeYPGfbKM4CejTfz8gQS1G4UOwUVuawsDgmXkF0dB5C4lJiJjlcViNB1M4OmRgy
         SASRZB94EcXAuw1AuMul/vr51NA/luxHAGWt5+cgfdgDAW7EhHl4fgFN0ptugj79Hu7j
         XuoT3m1qv6nEw0eeAobVM5wW5xchJlAigpkw3Bz8db2nN3EuXstZFpV9GQQx6ig6yAGg
         +KNOYCYK4YLcRq4jFZYJqDpazFIKeMulQzHFJ2zcDZUtCQZ6SER7wHOU79N9QUkuvkNb
         OHwA==
X-Forwarded-Encrypted: i=1; AJvYcCWLYIOtua09gsLJKT8iAZB+WG1g1iM6VWtqqOUGVlI3LbCRZaWQvAGyQkfoIPHKF9RUAuFerUVWH3xMWHF9fZBpBR4JiA==
X-Gm-Message-State: AOJu0YwYDo8zCbP2zThyQ56/3WQjzjpsAHc/rwK97KhbyyvGKl/I5q1+
	gQsNV+wW81n9CsVDX9hy3GfIIWaw9Mgqowj01t/tnGW672/WJxvVovjKXDndZ29c/milsTYRoLa
	tE4MtQA==
X-Google-Smtp-Source: AGHT+IHoBAxcNi+XlDsoozH0adgQeoBRtKXWrTNTFoGFiSKRil3ud2Jt7BHkUdhEgVchUzm6ljXIRg==
X-Received: by 2002:a19:5e1a:0:b0:515:9474:2fca with SMTP id s26-20020a195e1a000000b0051594742fcamr794065lfb.5.1711154178038;
        Fri, 22 Mar 2024 17:36:18 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id v20-20020a197414000000b005158d350d78sm102542lfe.1.2024.03.22.17.36.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 17:36:17 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513dd2d2415so2826040e87.3
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkxqhph/G/idh5jIaqDvmCfyDD6rpfPeb2xfU8a0xwIekNdF62cSK+JDs56/m+oI4wZncD4QcXKCD+aSN6Sfv+of/kxw==
X-Received: by 2002:a19:f806:0:b0:515:9d4a:d580 with SMTP id
 a6-20020a19f806000000b005159d4ad580mr604299lff.26.1711154177346; Fri, 22 Mar
 2024 17:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com> <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
In-Reply-To: <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Mar 2024 17:36:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
Message-ID: <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Boqun Feng <boqun.feng@gmail.com>, rust-for-linux@vger.kernel.org, 
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
	"H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 17:21, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> Besides that there's cross arch support to think about - it's hard to
> imagine us ever ditching our own atomics.

Well, that's one of the advantages of using compiler builtins -
projects that do want cross-architecture support, but that aren't
actually maintaining their _own_ architecture support.

So I very much see the lure of compiler support for that kind of
situation - to write portable code without having to know or care
about architecture details.

This is one reason I think the kernel is kind of odd and special -
because in the kernel, we obviously very fundamentally have to care
about the architecture details _anyway_, so then having the
architecture also define things like atomics is just a pretty small
(and relatively straightforward) detail.

The same argument goes for compiler builtins vs inline asm. In the
kernel, we have to have people who are intimately familiar with the
architecture _anyway_, so inline asms and architecture-specific header
files aren't some big pain-point: they'd be needed _anyway_.

But in some random user level program, where all you want is an
efficient way to do "find first bit"? Then using a compiler intrinsic
makes a lot more sense.

> I was thinking about something more incremental - just an optional mode
> where our atomics were C atomics underneath. It'd probably give the
> compiler people a much more effective way to test their stuff than
> anything they have now.

I suspect it might be painful, and some compiler people would throw
their hands up in horror, because the C++ atomics model is based
fairly solidly on atomic types, and the kernel memory model is much
more fluid.

Boqun already mentioned the "mixing access sizes", which is actually
quite fundamental in the kernel, where we play lots of games with that
(typically around locking, where you find patterns line unlock writing
a zero to a single byte, even though the whole lock data structure is
a word). And sometimes the access size games are very explicit (eg
lib/lockref.c).

But it actually goes deeper than that. While we do have "atomic_t" etc
for arithmetic atomics, and that probably would map fairly well to C++
atomics, in other cases we simply base our atomics not on _types_, but
on code.

IOW, we do things like "cmpxchg()", and the target of that atomic
access is just a regular data structure field.

It's kind of like our "volatile" usage. If you read the C (and C++)
standards, you'll find that you should use "volatile" on data types.
That's almost *never* what the kernel does. The kernel uses "volatile"
in _code_ (ie READ_ONCE() etc), and uses it by casting etc.

Compiler people don't tend to really like those kinds of things.

            Linus
