Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418950;
	b=vyqXCTIYSp7D+/4mJKG0iyXw9QMLqlzrRHlS/f7f0zyh6wsg1LxLiEnnc5grUEb8QSun
	 EM7Vv76ceK+nNPZBRTktZwVzrsYjWqxl/gEQPJntdnAs5rFx2nBQ+L7a+3fcBTNkCQhdD
	 uSOARdwim5cnnMSMP7+v7uCRl9UKAYNsZD4kYq3DCzIHBkKxdgcaxTPUQ2cAHcg7etG3u
	 mjfoCwmJOA8KKVtgxQC0mIyJNtcJ4xYRjGnROGH5o8EcIYrRy/v49BFPi8Drf5INgaEy4
	 5osK2YD6ovBcQYc8/lId5h7XNkcIPYZTVb0mYXwpEcRPQqRWfApdXyzrnxufZV/XS5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
	b=sLX4cWyUDDpkzQwzsYaUalNzdgIX0fvj1WDGKXMs38QDZS6grlT4WRURIJKIk3dJaYZg
	 rNp1Ff8xxwBmr/9lpqMgeFVzIpovve4/qwcl6v2lYC7N+Q0sHa23d/q3NXHhp7DVKKsBT
	 HLbxgi/oGfR8K3g+ipEk+uPE0s7Clh+ehzudS2sJ+4a6Yl0E7ScYRCc1eaIym1h7XovxG
	 lStmIiRQ4JxSSUWAWBhyHSEEdZJ6NXNgYa07JHPNs/Li02La+mTgDpdvjJwQnltvJfLzZ
	 SjBKydM0dywEwxzxv07QVCP2nc6Yko0DoD17aJXwkSDYzEOREyfWovVTl7NoXfKWgVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3oussHC;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C0160A2603
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C0160A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P3oussHC
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3763bd79663so1591406eec.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418950; x=1795023750; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
        b=P3oussHC/R2sQ2UTmuIQtU8AW1hfkNyrakY+vp25uDmT4Clg9QgV40/+x33ETpPTe7
         nfyJ0CeB287zCNbdwQCj+wwu9nMtrYfBCh3viJIsmTvnd8SvegNraAhPiIoPA2o0QIkf
         IzqEeUluXkO0PWizKE6KgYbUahkwJw82CLvn1gJmcoGFn5zPMGs42thHl8mKYKUQNmib
         AQTiXok/cgk2Mv0OYel4Sn0wqz//kiCG7yKYdddqKHHjna7J2vMzIqphzkDwotxY3vnA
         vRlwOv+ljl6nj5wJT0OXimoXnlT/81ucHhZgWNY8p48zShQfB67C3PDILvIvxIxAWYSA
         OiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418950; x=1795023750;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lxdgKdM2r09Kc8bEmNWbsconFYa5kW2HuEnCCpVWss=;
        b=CGPrbcKCsc6qYUnRVy/DqkZmMx9J9jtKXbUREy3otGzjam+NQE7owXrmXkNfQ8Sx91
         7BiXqK0E1VIzpOMdUN5pOrePTv7W/OlZO5hnvvhNlAbSY3aJ1Ns8Bkf65irS51qLaY+w
         D3HtykSfXiWO34FAc+/x4zNx6s473ga56SNABmxPmyC7TJRk47DP1VG0C5LSxf1u5dG9
         8GahoJXhIMj7pOR6i/MNx4oBOjCdPHlnF6E5U+wEPkmyGzVxaBTQn977JyZljdQDawcA
         jQugNxSmhoF1R50UQ2h5pdyJevuCCaKFCpFVwpsf7shP0VvBEyNmOSS51Z/Y3xGmyF3a
         iM2w==
X-Forwarded-Encrypted: i=1; AL+hErGtMrXERzyHYLI3OnIfSJVe6Z20APDpQQD8aeEo/33/TdqVo8OS8RReaTc9U4hcZ+6q7gH/@lists.linux.dev
X-Gm-Message-State: APuU4Z8uQ+e4dAvKBx3o4A69tM3+oWkkeDgpsP4RikEBaOpo5Dru7fXK
	MVnK+1kDT4LrZ1j8SdT4CxtqT0OInL2UBmQCkgjtKcH0ALRDu0e09beoCXBtgtIhhv0V6fdyL5F
	wU8nYCfVE0A==
X-Received: from dybb16.prod.google.com ([2002:a05:693c:6090:b0:368:83bc:cb15])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:88c3:10b0:370:ff2:f78d
 with SMTP id 5a478bee46e88-37685c7a800mr3499244eec.8.1794418949297; Wed, 11
 Nov 2026 09:42:29 -0800 (PST)
Date: Wed, 11 Nov 2026 09:41:57 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-6-irogers@google.com>
Subject: [PATCH v12 05/20] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.542.g3ef89b7020-goog

