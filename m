Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25F91F1319;
	Mon, 21 Apr 2025 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253776; cv=none; b=jp133VSWZz5bhMaJ4TvVIQZFgEWYKImxkvmbzFREiGFexWySa6JS0sb0I26KaOlDfxwGh75CKAisz2QIOB1ByaYuYFGEGcHMIJGJe2uVP97/XgQFYaHfQOr/b6Jy605U3eprpZXGNhSjXrrzHFCoEsg+r7OXkUW2mE83E0EJ5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253776; c=relaxed/simple;
	bh=ycXL8q2+YDl6YBofOqf86s4FeBh11bM0f53ATgDpB5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qLTB/SaFeHZMVQX0cHhpbHbo5bbm9YOiQSvdLRAmUmbokHCiZJjYxpsqz1xEbWTe3EfGUKmDbFZCkXIgS6QGbW7n4TMgyincMwbSdB3r+dSAcaSsxeZdCJmpDOBBOjhAC/IxcXao8dApZkJmxGeCtiqnETmEemJBS3fEQEHBkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxE/nNIH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxE/nNIH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c08fc20194so28420485a.2;
        Mon, 21 Apr 2025 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253772; x=1745858572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y7J/QCauCF+ekh62R8O3hTayTSjtfwBqCWuSp+W3eCE=;
        b=CxE/nNIHEq06vQRZQmVwCzO4Je6sKhlNtRohAGipser8s2KMCJffR3SEltBVLMN5pn
         2LIG31GxQQX9mlYPt8mCtzrodlfJBJa1q4D3RYB3NONPJHqWs8ubVdmCq4F0IC0PRSAS
         Tqw52GJyqTRO6nxFbKlpwp7jgqY4F0Zmpt4wtFt4nYEacBeGOV+BbKm6Z8mofE4gswU6
         O4EqyzjAZkJ/1erEMpW1sc6g6SeckFAKej8QOAKnk0dCEohyr/YrZ4hnFVa3ZA6JtPVV
         VPoM/bpE+KbbVLETJGZA+3t4iBM9hbRS4LZBXDf6VXyFdjtQWdZxM3Off/Qla3MY8iLT
         YZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253772; x=1745858572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7J/QCauCF+ekh62R8O3hTayTSjtfwBqCWuSp+W3eCE=;
        b=N9/p1HXaSp564UlHKiGkLgMpZdZ2qEk5E5jE9TNuBafzu4LjejKNpVryduabjiNeAf
         TIbwPZRF18jwXbC8Yh2LR47baffRip0iy2099cfKYq6UWQfJLhRk7G0YyQ6Fgj1+ww3K
         HJqFfdsVWefcx2mnnO4HS8dWqv2xmY4B5QEqMxmtn0fJeFtTOZ6gy8vqaOyFrRla/cHm
         KzbWJ2op3Xh0pH2epTar8PiALu2Eo82cEp6CsMVKyOv85uPuxLJszXuY//rI1vZU97eZ
         z5W+AY08xn1rOThD+81qlqav4WvdKLQtxknhVEFV4J/+A5dDsHIUoNTjMK1171I2lCih
         g8XA==
X-Forwarded-Encrypted: i=1; AJvYcCUiH4TjdLhsliSG27Af30Tp9EYchxASkz8jA+lesQJ0+ZtDzrH/WifPYkb5iKGbMTHmXKM3Ag==@lists.linux.dev, AJvYcCVSGk8uNnisiB2Zo0QdYxr5cWcuu+3gU/HFuDkFTxQCqqcQ/1qt2w/zvQjnTAYN6RLN6sC9@lists.linux.dev
X-Gm-Message-State: AOJu0YwIySy6MHCYD6EC+7Ada499LciR9zLYnj8ofmVIFYe190Xu90Q8
	d3ob4sy+KiC4LHpnQ1RI2pYVMDhWKkwGSGxpNX4pp6NHpBCsznzm
X-Gm-Gg: ASbGnct8cXadSe0NxkijA5sKeMTiYtZjQOdG30l2IIznTqAhAr4Y/6YAtd96GSLF2ZB
	V5dfZJiIiSJi2wO7RY6PT+ubx1zUJF/+JWaRiQcXRqFtX1M24WGMuPyDrdXhJW5V3pKu3qWfcYC
	wxPnLFuvQfVV2VEoIovodjxoFgOg88E6ZtroOKj78rcCSJaLKklCt/e4bMhSAl/PQ3ZY9kHkSum
	uGVmuN3J0aR4fl+cEUVeOYWrIFxdNA8sXyGxgNlBHfwY018MaCsb+upCLuHIL0pVDmHyvY12vHR
	yTd/mVcRyFw07DdOAvBHH6fjfx6cdtBXJu/FZYHvh8we/479mbDdnDDStKfvxaOd5oaFrIPlLoN
	UMWBfVHqvoyNxvOr7CD41fJYIt3DbZoM=
X-Google-Smtp-Source: AGHT+IFWHlknhRROCkvBpQ8Q36YIj9Rb2ZsU6LE10UMoxHGLwXqI9DzNdOi8lYW43nWn0hX9NQ4kOA==
X-Received: by 2002:a05:620a:244e:b0:7c7:9a1d:ecde with SMTP id af79cd13be357-7c927f59245mr2010007185a.8.1745253771686;
        Mon, 21 Apr 2025 09:42:51 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b69579sm437688485a.91.2025.04.21.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:51 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 611A91200043;
	Mon, 21 Apr 2025 12:42:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:50 -0400
X-ME-Sender: <xms:inUGaORcpaPcEuzQr1IyQAVcjj9Go0x4hu8y1bco-clVjpSwZ2UhlA>
    <xme:inUGaDyBA-HhS_aqTivL3Kl85ciy7cq4WqQY8ASCTwR_E6RgDXNFdYbK3K3QTagTH
    bX-hSBThTORB_tX4Q>
X-ME-Received: <xmr:inUGaL1GSheIkJNyy3EdecfpYJeUI-hREdZ1759cC6EZ3Rj6s-7VsSxKsFHK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoufhushhpvggtthffohhmrghinhculdegledmnecujfgu
    rhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhf
    gvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgv
    rhhnpedutedvgfetleeiffeihfetgfeiheetueefhedukedvveejuddvheeujeehuefgte
    enucffohhmrghinheptghrrghtvghsrdhiohdpiihulhhiphgthhgrthdrtghomhdpghhi
    thhhuhgsrdgtohhmpdhkrghnghhrvghjohhsrdgtohhmpdhgihhthhhusgdrihhonecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeehiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhgtuhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgrrhgthhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehllhhvmh
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlkhhmmheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:inUGaKBYTQeenGxlzbt2ma5_91wNhJDIt_UbwBWxJm8S4ROY16FMkA>
    <xmx:inUGaHhAUkmxbrsRTMNt54EVKhJW5yO31O3ZeEBkf2M54aGJW_ElHw>
    <xmx:inUGaGrfdx0hap9-PpevYoMDkyfdeX4VaTG98iOLgtdrhB90FZ7zNQ>
    <xmx:inUGaKjtGJOo8CvZ1JukKvtiSG4GhHC6B1HTWEjncKK6zDbsDaTrEQ>
    <xmx:inUGaGTtstbys_X4xJOZJD0urvnv9_OCUFxinNyzUBKQshtJyw40Fixu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:49 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	lkmm@lists.linux.dev
Cc: Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: [RFC v3 12/12] rust: sync: rcu: Add RCU protected pointer
Date: Mon, 21 Apr 2025 09:42:21 -0700
Message-ID: <20250421164221.1121805-13-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250421164221.1121805-1-boqun.feng@gmail.com>
References: <20250421164221.1121805-1-boqun.feng@gmail.com>
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
 rust/kernel/sync/rcu.rs | 275 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 274 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
index b51d9150ffe2..201c09cb60db 100644
--- a/rust/kernel/sync/rcu.rs
+++ b/rust/kernel/sync/rcu.rs
@@ -4,7 +4,12 @@
 //!
 //! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdate.h)
 
-use crate::{bindings, types::NotThreadSafe};
+use crate::bindings;
+use crate::{
+    sync::atomic::{Atomic, Relaxed, Release},
+    types::{ForeignOwnable, NotThreadSafe},
+};
+use core::{marker::PhantomData, pin::Pin, ptr::NonNull};
 
 /// Evidence that the RCU read side lock is held on the current thread/CPU.
 ///
@@ -45,3 +50,271 @@ fn drop(&mut self) {
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
+pub struct Rcu<P: ForeignOwnable>(Atomic<*mut crate::ffi::c_void>, PhantomData<P>);
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
+pub struct RcuOld<P: ForeignOwnable>(NonNull<crate::ffi::c_void>, PhantomData<P>);
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
+        Self(Atomic::new(p.into_foreign()), PhantomData)
+    }
+
+    /// Creates a null RCU pointer.
+    pub const fn null() -> Self {
+        Self(Atomic::new(core::ptr::null_mut()), PhantomData)
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
+            let new_ptr = new.into_foreign();
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
2.47.1

