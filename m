Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3B2C9C
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xB4RcAn9"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a7ba10cb90so2406617b3.3
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876768; x=1697481568; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqO+Ua8t6nlwvlcHvKwWAEoEKjeWve4b13tLAZbDaS4=;
        b=xB4RcAn9cQP+mmc0ST540sFvg9aEyiqzlaCOBr0PYVbqLthpvnE0agmefRy9Nzpz3n
         Qq8w1SE/4ov+cI0pvZKtkRHlIHMKo6fuVMZJuMCDxMdqDVEOH5f/dTEinEc2k0XAgo+6
         xnU3Jx9uorsXJPIviZqrW3lG1LHcBSI+Ql08SB7MkUL3UkRlb+x2+r9UxqXsEmSmMlzu
         ijy4HLVKO1iRDIfFOvTje9wD5QVs8loxpCK5XKEFTDna7mCr8+DtiWE563doPW5jEZoP
         vcZ2t+QKAa6LKFQ0KGkp7eatc2T9LDEP1A6yuuQOWeeOaw5sQamRCdosavi/savHiZEX
         Fhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876768; x=1697481568;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqO+Ua8t6nlwvlcHvKwWAEoEKjeWve4b13tLAZbDaS4=;
        b=MdQYbv7Lrf2CVvO0n7lNdDem3dYoUZi/QeshN7Z1O+E9UZledwpGP/8m4Y8WfX7Zwr
         sk6x6W0Z0yCwpva1jiEnP1ysor+oUFl3NVKtmxC4IGg1zpAzytAZOZ4hyve4o3gjU+mf
         IZ44vWsMPvL8FuMtBqfwSHp6S911SP9lY6QWF6bi/xqSQmQ4YGA3Gx6jWahvWyXPPYh4
         q19zrhaY9f+1Xqx7azT+x8tvBwTJQZ9t8exzaOLPA+iijXp1ggDnedDXw/ceEYlHJkAB
         u0CJNcBB/xL/EL2Ji2G54mj+qjOE+mDM/x2F140IDp+1kMx9By+RMB6EjIkrr473Ny2r
         q1bg==
X-Gm-Message-State: AOJu0YxO0/N/zmO7yS+bUVipNQ9Rt15h0PJES9/1ho+ve683s8uytRWt
	E9AYJUOdqQF3w6ht+56jDFsbcEuje4vH
X-Google-Smtp-Source: AGHT+IE8rbiHTWNG1mYNALTAoi+/t0J7e5qpPykiWnCmQtpQDmBIpJJlxaAEE5cILLQqAZstEZU8apjPkO6F
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a81:bc03:0:b0:59b:c6bb:babb with SMTP id
 a3-20020a81bc03000000b0059bc6bbbabbmr297622ywi.6.1696876768652; Mon, 09 Oct
 2023 11:39:28 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:02 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 01/18] gen_compile_commands: Allow the line prefix to still
 be cmd_
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Builds in tools still use the cmd_ prefix in .cmd files, so don't
require the saved part. Name the groups in the line pattern match so
that changing the regular expression is more robust and works with the
addition of a new match group.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/clang-tools/gen_compile_commands.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index a84cc5737c2c..b43f9149893c 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -19,7 +19,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
 
 _FILENAME_PATTERN = r'^\..*\.cmd$'
-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.[cS]) *(;|$)'
+_LINE_PATTERN = r'^(saved)?cmd_[^ ]*\.o := (?P<command_prefix>.* )(?P<file_path>[^ ]*\.[cS]) *(;|$)'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 # The tools/ directory adopts a different build system, and produces .cmd
 # files in a different format. Do not support it.
@@ -213,8 +213,8 @@ def main():
                 result = line_matcher.match(f.readline())
                 if result:
                     try:
-                        entry = process_line(directory, result.group(1),
-                                             result.group(2))
+                        entry = process_line(directory, result.group('command_prefix'),
+                                             result.group('file_path'))
                         compile_commands.append(entry)
                     except ValueError as err:
                         logging.info('Could not add line from %s: %s',
-- 
2.42.0.609.gbb76f46606-goog

