Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3066365
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 00:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524525; cv=none; b=aEKCt/EBHJvDSsd9UbnNeWZeqT3zL870ttmWl5WpY8UcIhlhyPMrLdJhxFnSb9gS0FVHRKEhqQbV681lG3uvkKIOoBbHe7RDo1dBotictp3mwQVj2SyO2xzArOb7i7Hr142X2USmw0w4g6oOxQQ4p9IAcwawjxDbWERWSKpBm7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524525; c=relaxed/simple;
	bh=p4HJtbC7sr9+mRbDPyd1tVdbBoNEAVlwdpQ81uwZGkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZfRnmRn4GV4SZrNHxlBgIHbvFOuXGG2y1tnu+YwziQsMiPsVs39qtfZ4pdCF+HKc/lV6MzFKM3G1pa8Dkm/k7InhdbZv97dLh8BgS6Hj63ZV1dJemcZw2sHUzqlJ8S6DNGjZ/i6UA48D4dhz7YrbZz5L8aFDnfluk2YPOzyv6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1005194a12.2
        for <llvm@lists.linux.dev>; Fri, 09 Feb 2024 16:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707524523; x=1708129323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GER+N6at/M+itjVzqKdSOcZKhDVYgoDwe42TsTNQd0=;
        b=el5XtrP8ACYYT9GJAXp6nmE7Z0MXSEwuAThU3iQkOYLNojpO+4Ml34QvMC1eCtveaP
         KNHZK1YUSf0K6FyITsaXD+JaJDgiqVUsABzs94yCRJmEUigOpaIn77nLcOolkU9HZx7g
         5zZOmhykcg1Lkowq2O2hgceUMQ2SEtFia22BAEvA9qFtUpL4UUn4eGO7uE/AlFKtzuFu
         h8+IqZ7X1PqsDMSONjHc8DkjdEt5404y2H1QRCB1jsmTx2DZQl7gRhGb1nvsov3SvF4n
         bRjMVXuN/id6cXAOS/sldXeS95K3CC7qYv0+OEyp71qMfBeY3Cas5EzPyjYSM0v2uKvh
         oPww==
X-Forwarded-Encrypted: i=1; AJvYcCWk72VhtbIAwW/Fjx7AwE2l2bAVba3isDgh9Ki4zzX878GtzT655WqaFxs4qeBvj1IEWjqd0cw6HdHJoOvu4Qbnv4BveQ==
X-Gm-Message-State: AOJu0YzRn4KWa6IfkeCvSu1duB6htA8RWKVqb+C9uVkrgM4YLAoOsg55
	2Ep6mDUxU2CF4x4yMOOo/FRBqLPpGVNYY1G6Y9lCwrLJwNjvcgICx7r6kzIr30aCw0vOEWjCwON
	JdaBi46IUy1ZD6yCMjD1d4cFwT4I=
X-Google-Smtp-Source: AGHT+IEXD3A5dWjGC7KaVKM0HkmFVfazNpWmdE3zsdI9nfzsz03DrCJD6p6G6694QrXqD/84HA7fzF4QKRHzTQXHZbY=
X-Received: by 2002:a17:90b:380e:b0:296:43a:932e with SMTP id
 mq14-20020a17090b380e00b00296043a932emr712507pjb.7.1707524523094; Fri, 09 Feb
 2024 16:22:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com> <20240201001504.1348511-8-irogers@google.com>
In-Reply-To: <20240201001504.1348511-8-irogers@google.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Fri, 9 Feb 2024 16:21:51 -0800
Message-ID: <CAM9d7cih+JqmhVOSoYmRUK2+FRWnknQ6VucYpg5ZC01BYqdv=Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] perf srcline: Add missed addr2line closes
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 4:15=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> The child_process for addr2line sets in and out to -1 so that pipes
> get created. It is the caller's responsibility to close the pipes,
> finish_command doesn't do it. Add the missed closes.
>
> Fixes: b3801e791231 ("perf srcline: Simplify addr2line subprocess")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/srcline.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/util/srcline.c b/tools/perf/util/srcline.c
> index 034b496df297..7addc34afcf5 100644
> --- a/tools/perf/util/srcline.c
> +++ b/tools/perf/util/srcline.c
> @@ -399,6 +399,8 @@ static void addr2line_subprocess_cleanup(struct child=
_process *a2l)
>                 kill(a2l->pid, SIGKILL);
>                 finish_command(a2l); /* ignore result, we don't care */
>                 a2l->pid =3D -1;
> +               close(a2l->in);
> +               close(a2l->out);

I was about to ask the stderr, but addr2line_subprocess_init()
sets a2l->no_stderr already.

I wish it could be handled in finish_command() but it seems
the API allows setting external file descriptors (before calling
start_command).  Hmm..

Anyway it looks like an independent fix.

Thanks,
Namhyung


>         }
>
>         free(a2l);
> --
> 2.43.0.429.g432eaa2c6b-goog
>
