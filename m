Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638D1891A9;
	Fri, 13 Dec 2024 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734120793; cv=none; b=S/JP3EGL1dMW+qUDKkoB+iQDt03D5EN3Lj4YAPJ9+RKDDqwt6R8KS5XcwyrkawarJGolCYlh7okSMguhQ/1qKpDETAVU8QBv+ZRw49rx6asOlyw8wX961L2wX7AcuyWCrACjb+t+DwA7I2WA1ypOVqhN753ZcY/UhityWVa1bjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734120793; c=relaxed/simple;
	bh=zlbBlFFmJXawofXO/orsUEwh6fcY+2EkTgzbeKXf6Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4Tcg1mAAYu6IkeMkgFu+E4W5rY+B1715Um9zk8pCRBczWfnENWMASyLKdeqtz/4PKABX9sYRf/48k7lhReNyxmyRjP4ZxJUTyOtsaCuKwMD31zeUXGtJPkSunt+nnja+iGHigiSPre3rQgqdIu6lJ1zzO+SuRmf0TRjv5eTm4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McpnWm0W; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McpnWm0W"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dccccd429eso1284016d6.3;
        Fri, 13 Dec 2024 12:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734120791; x=1734725591; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iRonZJxea5tra4fNXdRilKepTreMvxGV66B9FX5uzo8=;
        b=McpnWm0W4uC7fHwj3Vun1ZwHNgYeq0WybbR+akeRqYVNMOkl1MZKFK67DTxZSz6hLU
         G7CGIOLC2y/dCFqu9ehzhJSpPT5pZZOXEcn7T0ec9LVM3W8uaeF4oxXfXz9goxFYpK5Q
         311LnfKx3xKhG3GezZneGJB2fG5JIQXbxwYQl5tQxeAM3Y54lq70s4yn2qAaPusNxoXk
         ybdcpW4HINK9qmhu3H+p7iGDhYLitJZch0WS+051JVrQ7QAPYF3Y64UEEVx6KmlMY+3y
         +am+J16S3auaU6KoOO01Cyr4bNCW6JF6EYbmYJd8tzFX0Ih+j8LYpqUttcMR48AluC9c
         TA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734120791; x=1734725591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRonZJxea5tra4fNXdRilKepTreMvxGV66B9FX5uzo8=;
        b=r97G7CDZPnFWdnmohPrsSLS8i4sfT1BhpZ1MrdWa6Vn2mAqmo1RjkXJ6EwkfYvk6Bl
         UVpKlnCNe0RHd6gdNbY2FqTwDRJ1wzl52jMUIyrl3misorHNsLfO8v2DdTCTvWcuudMf
         1PXcuU3hxQZfVFK6xxKwGq3iThtMMfocQSRYLFsHYk1Pxv80wAcnDupZna5EFwh6U+D8
         Upjmw2CJPDbA+yLguEKCfKxI7VTKcAXtEiFvRmjXzSmg5A+6qvnjQI+3j2afUClFpL2m
         94MCjTk/M6mNKhGYQLM/J6kzD8EKbXwivM58DQ+MDK78Ww7+I6W5Q+R8YbtGsqJZ45AG
         YRPw==
X-Forwarded-Encrypted: i=1; AJvYcCUpa+q5T/DgO2DcPBl8ckNc7kU6cCP5TFE4QQs8hAifuZXahVZY4QO+5rp2uztc//waeYSyyQ==@lists.linux.dev, AJvYcCXRy9/dl5qBriO4cet5eQQUvfCfwvv2oSULlhJFTNsUXXOKDyB/93oXUwVYQGkwkTuPQuVC@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8khqaOKCh5m4i7LgbHJUdjB2kJ5DOoi7RYUwFbx0yspB8OfG8
	WoXYDHuPCC+qKoJOMxQdB6VgJbTzynXOX3LJhcAe+p683zGqQsVo
X-Gm-Gg: ASbGncuRYz/sgV50C4T8lmcvz1Gr4D4HI/CmKe/D9HhAlUHUjcZ5ZwYQMLJ85iilHw3
	32jiJZJB5zLtwXwi3zEMyFFy68rhjA1pwiz4DsBauHhR7gK1+97TaRaBpjKUYz9FWB11tiPCo4d
	xcR38UDUF0I4+2qB1zbBmKeNCLvghO0xHU7/qxoKfOADNdrPl6hPVv6Y58L2Cneyl5FVESgQi+L
	ofd2PYbjeLHll+xFp11F3aSTswaQ1Lsix0Ue2g8gBOw6LLVfPLpciwl+utC/1xnq7OTbnTHGp81
	iYr/eseuKX3Xi9tSPGzR7TAbhVbD/5up9PzwJeQ2pzNOy7w=
X-Google-Smtp-Source: AGHT+IG1PW/C5OMjo4cQ0IoIVEfOD0HFvhBMielHi6rGrf7TgUA3hF8fjAtB05FlB63eXg9v86DtGA==
X-Received: by 2002:a05:6214:21a9:b0:6d8:9002:bde2 with SMTP id 6a1803df08f44-6dc8ca93c47mr58205836d6.28.1734120790880;
        Fri, 13 Dec 2024 12:13:10 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2cbb69asm1138711cf.39.2024.12.13.12.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 12:13:10 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73AE9120006A;
	Fri, 13 Dec 2024 15:13:09 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Dec 2024 15:13:09 -0500
X-ME-Sender: <xms:VZVcZ2qm-gu0s5limXzj9CZtxmfXx-mAmK6XnJfcqZqIlz2H7Jg3Lg>
    <xme:VZVcZ0oz6uhXAI5mxSKLN9h20-Upxd-X6g00btvJxS-QjAmx4cL7LNMaXQOfaSIp6
    Wps8lgGWLSKs9fybw>
X-ME-Received: <xmr:VZVcZ7OqZAG8r-rJe68lZBczKBXcFOthWJt97mY426ybeMQERtCYzdJIEMD3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeehjedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehl
    khhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgt
    ohhm
X-ME-Proxy: <xmx:VZVcZ17sIOWSp0-LnbL-fy2QYuFdSefH1z64bjLq5i0dlHHmLM4ABw>
    <xmx:VZVcZ17cTMpI_xHOYGh92J2TPP7xAIvXKWEVuYhNw1ypPrtkJoMSIQ>
    <xmx:VZVcZ1jkRFzWZAWC-Ye4VlQO89TxiV19LoR25aIcLJrsS0YavTcA9Q>
    <xmx:VZVcZ_7aOXLCRagx9UfKTR-SJr85felqwQWrfbxdholKhOG_rXSiXA>
    <xmx:VZVcZwI_O8zWb7p8jSNmkNTjjYElFeZR68mnl6uDR6jLfCN-yWQAj0yk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Dec 2024 15:13:07 -0500 (EST)
Date: Fri, 13 Dec 2024 12:13:06 -0800
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
Subject: Re: [RFC v2 04/13] rust: sync: atomic: Add generic atomics
Message-ID: <Z1yVUmGBIxKH1xR-@tardis.local>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com>
 <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
 <Z1seogLmy5H8-hXn@boqun-archlinux>
 <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjGg8_s8imOkmPb0yLAMwD1sF1aoBZWkAy-YLNh41zCuw@mail.gmail.com>

On Fri, Dec 13, 2024 at 03:32:47PM +0100, Alice Ryhl wrote:
> On Thu, Dec 12, 2024 at 6:34 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Thu, Dec 12, 2024 at 11:57:07AM +0100, Alice Ryhl wrote:
> > [...]
> > > > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
> > > > new file mode 100644
> > > > index 000000000000..204da38e2691
> > > > --- /dev/null
> > > > +++ b/rust/kernel/sync/atomic/generic.rs
> > > > @@ -0,0 +1,253 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +//! Generic atomic primitives.
> > > > +
> > > > +use super::ops::*;
> > > > +use super::ordering::*;
> > > > +use crate::types::Opaque;
> > > > +
> > > > +/// A generic atomic variable.
> > > > +///
> > > > +/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to be chosen.
> > > > +///
> > > > +/// # Invariants
> > > > +///
> > > > +/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race, this
> > > > +/// is guaranteed by the safety requirement of [`Self::from_ptr`] and the extra safety requirement
> > > > +/// of the usage on pointers returned by [`Self::as_ptr`].
> > > > +#[repr(transparent)]
> > > > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> > > > +
> > > > +// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
> > > > +unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
> > >
> > > Surely it should also be Send?
> > >
> >
> > It's `Send` here because `Opaque<T>` is `Send` when `T` is `Send`. And
> > in patch #9, I changed the definition of `AllowAtomic`, which is not a
> > subtrait of `Send` anymore, and an `impl Send` block was added there.
> >
> > > > +/// Atomics that support basic atomic operations.
> > > > +///
> > > > +/// TODO: Unless the `impl` is a `#[repr(transparet)]` new type of an existing [`AllowAtomic`], the
> > > > +/// impl block should be only done in atomic mod. And currently only basic integer types can
> > > > +/// implement this trait in atomic mod.
> > >
> > > What's up with this TODO? Can't you just write an appropriate safety
> > > requirement?
> > >
> >
> > Because the limited scope of types that allows atomic is an artificial
> > choice, i.e. we want to start with a limited number of types and make
> > forward progress, and the types that we don't want to support atomics
> > for now are not because of safety reasons, but more of a lack of
> > users/motivations. So I don't think this is something we should use
> > safety requirement to describe.
> 
> I found the wording very confusing. Could you reword it to say
> something about future possibilities?
> 

Sure, how about:

/// TODO: Currently the [`AllowAtomic`] types are restricted within
/// basic integer types (and their transparent new types). In the
/// future, we could extend the scope to more data types when there is a
/// clear and meaningful usage, but for now, [`AllowAtomic`] should only
/// be implemented inside atomic mod for the restricted types mentioned
/// above.

?

> > > > +/// # Safety
> > > > +///
> > > > +/// [`Self`] must have the same size and alignment as [`Self::Repr`].
> > > > +pub unsafe trait AllowAtomic: Sized + Send + Copy {
> > > > +    /// The backing atomic implementation type.
> > > > +    type Repr: AtomicImpl;
> > > > +
> > > > +    /// Converts into a [`Self::Repr`].
> > > > +    fn into_repr(self) -> Self::Repr;
> > > > +
> > > > +    /// Converts from a [`Self::Repr`].
> > > > +    fn from_repr(repr: Self::Repr) -> Self;
> > >
> > > What do you need these methods for?
> > >
> >
> > Converting a `AtomicImpl` value (currently only `i32` and `i64`) to a
> > `AllowAtomic` value without using transmute in `impl` block of
> > `Atomic<T>`. Any better idea?
> 
> You could use transmute?
> 

In a draft version, I did use transmute, but Benno commented that he
wanted to avoid arbitrary transmute as hard as possible (if I didn't
misunderstand him). Hence these two functions are provided. Now think
about it, I don't think doing either way (transmute or *_repr()
function) would affect most of users, since most of users won't need to 
impl `AllowAtomic` themselves, therefore I think keeping it as it is is
fine. Do you have any user observable concern of defining these
functions?

Regards,
Boqun

> Alice
