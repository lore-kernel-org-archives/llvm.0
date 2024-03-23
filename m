Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E01E524
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711205720; cv=none; b=UQORYxh3l3YjaSRXLtVkJxP226Zk6Xjv+TciBWzv9SZ2Tn17ZcydMjp3NKbDEuDCmTFGvhTvOQ7HZWR5MVluv7OplpvF3M5dpdJf05+OoxdSlNS70ohYthnfZJKFOpHdtdEXuw/JyPIu0LvhUtbjNXs2/lMUVREOUAAw4Z+a7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711205720; c=relaxed/simple;
	bh=fQ82XO62lP17bp9mjIw1zlMFrpZjOT2ZJn2+KAtC9V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cvgjGeuJfc3GrKnomKTHgYZjyyKZpja9fmES86sqeIgXVeF+NMoF/veqbM7IYO0C9wt/fUMu8LRlGacQEZWy7de1/BkG30Oe3oS/awoc/jDbePM0sStHUeHQ8gGdDCKDvswmV9Xl8NmPlje2Vo7Vq6meLwt/ySZDb17xVOOHMQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jugpfLi6; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jugpfLi6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-430ccb3d65eso22748071cf.2
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711205718; x=1711810518; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRfoDMeQr45A3YPnCIYGOXROndTyGMuSPLDLPYakgoQ=;
        b=jugpfLi6v4PyJbRmnKAdze/sjkpUlIYPCZrkMwCMzIGCR0guSE5hg3YGzwxwF+Z3kh
         gZstwiMGocRRhJSUhee1H1S8Cbc3GWFujuDOMyWQnTbn39nRcaTyZgyuKn2BRs5pJE5y
         cQw0wmk3YBzfcc0G1UeLgK7mlqzOy1q/K2NjHMJyb3cluI+UXsLzEy5x1u1ZO68e/EBm
         PJL0/UO6zXByijuVdk+vyTbRy9JKDqhJxg9HRGz9QW8AT7p6zFORNXhzT7V12e3+cI54
         0mrCMan7CMjRfvn1GaZz2W1NDOn4ML+BaIf4Orun0NwxmBiGe0vHFGchZxH+4CuPK+M/
         Okiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711205718; x=1711810518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRfoDMeQr45A3YPnCIYGOXROndTyGMuSPLDLPYakgoQ=;
        b=qZvqSKuUAWd7LRPTj3pm5PQonxvvdZDo8aCe+uWK+LXHiY7dwh/9k0jsAPgISFLaRW
         39Wk0zkVWlE9aXLvcvfbY70KTarG6IGFfirzIo6qTZH90vBGl2GMsvPz64+XL4ZzUf/y
         sLODWCLMYnUwaLIOA4AlmwU+5yFtGQY8+i4Z+campJQAO67YDGnX0XPnjat6v08gp9W5
         ANFfxEUalQLqUfJDIY7mtz9ewmHzWQmLpyHLAhuIdg5v6IenGsjCo9oZ8LzF/8pdm1LD
         UlTTQIIXYFZ67emGJkkjtpa5x0/0jWZXKp0/S5zqbliFRM7+rh9p7ohSxOXzG/Y095nr
         6DiA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQUBL8Rhr5rOZpDE9KJONYppyR/53xwc5zc7k2OZkMdSycqsZhcHSdnFYzkzXhyTnMUmiX2fCHeY/PzkvNALYNvT1RA==
X-Gm-Message-State: AOJu0Yz0coNBMmGHtIDggTbgKTYlx0wpn0ioqzWVOXlb24JTNrlQqyQ/
	5yvcZY+GRPnTG/1ogt2SZyoP4gAQlYSKzzzhbTHOY4IovAd1LC6S
X-Google-Smtp-Source: AGHT+IGOG5dTcaGFgWmVDZ1YjnIERFJGHFMnBnYOLUtIpJuvddeQMaprbzxm238UN7Y+D20JT0d1mw==
X-Received: by 2002:a05:622a:1994:b0:431:3e65:3bd7 with SMTP id u20-20020a05622a199400b004313e653bd7mr2246075qtc.47.1711205717718;
        Sat, 23 Mar 2024 07:55:17 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id r12-20020ac85e8c000000b00431236d1f56sm843488qtx.30.2024.03.23.07.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 07:55:17 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 551D41200032;
	Sat, 23 Mar 2024 10:55:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 23 Mar 2024 10:55:16 -0400
X-ME-Sender: <xms:Uu3-ZWTnCgmgIZMdOTBhp5Kw_GW8ZOrCASNQClDWdq_4dmRFtAnNgg>
    <xme:Uu3-Zbx5rvUMmb3ZR_KNHiiYxy7hVUfH9BC3xFn7Gx9diFgdaarGEU5vrqvPZLENT
    FwUVAROW44PCKVr5w>
X-ME-Received: <xmr:Uu3-ZT0VWZUyTxAueX72iear-kEzjXl0DFrlqO991Mj-Dp0HSHOgj8UsLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtgedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueeviedu
    ffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:Uu3-ZSBFIl-Mua8RJfYfx8US77VUGmTD1O-Mi-Uv5c9VekbR35s0qg>
    <xmx:Uu3-ZfjydQF5XTgcPRaKdIuYKCBIpLaBSd18yMeeGF2eqxK48IQGbA>
    <xmx:Uu3-ZerfCSVGnuP_IwjWyKOMYOwNSOrJGPjJl2-ZW7zArXVlf2Qjxw>
    <xmx:Uu3-ZSgktm6VvoxNqFw-GhRG1fYIdaA1GTo9whVOjoHfy8MkoPS_pg>
    <xmx:VO3-ZSNpnlFWpI2U9r5CRe8fV0ciE4clLZRmTUo6fk8wWASIBnULgZEl_vLjtU1d>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Mar 2024 10:55:13 -0400 (EDT)
Date: Sat, 23 Mar 2024 07:55:12 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andrea Parri <parri.andrea@gmail.com>,	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nicholas Piggin <npiggin@gmail.com>,	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,	kent.overstreet@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	torvalds@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <Zf7tUL52AuutOSvL@Boquns-Mac-mini.home>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
 <s2jeqq22n5ef5jknaps37mfdjvuqrns4w7i22qp2r7r4bzjqs2@my3eyxoa3pl3>
 <Zf4fDJNBeRN5HOYo@boqun-archlinux>
 <03f629b6-1e4e-4689-9b69-db0b75577822@lunn.ch>
 <Zf7qGONJY33KdLCH@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zf7qGONJY33KdLCH@Boquns-Mac-mini.home>

On Sat, Mar 23, 2024 at 07:41:28AM -0700, Boqun Feng wrote:
> On Sat, Mar 23, 2024 at 03:29:11PM +0100, Andrew Lunn wrote:
> > > There are also issues like where one Rust thread does a store(..,
> > > RELEASE), and a C thread does a rcu_deference(), in practice, it
> > > probably works but no one works out (and no one would work out) a model
> > > to describe such an interaction.
> > 
> > Isn't that what Paul E. McKenney litmus tests are all about?
> > 
> 
> Litmus tests (or herd, or any other memory model tools) works for either
> LKMM or C++ memory model. But there is no model I'm aware of works for
> the communication between two memory models. So for example:
> 
> 	Rust thread:
> 
> 	let mut foo: Box<Foo> = ...;
> 	foo.a = 1;
> 	let global_ptr: &AtomicPtr = ...;
> 	global_ptr.store(foo.leak() as _, RELEASE);
> 
> 	
> 	C thread:
> 
> 	rcu_read_lock();
> 
> 	foo = rcu_dereference(global_ptr);
> 	if (foo) {
> 		r1 = foo->a;
> 	}
> 	
> 	rcu_read_unlock();
> 
> no tool or model yet to guarantee "r1" is 1, but yeah, in practice for
> the case we care, it's probably guaranteed. But no tool or model means
> challenging for code reasoning.
> 

There are also cases where two similar APIs from C++ memory model and
LKMM have different semantics, for example, a SeqCst atomic in C++
memory model doesn't imply a full barrier, while a fully ordered LKMM
atomic does:

	Rust:

	a.store(1, RELAXED);
	x.fetch_add(1, SeqCst);
	b.store(2, RELAXED);

	// ^ writes to a and b are not ordered.

	C:

	WRITE_ONCE(*a, 1);
	atomic_fetch_add(x, 1);
	WRITE_ONCE(*b, 2);

	// ^ writes to a and b are ordered.

So if you used to have two parts synchronizing each other with LKMM
atomics, converting one side to Rust *and* using Rust atomics requires
much caution.

Regards,
Boqun

> Regards,
> Boqun
> 
> > tools/memory-model/litmus-test
> > 
> > 	Andrew
