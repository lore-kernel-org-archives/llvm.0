Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7323A7F56
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 17:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078810; cv=pass; b=LGfZya1stIUHnZ9/d9mI2JywpJHXNw3m0tjsd94E0DMaIhXjWyVWeeiUayFuO+Toa8SsES5XVnlcfCvDhUkPKBOUornTISuVNHMfJXr1EH1od3Td23sws4k3uOGFuFYuyIYdVRfciAFmaosNgEAVauwRwnmN5jHEzSfKsywLAXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078810; c=relaxed/simple;
	bh=SeWt//XSlE7FH97wAOv/MRdhXb4yjQFM3ji/K8xaQqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGY9yc9nqD/gR8lNqoY+aZq5z8xxSydjR7m/qyBlZ7CND7MflVNrMemcD1ebO9v52T5+JTAIcGlrYIagWXPMqmSb35MI3tvanah31G0cLjvw89x+A1CiP19oe6CpQp2m6QgxFm50T2oNmTSWf89OzUMeEST+klT/TRfMtPPfosk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4G8DwLir; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4G8DwLir"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae49120e97so15695ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 10:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078805; cv=none;
        d=google.com; s=arc-20240605;
        b=ERhJK3enAdQfDy8LK49v4XMaReQWTNji2Aeqy4z9H/ilYZfeQgyl5gahuH2KeoYIAy
         xYMzIcaKYiugPwn6gG0r5JVzIiRsm6WrsN/7mc7Vo4VA87u0adzVsmEpcvdMky8yHccg
         tql5/rM4q0pkvzNsuWx7d+iqwKhqQiJBwD3AJs5Xvn59XTyIBd3f6sES6NuOn8ss6tdZ
         M/s8igSnG+Kc9PIkERYRhuzz6M4cuWgKrzHxL1UvwOIXQe9GlFmpVrPLMW4509lajBKg
         LlXV37rLeY9/OIS0AwafFECNcBBY7yGDqAN8uYGoy+7gUwQvKlqpCxo4S7dL1WNct9hk
         qzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        fh=KGpAu7v+uIWu2BnIe1Gwj4MPSNOQVxRi2s786L7j1Dk=;
        b=a+TKq+B7tg694ymrc6jc8Gz9av9ts0CSDgEE/Apopa+JL4/wP3aRmiKmhFR9bNUuM5
         SmB6pAJtlUXmeARaeGoa8Nsq8lLSWprW07E8oBjRiJnTyzi7JkdKlRi0vMkcuxJRw+NT
         2GyZ4lqgiqWC4qnR8xPkSRRYu0iRFx8SWtrh6hZmkZVYo43pxumHTh4fzhRBBNF1TK/n
         BYqgshgETcRPo8OZwj1He6DIO4dAF0AHCljLmMS2pZEP94f6Bmg+WnHxjSJ1n22+A2e2
         IGFgj0DgT8qY70fInOZ2xiW5RvEc79Y08GHt7WpP3DMwrFMcuyBvzgvFVIw5ZJPPvOIj
         t0YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078805; x=1773683605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        b=4G8DwLir6kkJw8vJvJ2StraGnN//9QRQ8dHJILhsH0BULN2yoFNQ+4xL6CpsQcWX7X
         lgrqgPxAKZDUC7Pnlilf1fnnHhFFuN+PNFUmveqfA5xkC6w/ffsQf+JKL+5nZn/1/Gqj
         hJkxnFkO+uGLvBrTxVDqesd4sJGJXaEE5Cuk4tRExxF1AytD0EzN8ojdjGa7Gtw4dzi1
         +ygc5BeSZg6eNxSHWWxJEXMvkNC9Anx0n+sAUGB5NWnwOGtMpLSWbGUoC1NXyTZ4KB0j
         IJ3fXDaHS/gXqEZAVg2s0Vn+eEkAqmomdLqMtiBrQPXQiU8ttyFkT9dm7t6RKxw7oKAf
         URUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078805; x=1773683605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        b=k1eEyHBm8mcv3fTzXCFGH1yhm4VhsKdX5g3hSsq3No3oKUqCvVsDejlzL2B5F39eL9
         28G9AJEADEd7PyGsrHgok2FljWBb7cwExCs9FiGakw3/n0c61RFSyu2g4Ns6GNsgq93+
         JyY1D3ZbkLi7JYeaE9D+9dpqQw20neNbF7xKNSYNiiRBPSbbYJeP5t0eMQqFKDgQOD5e
         yGN47u2nBe1mZkWi2tcqT18prLSqseM/fBOvhqLMtp1RCiZybFD52rUXwFJqvZmlF1W8
         Nqpz9+KVPEC/iuuKn7JfMwTP8yjjtLdurEcGM0qbWfdRihPTJ9hz6yxIEMbnqX7nZjT5
         v/5A==
X-Forwarded-Encrypted: i=1; AJvYcCWwXmJ8ztg7V0+uTZytQPV5ZlwZV4E9vpDn9N5k1SnNUnytJUPh9aYX1f6dfwswkZW0ycSR@lists.linux.dev
X-Gm-Message-State: AOJu0Yybp3nGuL5wpxKRE22EdU1zsx+g9YiKuxLi+mWWQVFsW7noOjH1
	wayImY+q5gi56+byWQOSVxO+lF5Eapbm0FgEPqxoFV/BBr2z1k1G6lP6EHZ9zrtgl2+TyrVak7b
	tH0NTVpSC+VsfrXf16qHLkHLWYmhLfhGu92UkAI4D
X-Gm-Gg: ATEYQzx58066lUiXDFSx5S3uwHSn9+fuQ+aQ5ZQWfNqVVrmNnIunMrZaTuOHBmQa4nZ
	hINOZYzHriFEsvFBKPKhDfxahIjPLpvIfMvNIQbW5iIPmnK1GjkiL1qdoiCybzP/VXHuo4gz1Tz
	D/uow6XqmBA+WsXmRFxibbN+v4BLlj7NWgntQpsS0xcYpIDirEgYixAsqxSTxfg/a4fADmNTKjt
	gudYFFN6EvCQ+gpAn1h3yeHMsDiRSUT++Npoz9GjhaR57bE7HFRhILXFkQIsDjPhl+oxTQ0tPF1
	OoKgXqhy5NVjaqzY3JmEAm6qUEl0z1wDqS8=
X-Received: by 2002:a17:903:37cc:b0:2ae:46c6:e4e1 with SMTP id
 d9443c01a7336-2aea30cfc85mr220315ad.18.1773078804518; Mon, 09 Mar 2026
 10:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:53:12 -0700
X-Gm-Features: AaiRm51jJv0K2rf94QzPgrcYebl4loRMt-0YaQXZssGW2-L2HjxaFLVTS-jTCdg
Message-ID: <CAP-5=fWHe0JaJ0FPm7jKfL4YMb8y+o0YcnOfSs=DCgHyNsyYyw@mail.gmail.com>
Subject: Re: [PATCH v3 11/30] tools: bootconfig: Append extra cflags
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

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bootconfig/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index 90eb47c9d8de67b0ccc74a8de0af3a7e0b97feeb..6bbf4dfdb5b56fcb2a43ccda1=
8b59a270778267b 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -10,6 +10,7 @@ srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  endif
>
>  LIBSRC =3D $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconf=
ig.h
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -Wall -g -I$(CURDIR)/include

Should the EXTRA_CFLAGS be appended last so that the user can override
the default CFLAGS (e.g. switching off warnings) ?

Thanks,
Ian

>  ALL_TARGETS :=3D bootconfig
>
> --
> 2.34.1
>
