Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FF1990AA;
	Fri,  1 Nov 2024 06:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441057; cv=none; b=nDkoPuMPCkJ4xfWuWfOKfgzaxaZyUn94KTLcq45qRnmfm4h4ov33v2FcdaiuqaWp+BV6+GsYBxiRrLD26fIHvjumf+c586r4Wi4LE3cprhFunfCg9+sf8tWgiqgTdq3PLHNOqeS/JHnqwxTRU65094l/QQPMTWePmS6XIRIISQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441057; c=relaxed/simple;
	bh=9R5iwD1QnCK6X+FpMDpeWbrsJJEhKwil0Jn1eC/0yGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rk1stkcCfAAQbvh0ZVFiS3tDjxU3sjIHAI+1UOeRlp6w+ctkLLxhDSMKKhkUl7XoFUw1A3JWV5anGq2gWUCDznH+JNbVifCoRsfn+o3xF9p81zNGTieKctejhpEr89IbQElUJ86YgnJyFDk1+rbs3eFd8jSUSnDQwvQYFPXwbyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLrGf1aj; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLrGf1aj"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84fe454176bso486916241.1;
        Thu, 31 Oct 2024 23:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441053; x=1731045853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwbnorYz17/tWcZ9fit5jE8cUEZsdnUVkY29L9brcUg=;
        b=jLrGf1aj7c7GU3Yt90w9IVa6/1usR7iHE3yejGE86fTKm1IIA5uGb6mmQaFfbQfMOR
         nZEnNU5N4l71PU6pjyuAMwolJyePvvH0R7rKPAmspQuFbV02pECXP6JmsAr+SPIu76IJ
         mbAKjrkdpFB+NBOBZMrnRqybDghEAsGGCn4Vsr8oFDNqNPAludDqe+lt9reAcOgjnnGf
         zdPwPRLEnlkehM7ZBwnuqSkpMXq9HH4RtnheTJ+4f/vm6l6oPiS0XvcBxZgIxYiOkmnV
         IbqMMv9EmdjByfFselctFVf6S7Z2Z8lancjdS4wj8ni4M8UfseibyGyAlTWOL5izXgrG
         19jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441053; x=1731045853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwbnorYz17/tWcZ9fit5jE8cUEZsdnUVkY29L9brcUg=;
        b=ilqQnqdbNS7L99qncazrh4e+G8NxnA66IWaWDBLGr+4+X9dEi6DgHWw3ioYMGs/sTx
         rVEHG5s1sFF8h9FU0VoAOcK4jPXrd6qwafekj2pYT7SidVwt/L9K4g/4XJQ/U/KP8v1j
         Ta3e5mWPmOgwEJacKYi8MKyU5h5tb0tSp8+N6bvThbRuPJsDPODGOKdNg9K8w2th+7zG
         nrkPBlv5AJzi6dUFmPh/6mSsxQxC+dcf6vNB1dKIJi7xusVKBnZBxHCIdYHw0/Tst7V6
         /SY6+UO3cYGwpHxaXcLPa97Dxyyvs3ureqBac9SJ6q9tsN20d0xwgCr5zZ62UyNiwlYD
         2pZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSr1knFTwRoXFM3/vmxfZH9R7Q35mQaDGNXJbz0nMALryAX7k0YcKnTL1hgYfOYVlxUfDzPg==@lists.linux.dev, AJvYcCX3d170GgUl8Aqc6DfhDTbaRMsdvooJo+24ObQ51XSwjssq9+ygUPIMca2pQR/V7bXA9c7U@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5guKoqyfCIsoqg6qdn2kF2rYn7WnOfZ5Zl4cq79+L3TjZJ2yt
	yTUQbNuhK2X9dJhTvPr904h6vILaCyHPzw/DIUybqq6YUw+mVQfq
X-Google-Smtp-Source: AGHT+IHAc5xMZh4K5kU8JOF0c7jZniOEtFMNfZvJtennS+zE2ZkZJCx0edfJ6yZAUHpY+GVVThi1tg==
X-Received: by 2002:a05:6102:290b:b0:4a5:b712:2c94 with SMTP id ada2fe7eead31-4a95430e304mr7189566137.14.1730441052668;
        Thu, 31 Oct 2024 23:04:12 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad08a8b1sm15146921cf.19.2024.10.31.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:12 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EB6831200043;
	Fri,  1 Nov 2024 02:04:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 01 Nov 2024 02:04:10 -0400
X-ME-Sender: <xms:Wm8kZxr_axC-jTRoz8szthrQnovF0P-D07D_8apC-WpezD6yrlI8vQ>
    <xme:Wm8kZzoWGwWQOX0qz3p_X-QraFPaFKX2JIN7rY7-EoILTMFGKhDhJXlcgRezfUrVW
    Z5KUatHKh7HWLsQPA>
X-ME-Received: <xmr:Wm8kZ-PqWENG4c5GuUCfaaArCzXwpAvn5hJdKYs1tqH5KsGKEkmJHbmE4K4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhep
    hffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgvnh
    hguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhn
    pedutedvgfetleeiffeihfetgfeiheetueefhedukedvveejuddvheeujeehuefgteenuc
    ffohhmrghinheptghrrghtvghsrdhiohdpiihulhhiphgthhgrthdrtghomhdpghhithhh
    uhgsrdgtohhmpdhkrghnghhrvghjohhsrdgtohhmpdhgihhthhhusgdrihhonecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprh
    hushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigv
    ughsohhnrghfsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Wm8kZ85gCzjeMjaFvHytKopD2622zaJDj4h8D6I37Uot85iAfXowMQ>
    <xmx:Wm8kZw4Q_TNsKCXSF49WRqSSZlzdH8T7bZzPfqV6MD8ltJfOxiSjVw>
    <xmx:Wm8kZ0gG-_DSVJOc69yZOBOaB6J7SIV0I7cO3b0P0A0svH6xmoS8aw>
    <xmx:Wm8kZy7ug8-cwX1Qe7dTOiLFj-UJp-AdnrNYzNhiBUgzCsNl4EGwPA>
    <xmx:Wm8kZ3KKQmL_McQqb_UtQQ0slR9xjzu0ofXj_9aJSCBEsOz3onEOX01a>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:10 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,	elver@google.com,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,	x86@kernel.org,
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
Subject: [RFC v2 13/13] rust: sync: rcu: Add RCU protected pointer
Date: Thu, 31 Oct 2024 23:02:36 -0700
Message-ID: <20241101060237.1185533-14-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-1-boqun.feng@gmail.com>
References: <20241101060237.1185533-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RCU protected pointers are an atomic pointer that can be loaded and
dereferenced by mulitple RCU readers, but only one updater/writer can
change the value (following a read-copy-update pattern usually).

This is useful in the case where data is read-mostly. The rationale of
this patch is to provide a proof of concept on how RCU should be exposed
to the Rust world, and it also serves as an example for atomic usage.

Similar mechanisms like ArcSwap [1] are already widely used.

Provide a `Rcu<P>` type with an atomic pointer implementation. `P` has
to be a `ForeignOwnable`, which means the ownership of a object can be
represented by a pointer-size value.

`Rcu::dereference()` requires a RCU Guard, which means dereferencing is
only valid under RCU read lock protection.

`Rcu::read_copy_update()` is the operation for updaters, it requries a
`Pin<&mut Self>` for exclusive accesses, since RCU updaters are normally
exclusive with each other.

A lot of RCU functionalities including asynchronously free (call_rcu()
and kfree_rcu()) are still missing, and will be the future work.

Also, we still need language changes like field projection [2] to
provide better ergonomic.

Acknowledgment: this work is based on a lot of productive discussions
and hard work from others, these are the ones I can remember (sorry if I
forgot your contribution):

* Wedson started the work on RCU field projection and Benno followed it
  up and had been working on it as a more general language feature.
  Also, Gary's field-projection repo [3] has been used as an example for
  related discussions.

* During Kangrejos 2023 [4], Gary, Benno and Alice provided a lot of
  feedbacks on the talk from Paul and me: "If you want to use RCU in
  Rust for Linux kernel..."

* During a recent discussion among Benno, Paul and me, Benno suggested
  using `Pin<&mut>` to guarantee the exclusive access on updater
  operations.

Link: https://crates.io/crates/arc-swap [1]
Link: https://rust-lang.zulipchat.com/#narrow/channel/213817-t-lang/topic/Field.20Projections/near/474648059 [2]
Link: https://github.com/nbdd0121/field-projection [3]
Link: https://kangrejos.com/2023 [4]
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/rcu.rs | 269 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 268 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index 5a35495f69a4..8326b2e0986a 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -5,7 +5,11 @@
 //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
 
 use crate::bindings;
-use core::marker::PhantomData;
+use crate::{
+    sync::atomic::{Atomic, Relaxed, Release},
+    types::ForeignOwnable,
+};
+use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
 
 /// Evidence that the RCU read side lock is held on the current thread/CPU.
 ///
@@ -50,3 +54,266 @@ fn drop(&mut self) {
 pub fn read_lock() -> Guard {
     Guard::new()
 }
+
+/// An RCU protected pointer, the pointed object is protected by RCU.
+///
+/// # Invariants
+///
+/// Either the pointer is null, or it points to a return value of [`P::into_foreign`] and the atomic
+/// variable exclusively owns the pointer.
+pub struct Rcu<P: ForeignOwnable>(Atomic<*mut core::ffi::c_void>, PhantomData<P>);
+
+/// A pointer that has been unpublished, but hasn't waited for a grace period yet.
+///
+/// The pointed object may still have an existing RCU reader. Therefore a grace period is needed to
+/// free the object.
+///
+/// # Invariants
+///
+/// The pointer has to be a return value of [`P::into_foreign`] and [`Self`] exclusively owns the
+/// pointer.
+pub struct RcuOld<P: ForeignOwnable>(NonNull<core::ffi::c_void>, PhantomData<P>);
+
+impl<P: ForeignOwnable> Drop for RcuOld<P> {
+    fn drop(&mut self) {
+        // SAFETY: As long as called in a sleepable context, which should be checked by klint,
+        // `synchronize_rcu()` is safe to call.
+        unsafe {
+            bindings::synchronize_rcu();
+        }
+
+        // SAFETY: `self.0` is a return value of `P::into_foreign()`, so it's safe to call
+        // `from_foreign()` on it. Plus, the above `synchronize_rcu()` guarantees no existing
+        // `ForeignOwnable::borrow()` anymore.
+        let p: P = unsafe { P::from_foreign(self.0.as_ptr()) };
+        drop(p);
+    }
+}
+
+impl<P: ForeignOwnable> Rcu<P> {
+    /// Creates a new RCU pointer.
+    pub fn new(p: P) -> Self {
+        // INVARIANTS: The return value of `p.into_foreign()` is directly stored in the atomic
+        // variable.
+        Self(Atomic::new(p.into_foreign().cast_mut()), PhantomData)
+    }
+
+    /// Dereferences the protected object.
+    ///
+    /// Returns `Some(b)`, where `b` is a reference-like borrowed type, if the pointer is not null,
+    /// otherwise returns `None`.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// # use kernel::alloc::{flags, KBox};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// let x = Rcu::new(KBox::new(100i32, flags::GFP_KERNEL)?);
+    ///
+    /// let g = rcu::read_lock();
+    /// // Read in under RCU read lock protection.
+    /// let v = x.dereference(&g);
+    ///
+    /// assert_eq!(v, Some(&100i32));
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    ///
+    /// Note the borrowed access can outlive the reference of the [`Rcu<P>`], this is because as
+    /// long as the RCU read lock is held, the pointed object should remain valid.
+    ///
+    /// In the following case, the main thread is responsible for the ownership of `shared`, i.e. it
+    /// will drop it eventually, and a work item can temporarily access the `shared` via `cloned`,
+    /// but the use of the dereferenced object doesn't depend on `cloned`'s existence.
+    ///
+    /// ```rust
+    /// # use kernel::alloc::{flags, KBox};
+    /// # use kernel::workqueue::system;
+    /// # use kernel::sync::{Arc, atomic::{Atomic, Acquire, Release}};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// struct Config {
+    ///     a: i32,
+    ///     b: i32,
+    ///     c: i32,
+    /// }
+    ///
+    /// let config = KBox::new(Config { a: 1, b: 2, c: 3 }, flags::GFP_KERNEL)?;
+    ///
+    /// let shared = Arc::new(Rcu::new(config), flags::GFP_KERNEL)?;
+    /// let cloned = shared.clone();
+    ///
+    /// // Use atomic to simulate a special refcounting.
+    /// static FLAG: Atomic<i32> = Atomic::new(0);
+    ///
+    /// system().try_spawn(flags::GFP_KERNEL, move || {
+    ///     let g = rcu::read_lock();
+    ///     let v = cloned.dereference(&g).unwrap();
+    ///     drop(cloned); // release reference to `shared`.
+    ///     FLAG.store(1, Release);
+    ///
+    ///     // but still need to access `v`.
+    ///     assert_eq!(v.a, 1);
+    ///     drop(g);
+    /// });
+    ///
+    /// // Wait until `cloned` dropped.
+    /// while FLAG.load(Acquire) == 0 {
+    ///     // SAFETY: Sleep should be safe.
+    ///     unsafe { kernel::bindings::schedule(); }
+    /// }
+    ///
+    /// drop(shared);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn dereference<'rcu>(&self, _rcu_guard: &'rcu Guard) -> Option<P::Borrowed<'rcu>> {
+        // Ordering: Address dependency pairs with the `store(Release)` in read_copy_update().
+        let ptr = self.0.load(Relaxed);
+
+        if !ptr.is_null() {
+            // SAFETY:
+            // - Since `ptr` is not null, so it has to be a return value of `P::into_foreign()`.
+            // - The returned `Borrowed<'rcu>` cannot outlive the RCU Guar, this guarantees the
+            //   return value will only be used under RCU read lock, and the RCU read lock prevents
+            //   the pass of a grace period that the drop of `RcuOld` or `Rcu` is waiting for,
+            //   therefore no `from_foreign()` will be called for `ptr` as long as `Borrowed` exists.
+            //
+            //      CPU 0                                       CPU 1
+            //      =====                                       =====
+            //      { `x` is a reference to Rcu<Box<i32>> }
+            //      let g = rcu::read_lock();
+            //
+            //      if let Some(b) = x.dereference(&g) {
+            //      // drop(g); cannot be done, since `b` is still alive.
+            //
+            //                                              if let Some(old) = x.replace(...) {
+            //                                                  // `x` is null now.
+            //          println!("{}", b);
+            //      }
+            //                                                  drop(old):
+            //                                                    synchronize_rcu();
+            //      drop(g);
+            //                                                    // a grace period passed.
+            //                                                    // No `Borrowed` exists now.
+            //                                                    from_foreign(...);
+            //                                              }
+            Some(unsafe { P::borrow(ptr) })
+        } else {
+            None
+        }
+    }
+
+    /// Read, copy and update the pointer with new value.
+    ///
+    /// Returns `None` if the pointer's old value is null, otherwise returns `Some(old)`, where old
+    /// is a [`RcuOld`] which can be used to free the old object eventually.
+    ///
+    /// The `Pin<&mut Self>` is needed because this function needs the exclusive access to
+    /// [`Rcu<P>`], otherwise two `read_copy_update()`s may get the same old object and double free.
+    /// Using `Pin<&mut Self>` provides the exclusive access that C side requires with the type
+    /// system checking.
+    ///
+    /// Also this has to be `Pin` because a `&mut Self` may allow users to `swap()` safely, that
+    /// will break the atomicity. A [`Rcu<P>`] should be structurally pinned in the struct that
+    /// contains it.
+    ///
+    /// Note that `Pin<&mut Self>` cannot assume noalias here because [`Atomic<T>`] is a
+    /// [`Opaque<T>`] which has the same effect on aliasing rules as [`UnsafePinned`].
+    ///
+    /// [`UnsafePinned`]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html
+    pub fn read_copy_update<F>(self: Pin<&mut Self>, f: F) -> Option<RcuOld<P>>
+    where
+        F: FnOnce(Option<P::Borrowed<'_>>) -> Option<P>,
+    {
+        // step 1: READ.
+        // Ordering: Address dependency pairs with the `store(Release)` in read_copy_update().
+        let old_ptr = NonNull::new(self.0.load(Relaxed));
+
+        let old = old_ptr.map(|nonnull| {
+            // SAFETY: Per type invariants `old_ptr` has to be a value return by a previous
+            // `into_foreign()`, and the exclusive reference `self` guarantees that `from_foreign()`
+            // has not been called.
+            unsafe { P::borrow(nonnull.as_ptr()) }
+        });
+
+        // step 2: COPY, or more generally, initializing `new` based on `old`.
+        let new = f(old);
+
+        // step 3: UPDATE.
+        if let Some(new) = new {
+            let new_ptr = new.into_foreign().cast_mut();
+            // Ordering: Pairs with the address dependency in `dereference()` and
+            // `read_copy_update()`.
+            // INVARIANTS: `new.into_foreign()` is directly store into the atomic variable.
+            self.0.store(new_ptr, Release);
+        } else {
+            // Ordering: Setting to a null pointer doesn't need to be Release.
+            // INVARIANTS: The atomic variable is set to be null.
+            self.0.store(core::ptr::null_mut(), Relaxed);
+        }
+
+        // INVARIANTS: The exclusive reference guarantess that the ownership of a previous
+        // `into_foreign()` transferred to the `RcuOld`.
+        Some(RcuOld(old_ptr?, PhantomData))
+    }
+
+    /// Replaces the pointer with new value.
+    ///
+    /// Returns `None` if the pointer's old value is null, otherwise returns `Some(old)`, where old
+    /// is a [`RcuOld`] which can be used to free the old object eventually.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use core::pin::pin;
+    /// # use kernel::alloc::{flags, KBox};
+    /// use kernel::sync::rcu::{self, Rcu};
+    ///
+    /// let mut x = pin!(Rcu::new(KBox::new(100i32, flags::GFP_KERNEL)?));
+    /// let q = KBox::new(101i32, flags::GFP_KERNEL)?;
+    ///
+    /// // Read in under RCU read lock protection.
+    /// let g = rcu::read_lock();
+    /// let v = x.dereference(&g);
+    ///
+    /// // Replace with a new object.
+    /// let old = x.as_mut().replace(q);
+    ///
+    /// assert!(old.is_some());
+    ///
+    /// // `v` should still read the old value.
+    /// assert_eq!(v, Some(&100i32));
+    ///
+    /// // New readers should get the new value.
+    /// assert_eq!(x.dereference(&g), Some(&101i32));
+    ///
+    /// drop(g);
+    ///
+    /// // Can free the object outside the read-side critical section.
+    /// drop(old);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn replace(self: Pin<&mut Self>, new: P) -> Option<RcuOld<P>> {
+        self.read_copy_update(|_| Some(new))
+    }
+}
+
+impl<P: ForeignOwnable> Drop for Rcu<P> {
+    fn drop(&mut self) {
+        let ptr = *self.0.get_mut();
+        if !ptr.is_null() {
+            // SAFETY: As long as called in a sleepable context, which should be checked by klint,
+            // `synchronize_rcu()` is safe to call.
+            unsafe {
+                bindings::synchronize_rcu();
+            }
+
+            // SAFETY: `self.0` is a return value of `P::into_foreign()`, so it's safe to call
+            // `from_foreign()` on it. Plus, the above `synchronize_rcu()` guarantees no existing
+            // `ForeignOwnable::borrow()` anymore.
+            drop(unsafe { P::from_foreign(ptr) });
+        }
+    }
+}
-- 
2.45.2

