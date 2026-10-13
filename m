Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8FF5013B0
	for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791930400; cv=none; b=nvWCUDUlQOQZzZUN9Nj3/zsIKQbaM5GwzhoOvkdbl4OJvTdmi5Qt/HQU/ImJfXYMj+qByPgMF+rYPxK0dCWLVxvV3nD3qtyanE7kOguhv/FMSmB8PImRRh3L36gT20saOSlbApLmZe7Zz637YY+WwPlC24krR2SYhN7kpOYjtK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791930400; c=relaxed/simple;
	bh=x2csqR8dDP2NCSK8ek5vU6PAamZazjSrMmyYhw8xZI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QJY8ackD+d4MPpy1qFG3S422nPS+CuZF2KJwYhnYgcgaZYhIiess1S3vBsKr0r6V+Di7c9yEFQIJOY6fBkYDaT5NQPfWVJ1jWilSJdYAdYcUl1y3aRsasjgoJArWpowFHk7R7aquyhNWBOg+sMPBur/5TdlOq+zdM/z+Ztcxeb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R2sMgCn6; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R2sMgCn6"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso7811022eec.1
        for <llvm@lists.linux.dev>; Tue, 13 Oct 2026 15:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791930398; x=1792535198; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=R2sMgCn6I91PcBvS3JYEhiFaC52GjbHszyDVA7WN+OtfSnSf2nEb4CtxhBbChmJHf9
         OM+svw+s6+iei1v6mpTX0B0SXdfKEMhAalXDUwHji1guE8X1KyXXcbNIjSTQoC1kEeek
         7t/jD6cPrVX0SvmZH0wsWK+ZESV/nWz5NuFkyvQ0hdOCnKScBJdqaWaaaaEw/jrkIIQ6
         5UAW17HGZ7WMHGTdVk3uduy+5+/co47X+EhDhRpg1xZDfEVwbD9JXScisfqBHVGThPM0
         +5pjDPuMjQNHg+FFHnRuYdK2asiDGcE08H16O8iuAje0IfERPj+/r6azWv7xsqzU5dcG
         KFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791930398; x=1792535198;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZIK7O2vtZmPG/MzaFS6aJid7lIfJvEiqBHfvqhoMys=;
        b=Gx7X+KJ2OmfzBITrCuT+WV55/F161NWn4YTTd6LpXpimT6jSQBOH6zcAjHXHwQborR
         unJkdOlmPmvQ4o86DvbMwqxlGHpv1bi6/8z2AjhKuG75HhLKhC5S8ME6wBDqjG/z5RHU
         S2t7d1r++H9tPZLDD8lTZTylQzR4S6zKu/i89hTHK8UrPmZj9/np4/kaSaeTQTeVj+CY
         C0ws13dPPGbgbxhJBTxAe/ZaRoxcs+5PgM6721vmx3q2br2FsPLsbFagU8xgJLiluBxe
         9Ewy96RlqF3xUlT8gjRWlzg3eJwKRJTdNoCCgU/zzkPz4EIlDGMPJf03xfM7F1P/Lfic
         Cjbw==
X-Forwarded-Encrypted: i=1; AKwUvBwCB4BFAW1iqCpwlsiLyNNHtWTVKsyyzekWAck0/3c2CBzay2FBBb4q+233rPkmKCsIcHHC@lists.linux.dev
X-Gm-Message-State: AFq9FYKfqKxvaRIytpSiZVcbWpBtBUfHDvW9uyfqva1NCxv2uRuz/pqH
	7VUl2Q942FMoXC/WuVBR+0hQVPk9o2/NUR4anbywQA2a7iJ12HHfQS1CAlpSWPAJY+YuZqbxcrM
	dHYuSET9z3g==
X-Received: from dycal34.prod.google.com ([2002:a05:7301:1ca2:b0:35c:c374:d526])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:a0f:b0:315:afc1:72db
 with SMTP id 5a478bee46e88-3537e046a1dmr18119322eec.9.1791930397618; Tue, 13
 Oct 2026 15:26:37 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:26:13 -0700
In-Reply-To: <20261013222622.1822619-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013182458.1234616-1-irogers@google.com> <20261013222622.1822619-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013222622.1822619-2-irogers@google.com>
Subject: [PATCH v2 01/10] compiler-context-analysis: Avoid unused parameter
 warning in _context_unsafe_alias()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

_context_unsafe_alias() does not use its parameter 'p', which triggers
-Wunused-parameter when building code that enables -Wextra (such as
tools/perf, tools/lib/perf, tools/lib/subcmd, and tools/lib/symbol).
Explicitly cast 'p' to void to silence the warning, matching
__assume_ctx_lock() and __assume_shared_ctx_lock().

Assisted-by: Antigravity:gemini-3.1-pro
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
2.56.0.385.gd3acb90ef8-goog

