Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912311581F0;
	Fri,  1 Nov 2024 06:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441050; cv=none; b=L5fMG4LnJ0J25lkf/cFvEsx8/534hhNy0c4lhJyFNWc8m+YTNbcSQF61vNH2u/FfY9IUumrzWE8gxqJ8RuUcQ5p3Ub4TdFGfm13Q/1XzGIDcU38T6x+P0SCpFuOpzWFG+ok+VIksMbzOlw/XIKg5dNGtYrn8eDjGDJYkoPlXvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441050; c=relaxed/simple;
	bh=dbFh5tZ5JSCZ2km4t7r3WkaZizr4S5DDdwDqMMZTjO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcbp8ghbZ2ZS1+UK7K8Yd2qtYNHivob92ZzA82fp3xHHhhLmVSFf3S+whmzyokr92DD6u6NMvPSg40aMrL2YqV9mZphogPEuCI+FbXbZjjiiWnukyGQhBY1JdvW8Sa0+Pqg5RTpDLpPRpe52U5pHndueu49jIx1LY7jSXf2xjFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bonlVYMq; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bonlVYMq"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cbce9e4598so9694546d6.2;
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441046; x=1731045846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JH7KGrs5tWNaElymjoHhwHajdPBdI1O/huzZLgMbScw=;
        b=bonlVYMqzPbWpVWOBbzPQ1JiPv8q5i2jYPIe+/bTiAoHbtRL8PHlN63S99dyJGmdFK
         iRG0J5gx68FQfsM8yaCSYtL1w/gWnfdzXhjfrED5juGTN6qPXSmXxVO7LaI8RzLpqm80
         aNIPNeohNDvtQoLCg0GB25ugEjrYq3MNe0GtGKbzvaKaazrDsF6hyI9bFcmJoA374xIw
         suPHuSOyIz03XNONIMRgONJnl2akZZ+fZOUcIi3PPvGEFdFlCq9NBmWDigIdShCrY8z4
         HkUTIrBhi5/UK0OlO2UuE9MchL2Q41ev7awv+ji6Xw7MAzPfe0gdcyS6Gq2teh9enpA6
         f63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441046; x=1731045846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH7KGrs5tWNaElymjoHhwHajdPBdI1O/huzZLgMbScw=;
        b=UIy8HTMyN6yrb43dUIphYzzXHYEpjk9Jwg9yPN+QERh5i30VMIP8HBSCC12pNMdahn
         DqixUQr7EfSSHsNVd78Wa7YBv3N9ksNDT54QfzFnC9VjBB8x3NBo/wWrNoDWEVCDsyN1
         VCpFJqFw8PeJy7Rk88vdZouqac/A2lb37vmJ2+FfUh8/57pAl0QlhMyaCF820RfVRJxI
         qob5R1iJr8VJTDza9rr3LMJ1IY94aeOOg4oYyCG3LRyU4pph98ZJhU0etZ2w7P5VJ1Me
         kO0Hj2f/ZIQZs0g+PfHR71TtnNgWCrYvhy82OdWFVwKaS5rjCOvzkDs/WDL16qehOead
         uPCA==
X-Forwarded-Encrypted: i=1; AJvYcCUEmTxSd5CZMNrHoYvs9TIpvT6yZmRTkc+y19UwE1yTDUvfRKScU6FnycLLTjxInV3bAqfz@lists.linux.dev, AJvYcCUPRVWPFxa79YRUvg2ignMDeup5eUpgdorttzN1jrDF6wbMktXMsOjZ0BdSFf/XgvNhUM3ffA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX7iUITmb7PJlsA25XuYXhivqPARhXfn7R+y96hh6pqX0mRoIp
	xfLtWBRT50F136LRjmdZm9HX7pVYeBoZxn3zjzpeatjy69YUTx51
X-Google-Smtp-Source: AGHT+IESIgPAqTkC70WxJjWwkI3tgQEnLpwNYxX5rWL6ZHem8kS8mRx17gqOxaZoRNqJiFjUt2ygsg==
X-Received: by 2002:a05:6214:2f84:b0:6cb:f510:3536 with SMTP id 6a1803df08f44-6d35c19d32cmr27592686d6.47.1730441046358;
        Thu, 31 Oct 2024 23:04:06 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3541780a0sm15671686d6.109.2024.10.31.23.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:06 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1BDFE1200043;
	Fri,  1 Nov 2024 02:04:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 01 Nov 2024 02:04:05 -0400
X-ME-Sender: <xms:VW8kZ4JO8nZn8stwnoGLwG7M1deKc8KbNIHPJ-t-u0o9MEuElGk9jQ>
    <xme:VW8kZ4JVgruJRqq1JKUsGKKcIwDvgkwxSpA-akNuWFtMm4jW9uTKZ8rav0kiN9UPC
    7cXu9Qs1PQO02IfIg>
X-ME-Received: <xmr:VW8kZ4uMiXYrNGIcNbNc7nz_UYWeVhG-ffdi7S0duLCMYPzIXJrg_wvC2iFiMg>
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
X-ME-Proxy: <xmx:VW8kZ1Yl3Wtqdbc4vWLINrvHRGgucu-InHW94wXbmn9oEj03eHgHJg>
    <xmx:VW8kZ_btP9iX2_eY7ZX7gCWN6kM-RYm5jXbwrNMNYSeuVRQYIOx1Ug>
    <xmx:VW8kZxDysbZIvVyh-7cBn73gn0lFbn9MhoxMA4RNYVDuSKqzsAiovA>
    <xmx:VW8kZ1YCnCIpgGsFdioIU29W8VySsvsgQwzUolobAmTvOMc3la-9Mg>
    <xmx:VW8kZ3oPf6rNLC6r1eYjWJOPYh-yZTsFyV93VsXrp1RC2qbxHe9z0SOP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:04 -0400 (EDT)
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
Subject: [RFC v2 09/13] rust: sync: atomic: Add Atomic<*mut T>
Date: Thu, 31 Oct 2024 23:02:32 -0700
Message-ID: <20241101060237.1185533-10-boqun.feng@gmail.com>
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

Add atomic support for raw pointer values, similar to `isize` and
`usize`, the representation type is selected based on CONFIG_64BIT.

`*mut T` is not `Send`, however `Atomic<*mut T>` definitely needs to be
a `Sync`, and that's the whole point of atomics: being able to have
multiple shared references in different threads so that they can sync
with each other. As a result, a pointer value will be transferred from
one thread to another via `Atomic<*mut T>`:

	<thread 1>		<thread 2>
	x.store(p1, Relaxed);
				let p = x.load(p1, Relaxed);

This means a raw pointer value (`*mut T`) needs to be able to transfer
across thread boundaries, which is essentially `Send`.

To reflect this in the type system, and based on the fact that pointer
values can be transferred safely (only using them to dereference is
unsafe), as suggested by Alice, extend the `AllowAtomic` trait to
include a customized `Send` semantics, that is: `impl AllowAtomic` has
to be safe to be transferred across thread boundaries.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs         | 24 ++++++++++++++++++++++++
 rust/kernel/sync/atomic/generic.rs | 16 +++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 4166ad48604f..e62c3cd1d3ca 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -173,3 +173,27 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d as _
     }
 }
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(core::ptr::null_mut::<i32>());
+///
+/// assert!(x.load(Relaxed).is_null());
+/// ```
+// SAFETY: A `*mut T` has the same size and the alignment as `i64` for 64bit and the same as `i32`
+// for 32bit. And it's safe to transfer the ownership of a pointer value to another thread.
+unsafe impl<T> generic::AllowAtomic for *mut T {
+    #[cfg(CONFIG_64BIT)]
+    type Repr = i64;
+    #[cfg(not(CONFIG_64BIT))]
+    type Repr = i32;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
diff --git a/rust/kernel/sync/atomic/generic.rs b/rust/kernel/sync/atomic/generic.rs
index a75c3e9f4c89..cff98469ed35 100644
--- a/rust/kernel/sync/atomic/generic.rs
+++ b/rust/kernel/sync/atomic/generic.rs
@@ -19,6 +19,10 @@
 #[repr(transparent)]
 pub struct Atomic<T: AllowAtomic>(Opaque<T>);
 
+// SAFETY: `Atomic<T>` is safe to send between execution contexts, because `T` is `AllowAtomic` and
+// `AllowAtomic`'s safety requirement guarantees that.
+unsafe impl<T: AllowAtomic> Send for Atomic<T> {}
+
 // SAFETY: `Atomic<T>` is safe to share among execution contexts because all accesses are atomic.
 unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 
@@ -30,8 +34,13 @@ unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
 ///
 /// # Safety
 ///
-/// [`Self`] must have the same size and alignment as [`Self::Repr`].
-pub unsafe trait AllowAtomic: Sized + Send + Copy {
+/// - [`Self`] must have the same size and alignment as [`Self::Repr`].
+/// - The implementer must guarantee it's safe to transfer ownership from one execution context to
+///   another, this means it has to be a [`Send`], but because `*mut T` is not [`Send`] and that's
+///   the basic type needs to support atomic operations, so this safety requirement is added to
+///   [`AllowAtomic`] trait. This safety requirement is automatically satisfied if the type is a
+///   [`Send`].
+pub unsafe trait AllowAtomic: Sized + Copy {
     /// The backing atomic implementation type.
     type Repr: AtomicImpl;
 
@@ -42,7 +51,8 @@ pub unsafe trait AllowAtomic: Sized + Send + Copy {
     fn from_repr(repr: Self::Repr) -> Self;
 }
 
-// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment. And all
+// `AtomicImpl` types are `Send`.
 unsafe impl<T: AtomicImpl> AllowAtomic for T {
     type Repr = Self;
 
-- 
2.45.2

