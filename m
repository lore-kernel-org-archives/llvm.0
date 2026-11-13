Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588122;
	b=w0ofFVkkWEQJT3ONjdvPJnk1TTi9NwfYMbPbp0g+PrCdGBqZwcBN6W2AlexWcqyOpHnl
	 8oEWkEUWjPwReJXTuf/C1ztmTlCY019RLSPge+VZVei5auz4rEJzn7WPczbf1J61BvwIw
	 gkX6Ss8vxmZLlCvY4pxOBm2NDyGN+wDgknwvPhBGXWX+BPW/bgayyOq1jrEZcTv+aC5Hx
	 VIfzmvXpRnLvG3glktsRzMD7iInocv70aX1wcqpQqCVXKS5/f85HyzBp6n7V1ZDkln8ti
	 60OgxNTocPtrX/szKmgHJNsTtOYj8HsdoDLioYVZr5WvrtpkRotrN+DHafJ0xitt2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
	b=AhJzOWPuGnEyz26KB4hgZzO8nuCI7ZniXyFFLCbefn9DvrV30GylXWoxbiHFvRCJ6kSa
	 cPvxLTqXUuW8USnVLCDor+Zr1l7/e/HNwZKRn7/ZX9f9o3vJsk1ucwGzVzuNok1bTVxwk
	 XPDMwcHWEzuMGW84oFB/kFZtwjezJKeA0+VxEpuROmE0/TEl7ENpQeYJKgADQl1VfRPvm
	 y/qEZluuhcgvyaJ8SB/oztJ2HLDgHNxBdypO83tHzcc3mtmN5Wi6n17sjcDDY4mHx4ZaX
	 0tv5v6YmjOZoeFeKmH+eBaEYu7prW8TtfmlQ2LhVHhaHSdm1OVxPGlbHp9GrK65J4LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="TtW+6/So";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E496606A8BB
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E496606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TtW+6/So
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b5b49cabso1073549c88.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588121; x=1795192921; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=TtW+6/So/TPpr8X4H/th9ruLP4+WviF4fF+vzCbaNTgkM/4QDWDDsRjtEGPvgG6PTl
         kX3UNfN0IXy/7zxBx6n75ZHK4gAw1W6VmmP+ovfDTV9oPdQoG7kqwgCv91bU/j7Jt4W+
         Ng8RXYTVUJguMYEJQxa6jyPVpLRp6gcYqEPrSNuCmioFuUnzWqOPqE87cobNaf1f8EMp
         MOUql9KzdYQDJkRJUjprV1ZpdyocgTJW6PFNafa9ZkoVcLNBSWhLCbj3ea+T+UrUFVMq
         Bq+Pk9vx0Whuu1G8rtGjcCsEpqs7bxuqAQix5WaASq9gM74cfS6VXrI4tOcNhmB8trsK
         WjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588121; x=1795192921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=YKJjHiC+O65TlCozPq2bw17muaGXY99uvswQI+z8raTMg9PZHgWm4w/+nvBOD1ZUg3
         vaoWkVVOSDhr1onH85SkSAgUBKkvVlqQFoBxxQnIEQVtCiCL7tUBB/QB0gUEMUIvO7gN
         KTIhAYRILKXHb+jxc2Ji2OrDBovwK39XNj96jc5QFfP+NgJtHplhpsIQoBf9dcclVmz+
         U3SRM+2Noq2ubbyEZBhsdoQ8/SxPKU5Pg16++3KxfIEUoXCtaOygTvxqKeDmZ8u7ogKZ
         4TK2y9B9+NM9hjHp/RP6DB1HVsRczXmDMqZDYGhPQwhxddOdGCGyOme/qvuDQC6xV3ua
         y+lA==
X-Forwarded-Encrypted: i=1; AL+hErGuJBImLvnM0rM8XF2VAxIc7//4DiQk7kg0KbQoknLg3aIvJ5lZdFwioYIKzvHtfX40unQf@lists.linux.dev
X-Gm-Message-State: APuU4Z/HarB9KDDqjNJmfWt7h6FRUA6FuSgL4TeyXPEVlV1KS/dTfQHb
	xMHmMotG/hZT+If24XzTKkNTl1yOHZtO0Dx9IfOQAx2PFw69xq5hbv/yFqLgPZoNhiB0sqM+HOi
	OIHhv4R0c2w==
X-Received: from dlep4.prod.google.com ([2002:a05:701b:4584:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:41:b0:1b3:90f4:499b
 with SMTP id a92af1059eb24-1b502f8a8a9mr3200571c88.0.1794588120968; Fri, 13
 Nov 2026 08:42:00 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:32 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-2-irogers@google.com>
Subject: [PATCH v13 01/21] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Reviewed-by: Marco Elver <elver@google.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/compiler-context-analysis.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index 8302ebc2ea8c..024e303188ad 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -243,7 +243,7 @@
  * alias as a function argument).
  */
 #define context_unsafe_alias(p) _context_unsafe_alias((void **)&(p))
-static inline void _context_unsafe_alias(void **p) { }
+static inline void _context_unsafe_alias(void **p) { (void)p; }
 
 /**
  * token_context_lock() - declare an abstract global context lock instance
-- 
2.56.1.703.gf848ed807c-goog

