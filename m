Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57479CA42
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5827f6d60aaso2452474a12.3
        for <llvm@lists.linux.dev>; Sun, 08 Oct 2023 23:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831616; x=1697436416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjxneKkkqrx1oncikRu0Qi4dyA9GT6GAt8sDRuISidk=;
        b=RORqOIftv7qT4JdnpdOCTeofkT22xesCyf5rN/TtXeL2IabuDxVtpgdh1d+z4ppXhT
         kHobl2xzUhfSfstMpy8B/bBZN1xC3+0A0G8ME+xrx40VP3QoHZGl2sWxrlSn2rKo5M6f
         hpKloVPYj4s+AOgKvR/TEsJ0UAeVoBqEvniZzEjVTJvxIKjKm3/rsSSZMkFDGBYWxmBT
         C+QGa4ntDwFLt7WVmh2umSLjGMBVfw/b0XQr/MsIHcO8fsOl5Oo/XfTWa5em12fZHIBC
         6Nm1A0XnNZ5Csglq9r8kysJ2jUOCest1rI1x7tVoJRGvVs3LDf+NVx6RnqWIfyBw9tgh
         Gf8g==
X-Gm-Message-State: AOJu0Yxbfy49qIN3qN5WFOumeC3VSNcVqxT/0wel0qsVS0k9tfAGgXJD
	Lh5OGNS2q7fCqOcg/W5j+1StyP27zb4ltS9uLdU=
X-Google-Smtp-Source: AGHT+IE96wBnK3o5FMWQPBk64nrh21K6OSIjXi5hLdFj4vStoyOVhL4n/9OMc/iQ5OPMJOHsXm4Drcmm78xp6fydi4g=
X-Received: by 2002:a17:90b:33c6:b0:279:19b7:9be7 with SMTP id
 lk6-20020a17090b33c600b0027919b79be7mr12103542pjb.5.1696831615986; Sun, 08
 Oct 2023 23:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com> <20231005230851.3666908-7-irogers@google.com>
In-Reply-To: <20231005230851.3666908-7-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 23:06:44 -0700
Message-ID: <CAM9d7cjB_Sm4xnXexDqq_Q4jmOrwhxBjQbAhr-UTmb_4CPLONw@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] perf buildid-cache: Fix use of uninitialized value
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
> The buildid filename is first determined and then from this the
> buildid read. If getting the filename fails then the buildid will be
> used for a later memcmp uninitialized. Detected by clang-tidy.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/builtin-buildid-cache.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/builtin-buildid-cache.c b/tools/perf/builtin-buil=
did-cache.c
> index cd381693658b..e2a40f1d9225 100644
> --- a/tools/perf/builtin-buildid-cache.c
> +++ b/tools/perf/builtin-buildid-cache.c
> @@ -277,8 +277,10 @@ static bool dso__missing_buildid_cache(struct dso *d=
so, int parm __maybe_unused)
>         char filename[PATH_MAX];
>         struct build_id bid;
>
> -       if (dso__build_id_filename(dso, filename, sizeof(filename), false=
) &&
> -           filename__read_build_id(filename, &bid) =3D=3D -1) {
> +       if (!dso__build_id_filename(dso, filename, sizeof(filename), fals=
e))
> +               return true;

This won't print anything and ignore the file which changes
the existing behavior.  But if it fails to read the build-id, I
don't think there is not much we can do with it.  IIUC the
original intention of -M/--missing option is to list files that
have a build-id but it's not in the build-id cache.  So maybe
it's ok to silently ignore it.

Thanks,
Namhyung


> +
> +       if (filename__read_build_id(filename, &bid) =3D=3D -1) {
>                 if (errno =3D=3D ENOENT)
>                         return false;
>
> --
> 2.42.0.609.gbb76f46606-goog
>
