Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4623019D9
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078718; cv=pass; b=QPsWv4Zq5R8d2aZfZ9BrPC8H1Ru/QR3IeflCyWmEDmtoQJnFkKjLZpwtMZydd5ELj/1ECGiK4DwtIS5w9aX625CogGoaeXj49wUHsdRJw5kP3NZSc2OajjdV/5DNzpz+aQOpEnI82E6tlBbQeKz7KVZ7TUT4OxTEQK8bLFxqfR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078718; c=relaxed/simple;
	bh=kkqzTEyvh/URTQ9I+cvN17shvFcTkWcWq4aF5dQy6Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCE1OaYFY6LJR/BtTFztgDbbfFHafCiepPshlhyVqPstjGet9XDXeUmQ/zaRvi0Q25eVStae5Ok07NalWr5dISs/AvbrDsqhRpLKPBTdwaDeb0pdJtHu2RCjpPNhNURfJpelNVcwKYhi/ZEWgXtH0MfWf1YO1U111bx+ugOccKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mlICOeXw; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mlICOeXw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae49120e97so15025ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078716; cv=none;
        d=google.com; s=arc-20240605;
        b=WWW9RB/xbhHyW+BxjY9Wh8PSwghCQHzJvndGymGmi5SYbVPkjPBHKY1Gnf7bRWxPYg
         VAH8yh8g5rUmzWRsbU0U1AdJlN1I9YsTsrOldRzCWm0gF6O8ZdYYpN9O5FEZ8q0PnQ3I
         TWP9KUfwhWkeB+FH0igZI5bnoSvz0JdHfZu/34II4swVs+abNc7bEYCSNdSPFl7bZvAo
         4NB7qXlEKfF1Ak+frBwPvoeQdBSEfU1TCWpXbKwNcy9rjTI3hBd2LtTsq3hLgwMWmsTy
         wm+iZdIIyMWoUhCsO0sVqhIQFkpipajaRfW0UjuXufHn3yGDCdNghh15Q2iKA6goELjp
         bK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        fh=sBpwqBoOJznDiNBbrh/eSTuaft92IiUOYRBOA1Hyf58=;
        b=QDPhbQF1+T9jXq9JEhgzk+FAvi7W+Tdwv07SeEX+uScq+yDH22SHKN2ROY1ZKj2Pce
         3l7XEvnb7aBq2aB1Tc27yGO83vgZ87Bn8So6vU4Rw4265n9r0oVPx5A2xssfQzdq5xV7
         ib5unBYx7Rwdxje2Mr+TYvQkWsjYdFypryMIC91CR1Kjs1KZNxtn1L9tvExOxEvRH55G
         Ls0UC4cK1tlrSWPVTOlNxLU3XOIcEawwnbFVdJJvYdgaypIIRdbXVpSBVMhBgF3i3c8A
         IsXE3QO9f/GSd4EF6X2Pxwig+RSxVvsTVQX07ihpKNLR6Gp0FmO+gms/X8onc0Rq+LQj
         IQtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078716; x=1773683516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        b=mlICOeXwiGqyzBR8f9eVkBJFwCyfPVNoOdkp54pl7di2bhqEc+1cPPZ5+de/2wwkrL
         mpG5tPEGKzBt2kUIo5tBZgQ8LU9Fmi4tDsLVCnEbGq6iz0wV35KaN9DyhsdvmrrMau1+
         hDvPLUPI9ljzUOq0rSQ5y5ZXXU0XnqCM752oilA7AMSwHQmlgHOHtvTzDMSW1cVHljb9
         IbdKOSybGTziMhG1XFaTXTVT90uLcswCDt99P0F8ktcJ2k2712rxNRQh1lfSbJKH1eYd
         ts0jR8NknxGbMPhB26TFA08+XD6POUkou2C+ibLCz92sglpfABtXXcwyrxE/mszt1ahP
         HuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078716; x=1773683516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        b=QzAYPvX8Jpn+BsSbEv8bAliuIR5MDB2Z5YxIzXNP6LM3LMq7peDSOj+yvw6ZL4Q4kR
         qyLw3jtC4XVh9N2cN6jZOAEFdhI0BqLCfpv0ssWGsDdbp2R9qyc+NjUTgxy3QuJGDAp9
         gF6BP8RcTLWH+2pgDlnhOXVPwTK8kYoItbefrGybJa0L96Z/iYvU6/qiP0W6F+62nUST
         vDUSAZ2mCTCS56n7psrjw4zsk+Ws5yLefo+A1h8zUR6CGc2npYTlbQFrFxLHbkkK3LVu
         DFgt047Rx8CSxe0pLXPy+1c+Xkwexe40ULdKLEv6f6kTjjk+4Jav/xCh3a9aC0usqjQz
         plug==
X-Forwarded-Encrypted: i=1; AJvYcCUvBlHCHh9fiayFddx3OTch5gXoEAc64/ZkhIBCq4ircG+iPrDbHdA3AjfQgr79Gicf3iwL@lists.linux.dev
X-Gm-Message-State: AOJu0YzA+LiPcEtyAHe16zeCZduMo1zTliW0AAXB8932+HkVXbPhKtNL
	bOsOoTyuIqM7VV8Dm/Qt/hoBDBIiIz1Gyye0CFOmSfnnk77hvcXLVJwnIZM6rpa1VZfMlUKGIZ2
	SByzG+c7V7hfIgwHyi4ja6aP/Fmuz+WR6lUsjeytV
X-Gm-Gg: ATEYQzz06t4H1I42XWSZgQ7XV0erZyorQcowSuq2zlr4+zx+foaUamk8aaT4qDE7w3W
	g47RfMt64jQzd8w9hwxRw0c3NTzWWbe5R+c6tlMiRBfMqSa4e0GR9gxT9Bic1ygoNun4zp70gDT
	sBNd9b0/pc53ZRAi9Ni2MQhlKHzHSojb3iC7YZvjx3irahbrMlNd9xYx9m3kGrRCP731w1JyiLl
	IGmqJMfZSw8Err40y8FY9sD+u/lyZ6QtR0Zk5Gyau12VjZ07ldwmjQZAnkgbAQ6gm74B4ROaq9g
	jzQlNznQX6xwf8TANYmw3OhswFq5bsuGAmw=
X-Received: by 2002:a17:902:da83:b0:2ae:6432:8f77 with SMTP id
 d9443c01a7336-2aea3292d58mr119575ad.17.1773078715506; Mon, 09 Mar 2026
 10:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-10-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-10-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:51:43 -0700
X-Gm-Features: AaiRm50nzx4ov1KA5iy_Znwdr5CiIhbGHwfapJ-T0G5dtQyH0BIhXI3ZAH4nLI8
Message-ID: <CAP-5=fW83wsZfWpa9777ze-RNSFhAB9PnBa3xkVMu0LN64CThg@mail.gmail.com>
Subject: Re: [PATCH v3 10/30] tools build: Append extra cflags for feature
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the feature build.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/build/feature/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 1fbcb3ce74d2173072748a417fc63bd9a5b13888..103d8b71e7a4e8d0979242cfc=
95c1c0b946222b5 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  include ../../scripts/Makefile.include
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
> +

Is this necessary? In Makefile.feature:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/build/Makefile.feature#n11
The build invocation does "CFLAGS=3D"$(EXTRA_CFLAGS)" and so the locally
set CFLAGS appear to be ignored.

Thanks,
Ian

>  FILES=3D                                          \
>           test-all.bin                           \
>           test-backtrace.bin                     \
>
> --
> 2.34.1
>
