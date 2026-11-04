Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825976;
	b=1l9swpuKeJvISYhGtHRET7PJMWKKrxSJQihr2+wgwzRSeiaW9RRPGwbXV55qd2CD3RdY
	 7i1Yp7Wxmre91g8gHNlyPqvpyLU2laOZ3sxgTRZxc8dx0uOrZbMhkwjDtBXDiuc2U1MuD
	 KCM0uTQCbVqIGtITJNwZdObTWnU3TcU58QyHEBFjNN2nxhdzPz5WAmUkEzM7ht9DpDjr1
	 mvlI50r4sNp4BPSQgQmAuKNrKSXPRZ8QfV5VZ4fDT0QLonQlEdZwfREMIvxj1slWJPeoX
	 fFYcJW+fc3VrCBt1UiNEEA4k/RKN372Vw78Lek8/rgyLSQvXbDsOV1VvXrEb4muIJVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=3r5AA9BJzT4FbjjPuSbcWJEBQr9HC+mVaRi/ZpEFtsAueXba1fKo0LsPEdJYQpdX1l7X
	 MZDLN+ZXLMCF3Ku5hURF5Fum9Remt75+hb/oz9CgLEcm1CRXmr+K8k0iWTL24pWJKDnB+
	 UKBFeWz38OH4hqQvjXyXFeyKvfv7rtgw0eG4oiawvv78jP8x5IN4vYbvNVAPgPyNgfcI8
	 Pkd4ZVgMNyruKer1SbfuPauoW0QlVMMg4wyvWTaGlxN3OPU3dPlgfBDQs0ksqmB14QeHo
	 F33/lIO5nlpPJmKhJOhPRC7DDgu79iCQBZWqdRqX/8IgGYtch5FVVRpQWOcgixaI+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="B4D/4d8N";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAB609ED51
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CAB609ED51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B4D/4d8N
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so6795165ad.2
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825975; x=1794430775; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=B4D/4d8N/ToF6q9tZXp3uz6iHYMti9GW3Pas0M3CQZVGvm50ts1ZU8uei89dx6dofC
         4iLcl766lNh8SdPeQFsa6BuRg/Z0ME4ojCE8cgMcZujr3ysF9Jt+Cd9E2yNpi4yqTQQB
         i1Ga48rR0bhUcZoamWfy7fZUaWE4CVOaByCvhkZ8421+RzsAi0WCx1NBlngN2CWQgfd3
         7alh5WZSgo13ub3x/NjLwUQKNmLfyYbrpXQ1FNYnkQ/N4p4dJQ6okeOhmnLJ6uSsr9kV
         2X4rQMnhdtUeK4lIBVOjCVMmKE1FWV86sex1qMRQzP7djjpHpUGnwgoSXEnnvNSapTqi
         AEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825975; x=1794430775;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=vVLVOa6ZHrKZduCu4RR9ubvuFCgxlmvYVSNXk7rHIhg3Ixiaxt84TRB/7iiL1VY/Wo
         tRTy6ZKIrFCtYDUGYi1UHkLmr3s2Frvl9WN4xnXGgMht9x5bjV3PCKMIQjSV+5fffy1A
         OnUfJY25e2yVbSBiNjTfOObEOtzMqDIbh0fVQoNQTtoc3Xp4rQghEx9KNxPW3WD8XJO3
         S7is+0xWezKu3DYkNW1JfoxnfXY+Sdj8y9xF2Z07+i4ZlZAAnD/EMIYpIma+M6sLcaaf
         VGrzbXFBiEKEJY80iLoE8VB63xAoe5hGM/AI7q3Vf9BDLaK9lLLKB8AUq7xdWE8Na434
         4i5g==
X-Forwarded-Encrypted: i=1; AKwUvBxbDBvHIoGwui+KWYdOvF+z+OhqS40IwPcJA8S7uLH7bwjvB221PgAZoy49nghgEZxDHLxg@lists.linux.dev
X-Gm-Message-State: APuU4Z+mGrJlN9d2EhIuCgh5A7aqtapb3/hZCgyb8F4FbSO6rwgSMFNM
	d2EMPmbFjJFipfj50BlbDyOAeA8cEOMmz+4gKXBrogU5R5wNGf559HcNYoGBC2xN0s9CZ6CBU7h
	O96LWrQ4wmw==
X-Received: from pldr21.prod.google.com ([2002:a17:903:4115:b0:2e9:b079:3771])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e749:b0:2ed:2305:5244
 with SMTP id d9443c01a7336-2ed23056137mr7115475ad.46.1793825974846; Wed, 04
 Nov 2026 12:59:34 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:58 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-9-irogers@google.com>
Subject: [PATCH v9 08/19] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In machine__process_ksymbol_register(), set the binary type of non-OOL
ksymbol DSOs to DSO_BINARY_TYPE__BPF_IMAGE (which
machine__process_bpf_event_load() upgrades to
DSO_BINARY_TYPE__BPF_PROG_INFO on PERF_BPF_EVENT_PROG_LOAD), and update
dsos__find_kernel_dso_cb() to skip DSO_BINARY_TYPE__BPF_PROG_INFO,
DSO_BINARY_TYPE__BPF_IMAGE, and DSO_BINARY_TYPE__OOL so that
dsos__find_kernel_dso() does not match ksymbol DSOs in machine->dsos.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c    | 3 +++
 tools/perf/util/machine.c | 9 ++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 1574c8885d78..fbbf98c4ccae 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -475,6 +475,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso, void *data)
 	 * is_kernel_module() treats it as a kernel cpumode.
 	 */
 	if (!dso__kernel(dso) ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__OOL ||
 	    is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMODE_UNKNOWN))
 		return 0;
 
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 076d167380f2..b958c6935a56 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -769,6 +769,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_binary_type(dso, DSO_BINARY_TYPE__OOL);
 			dso__data(dso)->file_size = event->ksymbol.len;
 			dso__set_loaded(dso);
+		} else {
+			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
+			if (is_bpf_image(event->ksymbol.name))
+				dso__set_long_name(dso, "", false);
 		}
 
 		map__set_start(map, event->ksymbol.addr);
@@ -780,11 +784,6 @@ static int machine__process_ksymbol_register(struct machine *machine,
 		}
 
 		dso__set_loaded(dso);
-
-		if (is_bpf_image(event->ksymbol.name)) {
-			dso__set_binary_type(dso, DSO_BINARY_TYPE__BPF_IMAGE);
-			dso__set_long_name(dso, "", false);
-		}
 	} else {
 		dso = dso__get(map__dso(map));
 	}
-- 
2.56.0.455.g6c5a503b38-goog

