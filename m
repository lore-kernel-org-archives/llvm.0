Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5082D83
	for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711150754; cv=none; b=NonDBPwj19DjpahlD6IvPxiimVjaAO0UisNB2TC17RKlTiryNuBbUjLE9rOqNI2weWIN3PbsqFyPrC0RUOEMQ6yLwoCBuke5skZsLuL+IIq3/RiIjKpjMU5iwI6JVtgGwl2y84eJzLluObs9q1AVXH+RHW+YaCRn4pevnZNjrXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711150754; c=relaxed/simple;
	bh=/NBZoIhK1CtetohxAcHUpmJsAGut/+ZBo1KxCgXiFn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRH2mBmkL/SD6/q9w4zT4zTatNm7gc8SVrxuWv2k9uCGBo45QgZVtG4w8cBTyNXjuYLjlQbM2Az+uUd40tYMu1hXJOSFMpwNtxiAD8thoioJBN/4NwB+Kw1q1vPBTBzvve3xRogUEZquF5rj4VJKChpdLHST2C3WfaFZZMxDSxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXY1CmCC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXY1CmCC"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78a26aaefc8so176432585a.1
        for <llvm@lists.linux.dev>; Fri, 22 Mar 2024 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711150751; x=1711755551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/F96a8YELf+Ur72xFbmW7ZJSVd3YYBPROndGsfciYiA=;
        b=FXY1CmCCOsu4jMydwL8cRh4nJjI6RZxYzO19nctpZp+9cDLGBekV2gWRKrE6WaBzlE
         /prAhEm8fPoMmRARnuzcwDkEYFvEaexTXbAjuCynjommRdLBzO/kpt1mtUKcL/UMfr/g
         uNMH4Oa7+dzVLvw4XTu0PXDyV45J7SzavtR0sfJ8SaLldei8fgeEUq24NRcyw++8zFik
         EgGPoU9WX4p+NI7E4dJyhvRE3UgfYlSaDT/w4GETSU3R7Wtrv1fwwTA6qTCQ5GUlLbmp
         6Nc1Z9h8SJEuz5sJqWE7+96jnzF2FT0bQR/wSbdGaQQ63F3+pzVPD36CZlpDfgztRM5H
         wLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711150751; x=1711755551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/F96a8YELf+Ur72xFbmW7ZJSVd3YYBPROndGsfciYiA=;
        b=LTJloYcPWRk2TMEzVYbBwlxWUaSI/dCme8lEsOj4+VoDGGeD66xcxTnRz+B4kwTUOR
         4HeWkK16k99+ATZjDpn/S5k/V92T/RcRU501g4hokzw0X96jxuMy+lPGMv6yijkE6X6j
         nXAtGaodLR28PGZXzpG3VvF3vJCrJq3PhePd5otmyww/dwvpW1dTSqKjD/WqVKnD2qsa
         xtF5BXQkE/8vsQ7l03ULIrcHk9NnYj8JxiLw8tSPWtpLw1zGABN/y0tG30jigM6+PwlZ
         ROYwY2MfScnlDRTCvXIu7hTdtQUx4/sjhyMDIaC1ox3P6VpK2tnBgAGBQRRHpKCkUCwa
         PjjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtmsHrhiSVxz5CbU5RW0oZlthpe2Apa53CzSY/6IH2PSVlJ2dBM6SmGnLJiWIJHNaaZVw2ty1qh81pPtYMJRbmPWlyZw==
X-Gm-Message-State: AOJu0Yy0Plkz/VQdwXO1WiDyK0oPyE9KaigEe3nGR87Y865+hgORns0z
	ks1Lq8dKxm9B7Rk5Jo8PD9Any4sM/c/AM8Rvnnh7/F5F+ZU6Pz0m
X-Google-Smtp-Source: AGHT+IFnhi7P+k/MkZCWrllad1of00qh69/aWCRn2Ch4hXaX74mXDXtJDyquVhXLLDKOeEFx3KqBoA==
X-Received: by 2002:a05:620a:40d3:b0:78a:3fb1:bade with SMTP id g19-20020a05620a40d300b0078a3fb1bademr1295433qko.1.1711150751298;
        Fri, 22 Mar 2024 16:39:11 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id cz52-20020a05620a36f400b0078a43996ab7sm267608qkb.1.2024.03.22.16.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 16:39:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id E694E27C005B;
	Fri, 22 Mar 2024 19:39:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 22 Mar 2024 19:39:09 -0400
X-ME-Sender: <xms:nRb-ZYRx2_-58_-z6-x6S4sKXkjHp-GCdlJ3teS6u0_eGxEhEFihvA>
    <xme:nRb-ZVwJEn5X_3CSF2VBVtDTWyJWMQOj41t5nU4Y3tVws8i5M3p0M0znwaIFaCWeJ
    RuL49VwOqImuy1r3Q>
X-ME-Received: <xmr:nRb-ZV38RkJQ6TRlO3PiWGx7flW84bXCLPP2yLPAhZeGxyNf_GQM_kKb9P0jLw>
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
X-ME-Proxy: <xmx:nRb-ZcBtlI8Nx1uTVZ20QbfmnwHmh_PUZHvw3mBA8IwuxKJSFpfnIQ>
    <xmx:nRb-ZRj_EGYVPZNkd1RT736QMkUg-qVTRaNTocfxpK8xNaNZvrYkVg>
    <xmx:nRb-ZYrJcjVRZwzY0KBDqLp6P-pKhcf5ywqbm4nI0O16gmgmwapI6Q>
    <xmx:nRb-ZUhdx8xp4T0whLRk9kcTd4nFRTE3UQe3vJyjzA_kfVUbwdWnRA>
    <xmx:nRb-ZSBpBm8jvDtFtL4qCfbPT8guZsv0eGkZwMfREFkeARBMIPrlq2SrgRg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Mar 2024 19:39:08 -0400 (EDT)
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
Subject: [WIP 2/3] rust: atomic: Add ARM64 fetch_add_relaxed()
Date: Fri, 22 Mar 2024 16:38:37 -0700
Message-ID: <20240322233838.868874-3-boqun.feng@gmail.com>
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
 rust/kernel/sync/atomic/arch.rs       |  6 ++++++
 rust/kernel/sync/atomic/arch/arm64.rs | 26 ++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 rust/kernel/sync/atomic/arch/arm64.rs

diff --git a/rust/kernel/sync/atomic/arch.rs b/rust/kernel/sync/atomic/arch.rs
index 3eb5a103a69a..fc280f229237 100644
--- a/rust/kernel/sync/atomic/arch.rs
+++ b/rust/kernel/sync/atomic/arch.rs
@@ -5,5 +5,11 @@
 #[cfg(CONFIG_X86)]
 pub(crate) use x86::*;
 
+#[cfg(CONFIG_ARM64)]
+pub(crate) use arm64::*;
+
 #[cfg(CONFIG_X86)]
 pub(crate) mod x86;
+
+#[cfg(CONFIG_ARM64)]
+pub(crate) mod arm64;
diff --git a/rust/kernel/sync/atomic/arch/arm64.rs b/rust/kernel/sync/atomic/arch/arm64.rs
new file mode 100644
index 000000000000..438f37cf7df6
--- /dev/null
+++ b/rust/kernel/sync/atomic/arch/arm64.rs
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! ARM64 implementation for atomic and barrier primitives.
+
+use core::arch::asm;
+use core::cell::UnsafeCell;
+
+pub(crate) fn i32_fetch_add_relaxed(v: &UnsafeCell<i32>, i: i32) -> i32 {
+    let mut result;
+    unsafe {
+        asm!(
+            "prfm    pstl1strm, [{v}]",
+            "1: ldxr {result:w}, [{v}]",
+            "add {val:w}, {result:w}, {i:w}",
+            "stxr {tmp:w}, {val:w}, [{v}]",
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
-- 
2.44.0

