Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121982C63
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 23:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711150755; cv=none; b=cwaXGnhkpQbCSgRie7cG+MwBRzjcQcUSx8YiK3SX0DVqXGFGTBoa7UxGjPsdwfoys11kfaDb1lWXtGnMFHru97xjpfN8bYqNBxFfZL4zFGfZ2HLEvm30gR2+tOBQWF+EZphknMklkk5sBftRmo4IXkJn6Or1NX23RfewgfyxCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711150755; c=relaxed/simple;
	bh=qQ5oagRUQmpb8GABKAqxfq/Tg/yBhJf6ca7+7tUxq/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CQhKln5RHcYqZp/e9XQbLsUEwsF/wB7islcXZmlVYgDWejEf8yWR8tt47p2jD01umcUUBwZxf5tR0Ky5myC4Wp3k7RnY4rwElOaolcSrNOLznjN2H1d/+Bv49LGIUV6qIU6Pq7eu5fZm3nsJYwM2/f/k8lO/6cCrWn6UkEAwV9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8ZAJ3Jw; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8ZAJ3Jw"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4d44beade3cso1164647e0c.1
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 16:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711150753; x=1711755553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZ2rrwnnSPuoyWFM6/wbqSx+XEHGNK8//eAAMbn2SLU=;
        b=B8ZAJ3JwNOwVPzQckhfEKmsLYhGNJkSBU/sNwsQaYmhxEYLDOFhGu8Gawy+XUEWXU0
         MDe5dnruTAVs+UoadfbDd/Zga0RK8AP8s3EDCBTL3xGjMMOw7BOmQeEfycGWgyyBR2gR
         I3KZFQGwzTt/f2WdP6MIHjSDUvJUNI5RMQmAgnkctT+ONXPd55sg2pohcnqSYeAtZiBC
         XUqBVmgFQhilSN9NYM/45oDRKnpNSB58cMxE1LT4nXm4E7rEw9O28n1OTwVymDcCn96z
         5l2Mj4Fk2OJ3RBi8316YR1f+xmDVvb2IpW+aYuQxEVHp6WnV5ZSVwv8gq9qlQGj8Sq35
         95+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711150753; x=1711755553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZ2rrwnnSPuoyWFM6/wbqSx+XEHGNK8//eAAMbn2SLU=;
        b=ZdV0fmlPJTqU2sysMbubj4dCqxgfDbzpv+w22O1Ttg+wOwg7mjvW2tm196E/ar/Lvu
         tnJbuky6fT3mEv3LqS9KCprTnPtlgd4+GVq0+jE3mZ7JjZehLevqOPC7kdGXrGrv4QVa
         VysiwdUhtwwJ12oISC8dVcS7lNVsswyuVR+SvOKckXZOwnYj0ge8+e09LxXJsU45rsi/
         nPsIjApK0XYMypDHOxtfNYMlDRYObaisCCEqSnuwD1jqj8Xf9SHVG/LXaic6e+tGEcvf
         fLQ96F+2iPQQonBAX1NpTOgVevUfB92i0d+ngO5su+B8rTJZtQjGRfpC8+QGXvGgn0dG
         FqBg==
X-Forwarded-Encrypted: i=1; AJvYcCXwPGZaW/7A1t8peGrAFcfpdUnRA3s62P+UEux5fpo6qkibTL5O3dj9RsvOtn8EQzXcPdmU7sZRJ7HOR61zk2NODS3C7w==
X-Gm-Message-State: AOJu0Yy6moy4MuG0tA5BQ8l28FxtiyTXFq0IlSCDUIigpr55etuw12Kf
	FqqT2gKv2C/C/cpVCo6QDxfDaO6mMDyIfqzgKZwuX9uF3/NA18fA
X-Google-Smtp-Source: AGHT+IEaYQaJaeCZmztaSPVyvy8V/Vxeh4oBqEj4kwmvUweyQop95DXCqfqCPm+ZQJ2lS/7MtVUgAg==
X-Received: by 2002:a05:6122:c9f:b0:4cb:fc25:7caa with SMTP id ba31-20020a0561220c9f00b004cbfc257caamr1351039vkb.14.1711150752858;
        Fri, 22 Mar 2024 16:39:12 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id dd7-20020ad45807000000b0069675909982sm456994qvb.70.2024.03.22.16.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 16:39:12 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 98CB91200032;
	Fri, 22 Mar 2024 19:39:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 22 Mar 2024 19:39:11 -0400
X-ME-Sender: <xms:nxb-ZXIx1aaow52e_WoDZFqnahY1bIzzv5Wxu7y5Bx3FCqaoacZKaw>
    <xme:nxb-ZbKVQEyiu5t7Xp4_oUUScOcKEYzNSWnVzrOr-P_XBPKxvfNR9gvy-y3qaTfgd
    B88TMJzA-sHCJuMcg>
X-ME-Received: <xmr:nxb-ZfsAdtEQ6wxjKWrjG-mmoZH0kN4C1sOqF3vapgci3LBivqDLSJscBpEfvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddtfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeegleejiedthedvheeggfejveefjeejkefgveffieeujefhueeigfegueeh
    geeggfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    gsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdei
    gedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfih
    igmhgvrdhnrghmvg
X-ME-Proxy: <xmx:nxb-ZQZZZwqym68B78NpzEjDSIBXxqsT776nMUbyvIA4DeAUsNkvmA>
    <xmx:nxb-ZeYPyMmA5Ie9kuz4ke_eNCTGF5Hy17FOBYmquZHMlJ3KUlIaVw>
    <xmx:nxb-ZUAFZkXd54Zn9rr1tBaLwxLqHc0ZCPVMAyTQnanW_yNTyHsHwQ>
    <xmx:nxb-ZcZNxf4TI3OmNTLXqYypNReK-w3xMoiOqTqRfhqRIPvgjUNKZA>
    <xmx:nxb-ZeaMRH_yJkm0MFOiCC5_cBsqDl8eAbpKk1x-uyep6Kc4A-NFFUh1PGAvdpkV>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 19:39:10 -0400 (EDT)
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
	linux-arm-kernel@lists.infradead.org,	linux-fsdevel@vger.kernel.org
Subject: [WIP 3/3] rust: atomic: Add fetch_sub_release()
Date: Fri, 22 Mar 2024 16:38:38 -0700
Message-ID: <20240322233838.868874-4-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240322233838.868874-1-boqun.feng@gmail.com>
References: <20240322233838.868874-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/atomic.rs            | 23 +++++++++++++++++++++++
 rust/kernel/sync/atomic/arch/arm64.rs | 20 ++++++++++++++++++++
 rust/kernel/sync/atomic/arch/x86.rs   |  5 +++++
 3 files changed, 48 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 280040705fb0..c3cae0d25e88 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -39,4 +39,27 @@ pub fn new(v: i32) -> Self {
     pub fn fetch_add_relaxed(&self, i: i32) -> i32 {
         arch::i32_fetch_add_relaxed(&self.0, i)
     }
+
+    /// Subs `i` to the atomic variable with RELEASE ordering.
+    ///
+    /// Returns the old value before the sub.
+    ///
+    /// # Example
+    ///
+    /// ```rust
+    /// use kernel::sync::atomic::AtomicI32;
+    ///
+    /// let a = AtomicI32::new(1);
+    /// let b = a.fetch_sub_release(1);
+    /// let c = a.fetch_sub_release(2);
+    /// let d = a.fetch_sub_release(3);
+    /// let e = a.fetch_sub_release(core::i32::MIN);
+    ///
+    /// assert_eq!(b, 1);
+    /// assert_eq!(c, 0);
+    /// assert_eq!(d, -2);
+    /// ```
+    pub fn fetch_sub_release(&self, i: i32) -> i32 {
+        arch::i32_fetch_sub_release(&self.0, i)
+    }
 }
diff --git a/rust/kernel/sync/atomic/arch/arm64.rs b/rust/kernel/sync/atomic/arch/arm64.rs
index 438f37cf7df6..beea77ecdb20 100644
--- a/rust/kernel/sync/atomic/arch/arm64.rs
+++ b/rust/kernel/sync/atomic/arch/arm64.rs
@@ -24,3 +24,23 @@ pub(crate) fn i32_fetch_add_relaxed(v: &UnsafeCell<i32>, i: i32) -> i32 {
 
     result
 }
+
+pub(crate) fn i32_fetch_sub_release(v: &UnsafeCell<i32>, i: i32) -> i32 {
+    let mut result;
+    unsafe {
+        asm!(
+            "prfm    pstl1strm, [{v}]",
+            "1: ldxr {result:w}, [{v}]",
+            "sub {val:w}, {result:w}, {i:w}",
+            "stlxr {tmp:w}, {val:w}, [{v}]",
+            "cbnz {tmp:w}, 1b",
+            result = out(reg) result,
+            tmp = out(reg) _,
+            val = out(reg) _,
+            v = in(reg) v.get(),
+            i = in(reg) i,
+        )
+    }
+
+    result
+}
diff --git a/rust/kernel/sync/atomic/arch/x86.rs b/rust/kernel/sync/atomic/arch/x86.rs
index 2d715f740b22..7f764cde4576 100644
--- a/rust/kernel/sync/atomic/arch/x86.rs
+++ b/rust/kernel/sync/atomic/arch/x86.rs
@@ -41,3 +41,8 @@ pub(crate) fn i32_fetch_add_relaxed(v: &UnsafeCell<i32>, i: i32) -> i32 {
     // SAFETY: `v.get()` points to a valid `i32`.
     unsafe { i32_xadd(v.get(), i) }
 }
+
+pub(crate) fn i32_fetch_sub_release(v: &UnsafeCell<i32>, i: i32) -> i32 {
+    // SAFETY: `v.get()` points to a valid `i32`.
+    unsafe { i32_xadd(v.get(), i.wrapping_neg()) }
+}
-- 
2.44.0

