Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825971;
	b=f9nb51ye+HgxWbJmoEYRUhy+a3hmdqAC646HN0C/v7v/ud4k/E++dWaCDv8tssKapf/4
	 1JvvmCjN0T3uMCUcgvWMOfiyaiuKpH/nIhn3tikQkOmSijW2+ho19Rb3U65jlwVxx7TXt
	 BpwyhDswuTHF+lSE+gJoTseapgP5qW04HwVXqnI35PoZQ+ZovENgxoe+u6WrVP/dQ/LT1
	 +ccinMzbflvsa2yVkTUcQDCO8jFu1So6re/TgxfQpoBXa5kFIoIvd9AlZizu5PMgRvGxZ
	 MddtbT7wLHrmpoPjKhgPD2dJN1XfM+ReNKwVhUwaeBq0zfjbO75EZ0/KkQR3ckke3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
	b=QN20CtaGuLVHBwqQTOCzykmtpwS1JF3j33w06u5eqc8Ca6ZXIQGdZWzyKk0HcosIr8gF
	 o6SCr62hXJmDZdJ8o1B5Ig/7TC6CW+o81UWuRVb11fbHicuRc2TGCuIpHrkwf2kw1hBlu
	 SvmxuBW19LNZ69A/l2CXDbL+W0Pof10uPFvq5/5EcAPC8R318qTHP4EzmYaxfV64f/MvL
	 crUjA8N78aqF2SyvmhT95xXvouVfzFIIEFZuYTjCxLYrR0zxFhg2Cmk+uJO6SHxp4H+Ml
	 bxI7Luf8I2iOByIsq0S0oHN7qegLkyRxnkj5ick2SG7VTDUomCcrhoKg1p7OOp2znQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="JDKN/Rvx";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484B609DCB6
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B484B609DCB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JDKN/Rvx
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso827228eec.0
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825970; x=1794430770; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=JDKN/Rvx94OhXSPJYC6S3wMooxRGL0TPQ+VzDmzkIoTH2IMwBsypcPI/HXIBJisHRR
         1+qapj46Vm1s1jp/hhKKxAXtX34Qp95KYpVTyu+9qIH8t08YrxCmZaF2cPO5VbkvL/43
         G24hxYwdvKD8+MGtUJux0YeaH8By+R9W6RnOgSSETvErg8trKzMzSpUlOk67zIYV7VX5
         9BgOP5kQGAJ4Ule9N5qb9o5kBWdMa6Gd/cQkOfJNPPXZWF7Qv/D4/YniuuH0mUtDiQ5Z
         Kg8SNZqgEdbIJTpDkrOshzKhXT07fdg+vjNAzeMdNrE9zYOTE4sGwltE6YCFsLZvItsE
         VO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825970; x=1794430770;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlGmy1iETR07VpwAF3gSNr7L3yDUEizC6SlTALxKZy0=;
        b=PGyyg2vXeQoncs3jjYtTJcyA15x6IMc+0SaybvZz0tTzhDGnN0Q2HES2961tLUVHLY
         umWHvWqKWyZJ9euqEy8o8xN/XWyE0BDvUSfmUbUqxjDAMUildCl2boGqy35+SEpRFj9k
         g8b0M/ZyTRO5Giu5buvxsS1JIlxvYf5Xit6TlwLo0k6bBFXYzBulIiWc1Tk9hoGlMW9w
         YZsdNdonybxi9VcLEmr4lg812lZw5ZuOL9CV6WfPPr9zUHfT5iGxNRrrEWEyAqf/QzTO
         Ap8joZ1ApVznU9V1MI3AggpRWy04yNfsy3ITYBwiOiln+xMLsyjwrlSY+FEZ0fpEVZSQ
         aoEw==
X-Forwarded-Encrypted: i=1; AKwUvByOSwPvnRjdU0pRcUpGXW32uAJka7OflGWOcmTqILKNRIN8f28+D8ftzrZwPQb4+2zc9KNS@lists.linux.dev
X-Gm-Message-State: APuU4Z8Q4sikX0ZJbwYBEG/jvED24oMakuU1rItwgv/VK0i6l12JEZkz
	nVRJ7c+e6gLD5Td1vKF3JcoPucI8WQ3hB9NvbUQQPCy4Yn0hVAzIapTovLaMTF5TYo1G3DUJ+xq
	0CCGZDA9pPQ==
X-Received: from dybml13.prod.google.com ([2002:a05:7301:150d:b0:35a:3045:15e9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6381:20b0:36c:d1fe:84ce
 with SMTP id 5a478bee46e88-36cd1fe8f91mr4237665eec.33.1793825969426; Wed, 04
 Nov 2026 12:59:29 -0800 (PST)
Date: Wed,  4 Nov 2026 12:58:56 -0800
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
Message-ID: <20261104205909.2078411-7-irogers@google.com>
Subject: [PATCH v9 06/19] perf comm: Add __guarded_by annotations to struct comm_strs
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

