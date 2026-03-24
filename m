Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B0B37A48B
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367737; cv=pass; b=hQL823Ao8Q6uG4neKHH4gn5fkIsSuOla/ACkGqCuZQ0DJ48GaxtOBVXlx3A9fhtK5kyZLQa9WgRA2qESjGXFbO7hhRyptUlA0kdN3lH80DdWhCCdT9fSlQtSxBZZL6Xqbh0NvCUbl528BB341zlLxRJR910Nu/V2EBSKyTeIyyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367737; c=relaxed/simple;
	bh=agkUattKYKS6hTX3T/qy79TAvmS3mkdNShYWcGbK5XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=As5TKoT3EiPGrhhEYNSGUt0xXVe4Jyz3Cm6s2uBavkqB+kWkWGi269WHIu3iZBofyfNKJn8A59jSvooorKexfbDQ0eeMrLEp5ab1Pg7HE4cBvVsniGejAaQOYXuV6Yn+1q5QFGO01cobRgHiSt6uCAujacUow7mXkAtBT7GOxnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o52tYuPO; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o52tYuPO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b94a19fdso3853305f8f.0
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 08:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367735; cv=none;
        d=google.com; s=arc-20240605;
        b=VsejhT/rbf13wE6cyqXi4oopIwXuxe9JK80rlPfYYOljKYiL4c+Qce+xuAQRd4uyUR
         vg+511L/6A8gFC9kmIjK0jSgcb1OXTQuWyW9dpw69OaeiWpv3MLM3aQSQS10jpXfvpxq
         SDqDT6zyE0BDlX4xJgb8Iw8SE/HtqzBjosaAx8VqeW3VXnXj/TKG8bjbh0Q3T46OfNJO
         T3idG3fCoETOPRvnZalrL3YSf9VcQuxM5M+OpS6zYQjZdvONlC3nI1EUnd0uXNu1KiGL
         eCYDu+PqQ7j1nNYk3KKh2ZNrUhe4SqzFaZ2+d+7jkhMYr7Gj2B9suArht9xYQ80+f28I
         SOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        fh=RHjoxb5NUn18WrLa8x2oxZ0pbqyhwDDHWhIQtmMus28=;
        b=X8MPgdRdWGKN4PQNcD3wzT01o13XeItoMz+tJDLTuYGGyirDHlBV9AllKzSWNMBZwA
         /sOrU1ajEUTe/7jMSfDPYdwCRfIn3adTCZMiqyaoJ2vUAHaRllfv4LK7reiJWD6ZzPQJ
         dF0uVkYRCvHDPCLRAZHYysrSEAT7mR4EHGiMhlAZO5cLSaWR2GXALnZkLUXaqWSZG0V7
         xEOklA8Xllboe0KHbb//J9/DyOg5vBKqZrtRI6SpApHwxaCs6GywVfu0pLbJM45KLwIW
         KVZw7wljDNVBu+vrKYYhsr+nb5VEsqpt3UjiVFJBKvWXGKjpUL4Yp0arGMLYBwJGjR8u
         sDRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367735; x=1774972535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        b=o52tYuPOtb7rRfZ5BhEM2IKbemXv/FDQCjcsumfjRarS7o+ZbSjTzEFWTRKj29ZmSS
         TZdKrODRZbt5rDs5G0vBhuClOlJwPFqtvFFEF1zzMB1sHIBH3TwRpXUF7Z8QT4nZKTvE
         CFlNE6LOFDHSN+Qmnr3VW9s9Q3RyBpHBXmH3+6XrSK1S8oBUFJYDbjqyvpWnF45UoBp8
         8Tw/SBiByCEcEyc2tTTnFLFTxVg1zQn0Y8eoj/7MXt+6G7cDQiiNbZfCH5/qqJiDKP1K
         LhumHa3xaZQ4+G1ZvSEJtBGJfVPAybrF4NPig1yemIMmHMKqTcIiLm7O9OjH8dgvCfAn
         +WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367735; x=1774972535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3OhNPFF53dFC048CnXCU+MpM/yyzQDjUWEZB/ZZUIA=;
        b=fpym52pO+IkWb5YjCyll2lAAP+N2Fjo2LNgCJtj0kcM1YSGNKCY3gcbqPBu3GnDSac
         mehLMJA+3po6Vw9Ms2+1IJPbQ26psKOkqSQZXeGy5Mw6ccryli0sH6xqiTZgIJ9xLGc+
         dWElQ7+sWtcoDpl4tAAgZNaZz01/RUKOS0h1SCdAp2uNrcjZzs+M7l8ax3aJDTXSviDk
         oXiuO3x1SElTLx4x3/s+lx292HgGcJo1T8iP+PBNWj9FhH/y9PKZwbiusJ5uUcLpu0zO
         LJnpb5HBRBRkuJCO8WtM77tZ3is9FoF5zDsBrAmjHgfRqNZhwKXr7rIbeMTvZ7130PI9
         sAWA==
X-Forwarded-Encrypted: i=1; AJvYcCX8WsyP5Q2CUO0Kb8HbWDdPSUJnZilcS/aw+ywZpaXVejullf7OV8ctpfikbGQMkmxP2xQ8@lists.linux.dev
X-Gm-Message-State: AOJu0YwXgoD08wekanLx0j9uLVQ9l/Mdvp2V8o9nYTbUzJVYHh25NB5r
	lginXDvoKzn8UdUl6XSSfZ07aZNjvPXgVE+IIaSOeBm2qPYd4Wg4sk/qhtKhVDhCjdFwec9AB1W
	FL2i3BLngVlnnJskespH6MVm6oi7+qt0=
X-Gm-Gg: ATEYQzxFamB+5vqQRgxERoQsF+qvTssGV7tlE+rtaDhAgpDjrWq2g9LsmHyQ99oK8y5
	+74A2OAtPCmwMUfv+htsJdP5FIgQrRg6QWtvD0cHR6PdzGeX1pLM05fdYuLC4UDia+9gbaCLzbw
	mJ927TPbCbySlKPP6KKteMozkmD5y3ug7Jw+/Ndp2Lsp9vSa73VREQhpvdaPFS7ptaFUv8Wp2OI
	zEgDQV56RaVpob1RNHnBoSIFclOg7mx/h9xFEZgNwMC5giqbWoDVuV3qzfwS5elrzmFZE8+VkRB
	DxCMNKl9MPRan3HHjqrmzWLtGMTj0lYougDQHdvTLhsytJBTDCTt8GiMN6pALL6e9tEQ/IVEl+a
	u3plaHG+TDrPzMEYCX/CKRqdde+Sk37LRpvvJ
X-Received: by 2002:a5d:5d0b:0:b0:43b:447a:11b8 with SMTP id
 ffacd0b85a97d-43b8899533cmr19587f8f.6.1774367734362; Tue, 24 Mar 2026
 08:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323-tools_build_fix_zero_init_bpf_only-v1-0-d1cfad2f4cd1@arm.com>
 <20260323-tools_build_fix_zero_init_bpf_only-v1-5-d1cfad2f4cd1@arm.com>
 <31243215-918a-4f03-917b-de869b7b7bf1@linux.dev> <20260324065820.GC43072@e132581.arm.com>
In-Reply-To: <20260324065820.GC43072@e132581.arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 24 Mar 2026 08:55:23 -0700
X-Gm-Features: AQROBzC5IXAEUJFbmA8caaR_jFD39ZGF7akzX-go1yOK6QjtBXhXNQ_zLdejUkM
Message-ID: <CAADnVQKJLO+7NnbPvmTraZr8hq8ENSh2f85a21b717ye=NgpUg@mail.gmail.com>
Subject: Re: [PATCH 5/6] selftests/bpf: Initialize operation name before use
To: Leo Yan <leo.yan@arm.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>, Quentin Monnet <qmo@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Lorenz Bauer <lmb@isovalent.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:58=E2=80=AFPM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Mar 23, 2026 at 03:52:38PM -0700, Ihor Solodrai wrote:
> > On 3/23/26 8:40 AM, Leo Yan wrote:
> > > ASAN reports stack-buffer-overflow due to the uninitialized op_name.
> > >
> > > Initialize it to fix the issue.
> > >
> > > Fixes: 054b6c7866c7 ("selftests/bpf: Add verifier log tests for BPF_B=
TF_LOAD command")
> > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > > ---
> > >  tools/testing/selftests/bpf/prog_tests/verifier_log.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/verifier_log.c b/=
tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > index aaa2854974c0a91cbbb9fc13ae0f966de1bcc818..dcbe2ef995c5b211c2b86=
b9555c02144e11ee7d6 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/verifier_log.c
> > > @@ -317,6 +317,7 @@ static void verif_btf_log_subtest(bool bad_btf)
> > >     res =3D load_btf(&opts, true);
> > >     ASSERT_EQ(res, -ENOSPC, "half_log_fd");
> > >     ASSERT_EQ(strlen(logs.buf), 24, "log_fixed_25");
> > > +   snprintf(op_name, sizeof(op_name), "log_fixed");
> >
> > You should use strscpy() here.
>
> Sure, I will change to :
>
>   strscpy(op_name, "log_fixed", sizeof(op_name));
>
> > This patch looks very unrelated.
> > Did this surface only after the changes in the makefiles?
>
> Yes.  This change fixes ASAN error reported by BPF CI:
>
>   https://github.com/kernel-patches/bpf/actions/runs/23239705647/job/6755=
4431963

When you respin please use [PATHC bpf-next v2] subject.
Otherwise CI doesn't run all tests.
