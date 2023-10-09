Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214631A726
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K6pSCc/n"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50348c54439so7220e87.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 09:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696869224; x=1697474024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgAUhHJmbAWVKMj/qj7uBpSpsL5yIQNcIBFI1M3KUrE=;
        b=K6pSCc/nXcH0YmasEt28yneUBhWN7IcYWajmKp8pfrh7eAc81Jz+AFip3Ph0+thTEc
         Qc5Q3IsVrkiDlaVEB0X5vY0ZE03uGfIPFarjU/e/4PLyRwMvRcY+0LuNRWuel4vG7cax
         OiIt9PekthSCoA2MwgBXnQI0crzuZcwwEIZsBmoBMCc6kwY2Qi0oM1rkad3uClzMT3rY
         wyHMtw5lDVvFtkqkPkXV/7eJnFbtLZ3bV22fIvkhIebqGYEGxYssZeF2zsNntGkLmM0N
         fO65H50iJGx+wld8QoDK4gkd4ZpIpPvojl6Y3wSLUaYm7e9codWGtvdD67NDomQzgD5X
         PUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696869224; x=1697474024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgAUhHJmbAWVKMj/qj7uBpSpsL5yIQNcIBFI1M3KUrE=;
        b=JLtPkfZZzrLVyKIO1LRwNYvvMy7Kizq0mjr4WBrajBD0wJw+wOahKvmw/3MpHXe2iU
         ctF4b5nO8rESJmbuZXNtxIv7kCL8uWtNGJnpRsVkP9oa8XJjL3gV3bZo/JMRBWWhUxSv
         8hoF+Tlw5nHp4EGkMJp9zEkUtdqnCeiTB6BsiMyup3c55cQggIbjsi5faXZ16l0I/Zrr
         1f2Jdr+vmWkuWeDtbbPdT5M3T2UEDUM0XwcglQlyGAYc/ic0Ci/kwVuS9CaeRpUq+Y3U
         AE0noNOJF5YF5FyIvk7Heem3wd8sULsPkID28EtoNSQ076fFTYHuGckGp7cu2NAIu8xS
         i5Rg==
X-Gm-Message-State: AOJu0Yw4oxF8CdSTu1/RYCZ9KLlE63IbqYFeN1+Cjb1Fvs3/j1YGLweL
	qUKP0C8RO/yRgfaZYws6PbDettJlNwXcqX6McmTxbg==
X-Google-Smtp-Source: AGHT+IGXiscr4EwxJpJQCI+XewTXiBNpPjwzDfqPDNFwxJs+1vHuH0y0A/ysZtYnjJFzd+aiIxPaVy3GoJQMOtBy2aw=
X-Received: by 2002:ac2:44db:0:b0:505:7c88:9e45 with SMTP id
 d27-20020ac244db000000b005057c889e45mr230791lfm.0.1696869223703; Mon, 09 Oct
 2023 09:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-8-irogers@google.com>
 <CAM9d7cjcJKjUnpYEjGap=d1fuukpsDyWCOk2_UKrepXmagceZA@mail.gmail.com>
In-Reply-To: <CAM9d7cjcJKjUnpYEjGap=d1fuukpsDyWCOk2_UKrepXmagceZA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Oct 2023 09:33:32 -0700
Message-ID: <CAP-5=fX1f022Z052mOxgJODg_jOPCqHScjZam2_3YwUXqriO4A@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] perf env: Remove unnecessary NULL tests
To: Namhyung Kim <namhyung@kernel.org>
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

On Sun, Oct 8, 2023 at 11:14=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Thu, Oct 5, 2023 at 4:09=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > clang-tidy was warning:
> > ```
> > util/env.c:334:23: warning: Access to field 'nr_pmu_mappings' results i=
n a dereference of a null pointer (loaded from variable 'env') [clang-analy=
zer-core.NullDereference]
> >         env->nr_pmu_mappings =3D pmu_num;
> > ```
> >
> > As functions are called potentially when !env was true. This condition
> > could never be true as it would produce a segv, so remove the
> > unnecessary NULL tests and silence clang-tidy.
>
> IIRC !env was to handle live sessions like perf top
> or when it doesn't have a perf data file.  Anyway,
> it doesn't seem to work anymore.

I trust the analyzer here and it would be better to crash earlier,
from env being NULL, than in a particular conditional branch. Like
you, I wasn't able to find a failure from removing the checks.

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/env.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/tools/perf/util/env.c b/tools/perf/util/env.c
> > index a164164001fb..44140b7f596a 100644
> > --- a/tools/perf/util/env.c
> > +++ b/tools/perf/util/env.c
> > @@ -457,7 +457,7 @@ const char *perf_env__cpuid(struct perf_env *env)
> >  {
> >         int status;
> >
> > -       if (!env || !env->cpuid) { /* Assume local operation */
> > +       if (!env->cpuid) { /* Assume local operation */
> >                 status =3D perf_env__read_cpuid(env);
> >                 if (status)
> >                         return NULL;
> > @@ -470,7 +470,7 @@ int perf_env__nr_pmu_mappings(struct perf_env *env)
> >  {
> >         int status;
> >
> > -       if (!env || !env->nr_pmu_mappings) { /* Assume local operation =
*/
> > +       if (!env->nr_pmu_mappings) { /* Assume local operation */
> >                 status =3D perf_env__read_pmu_mappings(env);
> >                 if (status)
> >                         return 0;
> > @@ -483,7 +483,7 @@ const char *perf_env__pmu_mappings(struct perf_env =
*env)
> >  {
> >         int status;
> >
> > -       if (!env || !env->pmu_mappings) { /* Assume local operation */
> > +       if (!env->pmu_mappings) { /* Assume local operation */
> >                 status =3D perf_env__read_pmu_mappings(env);
> >                 if (status)
> >                         return NULL;
> > --
> > 2.42.0.609.gbb76f46606-goog
> >
