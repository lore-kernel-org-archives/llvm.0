Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1F2F291D
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707298; cv=none; b=qA4oSANT706MN80XU5HIKfNGL40LVCuAGh2rhc9TqH7Tso1Mxpo50TNBE8WpYv1EPBBfMCBPYRWuKdqQPOGvH+2AxTNiq32DdVM30bYrHWaHmB7G3HSGUWHwkhhS/ms1D3GbisEcGMI0fO+Kp546O/NkwS+IXpZl319s6IdZiSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707298; c=relaxed/simple;
	bh=lnkOuIsj111D22tJJih/W9w2NYP5jJU1fAP23hUjMUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GKNFBNnUevlRD8PbbnAhGon/+bQA12lmgzP6HENx/4ZqAYIWCzx381ZLgYWnwaUTsO1irRfgpU644dP+vXCfKMBkllrbt51zU0e9RLNMxK09R6CnAx2QGcWC8r+2C/wdxj3Exzxf2bqstuLrsDL85u8lfyeP20J6zkp1VL2enP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m4JZQ+Gy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m4JZQ+Gy"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42e2e447e86so2102449f8f.3
        for <llvm@lists.linux.dev>; Tue, 02 Dec 2025 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764707294; x=1765312094; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzxkQHE3Gn13GhwfvC/ki50S4oawaHmvikFNCkwElMo=;
        b=m4JZQ+GyYk654yxbq+JCmEPyl2C0bclhCsqmhGyb1XcqOL9Ps6pkIzsOGExRlmAfk9
         ow/+EBZmfI78KWAevYDl4isEY4gnyyUgnQJhX1g9PrOz/K3IpFzgBi/qJe2LWz43DfxC
         jdx/sXKesLdUX2IKKAWV10zELlln4lePEJ+S+1tqf8kqno+jd5tFgBYeREgj+6VbrsOH
         N5xdSAFbsoqS0mTf1tLqOjlsZijDw1s8XTnLzZilxRCVEzy6dDxlIgnDdOpYiXlFmGuG
         CIOMTYqC3iyMo6zq6wZ5tKB0lWRTDpdY8480oXpgTl/HxjBROGEFeNqxUqNSAcGn0e1c
         uJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707294; x=1765312094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzxkQHE3Gn13GhwfvC/ki50S4oawaHmvikFNCkwElMo=;
        b=GuJOfre+jpS3Ll8XFS1qauNwDSIdqVtT55+O2u5SmVrImHD6BGs3GmOZmdd6uKIBDh
         D7Ih3KSV1gV3jrGjU/FY1Uc99COlVEJYZDOI+htWMePQco4DAnLkW9V+k1lx47Xzejyw
         h7eKi3hEx6+idD6ffTfISaxVSpMAGB2xWoARlPoWgWbyxehf+GDIq7M/2xqRzeK6gog5
         OHlftQc3cTrzinkCTwNL+H1pQ0e+Rn2GjivyJPfD2ZOXSRHdLasR/OcDP+XyKYFgL4zH
         m1I9kiX2E+5/koArr3iSnKkpbHuDJxdIhBscGDormflLA4ghgsT1/iHAhhxbV3Yvy7q4
         QvHA==
X-Forwarded-Encrypted: i=1; AJvYcCU59Bwasstd9ZJZ3Izscg+kOX1If9wp60Jzt3r3b81f04/Od9bP8pxQ9+x3X/yv13A8ygjz@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6H8/vFoM0T9OEWiiatw/o78Mh7Ai/J67GQk1DOhkKg89bHQci
	JvXEZ+gd8ZJPWWRHR9cHK8u2fCorER54adQRhibd4SVPPNHaWQPGtfxruFOprChMBM9KBXcLxYs
	Ceo3Mv5Dk7pEAoTZvTA==
X-Google-Smtp-Source: AGHT+IGSHYTHK44+Q/MF6SQhcldsTZ4F1l/P7eqEkOlosij1EkIh4u00KVkeS7lVD1xE0j+H0LySU44dB3+wV1E=
X-Received: from wrbl4.prod.google.com ([2002:adf:a384:0:b0:42c:c2d6:2ac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2502:b0:429:d3c9:b889 with SMTP id ffacd0b85a97d-42f721fc486mr463737f8f.1.1764707293233;
 Tue, 02 Dec 2025 12:28:13 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:58 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XPDdA9qRPdYsgm5Nsj04MFhk3BGo//T0H/GXZaSfcnk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXEU3vfH0ez+fWa3XM7NL47DJ51BTPUHznb
 cVT8tuwz0eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 Rr5AEACDSrcLuNKFX5r42YLqnad/vd877J0UJtGVWFmfriVe5P6Y6yqMkDEJ4ZMuWqwR0CnkulQ
 iiVfYamb7odLVlOubnoHlMlj7AWP0dyPUvMSZSqNcAWaYbGW483ZRaOxEZ4MVgvv0mP7aVNfzTR
 AXKUkJtJQsTI3jC+m/+ONvFAwhiG/+ExbJiOQBnFIeA/dL5OLSlAzjBaKqkw0Hsjntsfgglh0AU
 gB0JD/vBPuKmQIVm80pytBPt6BxtuYQkBmnCsIF5IvJhOPmqYIUPGzEKdP/jNzFe+mQ1tYdDU9M
 7OjSUVfVipG9L/SkRnOOZrtyBAw3ajN898MH9PL9BL76iul3Xq5SYqIYisYp1EkVSeAV1nI1nQ0
 PVAfjmGqhZJAhvdAiFK4JJe89ZSYbg8lS2SM2eCdcS/YvCndmO7zlcsm4tN/dEbSsIrdJe9t/Jq
 3T2AaP31hxuZkqIDVjDWYWot0m/f4ZO1DDvtY2NCpcCuooX/eqS89rOiC+QPd3ohGU3j6DpUhyb
 mfcdw6Kb2qywcFJVSyoT3wGIFQxVosTnahQ4kEHggZST0Fg4rfiMos2UpeMS03pTZ2tJtDFKVcy
 ZpVWYPeUkijjVyO5ttcLvgrMtnNiUzhdEYUK8ju5sJYNmGueW9AmruIzbdTRORaqrYkAvlfEdrO 8DhJzFKcq8IlMyA==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-3-879dae33a66a@google.com>
Subject: [PATCH 3/4] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
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
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

This config detects if Rust and Clang have matching LLVM major version.
All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
matching, otherwise it may generate errors, or worse, miscompile silently
due to change of IR semantics.

It's usually suggested to use the exact same LLVM version, but this can
be difficult to guarantee. Rust's suggestion [1] is also major-version only,
so I think this check is sufficient for the kernel.

Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 init/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..d35d0ddee573d09997087a0f99dee7c7c9a66ae3 100644
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
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT

-- 
2.52.0.158.g65b55ccf14-goog

