Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36455154C17;
	Fri,  1 Nov 2024 06:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441045; cv=none; b=fMMjYxbemvaTxB3kcEAGlptyXzcgpj0LUkrSZr1TKH/zawFBv9RisQ7kEHBWMgWewvR+w8bMgU8ueJe/zyrsMYnRsp7+Ut1H0/JGcWh2Wij6sEap/F+eFayWO8OHBPyYvuhA1bae0gchvs+jmuk35nZ8QCi0BOf09G0kfb1WrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441045; c=relaxed/simple;
	bh=Je/hdBK+1dPYF/aKRU71ebJOckhGfeyTHPUHNrcwqw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upQhdmDDn6KSGOS1FiOb2o1oHSMtntjfbvVLDA23t5ymqVV0QlOmCCEvI15AL4HZT39AdkvTf15vQH9+Ih8MJxRGgAMTwiFBnsXmpGzRpLuxpt4QkZQfR2OEDFqBQjA4v7wC0qJ4c8LI72sYqxSB/XX1rVpJVoi4SGDJT1rFrEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxt1h37E; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxt1h37E"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2974743675so1571834276.1;
        Thu, 31 Oct 2024 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441042; x=1731045842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ph2DxAhw/4vnxdgt0bOmp06fJpRNyucZTc/mta0yCHM=;
        b=Xxt1h37EJKO+4e9gXgGVWa37kW4NcnFdR8OTwWkKJJZ2kAVZAklDFWPHVP5ABvgSkM
         SU/EzQJ99Ly4Pw0f75vkOPCoqbhe6J7L1oTqLvwnWo1+ysOx+FJJQE22sSN/TgRS5tKX
         BA8eINjnMp2nwFZNmCB/H2z9QEgZgbKyQdHoYAT7Mz278Vf9mKlp+G9kTh2SFA65mOp4
         /1BO6/RtZYN/vfl2hfbIfPmBL0u/DBdnjf0thxSjvEVckaz1kn59SF+3Uv/Yk8ecrkg4
         o+NhqeRgBWDTyrGqxcoPO4NsrNDEaJ2/+mURIuxSH5F7m51iXaA0XCGpFQtOhZ1sV65N
         fiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441042; x=1731045842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ph2DxAhw/4vnxdgt0bOmp06fJpRNyucZTc/mta0yCHM=;
        b=ERrF6zCsh+rEDnQkel032zesbNRiUGh3OrvuJQBGrnbG2c+xrov/UwDrgrNgcZ6Hhv
         aV7W/3TilrEGW1TpjNKqCyNciJod7t4WmIBn++ErUvThG95+1jT2mb8c5sQhfBHSJBYj
         cGjgtjuTOR4DzUDKbwz6WYD0+ppLRIdRDADrEbt0k/syWua6G3PuGL1N9qwrFtD28Gic
         qP3diP61XHJJf8BGWiZvmWpAlBU818nUkWytk+Y+GW35e4zNRA+7/qnz3wvCNot0eL+r
         bDuMvu4l2tZjgb/2tvZ14DS5AmCWN7iJvjqJB5mtTd3MU7b1t7nDTp8A+9fk0KDl1W4s
         +HFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpxJ/BQ8m9jPa5+93zaXby4Sd0qiOansiWgRlFiggKC+2CsVd3LWtj9MDzyuFj2k96mmcrug==@lists.linux.dev, AJvYcCX/Jat/ShRzwCc15FwrqXxlQW0diNPSGu2HycpbdzdQbXYKQJ9RYlTCUUtHzzUGAKUzSk0g@lists.linux.dev
X-Gm-Message-State: AOJu0YwX1M0Hl2R+5VnXQxoRNsq1ehS5d7LFRvMNynrkNusOIrnCYMBL
	so13GAByydT+IcbRBGFVRY10BRqC4YBfYWJ6woDI6QZXUt/r2tNa
X-Google-Smtp-Source: AGHT+IHkGlgdKze1p73qxOAiQc0MuoROR/SyVFC8MTxPG24ppth96d0R9Aipn2Wg51Xq0Yzvi0ZtnQ==
X-Received: by 2002:a05:6902:2d04:b0:e2b:d829:fbeb with SMTP id 3f1490d57ef6-e30e5b57845mr5969396276.36.1730441041886;
        Thu, 31 Oct 2024 23:04:01 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ad0c6658sm15328281cf.47.2024.10.31.23.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:01 -0700 (PDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id A54591200043;
	Fri,  1 Nov 2024 02:04:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 01 Nov 2024 02:04:00 -0400
X-ME-Sender: <xms:UG8kZ1cnvUfGo0v9wrVnuVpdDsrDiX-M0pEIXMg_7YcPvC_NgNH8Bw>
    <xme:UG8kZzMGDHsivk5wTi-SiUlgG2IcjR8Tyv6Ssns4zt0KYYZ8Wa4lLIP4PBlIt9nTU
    4m2cqvcQ6cF-ftiSw>
X-ME-Received: <xmr:UG8kZ-jNFBoqRM_Imqcg6uEsVMokhH8R3kBpXtbWNLdT9_lemCBoCLd3e6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheejpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepohhj
    vggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesgh
    hmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:UG8kZ--HnRJ7ajC1ySastvZHvFklHSRcrgvQqJMVzC8DKFqSPDj3mA>
    <xmx:UG8kZxtfy0OoYlS4fO2fIedM-JOgZX7GHOsYedYOwi1i0Vya7s9q5A>
    <xmx:UG8kZ9Fc1Cz_6d9umJwXJrKLyvUh1HautBcGiaLkX6vcXtGZ4jax1g>
    <xmx:UG8kZ4PcGCMjtbwk_K_TMkKk9Nte7qSpAdHRjTsHBjZ5YPFzrk_dqQ>
    <xmx:UG8kZ6NiKDOueWofHB7braMdydlhgprdQroV64edlfVht2Jgd_s4ZJLx>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:00 -0400 (EDT)
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
Subject: [RFC v2 06/13] rust: sync: atomic: Add the framework of arithmetic operations
Date: Thu, 31 Oct 2024 23:02:29 -0700
Message-ID: <20241101060237.1185533-7-boqun.feng@gmail.com>
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

One important set of atomic operations is the arithmetic operations,
i.e. add(), sub(), fetch_add(), add_return(), etc. However it may not
make senses for all the types that `AllowAtomic` to have arithmetic
operations, for example a `Foo(u32)` may not have a reasonable add() or
sub(), plus subword types (`u8` and `u16`) currently don't have
atomic arithmetic operations even on C side and might not have them in
the future in Rust (because they are usually suboptimal on a few
architecures). Therefore add a subtrait of `AllowAtomic` describing
which types have and can do atomic arithemtic operations.

A few things about this `AllowAtomicArithmetic` trait:

* It has an associate type `Delta` instead of using
  `AllowAllowAtomic::Repr` because, a `Bar(u32)` (whose `Repr` is `i32`)
  may not wants an `add(&self, i32)`, but an `add(&self, u32)`.

* `AtomicImpl` types already implement an `AtomicHasArithmeticOps`
  trait, so add blanket implementation for them. In the future, `i8` and
  `i16` may impl `AtomicImpl` but not `AtomicHasArithmeticOps` if
  arithemtic operations are not available.

Only add() and fetch_add() are added. The rest will be added in the
future.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 102 +++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index bfccc4336c75..a75c3e9f4c89 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -3,6 +3,7 @@
 //! Generic atomic primitives.
 
 use super::ops::*;
+use super::ordering;
 use super::ordering::*;
 use crate::types::Opaque;
 
@@ -54,6 +55,23 @@ fn from_repr(repr: Self::Repr) -> Self {
     }
 }
 
+/// Atomics that allows arithmetic operations with an integer type.
+pub trait AllowAtomicArithmetic: AllowAtomic {
+    /// The delta types for arithmetic operations.
+    type Delta;
+
+    /// Converts [`Self::Delta`] into the representation of the atomic type.
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr;
+}
+
+impl<T: AtomicImpl + AtomicHasArithmeticOps> AllowAtomicArithmetic for T {
+    type Delta = Self;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d
+    }
+}
+
 impl<T: AllowAtomic> Atomic<T> {
     /// Creates a new atomic.
     pub const fn new(v: T) -> Self {
@@ -402,3 +420,87 @@ pub fn compare_exchange<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -
         }
     }
 }
+
+impl<T: AllowAtomicArithmetic> Atomic<T>
+where
+    T::Repr: AtomicHasArithmeticOps,
+{
+    /// Atomic add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// x.add(12, Relaxed);
+    ///
+    /// assert_eq!(54, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn add<Ordering: RelaxedOnly>(&self, v: T::Delta, _: Ordering) {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_add() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            T::Repr::atomic_add(a, v);
+        }
+    }
+
+    /// Atomic fetch and add.
+    ///
+    /// The addition is a wrapping addition.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Acquire); x.load(Relaxed) });
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.load(Relaxed));
+    ///
+    /// assert_eq!(54, { x.fetch_add(12, Full); x.load(Relaxed) } );
+    /// ```
+    #[inline(always)]
+    pub fn fetch_add<Ordering: All>(&self, v: T::Delta, _: Ordering) -> T {
+        let v = T::delta_into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_fetch_add*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::ORDER {
+                ordering::OrderingDesc::Full => T::Repr::atomic_fetch_add(a, v),
+                ordering::OrderingDesc::Acquire => T::Repr::atomic_fetch_add_acquire(a, v),
+                ordering::OrderingDesc::Release => T::Repr::atomic_fetch_add_release(a, v),
+                ordering::OrderingDesc::Relaxed => T::Repr::atomic_fetch_add_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+}
-- 
2.45.2

