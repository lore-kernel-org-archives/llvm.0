Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418957;
	b=G/w3oEZcRF/p8m1iPdiaX8JF067gADCAeV8iKQasSxUS37KiKVaWgksJtxj03loifJ0r
	 GiNB9F+LMLErEB8qFo+lacEvwz9OGHejWB89+Sq8CFvJH7ZKMdEq8TTHVyiWHtnJrNFjV
	 q9pD9KsmxhA/3yOy6PROZLLzkpEqfwRDMgAkLTtL2hKBsI4wKg7gts/nhnpl2vt+/Eb5t
	 YqRTapVLXb7rEs0WUAmuX1lcTWrt8MmBhGvL2L9+jSdqmfCA1GrMPYy7t99LlNjEDF1m/
	 FStJWXwxAPMoueVb+a/ZoEicuai0wg2pxMgzzHiZX4nzMs2kVwkw/IVvBNp/vkwya/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JM6mTw4jRrqiuh/s1U1sHCrr7wMWr7Ysl4rPlzO02vM=;
	b=uDEqJQ2eKkDil6xvj25Ni/ZgBiULoDRDaEf75i16s1WMUL0KAeyb8vBZJZLHN6otr1F1
	 whR4fGghlt65Ov2J+Kj13csm5yZY6VnBfII1iq0U20qLMTn6/gFZ9C2X/NssPuV4UbQXR
	 MKRs7BVmR75foBsDEAcQii1sCL1/sSTLZrwRmb6k+9KJLloLbM0SawcG+gc7Dk2+69ZG9
	 O0JrRKIIwiHf9/v7GmF/1UQcsaPgbadSRcx8sO65PDMIW2mn4eGCDCWMqrnWOjR7hHM66
	 EhyAa06SvOJ0Wh82Zeou5uIhYX9mfnWrDJfwMoSTk3AZcXmlikYoL9Acu51nIv7SfjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ybyn4gWe;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E460A2630
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81E460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ybyn4gWe
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so2815232a91.3
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418956; x=1795023756; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JM6mTw4jRrqiuh/s1U1sHCrr7wMWr7Ysl4rPlzO02vM=;
        b=Ybyn4gWe6I+aWc/EwwwzCd0KtY/GZIEJhhqBTH1jrKZAHfFOsF5DMaUc3vwBl0RK83
         QGi1ZXClNMy5z0jK0EpwvBsZ+xLv3PsHHC8W4hwGBFoAdS3Tu8IWKvqWNiNTGRT1cX4y
         OZAXoLQv7DNmtuKB/IB9SHuHQPn8FFxM/Quy32GqKgbXCpxO/aijpBLB4c/WFsLTJgWL
         e6qjdB9/+zQ/sKX0j/i9Ey4EgqA3jMH0xxR8340RPv+qoqbuyFy73UjFzoSSMqAVcoUK
         c9Bjzqp9etQfn/7dZGI+9ECW3r+Wwxz/vW9FMYpUooqSq7WOTz8A7i8PsurTwCrnY6hi
         MAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418956; x=1795023756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JM6mTw4jRrqiuh/s1U1sHCrr7wMWr7Ysl4rPlzO02vM=;
        b=c0C27FG4OkE1ZSoy4V+BYaX+BR0g7UKrE07g9EW1kFVAdjAJT0O6dVP6LLugXcVM3V
         MHUtjIlEOHvnG3SGPtfj4OUbK4N9hcu3DG4I+aa+uF+WoU7NoscI6pAYBLvxp+ImR5AM
         ntLCe9lCfGgN9p4cIQyzlRTRr/47v9nT3GmlaU/Qke/viF/PUM93LwzX2VQ9xWkfVIe2
         gNEdnRV+aR7gvYwB5ZD3pGT2Fq1oP4aHLywlVb5No48iycxZGMv9jtyAtzftp6cL424t
         px4tFHZqX82uVBbTt5LjgGZkZlZoZM5nAHHbL8QJTf8/WmOY1hU7uTnK2Lc4vnqBjlll
         JDlg==
X-Forwarded-Encrypted: i=1; AL+hErGEENSziAT8vqEm8Hy4XcSUbosA4T7EeokC6Trv38op/rhK/l4qttXVZM5XAZZbqXDsc5H1@lists.linux.dev
X-Gm-Message-State: APuU4Z81amLfzJTPYHn8Xd6dMwqVEaBcQg0dZ0+TGkKQy26piOEVdFJQ
	TVSIbo8Zy8hZuutCfMIsRwa1qhSb3xL8PGNfaHItWdEo4rpfq98Q/uZvheYFVl/92pIeANvCOe+
	5WuqqJjn/bA==
X-Received: from pjzp24.prod.google.com ([2002:a17:90b:118:b0:3b1:15d2:6bd3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a51:b0:3ac:a5ff:2cc3
 with SMTP id 98e67ed59e1d1-3b182e13d70mr3125273a91.8.1794418956044; Wed, 11
 Nov 2026 09:42:36 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:00 -0800
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
Message-ID: <20261111174213.3526604-9-irogers@google.com>
Subject: [PATCH v12 08/20] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
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
index 5eb5efa4eb90..0334cb01349a 100644
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
2.56.0.542.g3ef89b7020-goog

