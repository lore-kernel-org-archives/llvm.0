Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE32C21F8
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335954; cv=pass; b=YSFHDYdGj7LBI/g1E+wdwE9EDQuiLFeWDyVTwtht/ksZ0NwAB3Yc16gqtAK9QLWVtFOmCXO1hKNzikX1COy7Qk9/k7TnZx2oOM/TmisvK2mh7Nz6zHo+o96fu+pKtcYMa3vMNcJQl4ylYtdb3c58wWaE2Fi1gSeKi8FRtvu7l3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335954; c=relaxed/simple;
	bh=FcuzOrt8CzOV4rxc+ZCEf+asw9BvAvJuhmnBpc7COdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKuuwyQLzYBGbn5qft9Ox9aZGEoWpCzEkiKABcb7KjO/Lc9oBv1QkkXHS54GeZA+zmrPCmiZu/ukGLcHqNv5HM68thQl3ojF/trf/UV9QwzMOnQEn8uS/2vBhJcyzrZt2Yn97On60wPwtgVH4XW+PAnYHE46nW/ElZxOBuYOrRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAZzD6xT; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAZzD6xT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aea4ebb048so5545ad.1
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 10:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773335953; cv=none;
        d=google.com; s=arc-20240605;
        b=ja2ajRPBalWUc117qcsvZYhD3oJssfWVaH5OSa6WCmrkc1Tc4tDNIABcPMdDaBLp1w
         D+9QUssUVx1tVSu9YqXejJs1gnRs4lPO+EH6O1cNw3LZJsVPt44h1y9ewCVMh78fZpOp
         74GZB3yK3MC45dcdVpMam+jUfjoUKnSOCEvaymoV2zjd+NJ+KygqMZM3ypruGxnPOczQ
         LetSUq8D6EyT7NbHy+FyMufTFg/sjKV+FKHavQ/rdF3XqnW+Yxql7fYRk/t2DglttmPb
         o4TI4XwJc+btg/5Tsyq6EnXTaJyrYzqz9ulO5Pi9vJpv0uwvohBFzTQTAEI+gg3WV2y1
         nT3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        fh=79zmK7NlWHulGGld1DTz8RQCtHGOc7x1LHuOndbBKEI=;
        b=C0GeYHVclpSb+OtH9/ZkQBzFsIAH3MLUF+4t2lIGtjdnncx7fRodmJ/pNOkgWBk9Im
         YEOHBLhs3SuABYZKWLQ3GNeXnTtP5AOOYIbBstwt/z8+YhsQ7+xspU+y1rgOmA+EXTuN
         PXBgogIbaDgnZnwx18tGBIr/kSAFngR6xWIGDgdnR6gsYMgCwv5FG6gSN3uUhUzx+OKE
         xLKp07kI3KmymbIM54+yHiNV+FO/vMxArANM/wQluq/Pg54mKcBc/nl0yaGdhgG2LYP5
         bZuHqVxRW4XN0EeoaQ9Svc6tFHTur+BdBH4w8YmSHInbyhOzYWzJ3KPoXJJNniuI9HGO
         S/hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773335953; x=1773940753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        b=wAZzD6xTTuaZjtXO2epQy9cOP48mlTVlthxy0IAfH3S3hUJU/SKsDx7+oPL9qbgiu/
         Yu+UpjK7Ajar7V5KQ5NMX3NQKMwM5G2A8kG47jk82y4S3cAbslZ86JinmPIy4AGPXoGK
         mYS8L5XwO2LQZnjQwmiJLQkmiz8tqOwAyod6o5byItgTXfZFHPvFQiMUtjxg64bQ10oe
         uEtfbucU8qaFUlYGTnIWzxczwWQNt+WkxI0LIjMWOYd7UjJ2dlzJTpfAhaFzqgTFF91b
         JYwMn2KQrVhYnbyGzI9jhQKqS70kp5tvcPYsz6QyW3At+Hq+eQUmtC3/9KDcUvQIQmMO
         Lsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335953; x=1773940753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        b=gSPDhBfOl3me7aZL5nF/h+hpSee6/hFa4QJZm19nRiOXeh6rUAZSUIz5supXcVVjcx
         uKW1UGNx+y6CtJl38V0pXEJga4KKmJoaqa9cxGmy8js0UlbS68pNtANgWgUFZzP7MlL5
         t5jXNjkg3rf+Pwh3BY6oy4Mo9U/qnhrqitI1OUeJMwhT/Wcyl4cfA1lqO6IB3R70U14W
         xpTk0uQSM8qDohJ8JmLZZjYi9PcWy3Rb7ls9jQrYXC+pTfUY6r31ogi7WM3gTIw7WhPF
         jiLcK8qPJYnHFBRIoDHNBQiAlbCHDc56kOZJlmbTigoV2NV5V81dGTnK/EkOBI7fA5w3
         yC6g==
X-Forwarded-Encrypted: i=1; AJvYcCU3KjINi8520QnXgKNuCJzBxE9ll8MksDlTJt7LV/nP+HPk7iuFz+HYqPxDNPd6RSKeeX/W@lists.linux.dev
X-Gm-Message-State: AOJu0YzNIhlt/bIQaMKSkey4tR+8tWP3z5BhC+E8CCx0NSCkZH9/WTSr
	JfU95Uk+Vnv8CwW/fVKNYimRVZ6r8vA47C3eTj03ciZ2+1arq/2R84HVUcgufKDIzOZ2mDPu4e9
	2ixxuj4voej2KDsalUy5/I2r8J/5fgvLXWaHPyBmW
X-Gm-Gg: ATEYQzwzD/ofo3AHMXFXSe0zra+ghu4eeHG/3gQkE+/A69xO9fshmKUdnL/2oP7jkZo
	zR6fjzATUeQ1fq7d+etzA3cHHmlciG+1OzglFy7iHJ9RtNnSmO5wIcYx/Plby/dn1yZJ0Vh+kLw
	AZJCVbUnj2Q8TKQVbrqGLuDPfklCqbDVcOe/slCkqg1T3KNSqKNCZIpJsygvkqF4EIRxIjLKQzC
	XGhBYgtcBNvvK0Np+HP6Ch16UGzRLu49X5tvD99N+rXjZVCWchJHTP7QlUHYlWRltGfNZbDrgxE
	Cf8ogVqcG41sl8rgAdJo0U+3C0qQkOL1BwTX
X-Received: by 2002:a17:903:124e:b0:2ae:6432:8f77 with SMTP id
 d9443c01a7336-2aecb880cc3mr9165ad.17.1773335952229; Thu, 12 Mar 2026 10:19:12
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-5-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-5-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Mar 2026 10:19:01 -0700
X-Gm-Features: AaiRm50U3ZuNTb9znfrdFL1Z7R9QSzl9qCksbNeUFXxnNuOwB-32dLFYQSGvW9M
Message-ID: <CAP-5=fUOYsnbB4B0khUetRWOFMtHuO6_ESG30b1ZW01n_-gt6g@mail.gmail.com>
Subject: Re: [PATCH v4 05/30] bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
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

On Wed, Mar 11, 2026 at 1:30=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Prepare for future changes where EXTRA_CFLAGS may include flags not
> applicable to the host compiler.
>
> Move the HOST_CFLAGS assignment before appending EXTRA_CFLAGS to
> CFLAGS so that HOST_CFLAGS does not inherit flags from EXTRA_CFLAGS.
>
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/bpftool/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 519ea5cb8ab1c0ee31acc67fc5f96b40e21005c2..3e7d8359e1b2a81a29a47544b=
e8539e3b191a0e8 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -81,6 +81,12 @@ CFLAGS +=3D -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADE=
RS__ \
>  ifneq ($(BPFTOOL_VERSION),)
>  CFLAGS +=3D -DBPFTOOL_VERSION=3D'"$(BPFTOOL_VERSION)"'
>  endif
> +
> +# This must be done before appending EXTRA_CFLAGS to CFLAGS to avoid
> +# including flags that are not applicable to the host compiler.
> +HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> +               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
> +
>  ifneq ($(EXTRA_CFLAGS),)
>  CFLAGS +=3D $(EXTRA_CFLAGS)
>  endif
> @@ -88,8 +94,6 @@ ifneq ($(EXTRA_LDFLAGS),)
>  LDFLAGS +=3D $(EXTRA_LDFLAGS)
>  endif
>
> -HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> -               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>  HOST_LDFLAGS :=3D $(LDFLAGS)

Should HOST_LDFLAGS be similarly moved? Otherwise, it seems target
flags in EXTRA_LDFLAGS will be added for the host.

Thanks,
Ian

>  INSTALL ?=3D install
>
> --
> 2.34.1
>
