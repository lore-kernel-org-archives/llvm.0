Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F262848B6
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755730454; cv=none; b=aW1fNwV1TKyCMBXR3wFHHoim5LKlrTtIup0t93BhLmDO8jHVFr6RESMXUsT8ZE6oiy1drv59pWPeJm5AqXgA+FBcLPm8QAppekSYMwTqISt8/YAfGgB/gBAtL4rpwz+WKErWRc1P0iJtyjhVNCb4+uZQF+u+EBwpLbL17p7PpNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755730454; c=relaxed/simple;
	bh=nxwUi+vma0gxF8jaxzpDP96ejlHXfqlhgoCKUq98E+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cefHX90kP48RIkfLOofVXu8f3C9yWI37PLNwEmkbXTeoxTMc0/tAoWb5ks8qRAifLIQQAA1vA5cCbDpjzCkOch+BYIDrNVHYnBC1w7FTOwjHFkVHnTw5tXaGVHp8PBPKVSMJVgmgXSEcIiygUwFvi1qBb63pLDdR9ZUAIJ6Nb7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8JZE0gi; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8JZE0gi"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b471737b347so221566a12.1
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 15:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755730452; x=1756335252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v+ZtPegRwXYIddqayc8WLX+z8QS5ISVjLMRUJjSTvY=;
        b=O8JZE0gicnEBmFUQo22p+GJAc/VHsfAgyl7n1zsQ7cwPNcaYD9AcXm2HMbQkJqnG2B
         yCAZHLGyNSg0fHBiUcoB9ZrUyAsHvfzW76wB8oh8aGxCcXI2en4rVmQWaTd2vEyeTQcp
         x7pCwmvmOZ8tZVkRs2nN29LexG8q16cZHK/PytGccEOZ8CqrkbDIiw8pvH8617FqJEbI
         m4EdD1QBia+tQAXAY0ISO4i+lMad2llNNdPPuw+I9fYhoxMjttoK0Tk67dzS3vdQcVhz
         ml8l7CwigpqKBfK4BD8jBE/QDs3a6fP5Uc5+gWavD9PkIqn5VdSUbzcpVpQCdowuAcAJ
         3ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755730452; x=1756335252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+v+ZtPegRwXYIddqayc8WLX+z8QS5ISVjLMRUJjSTvY=;
        b=jy2W1UJc/IFAS8NRI1zJ3L0t2GuvSekFng+CQX+mmgICWzwRf7sFVKsE9UmJ5mt9Q1
         6idtWRudgZEvhE5s7dI69JhIv+WlGAK91LIsHxIpl8ClhnKHdTyBStkwrLxUrXipqv8I
         jnMQpO0/9PC9gwe5+tSfLUCbArKVAyS0EspsZ9UdxCK56n4SxUtlneGgWqt1VnqoG2dg
         xzSD51nBJsOeRpOjEQDaSFDm8XR3AMu9bRKy7E714QQW/OlLyvRzI52UgC4KCElie9Nf
         Wa/E2n/vW/DK2NeWq+ZNU98hXwrEvUflN/Rlos/6CcMfbTIuBL+ufaUMBj0ANrtIMuV3
         Ii5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaveJCaLklyzd9tGsrJnZG9jVoPJ9nlhp7+A2eZ2B8PteFzvlzjp46mvEozsngjxpGvJZC@lists.linux.dev
X-Gm-Message-State: AOJu0YwLOl2xkfwjqyYr0LW7ilyLdXg8pnHQQZRzhcPMPbHxk4lFrOYW
	GvCUrv8bYyy0woMdqJjwN62jsjJ6lvwVfO0Ss6UFQJVHKZH3Db6sGY1m0yKpD1QuC2E7cEq4r0t
	COe2fuX4a6duQZr+g/AcreuJMHzStQWo+YA==
X-Gm-Gg: ASbGncsbZm2PqHKTPoBtEZzIOathnGhcEVdpg01tPLdsy9ZfgK6bNm3Y13Q+1n87fC9
	cIW01379eFmDHCC82i5yJpT8O7uiY1Zt1f561t/uZWnom7bxRsm4179QJfqTvnjXVtfTGYanJNU
	lKa1zq6vqNJzq2EScGHYv/z9zVJv5A2jiAgl5TPYVbi+5zG//5EnqVZXPu2tu+vnV5JgnBgKDzD
	Zo0YlmWM9mN366Wxe9AypUb3nQjxIj2U+b9uB9sGmiJ
X-Google-Smtp-Source: AGHT+IHsYq1/G3bkWo2LTB+Wjq6BjQc3MS0ahLPsXURmjYsCiKDmAvwNrGYkktwC5RFWrRVV25fqel2mh6B7rbrx6mk=
X-Received: by 2002:a17:902:f68b:b0:240:2145:e51f with SMTP id
 d9443c01a7336-245febe11dcmr6286575ad.3.1755730452431; Wed, 20 Aug 2025
 15:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819033956.59164-1-dongml2@chinatelecom.cn> <20250819033956.59164-4-dongml2@chinatelecom.cn>
In-Reply-To: <20250819033956.59164-4-dongml2@chinatelecom.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 20 Aug 2025 15:53:56 -0700
X-Gm-Features: Ac12FXx-fO5PKvBgzD_sLr5b2q6BW5ewlWVsvn9PgVglGjlHt1qy_PlT4iHOnWc
Message-ID: <CAEf4BzZOC6Zyo9sikPJH+0Xz=aCbx=dBM_RksYZMaZM4ndR+OA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: add benchmark testing for kprobe-multi-all
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, mykolal@fb.com, 
	shuah@kernel.org, davem@davemloft.net, kuba@kernel.org, hawk@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 8:40=E2=80=AFPM Menglong Dong <menglong8.dong@gmail=
.com> wrote:
>
> For now, the benchmark for kprobe-multi is single, which means there is
> only 1 function is hooked during testing. Add the testing
> "kprobe-multi-all", which will hook all the kernel functions during
> the benchmark. And the "kretprobe-multi-all" is added too.
>
> Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> ---
>  tools/testing/selftests/bpf/bench.c           |  4 ++
>  .../selftests/bpf/benchs/bench_trigger.c      | 54 +++++++++++++++++++
>  .../selftests/bpf/benchs/run_bench_trigger.sh |  4 +-
>  .../selftests/bpf/progs/trigger_bench.c       | 12 +++++
>  tools/testing/selftests/bpf/trace_helpers.c   |  3 ++
>  5 files changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/bench.c b/tools/testing/selftest=
s/bpf/bench.c
> index ddd73d06a1eb..29dbf937818a 100644
> --- a/tools/testing/selftests/bpf/bench.c
> +++ b/tools/testing/selftests/bpf/bench.c
> @@ -510,6 +510,8 @@ extern const struct bench bench_trig_kretprobe;
>  extern const struct bench bench_trig_kprobe_multi;
>  extern const struct bench bench_trig_kretprobe_multi;
>  extern const struct bench bench_trig_fentry;
> +extern const struct bench bench_trig_kprobe_multi_all;
> +extern const struct bench bench_trig_kretprobe_multi_all;
>  extern const struct bench bench_trig_fexit;
>  extern const struct bench bench_trig_fmodret;
>  extern const struct bench bench_trig_tp;
> @@ -578,6 +580,8 @@ static const struct bench *benchs[] =3D {
>         &bench_trig_kprobe_multi,
>         &bench_trig_kretprobe_multi,
>         &bench_trig_fentry,
> +       &bench_trig_kprobe_multi_all,
> +       &bench_trig_kretprobe_multi_all,
>         &bench_trig_fexit,
>         &bench_trig_fmodret,
>         &bench_trig_tp,
> diff --git a/tools/testing/selftests/bpf/benchs/bench_trigger.c b/tools/t=
esting/selftests/bpf/benchs/bench_trigger.c
> index 82327657846e..c6634a64a7c0 100644
> --- a/tools/testing/selftests/bpf/benchs/bench_trigger.c
> +++ b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> @@ -226,6 +226,58 @@ static void trigger_fentry_setup(void)
>         attach_bpf(ctx.skel->progs.bench_trigger_fentry);
>  }
>
> +static void attach_ksyms_all(struct bpf_program *empty, bool kretprobe)
> +{
> +       LIBBPF_OPTS(bpf_kprobe_multi_opts, opts);
> +       char **syms =3D NULL;
> +       size_t cnt =3D 0;
> +
> +       if (bpf_get_ksyms(&syms, &cnt, true)) {
> +               printf("failed to get ksyms\n");

we seem to be using fprintf(stderr, "...") for emitting errors like
this (at least in some benchmarks, and it makes sense to me). Do the
same?

> +               exit(1);
> +       }
> +
> +       printf("found %zu ksyms\n", cnt);

stray debug output?

> +       opts.syms =3D (const char **) syms;
> +       opts.cnt =3D cnt;
> +       opts.retprobe =3D kretprobe;
> +       /* attach empty to all the kernel functions except bpf_get_numa_n=
ode_id. */
> +       if (!bpf_program__attach_kprobe_multi_opts(empty, NULL, &opts)) {
> +               printf("failed to attach bpf_program__attach_kprobe_multi=
_opts to all\n");
> +               exit(1);
> +       }
> +}
> +

[...]
