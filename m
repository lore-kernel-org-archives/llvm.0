Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E8B651
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-565334377d0so3366932a12.2
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 23:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696832475; x=1697437275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqzxkQ2kaFA3LhoAZmBsNaaLHYDoJFZNDM8wtB/redY=;
        b=W1WEoOuRXhOFXWUocSlQO2962LVnAy10UWMSJRbsDInMADRFNahQIdMvPUj7NdU+u0
         a3sivrs339SmJj1wuSHbllyCHq2JZSzJafHFRWI2whps2SZgg/fOCkWnkO2b9WJqTZuH
         Z2CezKfpqsgGRRllkMZzwh3TXfnJux80WoNVjF2puxop72s+V5hqS8694p3g7FRu1Inu
         Jzf5ddXLxl4+jJiLRHT2BcbJ3Os64CWP+6Q7NDrhcKQaNqM+Yn2NTwLlepXfwKJKtYd2
         6PY43Ug4T6zo2/DV3aRPYwQUIMJU0QhY5KUUMWOIbEMQfgjqnzNl9pk7hKr83P+WLtQg
         18bg==
X-Gm-Message-State: AOJu0Yy11Cl+bMSIQMs0YII7lmHvpGGAn3uo7uNCVZz1XWkRVohWRedm
	8aMFndxiB3Jc9eV374s7mrIi86smxSXDSSWvtng=
X-Google-Smtp-Source: AGHT+IHipStQxQb3cJsEmsKyjG2x73hMhk0WqgsHINOilfTS5PE0o/18YQpFkwA82j4XWhtNLoMGqq0ExLQXvPsOs/w=
X-Received: by 2002:a05:6a21:7881:b0:15e:a653:fed5 with SMTP id
 bf1-20020a056a21788100b0015ea653fed5mr18979636pzc.16.1696832475036; Sun, 08
 Oct 2023 23:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-11-irogers@google.com>
In-Reply-To: <20231005230851.3666908-11-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 23:21:03 -0700
Message-ID: <CAM9d7cj3AuAo-+ncd6nULusvgw1NUhBdSAED9vf_eDQ7Z=cEPQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] perf dlfilter: Be defensive against potential
 NULL dereference
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
> In the unlikely case of having a symbol without a mapping, avoid a
> NULL dereference that clang-tidy warns about.

I'm not sure if it's possible to have a symbol without a map,
but I'm also fine with being conservative.

Thanks,
Namhyung

>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/dlfilter.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/dlfilter.c b/tools/perf/util/dlfilter.c
> index 1dbf27822ee2..5e54832137a9 100644
> --- a/tools/perf/util/dlfilter.c
> +++ b/tools/perf/util/dlfilter.c
> @@ -52,8 +52,10 @@ static void al_to_d_al(struct addr_location *al, struc=
t perf_dlfilter_al *d_al)
>                 d_al->sym_end =3D sym->end;
>                 if (al->addr < sym->end)
>                         d_al->symoff =3D al->addr - sym->start;
> -               else
> +               else if (al->map)
>                         d_al->symoff =3D al->addr - map__start(al->map) -=
 sym->start;
> +               else
> +                       d_al->symoff =3D 0;
>                 d_al->sym_binding =3D sym->binding;
>         } else {
>                 d_al->sym =3D NULL;
> --
> 2.42.0.609.gbb76f46606-goog
>
