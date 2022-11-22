Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D97B
	for <llvm@lists.linux.dev>; Tue, 22 Nov 2022 00:19:19 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-393c38f7bcfso105327217b3.5
        for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 16:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G0hXMTY80VdIvqYOcPDvs1KFXXEcVE57ImwJ1NC0xJ0=;
        b=TeqnmqJc1Rpqk70LVMY/kdh7hasPCpSgcBBcUhLqyxDfT5WaVvRNM7FYAUTaga37sw
         6Np9ZU2dXwZcWiX7YfSOwu828UybvO9/mFeQQYf7ZB4/mNpk3avcTf2mJ7BaTxzOkPVQ
         0KuXd8ML4QgvIFgLuZfZ/Fp/Lspvq2eGgi5AwBucXp/cRHy7Uh3UDGmkgd1yZhWy4Q4G
         FCWuRGgcSGO32vZIs4IjN4ciloXEqjPVyUA7hxHVX114wjW/NcmmpqDCJ3ZFyaTl7IYw
         IXr3GB87CVq+xFUS6gm96w4K3MjxaXPUouuaFtGLS62310cL60JDty4T6RyPyQO5kXcl
         axww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0hXMTY80VdIvqYOcPDvs1KFXXEcVE57ImwJ1NC0xJ0=;
        b=M2ijH+ScNne01HrT4sfTHD6RXlVKcu3CYqv5nNv3RAmbWwYVgPHN+JiWsMv7iuEfeV
         QNVly6wIaXE3/d88cbRk5TzEkddoQV/1guoqaMGnvf0aNowWbX2llbtoK0tJ5uQtVUAQ
         dNhSQZV1XeP2mSxKTePv6vmR+hwbfP/bySLQSE1bFTpuQA2AmNYHWsCwxW+9ah0c3jar
         ATjG5nD6BHKio8rWfRAGv10ACRbAPEF8uCHRdTWFlcNXQMN5nLCLU3Yw1v99Vo6pcvZE
         FQdhhSKxqlAbSvoTiraBxq/Ol+yG6a/I0ggK7b6+IFyzpWfXpNAm/W7xMV+wkghk7MoS
         DF/Q==
X-Gm-Message-State: ANoB5pkcTadIUNnziHQqCShmz8fUit6TNrGfdjZ5qUPRZ77hAQO8LK/R
	H4fC+9wYA1Epv+7uI4rORiFIf0KgQTF7
X-Google-Smtp-Source: AA0mqf665OYUODFhCpZtd4KUTkQgZM7xzDGktxRFFcuT8xEoFsoZmHMvVA27Dj7kN9vTqVa6BccMxrZS+IfC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:2107:a1f5:8582:5608])
 (user=irogers job=sendgmr) by 2002:a81:7cd6:0:b0:357:6958:372a with SMTP id
 x205-20020a817cd6000000b003576958372amr1716354ywc.255.1669075901807; Mon, 21
 Nov 2022 16:11:41 -0800 (PST)
Date: Mon, 21 Nov 2022 16:11:21 -0800
Message-Id: <20221122001125.765003-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Subject: [PATCH v2 0/4] objtool build improvements
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

v2. Include required "tools lib subcmd: Add install target" that is
    already in Arnaldo's tree:
https://lore.kernel.org/lkml/20221109184914.1357295-3-irogers@google.com/
https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=630ae80ea1dd253609cb50cff87f3248f901aca3
    When building libsubcmd.a from objtool's Makefile, clear the
    subdir to avoid it being appended onto OUTPUT and breaking the
    build.

Ian Rogers (4):
  tools lib subcmd: Add install target
  objtool: Install libsubcmd in build
  objtool: Properly support make V=1
  objtool: Alter how HOSTCC is forced

 tools/lib/subcmd/Makefile | 49 ++++++++++++++++++++++++++++
 tools/objtool/Build       |  2 --
 tools/objtool/Makefile    | 68 +++++++++++++++++++++++++++------------
 3 files changed, 97 insertions(+), 22 deletions(-)

-- 
2.38.1.584.g0f3c55d4c2-goog

