Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02E22333F;
	Thu, 12 Dec 2024 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024878; cv=none; b=lsk+XhgfFgIa3e7/gJNoPzbBn3hvJM1qRIt3ZupB/qilAnUoES4OgJzYfbc94k6RhuJNISdnLPa7ZT+hlkE7qxOOoEdMAZdhxkHsluZ1h0T/JWHYxFP8aIYyg7Yoqitar4FjnhmZLBDGCdNu0mfzX43IqhtLVniHv19X8xyHRrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024878; c=relaxed/simple;
	bh=vdIFndJxsdxEN8WnwMEU5CC9s/oOiakOpPgs3SfrXgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QC7lhdWXDa+9TRi9TLlBa50tkwYBTcgYJjaYP7H2mN1pkkO/ikX9qRKYjJIGPrbAvlYYdNEWPqUEm02mlxoK1v198UbrQBm32g0IClpEAzNUMVDRkg4WpvQovszCcrkCrmkZy7DVlW8Vdlqji296eFeppTzMeaqX7/BaHwFZ/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy5Jr9nd; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy5Jr9nd"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso7765986d6.3;
        Thu, 12 Dec 2024 09:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734024875; x=1734629675; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3/1jIZKtHxkm/cGWT/Dd1ikZO2f9RQMcjfDBKaiBpA=;
        b=Wy5Jr9ndjEXO0W7DE6BMXCuEgBxKV0A8/mdquMgxzoT1Q+UzW3bGdORmXX/75vhTaQ
         iVpyT66/zGYaP8gVsJ1Nd+OVIAFBT+/OQFwyB3BVXnn3IHswAH0pKi3Wp70qDJ5hAGo9
         FPNVvIsiLpncN2WBRdf84qW0SPFit3sKpdpEAjM7eqxjVJME1UuW9qRI/wx39PJzu+aK
         /pnCiWvHgnzuZGmNW3+AzL7NsSFIgInTyUMIdTTW8sJqOTB6xLnhUp72jf6RmHuhVhZW
         VcgpU8ry4EQkHusUnQlXniaY+Jb51YE3YlnWeQ2kS0PLmH6citv/8ajkeoYbN/vQqPhl
         pe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024875; x=1734629675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3/1jIZKtHxkm/cGWT/Dd1ikZO2f9RQMcjfDBKaiBpA=;
        b=pUZ2Okh2qCRveeTeKtBT15LWIQaTNpYHPZvJyr+PMfqTMfmLU8jj3+tnt4X2+AXV7+
         sErMsPSH5KahcB7r8BOrlkPa+toHzqPnVKiPUjmVlKFg53l46nijR8pfh0JQgJFMhfte
         zr7B+e90++eISyUfZNFLiZ6ZCnX8qEh+lo3Douae+phivQs29kHVlS6z1amkhCZRVhss
         Y0WiQSsXgyHx8zIKiWTV3BXUaO0f4gZMHvatpUZtF+teEXNsrpwGR7ROdBjnM/mac7ZR
         tbVyutbbsPnMRGlBcvcB0xn2CZcdjy3UosoFchNRlG6/nE5yxIijWwBSBtqSH1T8ZNJq
         VEoA==
X-Forwarded-Encrypted: i=1; AJvYcCVh/uV8EuI0GOyJXDK9gj+Eis5j2WylUAMSUpFzSPOipw+scXGD1mzGbAwsoyV2kJsloNb6zw==@lists.linux.dev, AJvYcCXgxMv2M1bRvUNKHQOOMOIS+oYnvqxiozHUFZ8wKdcFHA8qtbotaX/ZS92kxnreu1nYnx8i@lists.linux.dev
X-Gm-Message-State: AOJu0YyOHNIARRo3gc1H6AAgf4PZK3uUOd7ucMtI/MKYRjjAoEsMec+o
	zi5Do/s0SEW/KeDcLvarSrUnlu8Ng81wym7GZQ594YxjHMSITRS6
X-Gm-Gg: ASbGncvbguFnTdS8sss54whkvNmHl8RH6FWg3BXYSu/eK9LD6aylGD3nuqaR3hDWfjo
	z+5ge96842Xp9keZwpSM279nCC6aodU9WMl3aK3UvrNbc972QU2UC+ggVZaoDTKOKBYQae1Z7IO
	fXcYibhubV03r+JO+p+irxjdzD+4QyXrAMlFFhjey5rixuGS4U+46ZOAhfsYN0Wtybu/r1WI15O
	TuR6wLlxkpDgmYtt+C2KuZZczbXD5kgRLWchhfIk3dyN/sOTIXbDgVG+3kub7piN5mI44bvTnoE
	1ZHmyeTTKy/tYymKkzXq5k8bjdQW0FWZj5Q06miLJXSzk/4=
X-Google-Smtp-Source: AGHT+IE5zv947yt3MBj29XLMztCN2YlUN5/liDh+kTLh1tUmGaIc6VdyCAsfmo1jFdhT3+P8K6mJjA==
X-Received: by 2002:a05:6214:dc6:b0:6d8:7d63:f424 with SMTP id 6a1803df08f44-6db0f733e4bmr19338056d6.12.1734024875063;
        Thu, 12 Dec 2024 09:34:35 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d91d51d4aesm37527536d6.109.2024.12.12.09.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:34:34 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B5B041200043;
	Thu, 12 Dec 2024 12:34:33 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 12 Dec 2024 12:34:33 -0500
X-ME-Sender: <xms:qR5bZ8rQmH5HlBgal5KCMcLMPNM0c9WwYK4RcEmShiEELrRriR3phw>
    <xme:qR5bZyp-1CDP1ezNhIcf-AboRcNQgzJx5cG2WIfq5obQuXsfmnvP0zYpXR_bj8K0r
    np7U1vnOMzv8jRdpA>
X-ME-Received: <xmr:qR5bZxPM65XbNd3V2U7qp4c-Z2m0DWIrNKysoweSEoe3P-_YaD6umEH-oDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhk
    mhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:qR5bZz5iJo99zVXbDfLq2gYMYHTvcM8e8yhX8tc8eRwv3O2rW3kokg>
    <xmx:qR5bZ75MBwGz4vohHoZy3M12yZFmK16Pb8Xt6BscOcS0H-ak76ZGfQ>
    <xmx:qR5bZzj9HAMVrXr0OAXKoT5DED2Dc2x55wEIujEusXR1-szfEBrj9Q>
    <xmx:qR5bZ16yFdGY3ywA4r7dDDktArno_s_6uirKPEx6ge9bi6fBgCYMFA>
    <xmx:qR5bZ-Iy1n_kOmvC6i4tnGfUKx_lwM1swk8YTX9W3bJloHZ3THH1asMk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Dec 2024 12:34:31 -0500 (EST)
Date: Thu, 12 Dec 2024 09:34:26 -0800
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
Message-ID: <Z1seogLmy5H8-hXn@boqun-archlinux>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
 <20241101060237.1185533-5-boqun.feng@gmail.com>
 <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjhQouU=kqVx7LET2yeWt6sKt-VO5PR5SnQ8doaG4ihuQ@mail.gmail.com>

On Thu, Dec 12, 2024 at 11:57:07AM +0100, Alice Ryhl wrote:
[...]
> > diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
> > new file mode 100644
> > index 000000000000..204da38e2691
> > --- /dev/null
> > +++ b/rust/kernel/sync/atomic/generic.rs
> > @@ -0,0 +1,253 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Generic atomic primitives.
> > +
> > +use super::ops::*;
> > +use super::ordering::*;
> > +use crate::types::Opaque;
> > +
> > +/// A generic atomic variable.
> > +///
> > +/// `T` must impl [`AllowAtomic`], that is, an [`AtomicImpl`] has to be chosen.
> > +///
> > +/// # Invariants
> > +///
> > +/// Doing an atomic operation while holding a reference of [`Self`] won't cause a data race, this
> > +/// is guaranteed by the safety requirement of [`Self::from_ptr`] and the extra safety requirement
> > +/// of the usage on pointers returned by [`Self::as_ptr`].
> > +#[repr(transparent)]
> > +pub struct Atomic<T: AllowAtomic>(Opaque<T>);
> > +
> > +// SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
> > +unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
> 
> Surely it should also be Send?
> 

It's `Send` here because `Opaque<T>` is `Send` when `T` is `Send`. And
in patch #9, I changed the definition of `AllowAtomic`, which is not a
subtrait of `Send` anymore, and an `impl Send` block was added there.

> > +/// Atomics that support basic atomic operations.
> > +///
> > +/// TODO: Unless the `impl` is a `#[repr(transparet)]` new type of an existing [`AllowAtomic`], the
> > +/// impl block should be only done in atomic mod. And currently only basic integer types can
> > +/// implement this trait in atomic mod.
> 
> What's up with this TODO? Can't you just write an appropriate safety
> requirement?
> 

Because the limited scope of types that allows atomic is an artificial
choice, i.e. we want to start with a limited number of types and make
forward progress, and the types that we don't want to support atomics
for now are not because of safety reasons, but more of a lack of
users/motivations. So I don't think this is something we should use
safety requirement to describe.

> > +/// # Safety
> > +///
> > +/// [`Self`] must have the same size and alignment as [`Self::Repr`].
> > +pub unsafe trait AllowAtomic: Sized + Send + Copy {
> > +    /// The backing atomic implementation type.
> > +    type Repr: AtomicImpl;
> > +
> > +    /// Converts into a [`Self::Repr`].
> > +    fn into_repr(self) -> Self::Repr;
> > +
> > +    /// Converts from a [`Self::Repr`].
> > +    fn from_repr(repr: Self::Repr) -> Self;
> 
> What do you need these methods for?
> 

Converting a `AtomicImpl` value (currently only `i32` and `i64`) to a
`AllowAtomic` value without using transmute in `impl` block of
`Atomic<T>`. Any better idea?

Regards,
Boqun

> > +}
> > +
> > +// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
> > +unsafe impl<T: AtomicImpl> AllowAtomic for T {
> > +    type Repr = Self;
> > +
> > +    fn into_repr(self) -> Self::Repr {
> > +        self
> > +    }
> > +
> > +    fn from_repr(repr: Self::Repr) -> Self {
> > +        repr
> > +    }
> > +}
> > +
> > +impl<T: AllowAtomic> Atomic<T> {
> > +    /// Creates a new atomic.
> > +    pub const fn new(v: T) -> Self {
> > +        Self(Opaque::new(v))
> > +    }
> > +
> > +    /// Creates a reference to [`Self`] from a pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// - `ptr` has to be a valid pointer.
> > +    /// - `ptr` has to be valid for both reads and writes for the whole lifetime `'a`.
> > +    /// - For the whole lifetime of '`a`, other accesses to the object cannot cause data races
> > +    ///   (defined by [`LKMM`]) against atomic operations on the returned reference.
> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Using [`Atomic::from_ptr()`] combined with [`Atomic::load()`] or [`Atomic::store()`] can
> > +    /// achieve the same functionality as `READ_ONCE()`/`smp_load_acquire()` or
> > +    /// `WRITE_ONCE()`/`smp_store_release()` in C side:
> > +    ///
> > +    /// ```rust
> > +    /// # use kernel::types::Opaque;
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed, Release};
> > +    ///
> > +    /// // Assume there is a C struct `Foo`.
> > +    /// mod cbindings {
> > +    ///     #[repr(C)]
> > +    ///     pub(crate) struct foo { pub(crate) a: i32, pub(crate) b: i32 }
> > +    /// }
> > +    ///
> > +    /// let tmp = Opaque::new(cbindings::foo { a: 1, b: 2});
> > +    ///
> > +    /// // struct foo *foo_ptr = ..;
> > +    /// let foo_ptr = tmp.get();
> > +    ///
> > +    /// // SAFETY: `foo_ptr` is a valid pointer, and `.a` is inbound.
> > +    /// let foo_a_ptr = unsafe { core::ptr::addr_of_mut!((*foo_ptr).a) };
> > +    ///
> > +    /// // a = READ_ONCE(foo_ptr->a);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is a valid pointer for read, and all accesses on it is atomic, so no
> > +    /// // data race.
> > +    /// let a = unsafe { Atomic::from_ptr(foo_a_ptr) }.load(Relaxed);
> > +    /// # assert_eq!(a, 1);
> > +    ///
> > +    /// // smp_store_release(&foo_ptr->a, 2);
> > +    /// //
> > +    /// // SAFETY: `foo_a_ptr` is a valid pointer for write, and all accesses on it is atomic, so no
> > +    /// // data race.
> > +    /// unsafe { Atomic::from_ptr(foo_a_ptr) }.store(2, Release);
> > +    /// ```
> > +    ///
> > +    /// However, this should be only used when communicating with C side or manipulating a C struct.
> > +    pub unsafe fn from_ptr<'a>(ptr: *mut T) -> &'a Self
> > +    where
> > +        T: Sync,
> > +    {
> > +        // CAST: `T` is transparent to `Atomic<T>`.
> > +        // SAFETY: Per function safety requirement, `ptr` is a valid pointer and the object will
> > +        // live long enough. It's safe to return a `&Atomic<T>` because function safety requirement
> > +        // guarantees other accesses won't cause data races.
> > +        unsafe { &*ptr.cast::<Self>() }
> > +    }
> > +
> > +    /// Returns a pointer to the underlying atomic variable.
> > +    ///
> > +    /// Extra safety requirement on using the return pointer: the operations done via the pointer
> > +    /// cannot cause data races defined by [`LKMM`].
> > +    ///
> > +    /// [`LKMM`]: srctree/tools/memory-model
> > +    pub const fn as_ptr(&self) -> *mut T {
> > +        self.0.get()
> > +    }
> > +
> > +    /// Returns a mutable reference to the underlying atomic variable.
> > +    ///
> > +    /// This is safe because the mutable reference of the atomic variable guarantees the exclusive
> > +    /// access.
> > +    pub fn get_mut(&mut self) -> &mut T {
> > +        // SAFETY: `self.as_ptr()` is a valid pointer to `T`, and the object has already been
> > +        // initialized. `&mut self` guarantees the exclusive access, so it's safe to reborrow
> > +        // mutably.
> > +        unsafe { &mut *self.as_ptr() }
> > +    }
> > +}
> > +
> > +impl<T: AllowAtomic> Atomic<T>
> > +where
> > +    T::Repr: AtomicHasBasicOps,
> > +{
> > +    /// Loads the value from the atomic variable.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// Simple usages:
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42i32);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    ///
> > +    /// let x = Atomic::new(42i64);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    /// ```
> > +    ///
> > +    /// Customized new types in [`Atomic`]:
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{generic::AllowAtomic, Atomic, Relaxed};
> > +    ///
> > +    /// #[derive(Clone, Copy)]
> > +    /// #[repr(transparent)]
> > +    /// struct NewType(u32);
> > +    ///
> > +    /// // SAFETY: `NewType` is transparent to `u32`, which has the same size and alignment as
> > +    /// // `i32`.
> > +    /// unsafe impl AllowAtomic for NewType {
> > +    ///     type Repr = i32;
> > +    ///
> > +    ///     fn into_repr(self) -> Self::Repr {
> > +    ///         self.0 as i32
> > +    ///     }
> > +    ///
> > +    ///     fn from_repr(repr: Self::Repr) -> Self {
> > +    ///         NewType(repr as u32)
> > +    ///     }
> > +    /// }
> > +    ///
> > +    /// let n = Atomic::new(NewType(0));
> > +    ///
> > +    /// assert_eq!(0, n.load(Relaxed).0);
> > +    /// ```
> > +    #[inline(always)]
> > +    pub fn load<Ordering: AcquireOrRelaxed>(&self, _: Ordering) -> T {
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_read*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        let v = unsafe {
> > +            if Ordering::IS_RELAXED {
> > +                T::Repr::atomic_read(a)
> > +            } else {
> > +                T::Repr::atomic_read_acquire(a)
> > +            }
> > +        };
> > +
> > +        T::from_repr(v)
> > +    }
> > +
> > +    /// Stores a value to the atomic variable.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```rust
> > +    /// use kernel::sync::atomic::{Atomic, Relaxed};
> > +    ///
> > +    /// let x = Atomic::new(42i32);
> > +    ///
> > +    /// assert_eq!(42, x.load(Relaxed));
> > +    ///
> > +    /// x.store(43, Relaxed);
> > +    ///
> > +    /// assert_eq!(43, x.load(Relaxed));
> > +    /// ```
> > +    ///
> > +    #[inline(always)]
> > +    pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
> > +        let v = T::into_repr(v);
> > +        let a = self.as_ptr().cast::<T::Repr>();
> > +
> > +        // SAFETY:
> > +        // - For calling the atomic_set*() function:
> > +        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
> > +        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
> > +        //   - per the type invariants, the following atomic operation won't cause data races.
> > +        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
> > +        //   - atomic operations are used here.
> > +        unsafe {
> > +            if Ordering::IS_RELAXED {
> > +                T::Repr::atomic_set(a, v)
> > +            } else {
> > +                T::Repr::atomic_set_release(a, v)
> > +            }
> > +        };
> > +    }
> > +}
> > --
> > 2.45.2
> >
