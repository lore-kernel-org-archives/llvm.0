Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FA31FDD
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708480397; cv=none; b=JRA0OuEIuELGgj4upti1eMztw+h4Abzsl9sx5xtDop5pUpxDaGgZD4DOujaYxSLeg4ShNcMn2IU/oVgdPakn2x0gKAQx7pv1OWP33XAXR6FMZgBNVLlTqB+BT47O0Yxb5bilCBDpY+sBMZ+Caim9WqE5Ilnp/u8pUYeh036Ys8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708480397; c=relaxed/simple;
	bh=txkMZ/Gg8fpSCMJTWXUn8JbtYWC6xphivOjGiTiGjsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttZv+eWbXo0jULsSq3WR9aKxw4+lBq1Uoa7ACAhu+dRx6BA5BWtvMde/wqHLTbrERsomMiGAgG9o9nW+zak0Tu3PgJ2noWciGdBMkuQqI1lLe4qRkK6Yi1d3lfdfPG2HI5B89OaHjSZdNwRA+uxjRSvAs/kfh+4w9yNOj/c/pM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-299e4b352cdso866882a91.0
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 17:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708480395; x=1709085195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBly6Q2PEojVSg3uLNQmMXendkI9nh//XLo8bYv5jdA=;
        b=aCHdnhk1dXfNK4L4MEBZ4OrDx4n5q5I1Ot9dK4VpqF/oSotjfXpTrBvfIfCngXOm7W
         kFZVbeHpXvGV1AG/lnCDN3PPfINZoapft8T6zRpUBZdqDr2ZSfxAUarOoNRUYxvDfoVv
         5tK/b7aUGgLdjhg0SkAoaLaCbVLpVqw7DT3fGSLZDdh8gaA8ngr0UJEYXQWhxebWJQyn
         woiJ/D8i03QcqHEjbYA81a0Ydvk9IsskmEIvWezDZGt8nFoh+I9Kfy5WOmLLxlOJItb7
         FukoAq5Y8FzomxGX4YvpzaKevE76rGGkb8Vgpw7omSXTvn5p3KKyXQLHm2nQXTTl8OQp
         ErBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwVTJR7L57HfNwX1y2yYjCN31F/t1hRxH7tPzLtWt5uuDsH8cY74FlDpfJI0OnfqoQ5d0OqY7eGrgz+YnikTZTkRxqsw==
X-Gm-Message-State: AOJu0Yy0oEgmDNTRpCh+s57x1IaRb6k6vDwS5DUU11wFMMWd80eIFlFf
	TMe7SGqGXNYwij7dXdSjYD631xK4XWWM3NGCN1SGMgHgGuRIEPeGs+syOzFIA474KX265DBlLFy
	K0fcBb9k7K46IuvZwevSeiXe3fgQ=
X-Google-Smtp-Source: AGHT+IGyfZl8zQrLCDq95vXqsW3gTFcoH6OrHCZMebf7zF6Qz5F5m+BE5cvJk2Dn+v+46Is9jDoSaI4hLFX36Rx0Gdc=
X-Received: by 2002:a17:90b:4a0c:b0:299:3334:51d1 with SMTP id
 kk12-20020a17090b4a0c00b00299333451d1mr11485895pjb.10.1708480395448; Tue, 20
 Feb 2024 17:53:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com> <20240216235203.229256-3-irogers@google.com>
In-Reply-To: <20240216235203.229256-3-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 20 Feb 2024 17:53:03 -0800
Message-ID: <CAM9d7cgqpvXLgq35B5MoysFzLeUBg7bJzX+pTK_ER=-hM0D=AQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] perf list: Add scandirat compatibility function
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	James Clark <james.clark@arm.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yang Jihong <yangjihong1@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Fri, Feb 16, 2024 at 3:55=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> scandirat is used during the printing of tracepoint events but may be
> missing from certain libcs. Add a compatibility implementation that
> uses the symlink of an fd in /proc as a path for the reliably present
> scandir.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

This fails to build in alpine:

  util/print-events.c: In function 'print_tracepoint_events':
  util/print-events.c:92:29: error: implicit declaration of function
'scandirat'; did you mean 'scandir'?
[-Werror=3Dimplicit-function-declaration]
  92 |                 evt_items =3D scandirat(events_fd,
sys_dirent->d_name, &evt_namelist, NULL, alphasort);
  |                             ^~~~~~~~~
  |                             scandir

Thanks,
Namhyung


> ---
>  tools/perf/util/print-events.c | 12 +++---------
>  tools/perf/util/util.c         | 19 +++++++++++++++++++
>  tools/perf/util/util.h         |  8 ++++++++
>  3 files changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-event=
s.c
> index 9e47712507cc..bf79dd366e2e 100644
> --- a/tools/perf/util/print-events.c
> +++ b/tools/perf/util/print-events.c
> @@ -63,6 +63,8 @@ void print_tracepoint_events(const struct print_callbac=
ks *print_cb __maybe_unus
>  {
>         char *events_path =3D get_tracing_file("events");
>         int events_fd =3D open(events_path, O_PATH);
> +       struct dirent **sys_namelist =3D NULL;
> +       int sys_items;
>
>         put_tracing_file(events_path);
>         if (events_fd < 0) {
> @@ -70,10 +72,7 @@ void print_tracepoint_events(const struct print_callba=
cks *print_cb __maybe_unus
>                 return;
>         }
>
> -#ifdef HAVE_SCANDIRAT_SUPPORT
> -{
> -       struct dirent **sys_namelist =3D NULL;
> -       int sys_items =3D tracing_events__scandir_alphasort(&sys_namelist=
);
> +       sys_items =3D tracing_events__scandir_alphasort(&sys_namelist);
>
>         for (int i =3D 0; i < sys_items; i++) {
>                 struct dirent *sys_dirent =3D sys_namelist[i];
> @@ -130,11 +129,6 @@ void print_tracepoint_events(const struct print_call=
backs *print_cb __maybe_unus
>         }
>
>         free(sys_namelist);
> -}
> -#else
> -       printf("\nWARNING: Your libc doesn't have the scandirat function,=
 please ask its maintainers to implement it.\n"
> -              "         As a rough fallback, please do 'ls %s' to see th=
e available tracepoint events.\n", events_path);
> -#endif
>         close(events_fd);
>  }
>
> diff --git a/tools/perf/util/util.c b/tools/perf/util/util.c
> index c1fd9ba6d697..4f561e5e4162 100644
> --- a/tools/perf/util/util.c
> +++ b/tools/perf/util/util.c
> @@ -552,3 +552,22 @@ int sched_getcpu(void)
>         return -1;
>  }
>  #endif
> +
> +#ifndef HAVE_SCANDIRAT_SUPPORT
> +int scandirat(int dirfd, const char *dirp,
> +             struct dirent ***namelist,
> +             int (*filter)(const struct dirent *),
> +             int (*compar)(const struct dirent **, const struct dirent *=
*))
> +{
> +       char path[PATH_MAX];
> +       int err, fd =3D openat(dirfd, dirp, O_PATH);
> +
> +       if (fd < 0)
> +               return fd;
> +
> +       snprintf(path, sizeof(path), "/proc/%d/fd/%d", getpid(), fd);
> +       err =3D scandir(path, namelist, filter, compar);
> +       close(fd);
> +       return err;
> +}
> +#endif
> diff --git a/tools/perf/util/util.h b/tools/perf/util/util.h
> index 7c8915d92dca..9966c21aaf04 100644
> --- a/tools/perf/util/util.h
> +++ b/tools/perf/util/util.h
> @@ -6,6 +6,7 @@
>  /* glibc 2.20 deprecates _BSD_SOURCE in favour of _DEFAULT_SOURCE */
>  #define _DEFAULT_SOURCE 1
>
> +#include <dirent.h>
>  #include <fcntl.h>
>  #include <stdbool.h>
>  #include <stddef.h>
> @@ -56,6 +57,13 @@ int perf_tip(char **strp, const char *dirpath);
>  int sched_getcpu(void);
>  #endif
>
> +#ifndef HAVE_SCANDIRAT_SUPPORT
> +int scandirat(int dirfd, const char *dirp,
> +             struct dirent ***namelist,
> +             int (*filter)(const struct dirent *),
> +             int (*compar)(const struct dirent **, const struct dirent *=
*));
> +#endif
> +
>  extern bool perf_singlethreaded;
>
>  void perf_set_singlethreaded(void);
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
