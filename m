Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941355;
	b=RV9kwuCWL1dcFOwMHnozPLNxsOIKxwLR7u8z8ZFkIig/Da2FxOK+K8QNGwwM3A5F63OX
	 ecTss+EJuq/rnGM20eUyze5diT5YAFLb0thakPfUzKKg7wWgQQWVfjDS99ke3/3XJwKvF
	 F7sz/5UzIQDSKKpN3OYNdwhJtqsxqWH0WQk+yY2KJCfnqoHLUv0cykuT9ZM9FWbtBLkcO
	 ZnThs6Ohu9QUSCxvWXthRJQ342i2UA4CO0QlL9MhrQRq0TQdLzGPD68kZ65i2w1WmHuG3
	 QNtzfz/QxB/LJOrMG5b+dNhX2dZxzFG4eaZWELiOB6QoGbr2dJqHO19YL9Esx+mARHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=LHtzWDYaFZz13wQ5JYCoSdb1hq02GKKhEedHTIwsK44=;
	b=L7i6KFgW/e8gEMP3uHapHQH1amXZE/z+woN/Kfj9eyk+Q3zyl9wZDxgcXH3iyeEbo40+
	 r9SG4puwkMnPTlI7LVE3Slam+6b78Mjegx96gAzDh8hPKgsOlp9n46Nhayj/aBeXPgRIR
	 0Bw5OLS8rxddZji08reEqnLMG6Je/8WPtMRBXUmJZdIBWzwn2CLCz+6gS05c/R96Ejspl
	 1WG2GtbLr6r7eRpLBYnub5dAnI6ZqiZj2E3Sd3GCIQ8kWHfZ4N+ovz9FidyCBTCmO9S3r
	 I/PT/3bhGAXvKvxpi38ca/U4aV9kabvtROx01yU2zag4qL9RsRnsW0I0XrkrPESOOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k2MzDAqN;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50542606A32F
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50542606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k2MzDAqN
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so80526c88.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941354; x=1795546154; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHtzWDYaFZz13wQ5JYCoSdb1hq02GKKhEedHTIwsK44=;
        b=k2MzDAqNaXRwEpwEWXy6HGoKcObIcg7aG676PbKvO8lAtk7r4rkRbgoH/K4G15Q1qi
         jv6pgDgizB7kPZOrEhegG0S0fJcknPL5bY3iyZVgd8mvz1O5xAMaEKf0tyUgqO5hcWSK
         AMb258eeS8n+infG1Zv3YwMTDG3mvcXvOUSA0V4wG9ucesKGevZWjPHOCHGJyyTWrJk+
         Gy4emV3roAuwQwZTQTeOXd0CjXHhFgxIS+f9Jwg3F8Aqxn4UqLy0qHtUczdkUd8O7nMN
         +ccXC/0Kf6ovbl/DeJz8LWbn/XtU1FYZg/kRnyMDI5SjMSKF2ulBZylzihiDspgrFujq
         GNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941354; x=1795546154;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHtzWDYaFZz13wQ5JYCoSdb1hq02GKKhEedHTIwsK44=;
        b=XgaK8WPUL/qvR8wzwXodG+bnGz0f+dn9mFAx3/9Q/ELoYwicE/l5zU4E7uFSzGJq5P
         Ti/vLiD78X2bwhj5vdEJNZy7NLdT9dyRBq1D+CKMoAInzjJ20TMRpkdrfP26BxdGgM8z
         1Z2X6YAwnNn5CB9DPXzoyxkgmTUkUrKXN8XtxlWSdckxajGXx4IuD8rrZI52s9CgJyjB
         lFwhG+PadGvDcs/baEy/vugb7ecoLG007fEM2EQAzjv0tjyWgBTii13+x2rpOMipcxdz
         4EpgZFNMlwMSxDuhKi7Ar02LwQEtsb0jc1n7V9yNMs2HPaAZQrUhhT6nQEb/3+6TzyuE
         xSsQ==
X-Forwarded-Encrypted: i=1; AL+hErHEfUGJvrZW5kQVnJFjrcFiMo4BTsAhcpP3+DaRJa/zEFw9kYWuyRQRa93FuMpg79xWIZWR@lists.linux.dev
X-Gm-Message-State: APuU4Z94Fzxd5vDv3JVCjsvyuzg0s1p+YmVHCnpqh/smSSkrKmd4+dk6
	/Im8auNzMfy0T0UgLtWoead64jFZrIileGnBsILqSmzqUHAIpkU6gTbRyALsZrOAA+SiFZNoFxs
	PUKsG2FLHlg==
X-Received: from dlgw34-n1.prod.google.com ([2002:a05:701a:cca2:10b0:1b5:31ed:e280])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:424c:10b0:1b2:6eef:3f32
 with SMTP id a92af1059eb24-1b543d0c613mr389344c88.37.1794941353640; Tue, 17
 Nov 2026 10:49:13 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:26 -0800
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
Message-ID: <20261117184844.99889-6-irogers@google.com>
Subject: [PATCH v14 05/23] perf build: Enable additional Clang thread-safety flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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
index 7605079544a9..3e391f6918a4 100644
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
2.56.1.703.gf848ed807c-goog

