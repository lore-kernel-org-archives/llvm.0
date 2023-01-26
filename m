Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434804C92
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 19:07:06 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id a14-20020a5b0ace000000b007bf99065fcbso2869769ybr.2
        for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 11:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yC7KxDOwmbLkSe3SAx+cCoB6TAXe5zpAN4zyxeJ2dgo=;
        b=ZU46dpygD/bT8paN+r29EXFPvP7T+JZAMP7ZJlfp9JJ41ykWkCvu/RMcnNEeZN7y8L
         KpJYAwrIYMrawsxI/PMe56OgOxjasgs1nnI8Br6r/Lm9TxD1wGHCQybCP56BxjykKgi/
         d4YbRuUlirhgmypW3UInzDz8P2AfwJratR1sffeemvXijQxNXZhD6MGZDFhhuhAvX+I7
         FdtBrm98GAQ8CiAnFZ4JyeVQlx2l59rxBsxFhVRy5y8Ai/PzOK36GRsANkR6lt98br4v
         loeDagdg+bLkcAPdgspNpVIsDiNztzddXDdc0HSXdpypi2Ygsaoim2td3XiV/BD7tUVI
         mFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yC7KxDOwmbLkSe3SAx+cCoB6TAXe5zpAN4zyxeJ2dgo=;
        b=32puf1scqciLWMdFogQdZQuhHe16VEf8RjL13TIJQbBk1+3d+TcfUbCVHHqF7ecfv9
         bOn5rqIKfuXmhj8huSj8BuU/2Z/bnVbaVISXPpuXJXWl3hvEKFHai1e51EVv+qaP/fw4
         qE91MX/uT8hyMEPEohxGTbXcvaLU82M2i2qUrkFCbDJZJmYFBv3f++s2ecbtxludR2qo
         POywkJM1VHNn9245gpYPBDcPRR0qkkYepVDgPgqAZhKdingUwdGYFXRPlxAcKPt3RucY
         25Wi0UmVfAq47KDYx5UUyIpB9Z0IR5i1BltqT7nks9Z/l3lip582jiLVwC84t8pChimt
         5Zeg==
X-Gm-Message-State: AO0yUKXy5F//MjIXH1vYHhwxnWdXF/UW6oCLPZ3t0KNrlAtdjcO01DyD
	RnvXRL0XRQnfCS2sFfbziCahFn6u8QAk
X-Google-Smtp-Source: AK7set92h/zdh7EkpeQdqTn9+HGOPdlBPyutqm4NlQlwfmiLk6uvNy9lxKmi1Oen3yEkGtCOYzrAJpt1Cc1z
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:568d:4d98:b468:b025])
 (user=irogers job=sendgmr) by 2002:a0d:d4c4:0:b0:506:4828:ea11 with SMTP id
 w187-20020a0dd4c4000000b005064828ea11mr1487091ywd.189.1674760025278; Thu, 26
 Jan 2023 11:07:05 -0800 (PST)
Date: Thu, 26 Jan 2023 11:06:03 -0800
Message-Id: <20230126190606.40739-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Subject: [PATCH v4 0/3] objtool build improvements
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
being set for say gcc, and then CC being overridden to clang.

v4. Rebase and look to address review comments from Josh Poimboeuf
    <jpoimboe@kernel.org>. Removes the reviewed-by/tested-by given
    the scope of changes.
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

 tools/objtool/.gitignore |  1 +
 tools/objtool/Build      |  2 --
 tools/objtool/Makefile   | 62 ++++++++++++++++++++++++++++------------
 3 files changed, 44 insertions(+), 21 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog

