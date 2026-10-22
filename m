Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700123;
	b=TIooXdwyL/g5s2tvbrFsD9PpT6ufjrqCD03rfwp0jCknPnjeD1ujcIFQxvKg8JXeNt1s
	 EyeZaH4yaFQpVWn9FISw7SuPI8vjHxJ2iKDuRmLTciEsNyVV5xUBgWJ3b+qHym/DypOjp
	 kjtmJf2qDt9kHSg70TtSt0vxEYCIctGCHz1HKwwtq7qf7zaYA1yomV5IlMRy/tdS2zDvK
	 RlwupRT9IzkfFONJ7szWRGSoXA1oAmZNzXkj9D57Fa4rDRhbewwHGOwGqVUYEoFXMYBTx
	 l5VuJwnwipnn43aGDbkN3lZ7JgEzqKQOIYbqM8b0pIw05HXL/iw/v5d0pRJVahrBrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Bm5F5L/Tc7r70KhD0cqJblZLBdriiRHdrl4SVSE1UvA=;
	b=vDoTqcFJ6rw0BHxsRpDgXa74wXoInwA30Duy85Xs4gRsRHNJhDtZ85qwOFz8AFKkSEgF
	 ovcKjpCIjp4qpDHVTi4ylYntRjKrHM8jWy/HFTmNTffFXF1vib3sGoGe3LCCrDjxlHxZ3
	 bghgh/vT93Y+4S9Q8Uqv/KUip7eDoGQd+6Dj7yTfWaQ+2/7rjp4Xvp3tWvBxOt7hrwdcT
	 atW+dUzC6gXJJqS1+j4LE+QE1/pBiMzH8gfshf1+W3Zuez7AGDZrhLQTr26iqUtyVpNMb
	 LnrrVoiLxeEcxzsBpMIBH8RSe1mNMe3mcFd5AVrLpd9zWLLXIAPTJJL/ECTiIQtkeVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O383pNsN;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5CE606A320
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5CE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=O383pNsN
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so152496c88.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700122; x=1793304922; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bm5F5L/Tc7r70KhD0cqJblZLBdriiRHdrl4SVSE1UvA=;
        b=O383pNsNkXuLZgnuQp4hDM09oqAyOtxf6cxQRkiPTUn7PWZUlPJshzjRlVn/6U1Rt0
         v8sWOkSO02hlr/hfohfSQASwSB2lQMhwmwGSmaW7EboTvKZUJL81vHQ42k9uxE0fzCBY
         ge597ZvOl2/qOnHLQip2Ub3IiW/7q0oxVtqkx8enrW1rG+NLsJr6Q7oVmyQkrfRHzoF2
         RxUsnhoy45xYC9fn2GPqrHdjmsOwAMdXja1upCgmAxeUzAx9kDv44MmjNTKQWnWqiOgn
         2dDUtvnKGqdX94cXh8qPF03DniT9vO2vphbQ9snyI815n63oLb/34tIC5rrXuYNesh1N
         ZLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700122; x=1793304922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bm5F5L/Tc7r70KhD0cqJblZLBdriiRHdrl4SVSE1UvA=;
        b=XuCLg8tgj9o7KghWSgXTIbVhRaHZ6TYnKaEbp/GKB/BVGs7D8gUW5QhZ3WXm2P4K7J
         GiTsEgr58jTXsXXrdn6vP11u9GGjVC3FtD9Q88qh1ZPRaUtqmrQMURmLTrn29VD1o9Py
         +4VAvXEHa3w5DCyL9H9QEOt1lUR0GWFEJ7PwaRwkNr6DRsP0C9UMGkay358rBM8Qa+Nl
         DCd1ZEgw/DuT7758Ci9eVIo9T0MElYKUcxn3rAxGx1tzaro/pSGWRnk2FD8rloaXWgit
         Dt4F6NABIMpR5o793vRJMQo8ZTrV0xbFDkiy+JXP2mBLA18A9v4RK+BWLZMWNexMOPmH
         fHRg==
X-Forwarded-Encrypted: i=1; AKwUvBw8u3rYMuAif2gBeq3xP1Uz30s45JiJvN1rQSj9ZzUtUvS8jcRufU9BP3eok3+cAJznZ/XA@lists.linux.dev
X-Gm-Message-State: AFq9FYIfoapu9qoPLPrydsMYwv2G3xVsh0vDfQkwUyYxIbkmvqynSOIw
	Zj+IVqMtUtlC47kvw8WjRjwWrnOnd9yoW1+Rgo52LX1p7EELtHiW2KeA2mL+fsmb8lwr4N2/LLY
	jj04mGdLdWg==
X-Received: from dlbpu2.prod.google.com ([2002:a05:7022:e882:b0:166:1a44:a89])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2302:b0:168:3243:c91a
 with SMTP id a92af1059eb24-195c44b7990mr296334c88.13.1792700121995; Thu, 22
 Oct 2026 13:15:21 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:39 -0700
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
Message-ID: <20261022201453.1717523-7-irogers@google.com>
Subject: [PATCH v8 06/19] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

