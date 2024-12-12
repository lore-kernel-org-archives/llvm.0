Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC2226545;
	Thu, 12 Dec 2024 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734023234; cv=none; b=TKg/E8mzXFH8S4xVJtwxbHKITe+gxcvp0iJOXIcFL9D6PKkJWshYRwcsBtQktQ9eVhYOodd9FU2YnzQ1AgBT3ZESZqVT2JG9jI/jvCPXU5Mt1lRYzrrmjJoghmDeV9WcdZN86dQ45MI6RrY33cZKjjGQALxiFgro/cZpgj9lf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734023234; c=relaxed/simple;
	bh=0vHE1w5O4zkSsS7UAGj/6U5b2nhWxF+ZfRvjGWZpNWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLzqWjFox8mJz3W1JRbBp5ttrgns+gRyQ8NjVcLufkV9n92tqSnLJHmwmd+y1I1srBUHe7XT1b4PxkeBjk/TAZpRi8gfREcmrez9eB+/E2LSZSprF78csSospO76ujhy7CUwdJXVmM2PVISun5F3XusbIO++wpSoClXMXxgcOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlhFUHfG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlhFUHfG"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6f1be1daeso68905085a.0;
        Thu, 12 Dec 2024 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734023231; x=1734628031; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ydWT1UsTHYhWkkUUpo46STYyAYlSEKPTYHT7UawS7ks=;
        b=SlhFUHfGcTLi+4yzWrUvfTLvarzmNdWTlFSM29Of5nqBdTuVqAr5wxMfnnnTeOPdYz
         u2MtW+fhbznYaolZlY5wTbD+DJOI8jYir9zb+bbuKvVGWR4np/4/Iy+Ep98H5GBxKmI3
         xyAqR9CGQWYl5ncrkmyoh9HTe4wDrjCs7Og3m/ymg6jv9ykFsR6GxoRdirAD7yHwpN2V
         5G7ELvWVyd/8bE7WOTXUJQWK1Yp/w/A8VxQc7JLUOxnt4M1jwzBv2J4KU5Uyd3bLoA0H
         LqkzCaER3Xdw/Q8bcSxN8ULy7n1/KejfDYTBRjroIv+pSXb74QwN2LTrPvAd7qLf+Bvo
         vdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734023231; x=1734628031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydWT1UsTHYhWkkUUpo46STYyAYlSEKPTYHT7UawS7ks=;
        b=cCGSjauERx+6zeAxhwtfoQdxNlRcauHXbQj/2l6NG6iwcLXyyqi1TtIX1+3boUyfoo
         pjCDLbEpVqI4pQjmieIvK6++hvd03cAkp+hhKtPwU/L1JksILPqAqc1zC+Rv1iDyYcX6
         u48wgQXPQUPchK3Ktb4mN9y0O55kQT3jiPu3H5x2AV7bq+eC7eE5KA1vTpm4X8OboNdk
         tN9wl0ERb7M1nv6gLXV1i2WJ0tVVw7/bjKx7Yz/M8a5gOZtuaVcqQSBosWgdO1XL6AAu
         05MlAUpiXmkQ5wZAPrZEaqWKh3rahzYYjzU/rWf85KMAi058MG2PB6NqXhmUqFWQw8Ue
         HaoA==
X-Forwarded-Encrypted: i=1; AJvYcCVIWT8rI35uOg0yNcCn9daGtdcqxtkjGX3pNSBVC6MoRfD3s9asxRvRaC+/8Nttv+CensYg@lists.linux.dev, AJvYcCVxOr/OMd5d0Ew3bc5ZKbtZ9B5SUp9Z6hAOyUGroaKGECCTw+6kWyU0t6rJW8n+lDrVJP/efg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxizft/ayVdHPGQ+/oPxF1RgwNmVgWd09f7UJ8cNvnUac93vHxB
	9hhUkRJ9sguAK58toDUY3NFYHR0QzNGeeXYqgDHsSNBgeJVsGE12
X-Gm-Gg: ASbGncvO4sZxdEhIvYnQN7lrImn0J8ELidczXtXbF3eldleSwAYrG6S/HHIttlVoi8F
	5ggar/CcXDpQbOVS9M9K5QmHT2nkjKQ1vVEtPZKJGgHh0x86v5VegmyvUu3Oq3PoCh24j2IH+uc
	lY6ZQLhHDpsoIxLPYFU5HDBhwugmIqbbVRIQ6hYp/v5XGWmUsUwBQVkkZn2o/7El8O4ee1Xbr9X
	Kw7qgdlY4vn504Rgv0oYeJQ1dtSTpmdKm9JOwdkwwlPKNmHRiKLaL+pQ1HAQjh1SSSxTN4FNSTs
	dxynE/7eP2EAgBaq8TJ7OKe34XUB3Rg0vApRycH37NMRN2g=
X-Google-Smtp-Source: AGHT+IHzAm46RcSXBdKh7khSXQnNQaNdgKhsnso06GP4zS9LyrwkArKfWLLbGnkC5+ATJVA0mg3gEA==
X-Received: by 2002:a05:620a:2611:b0:7b6:f31a:7804 with SMTP id af79cd13be357-7b6f88d41fbmr175715585a.9.1734023229981;
        Thu, 12 Dec 2024 09:07:09 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a5b38asm756057285a.27.2024.12.12.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:07:09 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D25F1200066;
	Thu, 12 Dec 2024 12:07:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 12 Dec 2024 12:07:08 -0500
X-ME-Sender: <xms:PBhbZ3cQLAN_Jwg2nfFOrMDCfGaWRrRFbXQYziRhDf3g7DcjsoxX0A>
    <xme:PBhbZ9MIOJjMK5Ci1Rx0U8drurfX5Z8vfCJ5hl7jTwxUEoI9Ax-i4QvrOS5GldGIS
    FDYFAU9Gp3sTL-SeA>
X-ME-Received: <xmr:PBhbZwisrTsmLp3KgtNCrMDg-4rt-GJSjviToXQq0H1yhXeXsULCxvGmzI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgdelhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeen
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegkeegtedtleffkeeftdevleeuieduveejgeei
    kedvgeekudefteefieeivdeuleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuve
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
X-ME-Proxy: <xmx:PBhbZ4_bxD1EdvvG1pcQ0R28qVCKk5b1Ij5sJnCIkw0wthcCOTXQcw>
    <xmx:PBhbZzu6K9CAjXTJEmCre--Q3suO2c4QNTjNGWbz_PoA_d_m3CkCqQ>
    <xmx:PBhbZ3HpOUUjR6jpHda2k5BsqDusYqLfOENcb4YvFpvKyqqICyKNQA>
    <xmx:PBhbZ6N8LSYi4w1v6G2BzN1MBMLjz8Ug032w7mdTrpEt5IG0elKaqA>
    <xmx:PBhbZ0NQTWjbv0n97eX1zsur6i2Rspp3fpybEeEVwF91xUUBuqTz31Wa>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 12:07:06 -0500 (EST)
Date: Thu, 12 Dec 2024 09:07:00 -0800
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
Message-ID: <Z1sYNOYJPzQmJXn6@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-3-boqun.feng@gmail.com>
 <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLghYjcb-mpR_rr2aC_W8rRb6g8jCFxgky7iEqVgmpHjf=Q@mail.gmail.com>

On Thu, Dec 12, 2024 at 11:51:23AM +0100, Alice Ryhl wrote:
> On Fri, Nov 1, 2024 at 7:03 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Preparation for generic atomic implementation. To unify the
> > ipmlementation of a generic method over `i32` and `i64`, the C side
> > atomic methods need to be grouped so that in a generic method, they can
> > be referred as <type>::<method>, otherwise their parameters and return
> > value are different between `i32` and `i64`, which would require using
> > `transmute()` to unify the type into a `T`.
> >
> > Introduce `AtomicIpml` to represent a basic type in Rust that has the
> > direct mapping to an atomic implementation from C. This trait is sealed,
> > and currently only `i32` and `i64` ipml this.
> 
> There seems to be quite a few instances of "impl" spelled as "ipml" here.
> 

Will fix!

> > Further, different methods are put into different `*Ops` trait groups,
> > and this is for the future when smaller types like `i8`/`i16` are
> > supported but only with a limited set of API (e.g. only set(), load(),
> > xchg() and cmpxchg(), no add() or sub() etc).
> >
> > While the atomic mod is introduced, documentation is also added for
> > memory models and data races.
> >
> > Also bump my role to the maintainer of ATOMIC INFRASTRUCTURE to reflect
> > my responsiblity on the Rust atomic mod.
> >
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> > ---
> >  MAINTAINERS                    |   4 +-
> >  rust/kernel/sync.rs            |   1 +
> >  rust/kernel/sync/atomic.rs     |  19 ++++
> >  rust/kernel/sync/atomic/ops.rs | 199 +++++++++++++++++++++++++++++++++
> >  4 files changed, 222 insertions(+), 1 deletion(-)
> >  create mode 100644 rust/kernel/sync/atomic.rs
> >  create mode 100644 rust/kernel/sync/atomic/ops.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b77f4495dcf4..e09471027a63 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3635,7 +3635,7 @@ F:        drivers/input/touchscreen/atmel_mxt_ts.c
> >  ATOMIC INFRASTRUCTURE
> >  M:     Will Deacon <will@kernel.org>
> >  M:     Peter Zijlstra <peterz@infradead.org>
> > -R:     Boqun Feng <boqun.feng@gmail.com>
> > +M:     Boqun Feng <boqun.feng@gmail.com>
> >  R:     Mark Rutland <mark.rutland@arm.com>
> >  L:     linux-kernel@vger.kernel.org
> >  S:     Maintained
> > @@ -3644,6 +3644,8 @@ F:        arch/*/include/asm/atomic*.h
> >  F:     include/*/atomic*.h
> >  F:     include/linux/refcount.h
> >  F:     scripts/atomic/
> > +F:     rust/kernel/sync/atomic.rs
> > +F:     rust/kernel/sync/atomic/
> 
> This is why mod.rs files are superior :)
> 

;-) Not going to do anything right now, but let me think about this.

> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Atomic primitives.
> > +//!
> > +//! These primitives have the same semantics as their C counterparts: and the precise definitions of
> > +//! semantics can be found at [`LKMM`]. Note that Linux Kernel Memory (Consistency) Model is the
> > +//! only model for Rust code in kernel, and Rust's own atomics should be avoided.
> > +//!
> > +//! # Data races
> > +//!
> > +//! [`LKMM`] atomics have different rules regarding data races:
> > +//!
> > +//! - A normal read doesn't data-race with an atomic read.
> 
> This was fixed:
> https://github.com/rust-lang/rust/pull/128778
> 

Yeah, I was aware of that effort, and good to know it's finally merged.
Thanks!

This will be in 1.83, right? If so, we will still need the above until
we bump up the minimal rustc version to 1.83 or beyond. I will handle
this properly with the minimal rustc 1.83 (i.e. if this goes in first,
will send a follow up patch). I will also mention in the above that this
has been changed in 1.83.

This also reminds that I should add that LKMM allows mixed-size atomic
accesses (as non data race), I will add that in the version.

> > +mod private {
> > +    /// Sealed trait marker to disable customized impls on atomic implementation traits.
> > +    pub trait Sealed {}
> > +}
> 
> Just make the trait unsafe?
> 

And make the safety requirement of `AtomicImpl` something like:

    The type must have the implementation for atomic operations.

? Hmm.. I don't think that's a good safety requirement TBH. Actually the
reason that we need to restrict `AtomicImpl` types is more of an
iplementation issue (the implementation need to be done if we want to
support i8 or i16) rather than safety issue. So a sealed trait is proper
here. Does this make sense? Or am I missing something?

Regards,
Boqun

> Alice
