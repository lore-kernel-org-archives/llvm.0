Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102633469C
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118467; cv=none; b=jK21IXl2HzqHcMsZfEdKz6Bb07XTc0ufjjDRjMAo75eq/DlvkreEpHjDZv1roQZJYFmbFmvzDwGvh/DzZtaajah6kSp25BQ8IHsqA8btusE5Mh4+G2WWvPJF7I83KzQra3Hr0naPXsR2ZTNB03MlYqZVfk4MqWPu//FDqfpTNr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118467; c=relaxed/simple;
	bh=LTE4AJa8TogtsWMlXBs5xjtqn4b+TaIqmp+N7wyBtJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=njVDpQW2xfMdQT83OhbbFaIiUY3UuWZGnScLtnu7snn1H7yxPqtdm+BfJvreUIuDamiq8e2ml+gH/kiKLxONQNM4uU7KvClpizGG1MxMtYnPlU91+m5qEDl4vPvPULTCLUVukc7nJAgcz65QmOdgYjeOPxdPN4zXSmTQOE6DLmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L2HXIi/A; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L2HXIi/A"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-65813cc7ef5so4184199a12.2
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 03:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118464; x=1770723264; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FR/i+eARikPdIZxYew6is+8VLxNQJTGYF2f9lrQ3EtM=;
        b=L2HXIi/AeoG92j5eX+94yjhig38EeTNNrJcE3eribHiP1Z3cK9xisFZxL+WBMYBrHv
         NUP7vkjgOeVplOPYynyv4v6WG2wPlaTooWd18Thf9NR9tOiJm+x0hKW6DUxERe8zAzJ+
         NgXWdObpKJQlmzsDv2xYc3SNmXrA6DFYw5Av78ZjOZDiwFl1dPRMXZ8IlWge9LaiPZub
         bH7C6j9O/pw9LXajseyKLDIB9m8T/H886hF05eZgt36EmKf+mr4+CMKxrdLJStZ/ovBd
         bVB0KQ8nr4wz4T0O7dgYE7l7LHzjKm5cJeWIWxPO4MmS04k9KRT+ABMoDCCc4awNSjBL
         vIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118464; x=1770723264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FR/i+eARikPdIZxYew6is+8VLxNQJTGYF2f9lrQ3EtM=;
        b=jfjJ08jk0/XcLKNrXG8pscZvqZ0T7OKDBvHcKePqUq0884xiWhwGAKZK2AN1oCktTg
         UNb0xR1XZNdRXT9+fiNVbmjZekJy2tbeePQsIOuyMKo93jpD4RKDw4lhjcT0kR0HlUIw
         HSoNptPEkGV7Ve1qL/58XRt9lsjCPVI5RMK+uZXOu5zBUce/MbQW7mdDuyqMOR7p3Pu9
         WmiLITLmvCQzfK8dyTPSvCbYbsCwmVOVmA3mEip0tHZgfSw56kUAPXuqZe/9WF8dhht+
         ASVcrbJTTIDYjzgedUKGplV0nXtxJ+jDFfriDOC0/aO2/4nlDGe/jXrfBRAyvDOr6h0y
         VTXA==
X-Forwarded-Encrypted: i=1; AJvYcCX+uUG5zYdHhi335TghsozClnjcsZe8htv6XscwiuAWftk5Y2ankuyigQSWtPTB6lU7awxC@lists.linux.dev
X-Gm-Message-State: AOJu0YzcqH+fu+4Ye9FXSEQaMtVgBJb4NvUeZacqY9UIhX2ZhvBBIX1U
	krVvqyifaeFj/BKIeX4yxlLAAr0pjzeeTiA3Go5lT5qUCTb+5pNVDx8ZxDV5K+XRvnDyl+3m+iY
	urUzWXpzrAJdALQvKKQ==
X-Received: from edck20.prod.google.com ([2002:a05:6402:3414:b0:659:31dd:52cb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2695:b0:659:4383:c491 with SMTP id 4fb4d7f45d1cf-6594383c6bfmr200660a12.33.1770118463947;
 Tue, 03 Feb 2026 03:34:23 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:08 +0000
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FzzjhSQNQHIbmcapK6yaktEju2IYPpFJD84GeqRslPI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd09+3ffdigiyO2/yaYtXtLiJKV4JefwxHsD6
 g8QYpJOBz+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdPQAKCRAEWL7uWMY5
 Rn3ZEACPLsut+e2SxZtW2kE96JBHj9IsiPLxVorIorli9qVvROiAeojumIiArRAp1voBxa9BiHF
 LWm7/7tkVv4Pb5qS9HYATKtorNFgunu5fSYL+Ybvytw3bTpze4jLe5qV3lgnOIEGHkjYr35i9b9
 se6vm0FtXtYcFLV3cIz+TnswQOEUo9RnwLzPLlY6U3mzKQk+DIQ7J3c8p/9Z5SCvSy6dJUCSJMd
 TjqQZ780e7J87CiLHFqHLabrjyMgdzBQjumAEdUJtXT1lSjJyky5JjOA8lAH/Fc3zie3LoPMXCy
 0OZfvtxwd4uET0cX1OszPfbBV0wMNlL3RejRdb0SZoXDS+2e8nPT9EFeY7wry6jXsEYIj0Ars+o
 XnYdBzBqXepyP0wVxUX15DwlpGtldajTPlVNcgP+tZotK+vqXYRRN2p9QjrMZiENvc1Q6bLmVyF
 D+KGm9tuJgKaCdLi887JUpYshggFLO0lrvJGGZb5eCFtIAdAR7T/LrbRGxBomcERILGtXbQHeuR
 1EyOuFeN9V2sWEPS35jlR41VCeY3DIU5+G3zg9eoSguH2wzcQ6jYTyVy75DhBv8loGVQYV9f6+M
 JDN4EOaLwhbxIro5SFcjPzVDMPxxA48Q4QhyWXri+NX4Dm6NHKDX42CavrWJTc/eX59WGZDKuOS 8wKBxTR4AClAIeQ==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-1-beb8547a03c9@google.com>
Subject: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

This config detects if Rust and Clang have matching LLVM major version.
All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
matching, otherwise it may generate errors, or worse, miscompile
silently due to change of IR semantics.

It's usually suggested to use the exact same LLVM version, but this can
be difficult to guarantee. Rust's suggestion [1] is also major-version
only, so I think this check is sufficient for the kernel.

Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index e95d43457851862afc8313389777e4dd9348c178..0e900d3d8be7874a33e0f44754a8d038e68d7e65 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,21 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUSTC_LLVM_MAJOR_VERSION
+	int
+	default $(shell,expr $(rustc-llvm-version) / 10000)
+
+config RUSTC_CLANG_LLVM_COMPATIBLE
+	bool
+	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION = $(shell,expr $(cc-version) / 10000)
+	help
+	  This indicates whether Rust and Clang use LLVM of the same major
+	  version.
+
+	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
+	  LTO) requires the same LLVM major version to work properly. For best
+	  compatibility it is recommended that the exact same LLVM is used.
+
 config ARCH_HAS_CC_CAN_LINK
 	bool
 

-- 
2.53.0.rc1.225.gd81095ad13-goog

