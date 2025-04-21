Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190EA1A238A;
	Mon, 21 Apr 2025 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253760; cv=none; b=h/PRPO6jI7QvlKo/crDq46FiBzhy0S/wZ22m2M1C9xPTj44yY1jrta1MdCqN7vhC/J+iP5BhmsYzZ1+83e8u0w3lKWuEAuVeg56HaSmWuVy9a3BlY6e5tuXq/0dh9svx7sjcDcSzT3AShnJtW4E9NHtTBDrLlmV6TYuw4ZW/YoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253760; c=relaxed/simple;
	bh=BabJT8shFeooLOlaKbp3PTDt9xeyZZVe051+I5Kt8A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FVdg3MM7b9EPx9leYc2v62mwSh1AIw1th5M+cjJmTNQPiuZNO32S4N0J7huJg4v0xrWgY8fJyfGiNSXdLfGMmWHU6FOPEonZUqTrTUTQooGnRUrGaroBqFsB260r1Mk3IDN53D3S1dNjrEKsjbaqDHbORhKFlWaob4p7Vc/XIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntcTEcB1; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntcTEcB1"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c08f9d0ef3so204411285a.2;
        Mon, 21 Apr 2025 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253757; x=1745858557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8saFQNyFDcMMxSMO/2MuZCuMNf/4lANNbiDkrHm2aLE=;
        b=ntcTEcB1GYdKU0Knu0/ifBBTOeTL6KNbsItFT8ZgRKTUDgfWGeiPYbsfSJAjRkRemz
         tYIeKD0mPcdxUKd3EPE8m4hgy96KOJQPXliAfiZ/DwXb6YCurrJ2LA3OyGT9FcSlKLTe
         2a6tM3vjujdTDJY62Ah6M6B9hRHQX+sGkUsRePFknNC4gkp7QptuUu1b4IRoE3KRFezS
         EWq6jSd4DEQjsfye2k9/VYJTz1tDROzpdJJdgxjteAOh6CZxJHq2FK3T5rTIqhxCuwvE
         3QvoREaqGVNRYtRhtEiMz51d8K6HILw/9KyCuTx9hNilisRHJ5rMXqH+lVpm1XdCFf4l
         bYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253757; x=1745858557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8saFQNyFDcMMxSMO/2MuZCuMNf/4lANNbiDkrHm2aLE=;
        b=bYUO/GvkZMTf68e0UxpNIxr0/Rwn15i08I13OJYolA01WTwzB0wAcxxIOdSCoBZnAk
         Kdaglhz6abajzSXSrSRGV6mwU3StiCzN+VU3EPggQ7K7YkhFclQZGfmDMrh08yHOC4kO
         45yUllVdyaSxT+ccJXsOsPFHSoJ+2PHPgsz1inxgx2qVmouRLRl2De2BjRfpqCGoDAdD
         K9VolDaqEZxspjWyF1toHgrgIJ18ueDkxLfle8bPEgS3lrMPockTI5zKu7OhoRnGmO6t
         pbZa/OSeGXr5Y4PW7m1oL5C9K0ldAA/cl1SlsLp5srnMzy9hXr576J1sbvYcj02q/dYv
         hK5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3hLxnimVxbJ+rVpLmLgyNiWi1iP/joaUs7SSt6LUoJ/5v0anud2fE/1ELxdKpiZMVejFq@lists.linux.dev, AJvYcCWUZOf8AVAm9zG0guH+aGIIVmpW62Mv2ScznpNctRDxAQhbATAndAVu3YQQ57zl3evb5F7A/g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywtc1cjOovidvgu7wN3hA8ChWHURKp1uu4KSf0B965XA6iwmBi6
	w92N3RCdoxCvQ1Oj+w/G9YCWA+bPdurIktJNflEhaAM6bsbRPzK1
X-Gm-Gg: ASbGncvxR+i1k8n5A6EfE/9kaEE5q00zdM8afPqWgsyN1BUK08h3PnQt1Ow9p/EnZA5
	CphpK7adSl4VTD398+G6L768MpZ7xnn23g/6OZKmUQsmu4WtFf61RUFe1gPXoNEtys/VFszrCQL
	poIWT2JY3c5I/QOf0PgEX9koqSPfp3m7KEUPwtojdpNhxkpNCKzxCM1IwDsMPYP4chHY1vdNTn9
	hvx5FsxEfeRKp2GGHff/0ZlhY+I5rmG+LgTJf0HJy3rlCBqE/IyTXEbN6u7syaVdAznRc0HRiqk
	7B+O6Kn6/R6ufOC3kadEfTS/UYfA3FHAdW+/ngILBNszXgUjTgnbJVqXxlKRVnMVsoTiI1zOu55
	zBof5HeaMfq/4TN8Lpf10JiLrS43z71c=
X-Google-Smtp-Source: AGHT+IFnTfyYLHBZmdffCGm74NenJlOIzpShFRC9OZkBB5aKvXLSHyWnfdI44qRzSfT84fBvsgrmmQ==
X-Received: by 2002:a05:620a:2408:b0:7c7:a604:d432 with SMTP id af79cd13be357-7c927f9d235mr2000884785a.30.1745253756813;
        Mon, 21 Apr 2025 09:42:36 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6e7casm437805385a.10.2025.04.21.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:36 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8A0CE1200043;
	Mon, 21 Apr 2025 12:42:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:35 -0400
X-ME-Sender: <xms:e3UGaOJuPUX353U4Na-PAzbZ9_eIacaEv3koh8zvIRjobm3xRPCrmA>
    <xme:e3UGaGJeFSnMgyj6zNUtSMbtIJXHeuvdtwp9TAj6T_MeENHbWqAruAqQ93VDJNYWE
    vu-qbVleOnSgy5Gfw>
X-ME-Received: <xmr:e3UGaOuTnaY5XLzrDRiQ0QT2mC3CTYlTkGnq8PVRrF-eVVQVuQvC2a9yKskx>
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
X-ME-Proxy: <xmx:e3UGaDaJhO8GD_lQnoToaYj26JjNilDFxNwDLQ6bNgN-qVgELxslGw>
    <xmx:e3UGaFa0wJzZsYsRDhRcsjONGl8dHJ1Y_vAU3JShAmFWyr_6wsDuQg>
    <xmx:e3UGaPCoQDQXWJ_o80upbL9_LjOk8FMLA9XPixSIf_MqBhWcY-ByXA>
    <xmx:e3UGaLYfLadt2fK-wQhq3YeZKE6J5l3QOXG4bLnDg1-jQ5REUv1FZw>
    <xmx:e3UGaFrRLNGByuGgBUjbtTf5RdPVaRb4p2ucHW6NVTdCBbgVMV8FqkiL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:34 -0400 (EDT)
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
Subject: [RFC v3 03/12] rust: sync: atomic: Add ordering annotation types
Date: Mon, 21 Apr 2025 09:42:12 -0700
Message-ID: <20250421164221.1121805-4-boqun.feng@gmail.com>
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

Preparation for atomic primitives. Instead of a suffix like _acquire, a
method parameter along with the corresponding generic parameter will be
used to specify the ordering of an atomic operations. For example,
atomic load() can be defined as:

	impl<T: ...> Atomic<T> {
	    pub fn load<O: AcquireOrRelaxed>(&self, _o: O) -> T { ... }
	}

and acquire users would do:

	let r = x.load(Acquire);

relaxed users:

	let r = x.load(Relaxed);

doing the following:

	let r = x.load(Release);

will cause a compiler error.

Compared to suffixes, it's easier to tell what ordering variants an
operation has, and it also make it easier to unify the implementation of
all ordering variants in one method via generic. The `IS_RELAXED` and
`ORDER` associate consts are for generic function to pick up the
particular implementation specified by an ordering annotation.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs          |  3 +
 rust/kernel/sync/atomic/ordering.rs | 94 +++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/ordering.rs

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 65e41dba97b7..9fe5d81fc2a9 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -17,3 +17,6 @@
 //! [`LKMM`]: srctree/tools/memory-mode/
 
 pub mod ops;
+pub mod ordering;
+
+pub use ordering::{Acquire, Full, Relaxed, Release};
diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
new file mode 100644
index 000000000000..6cf01cd276c6
--- /dev/null
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory orderings.
+//!
+//! The semantics of these orderings follows the [`LKMM`] definitions and rules.
+//!
+//! - [`Acquire`] and [`Release`] are similar to their counterpart in Rust memory model.
+//! - [`Full`] means "fully-ordered", that is:
+//!   - It provides ordering between all the preceding memory accesses and the annotated operation.
+//!   - It provides ordering between the annotated operation and all the following memory accesses.
+//!   - It provides ordering between all the preceding memory accesses and all the fllowing memory
+//!     accesses.
+//!   - All the orderings are the same strong as a full memory barrier (i.e. `smp_mb()`).
+//! - [`Relaxed`] is similar to the counterpart in Rust memory model, except that dependency
+//!   orderings are also honored in [`LKMM`]. Dependency orderings are described in "DEPENDENCY
+//!   RELATIONS" in [`LKMM`]'s [`explanation`].
+//!
+//! [`LKMM`]: srctree/tools/memory-model/
+//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
+
+/// The annotation type for relaxed memory ordering.
+pub struct Relaxed;
+
+/// The annotation type for acquire memory ordering.
+pub struct Acquire;
+
+/// The annotation type for release memory ordering.
+pub struct Release;
+
+/// The annotation type for fully-order memory ordering.
+pub struct Full;
+
+/// The trait bound for operations that only support relaxed ordering.
+pub trait RelaxedOnly {}
+
+impl RelaxedOnly for Relaxed {}
+
+/// The trait bound for operations that only support acquire or relaxed ordering.
+pub trait AcquireOrRelaxed {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl AcquireOrRelaxed for Acquire {}
+
+impl AcquireOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// The trait bound for operations that only support release or relaxed ordering.
+pub trait ReleaseOrRelaxed {
+    /// Describes whether an ordering is relaxed or not.
+    const IS_RELAXED: bool = false;
+}
+
+impl ReleaseOrRelaxed for Release {}
+
+impl ReleaseOrRelaxed for Relaxed {
+    const IS_RELAXED: bool = true;
+}
+
+/// Describes the exact memory ordering of an `impl` [`All`].
+pub enum OrderingDesc {
+    /// Relaxed ordering.
+    Relaxed,
+    /// Acquire ordering.
+    Acquire,
+    /// Release ordering.
+    Release,
+    /// Fully-ordered.
+    Full,
+}
+
+/// The trait bound for annotating operations that should support all orderings.
+pub trait All {
+    /// Describes the exact memory ordering.
+    const ORDER: OrderingDesc;
+}
+
+impl All for Relaxed {
+    const ORDER: OrderingDesc = OrderingDesc::Relaxed;
+}
+
+impl All for Acquire {
+    const ORDER: OrderingDesc = OrderingDesc::Acquire;
+}
+
+impl All for Release {
+    const ORDER: OrderingDesc = OrderingDesc::Release;
+}
+
+impl All for Full {
+    const ORDER: OrderingDesc = OrderingDesc::Full;
+}
-- 
2.47.1

