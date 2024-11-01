Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599D1E495;
	Fri,  1 Nov 2024 07:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730444593; cv=none; b=PFy51EEYHsIWR/TlanGwKV6svjbruYTcNppm2McvD7NH1aaY538ukBIBuVV++TUCwik7+p40WUN3VzvRSoVjounKdpfLmlySE/KlHBiGQZAMymXTBdK5rVb4Jcc9mbs2IotGDYhO7zuqvqcx89Sp7vVNw3nYdZxpJDD9VnvdHUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730444593; c=relaxed/simple;
	bh=auU4EjvmRwFargKLSwSbmmfDeOA5kt7T0T9oFZ8YRpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJQYwIHboDQ3VyW5mxbQvZS+e2QBsx1r2tybonK3mLAMio3jjq5Kwqk/SMgCyuOfS5W6YqTIQQ6hguaaavNm/Eoi4jbSVS8Xtc7dY1PO7WDyy2mn4elSwCWjBQUzFZjiXHha3OQK6pXohCi+rG845eYbekBtn71CxMtSxgAkKxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=craUdtnU; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="craUdtnU"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b15eadee87so117083885a.2;
        Fri, 01 Nov 2024 00:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730444590; x=1731049390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ez4P5E9q8FP8C4exX7QDGHDy4d36xIscVD7DfibVtng=;
        b=craUdtnUDqUKxgzhoFiK7Bc9NskvGAQrlqwehqsNqbwizZApM0r88K7xh2OIte9IYl
         yU2Z8jhABU0GWt9xnh4F7zomCglsvT2NKg7xwHCw9++9qX63+hTG2lTXHi6VSZdtKUFc
         PDg3pe9U13FapgWs8cjf3I/91MQfWeqcB3zKE/yuYL6zE8r6yvj0GwhIeFBJAjLnv21n
         cSlav+c6uGF4WtFa8IKAWhmcZmzW5alQnldW4MyzrgUmDnNPcQUtLSvULAH4OKUWc1Xu
         qWnetBxf/XKTFC9hvzpuTsC9nDbX7kOFLi2FQvxN4hja2NqqJcwTcwoR0TJxp+HfBONP
         6LfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444590; x=1731049390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ez4P5E9q8FP8C4exX7QDGHDy4d36xIscVD7DfibVtng=;
        b=CN3EXtnRyIGFYSL+gSi0tCG7SqeVwo7etEuV3+6p+l8O8lx62IYb3kXmw5OmXUeeYQ
         T1qQb+q/Oy/mSKyUPhRfcK8cgnWDMA8b/EdPUCxSyDsvvCgEzCvPuz+2d6fxPO+8jJae
         1FU8GqkhZwJytFKrNj9hZviMLNW1AcWm8777tRrUH+OsWPP3RI6AX1yzjjGHCDdIQ2KT
         CPNm1SaAFOLnoyK0sQUPKoBcLyUm18t4hr1m1CUAMx+9I90laL7XwaSyYeT1l9tv24U2
         WkcW5wNwMY1nO3A+4i93M9kfYjvxztXL9JdC2XTG3k0QagEWPhaUqtBW+V3GJqspOZ3I
         VaeA==
X-Forwarded-Encrypted: i=1; AJvYcCV+Rz4B8cLsTCh/hYZ3613oYq4DkYHcviM/WNmG1I6+QiGYI4RkxW6qw2zDRwS7b2xY5OCHeA==@lists.linux.dev, AJvYcCWjfsGi3O/ZTtLIhexK9zqd7K9CvxyWsQiLS9DmxuqgIFTXzcwQl7TZ4Fq8iCVC9j8cJwLk@lists.linux.dev
X-Gm-Message-State: AOJu0YyHAsnxizM56tIic9cQGv/5va5EDQ2ZS4+yNMqBp+LDKzRpz2J8
	f1YuYhiMvoUycHpMCfUVKioxEQER3tgj0X04hH0fSUSYMjei5pfv
X-Google-Smtp-Source: AGHT+IH0rscrjrMg+t7lD0iLeFxEjGlQdsQeS1+nXLqYqotMYyu+aK5hhUosI8B/jyWiWTR32tEzbQ==
X-Received: by 2002:a05:620a:19a9:b0:7b1:3754:7d83 with SMTP id af79cd13be357-7b2f24c532amr771460385a.9.1730444588979;
        Fri, 01 Nov 2024 00:03:08 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a6fdd9sm144415385a.86.2024.11.01.00.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:03:08 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 982A11200043;
	Fri,  1 Nov 2024 03:03:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 01 Nov 2024 03:03:07 -0400
X-ME-Sender: <xms:K30kZ8kl9dguh9P5md2cPJLSLRyZHZ28vGAdvnbOHwqyXzyDlq76nw>
    <xme:K30kZ73IlQtRIfUghCYp7Hqe0Z-yqSs5YkyIhEOYjjbayElmEdVJ78bQS_oD0L5GR
    n9YgkxXc7NuZUfjig>
X-ME-Received: <xmr:K30kZ6qevGzVMIehn3SuFU9G-5BAFNHZYkl7pdObQ0k8sA0Xrszt6c8RTd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgeeljeeitdehvdehgefgjeevfeejjeekgfev
    ffeiueejhfeuiefggeeuheeggefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeehiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhgthhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehllhhvmheslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopehlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:K30kZ4m2d7id-MHy0VCqfFEk73hWD-rzbmzVaOphLOYwvL0OUgy4Jw>
    <xmx:K30kZ62Sh2l7NMYMzrR5nF_FIjg8WspDd6pn4BFPAxmpRuEEWMTX5g>
    <xmx:K30kZ_t943pAvxL8JHqflDINexBQG6UobtoGy5HYThSmt-2zU5QCsA>
    <xmx:K30kZ2W3DfYr-jAWfVPwpX_isI1H9PH0s9JfvzStSS7Otd3Naa2_Rw>
    <xmx:K30kZ92gaMbO2j1L-x5tRAd-9S7mxKeJMajb157zybAXM67gmyc0m_Gt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 03:03:07 -0400 (EDT)
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
	linux-fsdevel@vger.kernel.org,	Trevor Gross <tmgross@umich.edu>,
	dakr@redhat.com,	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: [RFC v2.1 11/13] rust: sync: Add memory barriers
Date: Fri,  1 Nov 2024 00:01:53 -0700
Message-ID: <20241101070153.1197484-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101060237.1185533-12-boqun.feng@gmail.com>
References: <20241101060237.1185533-12-boqun.feng@gmail.com>
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
v2 -> v2.1: Add the missing barrier.c

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
index ab5a3f1be241..f4a94833b29d 100644
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
index 66ac3752ca71..0d0b19441ae8 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -9,6 +9,7 @@
 
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
2.45.2

