Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80432155A5D;
	Fri,  1 Nov 2024 06:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441047; cv=none; b=NpRP3X63IJqH/iO2oT15G1Ugebf2BaMi/8p1fSOTcfEL2ZpzWwjae9a7HbNe1HpV4lp8mcUV7NO2lC7386cWH4htQ182ZRxUtY4xp28TsR7y4hO/aWkGFrfgjNvyMpn/21/X8nLKTgLTr8R/ok6ykYXr+pXI+BrynFPZDA4qx/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441047; c=relaxed/simple;
	bh=b6SXwnbsu/RlNkPBThbz53fj6R3sDIHRgIrxZgJqXoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mq96d8UcFiyeIkfYKUBpiyqu6hVjwPrFd0Z7XSd3liFPsRXdam3fO60ckd11KxLXq553Pi0lzuy0Cpe5VP8cFzTOd2EBnaAoEXRITLQvx2zkIDtf9RfWRuZ29Za9R/5xS3sXCq+OB8QzBzBQjBH8a8bzExA9BwefVs8kim3osk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLdF4J2V; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLdF4J2V"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b14554468fso111095185a.1;
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441043; x=1731045843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6aL27TUodcAdd+uJ8RiXbRTkzdjD0lB6w2v/luzePnk=;
        b=hLdF4J2VcCn8ihKPyKaZ5YCO6Upo5wS+ZHVLI4UIj8bvDYPlUBlGuy0c1xFMW59tD+
         A0g5H35GfQSaXQq1wly77blfKJNg7W5l0oaUNrwKOhI3xONZP6lpUBJntDnp5YCz/tNk
         0a4J+KRZARMChFm0aIT2KY2CQDV19q7agklSityHkSJBZpTmCQjtXn2u+bSKbPg/TZ2l
         FSFFkbDsVAdqm8JFyFfk2O1B9eNJAUD3F5waTEtYSpHgAQV/sDW+/NIKDfdxE7DvF18M
         2ZInB8m3TcGBC5q22hrR2EVwTTywsGhDjP1Km1dqayo+T/3o+nQWqqUDdBIn8SlG4kCy
         /WpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441043; x=1731045843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6aL27TUodcAdd+uJ8RiXbRTkzdjD0lB6w2v/luzePnk=;
        b=ZpKCvARe0ILCMI9GBMMKS9fADhjr+QpyJsHaTehGYnA7h9L1C5/Xa5rxAVRBzZMvVm
         KIWgAaNtYTiuDwhqVPaDixaXg+VeILh0x3gKVavYNP8eiHAHZ3metymmNYZwChNmrTgh
         7nAR3mtxaUCW3Zc8N3eDR3mzzXbW/r0U0s+zg5G9MpP3fxEwwkikMfbH0zA6hhgrC6/Q
         Trnj2VZEYHmQ/8ukq/MezPzngDOoN7VGhWvEgWaoCcInJ5fRF/U4wtRh6ppdvexFc/mV
         Qp9kpExsxjphwOOJIyRSSnhr/KCvc2TLszvC6+4U0UNOjnMA5C6YWZmAvgz5e/RWRWmf
         S9Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV73r+89Vj7ollxvUOnZ/5hH4c4CfX2U1AoWWNpj7At0QWLIHOhabYOF9ga+eF/Eqim8k/g@lists.linux.dev, AJvYcCV8xu5YKcj97yt5T4N0PI3X010ieyig/rmcmZyvVgX2IF5nl6o4fXbhJ2sAhzjUjfhzuRAuUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNeXoHyl7kjEu+ZfGxR2Vz72h9m1rC+6/HmAQg9foe8pIQRvQH
	x4xY8lq7uRgrTbFhkQrkOmWfUNsYVB6RDl2/LIjpNdjqnN/G6Vb+
X-Google-Smtp-Source: AGHT+IEBsIeTKPMFVd18zq3m0TbNuXedTa+kxiUVC1B4NUnt+dZIvvMRhm1ETl2jJ5UPhxkWU8o/Gg==
X-Received: by 2002:a05:620a:4554:b0:7b1:7d5c:8f9a with SMTP id af79cd13be357-7b193efe4c8mr2648481885a.28.1730441043401;
        Thu, 31 Oct 2024 23:04:03 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39e9b54sm141659585a.5.2024.10.31.23.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:03 -0700 (PDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 36BE21200043;
	Fri,  1 Nov 2024 02:04:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Fri, 01 Nov 2024 02:04:02 -0400
X-ME-Sender: <xms:Um8kZ78rYvgtGQNRIz9FXaznnWxEMTH4ZNoK7rFf0t4SGfyaRBeZsg>
    <xme:Um8kZ3tWJDPoAFZEDjR38L_nnGPIGx0ZONWcJ9i7iL4mZTjbVgScBgLyzeveDj-bk
    GCl_07T8Q1A6RRugQ>
X-ME-Received: <xmr:Um8kZ5Cs78brre0AKFYvtLROzAI8e9BLMy-EAU4fXeFV6SSqvD6ReRNmSVKg3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:Um8kZ3dFuUJ_LsZ43tDz_a34qYVrx_8alQQ1-aKyCdVHRdUCWbnRPw>
    <xmx:Um8kZwNCQ1W14NHd5xyHAkMP0uthoHYmNCC9vaIyRNBp5V8kCq7xcA>
    <xmx:Um8kZ5lpnLCjUS9S7xcMG-Y_jMn6ecNBqoFExHiOLbIE6_wPRVtK2g>
    <xmx:Um8kZ6v9ITMPGv2iDAegTY1OREf7shkA9Pg02bs0kYkFBx_PHCCv0g>
    <xmx:Um8kZ6twtXsgjI5mkQE7RNkDKDO1HpSi4RmwBl5t23RkZxBAkq7iBTsk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:01 -0400 (EDT)
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
Subject: [RFC v2 07/13] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Thu, 31 Oct 2024 23:02:30 -0700
Message-ID: <20241101060237.1185533-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicIpml` with the same size and alignment.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index b791abc59b61..b2e81e22c105 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -22,3 +22,83 @@
 
 pub use generic::Atomic;
 pub use ordering::{Acquire, Full, Relaxed, Release};
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(42u64);
+///
+/// assert_eq!(42, x.load(Relaxed));
+/// ```
+// SAFETY: `u64` and `i64` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u64 {
+    type Repr = i64;
+
+    fn into_repr(self) -> Self::Repr {
+        self as _
+    }
+
+    fn from_repr(repr: Self::Repr) -> Self {
+        repr as _
+    }
+}
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42u64);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for u64 {
+    type Delta = u64;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let x = Atomic::new(42u32);
+///
+/// assert_eq!(42, x.load(Relaxed));
+/// ```
+// SAFETY: `u32` and `i32` has the same size and alignment.
+unsafe impl generic::AllowAtomic for u32 {
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
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42u32);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for u32 {
+    type Delta = u32;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
-- 
2.45.2

