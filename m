Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26C1F09B3;
	Mon, 21 Apr 2025 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253773; cv=none; b=oANtJMjkVRK1co1EkM/8yeCxs8QboYGF8KGhL7KzuOynGNgaH6XfiT285rH+F8Ljcr4BIpgMbWMS+fBCbgXMG3Vie/r8xyMe+g4J4MKmhG5Ms0fjMNLjuBiFPYiah6zTjzp/ljuA9Vf56bN1Pheo1ghdPMZFcQ6zWt4NMOqOAqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253773; c=relaxed/simple;
	bh=dJnEYU/O8FUpD9s6i4Ut4f40W3FVdVgcvnoQ+BKOIFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1XFTn2oJIjkgfYSbGddCzeIEIE2hiCuMLugSVcJynqLSfGEQ/GFJ0+Bum7g4YAY4cKqpRn9g82nnVOnZwoin+9VGqjixK+fgIzAw2dk/Vm1drK6HOv2JBjOirL0zHnql/FlhISP9d+5F+k1Csx83VdcvlRiyPw5JdCdgoDO9q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJjeCGPz; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJjeCGPz"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ae781d21so44111041cf.3;
        Mon, 21 Apr 2025 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253770; x=1745858570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2VlZJudXEGF9wwtFZHglR/nFrBqPJ1rxXkCL1SoJv3Q=;
        b=fJjeCGPzOfJHA+NQtWRAwDzrc7i8E9+o+5p6cljMLIWAUQitVq5D1OTL+DJIjgBJUY
         h35UTGYtcXJ54jNN6Uwto4YpB96dmuXiPz/KMIdi4rQ3/+/d48y41aX966fRuj/h2zw7
         Oeg5jYtlJrpPYtAcaW8W3q3QPtFz6osjQ8kf7XnmPvOsDTkVujvUIq90lYNuOuEli3BI
         C+610zsMpPBjLKMxleSs5ivDxGJw5UgQGUmvXZ0IRu1sU+zM5CoK+/vPZrtSYwM0JZG2
         wn/zElxbDewOmDkBS5R03vrj+MW7MgsAmMO597dkBFKdIQHYXOujy/foanLI/4MuXJHA
         50Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253770; x=1745858570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VlZJudXEGF9wwtFZHglR/nFrBqPJ1rxXkCL1SoJv3Q=;
        b=sxEFZuznE+eYzBOD4RzkuAXDcGfNtBeDPv4J2MsblSzN13n0n+EQkUnCQJ1WAO4n+Q
         JXm7jYCF0eUNgRoSSE8a5ls/fETeu9r2zYgxdQ5xw/pQYxrJn7EGD1TF+YU4aGb7IsOK
         yh+a1a2Xze7Yw4zxmReLxOXBwcaNh0ThIE+BdpTunk/2b6oy1zRTHSOCcf8fqH3gcQsU
         NdqhDB96AsEVVaF06NArDex7SJMWnJpvSDFnpWq/lR2odoxB1FAY4Ph4dv5ZUENI6Xxb
         rDrD7gIggVUruqQUJdnusReBXvvuxDYrf8E6fyOalAhRXu0evRGfEUAeIaDJchdrop9h
         LQrg==
X-Forwarded-Encrypted: i=1; AJvYcCWRAak3uVlPyu4RWUfhT17W1YpeFGxN2w9Q4lwtZVj7qI2AToHSzeb0+/hucTA+s8oKGK0G@lists.linux.dev, AJvYcCXHacCucY2nANUWtkcwZDJyj/f8uqI+f+kJ7Njj2o7r5TGnIbnoYustyhueaZl8yvMbsYw3eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLzGwxy19UDVzRYBHQ5taRxvS/MORBAJ+axpUlFm/MtxuH5gqS
	h06BdAqZmuAe7Cvt86w4DeRlqN2MQMZnwm5jQDHQNdQDhWho3Row
X-Gm-Gg: ASbGncs5Am2kb3vlQ8kYXRP/CyksvfBEAQURCsKA1cDX8piQjuFgpUIs37XyMIZcaeF
	Cd5nSLmlUWT674D7Vr8Xh6PE2et7+oHPltiyXpl8SHgkXedIGJcsLqW/CQRpWkaZGzIJbj3uaf0
	pfYTDFDlXwK6vnxG7hhGwu0jBmoX2jxRBy1Rs89D0k8pAu1yPJexmdHNeJk/VDTJSeiwVraUMdv
	2cb7YaAfo+YVtSw4/CnI4jGi1uyGxaSje7uHDX56j2YwWS4PYSQ5d8wl6vPo9FDTLkViDwruZHF
	urS8SZNdOtWMAOumZMvz/22IbV23pj/KoesEFgbYGj6C3joH/4c7pR90E17saB01bw2yDuvGJxG
	SC6iAIhAvW9DjwaMALnXFGGyzMv84hdw=
X-Google-Smtp-Source: AGHT+IEN/+2ucAXXUnW1f6rXrX/g7EkvZqGoWwgIAIA5mzDQJuNmlBEYdiMbCJulRTpViKP4snNoaQ==
X-Received: by 2002:ac8:5711:0:b0:476:b82b:ac91 with SMTP id d75a77b69052e-47aec4dc98emr253937731cf.49.1745253770012;
        Mon, 21 Apr 2025 09:42:50 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16df4sm43990201cf.1.2025.04.21.09.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:49 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id AEE4D1200043;
	Mon, 21 Apr 2025 12:42:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:48 -0400
X-ME-Sender: <xms:iHUGaBQnaONjosg5BDTHdCb0t-ZWZ9nb0UA8PHXnLKz9UTD_z5LjuA>
    <xme:iHUGaKy32gwgj8hME1pMpz2wTPtsxmEQbC_nRAiSKsaxQaZW_VvrwBT7CVSyCT2wK
    QsvFTiGK-l439PSwQ>
X-ME-Received: <xmr:iHUGaG0UFWxSEmP1-S2dqwFZd5zojqz3UvQpA0IzaaxuRAXkvV-7ClsYpNq7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedvnecurfgrrh
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
X-ME-Proxy: <xmx:iHUGaJAMs5SEPj35XBlo70J-L1Of3KmNt9i3ZvHXyL9LoiqCbHxjBA>
    <xmx:iHUGaKh9id5rZfAP_HKxKnUE5WxA_3DauTyTBRjWKO9ry0NeMaLIEA>
    <xmx:iHUGaNoMNk_KnkBIvxrSmFuI13NXyukOVKesqLapWL_CD-TCJvoTTg>
    <xmx:iHUGaFjmJKGFPyCxn--MUnUHvEECVYYlKMiyG_SSEFMhsCmzom-8Ww>
    <xmx:iHUGaFTweXWFn1pbi8JDL6KVeJ5CQ1FQgfsm5Adm1_VW3TLWgk85kHNG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:47 -0400 (EDT)
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
Subject: [RFC v3 11/12] rust: sync: Add memory barriers
Date: Mon, 21 Apr 2025 09:42:20 -0700
Message-ID: <20250421164221.1121805-12-boqun.feng@gmail.com>
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

Memory barriers are building blocks for concurrent code, hence provide
a minimal set of them.

The compiler barrier, barrier(), is implemented in inline asm instead of
using core::sync::atomic::compiler_fence() because memory models are
different: kernel's atomics are implemented in inline asm therefore the
compiler barrier should be implemented in inline asm as well.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/helpers/barrier.c      | 18 ++++++++++
 rust/helpers/helpers.c      |  1 +
 rust/kernel/sync.rs         |  1 +
 rust/kernel/sync/barrier.rs | 67 +++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 rust/helpers/barrier.c
 create mode 100644 rust/kernel/sync/barrier.rs

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
new file mode 100644
index 000000000000..cdf28ce8e511
--- /dev/null
+++ b/rust/helpers/barrier.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <asm/barrier.h>
+
+void rust_helper_smp_mb(void)
+{
+	smp_mb();
+}
+
+void rust_helper_smp_wmb(void)
+{
+	smp_wmb();
+}
+
+void rust_helper_smp_rmb(void)
+{
+	smp_rmb();
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index b20ee7cef74d..1183150ebdc6 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -8,6 +8,7 @@
  */
 
 #include "atomic.c"
+#include "barrier.c"
 #include "blk.c"
 #include "bug.c"
 #include "build_assert.c"
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index b620027e0641..c7c0e552bafe 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -11,6 +11,7 @@
 
 mod arc;
 pub mod atomic;
+pub mod barrier;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
new file mode 100644
index 000000000000..277aa09747bf
--- /dev/null
+++ b/rust/kernel/sync/barrier.rs
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory barriers.
+//!
+//! These primitives have the same semantics as their C counterparts: and the precise definitions of
+//! semantics can be found at [`LKMM`].
+//!
+//! [`LKMM`]: srctree/tools/memory-mode/
+
+/// A compiler barrier.
+///
+/// An explicic compiler barrier function that prevents the compiler from moving the memory
+/// accesses either side of it to the other side.
+pub fn barrier() {
+    // By default, Rust inline asms are treated as being able to access any memory or flags, hence
+    // it suffices as a compiler barrier.
+    //
+    // SAFETY: An empty asm block should be safe.
+    unsafe {
+        core::arch::asm!("");
+    }
+}
+
+/// A full memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory accesses
+/// either side of it to the other side.
+pub fn smp_mb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe {
+            bindings::smp_mb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A write-write memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory write
+/// accesses either side of it to the other side.
+pub fn smp_wmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_wmb()` is safe to call.
+        unsafe {
+            bindings::smp_wmb();
+        }
+    } else {
+        barrier();
+    }
+}
+
+/// A read-read memory barrier.
+///
+/// A barrier function that prevents both the compiler and the CPU from moving the memory read
+/// accesses either side of it to the other side.
+pub fn smp_rmb() {
+    if cfg!(CONFIG_SMP) {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe {
+            bindings::smp_rmb();
+        }
+    } else {
+        barrier();
+    }
+}
-- 
2.47.1

