Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700128;
	b=5ndgk2M7/hPQGY1hAsb/IlUkFNV9f/nYdPKqYQrQ9RfLUWSVEjCMCMsUt/DWNrkCanz6
	 4uNi1ApTSxNqk+0DCuKW58JOS146tdEEP/GOe/dVqs4wrlnG7kgZyKQ2grEANfIY7ZIwq
	 GjaCBAz2pYFCel9VbBPppaDBfqXEPTHhAd+IKoN3XsV4UIVZekVqYghxseG9or4aEkjCn
	 nrKsjJBdSu0PU0bMsndF+CwsJYqTaeDyf7tOSeXiDvYOIp/2lFhti36cDQDvzkVuXPW2S
	 ET0VLsSWG296U3n0gbpKnSCc/8gClDYw/K6+++sRu6fpuL9Pjd7h1Y/Xg7tTHnFxbcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
	b=mEMiwSCAAE2mFXBwdUWri6V4hRyjGDxbm+gm2vu5Ies2eZ7zm6H1cPxpJuJCW27wbx9U
	 XpwvghkyxYTsfJEBOLIkyUC4c/3Fi7ULW6zVWkNRhorGB8UpmZQYoGxJeY0rS193A7gX/
	 gE4+5119479+vjKZFbxBZAnBGJfow4Bpdgfw9kQRsrwIYbSkjvIkznqWf92eFyjq1/BSn
	 NNntW/CjcceVAy743S9ZxSF39bYceNFzoAsSVSwdR2EW1Q2ysUg5S7P2apXCC+YUnYivL
	 10YZ6/eN9lh37ZuN8l5i9ZfBu0fjchLJ98/bs9qTdNzJLE4HDbs/3/RA7WgReXElSEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LnZ032Wh;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B41606A326
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0B41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LnZ032Wh
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36998507c13so228794eec.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700127; x=1793304927; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
        b=LnZ032Wh2MC5sfCZhAaiRF/VKoP71B0lcAQFt8dsiFz932CWBVDol4BqjNbLTa+up7
         hz43SYSsiHDf2/NSOKxACLLtWZESlH8RPCNdl5bmCPSRpf2ptmjYGoUfkALmdZYTYDUa
         PHqs9D3Osu89g+4K2yIoFRUY1/V1b+9RiPsMeA9S0N82afSrHFzTIMf9AwZQ95bIE6qy
         6WmYGVn/zeR37qd6vAjK+ST87sdqoMG9UVi6ghvgVvXpqU4O4hmg+QaYL6dHr22/ahw+
         HAm2To0z80LWHJpiX8/22kuArY9jq4i37sUARzqEURxsywVWs9wPAdE9jRbgrANlBL5O
         dAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700127; x=1793304927;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izXqkBzLnJqGM5xH5BnRMsFg7CLuWXtR4LH8CWJ8dTE=;
        b=m0zgD1+Eg3/P2PjJTsbuI1ZgXB3SdmLLlhSvtZ1Iqp8seAKrMibswII/o/8PQEn3KF
         R6RUUVorDPMrdck//PD8mLc99SbbFrZXHagbmWT5boCT2gVTGzgKfPoRQWQdK9/tj9d/
         0wJqsqDRg3zbJcKsU1pMTZXuVMOQXN+Lak4X3s6MkhXd6fRzY+/7QMmwOT41e/8gNPRi
         v/Sps0Z/XQW//QRgMTiDSXj6xSH8YWLBGwNS2isSX1SUu+PgWlbz+JhuTfpA1ytTVxYU
         YqCVoCOPZSM7/u4ovjHziEYvN8TBLlY5AAtTFmmfM9ok0doGW33hz3AvsM7p6eZUAhVf
         U5zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo5gsn9+oalbCBOQohI5H/ersT7bkPiPNeuVJr/2DZKibaQdx8rVgjvDwRzP1FB99NSreC@lists.linux.dev
X-Gm-Message-State: AFq9FYJPAWOZjQDzq6kLV0DgWHCGMYXpdHCf2NFEkt7dBONu55bjdpdg
	Zwc4zePSXUQ7MN7Q9bO6IvnL8qt/1c0iz4d10obmLxKtXdzy9hL+Y0A5y7nofJa7ApIhM9+9ZOU
	Rt+ETo8NE4w==
X-Received: from dlbuy12.prod.google.com ([2002:a05:7022:1e0c:b0:18e:11a6:297a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1305:b0:188:88b3:abda
 with SMTP id a92af1059eb24-195c65611a3mr316490c88.30.1792700125994; Thu, 22
 Oct 2026 13:15:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:41 -0700
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
Message-ID: <20261022201453.1717523-9-irogers@google.com>
Subject: [PATCH v8 08/19] perf dsos: Skip BPF and OOL DSOs in dsos__find_kernel_dso()
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
index 40267d3a725d..2df0ce58421e 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -474,6 +474,9 @@ static int dsos__find_kernel_dso_cb(struct dso *dso, void *data)
 	 * is_kernel_module() treats it as a kernel cpumode.
 	 */
 	if (!dso__kernel(dso) ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_PROG_INFO ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__BPF_IMAGE ||
+	    dso__binary_type(dso) == DSO_BINARY_TYPE__OOL ||
 	    is_kernel_module(dso__long_name(dso), PERF_RECORD_MISC_CPUMODE_UNKNOWN))
 		return 0;
 
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 1d9d3bf57720..cb77e82ed842 100644
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
2.56.0.307.g5fe7bd680c-goog

