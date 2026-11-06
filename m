Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948634;
	b=ugrJsIHBTzDx1RWuZAJh/dqwBW2XwPqBKEvSMSoywSpAVeEMkEMlbcTnne0/OOgsMlWk
	 MqBJDKf6ALXoGveZ9U1JE1MM1PKhWtpK1iY8w8jXdUgcXPYfi24goMh85NVatcUYVoW1P
	 zX72uZagtWu2+SjuqQpwff2RXeOlqaRaZRO5ZaWRxQlpLkpc4kl5yL+HekLR/Lq3tae/1
	 gDuZE6/RfU9skSt1jbeTVu3/4z6dB69I0AfhWww/m8adleY6L+3fx6HFocwJNxJeVTJD3
	 X83+m7VTc1lOd0rx0F2zCwERjQKpXKOS61wQoIuDK3JQMmdOjjtkXyjHx/cO5KF5DTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
	b=MHKddAt24ZMSahaIgAVs3QqBMlDl0yZvtg2SG8Zb0yh2ozmCkrj5tU4y64t/HnkilHJy
	 +SQYEde42D2FBtJV3F5rI0xoDAjCtUj4SClJtG0vuOukSXvKn1UgvICjzyytouj8uJLi7
	 /MWXjtnDjKzU1Gh109b/7bICru0fqjE2f0aI2jC5/N6/9L9b4BjSZlGuYDHVQdie39lL3
	 FKrIrIQAKDJvvB92iJIvKb5nbRdHTE4WlxBUnuuJ7Mwa9cn02TKjWTzSJ5dYPnoWvBRHf
	 VHKe+OD31pijf0C6w4wf1ZIbUgKvnke/dXrrEqc01iPIKbMX/3A15vP5tsh9/nxTDgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FZdEIllr;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F2F606A338
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85F2F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FZdEIllr
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso671551eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948634; x=1794553434; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=FZdEIllrl/0249DOs7o1TcCXkz4BqJv8l7NCQtYq1Kdv2Ov0k5I/wsXof2vF1QqMzx
         t5U04AdOn+QzACpj6YyUzHJzSTmNhoygK2CafM2/JuMlOv2+3/QZUCq2yGd/G4bmAVOz
         VXn0ryrwm5J8Cb3wH/py3Y8IPAci0Bw6l59blbFC1hyM2B6+fu1qG0RS04yTCjK0sXXr
         ytN4jGky8QbZ6e1e1TU2XjCIwGuwKbF9uddy1UMjOHKKE8VmD1rcUrhQ1tNtLzvZMk20
         m0wKZKfx6jhows3wEwv368qSEDoApSNeabUS+ylUcYBmLtnerhAtglMzuLu6OaaVv3kT
         1t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948634; x=1794553434;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVkLc8xSyhslD11C4DSvZnRo7dsv6FWhh8v0TPGw3qA=;
        b=bamjqNjmhfmsu4QtTvQnpQ3WQFvHZlm9r7p5csBJy9ZoLpUvBaf7n/JjRSHoH7z9Kr
         ss7/70ZvNThovWr61dDE3ndgQBUUw00xO3dXnwWe6VVbpBmKpvRueDIsWUv2W1AuQHtR
         DgUSUOpFoLlJNkVXL/e6Dz0ZStflYaQGPZt9wODT31DYcIC25Tap4k4ZJLUTAYtBMGYx
         LZsf/FM9s5qvtsocZof6x006wo0EkHT2IRQdRMbg3V0wq6E2RnbMDTRw9DnSiyyNa9m0
         O8XntqlSxbm0bDaekamerkqNw0wwEj2juffoybGD1h+cvF3iS2QZnh3Gq/DwVzuLmmyv
         x0Sw==
X-Forwarded-Encrypted: i=1; AL+hErHhj9L4rbiV9wCVLPFn66qAHx29Zex4n126G6GuwmVPItpMvKKNipWUUwmMhIdVAP8Bp/fV@lists.linux.dev
X-Gm-Message-State: APuU4Z9YAJ7yZyByUSG9vbOwwFgcPc+73GEJxavp0rhLLIh9D4PpX4DZ
	7XtvmgfN/rcjK+Rtcv8FuWtAZZn7SRGLY9ROcUtfLgHsSW9ccrMMLu8PRaguYA2CB04KN1FyqN7
	jxVcBNM1FzA==
X-Received: from dyvp21.prod.google.com ([2002:a05:693c:8855:b0:369:f864:c5e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:40c8:b0:36d:2b02:86a6
 with SMTP id 5a478bee46e88-36f72cc1ae3mr2730314eec.4.1793948633131; Thu, 05
 Nov 2026 23:03:53 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:25 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-2-irogers@google.com>
Subject: [PATCH v10 01/20] compiler-context-analysis: Avoid unused parameter
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
2.56.0.455.g6c5a503b38-goog

