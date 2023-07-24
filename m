Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7678F9D1
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 21:01:59 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7919342c456so1240675241.2
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 14:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690232518; x=1690837318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwEv6m7WdEj0WSS/WT/tsZ81hOCgU00T3UAZ9HdZAtM=;
        b=ZXJZqU++vguNApIwgPzo62X8jAfLDKCBIFCtO0mpcS9spwAkiHrJzjk3NqFkmjzfUJ
         00W5rK4Im2ZLUNSjWMonuSYFVPgD8zpl6ZQdlEvys7eXO3FIpf57vu1SQFRoHiQ1qC8/
         PnZlXRVgzntWJdt92inSsTgCxwbzn3SijHCpCqHJHrkAISuXS7tWqmyfiUDdgZ9fH17a
         Xu+A8LW0LEpsgVEfA3+ZXDrcitcAT9LYOM0ADJfrw4tSxp7RaNbqFUwsfrQ7XFNnnuBs
         z1dzEXCIAVkaEXj7JfwKwv521RnbBdchV5jPs7lA15JjkKx3v3d5BG0lhYYIhc1GlFAX
         77JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690232518; x=1690837318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwEv6m7WdEj0WSS/WT/tsZ81hOCgU00T3UAZ9HdZAtM=;
        b=hjZ9BHWrjCH62xrCHZd3WYQiCG0c+SgfmlLO6XXhIffPq8b0sxzhFLTGaGP030dmuW
         J3qEChlg9c8JTysuo+kjJxYLbHnfjwXKtX8r0bAJujK1JF6Dnkhp0/ApxDhjTu2swMbh
         GxLHCrxvMwfo7ejgadylNCp8FpGklKAlW/bv5YWt7WB8LrvYd+Ytx6QQkNg2dHCKNvCC
         0nN1IXIeI/rlOa7gyOhplEijMtEXk3RVt3FxeOpiFQ1TMhSzjLAfYB1wiiDwGxXZOcM1
         YtrVKdaslQW0dX2Rzjl8Z0nXFCJQ3uM52ELYw28SRx8iwPHl3SXaQnmCRiutx0gprLCu
         uNbg==
X-Gm-Message-State: ABy/qLZGR8U0gH0lS+ySEy9Fu5vtnQF79/iNzJrw7esHwTUc3TCnhdYz
	HxgGqilwBk3vowxv/lrRVnPK49Go5X6K8h0rVFEU1g==
X-Google-Smtp-Source: APBJJlErB59jzrRIhB+T/J9RpOvQv83sc4JBVzJJ4GXRhV/iU5dwS7hKGJz9QozlSrr9AqlTgzi1XIEgW6D/7n8VTUk=
X-Received: by 2002:a67:ef84:0:b0:443:6392:71ea with SMTP id
 r4-20020a67ef84000000b00443639271eamr2866297vsp.34.1690232518329; Mon, 24 Jul
 2023 14:01:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724201247.748146-1-irogers@google.com> <20230724201247.748146-3-irogers@google.com>
In-Reply-To: <20230724201247.748146-3-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jul 2023 14:01:46 -0700
Message-ID: <CAKwvOdkkfkoOE7G__gJ1cQq5i2o4bauk7pqudb3vd2R7sneoYg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] perf parse-events: Avoid use uninitialized warning
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Carsten Haitzler <carsten.haitzler@arm.com>, 
	Zhengjun Xing <zhengjun.xing@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, maskray@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 1:13=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> With GCC LTO a potential use uninitialized is spotted:
> ```
> In function =E2=80=98parse_events_config_bpf=E2=80=99,
>     inlined from =E2=80=98parse_events_load_bpf=E2=80=99 at util/parse-ev=
ents.c:874:8:
> util/parse-events.c:792:37: error: =E2=80=98error_pos=E2=80=99 may be use=
d uninitialized [-Werror=3Dmaybe-uninitialized]
>   792 |                                 idx =3D term->err_term + error_po=
s;
>       |                                     ^
> util/parse-events.c: In function =E2=80=98parse_events_load_bpf=E2=80=99:
> util/parse-events.c:765:13: note: =E2=80=98error_pos=E2=80=99 was declare=
d here
>   765 |         int error_pos;
>       |             ^
> ```
> So initialize at declaration.

This common pattern in C is error prone (conditional assignment in the
callee; callers maybe forget to initialize, then unconditionally use
the value). Clang's static analyzer can spot these, but isn't run for
tools/ AFAIK.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/parse-events.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index acde097e327c..da29061ecf49 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -762,7 +762,7 @@ parse_events_config_bpf(struct parse_events_state *pa=
rse_state,
>                         struct list_head *head_config)
>  {
>         struct parse_events_term *term;
> -       int error_pos;
> +       int error_pos =3D 0;
>
>         if (!head_config || list_empty(head_config))
>                 return 0;
> --
> 2.41.0.487.g6d72f3e995-goog
>


--=20
Thanks,
~Nick Desaulniers
