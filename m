Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BFD2F6184
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079602; cv=pass; b=e9FE1JDchaRnmELb5+C+M42RRdAgaPeGOqsjnHYikd4MsipnlyHDUqPVLs+oZRoXZ1ZLOi6t8LySQ0zCLtdJTR7luw9MERMuzDWIcnGUvAyDm4hE5whyCcflgKdSki4lIf6CEaSQOfn6MkLxulXRbzAmh2FRGXyOclyZ4QFUqDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079602; c=relaxed/simple;
	bh=5BCddBznHBMpCnfR4x7BgUbDIxp1InoJ/1cNZt92Udo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOVz5VNljQOag44dHH6lF+UYMux+mV3GQ1r1PUrZDXL8XGHO6S03ID2zhld1aPcrGR+Hg9dlXnxiR1ro3bJUraOXJ1oqATL8ipKO/lSfIh9Vxg39t0Vel0+Kwg53U8/Yx29zjO5HRRYRWuMlMi4pEgibv/zDpP2SXQTHKPJLw7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wHMbhvoK; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wHMbhvoK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae4b40999bso17925ad.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 11:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079600; cv=none;
        d=google.com; s=arc-20240605;
        b=YTY/fWzt2rjI4grkhQlPZWv8Xkehi2qkVq69YD+vF9F4H1urwE/2yWh2D3lan+pOef
         j2iqxkbQZSeDvbggZJrSgtd+slezZz8gHnJBs6g9DsVwFyzdX63gNHu0erLU8mZZJaAc
         LM3iwSA/bem8Cc4vMDQAS8zGod9hm01lrVxf9ppf7t0elcciFI9foSwK0gT1JKkaM0ZL
         QhR+TqsL+P/EPVUdq/u55swm9eBAWdAC9of71G/fjPxae49mEiCjsufInQ02jRg+afpI
         ng+aACwwsLPGo+QDf4fJ4Xam/o8UYxyPgqoLjioNVo+CvphC+RMksSv10yMYqaAzopvx
         Ufow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        fh=kqyS2QtQPjXG/CZRYfIRjqEfwtafQD8mji/tZO8+GiY=;
        b=kd+dxbCFB/AgLz9vXVJZcfHEjTZDfXFjH5nRx2oApqyl3hA52T/U7Npr6t5jIMiwUu
         g3v1ucLOhDUiWuLqpsWdrg5so9UDkvuJqMfhUq4+ec1dBN8EMtie8vUunak67ELQV8D8
         zvGf864VUMN8kEdxroiQOcFp/UOzcYZEaOWam4t8UANkd70FvZSc3goXnq++4I6mxors
         +G6G7TCAg9RCp6zM1lf4GUXUj5VGjOMwqb5l1fUBiVobxYvJs0GzJqSfvALrSR8GuCor
         uNN8MCCiyFSN0YiYhg8psRh6SblwdNerNHdzArdvw/b4H+60bZ72cteLGC42c/26bn8f
         7QVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079600; x=1773684400; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        b=wHMbhvoKpCALqSiyzSKppxVjU1G3hroGPPMIEQiHmVDS2BZr+Fxa2qFLMVDi/CYya4
         7KeVCFK95C2fXWGlXqFsixI5+ZK/tFyUAXj3lcbfHki/Vl5ZMPWJWm2b22M05cT9ZhX3
         W5ofHSgRCKl3pJdw6eesJwcx9lhIU3T7ycfXyE2vphTozvYscQEE/CntKBwMarhq7MGC
         JUyLIRFWmJeyuzkipXiN3K6YQzttn8T/H+jrBwsauXYdDPl6OZBJRUcL+GZLE3tVSQLt
         tCM1WpJCbnYVWD8/hSCdVSmCwl7X2YufHgAMk7BJiuABU8YBLARr64FNmGlH3nHztfg4
         qs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079600; x=1773684400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        b=xSblcTd6VfqVEHZHGqVg8nwY12sAqE1AL7TzCWOzx3IgNyDlFtO4QF8WbJeCL/9LpG
         8weQWeyGUx1eBJvl4IxX2hSZnfGTrShDCuSkqxd7kWJ3tumUM6Qd0LdpH2HQ3VgwgYvY
         /NySfevJjB+4W9rFAWP6NYF0dd2R6XQWq0R9uQrWXsV2hBjvLS48snBmWLRlPteS0JAL
         wFHnRByEvWXVCerGYAZQF41IHmFei3ztrpaXqp28GSrzHvHDinUfcvF81F+ZYhGPzn8H
         IoKGPxpZxJ0sZC+JdZjT2WBHbIWU5kjc0DW/bfincGrJ7rHm1+M43ImFjGKsYloUoH1K
         cTlA==
X-Forwarded-Encrypted: i=1; AJvYcCXP5D+gT7zCZAgVElsZYAy6Mqb+/FkKsPAzhCGFrgCNfAFrWzQCY2jaUywe63Smw00Et+kz@lists.linux.dev
X-Gm-Message-State: AOJu0YxZUV5HEwMJmb3jyMgDa5oPsMoJGmI7+U5Qa9/CorAUpCODebuD
	1E1+9tQIRjxt1WePhYPZ6FkrlkZfCnXLO7GATHycX0faGi9dm8lrhpcQdQP2FjW/nfmb2oxqCED
	FSa1+uF/XbOidaLpvpyDXSq5c3xUu+brIvV1JWXjI
X-Gm-Gg: ATEYQzwOlOMARrI1R4PIUefB6schpWbyIUQ9pbWPrf+P/UR4tvTDdjd2sP5lDcsgESl
	WQ/IEYvW2sB7/FseYgaFlg3Ub1LgcWtfQmx2YS8IGmiEJ9ff7L7ZT2KHuG8gSRu6rAYaJIZ19zq
	tannri4KpSPVkKxIuUkrMi2lwYDDTtSzMLEL6gL74OT6x01t8pUSBkmRhOqcYUjLYSu8pi9MeaF
	W26OTHvOmkUBBePWQf6o/cmfaFF16rKvkBAtFwfq+0AojVjN70cgHeLqDT1uOEHhHKGBhAa61qr
	yxzjrkhKkz2f1N1DwF/rfevrwmcnhltnl5ThZDbPFLFdPw==
X-Received: by 2002:a17:902:d508:b0:2ae:4453:3674 with SMTP id
 d9443c01a7336-2aea301e6d4mr356985ad.4.1773079599358; Mon, 09 Mar 2026
 11:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-28-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-28-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:06:28 -0700
X-Gm-Features: AaiRm50VcNaU0-sQ6heYDrcoPU8N1ix0gE-QK1YHwS_OqKqojBYetu5zksjNqTE
Message-ID: <CAP-5=fWqju3_+d=w73DkvdS4cnrfhnd48H2ZLqsSRkKxjh=dRA@mail.gmail.com>
Subject: Re: [PATCH v3 28/30] selftests/hid: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/hid/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftes=
ts/hid/Makefile
> index 50ec9e0406abaf316fba232c5da1967e27d0fa9b..d0dfa411af9b56ea3458184b8=
a81ef61bd44b1fe 100644
> --- a/tools/testing/selftests/hid/Makefile
> +++ b/tools/testing/selftests/hid/Makefile
> @@ -24,6 +24,7 @@ CXX ?=3D $(CROSS_COMPILE)g++
>
>  HOSTPKG_CONFIG :=3D pkg-config
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
>  CFLAGS +=3D -I$(OUTPUT)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>
