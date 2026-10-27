Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793138878;
	b=tgsBe8FLfTMnSGnbmyUCA0vuocOaehPjB+/5bq74xYBYJ+bSAWba4Au55eaj2KH1JszG
	 0QIKIzN+m8hW2akrGiNs/mj5S2ZXqOJvBKVK6zoGGt/r4i5O1HOjlji6g1F4q/j5/WNmH
	 VupLhDhlm37u4cCPcCleq5Cwin4KgmWCYRTzWef10YF8IMjEC2lxyoHezddXsKr1LFW2w
	 eo3ZvRl8C5+4Du83qVuyM5qpxCOpbbI2ODRVUy7fc5JTXtfeWmMf953vHWK8gtApa8E4y
	 sxHquuE/UkHXdUbjDxOHmOMcpp+YFM+Cod6/7Lva5pFkJb8JqmaVDUnhK8BIit8qYHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
	b=fWyV3r/SOJP58+7EgWChzIMe3muW8uAcWq8tLe0kD+Jc13vjtZvXMQYSMMhJwMruFbW7
	 /bmB4W5yqowbbcyg59GPrnGD6fgRBUcPkWOL3y/mTS/Zy75jJqXwhdFM66O+rmaGYyA1B
	 jD4z4u4zD3uIXgge/MimxwydTWi7rTKyADcnkte8sM3FfOD/U2dIy1lCwF1178gi8iYKX
	 DRCYMPCkUeTw9Pdr8CQOZx/bguxiAJJwJYMv6M5O0B0Wln77X730JIG/TRZ07mrsQHW8R
	 60TUB0kDI3LlpCqYFruq9IIOKEjSrycFb9vDxW50Upkn9W2P9nJRFkDwIph5Dw1I0jQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C73606A321
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3C73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso2493754a12.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 15:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793138876; cv=none;
        d=google.com; s=arc-20260327;
        b=l4z5xHEmdlXa6/WCFYKRDRaSvMh2uHx704Ftis1QPDtEUg3f497V8Nw6yHdZwyANxj
         T0kPwKWq/amLdOcBtoXdXjxrFWaDizzb3OuJfJwt1JUnoqmsAelgSmcSecGjJU7gU94q
         4xHAfoEAAjC8kIAilcWTyaEUa6li9GwSD+uNtimPOgcd6zmPdN0y81glSiZVSuGSsojn
         LS94N7Zvc9u/g9yk92Ww7ggrLIQAMpSFs1brvWYgWDYlZIPCcM9jnr50FYtABSmmISgw
         lksFaOECh6xgqTE3jc2pgBQB7ZPrTbmGVKGEaIS4pFdunECQSrqLjAhfhqlo9IDSgSLW
         BmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        fh=2fIhJ8tSZIo054XKWmQyBV2hyOpiW1PG14Xg4QamUp0=;
        b=EomaagP6da2D1RpbFqFVhpSMi5UmWX02filp8ZQz/SW0UtlFvAffdveR3Rf1oEt1nN
         N30fqCgY7/47KRLbK6Irs0n4UPtNQUxQhDYeI69Al8NTMyfGKyaMjxlSW7l+UpYhWfCE
         jyZe7zK5N6YNZ1bQyhMs+SArYJwQSvZNr2AKWVz6Zk1mGx6KEd1ItFmiyNcQNCwlaWRK
         Wltpl9hvtRy7dxW2UU6vOy+mgYpfsDHsheT8m6gdPo29EK/0FfE2kRL8eHvqaMbWayOZ
         paSEZIMGAVU4NegQjf7VZcyOckRfEpxcxTuvnRiHRYEhF1DiOYBqG3wzWsT2nam3THie
         km9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793138876; x=1793743676; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=S9XJ5AQ5nva2Q1BgIN7Y0b9nj0qKDQPAK0TlRxbRtYGzJjr63vrMULQc/Q6GCqSPrx
         eyE/Uhc+j/6PhqMONPLSnmxHYZ1B2pe3k6+th5RVWnFDWZLSGbVFibaInsa7lgGYAaOF
         MKVrSLJMqrKeNFReDCtIV1OAxt3j7r/0k/swhVzHfOYNpttQnD8FtqANc/xTDD6vqJTe
         36t3NJCHlf1SnVCXcfNjw1MNOjUCXysKuIEApI2SHxhyHw8AxtWaY52tg55zYDSjLgOE
         U8k3qU7TKqT1x6PD8CghIZHTcKVYakl1yUZaIPSLsgBJi2Mt9gcH4BP0rZunFkVbTaJW
         Y0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138876; x=1793743676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=YA8TWw0WoDV4ExKJoBZ5fvXPpLEJsrxk7Y9/J20hPapq0jfq4grvT0XL7xZLjWD3TJ
         Lhv9yEQ1T5avJkAFPQKBFPSBywCO+9rSCMX5dj3FZRAYg6/VZzmyTq1FsWVDILQfRlNl
         /MGvfxHzb33LsSYdU4R24L/a8Ws4jgSUB9n4cDGtqTqslrPjd/wsyaqfWXXxCtiqdBuk
         7sMJrM08B0xsOc8wIANh5VYtsPcOjTD4Jypvh4B7bSqs7Tb4+vhIk6KmUjhxGlmOgBWS
         7k4mN2R5hVBCNF502IQc7hGqDL+W+8s5Nr2cC/Tj22XMRcPWzACGg+V3uvxA4Ie7E3Vi
         LTWg==
X-Forwarded-Encrypted: i=1; AKwUvBwFVFQeiLYcaAsz/QlSo6gltcSaey4N2wdHPwaOjKzCXBRpiJ7mIVEHKwx4D1Cd2gOuYAmI@lists.linux.dev
X-Gm-Message-State: AFq9FYJwIht84rxrkZIbKOPJj2MmGUy/mxzctVGKihBzZPfGBEVD2I4k
	DSSFFVCHXS7fH9esL9drFJ/DuPJDFMrCbgQ/JAqY/d9OY4KAfOnCq9MuZ0mGQzzetWbTihEZq2+
	h/LEhdOy1ySAbGB8zP3MiPR50i/Lk7rCPKygtzUGi
X-Gm-Gg: AYBFou02qpWaRV8sFSCC91A3hgcUrs7C80gnafdwJlw2jfodnfYBtYH7fvcF4YXac8W
	Uo8gUZiODpk18o9heTHAXnO5l4Z8KC+lbhM/Aa2cDMPWYddB9NUTSfU0CtFNEtf4zBOYzXEuBMG
	NHK1RYayKbIab4vzV9a1P8SyzJowk/a0YU2aDcdMk7XfAmux19H2B3cvUtpX5Qn5rKb0nNvS5wE
	h4X164I8f/fkNf7e++VimtVGsdE5mLXXLPaCeTQKnBWhK9EJWMXJGXXiVnC+pLHloTizHFWu67a
	Cwo7gu2LDcIpQOi40xIvV/sft/v/3uF8qZfmkw5NNwGG3JENaBbgBEaeVf/zbTQ2zV5EKP1WWF+
	BHqrzKWvbJDgG5xs/M7w1yVHNFFaI+zSRKtojGvd/RqgAtoV3GFeOg98TT9t3DQvXxuLi7Q3q+o
	txh93CwuSs5B0j
X-Received: by 2002:a17:907:97d5:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c49bd9e20e9mr50496066b.0.1793138875790; Tue, 27 Oct 2026
 15:07:55 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava>
In-Reply-To: <at8dNNb4vwovNZcZ@krava>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 15:07:44 -0700
X-Gm-Features: AclHuK_4ySi3E2heiJLIOqDTOIX20dmWcYWcaizjPHfB4zOsCZlZ7RMy9jhhzuA
Message-ID: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
>
> SNIP
>
> > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > +{
> > +     struct kallsyms_query q;
> > +     struct extern_desc *ext;
> > +     int err =3D 0;
> > +     int fd;
> > +     int i;
> > +
> > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +
> > +             q =3D (struct kallsyms_query){
> > +                     .size =3D sizeof(q),
> > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > +             };
> > +
> > +                     err =3D -errno;
> > +                     if (err =3D=3D -ENOENT) {
> > +                             err =3D 0;
> > +                             continue;
> > +                     }
> > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > +                             pr_warn("extern (ksym) '%s': resolution i=
s ambiguous\n",
> > +                                     ext->name);
> > +                     break;
> > +             }
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D q.sym_addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
> > +     close(fd);
> > +     return err;
> > +}
> > +
> > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> >  {
> > +     int err;
> > +
> > +     err =3D bpf_object__query_ksyms(obj);
>
> hi,
> we could also add similar support for libbpf_available_kallsyms_parse and
> probably in some other places like bpf_get_ksyms.. which makes me think i=
t
> could be useful to have KALLSYMS_QUERY support for multiple symbols
>
> thanks,
> jirka
>

Thanks for lookiing over this Jiri!

Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
number of tracefs symbols, and n is lines in kallsyms, with n >> m.
But AFAICT, libbpf_available_kallsyms_parse() would only be called in
pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
functions with addresses in available_filter_functions_addrs); so this
ioctl could never be called.

And regarding bpf_get_ksyms(), it loads all traceable functions and
needs the full syms table, so a /proc/kallsyms should fits better.

I did profile a slightly different form of querying multiple symbols
at once [1], but didn't see much benefit. struct kallsyms_query is
extensible via size and query_flags, so we can update in the future as
needed.

[1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ=
1wSm7sJ1w@mail.gmail.com/

[...]
