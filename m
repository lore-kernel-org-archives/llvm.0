Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D3344C6A
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710190323; cv=none; b=ZoRVhkwCV8+lp1IePYY1HiIttP3NjemkI5HyQR+T2dneL5bM6qfKvmFX31orzqhawGJlwo2vIClzcB4WlaZJO4pwl6CTxUcw1vMCiXbcMHXImIH+0Dxz9hNbS/jPaO48jX0XW+DhGp/hvKD8duC96++9HsWzWwboGYYaULUTYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710190323; c=relaxed/simple;
	bh=ByUIPZ47pKYggMFQ2m6tctWjj7DYdv9nhhKxwYcw3UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uwfcj9y/djp9t4YksxxVnNJ7Ha67wyvdCxHUKycA5nWF9AqPztDlSjCnern6PEfWXX3mY9Ravqaz+l0XnEWslzVFbUrquxQuITD24FAozybVekaRhBe8BACvBXm876xJF3w4H/3tIb1Yw3OmQEAYmYTcvTDyIruHBDwevmAb3wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HopVFUCU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HopVFUCU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-29aa91e173dso3332026a91.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 13:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710190322; x=1710795122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dd981U9xN2VeJ5yKqoYAGms3X6oq3hxLcufVnnlsh9s=;
        b=HopVFUCUiD2A83oxuy1wEusjm/7sYfKVWsZFPnMJVvLjKTBrw0PK420xAZ5BbcMXIs
         YzejhxLsyLeOjdgn3br8JCTbYU6Q32hlDu3eEkhHnyG8V1qmjgVLpO5o72tYObT9RzQ3
         2NrF3hHgIkbvyFWMgHDCUuXU4mJmCbZd1rzphDTm1XCuqNRhhx6D34CvGgg2odcZHVC3
         IuL3TIuWy1nh+/1FGphztFe+ORrSomwMjmVtMAug4K2R3bqjoYvk5/4I811pcgkbIQYq
         fUlzGRwcyUNOmH09Dq3HjLEydeDkqfZ8YCQLnEnImWn2wYTL2sMJ1f2xeksXqavuLF4p
         lxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710190322; x=1710795122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dd981U9xN2VeJ5yKqoYAGms3X6oq3hxLcufVnnlsh9s=;
        b=KpxoLZPZeRg5eUDttYg3KyamNED228hf4oBkVHE0RyMDNZ52dTryW7AIv4btRjxirj
         oy5JsJbLYNTJf4VojYoHb7Jh8/co35opPCoNXWnk3z9ifNhu+1OErv2jl3crpnoc/XQc
         gtqrdZi4axQicBlbvgI11+V0MRuCkjwxbmjHJeHVbrk/21I8sNYmxSYmSxDUkhTaiWjX
         /jNoiApsNNwFobG+azu5UKE+HIni5CYBHyYU+twmDLXd/WoeCkChc5/uhuNcsqS6ljji
         v65992pvSkVVRCk1AeNGhxSZBVfnIlYh99LxMxqSH+ow47b4q0gGDepAEWLkwipSMnPE
         1NGw==
X-Forwarded-Encrypted: i=1; AJvYcCVkH4YWXq9dKQK2v4SwuWW0//BFMtPFw5wQqm/V5720msz996qf+Ye1YQC6Q/9JWYSR5OofslwxWxQJH+ABeLq5YUyUIw==
X-Gm-Message-State: AOJu0YzQrrFwROlvLhbB/mK0tNC7TMexuxPSVXednVAjEVDbqYxw3sNc
	TUqFbZbiTf9JJZ8KZjIWKTObD+311AmQTBGD9fLbX+df+YokiXGMCpDX8C31aAT0BT3eTVnunRj
	GtVDTKSGy2ST3lrWYuphgdglgel0=
X-Google-Smtp-Source: AGHT+IEgfLgZ9vcdFhZoSO6fknZCxb89NjyC+7Z+5uVV9Zl7CWKCYHTODpZc68UrZGzW1EcTqjEdltk5w4Wxjqea6SM=
X-Received: by 2002:a17:90a:390c:b0:29b:a509:30aa with SMTP id
 y12-20020a17090a390c00b0029ba50930aamr112253pjb.14.1710190321684; Mon, 11 Mar
 2024 13:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com> <20240310020509.647319-3-irogers@google.com>
 <CAEf4BzYiH6xRRLFBdUAkjn0uJP=safZod4=1EmEwTTH9PDmVvQ@mail.gmail.com> <CAP-5=fUQY=ho1OSk-wosw8=7Sjp8MB_kngggP00BXs+nVNj7Pg@mail.gmail.com>
In-Reply-To: <CAP-5=fUQY=ho1OSk-wosw8=7Sjp8MB_kngggP00BXs+nVNj7Pg@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 11 Mar 2024 13:51:49 -0700
Message-ID: <CAEf4BzZ+4WAaySJVGArk3epJ-u92ULkcoXTr2HnRXshGx8fPDw@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] libbpf: Make __printf define conditional
To: Ian Rogers <irogers@google.com>
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

On Mon, Mar 11, 2024 at 11:54=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> On Mon, Mar 11, 2024 at 10:49=E2=80=AFAM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Sat, Mar 9, 2024 at 6:05=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > libbpf depends upon linux/err.h which has a linux/compiler.h
> > > dependency. In the kernel includes, as opposed to the tools version,
> > > linux/compiler.h includes linux/compiler_attributes.h which defines
> > > __printf. As the libbpf.c __printf definition isn't guarded by an
> > > ifndef, this leads to a duplicate definition compilation error when
> > > trying to update the tools/include/linux/compiler.h. Fix this by
> > > adding the missing ifndef.
> > >
> > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > ---
> > >  tools/lib/bpf/libbpf.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > > index afd09571c482..2152360b4b18 100644
> > > --- a/tools/lib/bpf/libbpf.c
> > > +++ b/tools/lib/bpf/libbpf.c
> > > @@ -66,7 +66,9 @@
> > >   */
> > >  #pragma GCC diagnostic ignored "-Wformat-nonliteral"
> > >
> > > -#define __printf(a, b) __attribute__((format(printf, a, b)))
> > > +#ifndef __printf
> > > +# define __printf(a, b)        __attribute__((format(printf, a, b)))
> >
> > styling nit: don't add spaces between # and define, please
> >
> > overall LGTM
> >
> > Acked-by: Andrii Nakryiko <andrii@kernel.org>
> >
> > Two questions, though.
> >
> > 1. It seems like just dropping #define __printf in libbpf.c compiles
> > fine (I checked both building libbpf directly, and BPF selftest, and
> > perf, and bpftool directly, all of them built fine). So we can
> > probably just drop this. I'll need to add __printf on Github, but
> > that's fine.
> >
> > 2. Logistics. Which tree should this patch go through? Can I land it
> > in bpf-next or it's too much inconvenience for you?
>
> Thanks Andrii,
>
> dropping the #define (1) sgtm but the current compiler.h will fail to
> build libbpf.c without the later compiler.h update in this series.
> This causes another logistic issue for your point 2. Presumably if
> this patch goes through bpf-next, the first patch "tools bpf:
> Synchronize bpf.h with kernel uapi version" should also go through the
> bpf-next.
>

That's what I'm saying, it seems to work without your patches already.
At least on bpf-next/master. But it's ok, let's keep it and just add
#ifndef guard, that will make my life easier when syncing to Github
later one. Then the patch can go through other trees and eventually
make it into bpf-next and then Github. So please keep my ack for
#ifndef version, thanks.

> Thanks,
> Ian
>
>
> > > +#endif
> > >
> > >  static struct bpf_map *bpf_object__add_map(struct bpf_object *obj);
> > >  static bool prog_is_subprog(const struct bpf_object *obj, const stru=
ct bpf_program *prog);
> > > --
> > > 2.44.0.278.ge034bb2e1d-goog
> > >
