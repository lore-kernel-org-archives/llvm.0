Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E7353ED9
	for <llvm@lists.linux.dev>; Fri,  6 Mar 2026 18:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772823196; cv=none; b=XnR9gNJhULPjJu3d4DBj9NpLaQieeg2k3+DofokQnouRBXY/v2o3lpksy4jeAvzGKm1xAbQrGsGH6b2vXAwkSRurfgaqlRZpaIrldn8Akka+/vT9QqqrYCG0KFvA5Qj4pu7Z/83oVP4OOw5uGyqpbr9rh/M7QKdGp5HNihYrMNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772823196; c=relaxed/simple;
	bh=RtW6Tg8u9ZryYXz2VsGVNfTu1UK+gzTFNsD1Err7l/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TCxgi3YsnY9OpS2mpiDLqcubr3mHRASA64eljtSIka4oSOHCaW/+eVwIpEKlg450G1oUMzOug/0q2MWBO6SQ7N3s8RXZeFvjnQ8y7bHq1dY6yjs25s4rVD/H2ZruLho1WOGSLSR17LFnkotJDhFsjCrv0Q1yTfDciBXbf0CHkFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q2Gr/BTo; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q2Gr/BTo"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso10898789eec.0
        for <llvm@lists.linux.dev>; Fri, 06 Mar 2026 10:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772823194; x=1773427994; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ikXh2daPOy/qnwJ0aKuCaWp6OrRXAExiHsLKotJxvM=;
        b=Q2Gr/BTo8dPjRDFqoFVCHumQlokH/fIf+KmDLdQ/DgQ+b3tGJnV4CMDK8bjk+vZUDr
         uveaF5yvcC07iSivADNqH5prxDMJENY7HqKZF4iJwHvznc+jw54T9csdfZOSPjUr+4OT
         5QcU6Azu7jROt2e/9nKhWw6Hc4CDbkW8SgDOj2cSHwbxA7O2lGZCxYu1tfBZDeVtEavJ
         nTwnvMiQLigyGwkGExiGfyjm9B8vYc3B9HpcUpl1RGq1eSRLfmpslE9/mcy8H79UoxyE
         o/CZagLuLPI/HHy7M0feVINRPLdbc50PfvXJ7WLHkF1aBoX2pGZ/oGi5ohmJ/HiLj4RM
         O0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823194; x=1773427994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ikXh2daPOy/qnwJ0aKuCaWp6OrRXAExiHsLKotJxvM=;
        b=wx61HJGjSQ2Sw6bdmTYdn9244I65820IWK1GWmh8a3yEfWSOQJL87QPWGH0eQZXqE/
         RM2tHQHFC6nxyar+syBGMPIxKNcFNAJ9sCPUPTqfi1ElaeL/CtBzbmu3dn/YcgANhpi/
         eGF2Klb284qKJHq4Ixu9PnF7FW+QFq9sgWlmJfLsHJ2W9UQk3Nti47mnrETNZcDPgVft
         OcVWS8cGzRE72WvKp6m3wyLxnamo71uBY9SF6+sOJCrchFJOtzMTInquGz4pKBWHMbII
         DGgHPLod8ZbWX6h3rn0vAm3BZZokwbNPqkTLBqF0dfGQcNf/wNDMf0Ot9+IPIGbPjr7p
         itKg==
X-Forwarded-Encrypted: i=1; AJvYcCWGhsPSxu1Gh91hGY2HpmBQqhA/xNgFwnctFEzJwPW2ZZZnmwKgrvuvj/yAkR8yuz/Fl6xB@lists.linux.dev
X-Gm-Message-State: AOJu0YzspKtT7j+20csSn3GA7ElSwb6LO4mMXm/cpP7OFbUNcHWK8DUq
	IytcpNYk2vIviSUPEObbLpyFhEwUDVc1erpmot4vGvsixMCsj5P2FOqWN0LEw02ObJtlB+AicDj
	0uoMKcNROqw==
X-Received: from dlan5-n2.prod.google.com ([2002:a05:7022:eb45:20b0:127:54fb:a75])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7a3:b0:124:9fd8:4ba9
 with SMTP id a92af1059eb24-128c2dce678mr1284115c88.12.1772823193797; Fri, 06
 Mar 2026 10:53:13 -0800 (PST)
Date: Fri,  6 Mar 2026 10:53:06 -0800
In-Reply-To: <20260304190613.2507582-1-pcc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260304190613.2507582-1-pcc@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306185306.2017505-1-irogers@google.com>
Subject: [PATCH v1] perf annotate loongarch: Fix off-by-one bug in outside check
From: Ian Rogers <irogers@google.com>
To: pcc@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alexander.shishkin@linux.intel.com, 
	irogers@google.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, mark.rutland@arm.com, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

A copy-paste of an issue fixed by Peter Collingbourne in:
https://lore.kernel.org/linux-perf-users/20260304190613.2507582-1-pcc@google.com/

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate-arch/annotate-loongarch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/annotate-arch/annotate-loongarch.c b/tools/perf/util/annotate-arch/annotate-loongarch.c
index 3aeab453a059..950f34e59e5c 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -93,7 +93,7 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
 	start = map__unmap_ip(map, sym->start);
 	end = map__unmap_ip(map, sym->end);
 
-	ops->target.outside = target.addr < start || target.addr > end;
+	ops->target.outside = target.addr < start || target.addr >= end;
 
 	if (maps__find_ams(thread__maps(ms->thread), &target) == 0 &&
 	    map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map, target.addr)) == ops->target.addr)
-- 
2.53.0.473.g4a7958ca14-goog

