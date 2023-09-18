Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D827ED5
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 23:34:28 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7928ba24936so174678239f.0
        for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 16:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695080068; x=1695684868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1MBG/8N9ID9Y0dMkemv1pUiIymtv+KnT7vt9Hz75SY=;
        b=ozRVG7aoL6olOmFkhZhSgztlxU3oEOU9Shwv6CbH95RjF1M/zcQvGBr6mADK0F3w2G
         2A5XthHJlbgP9lrWxpaCXtz3LtdW0OQH/ExWaq6l4120nFC4ZCejG5CWE3tSlvZq0E5l
         fbFwRTNNeLBmz32rJL8nx6X6+weOWsrecwKPdl+5PDxo68szI31dpuCysKGOCTffyP6m
         JP622eWJAflQyM2slLwx8XCxyokDeSed7zKQ8piyUhhBioybFiZ+OEEa1x2vxnWC78GP
         8ZZ891OXZcEr6VK57m64MXMcQ5g1IQ7rzUQO0Ob7ZPSHNxQMMzvLfiTC9LT/WvhXNDMW
         2tKg==
X-Gm-Message-State: AOJu0YxfHyhRiFTxELSfMgMntyx2PBjjAvOzeb7EFtCci8S7yd5ESuPg
	0/V+gdQsSKC+nG1InwsPl4Ssmd/Rkfb2UIyadmk=
X-Google-Smtp-Source: AGHT+IENDcI36OKlfzNhoW5wTDYOUEabYwAmoc5KA3TD2VnDcnrdeWPmnWNMf+HNeHS4KrAhQiK//mxJu+9t8Oavno4=
X-Received: by 2002:a6b:e009:0:b0:798:2415:1189 with SMTP id
 z9-20020a6be009000000b0079824151189mr13620379iog.12.1695080068237; Mon, 18
 Sep 2023 16:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com> <20230914211948.814999-5-irogers@google.com>
In-Reply-To: <20230914211948.814999-5-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Mon, 18 Sep 2023 16:34:16 -0700
Message-ID: <CAM9d7ci3JPZ8ABamXUCRrAEV3jE=twPLSByOU_LC8LdzPedP2w@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] perf test: Ensure EXTRA_TESTS is covered in build test
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ian,

On Thu, Sep 14, 2023 at 2:20=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Add to run variable.
>
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/tests/make | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/perf/tests/make b/tools/perf/tests/make
> index a3a0f2a8bba0..d9945ed25bc5 100644
> --- a/tools/perf/tests/make
> +++ b/tools/perf/tests/make
> @@ -138,6 +138,7 @@ endif
>  run +=3D make_python_perf_so
>  run +=3D make_debug
>  run +=3D make_nondistro
> +run +=3D make_extra_tests

I'm curious why it's missed.. I couldn't find a commit to delete it.
Maybe due to an incorrect resolution of a merge conflict?

Thanks,
Namhyung


>  run +=3D make_no_bpf_skel
>  run +=3D make_gen_vmlinux_h
>  run +=3D make_no_libperl
> --
> 2.42.0.459.ge4e396fd5e-goog
>
