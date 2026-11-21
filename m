Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244342;
	b=uAgtL61BGxcvP3jha48JPujbio8njkC9sEXKnxXrzPf3AQKEcEeKwfHVERJmEn2xOkiB
	 tYBdqkzIZDhF0q3Yo4it122OqpHyv3QQILVQ7CCgUChWKKuZBPKSmIOHymePI9kFQCR1n
	 9tRZV2JRpGMQKZWMHzKouZtLGGmkkyFsG9UDi6PTCRNfu0JZRnLRUdG8tPAtR1bRJpIqH
	 5gjUoyB7ZYcivYYNSYFwMpRUcGvos7xOMhJdD9poLlVDtOFiFMnukG0JA6yDzGqsacr+2
	 X9mRSfmRuNtINOvGniQE2C6PArw49ekPbG0zIBjd1rwz/uEAPULIumzcY0eQL89pIPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
	b=SBBJIE9KSwJ15NCDi/UuDVAwvmEI3hjY1OSezpZ6lxRz00tnAy0I2FWhtsy+wo2Xq0bf
	 GtI/qWu0eezd6e6DMUWNIRauV52ubCokPxp6H7rLSC/aZJlEik/t9ERYJOYZ1kCQG4/Ge
	 1iufLJOLYLNP6HCzTyndVQh6bfJW/ApqhPVw1w3/IM+YGG5suLyNaG2TBjhW/hBdAIM55
	 4tkS37VfgLsugouH7KSPHn9tXNk2Yc5z0uR/SJD7aCwgaHZaOUj6e12Luba2NFFhqJu34
	 3DApyCi0stJJne4W822eIchB3pJcEP70rhGx9rO/bF3Bvn2xtGm9ytmd51afnKJxmTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d65GtBIL;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A026606A332
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A026606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d65GtBIL
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862a5ad18d0so2153709a34.3
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244340; x=1795849140; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
        b=d65GtBILkNF0KYAPiMGNQoh1Svj3FYEtpTY2RgCVlvtGwu6GvB/GwPVNBgalwuAaL/
         fAfOMiK5JoZa5Uz+B4DR34JBep3bx+vSZpJcjNHAY4OLDIk3lopma2gXe1yDnszXBHMc
         yxXoq7A5bND5ApUNd9gXljC/EDVkbgeuBYZydni4JzAcxwdcv4knlO30a9xa3+54Rm4I
         z/gtaTwzZ2g7VdcY5ZQgYvqYU/4Rzo9spLVi93lLKBD1mG84BSSSLIK0OMCEjhQ4FNIH
         4chRYaTZeRBYJMGPxHg7a9d5ryo4TiO1GB9rD8Z6/dawdbT41/bGHjhYagn1oNusJJ4a
         RZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244340; x=1795849140;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5uxDxgfBGA5yTPHcCIqyXHP3BnAmG6Jm0Jp5UQ/3dx8=;
        b=h2kKdERywx47D43tjoYMNB2i069axHm2Vjr2JMhoZGP/u09pHHuL5dvSaXAyIIfKLk
         KTORbO7tvMScDh5rqu3TQSl2gZrCqGViiIBaH/JKb7oFL795sMMR71R0086ZE5X+tkXn
         +7QMR+gWp8TgNrNNxDDxlA/D0WQRm2kirw099z2iwQ1p8oAaDFO7ahPFmR02n3tvWy9j
         /lIp4mYscZP9fHtq8SvNyhlJh9qiRIKZsEt8EhcwpPk3xIHoDLtFUI/+IA7yZFLw6TVA
         JeeLRInJVZWME7v/PKUxqskWsmvk2SPYCn07iPtrXAYHBf5G4Ik0NwVpNw7ZqdhIu25L
         hMUQ==
X-Forwarded-Encrypted: i=1; AL+hErHd5DP6Z2+4bOl4QlrCgZFEGtJkRzaW90A6WRxfcRfUQzUnOBI7VWJwMnZDGSe2K0DYfa3g@lists.linux.dev
X-Gm-Message-State: APuU4Z+t5EwnXxfUdatewn8Hcr7FyIs1uPIfiHwygBFbZrkUyxA9yBIa
	bu9QZgxXH5tnND6X3Hmv/q4HthAEj76wKc0nK+tCOYREisd6oSh93wMpzxtcyo9f4KESNFTQ7wd
	/D9CEwNiYOQ==
X-Received: from iobdo25.prod.google.com ([2002:a05:6602:4619:b0:9ca:bcca:dd8b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:640a:b0:572:e8fb:2125
 with SMTP id 5614622812f47-57a09504aadmr5490293b6e.20.1795244340118; Fri, 20
 Nov 2026 22:59:00 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:55 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-7-irogers@google.com>
Subject: [PATCH v15 06/23] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
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
2.56.1.750.gf70dc682cf-goog

