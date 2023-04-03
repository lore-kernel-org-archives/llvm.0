Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9D191
	for <llvm@lists.linux.dev>; Mon,  3 Apr 2023 18:40:45 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id y15-20020a62f24f000000b00627dd180a30so13600460pfl.6
        for <llvm@lists.linux.dev>; Mon, 03 Apr 2023 11:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680547245;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l7KXY8lY6kh4yGHJrlGOwQN4b74JegDEme6RD0OCgco=;
        b=MmY3StUttrl+Dl0KtrfiUBQYX1fBd6olu28lJlPxriJAesyrYGeWv6rxB4igcoDrrS
         uCxzoybWGwVCrc4KwE7tXIatVHRsynan93kGhqKUPlW8el7kw8FlXpbKl6K13DlBtDto
         XlL9eWWTT8IqQPo+92gSOLxNTUA283A7elT3V3+K1t7iDtr/f+02Z6BM4G5/44Fp0j63
         z/eBYq3xcA8Yf4hFF1seNWEB+EXU3+BFcuSPJPk6Zu/5FCiugkgJjThlQcBlNWI0AuCv
         JuqiPg6gKulnsFOgJgblvM7b9R9mcszWjoCokybbHOgaJ1QFwMrmoVZHrAat7+GRGwVO
         UkYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547245;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7KXY8lY6kh4yGHJrlGOwQN4b74JegDEme6RD0OCgco=;
        b=zoTKqlPF6RO5eK1dEa+SwadgaqKx/7gVJjCe58IMEJCxiJrd+phYygw05bdJ4zMRXI
         YBzO+TDJ+tsK2OapuuT7wKbNSj9wz66EisSK1iH/4Mstm7QiZvmky5BcfbRc/794O5Pq
         7AZOVy1q0fQoByPs0msFzkUJ2U+M/hBgo/9UAzwf8djd099x2TXkvnPy5yy2OAuzcX9H
         X/fYXduRCLZZ+gNGo2NwILk/Ob9h3Rq+7sORSsdZe10qs2UU1TjRNlcsfkF/QdrzGdEY
         JH3sQ1dl9U6JY082z5pJt6qsM2Q9bAvG6dwv3G56Kbxtd1p469zvOBLOlOBsZy+Emy7N
         1tLA==
X-Gm-Message-State: AAQBX9dLTmmQkzGqKSJi8TCr/vHAsF5GRJVOLpYbDSk5Q7dPImQy/48C
	gbjaM2z3SJ1lz+P+156lrHFtQ0+lC+n+
X-Google-Smtp-Source: AKy350ZZdr2WR9ZcTjWW1hUH12pOOyW8M+tD+hF6gzQBIwL78qeJrSAkQU0Lm7teFIKEXeaZuysvtGqqeaPZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:9dc:a977:817d:341])
 (user=irogers job=sendgmr) by 2002:a17:903:1358:b0:19f:3cc1:e3bd with SMTP id
 jl24-20020a170903135800b0019f3cc1e3bdmr28764plb.4.1680547244921; Mon, 03 Apr
 2023 11:40:44 -0700 (PDT)
Date: Mon,  3 Apr 2023 11:40:29 -0700
Message-Id: <20230403184033.1836023-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v2 0/4] Support for llvm-addr2line
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The addr2line command is started and then addresses piped to it. In
order to determine the end of a addr2lines output a ',' it output with
an expectation to get '??\n??:0\n' as a reply. llvm-addr2line differs
in that ',' generates a reply of ','.

The approach detects and then caches the addr2line style. When records
are read the sentinel is detected appropriately.

Comparing the output there is a little more inline data on my machine
with llvm-addr2line:
$ sudo perf record -a -g sleep 1
$ sudo perf report --addr2line=addr2line > a.txt
$ sudo perf report --addr2line=llvm-addr2line > b.txt
$ wc -l a.txt b.txt
  12386 a.txt
  12477 b.txt

Some other small changes, switching to the api/io code to avoid file
streams wrapping the command's stdin/stdout. Ignore SIGPIPE for when
addr2line exits and writes fail.

v2. Address review comments from Arnaldo and Namhyung, fixing a
    realloc error path, argument ordering and a comment.

Ian Rogers (4):
  tools api: Add io__getline
  perf srcline: Simplify addr2line subprocess
  perf srcline: Support for llvm-addr2line
  perf srcline: Avoid addr2line SIGPIPEs

 tools/lib/api/io.h        |  45 ++++++++++
 tools/perf/tests/api-io.c |  36 ++++++++
 tools/perf/util/srcline.c | 171 +++++++++++++++++++++++---------------
 3 files changed, 184 insertions(+), 68 deletions(-)

-- 
2.40.0.348.gf938b09366-goog

