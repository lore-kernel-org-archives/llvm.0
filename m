Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948643;
	b=SX6OI6zsojvJHBSQ8Clt28P7435Yd+jLTYjBcd90MM3t3MW74u4RG8ysk5QuTxgmO6n8
	 A53kmvbQBooxvfIQuE+l+6o+VOOgqkynrhhZLKyINh0mwrOcFEdHfC/hM1CmuXfT0vP6Y
	 AKDATWMtNX6ddKumKE2CPOuUiLjXt2aKy5fWf3gut7a5f/msnBLJj0JHcJz/vWDiVY75J
	 AioVVYc7ivefi9WyHJvDmJWptayTWMDbgyV7NeXTaRblz9AAsQ7xpJ9xDQ2bPcryPvwvH
	 Rj2v0KIUY7xA0h3kN/QWdwLofdL0fNnppIufEJv6ao+SLP3Ri8KgHLJynvbTfFI879Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
	b=pu0VpU2833uuNjhKR/yIaNOIErZsDwI675tCurdTkj3h/sZ7h1/43pC7NoOELYyhu5Hg
	 BOySia0LTUPZEPQiwNcn/ioymeDupsFK1mKC/T2HcRG138ebH7f245MJh4Z04G7F6yQMM
	 n1i6W90KvvJWpZvuuByBvk5F7olc613pLj8PXIAs4cM7ss2lTG95EZkYMIkdPx+dcd/r1
	 rs1rn3G1hEaOG0fIEp5JWzloP9/ylBxu1enYHQeObaU4l0lr5zaxHweQxy6c7IRCyHTuC
	 qVz7hpqrjvgVGSaJ68vqAekyM1S4AEVMgtPhPpx4tGd+UxcrW3T9Qs5xharuYicmKYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="l36/rrZL";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9546606D82E
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9546606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l36/rrZL
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1ac19c6bc71so459679c88.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948642; x=1794553442; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=l36/rrZLTcOfaDKB8noC8p6EuUFkeNx4nwvYf5Nr4rXSxqJ0tUPjjt1F/eMf0FE1cj
         oBHyqDE/xu6hj948ZAd9ZuaSNI4QYEf1bPQ5twtsm/U0BEbhOByGZlynqiOYfRs8WMyb
         9NZnEsQA/b1VjmjOrvtBlEYk8l2dfcjfqfo0h6xJkwdy4ulIxEAYrKdlK87TY+34a2I7
         KqJII60tRQezN8X6jTnVZETUD9ac8i6+pE1vAe9XQoqD1QMs9Okd5KFq82Bxz25nHYV3
         V1nsPtide2tW6/m+UKG5on1cwllu8AFcKGdbO1CHT1hLLjb6H9I58ZOEBwB8GiW8zHz6
         5WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948642; x=1794553442;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZHdTr4uS4t3HLAWkunw91OyKFrULjE3FrBfJFUMM=;
        b=cBT5nusxGtWsOTWyv8nbv2sGS68Q38d4Sm+NWj2jga9HayTtx6YuhaJ+dx0i0ZzCJh
         Um8+k8xs0wqM3QBlNR7wetrrayHbUIi+Q3JvFAD3TdfOLoNQN2RnNJQOSw3VWNxYtaKV
         5UKoyd68RSMs5X51lfFdH6mSoEoDiOxbBDbkGnmgt1BavC9FgRQl5mq7seKIvXb/6LGh
         /AvfCmgayjyJ6ftjVrnGpu/PzPOZpRb/Hc9Av9b4Ng2c+kyPYkkuoSRKMeTd9FUrAZrF
         t3bZE9zQONec86GUsl0lqOqVzVDDVE0QQ0hM1JHyNJBqkNkdVWvD8A6z9zZ6GzUeR1oa
         hViA==
X-Forwarded-Encrypted: i=1; AKwUvByGkeXzf961mFvmR7r4DGdtJOZseadtbGtI9/WVMIK4WSZmUbL8/qWAnrdMbXakRo64l7in@lists.linux.dev
X-Gm-Message-State: APuU4Z/Q0pbLBmx0ibxZDD7+3vZbmHIm59u5BHqJBJzxMA1Hhs73haJ7
	gw5ybqKjGn7EslvWp7tJ1lKCMd6WMQwyWTMJxVxscRlOjB+cnAX2IBYPIJJNYaVUWQ5Ljq+1er0
	Ntom817WW9Q==
X-Received: from dlec17-n2.prod.google.com ([2002:a05:701b:4291:20b0:1ad:6e8:8d5b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3c12:b0:1a8:9857:2102
 with SMTP id a92af1059eb24-1b25d3445demr1741316c88.30.1793948641255; Thu, 05
 Nov 2026 23:04:01 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:29 -0800
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
Message-ID: <20261106070344.329897-6-irogers@google.com>
Subject: [PATCH v10 05/20] perf build: Enable additional Clang thread-safety flags
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
2.56.0.455.g6c5a503b38-goog

