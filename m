Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B566112C544
	for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 22:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718231470; cv=none; b=fuR18dJHGaftXlgS3NqAjN6SNm9Y/a0JSz2oEgiM9rpWLCwIlUQRtqOYFv1GpFpkZrKMejQDYkgSsdK72w5AmWT87aZKG+C04hvGJRrcfccU9iCe5eEg7CrKtFwUubVgzqi0fm++OR0603B5R3JyiKedFVdKdRiHfMSUptj9w7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718231470; c=relaxed/simple;
	bh=Wumx470C07E//hgZqBYEKsWhoFVZZeDw8t+xzPBpIaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKPkLmShE0GUVTpmRsZQCwKo6mjdGaMSEFmVHwdBWgd63uwYZ6I/k4ML8GVz74h4qdTyeH+ahspXFq9uMlMZqPttZET9Ot/JlyXwR+LmPU+jrRm3Wnv90lF2Hm5MqxAIrsivptkgkBykE0hqdQZVP46ZsqgpQjEh7xz2d3BwrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7sKd9Zf; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7sKd9Zf"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4403bb543a4so1931511cf.1
        for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 15:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718231465; x=1718836265; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5VsRacuHxaHfGOlDX8s3JAA9bqkpEvuZhwJFt7GbMfM=;
        b=B7sKd9ZfOTXAq+lTvtoKmjnyRkaDuHm42fnPus69YBusvYQoSeW2a9pRzYNlyxRv7a
         YSKb84iCTY3TnKsGXJkcc/TPHAmMdhOTU7YwXyRZySXweDK5eKNeM8PkDvOYdVXb8/yi
         dno56yNvgOTcsTFVSSPFHGdL8eep6LFHGdAuKxHYIJ11HBYC6jXBysgF7gwh86bEx0bc
         59A6dBo8ApfPPTb26Xl+jlvh5GA/3UoUpaYDLtDYTgWAV1/4TeF7HF9O6uyIvPkRPDXg
         h3gDBF3q6GfWOWG0nMoM3rVxN8a8+ym0Rx8WbEnWQCpKCMLOrIfKCIXnns5v0hOKBK+T
         MFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718231465; x=1718836265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5VsRacuHxaHfGOlDX8s3JAA9bqkpEvuZhwJFt7GbMfM=;
        b=APqhEvhxCj+Fn/QGL7i8BZtSbMeYMrS8XN84tHRKHLXRyAf/uwHo5bpWV1OV4cD6Er
         D7eAjnyhK8uUT2pzE5frS7cL/jGqWtT1bLfZm92dgtZETWO6CFsL+XgjBsTlM+Y3kuPs
         7C2NgrStIrBVJia7z3OOKChadMLn/aMbs/c2pTXAO7GKC3thazVXO2/0wNGjofj7bUiy
         zIIbKbcm5c+t5DiVJXyk1US0i0sHA0pWL0X0hYJceS+erXkMu+nB82xCKDA45skpOZZs
         IDECNIUMV0Aq2iMthiMzTjuC3eOGa3/DYjFWv0vCcqSrOvHt5jo0rYrfHDrFjGus2x6S
         QBow==
X-Forwarded-Encrypted: i=1; AJvYcCUFbY4vAeVAL817mFSJIhwd+4sh6JXAht3Q4c+kqqSjpfUcswoDklriyu28Ezh+jRQHD7UhRTrsrjgjf3SWAPH3RWAltw==
X-Gm-Message-State: AOJu0Ywr+fyfGrbnxYIP6u37IM31Wd6oLh47EKhbwqG8OwDVvAMcRm5L
	ZzJGj6CE5IJm4XFGf5XIw+C32ZDQ3Ia0AbG1pQBKY/EdkJXFFsvb
X-Google-Smtp-Source: AGHT+IFT8YVmASRU2CX/n9WMK6M2rZfDptOR2YFRYV63OiHIfiZENCJyolY0kKCCBF64rNtPzo98vw==
X-Received: by 2002:a05:622a:1809:b0:441:595d:c9e6 with SMTP id d75a77b69052e-4415ac62e4fmr33152541cf.52.1718231464924;
        Wed, 12 Jun 2024 15:31:04 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef4f1e26sm536421cf.23.2024.06.12.15.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 15:31:04 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 936841200068;
	Wed, 12 Jun 2024 18:31:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 12 Jun 2024 18:31:03 -0400
X-ME-Sender: <xms:pyFqZurw6JaW1NA-LXOnP3qtZ4kVQAizDcAmB8mtapH6DsTUHEvBEw>
    <xme:pyFqZsrrTtXBGQhr-QQWUo7zAYtU9nj4k8FINcw--SEdTgqX5EcBHndDWxpPaihjP
    ViS8pWVo3xeWArlww>
X-ME-Received: <xmr:pyFqZjM5CjwLJE_rQTqkAxmUfJfzhDHdn1FfDJU2NMW8yCEBFIjKh5HPXlIZdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduhedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueeh
    geeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:pyFqZt6YpflriCvB_lvbOC3t18LxXThA4EC2m3QK9b1McywFGuuVhQ>
    <xmx:pyFqZt5Oxb9x0jLCm-Q2GSdXsyP_o205eq52HtXsiy1QVTeXEZg5Mw>
    <xmx:pyFqZtikbKWhGJtGdi1I7kbtY5pEtpIW5ZOgpcVW5EZqcXKmHQoGkQ>
    <xmx:pyFqZn7RGcUsgSXHr_Csg1Vix6wJYbEs9-eNlGLNJg9pd4m-PooS_A>
    <xmx:pyFqZoIzDoumoAGJl_MhOjemRmWu5b_GF0Wg_Alr4e6heSQtOgycr5UI>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Jun 2024 18:31:02 -0400 (EDT)
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
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
	Trevor Gross <tmgross@umich.edu>,	dakr@redhat.com
Subject: [RFC 2/2] rust: sync: Add atomic support
Date: Wed, 12 Jun 2024 15:30:25 -0700
Message-ID: <20240612223025.1158537-3-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612223025.1158537-1-boqun.feng@gmail.com>
References: <20240612223025.1158537-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide two atomic types: AtomicI32 and AtomicI64 with the existing
implemenation of C atomics. These atomics have the same semantics of the
corresponding LKMM C atomics, and using one memory (ordering) model
certainly reduces the reasoning difficulty and potential bugs from the
interaction of two different memory models.

Also bump my role to the maintainer of ATOMIC INFRASTRUCTURE to reflect
my responsiblity on these Rust APIs.

Note that `Atomic*::new()`s are implemented vi open coding on struct
atomic*_t. This allows `new()` being a `const` function, so that it can
be used in constant contexts.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 MAINTAINERS                       |    4 +-
 arch/arm64/kernel/cpufeature.c    |    2 +
 rust/kernel/sync.rs               |    1 +
 rust/kernel/sync/atomic.rs        |   63 ++
 rust/kernel/sync/atomic/impl.rs   | 1375 +++++++++++++++++++++++++++++
 scripts/atomic/gen-atomics.sh     |    1 +
 scripts/atomic/gen-rust-atomic.sh |  136 +++
 7 files changed, 1581 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/sync/atomic.rs
 create mode 100644 rust/kernel/sync/atomic/impl.rs
 create mode 100755 scripts/atomic/gen-rust-atomic.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..a8528d27b260 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3458,7 +3458,7 @@ F:	drivers/input/touchscreen/atmel_mxt_ts.c
 ATOMIC INFRASTRUCTURE
 M:	Will Deacon <will@kernel.org>
 M:	Peter Zijlstra <peterz@infradead.org>
-R:	Boqun Feng <boqun.feng@gmail.com>
+M:	Boqun Feng <boqun.feng@gmail.com>
 R:	Mark Rutland <mark.rutland@arm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
@@ -3467,6 +3467,8 @@ F:	arch/*/include/asm/atomic*.h
 F:	include/*/atomic*.h
 F:	include/linux/refcount.h
 F:	scripts/atomic/
+F:	rust/kernel/sync/atomic.rs
+F:	rust/kernel/sync/atomic/
 
 ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER
 M:	Bradley Grove <linuxdrivers@attotech.com>
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 48e7029f1054..99e6e2b2867f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1601,6 +1601,8 @@ static bool
 has_cpuid_feature(const struct arm64_cpu_capabilities *entry, int scope)
 {
 	u64 val = read_scoped_sysreg(entry, scope);
+	if (entry->capability == ARM64_HAS_LSE_ATOMICS)
+		return false;
 	return feature_matches(val, entry);
 }
 
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 0ab20975a3b5..66ac3752ca71 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -8,6 +8,7 @@
 use crate::types::Opaque;
 
 mod arc;
+pub mod atomic;
 mod condvar;
 pub mod lock;
 mod locked_by;
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
new file mode 100644
index 000000000000..b0f852cf1741
--- /dev/null
+++ b/rust/kernel/sync/atomic.rs
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Atomic primitives.
+//!
+//! These primitives have the same semantics as their C counterparts, for precise definitions of
+//! the semantics, please refer to tools/memory-model. Note that Linux Kernel Memory (Consistency)
+//! Model is the only model for Rust development in kernel right now, please avoid to use Rust's
+//! own atomics.
+
+use crate::bindings::{atomic64_t, atomic_t};
+use crate::types::Opaque;
+
+mod r#impl;
+
+/// Atomic 32bit signed integers.
+pub struct AtomicI32(Opaque<atomic_t>);
+
+/// Atomic 64bit signed integers.
+pub struct AtomicI64(Opaque<atomic64_t>);
+
+impl AtomicI32 {
+    /// Creates an atomic variable with initial value `v`.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// # use kernel::sync::atomic::*;
+    ///
+    /// let x = AtomicI32::new(0);
+    ///
+    /// assert_eq!(x.read(), 0);
+    /// assert_eq!(x.fetch_add_relaxed(12), 0);
+    /// assert_eq!(x.read(), 12);
+    /// ```
+    pub const fn new(v: i32) -> Self {
+        AtomicI32(Opaque::new(atomic_t { counter: v }))
+    }
+}
+
+// SAFETY: `AtomicI32` is safe to share among execution contexts because all accesses are atomic.
+unsafe impl Sync for AtomicI32 {}
+
+impl AtomicI64 {
+    /// Creates an atomic variable with initial value `v`.
+    ///
+    /// # Examples
+    ///
+    /// ```rust
+    /// # use kernel::sync::atomic::*;
+    ///
+    /// let x = AtomicI64::new(0);
+    ///
+    /// assert_eq!(x.read(), 0);
+    /// assert_eq!(x.fetch_add_relaxed(12), 0);
+    /// assert_eq!(x.read(), 12);
+    /// ```
+    pub const fn new(v: i64) -> Self {
+        AtomicI64(Opaque::new(atomic64_t { counter: v }))
+    }
+}
+
+// SAFETY: `AtomicI64` is safe to share among execution contexts because all accesses are atomic.
+unsafe impl Sync for AtomicI64 {}
diff --git a/rust/kernel/sync/atomic/impl.rs b/rust/kernel/sync/atomic/impl.rs
new file mode 100644
index 000000000000..1bbb0a714834
--- /dev/null
+++ b/rust/kernel/sync/atomic/impl.rs
@@ -0,0 +1,1375 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generated by scripts/atomic/gen-rust-atomic.sh
+//! DO NOT MODIFY THIS FILE DIRECTLY
+
+use super::*;
+use crate::bindings::*;
+
+impl AtomicI32 {
+    /// See `atomic_read`.
+    #[inline(always)]
+    pub fn read(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_read(self.0.get());
+        }
+    }
+    /// See `atomic_read_acquire`.
+    #[inline(always)]
+    pub fn read_acquire(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_read_acquire(self.0.get());
+        }
+    }
+    /// See `atomic_set`.
+    #[inline(always)]
+    pub fn set(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_set(self.0.get(), i);
+        }
+    }
+    /// See `atomic_set_release`.
+    #[inline(always)]
+    pub fn set_release(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_set_release(self.0.get(), i);
+        }
+    }
+    /// See `atomic_add`.
+    #[inline(always)]
+    pub fn add(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_add(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_return`.
+    #[inline(always)]
+    pub fn add_return(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_return(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_return_acquire`.
+    #[inline(always)]
+    pub fn add_return_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_return_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_return_release`.
+    #[inline(always)]
+    pub fn add_return_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_return_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_return_relaxed`.
+    #[inline(always)]
+    pub fn add_return_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_return_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_add`.
+    #[inline(always)]
+    pub fn fetch_add(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_add(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_add_acquire`.
+    #[inline(always)]
+    pub fn fetch_add_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_add_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_add_release`.
+    #[inline(always)]
+    pub fn fetch_add_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_add_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_add_relaxed`.
+    #[inline(always)]
+    pub fn fetch_add_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_add_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_sub`.
+    #[inline(always)]
+    pub fn sub(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_sub(i, self.0.get());
+        }
+    }
+    /// See `atomic_sub_return`.
+    #[inline(always)]
+    pub fn sub_return(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_sub_return(i, self.0.get());
+        }
+    }
+    /// See `atomic_sub_return_acquire`.
+    #[inline(always)]
+    pub fn sub_return_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_sub_return_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_sub_return_release`.
+    #[inline(always)]
+    pub fn sub_return_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_sub_return_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_sub_return_relaxed`.
+    #[inline(always)]
+    pub fn sub_return_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_sub_return_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_sub`.
+    #[inline(always)]
+    pub fn fetch_sub(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_sub(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_sub_acquire`.
+    #[inline(always)]
+    pub fn fetch_sub_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_sub_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_sub_release`.
+    #[inline(always)]
+    pub fn fetch_sub_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_sub_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_sub_relaxed`.
+    #[inline(always)]
+    pub fn fetch_sub_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_sub_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_inc`.
+    #[inline(always)]
+    pub fn inc(&self) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_inc(self.0.get());
+        }
+    }
+    /// See `atomic_inc_return`.
+    #[inline(always)]
+    pub fn inc_return(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_return(self.0.get());
+        }
+    }
+    /// See `atomic_inc_return_acquire`.
+    #[inline(always)]
+    pub fn inc_return_acquire(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_return_acquire(self.0.get());
+        }
+    }
+    /// See `atomic_inc_return_release`.
+    #[inline(always)]
+    pub fn inc_return_release(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_return_release(self.0.get());
+        }
+    }
+    /// See `atomic_inc_return_relaxed`.
+    #[inline(always)]
+    pub fn inc_return_relaxed(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_return_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_inc`.
+    #[inline(always)]
+    pub fn fetch_inc(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_inc(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_inc_acquire`.
+    #[inline(always)]
+    pub fn fetch_inc_acquire(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_inc_acquire(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_inc_release`.
+    #[inline(always)]
+    pub fn fetch_inc_release(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_inc_release(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_inc_relaxed`.
+    #[inline(always)]
+    pub fn fetch_inc_relaxed(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_inc_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic_dec`.
+    #[inline(always)]
+    pub fn dec(&self) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_dec(self.0.get());
+        }
+    }
+    /// See `atomic_dec_return`.
+    #[inline(always)]
+    pub fn dec_return(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_return(self.0.get());
+        }
+    }
+    /// See `atomic_dec_return_acquire`.
+    #[inline(always)]
+    pub fn dec_return_acquire(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_return_acquire(self.0.get());
+        }
+    }
+    /// See `atomic_dec_return_release`.
+    #[inline(always)]
+    pub fn dec_return_release(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_return_release(self.0.get());
+        }
+    }
+    /// See `atomic_dec_return_relaxed`.
+    #[inline(always)]
+    pub fn dec_return_relaxed(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_return_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_dec`.
+    #[inline(always)]
+    pub fn fetch_dec(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_dec(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_dec_acquire`.
+    #[inline(always)]
+    pub fn fetch_dec_acquire(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_dec_acquire(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_dec_release`.
+    #[inline(always)]
+    pub fn fetch_dec_release(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_dec_release(self.0.get());
+        }
+    }
+    /// See `atomic_fetch_dec_relaxed`.
+    #[inline(always)]
+    pub fn fetch_dec_relaxed(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_dec_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic_and`.
+    #[inline(always)]
+    pub fn and(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_and(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_and`.
+    #[inline(always)]
+    pub fn fetch_and(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_and(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_and_acquire`.
+    #[inline(always)]
+    pub fn fetch_and_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_and_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_and_release`.
+    #[inline(always)]
+    pub fn fetch_and_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_and_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_and_relaxed`.
+    #[inline(always)]
+    pub fn fetch_and_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_and_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_andnot`.
+    #[inline(always)]
+    pub fn andnot(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_andnot(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_andnot`.
+    #[inline(always)]
+    pub fn fetch_andnot(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_andnot(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_andnot_acquire`.
+    #[inline(always)]
+    pub fn fetch_andnot_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_andnot_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_andnot_release`.
+    #[inline(always)]
+    pub fn fetch_andnot_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_andnot_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_andnot_relaxed`.
+    #[inline(always)]
+    pub fn fetch_andnot_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_andnot_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_or`.
+    #[inline(always)]
+    pub fn or(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_or(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_or`.
+    #[inline(always)]
+    pub fn fetch_or(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_or(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_or_acquire`.
+    #[inline(always)]
+    pub fn fetch_or_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_or_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_or_release`.
+    #[inline(always)]
+    pub fn fetch_or_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_or_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_or_relaxed`.
+    #[inline(always)]
+    pub fn fetch_or_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_or_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_xor`.
+    #[inline(always)]
+    pub fn xor(&self, i: i32) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic_xor(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_xor`.
+    #[inline(always)]
+    pub fn fetch_xor(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_xor(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_xor_acquire`.
+    #[inline(always)]
+    pub fn fetch_xor_acquire(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_xor_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_xor_release`.
+    #[inline(always)]
+    pub fn fetch_xor_release(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_xor_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_xor_relaxed`.
+    #[inline(always)]
+    pub fn fetch_xor_relaxed(&self, i: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_xor_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_xchg`.
+    #[inline(always)]
+    pub fn xchg(&self, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_xchg(self.0.get(), new);
+        }
+    }
+    /// See `atomic_xchg_acquire`.
+    #[inline(always)]
+    pub fn xchg_acquire(&self, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_xchg_acquire(self.0.get(), new);
+        }
+    }
+    /// See `atomic_xchg_release`.
+    #[inline(always)]
+    pub fn xchg_release(&self, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_xchg_release(self.0.get(), new);
+        }
+    }
+    /// See `atomic_xchg_relaxed`.
+    #[inline(always)]
+    pub fn xchg_relaxed(&self, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_xchg_relaxed(self.0.get(), new);
+        }
+    }
+    /// See `atomic_cmpxchg`.
+    #[inline(always)]
+    pub fn cmpxchg(&self, old: i32, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_cmpxchg(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_cmpxchg_acquire`.
+    #[inline(always)]
+    pub fn cmpxchg_acquire(&self, old: i32, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_cmpxchg_acquire(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_cmpxchg_release`.
+    #[inline(always)]
+    pub fn cmpxchg_release(&self, old: i32, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_cmpxchg_release(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_cmpxchg_relaxed`.
+    #[inline(always)]
+    pub fn cmpxchg_relaxed(&self, old: i32, new: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_cmpxchg_relaxed(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_try_cmpxchg`.
+    #[inline(always)]
+    pub fn try_cmpxchg(&self, old: &mut i32, new: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_try_cmpxchg(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_try_cmpxchg_acquire`.
+    #[inline(always)]
+    pub fn try_cmpxchg_acquire(&self, old: &mut i32, new: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_try_cmpxchg_acquire(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_try_cmpxchg_release`.
+    #[inline(always)]
+    pub fn try_cmpxchg_release(&self, old: &mut i32, new: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_try_cmpxchg_release(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_try_cmpxchg_relaxed`.
+    #[inline(always)]
+    pub fn try_cmpxchg_relaxed(&self, old: &mut i32, new: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_try_cmpxchg_relaxed(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic_sub_and_test`.
+    #[inline(always)]
+    pub fn sub_and_test(&self, i: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_sub_and_test(i, self.0.get());
+        }
+    }
+    /// See `atomic_dec_and_test`.
+    #[inline(always)]
+    pub fn dec_and_test(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_and_test(self.0.get());
+        }
+    }
+    /// See `atomic_inc_and_test`.
+    #[inline(always)]
+    pub fn inc_and_test(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_and_test(self.0.get());
+        }
+    }
+    /// See `atomic_add_negative`.
+    #[inline(always)]
+    pub fn add_negative(&self, i: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_negative(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_negative_acquire`.
+    #[inline(always)]
+    pub fn add_negative_acquire(&self, i: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_negative_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_negative_release`.
+    #[inline(always)]
+    pub fn add_negative_release(&self, i: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_negative_release(i, self.0.get());
+        }
+    }
+    /// See `atomic_add_negative_relaxed`.
+    #[inline(always)]
+    pub fn add_negative_relaxed(&self, i: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_negative_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic_fetch_add_unless`.
+    #[inline(always)]
+    pub fn fetch_add_unless(&self, a: i32, u: i32) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_fetch_add_unless(self.0.get(), a, u);
+        }
+    }
+    /// See `atomic_add_unless`.
+    #[inline(always)]
+    pub fn add_unless(&self, a: i32, u: i32) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_add_unless(self.0.get(), a, u);
+        }
+    }
+    /// See `atomic_inc_not_zero`.
+    #[inline(always)]
+    pub fn inc_not_zero(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_not_zero(self.0.get());
+        }
+    }
+    /// See `atomic_inc_unless_negative`.
+    #[inline(always)]
+    pub fn inc_unless_negative(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_inc_unless_negative(self.0.get());
+        }
+    }
+    /// See `atomic_dec_unless_positive`.
+    #[inline(always)]
+    pub fn dec_unless_positive(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_unless_positive(self.0.get());
+        }
+    }
+    /// See `atomic_dec_if_positive`.
+    #[inline(always)]
+    pub fn dec_if_positive(&self) -> i32 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic_dec_if_positive(self.0.get());
+        }
+    }
+}
+
+impl AtomicI64 {
+    /// See `atomic64_read`.
+    #[inline(always)]
+    pub fn read(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_read(self.0.get());
+        }
+    }
+    /// See `atomic64_read_acquire`.
+    #[inline(always)]
+    pub fn read_acquire(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_read_acquire(self.0.get());
+        }
+    }
+    /// See `atomic64_set`.
+    #[inline(always)]
+    pub fn set(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_set(self.0.get(), i);
+        }
+    }
+    /// See `atomic64_set_release`.
+    #[inline(always)]
+    pub fn set_release(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_set_release(self.0.get(), i);
+        }
+    }
+    /// See `atomic64_add`.
+    #[inline(always)]
+    pub fn add(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_add(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_return`.
+    #[inline(always)]
+    pub fn add_return(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_return(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_return_acquire`.
+    #[inline(always)]
+    pub fn add_return_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_return_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_return_release`.
+    #[inline(always)]
+    pub fn add_return_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_return_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_return_relaxed`.
+    #[inline(always)]
+    pub fn add_return_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_return_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_add`.
+    #[inline(always)]
+    pub fn fetch_add(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_add(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_add_acquire`.
+    #[inline(always)]
+    pub fn fetch_add_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_add_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_add_release`.
+    #[inline(always)]
+    pub fn fetch_add_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_add_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_add_relaxed`.
+    #[inline(always)]
+    pub fn fetch_add_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_add_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_sub`.
+    #[inline(always)]
+    pub fn sub(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_sub(i, self.0.get());
+        }
+    }
+    /// See `atomic64_sub_return`.
+    #[inline(always)]
+    pub fn sub_return(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_sub_return(i, self.0.get());
+        }
+    }
+    /// See `atomic64_sub_return_acquire`.
+    #[inline(always)]
+    pub fn sub_return_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_sub_return_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_sub_return_release`.
+    #[inline(always)]
+    pub fn sub_return_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_sub_return_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_sub_return_relaxed`.
+    #[inline(always)]
+    pub fn sub_return_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_sub_return_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_sub`.
+    #[inline(always)]
+    pub fn fetch_sub(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_sub(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_sub_acquire`.
+    #[inline(always)]
+    pub fn fetch_sub_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_sub_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_sub_release`.
+    #[inline(always)]
+    pub fn fetch_sub_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_sub_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_sub_relaxed`.
+    #[inline(always)]
+    pub fn fetch_sub_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_sub_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_inc`.
+    #[inline(always)]
+    pub fn inc(&self) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_inc(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_return`.
+    #[inline(always)]
+    pub fn inc_return(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_return(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_return_acquire`.
+    #[inline(always)]
+    pub fn inc_return_acquire(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_return_acquire(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_return_release`.
+    #[inline(always)]
+    pub fn inc_return_release(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_return_release(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_return_relaxed`.
+    #[inline(always)]
+    pub fn inc_return_relaxed(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_return_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_inc`.
+    #[inline(always)]
+    pub fn fetch_inc(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_inc(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_inc_acquire`.
+    #[inline(always)]
+    pub fn fetch_inc_acquire(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_inc_acquire(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_inc_release`.
+    #[inline(always)]
+    pub fn fetch_inc_release(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_inc_release(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_inc_relaxed`.
+    #[inline(always)]
+    pub fn fetch_inc_relaxed(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_inc_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic64_dec`.
+    #[inline(always)]
+    pub fn dec(&self) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_dec(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_return`.
+    #[inline(always)]
+    pub fn dec_return(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_return(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_return_acquire`.
+    #[inline(always)]
+    pub fn dec_return_acquire(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_return_acquire(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_return_release`.
+    #[inline(always)]
+    pub fn dec_return_release(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_return_release(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_return_relaxed`.
+    #[inline(always)]
+    pub fn dec_return_relaxed(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_return_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_dec`.
+    #[inline(always)]
+    pub fn fetch_dec(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_dec(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_dec_acquire`.
+    #[inline(always)]
+    pub fn fetch_dec_acquire(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_dec_acquire(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_dec_release`.
+    #[inline(always)]
+    pub fn fetch_dec_release(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_dec_release(self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_dec_relaxed`.
+    #[inline(always)]
+    pub fn fetch_dec_relaxed(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_dec_relaxed(self.0.get());
+        }
+    }
+    /// See `atomic64_and`.
+    #[inline(always)]
+    pub fn and(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_and(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_and`.
+    #[inline(always)]
+    pub fn fetch_and(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_and(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_and_acquire`.
+    #[inline(always)]
+    pub fn fetch_and_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_and_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_and_release`.
+    #[inline(always)]
+    pub fn fetch_and_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_and_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_and_relaxed`.
+    #[inline(always)]
+    pub fn fetch_and_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_and_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_andnot`.
+    #[inline(always)]
+    pub fn andnot(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_andnot(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_andnot`.
+    #[inline(always)]
+    pub fn fetch_andnot(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_andnot(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_andnot_acquire`.
+    #[inline(always)]
+    pub fn fetch_andnot_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_andnot_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_andnot_release`.
+    #[inline(always)]
+    pub fn fetch_andnot_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_andnot_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_andnot_relaxed`.
+    #[inline(always)]
+    pub fn fetch_andnot_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_andnot_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_or`.
+    #[inline(always)]
+    pub fn or(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_or(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_or`.
+    #[inline(always)]
+    pub fn fetch_or(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_or(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_or_acquire`.
+    #[inline(always)]
+    pub fn fetch_or_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_or_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_or_release`.
+    #[inline(always)]
+    pub fn fetch_or_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_or_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_or_relaxed`.
+    #[inline(always)]
+    pub fn fetch_or_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_or_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_xor`.
+    #[inline(always)]
+    pub fn xor(&self, i: i64) {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            atomic64_xor(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_xor`.
+    #[inline(always)]
+    pub fn fetch_xor(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_xor(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_xor_acquire`.
+    #[inline(always)]
+    pub fn fetch_xor_acquire(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_xor_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_xor_release`.
+    #[inline(always)]
+    pub fn fetch_xor_release(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_xor_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_xor_relaxed`.
+    #[inline(always)]
+    pub fn fetch_xor_relaxed(&self, i: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_xor_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_xchg`.
+    #[inline(always)]
+    pub fn xchg(&self, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_xchg(self.0.get(), new);
+        }
+    }
+    /// See `atomic64_xchg_acquire`.
+    #[inline(always)]
+    pub fn xchg_acquire(&self, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_xchg_acquire(self.0.get(), new);
+        }
+    }
+    /// See `atomic64_xchg_release`.
+    #[inline(always)]
+    pub fn xchg_release(&self, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_xchg_release(self.0.get(), new);
+        }
+    }
+    /// See `atomic64_xchg_relaxed`.
+    #[inline(always)]
+    pub fn xchg_relaxed(&self, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_xchg_relaxed(self.0.get(), new);
+        }
+    }
+    /// See `atomic64_cmpxchg`.
+    #[inline(always)]
+    pub fn cmpxchg(&self, old: i64, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_cmpxchg(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_cmpxchg_acquire`.
+    #[inline(always)]
+    pub fn cmpxchg_acquire(&self, old: i64, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_cmpxchg_acquire(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_cmpxchg_release`.
+    #[inline(always)]
+    pub fn cmpxchg_release(&self, old: i64, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_cmpxchg_release(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_cmpxchg_relaxed`.
+    #[inline(always)]
+    pub fn cmpxchg_relaxed(&self, old: i64, new: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_cmpxchg_relaxed(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_try_cmpxchg`.
+    #[inline(always)]
+    pub fn try_cmpxchg(&self, old: &mut i64, new: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_try_cmpxchg(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_try_cmpxchg_acquire`.
+    #[inline(always)]
+    pub fn try_cmpxchg_acquire(&self, old: &mut i64, new: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_try_cmpxchg_acquire(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_try_cmpxchg_release`.
+    #[inline(always)]
+    pub fn try_cmpxchg_release(&self, old: &mut i64, new: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_try_cmpxchg_release(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_try_cmpxchg_relaxed`.
+    #[inline(always)]
+    pub fn try_cmpxchg_relaxed(&self, old: &mut i64, new: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_try_cmpxchg_relaxed(self.0.get(), old, new);
+        }
+    }
+    /// See `atomic64_sub_and_test`.
+    #[inline(always)]
+    pub fn sub_and_test(&self, i: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_sub_and_test(i, self.0.get());
+        }
+    }
+    /// See `atomic64_dec_and_test`.
+    #[inline(always)]
+    pub fn dec_and_test(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_and_test(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_and_test`.
+    #[inline(always)]
+    pub fn inc_and_test(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_and_test(self.0.get());
+        }
+    }
+    /// See `atomic64_add_negative`.
+    #[inline(always)]
+    pub fn add_negative(&self, i: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_negative(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_negative_acquire`.
+    #[inline(always)]
+    pub fn add_negative_acquire(&self, i: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_negative_acquire(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_negative_release`.
+    #[inline(always)]
+    pub fn add_negative_release(&self, i: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_negative_release(i, self.0.get());
+        }
+    }
+    /// See `atomic64_add_negative_relaxed`.
+    #[inline(always)]
+    pub fn add_negative_relaxed(&self, i: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_negative_relaxed(i, self.0.get());
+        }
+    }
+    /// See `atomic64_fetch_add_unless`.
+    #[inline(always)]
+    pub fn fetch_add_unless(&self, a: i64, u: i64) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_fetch_add_unless(self.0.get(), a, u);
+        }
+    }
+    /// See `atomic64_add_unless`.
+    #[inline(always)]
+    pub fn add_unless(&self, a: i64, u: i64) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_add_unless(self.0.get(), a, u);
+        }
+    }
+    /// See `atomic64_inc_not_zero`.
+    #[inline(always)]
+    pub fn inc_not_zero(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_not_zero(self.0.get());
+        }
+    }
+    /// See `atomic64_inc_unless_negative`.
+    #[inline(always)]
+    pub fn inc_unless_negative(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_inc_unless_negative(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_unless_positive`.
+    #[inline(always)]
+    pub fn dec_unless_positive(&self) -> bool {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_unless_positive(self.0.get());
+        }
+    }
+    /// See `atomic64_dec_if_positive`.
+    #[inline(always)]
+    pub fn dec_if_positive(&self) -> i64 {
+        // SAFETY:`self.0.get()` is a valid pointer.
+        unsafe {
+            return atomic64_dec_if_positive(self.0.get());
+        }
+    }
+}
+
+// 258c6b7d580a83146e21973b1068cc92d9e65b87
diff --git a/scripts/atomic/gen-atomics.sh b/scripts/atomic/gen-atomics.sh
index 3927aee034c8..8d250c885c24 100755
--- a/scripts/atomic/gen-atomics.sh
+++ b/scripts/atomic/gen-atomics.sh
@@ -12,6 +12,7 @@ gen-atomic-instrumented.sh      linux/atomic/atomic-instrumented.h
 gen-atomic-long.sh              linux/atomic/atomic-long.h
 gen-atomic-fallback.sh          linux/atomic/atomic-arch-fallback.h
 gen-rust-atomic-helpers.sh      ../rust/atomic_helpers.h
+gen-rust-atomic.sh              ../rust/kernel/sync/atomic/impl.rs
 EOF
 while read script header args; do
 	/bin/sh ${ATOMICDIR}/${script} ${ATOMICTBL} ${args} > ${LINUXDIR}/include/${header}
diff --git a/scripts/atomic/gen-rust-atomic.sh b/scripts/atomic/gen-rust-atomic.sh
new file mode 100755
index 000000000000..491c643301a9
--- /dev/null
+++ b/scripts/atomic/gen-rust-atomic.sh
@@ -0,0 +1,136 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+ATOMICDIR=$(dirname $0)
+
+. ${ATOMICDIR}/atomic-tbl.sh
+
+#gen_ret_type(meta, int)
+gen_ret_type() {
+	local meta="$1"; shift
+	local int="$1"; shift
+
+	case "${meta}" in
+	[sv]) printf "";;
+	[bB]) printf -- "-> bool ";;
+	[aiIfFlR]) printf -- "-> ${int} ";;
+	esac
+}
+
+# gen_param_type(arg, int)
+gen_param_type()
+{
+	local type="${1%%:*}"; shift
+	local int="$1"; shift
+
+	case "${type}" in
+	i) type="${int}";;
+	p) type="&mut ${int}";;
+	esac
+
+	printf "${type}"
+}
+
+#gen_param(arg, int)
+gen_param()
+{
+	local arg="$1"; shift
+	local int="$1"; shift
+	local name="$(gen_param_name "${arg}")"
+	local type="$(gen_param_type "${arg}" "${int}")"
+
+	printf "${name}: ${type}"
+}
+
+#gen_params(int, arg...)
+gen_params()
+{
+	local int="$1"; shift
+
+	while [ "$#" -gt 0 ]; do
+		if [[ "$1" != "v" && "$1" != "cv" ]]; then
+			printf ", "
+			gen_param "$1" "${int}"
+		fi
+		shift;
+	done
+}
+
+#gen_args(arg...)
+gen_args()
+{
+	while [ "$#" -gt 0 ]; do
+		if [[ "$1" == "v" || "$1" == "cv" ]]; then
+			printf "self.0.get()"
+			[ "$#" -gt 1 ] && printf ", "
+		else
+			printf "$(gen_param_name "$1")"
+			[ "$#" -gt 1 ] && printf ", "
+		fi
+		shift;
+	done
+}
+
+#gen_proto_order_variant(meta, pfx, name, sfx, order, atomic, ty, int, raw, arg...)
+gen_proto_order_variant()
+{
+	local meta="$1"; shift
+	local pfx="$1"; shift
+	local name="$1"; shift
+	local sfx="$1"; shift
+	local order="$1"; shift
+	local atomic="$1"; shift
+	local ty="$1"; shift
+	local int="$1"; shift
+	local raw="$1"; shift
+
+	local fn_name="${raw}${pfx}${name}${sfx}${order}"
+	local atomicname="${raw}${atomic}_${pfx}${name}${sfx}${order}"
+
+	local ret="$(gen_ret_type "${meta}" "${int}")"
+	local params="$(gen_params "${int}" $@)"
+	local args="$(gen_args "$@")"
+	local retstmt="$(gen_ret_stmt "${meta}")"
+
+cat <<EOF
+    /// See \`${atomicname}\`.
+    #[inline(always)]
+    pub fn ${fn_name}(&self${params}) ${ret}{
+        // SAFETY:\`self.0.get()\` is a valid pointer.
+        unsafe {
+            ${retstmt}${atomicname}(${args});
+        }
+    }
+EOF
+}
+
+cat << EOF
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generated by $0
+//! DO NOT MODIFY THIS FILE DIRECTLY
+
+use super::*;
+use crate::bindings::*;
+
+impl AtomicI32 {
+EOF
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic" "AtomicI32" "i32" "" ${args}
+done
+
+cat << EOF
+}
+
+impl AtomicI64 {
+EOF
+
+grep '^[a-z]' "$1" | while read name meta args; do
+	gen_proto "${meta}" "${name}" "atomic64" "AtomicI64" "i64" "" ${args}
+done
+
+cat << EOF
+}
+
+EOF
-- 
2.45.2

