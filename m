Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA4CAFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:56:00 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id b124-20020a253482000000b00b72947f6a54so13690822yba.14
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680047760;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqxML7xkN1lg5mLK3PMobUIZG+frNSAW+D2pze+pEWQ=;
        b=MiMTpQr6+kNRUZmxlErxhLoP4NYq4RrGrVST1Sc3OVwcvCObBqd2kSgsQDG+bUmTEv
         zRc3wc7zHC2U9nW8W09sAccj5mTFLeyFg19sIFCsLfcid2NfUi9CtYnOJz6WW8d+YP73
         aNbh/DywCsGlwzC70wPA5lRUvXN+lZkbhcBQvc7w/cDjIyCbKdvTUJLQzDT53LbSL7Mp
         msgjcpf+q2Yj4npPCuPyhnBYOkE1hvuu1GFd2M0/CJ6lVwlfBlkBxI5G7d8vuAINBgMn
         az/7l7gylBmd1hogGLjlJnuS6Y9vV1EEjXFma1w5VIDYS8l8MS2XMl02t7+fLQmm1cL5
         woIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047760;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqxML7xkN1lg5mLK3PMobUIZG+frNSAW+D2pze+pEWQ=;
        b=2doEHTLSjfVG9wk2tgbRISJ+0BV2OW6WgO6qOTbJBdLsQ3yamy/+0S/IdeRTpMW9ia
         no0oMJ7h2ZiGdQxczMLL3JIALsc+hjOwsjcOnvTWRYWDT1iseTmB/j4QQ6HeirhnDTxS
         0/+NHjbGn7eCsxskDKATXWQCHtMT2TKTHTTC+pnSPEFmx5qYQPP8KxnJzOBUvVjrSIuX
         a4E77uer2QyX1K5/h4ET8UOO52myQcDIqNFm1DEd0D7/Y4TWWAUDDRt3VPp9B7WwSN4+
         WI+AnykNPUcjKdUkIVdwb53nqeH1rtmfKF5nAXJl9dtA7kj9IdyT+ypTCAMpWS7ZGFCE
         odVw==
X-Gm-Message-State: AAQBX9ed/+Lgf3mv9K8d7H80ZkmG2BWLn7Q/sHHGltTCoe6qbh5hF/05
	P09QjeD/T35HGAevpn351qoTxaLiWrGL
X-Google-Smtp-Source: AKy350ZZ9lVS00jsMGW8v4w4WleLMmPpByGkGSrq2CXRkk9qPGEztz5FAJobs50Rs8EBpLNwRbeAUJVOafcx
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6519:f0d3:9540:5c31])
 (user=irogers job=sendgmr) by 2002:a25:a323:0:b0:b35:91cc:9e29 with SMTP id
 d32-20020a25a323000000b00b3591cc9e29mr229665ybi.5.1680047760022; Tue, 28 Mar
 2023 16:56:00 -0700 (PDT)
Date: Tue, 28 Mar 2023 16:55:37 -0700
Message-Id: <20230328235543.1082207-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 0/6] config file/command line for objdump & addr2line
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	James Clark <james.clark@arm.com>, Andi Kleen <ak@linux.intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, German Gomez <german.gomez@arm.com>, 
	Sandipan Das <sandipan.das@amd.com>, Andres Freund <andres@anarazel.de>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Allow objdump to be set as a perf config file variable. As previously
objdump was set via the command line, the string was owned by
argv. Now the string must be strdup-ed, so the corresponding logic
needs changing with an annotation_options__init/exit.

Add command line and config file options for addr2line, set in
symbol_conf for convenience. This doesn't allow the setting of
llvm-addr2line due to a bug, but could in the future.

Ian Rogers (6):
  perf annotate: Delete session for debug builds
  perf report: Additional config warnings
  perf annotate: Add init/exit to annotation_options remove default
  perf annotate: Own objdump_path and disassembler_style strings
  perf annotate: Allow objdump to be set in perfconfig
  perf symbol: Add command line support for addr2line path

 tools/perf/Documentation/perf-annotate.txt |  3 ++
 tools/perf/Documentation/perf-config.txt   |  8 +++-
 tools/perf/Documentation/perf-report.txt   |  3 ++
 tools/perf/Documentation/perf-top.txt      |  6 +++
 tools/perf/arch/common.c                   |  4 +-
 tools/perf/arch/common.h                   |  2 +-
 tools/perf/builtin-annotate.c              | 42 +++++++++++++-------
 tools/perf/builtin-report.c                | 35 ++++++++++++++---
 tools/perf/builtin-top.c                   | 27 +++++++++++--
 tools/perf/util/annotate.c                 | 45 +++++++++++++++++-----
 tools/perf/util/annotate.h                 |  9 +++--
 tools/perf/util/srcline.c                  | 26 ++++++++-----
 tools/perf/util/symbol_conf.h              |  1 +
 13 files changed, 163 insertions(+), 48 deletions(-)

-- 
2.40.0.348.gf938b09366-goog

