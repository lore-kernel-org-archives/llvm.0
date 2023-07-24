Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827ADDC8
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 21:15:20 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-63cf8754d95so8070926d6.1
        for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690233319; x=1690838119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4rysK55oB8iprX5PsN92lskw7NnrBKRNpCCq0EizyQ=;
        b=1BXELcHUXg/+rCkwfBoa14IfiR2Q6aqU9PgFbw47oz0uC3np3HFNCaFz7ScGSD5/Mq
         DQ2deQyYa6L8MreNAP/kbkznCiJ5lVuxnhfnrHFfd7TilrEZNfgf05J4hKAWXPiFXCKp
         w2saThXCYP65xSFqvvNKuNizMsmiRJkbU1CrPzPT6jgiRpEfH5PpOv1qTdGsIVNhCvAe
         Gntw2xb1FeAwbgsih7FPFGkyqFi3TaKSwJrgCjzW3MJ1FEezE8GysHleA1+80rYFJBqh
         nI1ugr89BQt/oT26XVioNDLE/paobBJMMPO2VpTFOpV8yTf+D95fnySZsTO0RH7SoWAV
         YxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690233319; x=1690838119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4rysK55oB8iprX5PsN92lskw7NnrBKRNpCCq0EizyQ=;
        b=TzjIb+C0RLmx3tsUIWNFdmJDgnsGJdIb38Ez1Cb+Ni3xA/bLv0ASrouFK587A71ajk
         kztyIpg0ArN1tE5UETHv0yNyszjZDSDOJAOs7I2FlIymGIF0lpIn4+0+K7wIaiFJsclU
         SjBhGK4c/gpQF+u7EDrAhmy6jhqCTInNdHaO38MWvwVESX+Q/+9MW9JxpFmEnpbdeyWO
         sPxelcxPTgOSX3SEi91S6XhC5xOVJq9++lQBGJFiP38xwyNGfkbQD/tiq4o5wH3inmsp
         epTzv0yavtFaPCoHY68jSbCXugKfmKkNgY3DzIVoL2LVdJ4NkGhQ2vpkhzz/MCvDjCkb
         LoMA==
X-Gm-Message-State: ABy/qLb0lXPCyvxFEIG/aqhWObNjtYPjmHLH7RkzgRDHxQbGVc6y24sT
	tJKV+sdWQzpLgs9tyy322bi6MrWga5dWMQ0ApDzkqg==
X-Google-Smtp-Source: APBJJlGzkKPEZS/cCDJEywZijBo4Ycb4UpPFNxCPqzb5sG8S3hNQy1Vf6sw4+I8SpcgyjWOXfG3YKaJb/rNkKkoJIKU=
X-Received: by 2002:a0c:facf:0:b0:635:e4ed:b6c9 with SMTP id
 p15-20020a0cfacf000000b00635e4edb6c9mr949080qvo.24.1690233319030; Mon, 24 Jul
 2023 14:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230724201247.748146-1-irogers@google.com>
In-Reply-To: <20230724201247.748146-1-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Jul 2023 14:15:07 -0700
Message-ID: <CAKwvOd=12eSPyc5ZRgm8NPMJYjj13QOxcnHtv_Y7Ws-zffyUrA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Perf tool LTO support
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

On Mon, Jul 24, 2023 at 1:12=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> Add a build flag, LTO=3D1, so that perf is built with the -flto
> flag. Address some build errors this configuration throws up.

Hi Ian,
Thanks for the performance numbers. Any sense of what the build time
numbers might look like for building perf with LTO?

Does `-flto=3Dthin` in clang's case make a meaningful difference of
`-flto`? I'd recommend that over "full LTO" `-flto` when the
performance difference of the result isn't too meaningful.  ThinLTO
should be faster to build, but I don't know that I've ever built perf,
so IDK what to expect.
--=20
Thanks,
~Nick Desaulniers
