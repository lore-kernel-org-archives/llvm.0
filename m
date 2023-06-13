Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000567F
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 03:48:21 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-56cfa1c5d59so40681707b3.1
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 20:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686628100; x=1689220100;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yRFC2gTGY007exC0q04MPM2juCknJSwNc/jlO0n+WpM=;
        b=VTWfjUVR8/UW1zs2ihPMDXWF3W50tJ+8vNMUicZElwkf6TK3Qpfo71NnZNRyhZ4lMh
         1cgRzyRkY4qxCCnK74TPSj6Si1gl2Xo85izzGgGCkK+WlK4i5aI+Vl1qcbJ+DZeXNyhy
         53ElrNS7kpDILNA2tLMEro7VstfXg6d1fxusQnOMoB4dHnD4KlxEIY5F9DsbVHpIf3PU
         Tp9G7njcFEWQk7HQAnMhWLlMQEs75aNWGNim6jLyQPeAupbigfRdUVxfQW1ND+rqP6/H
         SGOiskS8HRJi30IigNaKRQTkjLgOK7fG6ghqadu28kCraVYyZCagS+Pkz1okJDa6Eba0
         zuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686628100; x=1689220100;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRFC2gTGY007exC0q04MPM2juCknJSwNc/jlO0n+WpM=;
        b=LJhEkjX5qWWFRiiTuQKkR0yys8K4qbGSIDbtS5wAHu5v81aZ0xfyjtBSXYmkyPVF99
         anYUjcctlPD3ZJ3QIcWzPGlhP+1nMubmxnqMm3ysjRFtfl/GV5vGSYKVFc/wcEwsA3vL
         7CZJILirGx8N6C7Gez8rDlwxhMywEElmOvdPfR3pzcdl2bLLSYxLJN4QNwQJQsNt8GJi
         UUv5vHMt5MSGCqsAqBL8ZRcljp+jlWRcgstDkFwe12k8biUe68hqBLDj11hjDwFEOIsK
         pnoMXPabCrm6JOz4YA/sP+ql7Ht87k8Qt/vmvs1KHqYXaiYuxu+cSjgByUGv05TjlM7R
         sEsA==
X-Gm-Message-State: AC+VfDyTrqxa7C0kONTsRGuKgqEaJ1jGYLSTm8VgW68oiMrq8k4pyc6K
	nvYre+ZdGwa9xvt49vt28ql3C6F1yGZX
X-Google-Smtp-Source: ACHHUZ6WvZmHfRtOL6PifDmP9nAuzb3DebSOsXHxUxvJFPY38MyU0uRAiIHoxg8oAsOrrCaJ6xJR+YkM+R6K
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a704:56d6:f79d:33e7])
 (user=irogers job=sendgmr) by 2002:a81:b3c1:0:b0:559:e97a:cb21 with SMTP id
 r184-20020a81b3c1000000b00559e97acb21mr284968ywh.9.1686628100761; Mon, 12 Jun
 2023 20:48:20 -0700 (PDT)
Date: Mon, 12 Jun 2023 20:48:15 -0700
Message-Id: <20230613034817.1356114-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Subject: [PATCH v2 0/2] Fix srcline addr2line issue with the ',' sentinel
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Changbin Du <changbin.du@huawei.com>
Content-Type: text/plain; charset="UTF-8"

addr2line makes it hard to detect when inline output has finished. To
detect it srcline issues a bogus ',' symbol and expects to see a
filename:line of "??:0". For binutils addr2line ',' gets turned into
address 0 and if there is a symbol there then the sentinel isn't
detected, this problem has been occurring with kernel binaries.

The issue was reported by and debugged by Changbin Du <changbin.du@huawei.com>.

v2. Incorporate feedback from Changbin.

Ian Rogers (2):
  perf srcline: Make addr2line configuration failure more verbose
  perf srcline: Make sentinel reading for binutils addr2line more robust

 tools/perf/util/srcline.c | 93 ++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 20 deletions(-)

-- 
2.41.0.162.gfafddb0af9-goog

