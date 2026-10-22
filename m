Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700120;
	b=pXPEKVWQRaSH/fcTupBJXNh78FcFXb/dTLEGkmp/TW/C41eUw/VcsZVRqQ00vboUAaTB
	 +hcNprXYg7F7rbZiuJVNtnFrELwoumh7tBmknzea8yT+Ksghfa1ZKNHfpAGYbK6acg4r1
	 vRhi0ndftNkfzaaKsxZWzpnSq+tMZ+utrgrKCYbpJxuqMU6kG9veW4frX3OJfJ+bvvxi1
	 l6tSeuRanwnDmAF/1sZcAyBsX07p0TT7DTm971k5T4y6x9nbiMY+Q5Flkod+24SPW1gyj
	 OKW8tCw2FNuLPI1vh9cdmWQTlfYe9ZzSluZYHdLEkJ8Xl6iKPFPS8jQl6e735hr2xOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
	b=45xHQgPrO979aVNmYeU9TDri++erqNpF/LUgs/j+5jiAnnb4Z3WkUGzer0mRVP2zEbU4
	 e5hT2IoidxymLufJlBRwIR1BkDx94SLF80X8T+Af4zPUNp47acBwjjAfQ3qprLVZYDcde
	 jK1zb9b5qQHIzJg3tFUrSq2aE8OJqRpkR4R2cn2Sx4bxnegfAOTo87Kn+6XPCA/zMtbI5
	 CzZgmTcGn3+VWnSDoKoI3i8PzSv8xfKSofg+NaROWjHqGhdSNrCkDY5+KO/3tuYEgBicZ
	 TaIUs6e2dJfVmvpBZ3+D/Y4fNv1sTogW6+AwtQjc7DyOy+gPXvLf8SnJ+egMPE7pMYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jEjE6DUF;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA61606A33A
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA61606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jEjE6DUF
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so228510eec.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700119; x=1793304919; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
        b=jEjE6DUFLvTdhx57rrkH1Kxh36v2oVRkAInNvpYHBXe3jcJ0XyGrB5C4YvsAkeMp8e
         7C8DtgoMrAJsZ9L1CF8gEmWGYMaatfdnkm4DXUZEVKj40tuI9AfAcgj7Z+qkZVRGUZrB
         p30Bwo0YNOCdaPBivrg+M3wlBRPEAsdzP6frS7n+6ycX/fb5KtKaZHEOjWlecxgUcY2y
         YX8w1O81JQZMlpct69xk/rGJZXJCsBN9XhS5S15JBrSDRqoe4nq2/zhpi6VPowJ1jv5Z
         HSXDJLHqZpUSbsZXZLmiGwxSHsb9qgzzV1XAieo2jUjppXqxDYgDpTqmIspzJAsMCpz9
         7GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700119; x=1793304919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JUxMMI/25kOrfypmhpeOOpRGxtyrkB4sVFmB/HCDt8=;
        b=pite3CF7F9ZgxQw9IY74ypkz+Vz1sfz1Sv55wcai4wjL1GUHSIURiXbcFG2VR7EGC9
         pcuNXJAMnjQcnHT8GQKKSrdqYcHFJVwExU7sUF3miVpRpEK7FqyyVpCmxcBArvEPbu/C
         34EyZQRYYIFVkBhnDNww3O1C/+Yv1txpphhf4VQfAkcCvKrFKFZXDGl7j42l9FMXJBbC
         lksQplkXK3SuCyarY2z2miVGZNd63psnfoaAW0IkZopou6BFwYeyEX4X+mAO6vRYSEEx
         H5vN+8oJTuF5BUKwtv4aA2bV8PtIZfrJnte91eHIPYTvjJ8Gl7Guozmzg6UTFjErBxav
         V1IQ==
X-Forwarded-Encrypted: i=1; AKwUvBx874xqYH2O4U65whd8gPf883kjurK1CcbIW7UH0roSTNvdg8QaeBdNGuvQIxxYbjwaR1Rh@lists.linux.dev
X-Gm-Message-State: AFq9FYJw/CCgEF83SinwW+qxziUBsp+3shKe7aB1HFxjuaENHQcrOx/0
	DkYQuV9aHxRhJn+0yv8jQ3f55k7ncFMtBL0pqSkJ0tRK9webemUY2CxQapZBZGvGtKBQTk9i9Ow
	VZvpNfI0lcA==
X-Received: from dyev8.prod.google.com ([2002:a05:7300:4308:b0:368:d484:7709])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6505:b0:366:fbdb:2070
 with SMTP id 5a478bee46e88-369d989eb57mr380050eec.34.1792700119173; Thu, 22
 Oct 2026 13:15:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:38 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-6-irogers@google.com>
Subject: [PATCH v8 05/19] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Align tools/perf's Clang thread-safety flags with the kernel's
scripts/Makefile.context-analysis by adding -Wthread-safety-pointer,
-Wthread-safety-beta, and (when supported by the compiler)
-fexperimental-late-parse-attributes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 3eb8d095cda0..b50702bac53c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -64,7 +64,13 @@ ifeq ($(CC_NO_CLANG), 0)
   endif
 
   # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety -DWARN_CONTEXT_ANALYSIS
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  ifeq ($(shell $(CC) -Werror -Wthread-safety-pointer -Wthread-safety-beta -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -Wthread-safety-pointer -Wthread-safety-beta
+  endif
+  ifeq ($(shell $(CC) -Werror -fexperimental-late-parse-attributes -c -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo 1), 1)
+    CFLAGS += -fexperimental-late-parse-attributes
+  endif
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.0.307.g5fe7bd680c-goog

