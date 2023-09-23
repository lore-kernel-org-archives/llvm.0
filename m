Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD7A5D
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:39 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59beea5ce93so86506297b3.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447339; x=1696052139; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGf8PiM0IiriMve24vBUlDxd/ZI4TAjoSgcit1w5zEk=;
        b=2KNo4HUkJODCnmuYKL74TQvYrJknJRBcBe7Zxci9WvWfknlvyTmukrj8eZeTIlmHI2
         j3liFuKX60iML3hbujLTtPelbSEKLjcBPNuNLfS3IOpup0+NzLPFcJ/YVlbFlcN2HnfW
         9RIOleKeSIWWjVwJ//+eg2igz4gp6XZE/ZwVMxlWWCb6MRcb3db5GDTbBKOu7Lt0Rq7E
         7aD6ORyi02ZzdSnDbCC/FdHdtH1UH09T660df7wfSD06sQDJfJ6qrYfj0HXm/Jteh4Lj
         cInvW2fRM0X/l6Rr1m+v1zUl9EU1nIAbfVrNYo7enNoMMeOH6rvI8aUN/q7ALky/CJqW
         Dj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447339; x=1696052139;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGf8PiM0IiriMve24vBUlDxd/ZI4TAjoSgcit1w5zEk=;
        b=BR4JjLyqu8qNzjxLdWp0nPczAyPZhq+fSofj/IIWwNpON1bVNo1LwI32ZHXX4yefQY
         W8br4jDTE19lmRMtqeOYcvbiwOSgnVWpRQw37l7AIFkXdg6T5TNbxNe7ttlc62WbeRAE
         j95DLhaKQpUiCYsDdb/DAiGV5tx7UQeZ8LbRIuPfHmZAremUCLk6zCvzU5EksxQZ0Ue5
         ojNwLg2rrctoJmjTKGBpBusFnzuSrw6rodd6FNUbpHkknzp5nlQHrns17E3ogsBg0RNi
         aDYLK/oYU+UkCtkOQlNJrdsG9h+FRCh8z4I4obC2MWlQFzpb18mvuG5pMwNbLPlQuRqS
         k7XA==
X-Gm-Message-State: AOJu0YxLFoy9wCLfIrg2gTjD1RSZc9a9LlQC3e8vN9W3R5fPxiQFrpBW
	7fGbYqeeNzxQo575/O5Mkg8LDSw64Lri
X-Google-Smtp-Source: AGHT+IER3/Ekga4CWFfnCnjgBf21uB1xN+LlgPp7pbLhX4QChejR7/30xnfk3VwuhyKCQmfs43pumojGijGw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:690c:707:b0:59f:4c14:ac5e with SMTP id
 bs7-20020a05690c070700b0059f4c14ac5emr28292ywb.2.1695447338979; Fri, 22 Sep
 2023 22:35:38 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:34:58 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 01/18] gen_compile_commands: Allow the line prefix to still
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Builds in tools still use the cmd_ prefix in .cmd files, so don't
require the saved part. Name the groups in the line pattern match so
that changing the regular expression is more robust and works with the
addition of a new match group.

Signed-off-by: Ian Rogers <irogers@google.com>
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
2.42.0.515.g380fc7ccd1-goog

