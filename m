Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B251DED72
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 16:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079700; cv=none; b=ZT7uiDmgoo++UoPsaWiyfWhdmTdXLvwQA6XxmKp3/OHSvcalpHLAJJgqvHEGLxNAxsqLpN4SJxW6i7s6DTObS5jEnT6t1REIPN6A/mAQJTwf+ZIAeAODJkeqLpVesWE6PggFjHlbNl5sc3+UzTRryvgbTtFtKWYMHsSE4Bzb3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079700; c=relaxed/simple;
	bh=+Auhi+fhizwmRtmPtgmlior927TsrK0KO7qctAT2pis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuQQNnSQwDzZ74w4fn89fxFdXnVlbifcvalUQ0tSGzuNeC1u3OpSUuTUsBH+VdKQ4QrChJwF31DIGduq1DAsGxLx2oPu1IzdwifVg58aYYHIBtlX+xjd+3f+cU/rZQlM/5Zo4kWVxAylgKXkWqemF1MWdcnjmWdeVxq7doMWraY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZR9uAbBM; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZR9uAbBM"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ff37565154so24465267b3.3
        for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745079697; x=1745684497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK42IqE6wVyUSsq1mCB2tip52MeUpuaz6h1iIgyehRY=;
        b=ZR9uAbBM6dRiLd+Lnag09VhWs8VDXNg+u4YBIlgE1PF5qmIHs5UPDZyH5vVwt55jxk
         3Y6FZsDlMutHbd/UVoIhygA2QaIPCn4zrJj8tqSW8HaawlGkwhJm5hMEuWIJERaxjaEP
         t1LkEgaSqyaQyxt7xuK8G+Y64FbTwtHCUf+bg6lonBzW2865goo3jNSNcOw/DHNxQVaE
         0EwzOVfz91tiZHjjLeLEBptdGEU7uby1nmT6vYglLmku3iA6w2TUHeua9d3eQHJs83l7
         iti8trYwM11chadRNi2YkzloKgbA5OnIMF1yrW/HrvEw7dvSjN0cbThnEP6MVZCjJg5l
         AQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079697; x=1745684497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK42IqE6wVyUSsq1mCB2tip52MeUpuaz6h1iIgyehRY=;
        b=CUc6N7gJx05CZd7219BAVu4FzakLTfSaahFAhay0RW5kpR1UuHeC8ZjzYDaA06fFoq
         /5iMSSdg/lGs9Ywq2xFdeAMBofzdvzyOD63uY1Wve8H289GE2U2hz1JSX60lhMIU80d8
         BOxW6UKk6LLL6xUXIZ3uGi+T4DPZ+rYNkmOazWqZY45rjIXVf+06ULt+Z6ap8+ar4xOu
         tzzMQax6j5lyPQPlj48wgVTbHNU6fL51mI4Zbqk6ch2nlzsU0rqFrHZYH/mxSmjlVzqO
         QAlXP5ejiqtKjSi+DASD49dZB0BKV8RYYGu6G2/QNy/YYD3f+KHvipY6FTMMJZ/4J94G
         O9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX+ZTzsVshwfEgpbtjTp7xoa46dEo8Fsfdz19NC6yOyd+6o6xeeItzqhBWYleg+Thgx29pE@lists.linux.dev
X-Gm-Message-State: AOJu0YxMeYqv2de3g/8TisGkr+aOreALDrLCTDbXsbrEzC3oWL5v1MV4
	drltHvIBCiWICFq4USfj/DCMjJRzuMwww8glFQhKuo2N2DOgYxJvdTdkN+TBxxu9FrNpb4ZH99w
	PX6XBhYM5T1TgrMtNtGwlIVf94yZ8nWBRrFxe
X-Gm-Gg: ASbGnctnpR8VyIeoS1ZwyK/ngRcdRnsuHSfxj9/DT6ZJlvoCj8fPtBb5/GZDgkM6XXT
	gaI/kqBApiYNXyDjYbXvW1N1n0gzYrpp97+t5ilTfqd0agROIeSOP1OJV+cjY5VQC/LtmiP4q3O
	nW/M778i65KYTge3Aki5fd9vaG6NJmGw==
X-Google-Smtp-Source: AGHT+IE3BicjHYyc+GSidJ22/CQRjgbN53OMD/7E3kl6FAHBfatlg7CLbuNJlbDtFKxiZ4CU+uMFqEhJREhcjE8lbJE=
X-Received: by 2002:a05:690c:74c2:b0:703:b0e3:bd86 with SMTP id
 00721157ae682-706ccdf5d35mr99562277b3.25.1745079696848; Sat, 19 Apr 2025
 09:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <CAADnVQJyNRZVLPj_nzegCyo+BzM1-whbnajotCXu+GW+5-=P6w@mail.gmail.com>
 <87semdjxcp.fsf@microsoft.com> <CAADnVQ+JGfwRgsoe2=EHkXdTyQ8ycn0D9nh1k49am++4oXUPHg@mail.gmail.com>
 <87friajmd5.fsf@microsoft.com> <CAADnVQKb3gPBFz+n+GoudxaTrugVegwMb8=kUfxOea5r2NNfUA@mail.gmail.com>
 <87a58hjune.fsf@microsoft.com> <874iypjl8t.fsf@microsoft.com>
In-Reply-To: <874iypjl8t.fsf@microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 19 Apr 2025 12:21:25 -0400
X-Gm-Features: ATxdqUG75P_ck3eo9mR9xrxf8isa1cXorXFN2bYVLnlyY_vUbbDdQ0hrTgMAh-o
Message-ID: <CAHC9VhRduum5_6fOFs3C7Mn153Fg7VM1HnJfdtKgA-6OUvd82Q@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	keyrings@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, nkapron@google.com, 
	Matteo Croce <teknoraver@meta.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:08=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
> ... would you be ammenable to a simple patch in
> skel_internal.h that freezes maps? e.g

I have limited network access at the moment, so it is possible I've
missed it, but I think it would be helpful to get a verdict on the
RFC-esque patch from Blaise below.

> diff --git a/tools/lib/bpf/skel_internal.h b/tools/lib/bpf/skel_internal.=
h
> index 4d5fa079b5d6..51e72dc23062 100644
> --- a/tools/lib/bpf/skel_internal.h
> +++ b/tools/lib/bpf/skel_internal.h
> @@ -263,6 +263,17 @@ static inline int skel_map_delete_elem(int fd, const=
 void *key)
>         return skel_sys_bpf(BPF_MAP_DELETE_ELEM, &attr, attr_sz);
>  }
>
> +static inline int skel_map_freeze(int fd)
> +{
> +       const size_t attr_sz =3D offsetofend(union bpf_attr, map_fd);
> +       union bpf_attr attr;
> +
> +       memset(&attr, 0, attr_sz);
> +       attr.map_fd =3D fd;
> +
> +       return skel_sys_bpf(BPF_MAP_FREEZE, &attr, attr_sz);
> +}
> +
>  static inline int skel_map_get_fd_by_id(__u32 id)
>  {
>         const size_t attr_sz =3D offsetofend(union bpf_attr, flags);
> @@ -327,6 +338,13 @@ static inline int bpf_load_and_run(struct bpf_load_a=
nd_run_opts *opts)
>                 goto out;
>         }
>
> +       err =3D skel_map_freeze(map_fd);
> +       if (err < 0) {
> +               opts->errstr =3D "failed to freeze map";
> +               set_err;
> +               goto out;
> +       }
> +
>         memset(&attr, 0, prog_load_attr_sz);
>         attr.prog_type =3D BPF_PROG_TYPE_SYSCALL;
>         attr.insns =3D (long) opts->insns;
>

--=20
paul-moore.com
