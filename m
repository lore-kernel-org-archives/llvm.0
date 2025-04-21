Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A861E835B;
	Mon, 21 Apr 2025 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253767; cv=none; b=V8yvjbhzt1RGnyFLjgo9znQl3PlQIdBO8mG9aLIrS11W7TL57ZyPCuvaD6VQWQD37s1XksfkltoNr67gNiIh6M0/hrtAYEGdl/akofill3YxaHpUZAqAadrA206r3qFTcicA2BUT3/dRreqUKqwvbVhouros6I3Rb/l399Sa9Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253767; c=relaxed/simple;
	bh=T6fn+IIXOWZFbnRBBLRrM7viHHO9sGEOT6hWF8K4jvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXjxcTKm/tEJ6squxDkWq45LDF1RmzXj6e7vRG5nmo8djliexZFn1rNumOmX5989I0FrojDgJaSLD5NxZVPbjVMdmcpzV2WKTXzKwF8FHRFQJRTg4c9sxTYRTr+Ktk3LAzS/8sxSe8ED03bS+E9DjnZ//zUpCsNHtC/D1eWcoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRSfT8NP; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRSfT8NP"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4767e969b94so83544861cf.2;
        Mon, 21 Apr 2025 09:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745253764; x=1745858564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2I8XAztJEZn+vwuO6dwvyeow7+5UV1o92z9+NI6bSFY=;
        b=jRSfT8NPT5C/EcQI9nzRccnkQcBkNQtEvt7u80lmLH1iKQuzVIhIhzbHcNrsiclM82
         s5H0XymFUm00erTmhkJtWmwCT/SNxneJEf0JSQe/SVp92HogOqf7eBjj8Alt+C1YgoJL
         7KGfgjzk2MTJkFsMwnm532RhF9rhMO6geNsqKRF9KB1imTG0Vqra/uju+4KRHzC7A0AG
         xEf5/PjqDVAriy9zzkvWGUZx7cK7x/+lcZ9tGIXoQabg+LECre5ZQfr5C4Xn/HEGBjNB
         pe2o3yAV71YRoW2dx31H04FURM3/FaB0e9s9XalQgDHeg0Y+/g7yaf+bhGvlQgAj8UkC
         Qm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745253764; x=1745858564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2I8XAztJEZn+vwuO6dwvyeow7+5UV1o92z9+NI6bSFY=;
        b=J+oZulJs27waj9+G3AwVtnGITOKV1xpfdNYrEDr2A5SWQpdBXQ+HPDYK/moDkmO12q
         SuKtqADJPefnrUq2RbdNxP2li7kn/qpUA45/QVKehjs+fECWwWnGq+FQzspDi9dQYiPe
         p63ZDSF6b9PResblPZQL5ebVLnhbGr1IEZVoWtCHmXgg/HRUpVH711cmntfvTfJtKxgt
         979+OX7G/Nsmmqz9AXuqjtZaLtD23w3yOgLh/wEEs3yef8NYIUozFcd9wKIjYfaAW+jz
         IRn8rTODLugzOKVoAIptVFh5HMOu+pEeTvtC1X9tz9xcAm5E9tTMw8C6upv8/MXYu1Jr
         ZI2w==
X-Forwarded-Encrypted: i=1; AJvYcCWdl84I+kVWnYxBlkeI5osrAQ+AzOEux0OIKyl5Um8dadLH3dCqzshXB5kFIMHjq3nl6hWJ@lists.linux.dev, AJvYcCX7Gwz0I4yWMRPt0P0UUNAsx4e/yVwofzZO+HZjf3gR4ROtSB4KiWs+CKF1zfz0nPtzWv0g5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYMdP582Y5+teeieOw3VSBS+eJKcOtrS3D3k+/Sy+zP+TPu3i
	6KM6GVLGIOx7XADsLEj6t4cQrIk+h6H5VoNtcIvuPUR5PJpjbC0+
X-Gm-Gg: ASbGnctqjTyTzSqIt6ahniGN08FNF6IHjpwQr9VADrY/rvdugfznQnp9OjkJ3A23Fj4
	cVL/mAMCnawtGE5N5AYXutwFFracK6H0NX9nSgCwqljb9eTPuRIYbcXEHkXTedO9AyHPf/r66/H
	cxJNXuZU2j0CZwxmq8DsQegObmw96JLsM6vLcfQLaeEvqqW2uWWmD7/NIvjnrHqb8ZgRLAsuYCt
	dfgS13wbhwTLUwHTc3JbUIumxlQTcRbh4wsnPgxp594Lwcxc9Y3w3wKYwrh4tay4mv+wXJtx63D
	015XYL8Fublb4DLyTjbJKv5HtgMu0YRuKR0lqfDsw3r5esHO+NEwqZBQBNgr0Am/sGqsSFL5VV4
	4W49ra6RnPN+wgflwmSsNct+Uk8ihNng=
X-Google-Smtp-Source: AGHT+IFd/Wxg44JU728h1hWeDdpS9Yy+TAr9cZlv3SjHXeKAtBsZmm+TR6rvWZvEGlTOSe4yrtV6Ng==
X-Received: by 2002:a05:622a:2c1:b0:476:8a1d:f18e with SMTP id d75a77b69052e-47aec49fef3mr208625081cf.36.1745253763580;
        Mon, 21 Apr 2025 09:42:43 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9d19dd7sm44498381cf.81.2025.04.21.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 09:42:43 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 504631200066;
	Mon, 21 Apr 2025 12:42:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 12:42:42 -0400
X-ME-Sender: <xms:gnUGaH2s-0N1_cS70v5IhHVJTw7PJUZBjRYITApQbHzUDi-crzM3cA>
    <xme:gnUGaGHbUsAUlFpu8ky0_NMJHtbvEWFGIor_iv_8K9UE6kz72lo6LmkRqOSiyFU47
    c4J7kPDeQG1ivT6Ug>
X-ME-Received: <xmr:gnUGaH7mLKey1kd1QVA2JL0Bi-4nvDOBiLw5FOmK1Pk0l67zlovjAZToRsJi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeegleejiedthedvheeggfejveefjeejkefg
    veffieeujefhueeigfegueehgeeggfenucevlhhushhtvghrufhiiigvpeefnecurfgrrh
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
X-ME-Proxy: <xmx:gnUGaM3DPoqdouy69KxmnQ3YF2i7VYwe0K0m_DYo7qDq80U_zmliAg>
    <xmx:gnUGaKFQ48PVzlYFvrkZWY5t4EOFmz1dgv5UdBGxAaIL5ntshUt0hw>
    <xmx:gnUGaN-WjBXSOBMKw7brrtnQgUxKSi5i1QWGzAEAHlsu8BKVugAd2Q>
    <xmx:gnUGaHkommaXzJJH-EScrY2Sb9BDOBp64rRMxz-3elc4ZleW7HSxIQ>
    <xmx:gnUGaGG-PHY8ZSs9qHKXy0dG6ul3m-5avOINGkSuqe5DXSu70cs3sjWV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 12:42:41 -0400 (EDT)
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
Subject: [RFC v3 07/12] rust: sync: atomic: Add Atomic<u{32,64}>
Date: Mon, 21 Apr 2025 09:42:16 -0700
Message-ID: <20250421164221.1121805-8-boqun.feng@gmail.com>
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

Add generic atomic support for basic unsigned types that have an
`AtomicImpl` with the same size and alignment.

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs | 80 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index a01e44eec380..d197b476e3bc 100644
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
2.47.1

