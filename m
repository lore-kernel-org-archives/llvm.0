Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D036FB8
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 15:49:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-405505b07dfso27186785e9.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 08:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695656968; x=1696261768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+2yILMg5RefpLAOUcXf0dyQqPNPRMS1MIKyTbaudkU=;
        b=s+Dcnw7p8hl0FaxElrtJ75ZzTGfP9kgUUkU5TR4sxOI6L64/QalLCcB+uOyZPucvd3
         Fq74iafoQNDg2ODucF3jxcLwygBeJic2hT5HFRtd7mdmMMNzBhKlys67RY1pQOoKoOA7
         dgx955RxuEjxbj9TESer3dy0UU9WuJWzGr91Q0ompiS7i0mNmTkyPD6eNTxncaMPzqZH
         oABWF0ho7RVf0ekdrL9TSi3USCFOOjaayrpNFo833O6ve23CKFF8AhpW4qXvsatyxm1V
         pe7wI/HSJWSmiqrLiR9yIuI6QZ0/hqdeGRir1On3NGEN7yYo6CH6IINTlQljNnUoSu2s
         L9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656968; x=1696261768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+2yILMg5RefpLAOUcXf0dyQqPNPRMS1MIKyTbaudkU=;
        b=utroWB93a47IWalX1fG3pqGpqmdHk54AzW/claST3XA+Esv3ycYhbRL+BX3GoMSaDZ
         3MD8SAe8QxPYstbJZbcO1vGhWkqoE91vBguxZxtSPZHagE6jFCWtuq54+Gyr4HCAGhwG
         0Is5vPglg28sePSYlPthizb/G0PeN+dPQMoxb6HVa449DgxZNCEXKRe2E3xzYtX4hSKK
         FzKywnFPib2fsnmZYOJbP4xjtAVvYG9IyAaHc+vO6vWvIybt5+AtBaAZDFoLxovicOPP
         W23hLNTh9m4isKmrJy8bb3343MHVAiig1IRijtp56kzDJuHMj+jHha6z9xELyyuoqqlr
         36xg==
X-Gm-Message-State: AOJu0YyMUterzyu2FveZFRcUyUo68agUuslzRN3NLis3kjDfaZ6eZK5q
	K83dpBf4UJhz55gN9aEONebigCf9Vp7WHl2oUpOQ2g==
X-Google-Smtp-Source: AGHT+IFYkqdHGdR2kidRG0+OQJ3JZy4ns04TrE9mQfEctcI2HKnQVBN8IKTqK3yiB+rsC3sTovi9TNXTeTFItzaJioE=
X-Received: by 2002:adf:fe09:0:b0:323:30d0:5c4d with SMTP id
 n9-20020adffe09000000b0032330d05c4dmr15309wrr.19.1695656968282; Mon, 25 Sep
 2023 08:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-2-irogers@google.com>
In-Reply-To: <20230923053515.535607-2-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Sep 2023 08:49:17 -0700
Message-ID: <CAKwvOdmHg_43z_dTZrOLGubuBBvmHdPxSFjOWa3oWkbOp2qWWg@mail.gmail.com>
Subject: Re: [PATCH v1 01/18] gen_compile_commands: Allow the line prefix to
 still be cmd_
To: Ian Rogers <irogers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Yang Jihong <yangjihong1@huawei.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Yanteng Si <siyanteng@loongson.cn>, Yuan Can <yuancan@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Builds in tools still use the cmd_ prefix in .cmd files, so don't
> require the saved part. Name the groups in the line pattern match so

Is that something that can be changed in the tools/ Makefiles?

I'm fine with this change, just curious where the difference comes
from precisely.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> that changing the regular expression is more robust and works with the
> addition of a new match group.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index a84cc5737c2c..b43f9149893c 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -19,7 +19,7 @@ _DEFAULT_OUTPUT =3D 'compile_commands.json'
>  _DEFAULT_LOG_LEVEL =3D 'WARNING'
>
>  _FILENAME_PATTERN =3D r'^\..*\.cmd$'
> -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.[cS]) *(;|$)'
> +_LINE_PATTERN =3D r'^(saved)?cmd_[^ ]*\.o :=3D (?P<command_prefix>.* )(?=
P<file_path>[^ ]*\.[cS]) *(;|$)'
>  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
>  # The tools/ directory adopts a different build system, and produces .cm=
d
>  # files in a different format. Do not support it.
> @@ -213,8 +213,8 @@ def main():
>                  result =3D line_matcher.match(f.readline())
>                  if result:
>                      try:
> -                        entry =3D process_line(directory, result.group(1=
),
> -                                             result.group(2))
> +                        entry =3D process_line(directory, result.group('=
command_prefix'),
> +                                             result.group('file_path'))
>                          compile_commands.append(entry)
>                      except ValueError as err:
>                          logging.info('Could not add line from %s: %s',
> --
> 2.42.0.515.g380fc7ccd1-goog
>


--=20
Thanks,
~Nick Desaulniers
