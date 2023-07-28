Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797681FAF
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:49:43 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-c8f360a07a2so1642395276.2
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690526982; x=1691131782;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JSRNyTgH2RQM+IopPYAVHpRofqMWho9ANhQe7NRcfyI=;
        b=nRXi1Z1xCu+ny9dJx+xC1ohGfwhMrbNXm3ILlxZ3d8TaGL1vQWN1Y8b119HfJeOH+L
         sYKDJmVsp9CBS2egYSkyBlP6MXSlJmcM60reg1cTMtzo3s2yoXU4YF41uTIre8F6TBak
         IV7uqTL1PElSoXiUNzEsLMQ6Vt12zexPCG/AQVo9mBnI5/+IJYT5zRffhRstt5aFptQH
         aa98iwrlnIVy5+oVyhwnEV9xk0Uv4CWqfHV05vOOSjVxW3uJfPyTFTd2hQjYpTDrkTEW
         4vf0idf827w3L+2/4kRyak9lzmfRYrBeTuZj9mxJJxnARn3FrgPJ9mNUgA+HPLxu9GCS
         4tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526982; x=1691131782;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JSRNyTgH2RQM+IopPYAVHpRofqMWho9ANhQe7NRcfyI=;
        b=l1DBZNy5iLv9yE1FrJ5yDW9ORw/TqmMObxdjVYo3DoVvnoDYLb3dlOcecARLy8BJ4e
         P5uy9gqeY6X3twdCHYjoJA2Mu0tugeVVKAhQlK7hzknjXF+HP2bigVrkXWlVr4hwLo5u
         5LtVCoBBbEhOPZgl9QS/W2rHP8pgXAkNjeTy57LwiCIDWoE2hV7Xw1lyv8pCYb5108X9
         eVIUATsyu5fO1iQ/ek19mTSoZfStzENd8HF42O5dWnLz6Tdjl+07rmTqsQOmTWfW1fv1
         AVCXjC9qZRrpgcn95GaMexXsFJgyrvQTpS48aG8H2Jdu++CwC/Mtur31Yw7SqBcNOZlV
         qoNA==
X-Gm-Message-State: ABy/qLbMBwf3Qx5kZ9aXO2wRvFmf6h+9qguKtnjzkiGbXoRAmit+XJHd
	DIINEspbG72ZX65B/00NjAvYjVIZlm0k
X-Google-Smtp-Source: APBJJlH3g+5y4xz+Nx2m6TkDig3uk0UwJ/M7ao/vA9fmwc712RvGVnodtkcrYfR1OT2c4G9x/YNVMhG1rfj/
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3d03:ff18:af30:2dad])
 (user=irogers job=sendgmr) by 2002:a25:ab47:0:b0:d08:8cf5:c5d8 with SMTP id
 u65-20020a25ab47000000b00d088cf5c5d8mr4845ybi.5.1690526982027; Thu, 27 Jul
 2023 23:49:42 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:49:11 -0700
Message-Id: <20230728064917.767761-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 0/6] Simplify C/C++ compiler flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Some compiler flags have been brought forward in the perf build but
without any explicit need, for example -ggdb3. Some warnings were
disabled but the underlying warning could be addressed. Try to reduce
the number of compiler options used in the perf build, to enable
Wextra for C++, and to disable fewer compiler warnings.

Ian Rogers (6):
  perf bpf-loader: Remove unneeded diagnostic pragma
  perf build: Don't always set -funwind-tables and -ggdb3
  perf build: Add Wextra for C++ compilation
  perf build: Disable fewer flex warnings
  perf build: Disable fewer bison warnings
  perf build: Remove -Wno-redundant-decls in 2 cases

 tools/perf/Makefile.config     |  9 ++++-----
 tools/perf/util/Build          | 18 ++++++------------
 tools/perf/util/bpf-filter.y   |  2 ++
 tools/perf/util/bpf-loader.c   |  3 ---
 tools/perf/util/c++/Build      |  3 +++
 tools/perf/util/expr.y         |  4 +++-
 tools/perf/util/parse-events.c |  1 -
 tools/perf/util/parse-events.y |  1 +
 tools/perf/util/pmu.y          |  3 +++
 9 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.41.0.487.g6d72f3e995-goog

