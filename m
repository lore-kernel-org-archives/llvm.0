Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F220EF
	for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 18:58:40 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-4c8e781bc0aso60182727b3.22
        for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 10:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=68orcaC6zz4yh42URgC/a9ocEH5eMY9g7tAnmpuRu0U=;
        b=WNTK3yTY8uIAwslAVYOxaLgjPBSTBNADsLlJcs4wVM2i+mwdBi98fG+N9/9iPIS0yc
         LJKYipiY96DE871/jJLOP3SwwmvmFPqp84J33MN2EAZ2qeN5YfjPCXEi0gULzYbSNTY6
         /4ORT31UDpsWZRnmMmw7Wfzmv2BH/cokhri/PMFTqukUo5fIH14Kof+5ijzON08bA9b6
         fA6z2ycBL+DUd8C+Ik8O5Pk2AOda7/XOQOSs4XUn4LISrg8FbEm3KIU+wyHPvgr69tE2
         cz1zFUYSB8UJkHgr4t78a9r/DSw3tqQvC5q0My+SN8T+3IfpHpcJ7qiXgIpzlURBul2p
         p1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=68orcaC6zz4yh42URgC/a9ocEH5eMY9g7tAnmpuRu0U=;
        b=xcmLfz9Ab5l/5763paTzbXZRo7LexL36z+QHDvbd3bDlJfLfYo55eqCSLPTdjW0+bD
         LPdWEdqDVj0OnwgObZ2L2FZMERgYSvzKKUaNHiHvq/BCu4r8djmitzUh7IqDduw+li3o
         M0itKMmg8F7TP5v9ekSZJm2BZcGhWKKlblFtNH80st3NYpmG4/vvcJPLY37crAYfer9D
         9rq34n2ygGGYqmXRhzswqyfoNKGq/23OfCmCrPNoBGcaeSctyiTIfEcqXpgDzznHApua
         ftr9Ua/oM4spnkDXRrY8HZIrPi3km69nfbVj8O4F4dZKyp9MHDfvL/dW7r9I9sy7xPCq
         oNWQ==
X-Gm-Message-State: AFqh2kr4cNKtHS3uutyPaMqqzWg3ML9Aw298jjHCn3RWVmrGusZMJRc+
	8CwberTV6QWYa+srPktmjrVsqyCI/H0Y
X-Google-Smtp-Source: AMrXdXuR0UGEvg0tmZsuCJFjqwMeNjP70VdhJX4rPI/yED1obovEegVXuTIVRHcRLI9m8lPABvuYksRokxPA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a736:5d8d:4ad8:4e50])
 (user=irogers job=sendgmr) by 2002:a05:690c:887:b0:500:ac2c:80fb with SMTP id
 cd7-20020a05690c088700b00500ac2c80fbmr278306ywb.90.1674241119207; Fri, 20 Jan
 2023 10:58:39 -0800 (PST)
Date: Fri, 20 Jan 2023 10:58:28 -0800
Message-Id: <20230120185828.43231-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Subject: [PATCH v2] perf buildid: Avoid copy of uninitialized memory
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Leo Yan <leo.yan@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"

build_id__init only copies the buildid data up to size leaving the
rest of the data array uninitialized. Copying the full array during
synthesis means the written event contains uninitialized
memory. Ensure the size is less that the buffer size and only copy the
bytes that were initialized. This was detected by the Clang/LLVM
memory sanitizer.

Suggested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>

v2. Avoids the potential for copying too much as suggested by Arnaldo.
---
 tools/perf/util/synthetic-events.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index 3ab6a92b1a6d..9ab9308ee80c 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -2219,8 +2219,8 @@ int perf_event__synthesize_build_id(struct perf_tool *tool, struct dso *pos, u16
 
 	len = pos->long_name_len + 1;
 	len = PERF_ALIGN(len, NAME_ALIGN);
-	memcpy(&ev.build_id.build_id, pos->bid.data, sizeof(pos->bid.data));
-	ev.build_id.size = pos->bid.size;
+	ev.build_id.size = min(pos->bid.size, sizeof(pos->bid.data));
+	memcpy(&ev.build_id.build_id, pos->bid.data, ev.build_id.size);
 	ev.build_id.header.type = PERF_RECORD_HEADER_BUILD_ID;
 	ev.build_id.header.misc = misc | PERF_RECORD_MISC_BUILD_ID_SIZE;
 	ev.build_id.pid = machine->pid;
-- 
2.39.0.246.g2a6d74b583-goog

