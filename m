Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153064D5B3
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 19:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEVTh+zb"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-54c67b0da54so1003698a12.0
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701457904; x=1702062704; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b2qv0QWPtpd3SOyHqmLbQnb6QDi1Dy0b3kkXbjYsP4=;
        b=EEVTh+zbXIYXZF8xd45wofD7GBQDckrn3UZenLLwDyEIhEQ5wqWBVcM3S/goVGCBEw
         QUvMdS/Ng4AfSkE1yphprOe6+LhVktQFH1AH8tVGrNSM3SZOx+jCGIkr2MX9r75FaA25
         rTssR1OqS7MUb3MX/1GLVwHm9VYKXJqSLOhZXIg8Uyzxgilqz55waa5Uz7Xg6+OgZomp
         0IaRjFlL2AEYdaYLptukOMhWruZvNKajlfEcAmpa0YXPBUXOUVlOf6EZdQ8hJvxwOOAG
         JDfotR+e82IajuMMfD2rkdEftbBapJR/4vTiIm4gR/HO7dfGibVBUJy/q5XQZmk+ysOz
         ZA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701457904; x=1702062704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b2qv0QWPtpd3SOyHqmLbQnb6QDi1Dy0b3kkXbjYsP4=;
        b=JxRofD7rlUp1yhsPOpws1vF2C0VRjw4r7RTcy7dt8qteixNA7DihktZdKRT8f4VfGl
         s7uEzl4Da77HSXz8WKqaSYroy+WpvD+t0KJQX1RT+QCInf90fra90Ovj9FfEDMXxI7Tz
         nv4j/apBG0LSz+SCaagf2ez7bzz3m5jGOcLg5L6PhNsbDgKNHhfMZDjBA5QMOAIB4/c7
         58fqgHPmvm0Nl0p2k4+4/XYl+72hx13ivMOi01Kdp4KOsCvU3uFxTPTpfesIw7NB5TTu
         EDlNPXsww5ApcyfAlJIWc/8kXZ6yAX4iEWuE5K/jrTuEuRXtOB6kcHRsjrdDcVKgs6k0
         JYpg==
X-Gm-Message-State: AOJu0Yy2xpkCp+rA4SIkRkzlWLolIVspG8spwuuonVmkZaZDbcBoUCf9
	ysT5T2wSDeRzd3qdgH0o1tfMtHW9PcKVNWVxMxw=
X-Google-Smtp-Source: AGHT+IGIQpnkASsjxBknJbw9LL3639mMvt4MnBhyj+0QZCNfwUSuXzZCXcCDeoZ3xygNZeUuaF+Z7qJQqLRxhyr3Afc=
X-Received: by 2002:a17:906:f84a:b0:a19:a19b:55f9 with SMTP id
 ks10-20020a170906f84a00b00a19a19b55f9mr1129420ejb.137.1701457903624; Fri, 01
 Dec 2023 11:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1701193577.git.dxu@dxuuu.xyz> <ed7920365daf5eff1c82892b57e918d3db786ac7.1701193577.git.dxu@dxuuu.xyz>
 <20c593b6f31720a3d24d75e5e5cc3245b67249d1.camel@gmail.com> <ib27gbqj6c6ilblugm5kalwyfty6h4zujhvykw4a562uorqzjn@6wxeino6q7vk>
In-Reply-To: <ib27gbqj6c6ilblugm5kalwyfty6h4zujhvykw4a562uorqzjn@6wxeino6q7vk>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 1 Dec 2023 11:11:31 -0800
Message-ID: <CAEf4BzbO80kFyFBCUixJ_NGqjJv79i+6oQXz+-jzRE+MaoRYZA@mail.gmail.com>
Subject: Re: [PATCH ipsec-next v2 3/6] libbpf: Add BPF_CORE_WRITE_BITFIELD() macro
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: Eduard Zingerman <eddyz87@gmail.com>, ndesaulniers@google.com, andrii@kernel.org, 
	nathan@kernel.org, daniel@iogearbox.net, ast@kernel.org, 
	steffen.klassert@secunet.com, antony.antony@secunet.com, 
	alexei.starovoitov@gmail.com, yonghong.song@linux.dev, martin.lau@linux.dev, 
	song@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, devel@linux-ipsec.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 5:33=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> On Tue, Nov 28, 2023 at 07:59:01PM +0200, Eduard Zingerman wrote:
> > On Tue, 2023-11-28 at 10:54 -0700, Daniel Xu wrote:
> > > Similar to reading from CO-RE bitfields, we need a CO-RE aware bitfie=
ld
> > > writing wrapper to make the verifier happy.
> > >
> > > Two alternatives to this approach are:
> > >
> > > 1. Use the upcoming `preserve_static_offset` [0] attribute to disable
> > >    CO-RE on specific structs.
> > > 2. Use broader byte-sized writes to write to bitfields.
> > >
> > > (1) is a bit a bit hard to use. It requires specific and
> > > not-very-obvious annotations to bpftool generated vmlinux.h. It's als=
o
> > > not generally available in released LLVM versions yet.
> > >
> > > (2) makes the code quite hard to read and write. And especially if
> > > BPF_CORE_READ_BITFIELD() is already being used, it makes more sense t=
o
> > > to have an inverse helper for writing.
> > >
> > > [0]: https://reviews.llvm.org/D133361
> > > From: Eduard Zingerman <eddyz87@gmail.com>
> > >
> > > Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> > > ---
> >
> > Could you please also add a selftest (or several) using __retval()
> > annotation for this macro?
>
> Good call about adding tests -- I found a few bugs with the code from
> the other thread. But boy did they take a lot of brain cells to figure
> out.
>
> There was some 6th grade algebra involved too -- I'll do my best to
> explain it in the commit msg for v3.
>
>
> Here are the fixes in case you are curious:
>
> diff --git a/tools/lib/bpf/bpf_core_read.h b/tools/lib/bpf/bpf_core_read.=
h
> index 7a764f65d299..8f02c558c0ff 100644
> --- a/tools/lib/bpf/bpf_core_read.h
> +++ b/tools/lib/bpf/bpf_core_read.h
> @@ -120,7 +120,9 @@ enum bpf_enum_value_kind {
>         unsigned int byte_size =3D __CORE_RELO(s, field, BYTE_SIZE);     =
 \
>         unsigned int lshift =3D __CORE_RELO(s, field, LSHIFT_U64);       =
 \
>         unsigned int rshift =3D __CORE_RELO(s, field, RSHIFT_U64);       =
 \
> -       unsigned int bit_size =3D (rshift - lshift);                     =
 \
> +       unsigned int bit_size =3D (64 - rshift);                         =
 \
> +       unsigned int hi_size =3D lshift;                                 =
 \
> +       unsigned int lo_size =3D (rshift - lshift);                      =
 \

nit: let's drop unnecessary ()

>         unsigned long long nval, val, hi, lo;                           \
>                                                                         \
>         asm volatile("" : "+r"(p));                                     \
> @@ -131,13 +133,13 @@ enum bpf_enum_value_kind {
>         case 4: val =3D *(unsigned int *)p; break;                       =
 \
>         case 8: val =3D *(unsigned long long *)p; break;                 =
 \
>         }                                                               \
> -       hi =3D val >> (bit_size + rshift);                               =
 \
> -       hi <<=3D bit_size + rshift;                                      =
 \
> -       lo =3D val << (bit_size + lshift);                               =
 \
> -       lo >>=3D bit_size + lshift;                                      =
 \
> +       hi =3D val >> (64 - hi_size);                                    =
 \
> +       hi <<=3D 64 - hi_size;                                           =
 \
> +       lo =3D val << (64 - lo_size);                                    =
 \
> +       lo >>=3D 64 - lo_size;                                           =
 \
>         nval =3D new_val;                                                =
 \
> -       nval <<=3D lshift;                                               =
 \
> -       nval >>=3D rshift;                                               =
 \
> +       nval <<=3D (64 - bit_size);                                      =
 \
> +       nval >>=3D (64 - bit_size - lo_size);                            =
 \
>         val =3D hi | nval | lo;                                          =
 \

this looks.. unusual. I'd imagine we calculate a mask, mask out bits
we are replacing, and then OR with new values, roughly (assuming all
the right left/right shift values and stuff)

/* clear bits */
val &=3D ~(bitfield_mask << shift);
/* set bits */
val |=3D (nval & bitfield_mask) << shift;

?

>         switch (byte_size) {                                            \
>         case 1: *(unsigned char *)p      =3D val; break;                 =
 \
>
>
> Thanks,
> Daniel
