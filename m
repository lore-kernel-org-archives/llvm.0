Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222DE1EF395;
	Mon, 21 Apr 2025 16:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253770; cv=none; b=lXQHENBpEq2NpyEvI/HWfR9WDO5gudew5jnWCQXRzrnRupDQPnGJ9Z9WVkgSOMH5pG2DsVfHHphI2g23PpiySj6FkZuMeQub7LdwnGhbY51QIEFh5RsmQU3tGd/ICYrhAlCymSbeSPFMTEYsoQc2jjEmpR1S+1U0su6Uv0xsqk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253770; c=relaxed/simple;
	bh=GhwcOFNRCppAF9Yyw+kk4A11418K1+TP/Xmp0tivsGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ulxkyw/6/hJljTM9izd41LKVQX05NxbREQ+1mwS9pLoly+OgAXAeiWPzxkvagRLHdeHPASpOIvpVpuY49x17yXazZZbmlU0Ff9T8+gbK7mRgebjllYiAC/d+DpyhXYHKP0oym/RDH3n5fOHy0/U/4DY7yqWOxTPH9TKG3txCezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpYxY90M; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpYxY90M"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f2b04a6169so45508536d6.1;
        Mon, 21 Apr 2025 09:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253767; x=1745858567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CEsQWBCXRVwADjexG++NYp0pc0xQK2w2I3VkfiuwbTM=;
        b=lpYxY90MP961ngwFjNHxK3jaYNze1h7DkYsIIf2L3t0AuYpiqao8S3xVo6+RueH83F
         U1Ogj8Po2lzUCOH44bau7OZZ8dsqB2Of1zQ/RTfPUG3mA+iIQuom3FsUIR2DGr1NLbGz
         sV6MBhMcVKz2rLqaSkgMW2dT78D3IEr8QJDoPIiL7zMfvBxgCDAsJJGgq8uBDniEdwd3
         cWw//NFEhjVZyopnDfoYN8UNydl/67Y2QNzWz94mtuNG10qyOwXSmLa81xy2ZLsZ2c84
         jcSAHBdIoLOoSmZ46Wv1ijAG0KhxHQFgBsWpMUaRamHt5Exv4id4I5cKY5MaMvtj+zgr
         XgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253767; x=1745858567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEsQWBCXRVwADjexG++NYp0pc0xQK2w2I3VkfiuwbTM=;
        b=n7WDqHXJl7NNim+1hIo9rNE+xgjAd9ipfo9w87bHo1pptwmnlCgTtB0Eht3U2cBo/Y
         jo8fi25IGtQj9r5NX370O4pdumC8yoweijj/42jLMOm3SJ96RkGdH6CyJhA+wAM/bl8D
         GYxOQy/7ZgV2azDtLyB4UAoeibYPIW33sn7VZzbxSh4KXpIVCGFbMUxKjldYOxD1lc4U
         tnMSNgTVxuc/WVesA8rtKKAaTpWonEoB7qji9xnovYOHwRaAExyoS72ndnC+2nXjuNCY
         LaWUml1yEq0iGLi+A/IBYV9C1wuo9/3sRarroszkXMUXMaWzXAwAOpkn410Zw2wYoBb7
         Ap8A==
X-Forwarded-Encrypted: i=1; AJvYcCVe4jYCkAz1pVHkNuvhm9Qyx+wuCD367pKZTAQNuDk6uTUo6ym/c0HROq83Jtcs9LM06LwhpQ==@lists.linux.dev, AJvYcCXGMtLhbjFRAt7S3LjdfGBBwQZPK+vAVTKYLATr3SKo6twOK4vGWrGVOF0beKGo8ZBkOuDl@lists.linux.dev
X-Gm-Message-State: AOJu0YyDY3k1DOQnXn4I2TKC6PXH3+FspO3hjkYjNYQ5wNamD4KBFdQ3
	/TgrKm2qvn6zQtNJ1NLkG34PIRwClCSROPL1901GTE1GkFTAoTB9
X-Gm-Gg: ASbGncu93x+xIRY8tisafCsqraNBitJ9CZTm7b3WfOVVb5nJf30UgGwldBwkYd/KEb/
	UFWjrIBkEHUYpQOo9MghbtroQt+KqrcXt9sg/hWswD7S5oR6rKfRuqMMkyJEDGDvLIzbZNHWJzw
	PgG5nFXyOjikLL1rDOcL8il+2O3h8CXLRX0T7CC84vMz+r2XTd+tOjiGrNZwxst3/wkZvKZbt7J
	ls2/UQqvyzxycR+F6RlFF7XbK50SbrQToFyVbKqQHyaNqGgDVCrwredWqgkaRMMGscNc1pHOjPz
	ilWQvx+jX9NIx8DXa88waQRZykEtbuxrF7fwRW5wL3o8xK8cEd1wUG284O18ppfz2p5ICOZc7+M
	D4iWM91BxvcBXjxPeQt1/JJ/wbk7SQSQ=
X-Google-Smtp-Source: AGHT+IEptaSAwiiJLuteE0uVEhTA/P7R1wY+ta6JPNHF4XvUd3bJkbUnWRJFlD9rs8uaJEnM1M7arw==
X-Received: by 2002:a05:6214:daa:b0:6ea:d033:2855 with SMTP id 6a1803df08f44-6f2c4562e1bmr221565746d6.26.1745253766716;
        Mon, 21 Apr 2025 09:42:46 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c22117sm45683106d6.113.2025.04.21.09.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:46 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 72C5A1200043;
	Mon, 21 Apr 2025 12:42:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 12:42:45 -0400
X-ME-Sender: <xms:hXUGaH-hTYWE6wtYe0q3LteNF_5Rcz00n9kbL6SwuDaXVO9TDz5bFA>
    <xme:hXUGaDv5L8xtqKg777Xum-Z2Dwt2jQbW92ZTTtJbnor9PVXJeYkgBy1Z1LKC9fY6U
    Nyac_uuTSr_cEX8_A>
X-ME-Received: <xmr:hXUGaFB4HO6U2S2D_hUmfdzJ8ZPlMsMoqD8v5aBl5UAwxUoR-ztp0iJp1iMt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedunecurfgrrh
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
X-ME-Proxy: <xmx:hXUGaDeG2oSvFcNIvyjmbjD42HjfucU9P4kdz-luNRiHaptZRgCijA>
    <xmx:hXUGaMNTmI5qMPITrwTuCOk6cM01V-X2KNgWBq_xRt19K5PQqQwJiA>
    <xmx:hXUGaFl4x2RLDr8g8sNAM8eFyyLix2RwlOi5PzBuJuhCpdRIq5_vkQ>
    <xmx:hXUGaGvFt7FETBQw2ZwhGwEgvEv2KasoE7ZinsZv6Cnw9hzZ3k1G4A>
    <xmx:hXUGaGv98ZcBwISiVQTLlVtooA2abi6Y32cKxH5Y57-7tYUBN9nA07p9>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:44 -0400 (EDT)
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
Subject: [RFC v3 09/12] rust: sync: atomic: Add Atomic<*mut T>
Date: Mon, 21 Apr 2025 09:42:18 -0700
Message-ID: <20250421164221.1121805-10-boqun.feng@gmail.com>
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
index 6008d65594a2..ffec46e50a06 100644
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
index 2de4cdbce58e..44cb6378367b 100644
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
 
@@ -31,8 +35,13 @@ unsafe impl<T: AllowAtomic> Sync for Atomic<T> {}
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
 
@@ -43,7 +52,8 @@ pub unsafe trait AllowAtomic: Sized + Send + Copy {
     fn from_repr(repr: Self::Repr) -> Self;
 }
 
-// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment.
+// SAFETY: `T::Repr` is `Self` (i.e. `T`), so they have the same size and alignment. And all
+// `AtomicImpl` types are `Send`.
 unsafe impl<T: AtomicImpl> AllowAtomic for T {
     type Repr = Self;
 
-- 
2.47.1

