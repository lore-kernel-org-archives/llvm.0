Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7B18E17
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 15:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EL2cUXF1"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507c9305727so3576e87.1
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 08:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699026084; x=1699630884; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRaJx5yqDoLyT5Xi3DrUXbLg8Rya2MY4ntt0ooWt/pY=;
        b=EL2cUXF1g4LkmEL3Ca9CTnLxTBiOK5DgBMJST0/WyYy9IUxr9M6e7KG2K5L/FogaN2
         9qRrOlLum2tGJ47j4F0/o5kmmOnfpczwxEzFKjZKW+5oA5MQcgpuoOgYC5GZ9W1bgWtj
         f2sXkXMDwNzxgAXbs2+tQy0iu2+4C1Gi2jlaAIQYUxfNxGm45s5INn5CO9qGaXItfCop
         r0VZzwnLs4PAHv1HHYd1eIKcvsHjbhZU+dc5h9C+WvE9HeyLqXwM7eOYTKf4ddqcPhfB
         wUQJUgZazsAHKqM03lSwTBBDDH2zskHyPCWWlYdPMQ03GZo3e/P97+KSWCU/w+1e8au2
         zrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699026084; x=1699630884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRaJx5yqDoLyT5Xi3DrUXbLg8Rya2MY4ntt0ooWt/pY=;
        b=bk/Tz52GYHMyJlDVP3ooETDX/RTzg6DQ5WqAuTMTqCD26HVWMZ3heIVsAPhtQtLxg7
         oUKdmeqhUai95lp4f2gkDKgEd95pOWvk3g48g0WVvFGuxnfZHwf0W26oLQqP4hUCi2F1
         P+2kB9z79QpFdFutjOdW/RDPw4/GKCKG9WNg1eAhHoB2qNPl31daFmIWi0ut9FhewG/E
         6lplLPJSBui0YxWS8g4FjhcVLsQ2QBchHeZi22ZfvAObUu2WyIKQVSlPXmoX93lu1x64
         CjKQjtgOHzIZ/XLklhEKw7J0OZgyQs9bp9+eNsxKuvrvkwWE0kkolDzjkwF31Wo/NbFa
         qVSQ==
X-Gm-Message-State: AOJu0YzGdaGM6lZDV2Lg88vQNCPyy/BuWREMtEfxAYfbcjdAPvOYadjq
	XRJ5v+bX063SsLBSRYHe+X9PhG77y1uZO6vWuvqyTg==
X-Google-Smtp-Source: AGHT+IH310mUKc8QXz+cZoC/fxdXqHImALuyVrBOwQDL0RiBksQVuXw44g9e6DniBg/n5jlSutqpX8jNZa0LiEdDLEg=
X-Received: by 2002:a05:6512:358c:b0:509:4535:b272 with SMTP id
 m12-20020a056512358c00b005094535b272mr143154lfr.3.1699026083710; Fri, 03 Nov
 2023 08:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231103113501.490012-1-james.clark@arm.com>
In-Reply-To: <20231103113501.490012-1-james.clark@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 3 Nov 2023 08:41:12 -0700
Message-ID: <CAP-5=fWazX_q1W8HN7ErrRMB2bx5sz3x1V=+XqY7Hxx0jR0p9w@mail.gmail.com>
Subject: Re: [PATCH] perf test: Add option to change objdump binary
To: James Clark <james.clark@arm.com>
Cc: linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 4:35=E2=80=AFAM James Clark <james.clark@arm.com> wr=
ote:
>
> All of the other Perf subcommands that use objdump have an option to
> specify the binary, so add the same option to perf test.
>
> This is useful if you have built the kernel with a different toolchain
> to the system one, where the system objdump may fail to disassemble
> vmlinux.
>
> Now this can be fixed with something like this:
>
>   $ perf test --objdump llvm-objdump "object code reading"
>
> Signed-off-by: James Clark <james.clark@arm.com>

There is also "perf config" for things like this.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian
