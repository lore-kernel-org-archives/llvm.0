Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622368;
	b=SXoYHzOhUr2wSGcoRethrhNhFNzzPHNoNhuxWt+wuL6qPXcZ/G0R1E6ONnf/l8GBSmdC
	 LU/FspwDxDQmPDViejdyzu6hGCHKQ+quQC5RkmxNCkoZrtK46wP8SD3RflXrB4/jFbUpp
	 yHK9smeNVql9ieTcOiFd1AtHGC7q87fgcU9J457HWojvsOdX97PcyMvlucBRf3GdTgL9z
	 60ku6qj4M8UBSClInDt6HjQ56m77DxkjFo/7OkYHkOnl47z7LH7Z2hO0bubpu2UCZrhuZ
	 UPnNYsxnRRElk2lHOMYIKu02NkEiPHjbUd+1B743QVSRcyRAACy/TAizt1xd78zMDxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
	b=vgF+ujuybXMI0E3I9hx+EjZ4q+wJgCmfjWmzmYx1mdKt51Y8E6CqkLqo5YhZWCiUeYnt
	 8XLdtCcYHry70p2PDQLTkIusUQ1mJlCnpuVvdbdB7NXddc2N4voPMG1xqjGGsvfeZiuaW
	 m/HGj4Q7d0jey+rq0gSCUIP9ViQzU9RVgrzhQDBlZe4iW0ca8N3Wqzw/b6Ftk21VyYZzY
	 OJVUeU2ckYJDqBGEwpWkgMDaGCbV59ep1TFDFQc8/Iog38sNpZIou89Yy1VuVPn1FJF52
	 6MqzcadZN8SiAqvZdKx0y8Rp4n1fPu5eJi8qkm9WeP6NoJHMy0pNyS4j9dAzOreXS9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=o+e1nIbf;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998F606A325
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1998F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=o+e1nIbf
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4344870eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622367; x=1793227167; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=o+e1nIbf4o9h/+a015na27/sgJAvocZR8ekWM1kcJyLGySk8c+zT5jHTpaY09tpE3S
         k8e3TcE1AccMY7sqDo+pDYYDi2WPhdOPWPNHFWtKTyf3YYnS+q+EuYOnDBBwTyM2UzdS
         1ZnGVtN8+B8mz+UPzOG8gV7EL2yV8jZFPkC+PyBXc9afpOslFWnfCbKkTJZuJJaMh6J3
         PekWqnHkpAYN+PqsmfqbzflLb0Pf4mBbf7YVUPEb4nxGatAjJEiSe7ZdD84fk721w+aH
         l/9EuvuQ+rAIitBhJAf1tF6SvsquCPlOQsJWGlpx4VxcoKCnf3rbGBvlRn1WlzLP0Tx4
         /fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622367; x=1793227167;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxTFTtf8V6FF42iRmNOHdvJNuQcB3RcU8GW6u8RfjpA=;
        b=ZH+RjMXG3aYM8UFIwJY6jquP2GIwqrW6BlPrXiJtq9nnuz62GcJqbQV2pcv5Xs2bCC
         50xNPno4ZKIQCDNoQRMiJLQkAedElK/qmExFEU1MawfhWe0zZE8jcRQ4jCNPLkPIwVr1
         HQcRzQTK84voLF24C/ia/ChmByOO8r4u8yfQdKLghfVHBfVK6wn3CrHMHRLKT4YFkyMZ
         wPt/ynVWoI4kL1vF9xAZr5MWp9YpnxG1XCJZyC8s9mE3k1kEF9GUFhOEfYUTt3eZ6fiM
         ng3IBpfKsEY2cF5q5m1kkfRQVfgNZjmSHcUlBg0C4kH+VXWItTOg6CxtwwWbSp58kQTc
         4TZA==
X-Forwarded-Encrypted: i=1; AKwUvBysCpppVXu/lby0FQnh7GhN9FAT+AwM0k8mE2R5vMmaDT0KkqBUCCCKVECcwDGddShdDWh2@lists.linux.dev
X-Gm-Message-State: AFq9FYJDMl9SZgOQubtvFjYvWm6bfREpRdspBNWVgQideeO9BforOdgY
	yB6sbAr/NSh7+jbXPQ8gqwWWYBcG7PRnqTuehVcdsgqAxGQs7dzrIhxcZ2NqvBac5Ndp3LoZ9MV
	hLFrtgGQKSw==
X-Received: from dlbpu6.prod.google.com ([2002:a05:7022:e886:b0:161:df69:3983])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4546:20b0:144:c112:5f24
 with SMTP id a92af1059eb24-190a5d6eea5mr4048804c88.25.1792622366950; Wed, 21
 Oct 2026 15:39:26 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:53 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-6-irogers@google.com>
Subject: [PATCH v7 05/17] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.218.g1ec904b173-goog

