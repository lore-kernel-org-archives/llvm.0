Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0953400E0A
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 22:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189094; cv=none; b=dHi8MgoodgGTYZic+lJ5KGSpFbErrNNMIE4Lv8/TIDgvlyQosNHbdRyv0b/P8f41e2J72cf+fiJ5z73EWdimU+BBst7llU3RnNIBMu1WJfge4zKc9kwpLZXNI8o9remq2d6Jm41aAPh2yxOT33Prepcd1eJZ2DcxZpflHQRUBFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189094; c=relaxed/simple;
	bh=wrvIrrRxxCxbjC5y19PcJbeqSjug7uXwZUzwZWAtOzg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=czqYrOTPOfpIZrZy75nn1suAKibpDACObF5ojWxV/gp9Q7rUDMGkbMoSFu5ja9ewGExyPK4DSrWOtxkFOXWQ9f6maKGJPgNS+egfORbWGtztAYygfdbVQHbaoU7T2nDfl1Kro/BrMwMjeN0cZ20uov1jd3wcXh/mIkJVt8awEgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DrWW5/ZF; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DrWW5/ZF"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35d4538fd74so977802eec.1
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 15:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792189093; x=1792793893; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=DrWW5/ZF8j9ZJfP/WnCDfphMMvaLIUjIP6y0rLed/35S1oS5c/NjQ6geeJC9cJ2OHu
         sLO8UK9RbKm/rUyK7POsY4jXUm6gxvhkPRkhKePmmhhoXyoUvucH1ZZFrN71imezFM0o
         HM0mU45Jhe7C1d/jElfjJxGMVow18abyJ0tRihnNj+W+v9A1CXcd1Ddxzj0wMdTwJGcB
         aQOa0y8HEgg/5aLT2c/0hmUOwIou73dYudaWVn+BYDmx8BbnLdfINl9LRtiSVTBQJVUp
         T4eLd47923WUtUDXV5BxdH+ntSmh5Em4RItOL2fZJPJ0KsCHywqZiA1+tVKxKQTcecNW
         hi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189093; x=1792793893;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viOIzDo9krKszOCmVOjeW9f2aQpRArqmnQIoNv00KM8=;
        b=u6/y158BDRU/JJXGTDtNMKMGuPuwBJiOc9oRkzDUY67dM8HHW7/f8CbzAkrUxE0ylL
         XJMRC4Yi61IiMPWnW8gW24JChUWqubdXK2ZOZOakGO1CAqx6nFREIcmkomkmCnXmF/m/
         jdqzgk4E7/uNww1UmRTCb8d/zxAAZhJtsdVqITtxEntOOOdef6YaV6pmD4+B06qSE/kb
         GtBGvdghc12TzRZ7fXUohTFKSvPQSaqhaYZn0wHyL25wv/NYOZ1Xt+7a/76iJuORmLsA
         UFagE/x9m+y+LGahDxPTrXP+WAa8ZaR5k5N4azzAnxgXn5WBiOIbnborW/1aRGSbGk2A
         1EsQ==
X-Forwarded-Encrypted: i=1; AKwUvBylpj79436mcY8SnUsoEWr9p7qLx2v2okV4aENZ/YEJ6FTsGO6HPBb7zvwe8IhsaHzhg3YW@lists.linux.dev
X-Gm-Message-State: AFq9FYILx+0A7F+DkL334k1AbAe65bJ9bHFfldP+amhYfAQD7sSolBo7
	dlwVMhcttIBH414TFBfpS92A8IiHV7FKIdixXmRne3WYN2nJneNTEP6DmwyXRaPV1C+SOYuvX4A
	pAQRGEf8FZA==
X-Received: from dlbut6.prod.google.com ([2002:a05:7022:7e06:b0:15a:d2bd:6a16])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:464a:b0:143:868a:20c1
 with SMTP id a92af1059eb24-185151be30emr1295600c88.46.1792189092510; Fri, 16
 Oct 2026 15:18:12 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:16:44 -0700
In-Reply-To: <20261016221700.1282659-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261016173106.679725-1-irogers@google.com> <20261016221700.1282659-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016221700.1282659-2-irogers@google.com>
Subject: [PATCH v4 01/17] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.212.g129ede20d9-goog

