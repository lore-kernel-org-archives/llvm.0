Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BA7F
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 00:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711152770; cv=none; b=GenJn+9pZ+ZLI8jyo3o+CceQG5KPFcY0rn8kcEjlTDQh3eGM9ThPZzVhqLGCdDe+u7Ce1O+AaT9PVe1zfwgrZoe1OwnJFst9h1qaLR/4QbFteG5O/pR+gwhdSusLAg9IN7AKz6otcEgBJIWSY6q8ZWuiIUhOg8VBaE9AEI/QDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711152770; c=relaxed/simple;
	bh=buaytYj6XnQEMslfX8wQQCXJQT/19Ph5hoNeBiv9PMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHBnNg0MEk8j3bEVvaY7oL3/8KNR9VYY+bg5+dJb/tP0z4jh70/ySFknDjRfrkgQS8YGqU0PqvyyQ4mpCp45UiZJl8OOPvTLZfcPLnNA8lvGdzvT4j28ymUflyaOHAkGZAetembReBwNJlzOOuDNVz5tXoWMV4xi+BuQn9r2tGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=a5/cvlnw; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a5/cvlnw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a471f77bf8eso244469766b.2
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1711152767; x=1711757567; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DcKs5LOC+9m7c+sQfRFSymnyXVGhlvaNbRKaUaILEw=;
        b=a5/cvlnwSInVmmL5GYLP2ddpiduq08B7RMyufzVGO08ZWZw+nIsyYcyOItfa2nWIYj
         /BBb6yIrBJpobGff4fcQplLeXecujCDeeVTuwKppZcJCSaYsVilz5UdLyZ8m2dwMvos2
         LfrcyitqI/NE5lBqAOrwPxz973OoJ+YYJ8Qsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711152767; x=1711757567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DcKs5LOC+9m7c+sQfRFSymnyXVGhlvaNbRKaUaILEw=;
        b=QKDzRtFgQIbRe8VW97KWUVh6TsvpnVwDvrRFDQbe0DETRmdeJu/PPykop8vG0suR5j
         WtQ+6ElfpTLgXVqKbC1ArkIfVIxpJqVSw4pFM2SySNz5EqdvyaK0mQxJvIO6VP/TtTZr
         LZoywA0t8QpaD4Iarsxho2FIBw8K8kIaeT3LBiPYb7/Gn60dWiil1Z807aOu1Tkie21+
         J01psktNRkgJ7qeHPbqTwRC0gt/XYZR00GFef3xBuno7qo8J9QiWz4A7d6IhBVgSxy2o
         ecihnbDhyXiBpQ40zQysmo6w3uFmmCeL9ATylm70xxva7T702V0sfZQ7DxE6232lCWHf
         64oA==
X-Forwarded-Encrypted: i=1; AJvYcCUSy5031XQrsWES9GmPbhC4WFp0EonMGjkhNsTPPIM+pZP0jiLkjaO9q1o48mYkI4x5V7hyZB7XNwNEf9JDVsVilGWp8Q==
X-Gm-Message-State: AOJu0YyALjAJiiczpVN7Qv+5W7GWW3ap/64UMlhR/wWMX/eVYgXAtKmm
	+R8xhH2bwDnBglQGpwgZfyzKkkgoWxi2MnX4slIJpfkHD4OPc9JeVM53hvxXmwyWB46ZESceY5w
	AxPM=
X-Google-Smtp-Source: AGHT+IHx8eX+e/rG/6c36h0YqVPTGImFnz2nzNtpYyfGmn5LU5sHEFO/EitxDdfpzIFGp3fYnlsw6g==
X-Received: by 2002:a17:906:5fd6:b0:a46:da87:26ea with SMTP id k22-20020a1709065fd600b00a46da8726eamr671996ejv.51.1711152766787;
        Fri, 22 Mar 2024 17:12:46 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id e12-20020a170906504c00b00a46ab33f970sm332923ejk.163.2024.03.22.17.12.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 17:12:46 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a471f77bf8eso244469166b.2
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 17:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOgbfjYLFJ1vvx71uN6jgI5l8tQoY4MPFYJRLvOqRwd+Vzit2Wi6GrBaP08A/PW/iE+1USYqsSfeqVCJi8/j/DZROoRw==
X-Received: by 2002:a17:906:6b0b:b0:a46:7ee2:f834 with SMTP id
 q11-20020a1709066b0b00b00a467ee2f834mr791117ejr.11.1711152766110; Fri, 22 Mar
 2024 17:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322233838.868874-1-boqun.feng@gmail.com> <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
In-Reply-To: <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Mar 2024 17:12:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
Message-ID: <CAHk-=whY5A=S=bLwCFL=043DoR0TTgSDUmfPDx2rXhkk3KANPQ@mail.gmail.com>
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

On Fri, 22 Mar 2024 at 16:57, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> I wonder about that. The disadvantage of only supporting LKMM atomics is
> that we'll be incompatible with third party code, and we don't want to
> be rolling all of our own data structures forever.

Honestly, having seen the shit-show that is language standards bodies
and incomplete compiler support, I do not understand why people think
that we wouldn't want to roll our own.

The C++ memory model may be reliable in another decade. And then a
decade after *that*, we can drop support for the pre-reliable
compilers.

People who think that compilers do things right just because they are
automated simply don't know what they are talking about.

It was just a couple of days ago that I was pointed at

    https://github.com/llvm/llvm-project/issues/64188

which is literally the compiler completely missing a C++ memory barrier.

And when the compiler itself is fundamentally buggy, you're kind of
screwed. When you roll your own, you can work around the bugs in
compilers.

And this is all doubly true when it is something that the kernel does,
and very few other projects do. For example, we're often better off
using inline asm over dubious builtins that have "native" compiler
support for them, but little actual real coverage. It really is often
a "ok, this builtin has actually been used for a decade, so it's
hopefully stable now".

We have years of examples of builtins either being completely broken
(as in "immediate crash" broken), or simply generating crap code that
is actively worse than using the inline asm.

The memory ordering isn't going to be at all different. Moving it into
the compiler doesn't solve problems. It creates them.

                 Linus
