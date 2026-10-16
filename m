Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A055A58B6DE
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171896; cv=none; b=qIS0+Mbkfn5/49s9f3yIIk3nJLT2tVWqvSD25KL3gJtHRVrvXEdljWf/C6UTky88jSsyRnso41V7o2IYilQt5aRU6+EzwpUdhR/wMdcLbBqEJI0H19qPQbrU/5iBopGSxuNQc8DIjiqo2Nf2z5Fd8LpnZ7cZPZPqRRx+70zoLrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171896; c=relaxed/simple;
	bh=NHNHFzCRJCoNjfCgzgh3uLdZFtzpAhqYSL5RZUodvIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IUEPKktCfi1NOYQK0pypOVNus0B8E5CxeJrtFZhMk/NnzHq7yc+RJwjBkW9VbpssPnuINhIXo4KDiPEDRlGAiQ9Eun0WCbhGHzZCpoUJoUcMArxtXiFUmTzMgxNgLDZHv+1KYI3YQKKyHa7t3991EpPeaG+SX/cdHHQUrxGYmj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XboQrULo; arc=none smtp.client-ip=74.125.82.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XboQrULo"
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso231179c88.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171894; x=1792776694; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=XboQrULoVW5Gxgg7gUTSirAx67/UEXpnG3JfypIfKyA4mXVzsqbKYYOfi8iOcDYWtn
         TomHD2mettNjrBgdcpCJDXkfAqBncGfJNhX1TqpD0q8iQhSz+5VECp8FLGiOlq7K8SQg
         luclKu4PG/A/EqOBvJ/Vqcgvs7RyxnTX9vLWMmqoemRD3WHDdSqyWqOEgtYLmWVNjLNk
         guF5zHjBDHowpoIHcqfA3onC65BrWp0EsDNXsVhJ8a15LypyaxaZECS9CIg0jFwHXVGT
         f4z7nVgxgds+EWrXgCb8s7hKCNQuOcmsg6Bs/486rOZnxkm2qgD+Ywx+SV75gn+zekfC
         TPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171894; x=1792776694;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0AxmQfbpaXJI1ahn+7h0PxdePVBkvh19toBGNbRn6vg=;
        b=MbaxAWptBziliNn0ZizYL6ZXPQvY+Ntp9hSkyCKdUrWbQviLa4vqRDUaxQsEYHb2sY
         FS069MYbfdmrnJo220izc7TgfDpv0974f/q6sNdZka3UuGSjeVH6hiZB/4HBCxUGxDuu
         r47MTwHG5PBKS0d3foX7q7HFvfm3yJKOpbWwsT03s1zRkrdR7xE5T9lLJMH1GhrnZdez
         d/saZnlbY7OZqidnJQCJJs3HRRJ0aCL1FmweIvOJFLZhSlH9HiPy+7Doq5WJcMUcVIKv
         8GigxeqIZksRHcPxxHcuF3q3owV0EoN4oTNVSPUNDRjc571Wtm9Myns/nGZjgiThCG8k
         yASQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlL/MBU4thwPsfhlysM0zvBCs4KylVWXgtmp5+lTZPpY834JZTtmTKFcpLUsDsenN38moP@lists.linux.dev
X-Gm-Message-State: AFq9FYKibxDbqNRfYuRCAGJ4gbUAhahdyX/CFJSvTbwc1vO8ksnNOCqt
	cprUoTOBEGpcOrOBsaeZEL3Ouk6wT8/JZRHyEPm4+YwIvf5wo3EHcZCn1rMsTCMD7obSb2VG0LG
	8+/ToAHNq7Q==
X-Received: from dlbek1.prod.google.com ([2002:a05:7022:c81:b0:168:b4b9:d783])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1501:b0:16e:4723:5f86
 with SMTP id a92af1059eb24-185131076e8mr776382c88.29.1792171893142; Fri, 16
 Oct 2026 10:31:33 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:30:55 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-7-irogers@google.com>
Subject: [PATCH v3 06/17] perf comm: Add __guarded_by annotations to struct comm_strs
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
2.56.0.212.g129ede20d9-goog

