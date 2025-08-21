Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB36257451
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755740436; cv=none; b=nevjxzESARzud+oGOGL9oqFVn3K0960/krT097mU1muMo82vO88e+TTZKJJSFXRKp+GmeekfMdfy/BFF81G88k3EpKR1xH3+ZXRxbl2KgxStZ52OtbsjLwIo9LJe1fGJYjfrDDFyNRxpwVaIbjDS+RtwjZQ6Dq/fktmOEXTyaio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755740436; c=relaxed/simple;
	bh=7NzyyKQFr2eofSiUjDElzqtXmnS6djl6vapXpPdAlP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LRQ34Mxnc4/BCRoG2l4IEwEETzyuU3W7ZhXpZka524iXHk+2K2TGBq+2C+n68RXgto7hme9bCBbHGKvfSIowwxvFhEEYJyEbkhX8pe0AtVlg0alrFqF744cYrn1sNWVWi85nUiZLfLrckzCoUqvubV7SnIcmZMlsUl99/tWY55E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wcd3RdXA; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wcd3RdXA"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-71d60501806so3988937b3.2
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 18:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755740432; x=1756345232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vItjwoBGwkZfqnVBm2Rd+0n8q7fmA/zGpzfuFKRm3Sw=;
        b=Wcd3RdXAjPmOtHspKge1v8B3pbP2BqInZViWKVg0gXgoWio4r56hbyBH2WVbuHfQhG
         /KDKtPSnDrIuOYWl8lfnyMXTH5CIT8sW8IJPZoQyRgxbWBq03ny1ggAa4qdSgfa3wZ5X
         PELxwVPdtYNj2HcYLJhdW0ahFAaUVCf9C+DhtTQZXkj/oXkAoSUHySadecpDGlzKoVzy
         6qfdSZ0DO2JgLt5wlwpcjIAW5WgorVwwSciByhY/1+CCyaTsSO8rDE9UrCOWzjpENQrj
         iJmeJ8iPykCQTWIoKq97w6VpaNMmfO99+GUOjFcE9Y7iSm0TfOkVQOvZ0OFYt/fe3UPj
         WThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755740432; x=1756345232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vItjwoBGwkZfqnVBm2Rd+0n8q7fmA/zGpzfuFKRm3Sw=;
        b=Vb1fKgnIvSmZRYUoCpgIJrd2BZfG/nVe+Sz2Saa994rOyKtJ4evtzzJKwMAIsvjVK9
         au4mi5bNS36EquBhVjHttwWyKkP9xlsFWwnik3soT+B6nRupAFNwFXnw1Ru/euT9LCU7
         EVNQfZYmShyTr/cWqlBTUXzsTGyAzMnZnoAhGQoLwZZhrDasVDxteb0ViF1NSngUnLU/
         ksXlvbS+dCu+hQ3JjAcB9KtbvGvPH1i2wT6FReMU9jVDd/uGvXTE7NTjMpTIbHTDPdsk
         4oX4fW5OB5xkqkog9RtBRnirRG5cP83qsvoXsJILAduqm/ITrtJlm4q2o+MNW0ubmKul
         M7zw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ22ROgAAw9nxLQFZxtpTalaWiKxzfpmLmZNst+M6nRWr2s5K5QvWaqDswRI9UMlKm6loc@lists.linux.dev
X-Gm-Message-State: AOJu0YyjsgAZlSi78rfZh2nWkg3zXOQ0HfLfpy9H2UODaUAmyLf9+sXU
	1YLEba6u54deToGrT4jE2UY7T+ThlrcPLP09haEI4MQHQ7oLZSM3rQqs8jpaVn1TciStt6ZZKsk
	QAPLmwl4r3e2+NHT4I+iPFKEjutMP+ZA=
X-Gm-Gg: ASbGncsjK/S4fxj6mryCr+RiLPKLXM2B28cq+co/xOjMVZn3OC+myOKQeoqJodFVmH5
	l5w5lbgGr6NZF0hnZXBOWj9zcmijOza10cPRVvdZupYqcx+B54Lqs6n1jjM2hdysPxmmptNzyBZ
	YRpu7dDFsV5lByb//x8e7kRzm+JJ4WBeGEAviTXD8CwkdiR413T6kKugWIDiZ2wW1GGpG4mu+OB
	6YnGEgIpxk=
X-Google-Smtp-Source: AGHT+IFNgH4nfyrA8IG4t0dWjyf/2STD4SIQw2irwD7LYdlGT6ENNd6k1P3j/VAb9T9DkpftmcAFxSshvy3X+fIMUL4=
X-Received: by 2002:a05:690c:4c09:b0:719:f37e:e69c with SMTP id
 00721157ae682-71fc89dd72emr10794537b3.36.1755740432267; Wed, 20 Aug 2025
 18:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819033956.59164-1-dongml2@chinatelecom.cn>
 <20250819033956.59164-4-dongml2@chinatelecom.cn> <CAEf4BzZOC6Zyo9sikPJH+0Xz=aCbx=dBM_RksYZMaZM4ndR+OA@mail.gmail.com>
In-Reply-To: <CAEf4BzZOC6Zyo9sikPJH+0Xz=aCbx=dBM_RksYZMaZM4ndR+OA@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 21 Aug 2025 09:40:21 +0800
X-Gm-Features: Ac12FXyC839nqzgjfLwuVWAeVwrtOk_JF8yPaPJInPdSwaHlsMvt96BJQKQzZnE
Message-ID: <CADxym3ZgRE-AN0YC50izuO63ipA-bc_Y+JAOMfJq8T3i7mKTzQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: add benchmark testing for kprobe-multi-all
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

On Thu, Aug 21, 2025 at 6:54=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Aug 18, 2025 at 8:40=E2=80=AFPM Menglong Dong <menglong8.dong@gma=
il.com> wrote:
> >
> > For now, the benchmark for kprobe-multi is single, which means there is
> > only 1 function is hooked during testing. Add the testing
> > "kprobe-multi-all", which will hook all the kernel functions during
> > the benchmark. And the "kretprobe-multi-all" is added too.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
> > ---
> >  tools/testing/selftests/bpf/bench.c           |  4 ++
> >  .../selftests/bpf/benchs/bench_trigger.c      | 54 +++++++++++++++++++
> >  .../selftests/bpf/benchs/run_bench_trigger.sh |  4 +-
> >  .../selftests/bpf/progs/trigger_bench.c       | 12 +++++
> >  tools/testing/selftests/bpf/trace_helpers.c   |  3 ++
> >  5 files changed, 75 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/testing/selftests/bpf/bench.c b/tools/testing/selfte=
sts/bpf/bench.c
> > index ddd73d06a1eb..29dbf937818a 100644
> > --- a/tools/testing/selftests/bpf/bench.c
> > +++ b/tools/testing/selftests/bpf/bench.c
> > @@ -510,6 +510,8 @@ extern const struct bench bench_trig_kretprobe;
> >  extern const struct bench bench_trig_kprobe_multi;
> >  extern const struct bench bench_trig_kretprobe_multi;
> >  extern const struct bench bench_trig_fentry;
> > +extern const struct bench bench_trig_kprobe_multi_all;
> > +extern const struct bench bench_trig_kretprobe_multi_all;
> >  extern const struct bench bench_trig_fexit;
> >  extern const struct bench bench_trig_fmodret;
> >  extern const struct bench bench_trig_tp;
> > @@ -578,6 +580,8 @@ static const struct bench *benchs[] =3D {
> >         &bench_trig_kprobe_multi,
> >         &bench_trig_kretprobe_multi,
> >         &bench_trig_fentry,
> > +       &bench_trig_kprobe_multi_all,
> > +       &bench_trig_kretprobe_multi_all,
> >         &bench_trig_fexit,
> >         &bench_trig_fmodret,
> >         &bench_trig_tp,
> > diff --git a/tools/testing/selftests/bpf/benchs/bench_trigger.c b/tools=
/testing/selftests/bpf/benchs/bench_trigger.c
> > index 82327657846e..c6634a64a7c0 100644
> > --- a/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > +++ b/tools/testing/selftests/bpf/benchs/bench_trigger.c
> > @@ -226,6 +226,58 @@ static void trigger_fentry_setup(void)
> >         attach_bpf(ctx.skel->progs.bench_trigger_fentry);
> >  }
> >
> > +static void attach_ksyms_all(struct bpf_program *empty, bool kretprobe=
)
> > +{
> > +       LIBBPF_OPTS(bpf_kprobe_multi_opts, opts);
> > +       char **syms =3D NULL;
> > +       size_t cnt =3D 0;
> > +
> > +       if (bpf_get_ksyms(&syms, &cnt, true)) {
> > +               printf("failed to get ksyms\n");
>
> we seem to be using fprintf(stderr, "...") for emitting errors like
> this (at least in some benchmarks, and it makes sense to me). Do the
> same?

OK!

>
> > +               exit(1);
> > +       }
> > +
> > +       printf("found %zu ksyms\n", cnt);
>
> stray debug output?

OK!

Thanks!
Menglong Dong

>
> > +       opts.syms =3D (const char **) syms;
> > +       opts.cnt =3D cnt;
> > +       opts.retprobe =3D kretprobe;
> > +       /* attach empty to all the kernel functions except bpf_get_numa=
_node_id. */
> > +       if (!bpf_program__attach_kprobe_multi_opts(empty, NULL, &opts))=
 {
> > +               printf("failed to attach bpf_program__attach_kprobe_mul=
ti_opts to all\n");
> > +               exit(1);
> > +       }
> > +}
> > +
>
> [...]
