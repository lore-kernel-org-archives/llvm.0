Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026480;
	b=5fHptWVR0otNJhr4xA9KbFt010EC9xYl+f/79CsN9mdBfsRmeWc90JNDBlq0KK6wTQiY
	 GQcFejOFXL5aqK5Aqw9+iDL6evvVrB6lojoiSayekLzw5qmyoaXQpiQoHlGSk0PYq5G8V
	 g9b65xKNsAuHBu9hcFGo4PM0F1fmAfORe58VF5vmFxZMtQHM2VRuJlOvH21MlsHlXuf1k
	 tIH2sUO4ILEvSoqSYI7GE/s463vjWyyIdCJ2zuM1v9XwZd87Y3s1WyIlBR12bRcShFuMc
	 SOjtrQY6eap6rzQk+/2Smcc8vGMIKJtKwiPAHJ9aYkIvWEd6Komo0b00ooegyb7zhyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
	b=UYQPXgp/N+NexBbgAwIuAb1s0oYGSTVuW2eenskqvcws07dYY9c8NspYGNDJOCdA3PTh
	 4JqOlseWZhFYyGFb1IzjA90KBeTdMKvxH0RlWgOVmSb7CfU8yqy5PQNAfvZuvBUAEPgU2
	 ZF2gGN+BXJmnHcr/NuC0kZ9ZKCIwy9V5sJwlkTdJpkeHGr0XlzfKmH0Ug5yEk86TJM4XU
	 jbKi9dheUwboYisHtpsAYQVmTyjP8dsULeNYLFUKufRCqVBl1baquFWrVFsb97H0x/NSE
	 dESD1RoAGkIKkiSxNXgzKzFHBLHRoDEkdwWsqfRJ2s0E+4WMfg+K28cUOc0WDkLYZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Rum2/kmY";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5F9606D807
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5F9606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rum2/kmY
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so1950802eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026479; x=1794631279; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=Rum2/kmYR+Gnvg0PkWKYAh9eVnPNCErehl76ggkg6m7lBkVZhdT0WHdmBFKT1M5Qyk
         lhgcj8rCEZOIznnHXcvx58HmVpDbvi+D/FsQDQuK772czLqmnZsTW9V3JmiUETjxHTjR
         wWH/xliBD+fqrZ0pufxll+GeWdAh9tCbLnUsVgaHiN6s20S3u6RGWiwHDXfoYQ6gJsqW
         hqr239+vi/vQnrgRwiaMynDRPBEUwbAfULfHTwmLg3DlBTqHi3/Bwg1fm8dvvIWVn5wD
         P+xo/4Ucipq4/hloV/x2Apge2Vum39kvKEYLLOPNw0cSxtfMynA+BnPqe95p5GtXaDT9
         BR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026479; x=1794631279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=EG0Hbw55QQ+U1S3UeQcVs3+K3Ny7+iVQeFYo33nPQYNr5HI15Y0r/KrTAl1YWilL89
         kuxgoNTlt3ucsjRUhHBa/PUJwRK0T7k7Ha87p7cFhrIuL26noxtlvycFzMb5uQA5otCT
         z9nC6fOW2F7qnLFCXefk6PQ27iKdNlEDKF3DC1nrV+plnlHUIq/XBCMKAfpJ9fFiS47m
         nVPIreqPdmptAMlf139SYmPJLXTKYxD64S4/XB/NiD55t9C7yTgjBnF1EDM0KMH8EcaK
         oc2qDnXY0hzQ3FWY51aEV52gba9Os2t3iElFg6aO8z7arj9yBuOI+oH/Io9oszKQGZ3X
         axaQ==
X-Forwarded-Encrypted: i=1; AL+hErFr0a6pL06oxfHZ+HGQlIXO03C8Gskh84rT9dlPBQ2vIqgiFZHgLjPLJgygyjXxkpb5RY6B@lists.linux.dev
X-Gm-Message-State: APuU4Z/e6F7xYM1QNiUaB+5UhVyQV8lsjC4Gk+h7fSNEsFElCg/kusjK
	YjdapcrXg3NrRLIP/FxnUrXrx3H0u9XFNL531HxbE4nLctniIzJ6AqOlxgJ5qthR8aw4tVCt49r
	vkna3mUZoog==
X-Received: from dyboy1.prod.google.com ([2002:a05:7300:ed01:b0:368:57fe:3057])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d813:b0:369:fe81:a575
 with SMTP id 5a478bee46e88-36f772fa7e5mr6450670eec.35.1794026479099; Fri, 06
 Nov 2026 20:41:19 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:47 -0800
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
Message-ID: <20261107044102.1506626-7-irogers@google.com>
Subject: [PATCH v11 06/20] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.0.455.g6c5a503b38-goog

