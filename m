Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567A02EA16C
	for <llvm@lists.linux.dev>; Tue,  2 Dec 2025 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764707294; cv=none; b=DXL2GZ8YBi3Yq6H7hDpY3h7i3IZpu6DZgswVZXczIeuSkyTn3MCwQulq5hJ1elbi+YgAkS+s8ozW4ZHHNA6TzqnHldU2ixoZfRBefhtxToWjTLsfrmzHFHbldCSbEWZD3zjOKYtMXUZ5XYexUFtq/Bu/pWQOskrxAFiGrHsJ1E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764707294; c=relaxed/simple;
	bh=o237WR5t4MMOHA/6xwLqKKnBZN3/rDT9uVvqOcTiQhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JngMLvZQReT6jeWobE9wteyDf0LdUh8/X0KgBXOuhURoJsry8t4ZaxFqOkLI/UQ07DrzeGerh9PZKJggEQK0PkE3aqJQn3r0FwhUJBddnHktAxtHnhtC31OmV9Vwk+ClIFsR17znFRD38RcPfNl/+DDFKTkHbUqJxel7tJmavYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cpuhUgR5; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cpuhUgR5"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b736eca894fso446946466b.1
        for <llvm@lists.linux.dev>; Tue, 02 Dec 2025 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764707291; x=1765312091; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
        b=cpuhUgR5m7WvkXxmnWSK/VTzCwOQDbLJ7b1TXka8lZ29XdKkwooC3FuUbVRgbSbkVp
         CQvhR/S5UHRrB35ZbHuF1CniOHpYixpUwQ8wwNfDg2sMMjiXkH9y/IJ48Stpu3No4lz4
         kMFjgJ/KiWZ7ecX/SyozHFFXOkH0UEgxQVPCOAjkHlgmNa9jOs1lMLtOa+XGNJrlOojR
         HPcyIH92YbkJNeaRmo1JXsRMVKFVCtHSVreFyo8O3GP02U7x7eynr530K0JPZBzum3eL
         FgYhsNSqzY/UvNhr4oHbzFJScDcqw29Jv1sP4n1puSKSYK8fN0JJbX0n/Gis+MayAgJ1
         OkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764707291; x=1765312091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0yaLbdbXJAqPOG8MVf6C4XR3DKZYvDAAnU5HF8zvPbo=;
        b=dhqNJng82XDBPYZOGFaaStCGQ4yAuwYL1yNj6YAlWC3GsyZV70tkHdarnaPxqFvgTf
         0nLMrTVg9GDApMomaovQbdoun78ukheLeVvXlqLMQFQaFgN8G4X6so+mI1zvNSZRSftp
         rQStHIB71BKOos8i7EowD6ANn6M8h/KgZ5ygBseFBIsNL62BHpKJdY6JJlnKLbO20nBa
         fYRl2jfPJu/4BbuuLFhcZAIoJTo7ATSANarX9/L/Ux98Qhk6Oo0yLnrZvusN8QZnuUde
         AVASYewCDITQU8ujfWFtIIwZ09GPQPzUZ59cosKOSpJbT6PRBpfuQgTesb4vRWWrUku0
         ODAw==
X-Forwarded-Encrypted: i=1; AJvYcCU0dkjB1hmeRggcppnJ06Sz/nuMzO6XYXQuRVcZlV/FHFnvPs3icLs9RmO0KrQK2unP6YQV@lists.linux.dev
X-Gm-Message-State: AOJu0YwFLDiLEtDQCSaXh4NJXyNz2k839dcpy/13V96NEL04x+VkuNIc
	y2BlHFbR3ufl0TxemD6sJPNjR9gzMVR21CdYIle1J27h7F9FSaiCYvdXsrqMBx3Y5kpHiAEzXqr
	FWMqECe/ztIXx8VsYZg==
X-Google-Smtp-Source: AGHT+IFxbJTUi3LG/UxAzVg0DHJfs/QK8ZkbgJFUFzeew/1o2JPNxmwoD7ry+SYsd199ZxrJFbneEJ7rLxcSHeI=
X-Received: from ejckp26.prod.google.com ([2002:a17:907:999a:b0:b72:6a6d:5018])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9289:b0:b73:76c5:8f7c with SMTP id a640c23a62f3a-b767184bc4cmr5031432266b.43.1764707290453;
 Tue, 02 Dec 2025 12:28:10 -0800 (PST)
Date: Tue, 02 Dec 2025 20:27:56 +0000
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=o237WR5t4MMOHA/6xwLqKKnBZN3/rDT9uVvqOcTiQhs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpL0vXS2KTuDwIHjFPV9SPMyVgAzUi/MU12KYc+
 WMaROi5+LCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaS9L1wAKCRAEWL7uWMY5
 RjdSD/41DCALGMN7nyQxyeW2hZ9gETkyG8/iqH2wlmXrShi1r1+WB5woa9Xyur1kDN4fny2B3pO
 Y/5ZTPeLOcZ/aZiVYBNJA/D9HwDtronU7j5mUuxB0yWDU86evl6AxsKiEvJuzy96b8AtZ0ARx94
 IgGN41NqoWqbtVWQg6QlCkP56YIrgkpzGAS8atcgpDUrXNb+PE5wxdosva9Kh9do0WUVeLVeSKd
 BdEA9iG36VbrEo4YdJv4GRojxiLeD9CDzvYaGx6ijS8AsM1Osv5V66FEhywlu5eg8vNaBbPlcj2
 xI8IBYCVYdeDDvb1eKyZRLyLRwSvHfbhkMIgkLYycP51rfgkb9kJ8xzMWQGx4zynmLXzAXH0J0m
 5EB4i8kqfcM55bSpXOcCJzmldnW5zNj6/a6PmCC3hINHPjiHjIKkZmyQFZ+xyfRWH5U5ZZnvqIq
 RTDSAE/Vjex1zfELbKMrNyp4+efGryIeLo2hKskD8xXiqzcEDhKiNZY7C3d1jHSgp0uyZLRoe7e
 N/0L4pucmpbvlsisOuuXdvhokGnGK0s/K4V9WjZ94AoP9QZDTbOpFHNW6iUVflzEdZFfDfqHEs/
 ToADXA5Wr2TwTuT9flTY9YEdDg46zEMD7PVRz2llCMVxG6AYZdE+1gKeJLV9PHtLVfRe6h8qxrt EQLssKb+G2MtrPw==
X-Mailer: b4 0.14.2
Message-ID: <20251202-inline-helpers-v1-1-879dae33a66a@google.com>
Subject: [PATCH 1/4] vmalloc: export vrealloc_node_align_noprof
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
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This symbol is used from the Nova driver, so it needs to be exported to
avoid a build failure when building Nova as a module.

ERROR: modpost: "vrealloc_node_align_noprof" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "vrealloc_node_align_noprof" [samples/rust/rust_dma.ko] undefined!

This error is only triggered if inlining of helpers into Rust is
enabled.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 mm/vmalloc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46059f341ed0d46c7fe56bbe357b22..e086d00f04d61ebd481cb84e3dfea51d8a2ffc57 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4200,6 +4200,7 @@ void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align
 
 	return n;
 }
+EXPORT_SYMBOL(vrealloc_node_align_noprof);
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_ZONE_DMA32)
 #define GFP_VMALLOC32 (GFP_DMA32 | GFP_KERNEL)

-- 
2.52.0.158.g65b55ccf14-goog

