Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9472115
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 18:57:50 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-4c16ff0159eso239936097b3.17
        for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s0i2zZBdrCWRI9lmKA/36c64wVimSwf1CiL2+om4mgI=;
        b=e6pfazQiYivaHP9XqMCP5fL6vnwPvriEHQad3NVSdxFMeQuXIIff+6pWflu0WlYXdC
         QSJgNpOHrcy2L8irdpn2EEuVQOOZcA7dXwJzAFkLPCKJaDSdw9yU64m5hu3zqlX79ZDt
         wEJ1B3RaFiU+7nsE57mp1uu/psdWgbR+JAoxPekkl0pishgP5Y2rD7ajxh5VZpC6fc8N
         XI9lzEk+uKqwbSqSUE/aN9LI4a92Vaw51ACQQjTd1r8/Z94PCWvKZXPn95CupEv1GTyL
         LqpE41JbjiwNh+sOCn4MCi4IbTXXv9aXkhuzaqxEmbWytJZNEhJJ8HZQlxdbQBCeBN05
         6cAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0i2zZBdrCWRI9lmKA/36c64wVimSwf1CiL2+om4mgI=;
        b=6FlMjnFsxhAwYooCw4X0TT1lMy+jG33F6JNouXdQhpBNdd3cEi8smndfYhcVsvfWl3
         mtrzCydv5M2xzzwwixZ0fI6qLgKuhFUrMAyocpfQPKOk51nvS1+mrQgeG3uLE+VgfNBG
         lbfOqd5ZrE4ky12dMSDFyXpxnnINrowuIdbXCTz2y1iSLddDDVj/vdJiXFdMzX6WwO2w
         XKqI8ffGj23dn7C7pmE9+Ibie7GsOS8NOXjcwHJFNTtodmqh6mWSAcFc3/eEgq+BjXur
         iDo8WC6eA+/zFrkPUlRj0UdYuwNJuj4oh+nu492xdnkuAZXzkdc14VecQ5ZjUIBOv+9a
         Sz/Q==
X-Gm-Message-State: AFqh2kpWIMhqvid9y3mxnyQSLTDxrA1x1T/B3IBbN3HU6N3bpw8jwvmR
	+dpOmUXzQxbwXf3Hd5Bf9kPOTYUSjv9Z
X-Google-Smtp-Source: AMrXdXuIfeiMj4FfTSA3IXDlo2QLb1EWzOITknF00Kz9b9grv9RndDgACvilj1UWEWIPTzvvj7mN5CvRe4Ft
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:fa4e:1fbc:95a:3ea6])
 (user=irogers job=sendgmr) by 2002:a25:dd84:0:b0:756:35b9:e2de with SMTP id
 u126-20020a25dd84000000b0075635b9e2demr9383227ybg.117.1673636269620; Fri, 13
 Jan 2023 10:57:49 -0800 (PST)
Date: Fri, 13 Jan 2023 10:57:32 -0800
Message-Id: <20230113185732.134861-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH] perf buildid: Avoid copy of uninitialized memory
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Leo Yan <leo.yan@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"

build_id__init only copies the buildid data up to size leaving the
rest of the data array uninitialized. Copying the full array during
synthesis means the written event contains uninitialized memory.  This
was detected by the Clang/LLVM memory sanitizer.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/synthetic-events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index 3ab6a92b1a6d..348d05e4ec03 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -2219,7 +2219,7 @@ int perf_event__synthesize_build_id(struct perf_tool *tool, struct dso *pos, u16
 
 	len = pos->long_name_len + 1;
 	len = PERF_ALIGN(len, NAME_ALIGN);
-	memcpy(&ev.build_id.build_id, pos->bid.data, sizeof(pos->bid.data));
+	memcpy(&ev.build_id.build_id, pos->bid.data, pos->bid.size);
 	ev.build_id.size = pos->bid.size;
 	ev.build_id.header.type = PERF_RECORD_HEADER_BUILD_ID;
 	ev.build_id.header.misc = misc | PERF_RECORD_MISC_BUILD_ID_SIZE;
-- 
2.39.0.314.g84b9a713c41-goog

