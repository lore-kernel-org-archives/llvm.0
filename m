Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAC312838E
	for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 02:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711421478; cv=none; b=vBW9lcbXL6s/gU4gDlU8usGLVxCCX8+GCmNsn6xJgO3dHP13pX/UoHi4rQCLMLtKXqUQB/hqCbD8xE4LHs+Q8kFjlUsXVDXvfC6XRAm3+UqdS5ciBJLAFxySzCu5KFOlSkJqt19UfgNE++Fs9IyxFHjl/FKk5Q7XPRwR2J2kPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711421478; c=relaxed/simple;
	bh=N5UUxAKoTPcBjWK+QOUVolTBhb8j694WCAv1Ly4a9d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5tMG7x0fHI0PfYHO0UTIpL4dweMwpCNmjLWypEVR0cVDiTJcmcfUXvYQL6ipBSEgpuLVdxHhSQHqYKhfx+DM7Kp33pLF0jFRW7di8NsjTUZyUimaWgWoHgCg98FzrcwnkL9RHisn7UHqFyQKhJata2X6f8z8O4KsJ3cLeQImSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAPYrKQO; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAPYrKQO"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78a26803f1aso366985985a.3
        for <llvm@lists.linux.dev>; Mon, 25 Mar 2024 19:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711421476; x=1712026276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcNhvrzgAeTv+RtaHHdMdJGRePwYOV19cay72dN5zG0=;
        b=TAPYrKQOZvY/DDkMK0YzEFIYThcC2wqUMAK09cfLRTUrI4x5qhcixfZqEVw3X9t1qC
         rEqWG0kklx/SdwYFsA7+NtbOl1qJNVcFpXelmS2E1j53B+VlFqNk7LtbSTWjf4/noFF8
         zrHFaATbW1pYvPh0ZhEy8OsWsEGdrwvyTZAiuEG/pvunDHi/o1kqz46HXYuHDelNE6mJ
         n6Nffc9tnLNwdjmOqh7nsFszF28NColqORTC2JtQkqQdz0ZfBgPgxA09dK2oPnWsqN8I
         la0Mfpw4yXzSouTRqf3IDaxAQJWqKEqEbDT+V2shHssf5oWtNEFksPw+dQqqzf5BhMYn
         RAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711421476; x=1712026276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcNhvrzgAeTv+RtaHHdMdJGRePwYOV19cay72dN5zG0=;
        b=bmW05w1bmKoxSXUtKiT9kIiC9Sxgm4FGgnzW98V71zLxjuRUNAtVZVDGbqYjFipneU
         29SguKHSWHD2hYWPCKm21E63MsK8Ob8I8WFKswnddGkULwd8fe5V+iZZlPGKbpTkq52o
         zykslX9QqJVc4WPq858SckV+/GsvGOBBLZYn/5WY+outVRA+qQtVb2HsTMh3pcoKePzM
         TdIyt8kZqy4fh2OzGdon8hPMUFxfCfGJhqDKPAR1tn9X+7S0pv9CIDRGXCxCnwYiGkCS
         KY5+eYODbj1N+cBS+zxiMoik+UoRzEZWaZCX/LTE1dH9QzLBuVndxvnmt7XC2UEnfT+j
         H3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVc+Arwg8N+wRc9uxZpDcgGSVNr9qQ0Wbz+7TnNLpMmq0uVMz6IU++zZVMtBC6XEPrSFvwGgwFmwkWOLytgDoJTdhMW/Q==
X-Gm-Message-State: AOJu0YxeRpqJUc01lGHykjDAVkblxSSuNIBF4e0uHyieGBVGeij6MGAt
	q90H4Ce9/h75VG7/Sen3l6Oam5OCyp+8NDNrospcgCvxn3BmDDMA
X-Google-Smtp-Source: AGHT+IFDSXtUV4AQwiSzsedITS1Ks+VU5H+aA+IrwzXY0yARA6zx4+/SmU8LSwuDkN0+4uIvx/tnYA==
X-Received: by 2002:a05:620a:1d99:b0:78a:45b9:c96f with SMTP id pj25-20020a05620a1d9900b0078a45b9c96fmr8386956qkn.59.1711421476022;
        Mon, 25 Mar 2024 19:51:16 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id f23-20020ae9ea17000000b00789e800c204sm2642313qkg.62.2024.03.25.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 19:51:15 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 6C02F1200032;
	Mon, 25 Mar 2024 22:51:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 25 Mar 2024 22:51:14 -0400
X-ME-Sender: <xms:ITgCZq0KMEEsDawHXZdKnL8n4WUCu3oJXr-g9e8bQ51FudtBKjmfDA>
    <xme:ITgCZtEVfhDHXly_ppW_xP0-FeKwM-fdfQ-EUyNRzOxFgEuCgU2crtIt7c8Mn_sx3
    UbnWWtNEBsZqgIboQ>
X-ME-Received: <xmr:ITgCZi5oVZ8ki9DHasrqwtZTEfQuziED9fPOcZhFon2BnRtBiS1axksDFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduvddgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpedvudfgheeikeehiedugfdugfegjeegvdelteeffeejfefgkeduteekgfev
    keeitdenucffohhmrghinhepthhrvggslhhighdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhht
    hhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquh
    hnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:ITgCZr0bQsaUqYUNd0feuVjVTTA008glsjcyqMC3K9VCveZqZ7ViQw>
    <xmx:ITgCZtFhkYNIORHDvgCfcXQZdxGp48exRrJ-Dky0Ak6tT5Vi9Ega4w>
    <xmx:ITgCZk8IW44RemklT6gJdGIXTGObj6V8Ru7piiqQbosIXr3uEBZVLA>
    <xmx:ITgCZikVqwPyizH1Xengv-x1mKi2OOHJfx1tpfj87r72bZIGR3ihvw>
    <xmx:IjgCZpAbMxss07kt1nC5b-UgIevPlKplkZZEdun6Pl8MpEEgIA_B-LEV6sqVb7xO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Mar 2024 22:51:12 -0400 (EDT)
Date: Mon, 25 Mar 2024 19:51:11 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Philipp Stanner <pstanner@redhat.com>,	rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,	linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [WIP 0/3] Memory model and atomic API in Rust
Message-ID: <ZgI4H8AMc3TAlEag@Boquns-Mac-mini.home>
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
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgIRXL5YM2AwBD0Y@gallifrey>

On Tue, Mar 26, 2024 at 12:05:48AM +0000, Dr. David Alan Gilbert wrote:
> * Linus Torvalds (torvalds@linux-foundation.org) wrote:
> 
> <snip>
> 
> > IOW, the whole access size problem that Boqun described is
> > *inherently* tied to the fact that the C++ and Rust memory model is
> > badly designed from the wrong principles.
> > 
> > Instead of designing it as a "this is an atomic object that you can do
> > these operations on", it should have been "this is an atomic access,
> > and you can use this simple object model to have the compiler generate
> > the accesses for you".
> 
> Isn't one of the aims of the Rust/C++ idea that you can't forget to access
> a shared piece of data atomically?
> 
> If you want to have 'atomic accesses' explicitly, how do you tell the compiler
> what you can use them on, and when it should stop you mixing them with
> normal accesses on the same object?
> 

Well, you can just wrap it in your own atomic types, can't you?

If the atomic primitives that a language provides is access-based, users
can create their own atomic types or language can provide via standard
library, but mixed usage is still allowed when it makes sense (debug
functionality, low level concurrent code that utilizes races, etc.) But
if the atomic primitives that a language provides is type-based, then
you're limited to what you can do. It might be totally fine as Linus
pointed out, if you just write a portable library, and don't want to
care about architectural details. But that's not the case in Linux
kernel.

Regards,
Boqun

> Dave
> 
> > This is why I claim that LKMM is fundamentally better. It didn't start
> > out from a bass-ackwards starting point of marking objects "atomic".
> > 
> > And yes, the LKMM is a bit awkward, because we don't have the
> > shorthands, so you have to write out "atomic_read()" and friends.
> > 
> > Tough. It's better to be correct than to be simple.
> > 
> >              Linus
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
