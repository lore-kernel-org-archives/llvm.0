Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363831BDEC
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 16:06:23 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-414ba610766so1129281cf.0
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 09:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695657983; x=1696262783; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zz326N6OBdHyE4AWsKl7zmfrXxh5t/tD9DFw2q4SSSM=;
        b=gOWslWM0RcWgLMwdyLfNwFfHkZ9LtC8oKzRUFfqMME9ic2PS9oOtmcinapqIodqPJs
         6zN1w88/HEJONFnJGPfXxy1qzif5VoqQT53i6D5GY4/qKgXUIndvOwJ3z2MjOx11cY5V
         uf0paHDm2aheq61AXkY6iXQeEG36bmTmzVu3yTFJKRl3Kgn5fOy8QathwmPCKPTslLvd
         9az7IGiAFShdtzlbRP2sTNBvvWiGjBHbk8Daf4Ls7g8ZZEEKQHCwv5KzNyRolKIomBbl
         z19kwmFoGKfrbMbZwiQOJeMPFiqoK3Yuh77rYTuhdTVvi0yMi/47sUXLc01OIcDtTdOq
         RSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695657983; x=1696262783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz326N6OBdHyE4AWsKl7zmfrXxh5t/tD9DFw2q4SSSM=;
        b=Wvx/5KDlq07HB9ueHfro6SE/QVREcwuMGEamEaeMax7d73AFwPQZDtpLFeNBmBmY4X
         PG1qFHuzXBr5PXkomaoCvzJb5MDRdQFzPjRH1+YOBMlV1GEDDh19HEOlbUSkMobGEt1T
         UmIQRu20dgSdYJM44XEJ6wDRpd388Biacyl0Shci65lZwyYKaxqjcRg8pgB6yj21j1a2
         Z9vJeAK3qXi/4rZV6CzOPQh7zLwHyESw6IQoN/Je+F6EaKXPnteRCSkUT6x+ngYha+JT
         7axy5h2itFJSuo2C+HmXkDzw6q6Ppub/f7CjMJGHCqHps0eBhwyCL/uuruk4KpPKNNlP
         qqcw==
X-Gm-Message-State: AOJu0YzJfaDkgmH+Z7YINUFcrRZlVxoo23eTU12wbx8kiuRaZmkzDJQh
	573yUu1N3VJQCrWLWpzM42cWHqdv8vwoZaeceyEVOg==
X-Google-Smtp-Source: AGHT+IEV1Y/S2WpYl/9OIl3jT55DN3TXd8/qzR+sWbjS06Z0lcw8hV/1qy78WDMnfjxDHbG52+fBPZ5xzQJMHGZzdhQ=
X-Received: by 2002:a05:622a:1905:b0:417:cd31:a2f6 with SMTP id
 w5-20020a05622a190500b00417cd31a2f6mr459497qtc.1.1695657982784; Mon, 25 Sep
 2023 09:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-2-irogers@google.com>
 <CAKwvOdmHg_43z_dTZrOLGubuBBvmHdPxSFjOWa3oWkbOp2qWWg@mail.gmail.com>
In-Reply-To: <CAKwvOdmHg_43z_dTZrOLGubuBBvmHdPxSFjOWa3oWkbOp2qWWg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 Sep 2023 09:06:11 -0700
Message-ID: <CAP-5=fV6c1tWAd2GjMwn4PQN=3BXNQGz=vbonHSjRjQ3fbEL+g@mail.gmail.com>
Subject: Re: [PATCH v1 01/18] gen_compile_commands: Allow the line prefix to
 still be cmd_
To: Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Masahiro Yamada <masahiroy@kernel.org>
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

On Mon, Sep 25, 2023 at 8:49=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Builds in tools still use the cmd_ prefix in .cmd files, so don't
> > require the saved part. Name the groups in the line pattern match so
>
> Is that something that can be changed in the tools/ Makefiles?
>
> I'm fine with this change, just curious where the difference comes
> from precisely.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I agree. The savedcmd_ change came from Masahiro in:
https://lore.kernel.org/lkml/20221229091501.916296-1-masahiroy@kernel.org/
I was reluctant to change the build logic in tools/ because of the
potential to break things. Maybe Masahiro/Nicolas know of issues?

Thanks,
Ian

>
> > that changing the regular expression is more robust and works with the
> > addition of a new match group.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  scripts/clang-tools/gen_compile_commands.py | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clan=
g-tools/gen_compile_commands.py
> > index a84cc5737c2c..b43f9149893c 100755
> > --- a/scripts/clang-tools/gen_compile_commands.py
> > +++ b/scripts/clang-tools/gen_compile_commands.py
> > @@ -19,7 +19,7 @@ _DEFAULT_OUTPUT =3D 'compile_commands.json'
> >  _DEFAULT_LOG_LEVEL =3D 'WARNING'
> >
> >  _FILENAME_PATTERN =3D r'^\..*\.cmd$'
> > -_LINE_PATTERN =3D r'^savedcmd_[^ ]*\.o :=3D (.* )([^ ]*\.[cS]) *(;|$)'
> > +_LINE_PATTERN =3D r'^(saved)?cmd_[^ ]*\.o :=3D (?P<command_prefix>.* )=
(?P<file_path>[^ ]*\.[cS]) *(;|$)'
> >  _VALID_LOG_LEVELS =3D ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'=
]
> >  # The tools/ directory adopts a different build system, and produces .=
cmd
> >  # files in a different format. Do not support it.
> > @@ -213,8 +213,8 @@ def main():
> >                  result =3D line_matcher.match(f.readline())
> >                  if result:
> >                      try:
> > -                        entry =3D process_line(directory, result.group=
(1),
> > -                                             result.group(2))
> > +                        entry =3D process_line(directory, result.group=
('command_prefix'),
> > +                                             result.group('file_path')=
)
> >                          compile_commands.append(entry)
> >                      except ValueError as err:
> >                          logging.info('Could not add line from %s: %s',
> > --
> > 2.42.0.515.g380fc7ccd1-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
