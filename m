Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941347;
	b=qnVZezBZjpkCuosSBpjjRMH6kTeS5CoQpcosQ4iYMQZ4BLIQRtVzC9NdNhf2xT0H9YKG
	 PcE5keISy0O8K1cfMIGXBzErH/SvgdOiAXqNE7v1AwrhvX+ZfNjFSzGhDAUsLtmLSbUdE
	 tkVZlHZTEw3GUb205IkYaxwHo1v3TssuFBoz/2Z5T5cybXXOzn2JrSStTCZr/atIeAIh2
	 I+BML66zHZCySX3Fn4VPZ/YO4puzYbt47uakPVTAr6lCXfemAkyXSe5u2cW7QEAlr2ytC
	 ytApCIlqXpc656Fpewjw5b40505AmTs74PdRSklWQ7w+IOe0Y9btLFxV2axUIBRMPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
	b=SqpbgZt9vncDOIrfttOiY6i9RlPqduoIqE+D3OoKd3Jl9w+Y+UP8EOVf0rrySV2cYaMT
	 l7fcVpeS7Ly63tcSpwOSizXdmYrZBXSeCqSh4K2El5UnYE5soHADFp2Ag9XXS4eeLkCPw
	 ThfrA+PBXS15TGgzjSkEjnxGwH8xvncPYKeZaZerizhNS25GI6eAeQc4iidPAkhsYWSYg
	 qP4QJQbSL0jChiVw3rw93ul57ex4xQ5y1lNdDDjnXESb8covcRSRo2V+hCgeD76z8NJuz
	 89fRVX4i7yHx25QDs/sMhntNQOIuIwHVEzE+pUjPg6qezlOKUZVPAfxBbJTThtqn9Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FDKUiuto;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2684606A33B
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2684606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FDKUiuto
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-378722fd4a3so214595eec.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941346; x=1795546146; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=FDKUiutogjO6mLGw2kk6BaZ/4xHSwxlQTu9nfyC7YM7A5ITTVNQAGkmlW+FIrYoE1i
         8gqsbZmDL2XbMEz/8xxqLW5YTq+wXS6vgkVu74glbWfesh2kW6y30CAZIbLqlZZxSAW/
         wpVNh3N0Y2s4d6Nik7IMPmoEMlQgSesPg1ce8w1iX0szWqPpMyX7O2YKNEJrpzszwcMk
         bLqfcz12Wwt1gB9RCFwwyQvUGY7OBmLmmDKyd3SQMUNjtpVTjBY5F7YPb6j3RpBFYP8d
         EE/gLzOPhfwXEGagJGYnJfpsrSDZQpW7PiO5IS0CtwAVoNasOgz/c+HsmQm7yIsZDPQp
         4iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941346; x=1795546146;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNOZ8QyL0UheBANe+7QNGXLjq8SQVqhuN9MkvsYBKOU=;
        b=wpK52oxbIqCkseeXR8EpjeYCxVXMxdL37zNFAmS8vp69GW73mhQJwufhqKbzFN19p+
         BggwA1NbmrV6EET3DWGbNHhs0Vi9Ll8HVkfWfh1u5KqB9f6blJ8CqDuBBjdyY9Puhjem
         g2IOLrRt9aMH/VSEzvkiIPHgHBzTYVbUM5PJvNxVoaLqlJ2CAQjTxz9ioOZq2z/4RB/A
         lKnzKJjuODO2uUxAHU1nqrN6bQXwPxeuHRRXi77YlUWsvf7a+a61TmTopIgeXz1PANRp
         S9MqIg1aifEaewrDNBPNMbJ6cOkpaTuhHzfHX9idHnZS99pwMpNQXPFNWKQ0GWAkaWDI
         AVdw==
X-Forwarded-Encrypted: i=1; AL+hErFRZKSbDd1+SW6dIZJ8n4AapFHOXZWUzllIUKYgylwol/noVA6plzvS0lNYai0+nUs0v137@lists.linux.dev
X-Gm-Message-State: APuU4Z+8OZvwZ2v+sowhOn7H3vl1mM3aJEK7n9KGTRTlDLlm77CrMmi9
	Rf8O0RvrBXe99bduGn35h/f5sfGsRuGj6RrauTyXTRCaxqIOme62guzuUDQDTTU3P5KVxx+7p6z
	cKlNZeNXSDg==
X-Received: from dyvo18-n1.prod.google.com ([2002:a05:693c:41d2:10b0:370:f640:2508])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fb02:b0:36a:3453:a356
 with SMTP id 5a478bee46e88-38281b03e42mr251247eec.36.1794941345512; Tue, 17
 Nov 2026 10:49:05 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:22 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-2-irogers@google.com>
Subject: [PATCH v14 01/23] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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

