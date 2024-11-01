Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C658158874;
	Fri,  1 Nov 2024 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441051; cv=none; b=nMBnuiOBRaIVoZGI/vPOBxSN6f90p6XnBG//504GEEfQglyFQSUYLhaqsOooWZ4LKa2lZ7sMX/p5hW3Kj/ElhuEaJBM7KQUR+WUb9EeQn+4ecoBx66YPAEA+NdQIzoaC3PuCoaro4RofqEp2Mwr+i3pnDU/xLikW9EmF4jHAsUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441051; c=relaxed/simple;
	bh=Sfp3RUVnjWsogWYXe36CyUI2OgcuRAOB1019PlfdZhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KC8Zm/5uw9rIJqgHzFEm1cS3Cpcz4F/8HyQamlTazw0J2GhGTx42+WmI5bLddhsaqYHeKfXqPKDwV7FSiJYr7oap0ktSs0RWRBRxtfmBsQ3SOrusNOIG9dB54pN+q+drtMDavUxGfWCCAf9Uj3js4Vvkrz6qKqswoRUgsVvSj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwAVunnp; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwAVunnp"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b15416303aso113585185a.1;
        Thu, 31 Oct 2024 23:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730441048; x=1731045848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HedkcmZuTLLzFJb9CZIBHRUYnKPqPD+H8D+47bw5J50=;
        b=fwAVunnpGrnum0I2fgHsNDE/mPzQ9jrd+CnK03i+7hJdvZK8nBZxb6haYiuCfeACqY
         8Dk+w7v1CmXN4xOoUGP4NHnS/ywsCDRhGzHE7QGdJjxqEebax45ScaiV6hCSjzHr4zFx
         DyMmeojokxvTzTvCi/ZkYN9mmqtIMWACmoY9SeFbAHMk3bA3OoK/icvXlO1DTQLb+YP/
         RLlWRnNQh6V9nizb8xmgjtG9w3+F/HDAZDda/4endiGEtdCocYKbbYOkpdHQP6EfmaCe
         8B6Nr305F3oVIWzIBeSQf46yy0ipvNHoJhpBnccFCHDMyCgSedqV7jcji/9XP/wxgZql
         PaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730441048; x=1731045848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HedkcmZuTLLzFJb9CZIBHRUYnKPqPD+H8D+47bw5J50=;
        b=BbakR2K//auabfXEEbiKdzQWiJQmQw23/NUGIJpqGKyWklfiq3uUwzjXbBigmIK0/R
         94CARPj8xv4L4thLWNtyOQXSL3m6q8RjJhBESTXI//9g0vkMn04h0BNvpDGPZXRx6nNF
         nbJL5GdaFaIXGTW0jhsdsL/2ke59EVfm1JO1gNicOOo6ZkRX2hUvlCEAiEbXVl+r0c9m
         badTaoaDUoE4ISLhB/rucVU8bDcyjEplJJZqx3oTURFTpu8uJIO3JhVCieA2u5xOu8Gg
         UX+TMHIOzEd4TZ/b/ZSBgjXBQUPcEILMyA9PkHGLVwE2n/rM0t5waNskG0f+xokb8Tzt
         AWBg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gs1jfa9j05BNQCIabgIGVCS4Kr2kbesNNCTrm3xzCEpFpGtAI96XLonasLRV5SPggAcwEA==@lists.linux.dev, AJvYcCWlsiiM03SuGd0LAEcdQWMRgIrZB5Ydim1iRhJlT4H/Va1t+9ZT6MQoLy0+c1ph/GRhJezo@lists.linux.dev
X-Gm-Message-State: AOJu0YwuH08SjW9CkBNK9idPhr3jBBFPl/tJQFKMp3G/Qal5Ygp7gpyD
	x3wwGh37iiO1WctovzWAYmqTtIz2xypusyBnZ5WolzB65VKdvtGF
X-Google-Smtp-Source: AGHT+IFjNsIlEurpXPjF8KNlWfgLlf1NKfyfrV0QuV/GBtGTbA0qW3F/s1nZzTSXWMiWahQF6/N9wQ==
X-Received: by 2002:a05:620a:444c:b0:7ab:3ec9:f4c7 with SMTP id af79cd13be357-7b2fb982785mr233693885a.35.1730441047663;
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f39e9dd6sm142079785a.1.2024.10.31.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 23:04:07 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C55F1200043;
	Fri,  1 Nov 2024 02:04:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 01 Nov 2024 02:04:06 -0400
X-ME-Sender: <xms:Vm8kZ8cNSO-S9POofHLm4Zmnu0qOwabKxgMKGWVd_SBj8gtYw76ElQ>
    <xme:Vm8kZ-PDeCtaO29ac6kuBMMFzcH1-uoD2s8JBJSjRf4y_lH2h_WXYYY77kdkkw7kV
    NALLz84yjAkv_PbXg>
X-ME-Received: <xmr:Vm8kZ9ixDWk-mW1YSb_nxXIrQVx2QIcF9H3SENmC9oap1rbE2614R627wVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekkedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveff
    ieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
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
X-ME-Proxy: <xmx:Vm8kZx81oJCz2H1FajZFY8CI_4MBm31Nqj-UuZ_MwL0pvSGuClClJQ>
    <xmx:Vm8kZ4s8yJr9iRwTBo_G5mzHxs1dxnXzXak5YD1yt2BU0pnddpgObw>
    <xmx:Vm8kZ4FFsag_4jiBTRLMh8DHCgSUGAwjfKuORlWZc1OsT4pVO9EpcQ>
    <xmx:Vm8kZ3MPdnviiNJ7g44k53kHADVIEwVsv0I9f0cSmj1HAMjhOCB02w>
    <xmx:Vm8kZ9Oy2qM5_VsiogkpsGZ1u4TP4xsVaf6eSzs-Y_9Rcyzvata9LSOs>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Nov 2024 02:04:05 -0400 (EDT)
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
Subject: [RFC v2 10/13] rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
Date: Thu, 31 Oct 2024 23:02:33 -0700
Message-ID: <20241101060237.1185533-11-boqun.feng@gmail.com>
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

(This is more an RFC)

Add arithmetic operations support for `Atomic<*mut T>`. Currently the
semantics of arithmetic atomic operation is the same as pointer
arithmetic, that is, e.g. `Atomic<*mut u64>::add(1)` is adding 8
(`size_of::<u64>`) to the pointer value.

In Rust std library, there are two sets of pointer arithmetic for
`AtomicPtr`:

* ptr_add() and ptr_sub(), which is the same as Atomic<*mut T>::add(),
  pointer arithmetic.

* byte_add() and byte_sub(), which use the input as byte offset to
  change the pointer value, e.g. byte_add(1) means adding 1 to the
  pointer value.

We can either take the approach in the current patch and add byte_add()
later on if needed, or start with ptr_add() and byte_add() naming.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index e62c3cd1d3ca..cbe5d40d9e36 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -197,3 +197,32 @@ fn from_repr(repr: Self::Repr) -> Self {
         repr as _
     }
 }
+
+/// ```rust
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+///
+/// let s: &mut [i32] = &mut [1, 3, 2, 4];
+///
+/// let x = Atomic::new(s.as_mut_ptr());
+///
+/// x.add(1, Relaxed);
+///
+/// let ptr = x.fetch_add(1, Relaxed); // points to the 2nd element.
+/// let ptr2 = x.load(Relaxed); // points to the 3rd element.
+///
+/// // SAFETY: `ptr` and `ptr2` are valid pointers to the 2nd and 3rd elements of `s` with writing
+/// // provenance, and no other thread is accessing these elements.
+/// unsafe { core::ptr::swap(ptr, ptr2); }
+///
+/// assert_eq!(s, &mut [1, 2, 3, 4]);
+/// ```
+impl<T> generic::AllowAtomicArithmetic for *mut T {
+    type Delta = isize;
+
+    /// The behavior of arithmetic operations
+    fn delta_into_repr(d: Self::Delta) -> Self::Repr {
+        // Since atomic arithmetic operations are wrapping, so a wrapping_mul() here suffices even
+        // if overflow may happen.
+        d.wrapping_mul(core::mem::size_of::<T>() as _) as _
+    }
+}
-- 
2.45.2

