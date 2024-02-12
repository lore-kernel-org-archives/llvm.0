Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F464778C
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764357; cv=none; b=k87bFCnZ8UJBQH9ND2P8ltwSvxX5aDHwiHMXGG6r5VIxEuOVBaFKgjH2dZxLoa/SzBy3sH1aL9f9oN5g6fMja94MYAfvpO9YwNQKUy3PX5RlT8gV98DmrJsZuOBfxb167tG6SJY5P9P9o5Zame0LiKZn9/HjMNa4y66EKbmE3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764357; c=relaxed/simple;
	bh=cEoquvI2Ge+v6/Ow4yXCwb905NVQF3PwLLtFQnXzKG0=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=sS4QS9HVmEZsbESunCr18r4Efj/F7bUNmJ2zTWsn1TNS/y3maMe31L3L2LRWyHMqFiEZIvkqSiqUOBpSDSPQ9/MsUtpO1fHFP0MFeqEL/mnUyrg0Q60xESZG+wqI+CED+Cr26rmIX4UUu5+imJJy7cLbwo/ll3sieFdZaqBvRIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t+tMMOAI; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t+tMMOAI"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6ceade361so6188700276.0
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 10:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764354; x=1708369154; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQsEsQdYL+F7rq54Mfa+75HgoPY/TwxmW9rhD6V78kU=;
        b=t+tMMOAIPhKps4rMj6SkbIXJG+gSvmi+bpLTF8Td3WrdB0ZP+2iFh8+TqsW/pd9gGs
         r333Ei/HOzrwdGoDx6WIiU5+D39kpLgvwhc8SsY2Zbl/ij6ITDfS5US1RQ2KRYDXU4NK
         RrgVfQJtCjXxZlI+hJhbDsUjrKOUI4771piOjgwWNQgccjYQ2kMq4JHOhs8//w6kcK7g
         Jf0uupVWFHAl8Ltpsuwni9DP3+rb2O90OBvNQDcL56qkwAcVwqNX9ZALT2rXaFwslWOK
         puHJ3SgDEMz7kBbfhX71Y30Z1F6O8Sw5JHM/g4Uz4e0jGLzRndp+sO89LszujLS9lkHp
         +wEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764354; x=1708369154;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQsEsQdYL+F7rq54Mfa+75HgoPY/TwxmW9rhD6V78kU=;
        b=bmZIsJxneomRotNGK0ktQXJu7p/AAj/T9p3KTPULDRDOt/N+XMZHymNg64EdBk2V1C
         rfpfZJ4+PqHbh0rGMkCv7tHmRvuxzS7lZVDxWM4mywpOYq6hmjsOkaxNt7E9aMaSHTjx
         pVzUwowgAqIFZbVOBAZy5ZDtbdRKsHXgZijx/V/zh22fyNpYCUKPnFVARW2lH/eiBVSs
         PNw+uI4jxeGndYei7kVHfInHQd9HB4sA1+yy0UEeDuPnu/pd4A1aPJKn8QXVmxmCosaV
         FBN2TUCYkK2ubk7hrszTQTuhAyixlHKu349pDJuusNsEQ3au2TxStxOCp9QJ5U5SoO5M
         W6XA==
X-Gm-Message-State: AOJu0Yy7itKC8nF+WiBawrjTgSKjICuqh8Ym3RjcqTbMHz6NY1jAa33+
	cg3zpPFfDqyLdhth8BjqnilIku9CmuuP9TWDI+yO8YVSHTgKge6z9qSZ5Qmhzt9KIcksMnAVBNa
	TdaE3+Q==
X-Google-Smtp-Source: AGHT+IHiKcmNRG+oK564DasQqJu4KLrzYsGTIqh58ndlp5tR6/bM86Cw+35Q8wd8t+rVtSAhwGVk7oS7/43U
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:125c:bcda:4fe2:b6e6])
 (user=irogers job=sendgmr) by 2002:a05:6902:10c2:b0:dc6:d2c8:6e50 with SMTP
 id w2-20020a05690210c200b00dc6d2c86e50mr1160978ybu.7.1707764353986; Mon, 12
 Feb 2024 10:59:13 -0800 (PST)
Date: Mon, 12 Feb 2024 10:58:53 -0800
In-Reply-To: <20240212185858.68189-1-irogers@google.com>
Message-Id: <20240212185858.68189-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240212185858.68189-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v3 3/8] perf tests: Avoid fork in perf_has_symbol test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

perf test -vv Symbols is used to indentify symbols within the perf
binary. Add the -F flag so that the test command doesn't fork the test
before running. This removes a little overhead.

Signed-off-by: Ian Rogers <irogers@google.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
---
 tools/perf/tests/shell/lib/perf_has_symbol.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/perf_has_symbol.sh b/tools/perf/tests/shell/lib/perf_has_symbol.sh
index 5d59c32ae3e7..561c93b75d77 100644
--- a/tools/perf/tests/shell/lib/perf_has_symbol.sh
+++ b/tools/perf/tests/shell/lib/perf_has_symbol.sh
@@ -3,7 +3,7 @@
 
 perf_has_symbol()
 {
-	if perf test -vv "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
+	if perf test -vv -F "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
 		echo "perf does have symbol '$1'"
 		return 0
 	fi
-- 
2.43.0.687.g38aa6559b0-goog

