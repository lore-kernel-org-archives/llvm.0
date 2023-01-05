Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5844DA38
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 09:02:08 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id c18-20020a25a292000000b0074075692485so36054936ybi.5
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gMeOMpb58LKwXdrW/getzyijMXrw75Kv1TqJV/9UOLk=;
        b=MK3MwIy9qtEF2d12ORUyteoXB3r3fdkipI3neUqhPW9L4iFXR8Y9eHgFhPnQBPKEyw
         CcbA1i9gWaUKDLzVFLTm/qz1vlBeEaew0jj9T73xH0niNlDmQ1mVExHOxxAB3a6TMg3W
         XIwqUkTM0qZUBUZ24QeLdi0L+o7Cv1E5tgWd2Lr/5mNa5F6QdUfiLjhwlLQzxV1YyJah
         ljfXzChmqwm6Xj9Ti4BAXm0mIpkZm0Fe95ARzPSzpjwGJ9gNjqWIneqBSuqY3e7gHFQN
         uuO4+FhlSZVCaXWR45Qn4IVzqp2QfPwzlTdEIhD7BJJe7+Fru4bJ4XUo13EVq/6FxUu6
         4kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMeOMpb58LKwXdrW/getzyijMXrw75Kv1TqJV/9UOLk=;
        b=IGEClMMdBKIPGtl33zUaYZAsWOcClldIDjA2h2EO6hBfaXQsLrZigtcfWBshG4Qf8P
         01XPGiTLWXhIssHYXlMg47uPrjSnSyeS9b1NnBgOUmmOct5fgOOYaXV9ENcqzV52mN9e
         Li9JGSMIvMLUXLMFRkwds5H4n8a99A4NMdadWHBOx7liNGRXZ4JpKQTfwunqFa2NrEzu
         GX7G6T3yPtvT32chu6w9ZfD8XsnAhFqB6BIrWy4P309e3nOZMHj5leOr84C1yrzJPLBP
         AZHt3YaDu7G3q0s9SMtVpDacQYNb3JQPsvtAPvVwlBkVIFQdBjU/R0EREpeYJkkT6L5d
         8hBw==
X-Gm-Message-State: AFqh2kp0xLjUvRZq18YWFMkvOVGFyAyoFO/+5J6YiA0rKyTXEBqPtwvp
	hutdw2eIYzCqXbXDEwznEgswCrGHCqFs
X-Google-Smtp-Source: AMrXdXt3HTp4nhbHIsvBvQIUz4QjOclWmn3a5/q0lyFKC2IeLzTXVQLnvrBBjGhXdx5yZc0L5SA/8FfScl53
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:8775:c864:37e:2f9b])
 (user=irogers job=sendgmr) by 2002:a05:690c:886:b0:367:27b7:af89 with SMTP id
 cd6-20020a05690c088600b0036727b7af89mr83353ywb.292.1672909327417; Thu, 05 Jan
 2023 01:02:07 -0800 (PST)
Date: Thu,  5 Jan 2023 01:01:52 -0800
Message-Id: <20230105090155.357604-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Subject: [PATCH v3 0/3] objtool build improvements
From: Ian Rogers <irogers@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Install libsubcmd and then get headers from there, this avoids
inadvertent dependencies on things in tools/lib. Fix V=1
support. Clean up how HOSTCC is used to override CC to avoid CFLAGS
being set for say gcc, and then CC being overridden to clang. Support
HOSTCFLAGS as a make option.

v3. Is a rebase that removes the merged "tools lib subcmd: Add install
    target" patch. In:
https://lore.kernel.org/lkml/CAKwvOd=kgXmpfbVa1wiEvwL0tX3gu+dDTGi-HEiRXSojwCLRrg@mail.gmail.com/
    Nick rightly points out that:
WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
    became:
WARNINGS := -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
    losing the EXTRA_WARNINGS which v3 now adds back in. Previous
    testing had added the warnings to the end rather than the
    beginning, thereby causing unexpected build issues that aren't present in v3.
v2. Include required "tools lib subcmd: Add install target" that is
    already in Arnaldo's tree:
https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
    When building libsubcmd.a from objtool's Makefile, clear the
    subdir to avoid it being appended onto OUTPUT and breaking the
    build.

Ian Rogers (3):
  objtool: Install libsubcmd in build
  objtool: Properly support make V=1
  objtool: Alter how HOSTCC is forced

 tools/objtool/Build    |  2 --
 tools/objtool/Makefile | 66 ++++++++++++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 21 deletions(-)

-- 
2.39.0.314.g84b9a713c41-goog

