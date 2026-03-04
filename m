Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D96F3DA5BB
	for <llvm@lists.linux.dev>; Wed,  4 Mar 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772651180; cv=none; b=cBa3HmJSYOTeegkb5MbTsgw7ZzWwxz/tMcbKtvm1Ze3mavFV/8zwVVIMk7ZKYcfedSQewmqNwFFceA5yxXkR+x0obK6ynikkjq5dGDXS8wK21FbHyyZlIZs0YtLBe3xmf1EaD0xVCY9rrdNx8rOMn3MOOTPwH/LtBwVdMUJg1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772651180; c=relaxed/simple;
	bh=rgHhhK904eJTrKQNA3d+lrJY9I8xSxH1hvgB75KvjM8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HLaMMwKKOpDPJWkXErSTYzrlzzIElng4VcSDQOyO3T2CQKcXY1VLh9/UPXXibb233LDRaFRUGn91CcqJYbIrgQNdcEii09cPOVZkPcfIY5KtCotGynKQJidGciUSjWpnUEdSoSNB4aJxqvvxBouJJtMgH5rUmrFzU0qGu7qGWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPmCjRad; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPmCjRad"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1279caef718so7209490c88.1
        for <llvm@lists.linux.dev>; Wed, 04 Mar 2026 11:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772651179; x=1773255979; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aZoK9TpWtH8M9FGRXi7BDR9wHii+12mE/LlkI5rGic4=;
        b=WPmCjRaduCZeBPH++CyNBRSrF7J6GXDt77K4+dOZnlfXiduLm+8XSOO53fAuYrzrzn
         eRCBdasUWHnPHOqcqR1yd8jqcqojuoUIpSlucvwPICXyVMWnEHaM5dvDclH+4yek6zi2
         g7AUWIhWRrli/QMbKQovIxap1Dgf8WA3xef/9cdhM+dxLD96FAG0ok6ZHrajiRRK18LI
         RAZejlDu5CciWgscD8r+8wnk0rZkZ0paRScEnm8f3l49HFUAMN1J1SZOGpiG54IxYQ8y
         +YtGIXRnnqB+PDD4tdpHCe3VLMv7LrKLu4OJsPn9bHACXuUbt+Lmq0IvS8/mRRozv+nm
         jWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651179; x=1773255979;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aZoK9TpWtH8M9FGRXi7BDR9wHii+12mE/LlkI5rGic4=;
        b=D/gueb1/USo6qiZwhEOJZonG8Q02nImY+GOiwqJyibIrjgHA8AKM389fyMexbgCr+f
         vO+uu4I6p1E3BGHwYC1X7wqPN1eh0RqglAof2gdlPtm0HqBXTvVkztIrdWVB0TNkVNbJ
         sTpBf+N3vcfzNNDF2N01VA5AKaKwjkIT2CJbfb3d1yJsddocYx65256y/9l+cWBPNjFf
         UbdD2EPK/biDV1CH0YvjGaWIMc3UMuwMRPjr40Z6TakchEeBR4CwubFO/l7a1yvxYQ+S
         /XfSKSIMv0mSrfiESEJbVTvE9A3qE84pj++AZgKmi+VW2ay9irVncfse+zRbodegI4a6
         KXWg==
X-Forwarded-Encrypted: i=1; AJvYcCWpX+Iic41UvG1MNRXVr9GphIynw3IsYH/YJuujJc/k2H27gX3QbE0CIHz/c0lGKeG+Auxw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9uMCI2XskkilU6TlocE+YTgR7FB5k3CSRwpGhIFJy8ynbNXwl
	rCtlZyZ7+UOGzx9/T/kjDaHRUHQleK3kptUy8vn5MI4/cAk36bUSrSNNLokOneAaoJpO7A==
X-Received: from dlbuy16.prod.google.com ([2002:a05:7022:1e10:b0:127:32c4:b97b])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6609:b0:123:2ee9:d1b3
 with SMTP id a92af1059eb24-128b7075854mr1369664c88.2.1772651178263; Wed, 04
 Mar 2026 11:06:18 -0800 (PST)
Date: Wed,  4 Mar 2026 11:06:12 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260304190613.2507582-1-pcc@google.com>
Subject: [PATCH] perf disasm: Fix off-by-one bug in outside check
From: Peter Collingbourne <pcc@google.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Collingbourne <pcc@google.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

If a branch target points to one past the end of a function, the branch
should be treated as a branch to another function. This can happen
e.g. with a tail call to a function that is laid out immediately after
the caller.

Link: https://linux-review.googlesource.com/id/Ide471112e82d68177e0faf08ca411d9fcf0a7bdf
Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 tools/perf/util/disasm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index ddcc488f2e5f0..9e0420e14be19 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -384,7 +384,7 @@ static int jump__parse(const struct arch *arch, struct ins_operands *ops, struct
 	start = map__unmap_ip(map, sym->start);
 	end = map__unmap_ip(map, sym->end);
 
-	ops->target.outside = target.addr < start || target.addr > end;
+	ops->target.outside = target.addr < start || target.addr >= end;
 
 	/*
 	 * FIXME: things like this in _cpp_lex_token (gcc's cc1 program):
-- 
2.53.0.473.g4a7958ca14-goog

