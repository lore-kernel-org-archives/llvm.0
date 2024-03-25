Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE2C152
	for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 17:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711388706; cv=none; b=KpSfuKtT+w1pQO2z+tjHF+PP+2UoiSaLffKEdkk1JY8XyRwwO4S5JQhimagohsrUDbLXMrtpQ/boN6PNjSMYETz0vVn0vF1BDunM9kZBn8lJeKvF2tfcqzwPA7UH8suZ9kEUokPAWN1c6rzccUBn3FcMqwtRwPeyEAkBZnWyyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711388706; c=relaxed/simple;
	bh=TpmJTEOgQOHM9HmdS/G5PTDNlrGN/J8csNvsXEYpiFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nfv52UNZQ7uAvF5POThSQ6F6ecuWEiLfLoauNVtrpXLEYO52rqOsNSdGrQ8/VQ8pQi2iNWIKqF/QN0BJ0T7RwzkhGyS1JJf7Xtn6lBBlNeMb5+sz87jARzLfnv4TF6gyi1bZWrIxPg1xb4pst37NlifDKzeScGm89vRNV9pdz4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZqWxsyEP; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZqWxsyEP"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c12c73ed8so1591102a12.2
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711388701; x=1711993501; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sd/wp9UpBSQuIXx6uQdvepokZABl7yLFwM775FKBHzQ=;
        b=ZqWxsyEPMUzIZkHXdDGr5FFFUaaRoyth80o5HIulNZY2AGW9ozWJe01gF28ZoQHX6O
         gbPxGpcQWzuZPSk1FWhnNitJCN9IorJnmnxgeXzYmaHL1ZcX0zCniVsR1Tn4dkWBL3ec
         IhUzEwazNEQXHcYxqBfX3tCgXAapQBmmrxcU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711388701; x=1711993501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sd/wp9UpBSQuIXx6uQdvepokZABl7yLFwM775FKBHzQ=;
        b=tjYSmmtp3R90ytDY5pyfBi6lz8gpaZMvyogMQiZ+M6ofJI3GZUAbN6rxvb3w+okmk7
         VptQcBEMmLyPpbhTLkBASF1tRaLoyubQooUA2eSp9X7AG0Dt8I2Bkt42MR413lVfw/ui
         nOxmDD5yMBFGni9GDemgCdhcarodqPOROqKGm+UIoQyz49yY1Il43rAr5sIGVy+WF7X/
         TDHTF34kc3MCFLPBNm3soFqPjb8Q1pJTLGSOTOb2hFI1/nWzwfkaYQDQ/vUC0fsKVl04
         uBlYaMMr9xZYWRWQoJQNnoCyPt0rHvCmWyz7Dc19sbe7u6ELruIuqtX+PHSKq+fi3ppN
         1FNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqj3h0wohT8aY/kRympXVK2Oe5mXpdT+w4R+CwTPtgPoNvbdfYgxwcoWffItut5LLtTZZ8qeHOpf44gYsZ9l6MNXK34w==
X-Gm-Message-State: AOJu0Yylvi0nKaQy0V9XoBG1TuccnMdVbLTmlhuukatIu2N6Qo/JU7WU
	KcNhutj0278rW0178VQN5yACYrCcxmh8TuWTlLDi6il4jAJjb4fHjxndYEogxOL6vCLQ6/n6EKO
	agmSizQ==
X-Google-Smtp-Source: AGHT+IExVqAxadlw7cp99OKH1j15VZpdONQzxBbG357YI+aWvH0T0Jvlgg5ZObpG9LAmYEvxbhYskQ==
X-Received: by 2002:a50:ccd4:0:b0:568:cdf3:5cb2 with SMTP id b20-20020a50ccd4000000b00568cdf35cb2mr6677844edj.30.1711388701102;
        Mon, 25 Mar 2024 10:45:01 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id c36-20020a509fa7000000b0056bdec673c3sm3327868edf.38.2024.03.25.10.45.00
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 10:45:00 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a466e53f8c0so608198066b.1
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 10:45:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPcd5k9EI0R5p48yk6QT9uF/NiV/dNlLXmZ2UuQxBQAzsB/uxlwil92LVO/SbeBcfsEmXFm0kqna/qz+DoSxFCVYdoag==
X-Received: by 2002:a17:906:6dc4:b0:a45:94bf:18e6 with SMTP id
 j4-20020a1709066dc400b00a4594bf18e6mr5614781ejt.73.1711388700462; Mon, 25 Mar
 2024 10:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
 <u2suttqa4c423q4ojehbucaxsm6wguqtgouj7vudp55jmuivq3@okzfgryarwnv>
 <CAHk-=whkQk=zq5XiMcaU3xj4v69+jyoP-y6Sywhq-TvxSSvfEA@mail.gmail.com> <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
In-Reply-To: <c51227c9a4103ad1de43fc3cda5396b1196c31d7.camel@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 25 Mar 2024 10:44:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
Message-ID: <CAHk-=wjP1i014DGPKTsAC6TpByC3xeNHDjVA4E4gsnzUgJBYBQ@mail.gmail.com>
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
To: Philipp Stanner <pstanner@redhat.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Mon, 25 Mar 2024 at 06:57, Philipp Stanner <pstanner@redhat.com> wrote:
>
> On Fri, 2024-03-22 at 17:36 -0700, Linus Torvalds wrote:
> >
> > It's kind of like our "volatile" usage. If you read the C (and C++)
> > standards, you'll find that you should use "volatile" on data types.
> > That's almost *never* what the kernel does. The kernel uses
> > "volatile"
> > in _code_ (ie READ_ONCE() etc), and uses it by casting etc.
> >
> > Compiler people don't tend to really like those kinds of things.
>
> Just for my understanding: Why don't they like it?

So I actually think most compiler people are perfectly fine with the
kernel model of mostly doing 'volatile' not on the data structures
themselves, but as accesses through casts.

It's very traditional C, and there's actually nothing particularly odd
about it. Not even from a compiler standpoint.

In fact, I personally will argue that it is fundamentally wrong to
think that the underlying data has to be volatile. A variable may be
entirely stable in some cases (ie locks held), but not in others.

So it's not the *variable* (aka "object") that is 'volatile', it's the
*context* that makes a particular access volatile.

That explains why the kernel has basically zero actual volatile
objects, and 99% of all volatile accesses are done through accessor
functions that use a cast to mark a particular access volatile.

But I've had negative comments from compiler people who read the
standards as language lawyers (which honestly, I despise - it's always
possible to try to argue what the meaning of some wording is), and
particularly C++ people used to be very very antsy about "volatile".

They had some truly _serious_ problems with volatile.

The C++ people spent absolutely insane amounts of time arguing about
"volatile objects" vs "accesses", and how an access through a cast
didn't make the underlying object volatile etc.

There were endless discussions because a lvalue isn't supposed to be
an access (an lvalue is something that is being acted on, and it
shouldn't imply an access because an access will then cause other
things in C++). So a statement expression that was just an lvalue
shouldn't imply an access in C++ originally, but obviously when the
thing was volatile it *had* to do so, and there was gnashing of teeth
over this all.

And all of it was purely semantic nitpicking about random wording. The
C++ people finally tried to save face by claiming that it was always
the C (not C++) rules that were unclear, and introduced the notion of
"glvalue", and it's all good now, but there's literally decades of
language lawyering and pointless nitpicking about the difference
between "objects" and "accesses".

Sane people didn't care, but if you reported a compiler bug about
volatile use, you had better be ready to sit back and be flamed for
how your volatile pointer cast wasn't an "object" and that the
compiler that clearly generated wrong code was technically correct,
and that your mother was a hamster.

It's a bit like the NULL debacle. Another thing that took the C++
people a couple of decades to admit they were wrong all along, and
that NULL isn't actually 'integer zero' in any sane language that
claims to care deeply about types.

[ And again, to save face, at no point did they say "ok, '(void *)0'
is fine" - they introduced a new __nullptr thing just so that they
wouldn't have to admit that their decades of arguing was just them
being wrong. You'll find another decade of arguments explaining the
finer details about _that_ difference ]

It turns out that the people who are language-lawyering nitpickers are
then happy to be "proven right" by adding some more pointless
syntacting language-lawyering language.

Which I guess makes sense, but to the rest of us it all looks a bit pointless.

                  Linus
