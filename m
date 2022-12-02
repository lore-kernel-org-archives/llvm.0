Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D587B
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 04:57:59 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3d0465d32deso38471707b3.20
        for <llvm@lists.linux.dev>; Thu, 01 Dec 2022 20:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0BZrtu6a4uY0PQiXNtiOGBfNeRj9TpPw09DbPuRe0Eg=;
        b=X4m7nIQ+QvDHeTb0ha5tBcYbrBQDFWJW2lsYSWb+uqOeXSfgqk77lGCxeuIMXLwMlT
         q/4vMEZeFJSlLF2ADUr2StBpjojZUi+QvA/YbVuEUxKO21f72Ck/EqwOMQv3YELK2UWX
         T+Z4sgXOrcSVxRTgD0iZSbG0sPIExiR3lVyDNrzH3qaj2+amwE662AQONkaie/Ww8qob
         8sqcdhZyAJj3vDbUax8l28/BdoqMKcSpSpp/aQlmUR0Lf+Uq7kP45MgqtlwvQqzdS4Je
         ++SZ5gIIaCcyDn0SiNgUSUyXoQKqNZhNWvVFoiCzjONvbiVV5lk4UTwNm+y/zuz1qLXt
         /YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BZrtu6a4uY0PQiXNtiOGBfNeRj9TpPw09DbPuRe0Eg=;
        b=8HosAoBXjP9RFf1pKD1G2yO0rezDbarkZvbpC0IvHaVKoKPbZN7G+6n8iHSdS1Ztok
         /i+knOylZV3dn2s1s5vvYIIcbuiZT+mgu6TAGCnWnINNd2kBSJKVIABvq5uGi9Mrh0I7
         T7VpZu2Ao7H8vbBbXzYhxadbDKsVU2PcBZRCLL1MA1U+yi67SGD4TqhcsvwY+EadJD1j
         /W8YSweegdNOqWFEo1pgZ9MWDytzl59duaiPVp2aWhvLoAN6gnlwLQz8Gn6X3SbPGeOO
         HUdrxJN/EGTJkbI4I8gX2a0rUbBwuLG1WUsBglS9q0cNjOxNbu9ZWMcL7sBQz/FlKDgG
         U1iQ==
X-Gm-Message-State: ANoB5pnUlnW1wqs8DVu0LiAnDC5LTvQS+aYWnSUahOonVnh91xi7q72h
	vnutVC5gv+No6/g9dQTyDtTx4iUQ43Ke
X-Google-Smtp-Source: AA0mqf5o0BmDUnUrinpRrQas0w4b7hDEpgBGbb2aeFzVqUVBfV1v1tX10UCBeoqIbKr4DRhNsSULBK0wW7Gd
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:e3b0:e3d1:6040:add2])
 (user=irogers job=sendgmr) by 2002:a25:ba8a:0:b0:6cc:6a92:7a17 with SMTP id
 s10-20020a25ba8a000000b006cc6a927a17mr48131719ybg.282.1669957078446; Thu, 01
 Dec 2022 20:57:58 -0800 (PST)
Date: Thu,  1 Dec 2022 20:57:38 -0800
Message-Id: <20221202045743.2639466-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Subject: [PATCH 0/5] Improvements to incremental builds
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Switching to using install_headers caused incremental builds to always
rebuild most targets. This was caused by the headers always being
reinstalled and then getting new timestamps causing dependencies to be
rebuilt. Follow the convention in libbpf where the install targets are
separated and trigger when the target isn't present or is out-of-date.

Further, fix an issue in the perf build with libpython where
python/perf.so was also regenerated as the target name was incorrect.

Ian Rogers (5):
  tools lib api: Add dependency test to install_headers
  tools lib perf: Add dependency test to install_headers
  tools lib subcmd: Add dependency test to install_headers
  tools lib symbol: Add dependency test to install_headers
  perf build: Fix python/perf.so library's name

 tools/lib/api/Makefile     | 38 ++++++++++++++++++++++-----------
 tools/lib/perf/Makefile    | 43 +++++++++++++++++++-------------------
 tools/lib/subcmd/Makefile  | 23 +++++++++++---------
 tools/lib/symbol/Makefile  | 21 ++++++++++++-------
 tools/perf/Makefile.config |  4 +++-
 tools/perf/Makefile.perf   |  2 +-
 6 files changed, 79 insertions(+), 52 deletions(-)

-- 
2.39.0.rc0.267.gcb52ba06e7-goog

