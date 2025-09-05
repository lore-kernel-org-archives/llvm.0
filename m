Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5276225761
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 02:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757040884; cv=none; b=swzylcT9leRfBVNjnwrOgUJfSO370/+fFVVi+EODP4wdIp0u83wh/Qb/pQLQaQgtW8lC+1r9L6PlNCOgETwyIeWkO9ZIzlywM3v57lTZe4bL6koL/5G7vWwGRYspNgyFAO1VOtX6dyddgiwYyyiLC9PaeL9rzvxncRpxmLok+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757040884; c=relaxed/simple;
	bh=ROxDYlDbZdUxv6mle6mrNjV7kimAUJqp2gftch85SgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRq2t0mG+DhjCgUYad367wGzxQy8y5JmdMbF9BnvgRXq0wo2/L76mkZtX+4wk7dQ3TPPkGjctcVPT4izWsNY+1hVakwCu06b1mzi+nfrbJR12rxlOXAWg2DoMkVdyQyc7Q5xJs9amtzhFljmfygl2M87f2iLYKlph+QWXqzIWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ITrahRRh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ITrahRRh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so1115061f8f.3
        for <llvm@lists.linux.dev>; Thu, 04 Sep 2025 19:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757040881; x=1757645681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPgXy/JSV/thOQffLkJ+mMtDrYm8eOUlc8683wpwWUY=;
        b=ITrahRRhg3OSKYtoDoZhfQUFQa3sGN3oXfISeQju0TzvZv7TDRFqU1LGfVWCMAFewW
         NVD+94fvxKDFJm0So4Ho9Hye8fX/bapnsfhuFTe2mzvtGaGydqq9Ji9d2gdJ/R7DdCzy
         TxJF60H7vcKZVGzCs/obeACp5P5bg2C9nHVUoxKoIl01PWJX9obnGJIUDhOvDXTtDojI
         NULpMxjvDwWC/eUw4pwMFJtdom0rfi8yPMQV2EfDUqzFhTwlSP4reCrt+sokAw+/1aol
         E7dYmmJ49ZTEn9B0WKIirpbkw+BXFgEM0k7ptJrm+WpDlpORD6bXvuFE5LEJ+NDGPv8+
         GB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757040881; x=1757645681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPgXy/JSV/thOQffLkJ+mMtDrYm8eOUlc8683wpwWUY=;
        b=vfQJktXqeXzIIYhvIzxk0tN1X9lUrW0ojJUwiFesIVBcKdeNyB4gWU4MWDHIcU/sP7
         jhh8OMK15+jIT3NvN3r+VxHTg0+UgZCYr62oP99ksXTcw0eeQtygnNCnuaVJNJzKkfdm
         i8L/aMrs8oqNfQV4cI2xBx81jrIJc0qzjk0nHHqRTaBa3Dds3LDZvIJsy+JTPXPDveXr
         xkEze6rMBr6HC59RcmUJmbvMQEzo+ngYtgVcSTrBK03Rb8nbYOa3dwQqJUUqRUy60gIh
         tgh1cC2hjrQ4JJtpoKJe5WITvZi9Z3ERTgdQRAMdPS9Bh8/Nd1qV/r7h6GBOoV1JHL1H
         iOCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfI2w/DiyGFGos8ZXpRRVLBsx7DNjhJR5sGANZsuqM8GEz3RFzIl5qimwBO0BrxyRgU+yX@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0pgS0NqwmMR3ZUR80wuCknHiAmBobZ/HqaBGIhp0Annc5t+8l
	IQ1wHem9qxUqx+g5ANFfTwcPolZ6DszSf8xHN2Dn75UDWtyaE3Z4jPeGjFMGZRkOd/w=
X-Gm-Gg: ASbGnctzbOiKNIIuSMUubi76MN4E5idHOIHIlNdIJfOucLchZiQTPxdXI7Xnq5/r927
	inXvaETXMEnTdkFZkOrYRGf2DPtHLHyZgxvwOXL3lYlLsKsjHEN1/sLsCmxBMlSZbcYihwPGQW5
	xkNhmrHGujYP91eYyzWpqdispqipNDto3WaEDwUrBC1NKIDq0swyWjyrb1t+6eGBv6uHoPCw2iU
	e49FnKVKjCEs3hpesApwybyOEugqdPV17KyMNR31X2+IBclgSXgKQu442IwQ0ygIa+k0ljvTlC4
	fqYQ23zYIL1UHZFjru0bzT21Br2F/m0U3XUn18eDm8QPzHjZAHEvxSC037JcIXf8sc2QFQMFkTv
	M/07wC/Q2AHoYQE6WkNWLEakNhJGTZlI+baO9Qw==
X-Google-Smtp-Source: AGHT+IEOg5/gh0SzZXGK8iRIkbBd3Bbh7F26L+S9OdjDBKceU62A4KxoMCAcN4H0X+hecav625Lmmw==
X-Received: by 2002:a05:6000:25c7:b0:3c7:36f3:c358 with SMTP id ffacd0b85a97d-3d1dfb11164mr16205970f8f.32.1757040881025;
        Thu, 04 Sep 2025 19:54:41 -0700 (PDT)
Received: from F5.localdomain ([121.167.230.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b520b545a96sm457225a12.20.2025.09.04.19.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:54:40 -0700 (PDT)
From: Hoyeon Lee <hoyeon.lee@suse.com>
To: 
Cc: Hoyeon Lee <hoyeon.lee@suse.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	bpf@vger.kernel.org (open list:BPF [LIBRARY] (libbpf)),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [RFC bpf-next 1/1] libbpf: add compile-time OOB warning to bpf_tail_call_static
Date: Fri,  5 Sep 2025 11:53:11 +0900
Message-ID: <20250905025314.245650-2-hoyeon.lee@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905025314.245650-1-hoyeon.lee@suse.com>
References: <20250905025314.245650-1-hoyeon.lee@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compile-time check to bpf_tail_call_static() to warn when a
constant slot(index) is >= map->max_entries. This uses a small
BPF_MAP_ENTRIES() macro together with Clang's diagnose_if attribute.

Clang front-end keeps the map type with a '(*max_entries)[N]' field,
so the expression

    sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)

is resolved to N entirely at compile time. This allows diagnose_if()
to emit a warning when a constant slot index is out of range.

Out-of-bounds tail call checkup is no-ops at runtime. Emitting a
compile-time warning can help developers detect mistakes earlier. The
check is currently limited to Clang (due to diagnose_if) and constant
indices, but should catch common errors.

Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
---
 tools/lib/bpf/bpf_helpers.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 80c028540656..0d9551bb90c0 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -173,6 +173,26 @@ bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
 		     :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
 		     : "r0", "r1", "r2", "r3", "r4", "r5");
 }
+
+#if __has_attribute(diagnose_if)
+static __always_inline void __bpf_tail_call_warn(int oob)
+	__attribute__((diagnose_if(oob, "bpf_tail_call: slot >= max_entries", "warning")));
+
+#define BPF_MAP_ENTRIES(m) \
+	((__u32)(sizeof(*(m)->max_entries) / sizeof(**(m)->max_entries)))
+
+#ifndef bpf_tail_call_static
+#define bpf_tail_call_static(ctx, map, slot)				      \
+({									      \
+	/* wrapped to avoid double evaluation. */                             \
+	const __u32 __slot = (slot);                                          \
+	__bpf_tail_call_warn(__slot >= BPF_MAP_ENTRIES(map));                 \
+	/* Avoid re-expand & invoke original as (bpf_tail_call_static)(..) */ \
+	(bpf_tail_call_static)(ctx, map, __slot);                             \
+})
+#endif /* bpf_tail_call_static */
+#endif
+
 #endif
 #endif

--
2.51.0
