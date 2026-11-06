Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948644;
	b=x/qvYV0wOMTX97x/a6762Lu7RuyV4OxnoJ1DqrnFcz1LrtJyRgv7ja/hpgUGjJmyAqUB
	 L4tWGaNl2CqJSgbncCKp3GzOgZ4taJ/lJmaSDYWHiT2gLxDsJCl3rjWbApEjhuiQnvBuX
	 skqC/X/A99MeFCkovMzFDNGKqJnC+WK2L7uKm/QtYGY8mWEnh+qJgilJ0FJy2E18YZ0hf
	 nMLiZmDmCywAQ//+zk8rGhaup6WqF8OLzUz/HBGd5OuBny3OKssuD4bgsw7QpR/h8nzs3
	 QVpZdZhD48+wJ8BinAYTK4iQCEzbUnPCDutc6WggRtoV00Npr6YWbMiKn5y9TzWMsPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
	b=Ph0W/+BAxo8c5OVnQFvnMJzJ9jaC0di5hW45MZBPZufYVvGndIRtchfVdlf1EW4ex604
	 UmhOTuBHIzpAp2tlNeAWrrt7E3UupudBmSr52BDMvfK2jNQQqy9s2sA9mNHO0Buf8Nq26
	 PbRDn3dVaa3CuPM1OfwEFyDlzgiJMYgsEvziUJaWjdc0FyVWizGqoWEsRlDr1HTZOXiep
	 XKDtpUEJ/uitOkZRwWVEUHmFU4ctYTIMJ+wNJQjkO1jFWFEaPihgLLu2UsR3Mld0nFJz7
	 XeMwF7DC36BGzq3nX1xHRh4HhPII57rg79vFhuwuJOs1di5tVfcMW95RJbaICkyMebA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oV0Kp6Em;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA9606A33E
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51DA9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oV0Kp6Em
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso517397eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948643; x=1794553443; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=oV0Kp6EmhKbwnV43yr9Wcz9PimccxYFR6/CjMfDyac8gRFGHr04Ui2gFdW3suoGZJ2
         Ee+metxT6HSJ2sGkqqpYG/ifqTDVkAC8GYD79FLirX8rZLUNjlDdnS1UZ9PYAbPIAoVU
         jI5RtMoiSBa93D+NdJ11vPZS5n+iXC/iw5UBBKUDTgfEXLVH/JJkJv9YBDhKzFTdZTtB
         R1hyC823S/OvEhX4kQ2ww8xwhDSMCidfZ0jZv4s9NofLdqSWu/08iHoaN0IoZVh4myTL
         uExnjTWbnQaT0H1mkS1/YpvdVa3fWWxM3wGScni8dTbWCKdW2XUl1TqdBLTq4R54mhu3
         ygGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948643; x=1794553443;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=E4sCENx3ym6lQ5J1iPdmkPyNtY4IAfyDiG/H/ykmdATuHqYxPm0GH5jhYvG72vsHYM
         cZOQOl8AYyWD4UJmAhb1p+5dE5a8cJT6lYCN4tlERqSIdvBzbTpn6If7YmKDG54imzxP
         L1KLDbnJef0Sdew4oJe7dAKaQGbK/Of4eyQUstYZ+aUknCOszFtfbXZGb54oYE1zK5Aa
         IiUTZ69F4A4llDf0g99QHtFJpTJi7EYrKPkDM6moZhnR8wFkeV5vU2IsEOOXsgjZkzCh
         Z0J2Fit+g9SJyxaN8DKvXH5MY6q9Dwy8Rsou6iuGisuylTCMviVjWbpWZKj5wecvcYbn
         qcTA==
X-Forwarded-Encrypted: i=1; AL+hErFPSOinJ07LoSl+9m4ftft2UDnfG7o57pwpAJVeMfsAsQ16rsElJ3uQ0+kE5a84LUw2znu1@lists.linux.dev
X-Gm-Message-State: APuU4Z/TFsimZ7lZlay7N7kqiY92I4PNbDTa+fYn/5HQi6cpf+ooFlZO
	4/w5rCxz2NNmXNt6hcvKb3VfhEmg3FZ0BH+fst61q0fTtJP7g4TTd/B49PkaEWLBs9SO0Qcl/GJ
	xuuQHjba9gg==
X-Received: from dycrv5.prod.google.com ([2002:a05:693c:2e85:b0:36e:b3e6:ebe2])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:80db:b0:36a:1f4f:3e9
 with SMTP id 5a478bee46e88-36f75444e55mr1973496eec.20.1793948643167; Thu, 05
 Nov 2026 23:04:03 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:30 -0800
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
Message-ID: <20261106070344.329897-7-irogers@google.com>
Subject: [PATCH v10 06/20] perf comm: Add __guarded_by annotations to struct comm_strs
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

