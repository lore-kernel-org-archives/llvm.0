Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F2B66D
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27736c2a731so3188670a91.3
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 23:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696832064; x=1697436864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdIseKxNnHvoiSCvYwI9x5coaaanSCFVs/MmGIY9e1w=;
        b=KfS/pBhuqBYJoL12HpIovtpnSx2hYOXk8Dh4cOkk0p3+Aknb6Fdg0WlN9BYn73+F9N
         3ZIlLvR9r84x+Vok2fBtws2ll5Ap4lwElIxK/XJFmY/RPtXjdP4ch4rcfv8z99ECP4Dq
         kxgzCTCW6aALYgdDlToHw0xbMfiRwdcpTMQzp1+S6vxhoF2C1rdqCHBeBLH8m2Pe+DUQ
         qpg2+SjLL74W/fo3NnbvaUfL6UsOF6pMC69Xu+aAL9T8Pev3hYm7TaV++bolvbk2WPB+
         RTBltRVfnz21SK3O8t0YcZGCADZmtNCbgSxjj75RIZaVZgRgOFr9vhlyDl/YHFAK4U5K
         Rp/g==
X-Gm-Message-State: AOJu0YzZ2GPW9p2bddTKl+dqRt4RA7JpyajoycAxtSjCjcMproVQvQWt
	hJehleyPUQiCNg71xkbLOUP6CcHKho0Pj0rZdG4Blo0o
X-Google-Smtp-Source: AGHT+IG4YN77+NfgnWMQwnUP7ZlWmW1mV8JEtpbsLHd3pE4zN7HoIS4XpJ0oM784HlquonmeWmhm3TnsWBlJv6a4TGo=
X-Received: by 2002:a17:90b:38cd:b0:26d:2bac:a0bb with SMTP id
 nn13-20020a17090b38cd00b0026d2baca0bbmr13387049pjb.6.1696832063882; Sun, 08
 Oct 2023 23:14:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-8-irogers@google.com>
In-Reply-To: <20231005230851.3666908-8-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 23:14:12 -0700
Message-ID: <CAM9d7cjcJKjUnpYEjGap=d1fuukpsDyWCOk2_UKrepXmagceZA@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] perf env: Remove unnecessary NULL tests
To: Ian Rogers <irogers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> clang-tidy was warning:
> ```
> util/env.c:334:23: warning: Access to field 'nr_pmu_mappings' results in =
a dereference of a null pointer (loaded from variable 'env') [clang-analyze=
r-core.NullDereference]
>         env->nr_pmu_mappings =3D pmu_num;
> ```
>
> As functions are called potentially when !env was true. This condition
> could never be true as it would produce a segv, so remove the
> unnecessary NULL tests and silence clang-tidy.

IIRC !env was to handle live sessions like perf top
or when it doesn't have a perf data file.  Anyway,
it doesn't seem to work anymore.

Thanks,
Namhyung

>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/env.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
> index a164164001fb..44140b7f596a 100644
> --- a/tools/perf/util/env.c
> +++ b/tools/perf/util/env.c
> @@ -457,7 +457,7 @@ const char *perf_env__cpuid(struct perf_env *env)
>  {
>         int status;
>
> -       if (!env || !env->cpuid) { /* Assume local operation */
> +       if (!env->cpuid) { /* Assume local operation */
>                 status =3D perf_env__read_cpuid(env);
>                 if (status)
>                         return NULL;
> @@ -470,7 +470,7 @@ int perf_env__nr_pmu_mappings(struct perf_env *env)
>  {
>         int status;
>
> -       if (!env || !env->nr_pmu_mappings) { /* Assume local operation */
> +       if (!env->nr_pmu_mappings) { /* Assume local operation */
>                 status =3D perf_env__read_pmu_mappings(env);
>                 if (status)
>                         return 0;
> @@ -483,7 +483,7 @@ const char *perf_env__pmu_mappings(struct perf_env *e=
nv)
>  {
>         int status;
>
> -       if (!env || !env->pmu_mappings) { /* Assume local operation */
> +       if (!env->pmu_mappings) { /* Assume local operation */
>                 status =3D perf_env__read_pmu_mappings(env);
>                 if (status)
>                         return NULL;
> --
> 2.42.0.609.gbb76f46606-goog
>
