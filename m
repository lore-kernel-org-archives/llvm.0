Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678E4C67
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 00:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706746539; cv=none; b=aiiZnPDCcDk1RPB6pN+P5C/Q6N9gwDjmnDRyRN0lR1WjhgZEKGaPJemkE/LNWAWCL+p3cgf+I14TBFs00genHUGfnJc5p4tHN8WhKveNTt6uh24qCJEKzcA30DvJyv8uqUJbR+CraN7G1NPv2rl9c27HOCVBBKw28zS1eXQb4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706746539; c=relaxed/simple;
	bh=BgbevzhY5rXwE/cxiO5W7UDDeP39KQp1tv4kTf0nGCo=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=S0cMa2D0dH9sB329obL8x42gjgBH1Fy+tWC8fLJpc/M5/KeF9khbSia9X1MmPx9p6P0op7Yg9HDu9f5znZ/k7ep/8iv0cDTpecQuESFqljWQCLQS8zviIaxGzVnSkh2WEIAqvm9fJxnlXHPQ5ZLGXIQoR5eJyW2je8aPaBAPLvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ocQ0oVdE; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ocQ0oVdE"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6040597d005so7230097b3.2
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 16:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706746537; x=1707351337; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjs9Prdq5u0ou9NuYNbnA11pYi3QUD5UfnclKxl1vhM=;
        b=ocQ0oVdEJqQHPYPJuJBfu+msqoGJaRumv68sj+SCK9KOlzbKoPlsXwH2iFb2tl/JiN
         vSQo3O7SpM+9FHb3RsQKj7rcIOxa7jA1lnROVKBpOUUj/fUolCNA7lZlnz2sdJUlF/tD
         +GZKwWtqsaTJzitltpmfqt7Pie5MCHqyW6WUW/ExhcHio7QaKMTEy/Tx0Z8hdmYUI4fi
         bykQppPDprpW8LvtM1RXZ1YB3/IOHpnS3+u5cSkLRsC5BowstlSO/e6qsfDV8xCb+wOu
         f64NlByz8UQsYhLl/Vo6/nAsv5VyNDqRCtc7V6331TTKiucNzjV4s1kw1TjwKmO2fzFM
         y9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746537; x=1707351337;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjs9Prdq5u0ou9NuYNbnA11pYi3QUD5UfnclKxl1vhM=;
        b=w26Jfibfod2N/4OCy8h+ZnUpH1jcp8NXYdwjdB9+GsXlFCsiHhQKrymeF5IcdiAJl6
         6Ra44cmp6RvAXgyiQX4C1ZZbckYOkdsafCYkQQA+84r5Dygygvb34byPaO5xLYEfvKa7
         ZsS8o1KxclnIihibdWV1n9b/6EYfO7oMVZwt1HtBiyQKh0sIfKtFeYbdivIzK/Cko4De
         AIgcrJW8MiA+D5K2vgeLOXdAKfz/g+JPG+UuoVjRdL2I5U1W/y69yPU8buhDCziLx7C1
         5WD9AtZU5M40rCRu51RpvRhP8F2op5/9Trk/kJEJixY8N3RXCkwTzLTsWxplaquClNIF
         8JAQ==
X-Gm-Message-State: AOJu0Yyb11XncYAS6oFqhaIfKo2wx0DPfDDMn2wvVtQkQmb3u3TDCoWb
	yNWpPCjYPNVKMXk//E7z1alUtwv1FlTAEAt4VMxi3306QVkdnm6ZYMqCboHKeBaKT/AI1kJFsWp
	1UOAstQ==
X-Google-Smtp-Source: AGHT+IG9f55j5uLbOnosxQV9gtm60AVV6VLPCDRs6eZec5XZgYDiDclOGHQZ3LhLStMno2rqZyYBHJGAGdPv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:16c5:1feb:bf99:a5d1])
 (user=irogers job=sendgmr) by 2002:a81:9b4d:0:b0:604:5ca:5ab2 with SMTP id
 s74-20020a819b4d000000b0060405ca5ab2mr727828ywg.9.1706746537532; Wed, 31 Jan
 2024 16:15:37 -0800 (PST)
Date: Wed, 31 Jan 2024 16:15:02 -0800
In-Reply-To: <20240201001504.1348511-1-irogers@google.com>
Message-Id: <20240201001504.1348511-8-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Subject: [PATCH v2 8/9] perf srcline: Add missed addr2line closes
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The child_process for addr2line sets in and out to -1 so that pipes
get created. It is the caller's responsibility to close the pipes,
finish_command doesn't do it. Add the missed closes.

Fixes: b3801e791231 ("perf srcline: Simplify addr2line subprocess")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/srcline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
index 034b496df297..7addc34afcf5 100644
--- a/tools/perf/util/srcline.c
+++ b/tools/perf/util/srcline.c
@@ -399,6 +399,8 @@ static void addr2line_subprocess_cleanup(struct child_process *a2l)
 		kill(a2l->pid, SIGKILL);
 		finish_command(a2l); /* ignore result, we don't care */
 		a2l->pid = -1;
+		close(a2l->in);
+		close(a2l->out);
 	}
 
 	free(a2l);
-- 
2.43.0.429.g432eaa2c6b-goog

