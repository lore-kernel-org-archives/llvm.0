Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A731B5465B
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710183287; cv=none; b=Xrh38alalEc709JVXw5hL9P/grnJU1hINoDw0/SjLx3FSLe/jK2kC+7JK5xj8QM8NlJ/jcHhL1kkaY3pWRuJ6yyRDsQPjFbKXZ1T6jqF+a683xJTSspMbjvKRFU/vtLAV/Gg3t/cV+slq/JrfiJdq1n3kQfc4G+4RIquWO/V1kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710183287; c=relaxed/simple;
	bh=sg1d/ANVhdMJVWpfU8bbvkMp+uD3nzj9x9rv9aGU7ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Li38A0c2drftaohUuBo0Cn5IK1kaqyw6w1HVMs0UJsSD9mA2PbhZ98qjTI6vq1KB/VOo2TC6j5WVdG6jNFoQMw2D56HIRLDN8HjrkZBg+km/yX5TFSLB40QHhNpj2+DC/DZWa+o3/5XtLquCnZX00S0ktzQP6lsQPpGR8A/4R78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SiZDPWUN; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SiZDPWUN"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-366248b78d9so14585ab.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710183284; x=1710788084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EWPj2I4xpYoZRjyOYAm/kocZbdOlLT2RiNEmzadKaY=;
        b=SiZDPWUNPRhFDU3cXawgtmEezCGqAbTPyxKsorFYsCayP1nbUHqyYMNQYP2omdTdhB
         mfFsE2sl6o2BY+nxB2iK2aNWY64sA0DoozliJ4AB7jldB1B5JqWULMpPDSa17dG9b23i
         mR85JYCMpmGySpD3/Z+lXyLbzWMs89N1yHIesw/+xCGSS6/HJq81mKbw1R0bvnNWIwUC
         H0Ugy4sKyH0c+0ytMj0L3HGo0EJmmIqJnC7Qq01Vg9En0fZXXroJWX7Qv7PI4juP4jGU
         Izu1Rqagy+mRQC/LRD4sDOEPkvZO7UkDBmFyA0euHd+y5modWW7VMRaBCXmjwDzxK8rZ
         C+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710183284; x=1710788084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EWPj2I4xpYoZRjyOYAm/kocZbdOlLT2RiNEmzadKaY=;
        b=YBOVAFewZPD5DrzOcAax9p5y3X9OpIhN12cjqS302EeOJni6a7H0EAwVR/IpUZqEWd
         +xRzX1wJ74RVYJWZkcY0hGpKei0TJ3pNVLOpC6vKBZAfLESWxHsXLPbwOrModleJ0Avn
         GaQgU87DcHJlSQvBeRE5Jr+jdN8qj4AcPa49+FUCA5dRF/EusBgT9Kgl/O675IhOZ32i
         uh9Z4GJx6hRm4FDBq+P88W2339mHMsxPqsIjII3m2zpmmo/QSJ59GNEvG0159HwO31ee
         GAQB3utgeEidGfDUOS2ixWM4fxJJ5exKrwHYq9WXrHEE+6q0I12hYLzEBBROv7tXZvZn
         Ertw==
X-Forwarded-Encrypted: i=1; AJvYcCWkDTLLguteYq/S4wL9RmX+tUzfYviB+84kyuB3TtzpuMpndgZ1tkK4iRrMQvMYbAGX9QXXE7mVW4Q4kOjz1qMVZjwG+w==
X-Gm-Message-State: AOJu0Yyjdnip7euFIA152scchfAClriKt71UlthS6qTXsTBS2g/X9DFA
	2qKGZa9Ll++4/6vNtyu1XihtVuzMunTy+6+E1VmCajlSvhAqhaAyrp5nH1ZxBwYw5kaU6aFcDBu
	4/6tcwipfCWEf9U7HRS0CaDIKCk/+FC2oK7c0
X-Google-Smtp-Source: AGHT+IF9Y1AJY3TwC+yrKD+SLGX6DGVejGuk9zVLbhhSZF+Z1op/fddC1zPHT7AUjYPqnvQvkBSi2u31QCO6TEveBME=
X-Received: by 2002:a05:6e02:1648:b0:366:444b:82d6 with SMTP id
 v8-20020a056e02164800b00366444b82d6mr6714ilu.15.1710183283551; Mon, 11 Mar
 2024 11:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-3-irogers@google.com>
 <CAEf4BzYiH6xRRLFBdUAkjn0uJP=safZod4=1EmEwTTH9PDmVvQ@mail.gmail.com>
In-Reply-To: <CAEf4BzYiH6xRRLFBdUAkjn0uJP=safZod4=1EmEwTTH9PDmVvQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 11 Mar 2024 11:54:32 -0700
Message-ID: <CAP-5=fUQY=ho1OSk-wosw8=7Sjp8MB_kngggP00BXs+nVNj7Pg@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] libbpf: Make __printf define conditional
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@aculab.com>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 10:49=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Sat, Mar 9, 2024 at 6:05=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > libbpf depends upon linux/err.h which has a linux/compiler.h
> > dependency. In the kernel includes, as opposed to the tools version,
> > linux/compiler.h includes linux/compiler_attributes.h which defines
> > __printf. As the libbpf.c __printf definition isn't guarded by an
> > ifndef, this leads to a duplicate definition compilation error when
> > trying to update the tools/include/linux/compiler.h. Fix this by
> > adding the missing ifndef.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index afd09571c482..2152360b4b18 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -66,7 +66,9 @@
> >   */
> >  #pragma GCC diagnostic ignored "-Wformat-nonliteral"
> >
> > -#define __printf(a, b) __attribute__((format(printf, a, b)))
> > +#ifndef __printf
> > +# define __printf(a, b)        __attribute__((format(printf, a, b)))
>
> styling nit: don't add spaces between # and define, please
>
> overall LGTM
>
> Acked-by: Andrii Nakryiko <andrii@kernel.org>
>
> Two questions, though.
>
> 1. It seems like just dropping #define __printf in libbpf.c compiles
> fine (I checked both building libbpf directly, and BPF selftest, and
> perf, and bpftool directly, all of them built fine). So we can
> probably just drop this. I'll need to add __printf on Github, but
> that's fine.
>
> 2. Logistics. Which tree should this patch go through? Can I land it
> in bpf-next or it's too much inconvenience for you?

Thanks Andrii,

dropping the #define (1) sgtm but the current compiler.h will fail to
build libbpf.c without the later compiler.h update in this series.
This causes another logistic issue for your point 2. Presumably if
this patch goes through bpf-next, the first patch "tools bpf:
Synchronize bpf.h with kernel uapi version" should also go through the
bpf-next.

Thanks,
Ian


> > +#endif
> >
> >  static struct bpf_map *bpf_object__add_map(struct bpf_object *obj);
> >  static bool prog_is_subprog(const struct bpf_object *obj, const struct=
 bpf_program *prog);
> > --
> > 2.44.0.278.ge034bb2e1d-goog
> >
