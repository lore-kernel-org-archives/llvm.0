Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7373264EE;
	Mon,  6 Apr 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469546; cv=none; b=X2epPCZ1Qu5xRSeTLln1gbfzq+zKv9GpOgmrNLLJ/VOVJ6WGquvn6P0Y6rshS732leYQJmIqRQyuBj4yv3mgG2rxyw9MPDPhVy6Q1hX1TuuFWfQ5i1oLKh/s0IERE4uKTj3PWVorTv2mbwoIT++1FgZ8fNS4dhAwekTS0+9OFdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469546; c=relaxed/simple;
	bh=cCG/Ia0MXhHnCsSP5XkXU9P8PfJ7suolvSCocOM2Pog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6NxPE7BH7urNRqrnXVIDP722P1Vy2nOClcBpj+eDJxKytUeCnksjXjRxlABoL+hWqG8Z/elfydSaxMH9nmtpOP8JzBqhNDPTDoaiM5fggmYOcf1u6QMXCXIxsM0LR3sQ5AD1ZpS85p3NueR3gj9uvfoI/eVXF0Vm2r52x+gLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXkdXySH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXkdXySH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A734C4CEF7;
	Mon,  6 Apr 2026 09:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775469545;
	bh=cCG/Ia0MXhHnCsSP5XkXU9P8PfJ7suolvSCocOM2Pog=;
	h=From:To:Cc:Subject:Date:From;
	b=eXkdXySHBjaY8Uwu09G1r6L+87l+YSnZHJNSLuKSH9gsARd+rlWMErscKIEPfIpEm
	 d5bbMtBdQ/nSg3FdNMstLAh5GMHk9xHr0d8j+0ogn0pje4mPiEUhm9vJLzue77hN4D
	 cifswAv5XKRkA1xnzyVwtXXvfmSwEwz5m2cQyMIOenfoB79c8IBxI5JOiXev43pBel
	 pqt+D4R/vKFs72vw+xm6FBTCflbYW9XB416a5dRJOlbdux7sqZ/BHm7C+k4KhmF5mC
	 OCqwToW6m/vQER0QpK72ntaJcFYdN3UJfYfRSZML/Mu5dW0Orsyv84prteqMMnl3Ox
	 sN6SIb0mysngQ==
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
	rust-for-linux@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
Date: Mon,  6 Apr 2026 11:58:19 +0200
Message-ID: <20260406095820.465994-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].

Thus update the comment to keep track of it.

In addition, this will help to sort new conditionally enabled features
(i.e. `cfg_attr`) around it appropiately.

Link: https://github.com/rust-lang/rust/issues/141727 [1]
Link: https://github.com/rust-lang/rust/pull/145664 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b48221a5b4ec..0fa9d820fe7c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -23,7 +23,7 @@
 // To be determined.
 #![feature(used_with_arg)]
 //
-// `feature(file_with_nul)` is expected to become stable. Before Rust 1.89.0, it did not exist, so
+// `feature(file_with_nul)` is stable since Rust 1.92.0. Before Rust 1.89.0, it did not exist, so
 // enable it conditionally.
 #![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]
 

base-commit: 232e79c72f572782434b43d0fc72581271cea7f3
-- 
2.53.0

