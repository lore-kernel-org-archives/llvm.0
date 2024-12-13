Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FAF18DF73;
	Fri, 13 Dec 2024 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734121731; cv=none; b=JIZhQtm3tZ54b5TJpM9BYdwK9iG9uzr1yUfxJgN7HflQ8XFgVCKRUBzh8CSW6dmxtarXtD4B28Niqq2HWG0oafv4/A5cHnT3Z6hl8rl9hD2j1YUPA+NJrLj3CIMQqJrR62lrjRJ9ZaMToEDGUASXZUQePm5GwDcTc1LmH6Lv/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734121731; c=relaxed/simple;
	bh=5bn8oXNQA2053l7zQok4dmxpsp3aILhYx8v20d7OHts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmnY5jyWKrhPsbc/tErS6mlCVHIjjzosb7zP6IGLZa7Btb2ECqwmyUsqnlH7hdkV9U4Rieh6IGUt0qYylsMlAJONPtBvd69rECF+ZA+8wf10KE9ZuUk7Q3+QnvCbRUVTdWHWLrP8nzF9fr9SS/7mUOM8UWedXEK2QcmHAXSIkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTGOmBxG; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTGOmBxG"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d89dc50927so16241206d6.3;
        Fri, 13 Dec 2024 12:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734121729; x=1734726529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy+g6CCR8H9z+qQ9IKAP5iLictR2vzTnBiPMNSCfde4=;
        b=ZTGOmBxG/O3W5VnIUDXsdxFDpKwXcjJ2IzyYLDePTl5PuqARN5C4JxJjT8hyUdxkc5
         OEjhICbaUgc7OMPCWmJcksdz3qQM3UeINvsudooZhWc0xqJGj9Sq82Si4JFy76pZyumA
         GHmBM9sDTXRu4C7EKgoKCTiwvm505Uvr9y40936/HAGpUI9+Z5AwXrM7YUi3GPs/P8Dk
         xoiVM3BYHP+CSAekLOyA8Qv0z+cuhN9JvD+33mfdklR4Nx79wZZr3H1sVOiYV++XdH/p
         wV/xgS73pKqT4lBiXMAiF6lC2nmrM6Vc0m+uPeWH5OSwLapV/mdsob9XYzk8uzCUVelm
         JKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734121729; x=1734726529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oy+g6CCR8H9z+qQ9IKAP5iLictR2vzTnBiPMNSCfde4=;
        b=P+7bi9j8ZHOu8B9u+PqTeGalFLaWcwAsCXIyH7OHTYiMphb9OR7694/f/4siY4iMmP
         F5NzLyhFPgNcTQoVpr7TePw3WUmJic0U3KzI46PRMl1oKxbuvlJkZAENOK0OltwtxnVt
         9WUzxiqhXwb07vC8UcVovI1Nutti1I1iAotSK4+saw52MvpOkfiQiBM6z7SrvN1TCIIi
         8cQK9u/IFrr95K61nvhNNlXM8LGv7Hjxu2uIBkN4eAhdyYZf1YNpS3ftKD2yUtp2Smd4
         USeUMxGJf4MNWp1nUbNAzLctzlodu1b7FakiJCcOqCrzQMi8PzZ4uK4v1wR7gIg7uywx
         ScXA==
X-Forwarded-Encrypted: i=1; AJvYcCVf16jhW5VwTbYeQi2QPCyuRX6T+/y/3IdoJCbEjSQjbJ8iTWWi3axFbhkw2RrlnmlO44LGfQ==@lists.linux.dev, AJvYcCW1/8rmP/xOCdNHc1ofzvs/veynWSiJZoRe92cfguIjTuHNeGoI1TTq2zO1rO6y6sOSOyH6@lists.linux.dev
X-Gm-Message-State: AOJu0YzZgvwGZmNSBXPpgqoB3UrIaRuH5eJo1oE45CPVkcDtGCi1zul1
	XkW2PEGBU/vZ0eIHRGO7v5MHmlecsZZrTTiJx6y9LcsM5euZmpfZ
X-Gm-Gg: ASbGncvqku+kj2RcWvf6Ku19VKq+owJzqZFc8XcizAewGWJhlM5KZD2K45xmZp8LI27
	5IIdzj4rNS8JjA4ZEvSIqRRYf3RBXYM5OynKsBlEsapazIV1XZCboOsjNAY3QKMW9N6AAeb2Ouu
	6E8r9QVyyI8QqP/BwWRlm9T+7r799EzWvFGbj57gGGljoZk/Cj+bwEueEn828Y9TirArpXfSb0y
	HQWT00wh8FMcVtE1E7uA7P/uo8mevZl8/aPkaEuffeUsodlrwQigLEzLev/9x5uVTBhCp2+LETm
	9AIFMt2deMNDhVAAyXwZdK/tB1w4b4h41vttxTuyq6IiAjo=
X-Google-Smtp-Source: AGHT+IE2tKNH2SwdPs6Zkn1SWo3BZBrlDL+pJUKK8ffETsaGO4d5bvz342opBhZTwO6vfAdVJSMQ5A==
X-Received: by 2002:ad4:5dcb:0:b0:6d8:e641:da29 with SMTP id 6a1803df08f44-6dc8ca44819mr70587316d6.6.1734121728937;
        Fri, 13 Dec 2024 12:28:48 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd3805e5sm789776d6.114.2024.12.13.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:28:48 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8C611200066;
	Fri, 13 Dec 2024 15:28:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 13 Dec 2024 15:28:47 -0500
X-ME-Sender: <xms:_5hcZ52D0Txfq3afYHx_FbgTtmEk_XFYGdsCxZrFemGViQYgimNBIw>
    <xme:_5hcZwE0JuQpAx-sNtF1T4lNVXCTxpu8QQK39LNMwvRar7kPxKYKGILxZCLuwVeiw
    JqiJqyI3iHFHYZ3VA>
X-ME-Received: <xmr:_5hcZ55iST0Ld5UtgJO19PFmYPPES1IEZQ5fvzsB0A8k-EhTnaQH_VgICyoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpefftdeihfeigedtvdeuueffieetvedtgeejuefh
    hffgudfgfeeggfeftdeigeehvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprhhushhtqdhf
    ohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthh
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidrug
    gvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:_5hcZ21dZDlSFPHhJ-hR_xqZ1E0rep-r4WrXiwUQyM1nizooQS9AnA>
    <xmx:_5hcZ8F5a37Iksgu8azbe4LtJh86oPlDtiIZrtuMnU4PwfLQHgkdaA>
    <xmx:_5hcZ3_Z-H-jUwynNjV6TS1Q48CIKGofI_-xcmhDLwS-hAy2MJ1wxA>
    <xmx:_5hcZ5lGDiaKlmxar7Ng2QGY3xkyj4bsqNu3LdLxBbywFujFVq5mLg>
    <xmx:_5hcZwFSPtMAKsGOW-8Vmvi_oCQ7KHZB-ZN7yeYoB03uVjiO-lIrMZ-I>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Dec 2024 15:28:45 -0500 (EST)
Date: Fri, 13 Dec 2024 12:28:45 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, lkmm@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
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
 linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org,
 Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com,
 Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC v2 02/13] rust: sync: Add basic atomic operation mapping
 framework
Message-ID: <Z1yY_Yr0B6KpWLmJ@tardis.local>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-3-boqun.feng@gmail.com>
 <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
 <Z1sYNOYJPzQmJXn6@boqun-archlinux>
 <CAH5fLgidmY7FtKLKR-Yxb6U-mQvsyatGRToqSHHRACfTdiAtUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgidmY7FtKLKR-Yxb6U-mQvsyatGRToqSHHRACfTdiAtUA@mail.gmail.com>

On Fri, Dec 13, 2024 at 03:37:13PM +0100, Alice Ryhl wrote:
[...]
> > > > @@ -0,0 +1,19 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +//! Atomic primitives.
> > > > +//!
> > > > +//! These primitives have the same semantics as their C counterparts: and the precise definitions of
> > > > +//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (Consistency) Model is the
> > > > +//! only model for Rust code in kernel, and Rust's own atomics should be avoided.
> > > > +//!
> > > > +//! # Data races
> > > > +//!
> > > > +//! [`LKMM`] atomics have different rules regarding data races:
> > > > +//!
> > > > +//! - A normal read doesn't data-race with an atomic read.
> > >
> > > This was fixed:
> > > https://github.com/rust-lang/rust/pull/128778
> > >
> >
> > Yeah, I was aware of that effort, and good to know it's finally merged.
> > Thanks!
> >
> > This will be in 1.83, right? If so, we will still need the above until
> > we bump up the minimal rustc version to 1.83 or beyond. I will handle
> > this properly with the minimal rustc 1.83 (i.e. if this goes in first,
> > will send a follow up patch). I will also mention in the above that this
> > has been changed in 1.83.
> >
> > This also reminds that I should add that LKMM allows mixed-size atomic
> > accesses (as non data race), I will add that in the version.
> 
> This is just documentation. I don't think you need to do any special

The PR also contained miri changes, so the same code will be reported
differently by miri. That was what I was thinking of. However, now think
about it, we are not going to use Rust atomics, so this difference
shouldn't affect us. Therefore I agree, I will drop this.

> MSRV handling.
> 
> > > > +mod private {
> > > > +    /// Sealed trait marker to disable customized impls on atomic implementation traits.
> > > > +    pub trait Sealed {}
> > > > +}
> > >
> > > Just make the trait unsafe?
> > >
> >
> > And make the safety requirement of `AtomicImpl` something like:
> >
> >     The type must have the implementation for atomic operations.
> >
> > ? Hmm.. I don't think that's a good safety requirement TBH. Actually the
> > reason that we need to restrict `AtomicImpl` types is more of an
> > iplementation issue (the implementation need to be done if we want to
> > support i8 or i16) rather than safety issue. So a sealed trait is proper
> > here. Does this make sense? Or am I missing something?
> 
> Where is the AtomicImpl trait used?
> 

It's used when `impl`ing an `AllowAtomic` type, `AllowAtomic` has an
associate type named `Repr` which must be an `AtomicImpl`, i.e. each
type that has atomic operation support must select the underlying
implementation types (currently we only have i32 and i64 from C side
APIs). Using a sealed trait is appropriate in this case, because unless
you are adding atomic support for different sizes of data, you shouldn't
impl `AtomicImpl`.

Regards,
Boqun

> Alice
