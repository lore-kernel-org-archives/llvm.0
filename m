Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622371;
	b=MnXVLHjJ3NQhgblmOKtYGu6Qb99Pa4FsIdQweHfBdj1DjFTlLQ7ZHwWbSx8pA962qG7F
	 5ixNP4C5Qt1Mhl9NVOXyp24wnmE5AIVqb/9MX57nf9UoMiEI+by/e5BqTgi1vv6JsLv6e
	 T0ypT47PbVwKvVw+dG8dDx/gwepFIf7yX/Ct7qBXUBf3Txbs84CGVbfs4EzLWTVaPeIfs
	 8BG1Mxmn+q/aMaZzeHeqfNzpB6mJVUTd8V7tizjaJjfKqCqtYpwHh1tevdbWRiKresBNn
	 eI+3ybtxL0Xfe/btfy+yFyftBwCCF4QIT8TNo0Zb2j+eVziR3kNJX+5ZEju4bGt4r2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
	b=a2rrX1uA5izx/YTM/mAQ0JOk2V1dp6S2UPNH8xz8NuyJdlbh7IUMsAF2Qs7n0rjr8DS0
	 9NEQQaXC9WMecTwuJ1i8YCDb0quXmnNYvqnGJAIwBvON4bJgiGUeBdvmTpoBTPJsBnlzm
	 EsNmL0yXJriX6kKRF9SvKKKIac5/cQF8oU3Sm1uptAF+N/ern0S0S5ZT9ayPeImBBeP+S
	 KaEy35OxqAtfWkUtNhBNHLPy3Zmstjau3Maxe5awBFXcz0Se7vTWS4YcmILuKczkmkKGZ
	 mG8MeXmo4GZIZ76caCNIEFC7bvdOjt0VAsiYirI+HwwGXdwBxt7HVsMzJtKF3gK5npg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qQvAnai4;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB056606A324
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB056606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qQvAnai4
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so2815255eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622370; x=1793227170; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=qQvAnai4zek/8gyxDjXe4G4BDRlwGLAWBgjLF8J6qLWZsHTpQYD2Rqp5+n12L+PitV
         nSlXXxuFAeSONTmQp0iZ7k+0z203OmSmf3uJ/vezclDx+etrrXeb4UT4Lf6+Z2sJmMVk
         DOfcW5AByeIDCcavGFasWjcDjc314TuUlKWh4naM3+9dHT+qAhJ+kLyPSmSg4p9jaXNY
         AKQUKDK1dO4F4rK4a3aVB/E6JaPrHgklD8zeZsmMDpnS17DEfmEzNlfv1KB66LxjAoNq
         raI1mqB+zMeoe7UJlgSdrAm2mS+RPVi/I4+nUsAjaylXbBoDrgSgXVveE2IIH8STaepk
         jHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622370; x=1793227170;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGtpnjqbgsSI0YGAfALssqGviHqvt2+cOYL3HWLbbPs=;
        b=zhREyNCm0HGOKTRGtMe2eyTcPvrePZ1XpexgnEj/+qM90IFPvBjmS5wQLrijmBa1Qn
         vk1DqpTCvAbwl/PJPvW+loqni13dJgo92/zy/gGpo4y6Pb3u6Y8tik0r7o8MxHo5w6qz
         DoOsLlBuVzPQm0RzEzgeBp0ryeS1Fp7oBPHfX0AtPLqb7fqr29T+goybgH9D9aYTwh7i
         xuW2BzIkgI7LClXz+CDMvw4Tbh4HgcOjfisXmQC5nTNcgun1X4Dnm5dhNNBRe3HoBiKc
         EzzJP3H51GTCpjf7hqp1FLiMmfvi8SmSN4a1eZRLLhz+86yuqZRinY4jJx9byApRi1J+
         CxyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5J+xL+f3a+IN59BCEXCcXPwO7gLmiQqRmudbLPctKFpqZcF00kYp1PNjGjznUksr+oSfS@lists.linux.dev
X-Gm-Message-State: AFq9FYJggTzKzn2thaemgNDo+R+kcd7mEx8mA8pgU6G6D7tkI2VG59bl
	5W2dO9o+KNGkbzVdBMJJOYBHwckc26vygD1n+GK40gWzzEdgrZDG9S3zNlnqb2hEdnokIzW3g+3
	EAGwsrpR72Q==
X-Received: from dly10-n1.prod.google.com ([2002:a05:701b:204a:10b0:15c:a5e1:a591])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2810:b0:14c:d8d9:9502
 with SMTP id a92af1059eb24-190a52dcc93mr3712312c88.14.1792622369768; Wed, 21
 Oct 2026 15:39:29 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:38:54 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-7-irogers@google.com>
Subject: [PATCH v7 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.218.g1ec904b173-goog

