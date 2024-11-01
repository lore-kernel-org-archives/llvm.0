Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C39156C69;
	Fri,  1 Nov 2024 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441048; cv=none; b=nFMx+1yjh94QYwQp4/oA14cG9zUCMNNiisERi3puvJdRoKsgNfXZvQkJJ6frs4cT0Fgywq1XfCVPNQfRdAynzkbBJdCa5lCrql7if0shueaTCjmOLIESMoYTcHjmzcrxkBKN7ubZkc4slZV+8bcLk+dhYQEOW/uUd3XqDIan6X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441048; c=relaxed/simple;
	bh=p9btVVa2+xSWu4bOPpbx4eV63bulX64vxQ6AaKLpk8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gjn4hrvVN73HpVn1c3pwPOG1/Ka/B3FFGBEPmRR2Xe3tI1ZKUWurSCnbYMfRZlCuEw/C9qfd9/lsb7cYDBleos8lsgMxqP/oWHjGXoS43lZYBk1tdk/+W5VYMVSn1634fgEu51LniYm2pCKCjQqF5LEIkeHJlmnUjlQisxgs7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INI95CZU; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INI95CZU"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b153047b29so112344185a.3;
        Thu, 31 Oct 2024 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441045; x=1731045845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6tG39HqwvxlfRrBPWElR6isULD+PRgdHmRoN4FVkag=;
        b=INI95CZUf5r9EY0sXB1VyZGJU5H5f1Y99TtWfFlb77e2sb/kBZBSSOlNv64+2h8P8z
         7OtSYVGec2tnygt6/C+705JrUR++97/Z95hBSm9kr9EWqpOi3RvMObIYEv2DvOa8r9pK
         3qa11/hgCjlutRGTjfZQmvTC6GYGy8VmZd+RFH+ZSwslyHCFgKCvwmOEZIncmPnwdjCP
         0xwL5sJ88InKtmMofqgMkuW0e2bpk4YYbJWd2ImONboRhwKvmyyLt0ZjrvnfG9Hyi+aO
         nRWNjQINXS5LNtLCXF8hXP6FUG+hgEjiJmjaCwM/N/Jz8eAf8B0DTjhFJqHYGhfmJ1xD
         Pq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441045; x=1731045845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6tG39HqwvxlfRrBPWElR6isULD+PRgdHmRoN4FVkag=;
        b=kOnsbFwpJePmlWkIIq0G99pDs+E2XFIyvCW+K4fxvPmYEeO4g4QcoO2SjshftXxhRj
         V2Y+EumXnNSNIZ0pcqI77oCkLJyb/h4kPBukb/fbPTlubg466k604V5P6KZSE6jQqM+7
         dE3/FFxAN3gv6s/8d02cWGBbY4U8y3iorYderryhXgQ8T8Mvvzwncl/BQoVjIndWAdF1
         5k1+4j3sRoU+2BthiwEo6m46ufgw/8FOgEbh8Sudq/foF0GczR1PJjcrMXi2w++2RXwf
         pngcadLm4EHV4NEmLKDmKEU0mt5jITQS5nu4CIq6B+OSAgI32r/oYhV0y/yM+omsg9bx
         0guw==
X-Forwarded-Encrypted: i=1; AJvYcCVuvGwzeJo7ZW2Yv2nqBJZio2hBWev8Iym0X66GJsMhrt1YcEbqJEZ4QQQbxbcGWk2DZP1lnA==@lists.linux.dev, AJvYcCWBuwNIJiCHaA27G+e3dfgzPrL+hIkK9knDe2DW4hSllmZjf9lZgV63Vw7ezP0nSM9QwqF7@lists.linux.dev
X-Gm-Message-State: AOJu0YzAr9b89sRqaPpH3mS5XPrb6q+KLwIr6VxQsa70XQNETavVto/y
	zjJpu4LM9BXoge6FZYwtWwUq2SG17nHDZyroqcsF2FxeRB90KbQp
X-Google-Smtp-Source: AGHT+IFtPDQpnEfGDYf1MmQMy0Ftb/LAJarvVqvfSwx3qBw/GVNSOA1uCeVT60t5HopFhvrmJymKdw==
X-Received: by 2002:a05:6214:5348:b0:6d3:4992:f585 with SMTP id 6a1803df08f44-6d34992f616mr104514016d6.49.1730441044801;
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a7045bsm140747785a.73.2024.10.31.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:04 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2B0D1200043;
	Fri,  1 Nov 2024 02:04:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 01 Nov 2024 02:04:03 -0400
X-ME-Sender: <xms:U28kZ4ja5LWAoU3yfdto9YffBnntil7uUTgczdBRrUYZKEv2btRd8g>
    <xme:U28kZxBYHbxlZdQi9ryR9nVcf3Dt1GVAl3wOeehcX1LNRUuyoQ09TQMXk_ZjoSHfg
    mEmu5J42uBN4wHzQg>
X-ME-Received: <xmr:U28kZwE3vXuFtU6mK7fc1-Lvj8OilcmMDSlV9ABGW3CfHcTMX1TEKiPgpt-UzQ>
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
X-ME-Proxy: <xmx:U28kZ5S9yoZIs7IW9AC7EnrOMNOqs8HEN3ixerhOZkN5FxVuQwmcLA>
    <xmx:U28kZ1x0WeOFpLKtfjJf3QxURbgBdAQD-QZzqlYqUc4c9UxD8aDGIA>
    <xmx:U28kZ37PV7nEHBhCjP5is95pa1QT1aCTegkWgEoSyzwvIT4fJKVsqg>
    <xmx:U28kZywelM1bn0bGZrshBPINCbhspnqfODCvXGwpbjTGAK-ZyI1TYA>
    <xmx:U28kZ5gtbZyUKsexuxYAueAlEkJOtr4eKxBDt8MK-SSvoYd1I4pADr7w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:03 -0400 (EDT)
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
Subject: [RFC v2 08/13] rust: sync: atomic: Add Atomic<{usize,isize}>
Date: Thu, 31 Oct 2024 23:02:31 -0700
Message-ID: <20241101060237.1185533-9-boqun.feng@gmail.com>
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
index b2e81e22c105..4166ad48604f 100644
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
2.45.2

