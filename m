Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88D9531619;
	Fri, 16 Oct 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167906; cv=none; b=K0V9Z6CtR3+iQX70Y6dkm9SQ0p1QgCHmbPf6LY3eamcstv0P3FB5vVPSSyTZC8I1q1EiYhnOKZ6IjSxJN6426125lDuNlZGmILfuCp7kZe4FT3vcqZRSMdEAERTdk4fQNBmeEmCMNBqsTcB/qExFKv1LUkMlgO8mdsJlXp8vwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167906; c=relaxed/simple;
	bh=ix/AciHROJNH84G2Zr19MPEpeRmyT1SZOoilk3ELzEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFCjSwzY8gWVv/sJyuxisZCTfY8jQoQA8Utw9ij5vRGPRDeXdE9/VkfyA/aUU43PTIy1JRCz1Ih7iUDUY6xEjL8K1P+YMlMJBWIZAWNoBwcf61+7NFCBJJ+3FGbh9vm+PvtjIMAFU7pcNO3mA+f04hikl/ZH87bdlMu5hYb0DO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VczBNaYt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VczBNaYt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3791F000C5;
	Fri, 16 Oct 2026 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167903;
	bh=hFyPElUe+iEQxlpiD8tL0T+jjcw6QHWo7/E9wZV//Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VczBNaYtGr3re3BL5zhmtJGHb21JNW2ZxvQd0QuyDXzjsLJRAckuXEGucM2rO4pxA
	 wrWbbEFM8AVHqxz6rO0mF+u4bCu3pN6PpEYHH/Q4VAmn36Xw0G3Ug2onDMRqjIH1mO
	 u8jAN1N7V9qOukQ94ncAzUvkhiqHAV6PTPTev7lmgp+F1w+YYHEzR3BocssgV7z5sS
	 elijxXkX0w/i4VP8XPKRwIVHJm18ItletbcbDKV4OkLOMpieaNDK3efYrPULQLw0qA
	 Ny/CrJveN5ooT2P4eU3bvmOQYy38GfKjZpeXEijg9+8NtIyc3DqY/C2N3b4DFnSnG7
	 kSERxUxI0vQow==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v3 2/2] rust: bug: hint `warn_on!` conditions as unlikely
Date: Fri, 16 Oct 2026 18:24:46 +0200
Message-ID: <20261016162446.121509-2-ojeda@kernel.org>
In-Reply-To: <20261016162446.121509-1-ojeda@kernel.org>
References: <20261016162446.121509-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C side `WARN_ON()` macro hints the compiler that its condition is
unlikely to be true, both for the branch that reports the warning and
for the value the macro evaluates to, so that callers such as:

    if (WARN_ON(x))
        return -EINVAL;

get the warning path laid out of line.

Now that `unlikely()` is available, do the same in `warn_on!`.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DJUY1ZYYW5K6.39XJ3ZV7DGZQW@garyguo.net/
Assisted-by: LLM
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/bug.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 3b40b0bd37b5..f1209f0dbccb 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -147,12 +147,12 @@ macro_rules! warn_on {
         #[cfg(not(CONFIG_DEBUG_BUGVERBOSE_DETAILED))]
         const COND_STR: &str = file!();
 
-        if cond {
+        if $crate::prelude::unlikely(cond) {
             const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
 
             $crate::warn_flags!(COND_STR, WARN_ON_FLAGS);
         }
-        cond
+        $crate::prelude::unlikely(cond)
     }};
 }
 
-- 
2.56.0

