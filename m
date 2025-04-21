Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CC01E9B1F;
	Mon, 21 Apr 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253763; cv=none; b=EWR90OYfRfc0XBHvgOKDf0upSJESZH+lGk5Lgb97uc/TyPH0eAF43mykyz5asA1K7VDQNpf/1/hCJxNz+lZMbbmTCr4fbUSKdmI8o0t/GGBu3cStzbAydUqClU4/ZxiDCDuytxQVehdRcjshtx1fObKFUbJ0MOXlyYmomKiqyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253763; c=relaxed/simple;
	bh=yplzto+5ajpLI7kECpauLp8HuHi1ihU0Fk9lmFiGkMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKnVAgo91C4JAn5OG4f/XaJrydbBbaolGKB5incXvbE7JTmmVbPqqdMCaPzvBqE/llUdycpALRxWQydz1JGgXMXIHPtpOroih6SzjbrMtYED0ionXZom2KBO+jQ/6bzcuraeBJe2ahJ33vx53mvm/AQfxTOLhIht+JiizIhM4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDNbEoWh; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDNbEoWh"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c54f67db99so508135485a.1;
        Mon, 21 Apr 2025 09:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253760; x=1745858560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aV8YwGgeoCl+I8co/zSeKwDIuhVQPzbGhymLAEUJ1wA=;
        b=FDNbEoWhcTFQPSn5drLz3VqSFcZOsZd4VDWDzAVbvEbj1UA1mzWNlI3vkPNEmZFTC8
         LGlOOY3ZbWmXrHAG+kOLvW6bz/zhVy1RFfQfYxZLxyqActpCe/FJBXG9PgT5scLWVx36
         X4y/phPx4FIqCxQyBhan4cui00dwAeDPx8xr0vCRE6zpi03veRjDU4TJAePAQE23go/7
         f4AFDP0R7Zuc5ERH9+3FrAfQA6K2h2/4Shny0pDoR1WTns7BvH3MCJ/qKC4HBffJz4BB
         m3o5Duzh03iv7M7yWZBGXmaF/TUf9cdaWt1KZ97wTvFe9smJFfqokGp2w+eJReeYTk7+
         JSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253760; x=1745858560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aV8YwGgeoCl+I8co/zSeKwDIuhVQPzbGhymLAEUJ1wA=;
        b=wL/Y1CAbPDmHw936RkZ+gQstlIFd1utas/2vGoPdXI1At4nH8pUymG4ey0OlwWQUP8
         gUL1ZBo0bOveH4I+FmnmlPsyaqLWjZ4PWxS/dkYJnGkyGckNhdQheflSJ7ssaoB2Fw83
         yU758rcbRsX7CELVsI9z1ZL+oBpWf02nP/Qye8310On+/GMQKOfykqHi7HT9aW5xflLI
         1ssND0uxrFoq3Hoj19HQcgbnfXa+zPGogdF/PkPswwxWWtr+vHuTaw+sLFn1TWq0qvTR
         EKXKbi2o/OxkEv6mTA/ZObafCnR7V+bud+jVU7dELzELEgIARnRdU2cAQ5i0VPyVN1Ui
         xlng==
X-Forwarded-Encrypted: i=1; AJvYcCVN61EBStfb0UfA8gurWLuq5nsqZAAIq+LMvH/fehZ1xml6sxVsY7/VT+3DF8rt6M3FhD3U+w==@lists.linux.dev, AJvYcCWDGckZlnPJWW96+sOwuxO1m5b+l7X4+Z5GvKmGosuOEx8rF09yk2GyUCUP9RrT6CCAg28j@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7pr0KjtCEgus6CoRPYsdteVwFjYMcIgYb6uvxO/z5190PGebS
	F2EW6H6MOF5fKDHpTruCDZQcTmLuRgTMViYKxPiiFsn+C0gfXRsH
X-Gm-Gg: ASbGnctm7sNYH2YGtzhHG6aplh7c1AHs19xdpVJCyagk6le/kv/a71enmrTLjZkk/Wp
	+xk/Cmqj6pSHvbCKaTNOo8bVLk1vcuUxxIiOlNXl99Y1xnrPBfbs0/fMK9pGatp3LXuOBi/DT1F
	Z4uIP6xFp9l03ISWYVOddYvr2X6WzMmDapqt74rfbcDsk4WmmyBbGof0STiQOF1Bv7uzbUlLXPs
	+rLHmnIFfhBemaN1nyXuXzLwrn4VSqGjZKcM3jcflx8TK12sdBsarahybO5R4WeSju3rzdwZ99Q
	b+jUHyXj8aRO1e1w8c6/W16ux6AQxDWwKlmskO62dHR47QfZCBl4hUP+Hey3ehSE6ih/acleQIe
	tQKmxbNmYw6zJBu5kYBBugEbBjTzVG7g=
X-Google-Smtp-Source: AGHT+IH1RnA/urfHEysrasRcC1HaaxAKelZPEa1ZcED1/oQ7DeTiLSmfGd+3w5Ae4ocldgGoGC3tzg==
X-Received: by 2002:a05:620a:24c5:b0:7c5:a20f:a091 with SMTP id af79cd13be357-7c925737e39mr2005587085a.2.1745253760416;
        Mon, 21 Apr 2025 09:42:40 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e784sm438536985a.12.2025.04.21.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:40 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 199D11200043;
	Mon, 21 Apr 2025 12:42:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:39 -0400
X-ME-Sender: <xms:f3UGaAQkZ74BxPP9LPOcNIVI2W_p5XzlA7xOwB8RgEX_lX3uPz1gqg>
    <xme:f3UGaNwJ7K_T3NQd4BEDBJnloQHUsIACRFY_0H8wcUrFqvNhUjwzrL846JGoMas0Y
    uHGYK6gBlRrZ2STUg>
X-ME-Received: <xmr:f3UGaN0yjM7gm0dL-dsf6luCuxeDACJgS9N7gopacSGRwwtctRFKS4Roh08U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheeipdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvh
    hgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrtghusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrtghhsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpd
    hrtghpthhtoheplhhkmhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdr
    tghomh
X-ME-Proxy: <xmx:f3UGaECiA7ZD2VAXhjE0djxYRmS4TCP1ZvyDz8THkiCGfqulY5Aucg>
    <xmx:f3UGaJhZlRI4r6RDJD-mwQ5pxjgb70gRIcnfYEO1Ozdli_xguBDvbQ>
    <xmx:f3UGaApSHAENXDjbdlgR7Mo5WLZXnYmv4BrqPl8xzLjAXU-Kr67cAQ>
    <xmx:f3UGaMh7maq72LlUVazthHopqmSD3KBxJ_xqtlPOL7DmVDbNUPpWtg>
    <xmx:f3UGaAQxoB0BXXcbXSvI3jpboPIzTrs4pDCjI15n7ymWYpiN7DxVQrvu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:38 -0400 (EDT)
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
Subject: [RFC v3 05/12] rust: sync: atomic: Add atomic {cmp,}xchg operations
Date: Mon, 21 Apr 2025 09:42:14 -0700
Message-ID: <20250421164221.1121805-6-boqun.feng@gmail.com>
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

xchg() and cmpxchg() are basic operations on atomic. Provide these based
on C APIs.

Note that cmpxchg() use the similar function signature as
compare_exchange() in Rust std: returning a `Result`, `Ok(old)` means
the operation succeeds and `Err(old)` means the operation fails. With
the compiler optimization and inline helpers, it should provides the
same efficient code generation as using atomic_try_cmpxchg() or
atomic_cmpxchg() correctly.

Except it's not! Because of commit 44fe84459faf ("locking/atomic: Fix
atomic_try_cmpxchg() semantics"), the atomic_try_cmpxchg() on x86 has a
branch even if the caller doesn't care about the success of cmpxchg and
only wants to use the old value. For example, for code like:

    // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
    let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);

It will still generate code:

    movl    $0x40, %ecx
    movl    $0x34, %eax
    lock
    cmpxchgl        %ecx, 0x4(%rsp)
    jne     1f
2:
...
1:  movl    %eax, %ecx
    jmp 2b

Attempting to write an x86 try_cmpxchg_exclusive() for Rust use only,
because the Rust function takes a `&mut` for old pointer, which must be
exclusive to the function, therefore it's unsafe to use some shared
pointer. But maybe I'm missing something?

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic/generic.rs | 122 +++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index 5d8bbaaf108e..73aacfac381b 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -252,3 +252,125 @@ pub fn store<Ordering: ReleaseOrRelaxed>(&self, v: T, _: Ordering) {
         };
     }
 }
+
+impl<T: AllowAtomic> Atomic<T>
+where
+    T::Repr: AtomicHasXchgOps,
+{
+    /// Atomic exchange.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Acquire, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// assert_eq!(42, x.xchg(52, Acquire));
+    /// assert_eq!(52, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn xchg<Ordering: All>(&self, v: T, _: Ordering) -> T {
+        let v = T::into_repr(v);
+        let a = self.as_ptr().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_xchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllocAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        let ret = unsafe {
+            match Ordering::ORDER {
+                OrderingDesc::Full => T::Repr::atomic_xchg(a, v),
+                OrderingDesc::Acquire => T::Repr::atomic_xchg_acquire(a, v),
+                OrderingDesc::Release => T::Repr::atomic_xchg_release(a, v),
+                OrderingDesc::Relaxed => T::Repr::atomic_xchg_relaxed(a, v),
+            }
+        };
+
+        T::from_repr(ret)
+    }
+
+    /// Atomic compare and exchange.
+    ///
+    /// Compare: The comparison is done via the byte level comparison between the atomic variables
+    /// with the `old` value.
+    ///
+    /// Ordering: When succeeds, provides the corresponding ordering as the `Ordering` type
+    /// parameter indicates, and a failed one doesn't provide any ordering, the read part of a
+    /// failed cmpxchg should be treated as a relaxed read.
+    ///
+    /// Returns `Ok(value)` if cmpxchg succeeds, and `value` is guaranteed to be equal to `old`,
+    /// otherwise returns `Err(value)`, and `value` is the value of the atomic variable when
+    /// cmpxchg was happening.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+    ///
+    /// let x = Atomic::new(42);
+    ///
+    /// // Checks whether cmpxchg succeeded.
+    /// let success = x.cmpxchg(52, 64, Relaxed).is_ok();
+    /// # assert!(!success);
+    ///
+    /// // Checks whether cmpxchg failed.
+    /// let failure = x.cmpxchg(52, 64, Relaxed).is_err();
+    /// # assert!(failure);
+    ///
+    /// // Uses the old value if failed, probably re-try cmpxchg.
+    /// match x.cmpxchg(52, 64, Relaxed) {
+    ///     Ok(_) => { },
+    ///     Err(old) => {
+    ///         // do something with `old`.
+    ///         # assert_eq!(old, 42);
+    ///     }
+    /// }
+    ///
+    /// // Uses the latest value regardlessly, same as atomic_cmpxchg() in C.
+    /// let latest = x.cmpxchg(42, 64, Full).unwrap_or_else(|old| old);
+    /// # assert_eq!(42, latest);
+    /// assert_eq!(64, x.load(Relaxed));
+    /// ```
+    #[inline(always)]
+    pub fn cmpxchg<Ordering: All>(&self, mut old: T, new: T, o: Ordering) -> Result<T, T> {
+        if self.try_cmpxchg(&mut old, new, o) {
+            Ok(old)
+        } else {
+            Err(old)
+        }
+    }
+
+    /// Atomic compare and exchange and returns whether the operation succeeds.
+    ///
+    /// "Compare" and "Ordering" part are the same as [`Atomic::cmpxchg()`].
+    ///
+    /// Returns `true` means the cmpxchg succeeds otherwise returns `false` with `old` updated to
+    /// the value of the atomic variable when cmpxchg was happening.
+    #[inline(always)]
+    fn try_cmpxchg<Ordering: All>(&self, old: &mut T, new: T, _: Ordering) -> bool {
+        let old = (old as *mut T).cast::<T::Repr>();
+        let new = T::into_repr(new);
+        let a = self.0.get().cast::<T::Repr>();
+
+        // SAFETY:
+        // - For calling the atomic_try_cmpchg*() function:
+        //   - `self.as_ptr()` is a valid pointer, and per the safety requirement of `AllowAtomic`,
+        //      a `*mut T` is a valid `*mut T::Repr`. Therefore `a` is a valid pointer,
+        //   - per the type invariants, the following atomic operation won't cause data races.
+        //   - `old` is a valid pointer to write because it comes from a mutable reference.
+        // - For extra safety requirement of usage on pointers returned by `self.as_ptr():
+        //   - atomic operations are used here.
+        unsafe {
+            match Ordering::ORDER {
+                OrderingDesc::Full => T::Repr::atomic_try_cmpxchg(a, old, new),
+                OrderingDesc::Acquire => T::Repr::atomic_try_cmpxchg_acquire(a, old, new),
+                OrderingDesc::Release => T::Repr::atomic_try_cmpxchg_release(a, old, new),
+                OrderingDesc::Relaxed => T::Repr::atomic_try_cmpxchg_relaxed(a, old, new),
+            }
+        }
+    }
+}
-- 
2.47.1

