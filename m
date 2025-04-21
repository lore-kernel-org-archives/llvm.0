Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5B1E51FE;
	Mon, 21 Apr 2025 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253771; cv=none; b=mdHXfI9/h8OmMaH0W9HGBY+/JA8vKChegY54TxsfGpl7OfS8JK+Re0diTXqrJ5cZX7cNoqu4/A7qWEb1H/D/aAnRo4XSGs8fxdWFDvjJtH1AtqsDCbVtX19sGKPbS+6ah+rTqbLcNRdWgAC++XNXd3NQczbaV39lxYGN5BQUPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253771; c=relaxed/simple;
	bh=ir9Jiu1Y1J4FXKxDOougVPhBcRyH5oNJ6vvblr33dic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTc+uRGUke53BjX8JxFriD2GxIpPjJWm0du4qmks/D6amqinU3GIOXBK9nwa6mLzw7bsLsAShwJ2N4T4kPE0D4YqRBUfNAw+BYVaU6NklkKYcv52X7lYTDvyziXOYaq9k5LrFwp//5d/OYFsuziuQPmqmiwXpEoXfIMjR33yMqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG/OR4R6; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG/OR4R6"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476805acddaso48476771cf.1;
        Mon, 21 Apr 2025 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253768; x=1745858568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMU54tdag8mXyAmWP+eFJWJLUiSas5VBnDSB0h2I5Ow=;
        b=fG/OR4R6JhTmxoQCMrMUdUYRrrSiqT7939WgSNhZOLgu/l1oScsT6gCObphlKQkMG3
         1uC3RKFkGR7OTkzgD3uKzA4a5u5Qh9DVaQfyEoxE0bmn6F9Re/4YJMTbb3tTT+dJD+CQ
         +5Phjsk3zg0OU7siqL/R9X/Glf49jPwTo7KZaLUdwTI0vYTa1HLJWo8xHVL8yu+yiOcI
         SVHCG7INPLsw66IwrEjd3i2T1cOtEYPUGZdyzOa5SYTTgxMZfitmMC+LH1KmEhGzp7/+
         6ZVPZY7W84j1NjLMTRQaKADOiN5sufhfiriGWfZ3Xdz3erd+lzN5aKAuHsae54xdDAnG
         QQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253768; x=1745858568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMU54tdag8mXyAmWP+eFJWJLUiSas5VBnDSB0h2I5Ow=;
        b=PAcERK/Zeyul+v2EcV7zcPFmfssDziwQC7lwQ7ngUdQNEzIlxc7MiyIP789o+ZujqY
         dnTy8lmyQkCOs2kdIKx06CO/SeFJi1vfASLePsbavKtVet6eiE4e0eTLKXT47oY6hVBo
         LWQloSl9L/cvtuQbl8NAwizKVOgmzi+QPHqpecsnWjmx2e7oikz+UfTgrGweSjGF4Vfr
         3WiKnKWGuGkMoI47pECVulZzitI+9SEE/x71s1btE0pNqMr4ktOtAwfy44GvoptXs4Ub
         X5THfzO75foV1DK9pRCvHsIFop0cUnhk341BScWLjjWpHhaBbTizB50q/S3R9Jq6tII4
         yOng==
X-Forwarded-Encrypted: i=1; AJvYcCVmhl149768kBzWyxMCtg9mjWhFgb3M4ZGICXDS8Iw8nwvCSNyrR4+990utjpy2vAZBn1Qi@lists.linux.dev, AJvYcCW4xlqWpnv2D8cQLavASTfZkU08ckMyrhlm67WhxBqDLYm+xyYxcCxCTq38wQBHwsxxI4P6LQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFDElkLA6iIaBZtFv+gBptpDlfR5rBCE0dyIvLkhn1D41dH3lA
	OJPfXuxmb8f0kbyGHGz+4uJsbMTYSg/15GHy8QTn3BjOSKKQHWeF
X-Gm-Gg: ASbGncs2dSozPaFaya9WZlhdI1e3JikBZdoRdrrgglKp+ZMRr1zPocPjZadjh3lKlPz
	iXJeVW051newlUjRhf1S1xIV5om59SgNQZhGT4MTlWMr55j6Duhj/3UBW1x5vYNaKgjWWuvFObz
	K/dDTrzahBbMg+5y+sSaIVmjBmoxC8f1Rpk3KSlY426KeUXd9izHPdw41JepyhAPYRKKDwgDZjk
	GmmVS5tsGNeuYmTzpm3VqlxT7GbYO6eY1YjuvHoVXYx3RfD0cVyWTOqWgm16yujbTYgUsFHm87D
	3IsAFpsW8QSStEXAwggaGu0Gizf4yDCr7mhJa4Zi6qUZt1euTM/tfOIHbR4dghaLQr7Un2LIGyr
	S6kvHEeHzSF6Q1IbxriMSJzF1Zja9Ds4=
X-Google-Smtp-Source: AGHT+IG8et7fC7+tUWJWdi/KRagmuQCr0geiaNfRVcQO9g1LzZ7CU4sJ8yq6iEXQfDvIr5R63Ow0QQ==
X-Received: by 2002:ac8:7e96:0:b0:477:1ee2:1260 with SMTP id d75a77b69052e-47aec351e08mr190531681cf.1.1745253768325;
        Mon, 21 Apr 2025 09:42:48 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9cf9f88sm43877931cf.72.2025.04.21.09.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:48 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25E5B1200043;
	Mon, 21 Apr 2025 12:42:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 21 Apr 2025 12:42:47 -0400
X-ME-Sender: <xms:h3UGaG57po1eR2F88GMjW0h-xR6XvIjMQuOmAFfAEw5EzHKzOqLq5g>
    <xme:h3UGaP59JVjNaOOAy-__KTOM8TZbBUJPsHXOmFp3On8lbzbdAdHU8vJud9YAmz9OC
    1Rv-B_OQCRtH1s-Cw>
X-ME-Received: <xmr:h3UGaFcxsZjJKvlIY6eTduyY2xePqb-oBqcx10y-VQ46DbKofgllEsYOdSUD>
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
X-ME-Proxy: <xmx:h3UGaDKY3WhiLISzt8hpltmCqfJP5nrXVAkhh2O73Q7gW6cYSP8-5g>
    <xmx:h3UGaKJ9cqOrAZxyZVAPaDk5qrig4s8HEy0K2sz6tTpa0e4STiTPRA>
    <xmx:h3UGaEym3UKQtrVgcltD72BrgyPmmACBNsNZvEkPs0Y4pip0l0wqcQ>
    <xmx:h3UGaOKndUSoX8-vyscSMxNQvUOFsTXAHWfAHtCOXHfAkMrXkgascA>
    <xmx:h3UGaBZU9qNnDGOytmIDNypnA9r5h9ag_5ZvvdpIm7O75-L-X3h3K8jv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:46 -0400 (EDT)
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
Subject: [RFC v3 10/12] rust: sync: atomic: Add arithmetic ops for Atomic<*mut T>
Date: Mon, 21 Apr 2025 09:42:19 -0700
Message-ID: <20250421164221.1121805-11-boqun.feng@gmail.com>
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
index ffec46e50a06..f2dd72c531fd 100644
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
2.47.1

