Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948649;
	b=ysZz6KRc70Ec0B0F+DX2PqzY2takPqM8I+MnmoyYYu9CaBPwvO8V3s+ZEeT2XDbkrWCS
	 pGpvxN+95eqUEiipHeJi2+0gb+JYUDLjWvmaJyKeJtFDPE29fix2XpdP4itHkw8gXmYX2
	 zKbhuOyItmWDmwB1rruOq/FiCkHDWs7mVbO41ZMGCtLL/SB3SQkL8OmTKSHmKdsNcPvd4
	 3Lom9vallVx6tM+1pIMgTyJMX1MDkdorIQIC9kgJK0+8e0Mgw/zp2exCx0Mvq1RgrDW0d
	 HySSR+7mmowEBNa9nST0OEJn1tZ7ajmy4wffpXZ3GKe/E7Phidv3PU+VVC01qkM8nsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=g0DNMB3cSKPDAUC2jncpxFN7mn3eABO5u4i6a8eYaWPh6wP3Yd7M0D5yZzNcgVIjTZJh
	 f8uebXIVt1XPpJ08nbzqIrjXFTrQG7AYoD/j4XLlaHlCGIWtKZb+LXVNDZhq9G52wxfqM
	 4zSWGD8rVZemxK1cZuHY/nTvxqdMyCWKpKCEcMjS8LK+34bL3DbyvJt6EcVgLqR3lzq6i
	 z6gQMb3/9rIe2wj9e2srlEp+sX38D9rraCbIIjiX5fj69r/LHkrvEhWOFFt16yQgFTKa0
	 mGkQVV6FlowvWZav7wTDa01KDiV+Rqq+0gRdF4Ya2yNWcVL2J3yC8E9Cs+MdCR0Q7lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WsYfFp5C;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E53606A32D
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E53606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WsYfFp5C
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3700be873ebso129212eec.1
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948648; x=1794553448; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=WsYfFp5Ct0LiI1aIHLqCD0FXPKCrWMbi9P1yT3ckbCI3l3S3SOdJgmdsIJxAu/7lzw
         jaBQra7gZC9BhrGBpwVAwgN5L++YTBjzZwu/Kgn5Tb2WUOEV+Eoo3c4Wj1gtYrllokTP
         mcoJbh/SQLDIq0kn+gBWeQjhpcFEI0YjWVnSK59p0pHj2o2pneTindtlAaXHYWoEOK8n
         bC1moDox7R+hRl4pVQeRX5+X92a+Wlnk8onb7cKX+AjC31F2RUF1VnCjVmQWFF9HmDZw
         m19oCL8dWyuqiVctKb/LUt1gbz1yI4o5ZSYl63xf1N9B9mSt2umvPFOkbt4KjayNYaHE
         3z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948648; x=1794553448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=nQadx4lpluL0fa4I2/hDCz1fsCHNac2F8wVdx24h7PXwVVKRIWGMcqLzu+OEgzeaqP
         jF01tGGb61AA6HIMDoTTynnrvax3qt6VCOifauqLNtSNtE+uowqbQokBSw6VYC02Dg2j
         d0zLFIQOpVczQV05uKuo7ifOco8wkPG5TI6V3766OcODXN+VuIt4PDg9hVT2AeRtRwbT
         gMP2xuEhm2wjhGg38nWJxv1qcsZtQXZaLho7HFTgIMb+k7rLSoOkJpBDKN6qR/jx5Ss5
         M66hpZhblogzlBlY94gx8OX3qR8PmFAZINfyIBQsNYInYNTDnjn0GRaZUGPyXXaEiNzT
         wGoA==
X-Forwarded-Encrypted: i=1; AKwUvBwKuOC5k1QJ4rGdXh+c9JBTQX1OrzvuhSwC82tSG3KLaGKx4HRQSnRzCs/OPfnqbVSfsjYr@lists.linux.dev
X-Gm-Message-State: APuU4Z/cgLYgT07dW5SCoyqfpkTCj3zMB2GOPHYMfG1qo2gJMZvSc0LM
	v3rNF/I/WzXzfHyKVOTj45tAKLh7scqSmfv9eTD0aadeitcIN8ErDsDFUkagCDnD4eWx024S+uv
	Z1kOrDHhE2A==
X-Received: from dyaa13.prod.google.com ([2002:a05:693c:40cd:b0:36a:209:2e4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6188:20b0:359:3991:ce1a
 with SMTP id 5a478bee46e88-36de6b52a0amr6511094eec.16.1793948647424; Thu, 05
 Nov 2026 23:04:07 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:32 -0800
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
Message-ID: <20261106070344.329897-9-irogers@google.com>
Subject: [PATCH v10 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
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

