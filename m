Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026485;
	b=fZET2qYT0t1tMsZUQJwLFUTp+/hu1N0m3Vb+g2oIOR04/pBKUabWEPnaodHJX0pTtWa1
	 IAp4ROekhSQN+FJclAfagNCmfraD0UgkxC326NZI1l1ONvwALm7XVRY2KcAe+wU6DdMYa
	 QZEW3gEufAKpOdFjvlZAzyuo6vqO/v2bV7zbUriJpI0HFbZQUhUIXxJJ/IT0CNzsAPXm4
	 2ACdQpJOqvGHmbm9Q0YS8i9iz3CNEbVbZdP7JpXTk6DuRhY7nvJed8DGbGsDAxZ8dbJFv
	 zDiRKXQl6N/qLrBhODD7W9NJXUuHj+wc6wLsxsNwGe3Yv1RyIbXlk99KV8WSQVG9e8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
	b=QgD6jofiVVegILYwBbTFbt5MoxymDktXIj8GtS8EDn8VhVkFcdbwdfmNWSMYxlj3unrr
	 HCggBjMjcsBwCxdYrHC+85cwE4tTiFlQld8enB31xxyX5TFyFihq1YEo6FGk/NXK0rVJR
	 6ORZJGwgWDZlNPT46aHv1ZQXewSjpRur+4kKxSHgXk/nogCMo5nAdUEuSw0uHKzF6uCrS
	 ju517ZEJmQimV0sTjPoxq236HDYb3/GDjvldOrE9NHuJUNm/Jy8JUDpJws68HijGnSP6o
	 froeoM9l30gPBxHEXB1zj4m63SPxaM9lvu7O3weM1EB4K+PSuoUCl7QaQGdNDcXPdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DQSkHnAY;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C667606A330
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C667606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DQSkHnAY
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2163491eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026484; x=1794631284; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=DQSkHnAYWa+ZIPZaYB1KV4RtfYrnIipSHxeT3oreCuwPascEeYjZ8MKkvtczBZmDMQ
         hVVyNZOmfkM9e5mUDTQWu5peimudTWif9nNNAgK5sMI3yrbDYtx0ttoO7iFTP8mX+JDS
         KTFpJL2tzqsTKyZbF76cMUKL2Gbbly1zX8SkM3etKc++sMkrWLFX4T26nH69Ei4ObEe7
         7/rCd+Ctz3bIOg/LIREHLoOMLeLa2YjG1EtbKZH909dBxcuKEv4keuUcM195HhQxjZ20
         L7+7OGx+E/w5AJNlaPfLQBX0zB+13rKTHdW5f5IK5lPXWm1YoWXz784WEYTefLdtFa/T
         qFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026484; x=1794631284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2QoGiIe6qh+xXGRXPEuyCoTeHTjKPAeQiniSi4k+CI=;
        b=o3WcfX0GANL2+sXiUiuzMOSwjpvTl99sAjkM1HEblopp1ZMvI8t0Qc9aNFZpKFUXw+
         tgu+khTjLfcP8bdEOEaqrA8qIxDLc1M2xSV6RkBQkMz2P3rpkz2Qc5215yrzRsaKfBVQ
         khkKj8dR5fyaKl2SKHLG7GT06o5XF/1E9DrwW+vddcU+UGKBMxaAZYxWn+y+DfBtuRXQ
         Ge6/KNaGr93XEO8/7DuxfQChe/6ch8ddXUZdXewrX5Q6QBN2bdGPphprUjgH1gwf8gX1
         fraPIL5MKsuUiFNKg4hIwKvDUQ7gcnzz20HfOQMlhbz0bER43cvCyJKl2SW1D/myh3Z0
         EThQ==
X-Forwarded-Encrypted: i=1; AL+hErEphs+g5ecOteNtFdpsCDpyN3Ni6aWLTQUk35gMAv8XSsQsPe1Ubw6AwIEjtj2QChOj2TQs@lists.linux.dev
X-Gm-Message-State: APuU4Z8/JF9NsgLyYBOQGkamT5Ahlrjkrit/sosT45kpdJR9dgWwFWXO
	IBXldND+drF69ST1cilhUoR5ylllY8gt3wnAwwnwvVnN+rruzmPsT0AceDz466tsxhop2RW1lO0
	hQQRPJfnfIA==
X-Received: from dyctb4.prod.google.com ([2002:a05:693c:39c4:b0:369:45ee:40a0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:78c3:b0:36a:1904:60a3
 with SMTP id 5a478bee46e88-36f75a2ae65mr5587829eec.15.1794026483275; Fri, 06
 Nov 2026 20:41:23 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:49 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-9-irogers@google.com>
Subject: [PATCH v11 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
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

