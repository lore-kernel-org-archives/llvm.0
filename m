Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147BF14001
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1VaUPpX1"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-c647150c254so1378225276.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547339; x=1697152139; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqO+Ua8t6nlwvlcHvKwWAEoEKjeWve4b13tLAZbDaS4=;
        b=1VaUPpX17GxnyPRg6waVNmyzdNdyJTGw2CYT0jkiYpZ/PyXwMMoUKgESfM4PnJGHBR
         W/77oxcqvDrhYRSuCZ5U6P03FYBn29QgRX/BBjteyJn9tF0GxqFMOW/htgb95AEzdLKV
         UTGi4L6vA4QvW2HoDqqlcPluCv6QFTnPri7pSKOZgAobdCetxmeU+svsiF0XSdHBxpuK
         69U5fncT2YFB7j43j30pUXUCckmBqG9bYzlGGp6kfno8Lg9YFFb48FnCZFEeT3hwqMDg
         0Oyv/eRXBvg82twKoP0d1501gi5Z6z2YjwaoPanrpM3lFYw3hwbANlK1eoPyhsot67yJ
         Uz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547339; x=1697152139;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqO+Ua8t6nlwvlcHvKwWAEoEKjeWve4b13tLAZbDaS4=;
        b=ZBGO6+WLoau60wzQAPMJuo3sFJsnso7K4MjKOwUUf9xBIpZtwSldNrpUN240hZHa6B
         uqs+xIPhPswBPLIsO1qDYS/5IudNokZv4z9qWVxSaxc82mfO675RZWA2LmouqUFE9aOn
         7jBBbEZizDr4PZ4E+dwKJkCBjKbM6CQ/+tTpvy5srPC8EheDiUFsurYfWdVOZfoyiNes
         bIpvpWfjnwSd/ibdn4pMU9Rj+U8iUrv5F7Nq9BcKEwIWNV35UuEpmW+3dIsmU7lYX9Ug
         1vmRPgSxmqGmtPQ1yxDLnCfXp+jd6yY+TNc8dznkVzPHcYFR8FBnrjAQHcKZHe4Mnz5V
         HvYA==
X-Gm-Message-State: AOJu0Yxc8wob+zEiYLcBS5o5XMjh1ZtZ3DCoGByn7BWHqWe86Xhazeh1
	0G4eyf3fGiv9ckjfAjFmjRbKgZHSca6+
X-Google-Smtp-Source: AGHT+IG3kHmRqHWDft5tWM1zuYzngpqzvq67zhBHl4j2X94Z3ybhq4yxBzMt9WFB8IAAUgdjbeChJkU/HvMR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:868d:0:b0:d81:57ba:4d7a with SMTP id
 z13-20020a25868d000000b00d8157ba4d7amr80931ybk.6.1696547339163; Thu, 05 Oct
 2023 16:08:59 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:34 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 01/18] gen_compile_commands: Allow the line prefix to still
 be cmd_
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
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

