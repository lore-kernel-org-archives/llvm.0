Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7881EB9E8;
	Mon, 21 Apr 2025 16:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253768; cv=none; b=k3j6u1FVHXcGeb/vPCQCv7jQ0xm2lUjh9TxM7VJhXusW7qSF6xvKYA6ZyS7oeE7UiOOTWcRiRRrCVBaG2JUOP2yRrgUts3UWCx7oDevwc7PRr/KlOisWXUyBj3jW+8RGi4/tcdbsKycPj8pERfNVw381YmdW1sLEiOUbPlLxxDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253768; c=relaxed/simple;
	bh=GvXnRtT8VxgnibDq9zxBs4/gUfJm1ape9XUvKM0P9wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdpZV1pBtpF7hk5hbRTuncOHrtoxTqbz+rYeoP01siEKTqPcKpD/YbyIx04YergYkueSNCXy9U+uiT6d845c4qQvt8M3C4+kxsJ2ayolI4LbUOtrL/YSz/a5VR4czOgum39Q6HcilBdGhV6r7PcHoxRmYr1N/G+bipTp0lUVKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMerLOow; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMerLOow"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8f6970326so39003566d6.0;
        Mon, 21 Apr 2025 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253765; x=1745858565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FQdpd+pohHuwKd+PplgPe0guKqarlBZhgyvqtWw2lTY=;
        b=VMerLOowhNpUWTvR/762q6H+hIty+kNOowgU5d6S0XNBijAt8VhNa9DUboKniqAYOR
         33qz9AiZwXSEnoMDBIeb0W65ZFZSXjAlaHooYFQOFOQnzWpSjz4VTWda0CcZL6xTe7DN
         x9ZoQ8WqzkXPjGc+HADwNU0THjBEbPvSe+GjhzoMr7zIGK8enbmtD0+7lR2fswTXz3+K
         ODxF5kgYoaIlghg11Q+gQoJ1iHoqi1RGVBoCnpBujCelIM/mYFg6rnJ6Yt1Hh4CSzffR
         fXjejBw4dI11gS1hxt3y2G3LdBAdbFbjFBk50uMhawraHlygR1POfT9Cz5YwjgUDVhcM
         6DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253765; x=1745858565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQdpd+pohHuwKd+PplgPe0guKqarlBZhgyvqtWw2lTY=;
        b=dBekpTeobD7zo9dbFAVJ5ZYOFoC6PSb9/gg7Nq4jrR+pu6nJX+y4NaV/XkPAyrqnmf
         vKPdjHKq5POA12Gr8XknDnc9IPQsbmSoEzXQ6pLV5KxYHR3g6ag5/MoxvshSShew4hlA
         vkHW6mzuZ+evKN7oYQHf9kPBMeRYavLhSK3Ps+E0ZQoVz74ulB9Li9Sfqsbqm4pT7dpU
         w6Vx0P+SqROWvTeY1rCQs3EXp3DLDEGaoWAvGHWEs2CQLne9OyHiGBKKPtco6+4aBTlr
         wQK6r9rEvNnsthygwjgETG7KJ00u0Awfnm6/O/ouNSK8/on2/C3spZu0SVPYVIqGGkdL
         N8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWBTWs8QGF89R26clhpI79DP3da0oQTMM6Bmos+fj55GUHF+UIGjmsF1EhC8vcKoZDNZ6wXJw==@lists.linux.dev, AJvYcCWVjafBBIvn6Vn5ixGa9A6x0p5b8e4xX1t+IETChhc7kmDJ/a+T6Zidy0H+694a7EIDejB5@lists.linux.dev
X-Gm-Message-State: AOJu0YwLAZumz9toMyCFvTpq5+92wwHs4e1Y2W0rpKmqk7mJtuG1M1K5
	Nbc9yIqxwXOaad2wfAWBmS0ULt7yhLZ9Oxu5KCrHapb2VCJ87HM/
X-Gm-Gg: ASbGncsAj+IkqN4kNSnxWOmwmIxmKiCvNTGNMwU2JkXaSk28G37+7IuW42K//Mf840N
	+oAtxqsI5CQ8y9lJbKeUK3if9p9gCqOUppFRxCIpDhp82bgGLUnxmpfXgVaDf/2BqIpnFFlsvPL
	+bXDWJdVi0J9A/1luvS0idyYtEX4s+oEKcSxwR0KjVq75mCcxOxeOD00f0yG6AVVnew6gUFwYEe
	+A08YVKsFwoshVIvn9DvnAXTvNbYgyXHE0DHkwfPmU5aN+rFdjG2N3egWMk/L6IHaqVetFdHTLF
	6iuFCBMSSMe8L/YfCuN9EXF7HI01VbdAal4l7wmC04lcRnsSR8pXD0D4902t4ZGuFcvNLK64Ypu
	20AH7YXGHbG5OJEaXfh/sz4qe4VaQzvY=
X-Google-Smtp-Source: AGHT+IFludFA784TgNROMF/7dVTxI+vBbVyGDhrIYPf7p9QouCTgDRGsod3hDe4panxOUeE1Tv+cLw==
X-Received: by 2002:a05:6214:1cc3:b0:6e4:2e5f:c03b with SMTP id 6a1803df08f44-6f2c4569fefmr189839786d6.22.1745253765057;
        Mon, 21 Apr 2025 09:42:45 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcd35sm45649936d6.69.2025.04.21.09.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:44 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D19181200043;
	Mon, 21 Apr 2025 12:42:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:43 -0400
X-ME-Sender: <xms:g3UGaDqM-oRY72VYfjjMMPWBvD260B0kTEAsydJZkF4gN068ia1SFw>
    <xme:g3UGaNrsF5Ku86dctP77P9l30AlPIBsgRI8mheoJ1zwGoh1aEhvWqRbi01tZqtDqV
    w-lrLPLVxP1XWVb7g>
X-ME-Received: <xmr:g3UGaAMNVA8SJrYRDpHMhbtIliU3S27SHm1GKUj-cWhLjgzbQf_Mn0IK7CxF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpeehnecurfgrrh
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
X-ME-Proxy: <xmx:g3UGaG6oIejwUk9ROXZAi4AfIt86GNmDOQtx95SfmZVDVwnImBiYnw>
    <xmx:g3UGaC5PU_lidQwNoZHsPp0xYqmuTX4yzf9_8XjK0nKJ0BJHzgnGgw>
    <xmx:g3UGaOim6mTR3MiQ5pi4rJo98ItyYarif3n-MV2yevViPc9uX9wO5A>
    <xmx:g3UGaE4SW0qcatBPuakGjhChYJB0n5Lj_GIF-9KAOwr7heV_-atzVg>
    <xmx:g3UGaBKs0Qe-XZ3HmeRKLnaez0zEWFmBrXeDFaK7kh5arXwITaODOVeO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:43 -0400 (EDT)
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
Subject: [RFC v3 08/12] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Mon, 21 Apr 2025 09:42:17 -0700
Message-ID: <20250421164221.1121805-9-boqun.feng@gmail.com>
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

Add generic atomic support for `usize` and `isize`. Note that instead of
mapping directly to `atomic_long_t`, the represention type
(`AllowAtomic::Repr`) is selected based on CONFIG_64BIT. This reduces
the necessarity of creating `atomic_long_*` helpers, which could save
the binary size of kernel if inline helpers are not available.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index d197b476e3bc..6008d65594a2 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -102,3 +102,74 @@ fn delta_into_repr(d: Self::Delta) -> Self::Repr {
         d as _
     }
 }
+
+// SAFETY: `usize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for usize {
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
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Full, Relaxed};
+///
+/// let x = Atomic::new(42usize);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for usize {
+    type Delta = usize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
+
+// SAFETY: `isize` has the same size and the alignment as `i64` for 64bit and the same as `i32` for
+// 32bit.
+unsafe impl generic::AllowAtomic for isize {
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
+/// let x = Atomic::new(42isize);
+///
+/// assert_eq!(42, x.fetch_add(12, Full));
+/// assert_eq!(54, x.load(Relaxed));
+///
+/// x.add(13, Relaxed);
+///
+/// assert_eq!(67, x.load(Relaxed));
+/// ```
+impl generic::AllowAtomicArithmetic for isize {
+    type Delta = isize;
+
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        d as _
+    }
+}
-- 
2.47.1

