Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55147611E
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 04:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bchFSlSK"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54bfa9b3ffaso6609879a12.1
        for <llvm@lists.linux.dev>; Mon, 04 Dec 2023 20:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701749047; x=1702353847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFi1KzwR2YOrUv7jhd8tU8M3SbznND0IRUD4tj9oA8M=;
        b=bchFSlSKhMqRccpvZNC0xXsr+EMCgobeDJ2TH8O+5zAiB8wsZ7xr4XsKm0cHt7Y59F
         bhDd5OsRmSGRFMxQjCwkvcDk3xFfJf4jFmweD+5QSQNpBuc/Hl1USz/kgkNkiLOoZmHK
         akO+mSulmV3XtTfrTT9350Ya/7hLJbK8kGbVBqQPf6tt3kceOjkmbnZtLyt90T3BXVtX
         njrkVDJ/5Xr+CEx7DPOGPKzlOsRThhvpEVQbrF4qDZH1iUJKiglKp+ZROfiNBHioT7sm
         VajOdsevuhNlsWZNDEQJxCFErobp87BUogfRrZ64I8FTZHyPZrCKXdZ33p7AF6A9+aw0
         TOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701749047; x=1702353847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFi1KzwR2YOrUv7jhd8tU8M3SbznND0IRUD4tj9oA8M=;
        b=bCRPgb9yuqnwgwGnRlkIrX5PTQPd6JdW1zXVcAT/ljFNpCLefk5XJp8VtFkpADhU74
         LqIID4YHzMQyFGYL4OcAMz/1jUR2RJQqP4A83H6bXVEK8dMMfXGJEIzhkz1+5aTrrZ+K
         BTO7Fv0Rx39I3pGiTFD/H7Va4ijYJA7WkGYudvL6GtqrXx9w2UnJwortSNRY93bf6kKA
         k9JPauCvx3EeO3RZYxLpk3Cy9wHl5S+G5w4/N3LreavZWB17yiVLifCKH++H0KugAbTV
         LKs63BXYLDV0XLIAUst7ERKLlm+i4yGU0icaeLLNcKBtzLrls+tVwThWAlhKMrTcoBSs
         zBQA==
X-Gm-Message-State: AOJu0Yy4OWdBf032h0QzhYs5SNPm6zKwPH5RkNFc/zzoDbh01i8qatwv
	0+Mlkww4FlGSERNvcWj+Lg2qK/9dT7LxdL9oM+o=
X-Google-Smtp-Source: AGHT+IHlElgymjUGnl2Tt5Nltm4vXZSUCl9EGHfjGEDPwuNWjQ08MgP9Y1yXwxvvpigxSnBa8Ix9uShVCy+CgeBCf8U=
X-Received: by 2002:a17:906:f196:b0:a19:a1ba:8cf1 with SMTP id
 gs22-20020a170906f19600b00a19a1ba8cf1mr3189378ejb.143.1701749047390; Mon, 04
 Dec 2023 20:04:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1701722991.git.dxu@dxuuu.xyz> <d213a6438f7f5db1014f6b41213b71851736d3bc.1701722991.git.dxu@dxuuu.xyz>
In-Reply-To: <d213a6438f7f5db1014f6b41213b71851736d3bc.1701722991.git.dxu@dxuuu.xyz>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 4 Dec 2023 20:03:55 -0800
Message-ID: <CAEf4BzZphyxnjmz+9FdsKst3WuaN7w5bSvX6szXic4gy-wfR_A@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 04/10] libbpf: Add BPF_CORE_WRITE_BITFIELD() macro
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: daniel@iogearbox.net, ast@kernel.org, nathan@kernel.org, andrii@kernel.org, 
	ndesaulniers@google.com, steffen.klassert@secunet.com, 
	antony.antony@secunet.com, alexei.starovoitov@gmail.com, 
	yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev, 
	song@kernel.org, john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, trix@redhat.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, devel@linux-ipsec.org, 
	netdev@vger.kernel.org, Jonathan Lemon <jlemon@aviatrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 12:57=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> =3D=3D=3D Motivation =3D=3D=3D
>
> Similar to reading from CO-RE bitfields, we need a CO-RE aware bitfield
> writing wrapper to make the verifier happy.
>
> Two alternatives to this approach are:
>
> 1. Use the upcoming `preserve_static_offset` [0] attribute to disable
>    CO-RE on specific structs.
> 2. Use broader byte-sized writes to write to bitfields.
>
> (1) is a bit hard to use. It requires specific and not-very-obvious
> annotations to bpftool generated vmlinux.h. It's also not generally
> available in released LLVM versions yet.
>
> (2) makes the code quite hard to read and write. And especially if
> BPF_CORE_READ_BITFIELD() is already being used, it makes more sense to
> to have an inverse helper for writing.
>
> =3D=3D=3D Implementation details =3D=3D=3D
>
> Since the logic is a bit non-obvious, I thought it would be helpful
> to explain exactly what's going on.
>
> To start, it helps by explaining what LSHIFT_U64 (lshift) and RSHIFT_U64
> (rshift) is designed to mean. Consider the core of the
> BPF_CORE_READ_BITFIELD() algorithm:
>
>         val <<=3D __CORE_RELO(s, field, LSHIFT_U64);
>         val =3D val >> __CORE_RELO(s, field, RSHIFT_U64);
>
> Basically what happens is we lshift to clear the non-relevant (blank)
> higher order bits. Then we rshift to bring the relevant bits (bitfield)
> down to LSB position (while also clearing blank lower order bits). To
> illustrate:
>
>         Start:    ........XXX......
>         Lshift:   XXX......00000000
>         Rshift:   00000000000000XXX
>
> where `.` means blank bit, `0` means 0 bit, and `X` means bitfield bit.
>
> After the two operations, the bitfield is ready to be interpreted as a
> regular integer.
>
> Next, we want to build an alternative (but more helpful) mental model
> on lshift and rshift. That is, to consider:
>
> * rshift as the total number of blank bits in the u64
> * lshift as number of blank bits left of the bitfield in the u64
>
> Take a moment to consider why that is true by consulting the above
> diagram.
>
> With this insight, we can now define the following relationship:
>
>               bitfield
>                  _
>                 | |
>         0.....00XXX0...00
>         |      |   |    |
>         |______|   |    |
>          lshift    |    |
>                    |____|
>               (rshift - lshift)
>
> That is, we know the number of higher order blank bits is just lshift.
> And the number of lower order blank bits is (rshift - lshift).
>
> Finally, we can examine the core of the write side algorithm:
>
>         mask =3D (~0ULL << rshift) >> lshift;              // 1
>         val =3D (val & ~mask) | ((nval << rpad) & mask);   // 2
>
> 1. Compute a mask where the set bits are the bitfield bits. The first
>    left shift zeros out exactly the number of blank bits, leaving a
>    bitfield sized set of 1s. The subsequent right shift inserts the
>    correct amount of higher order blank bits.
>
> 2. On the left of the `|`, mask out the bitfield bits. This creates
>    0s where the new bitfield bits will go. On the right of the `|`,
>    bring nval into the correct bit position and mask out any bits
>    that fall outside of the bitfield. Finally, by bor'ing the two
>    halves, we get the final set of bits to write back.
>
> [0]: https://reviews.llvm.org/D133361
> Co-developed-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Eduard Zingerman <eddyz87@gmail.com>
> Co-developed-by: Jonathan Lemon <jlemon@aviatrix.com>
> Signed-off-by: Jonathan Lemon <jlemon@aviatrix.com>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  tools/lib/bpf/bpf_core_read.h | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>

LGTM

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/tools/lib/bpf/bpf_core_read.h b/tools/lib/bpf/bpf_core_read.=
h
> index 1ac57bb7ac55..7325a12692a3 100644
> --- a/tools/lib/bpf/bpf_core_read.h
> +++ b/tools/lib/bpf/bpf_core_read.h
> @@ -111,6 +111,38 @@ enum bpf_enum_value_kind {
>         val;                                                             =
     \
>  })
>
> +/*
> + * Write to a bitfield, identified by s->field.
> + * This is the inverse of BPF_CORE_WRITE_BITFIELD().
> + */
> +#define BPF_CORE_WRITE_BITFIELD(s, field, new_val) ({                  \
> +       void *p =3D (void *)s + __CORE_RELO(s, field, BYTE_OFFSET);      =
 \
> +       unsigned int byte_size =3D __CORE_RELO(s, field, BYTE_SIZE);     =
 \
> +       unsigned int lshift =3D __CORE_RELO(s, field, LSHIFT_U64);       =
 \
> +       unsigned int rshift =3D __CORE_RELO(s, field, RSHIFT_U64);       =
 \
> +       unsigned long long mask, val, nval =3D new_val;                  =
 \
> +       unsigned int rpad =3D rshift - lshift;                           =
 \
> +                                                                       \
> +       asm volatile("" : "+r"(p));                                     \
> +                                                                       \
> +       switch (byte_size) {                                            \
> +       case 1: val =3D *(unsigned char *)p; break;                      =
 \
> +       case 2: val =3D *(unsigned short *)p; break;                     =
 \
> +       case 4: val =3D *(unsigned int *)p; break;                       =
 \
> +       case 8: val =3D *(unsigned long long *)p; break;                 =
 \
> +       }                                                               \
> +                                                                       \
> +       mask =3D (~0ULL << rshift) >> lshift;                            =
 \
> +       val =3D (val & ~mask) | ((nval << rpad) & mask);                 =
 \
> +                                                                       \
> +       switch (byte_size) {                                            \
> +       case 1: *(unsigned char *)p      =3D val; break;                 =
 \
> +       case 2: *(unsigned short *)p     =3D val; break;                 =
 \
> +       case 4: *(unsigned int *)p       =3D val; break;                 =
 \
> +       case 8: *(unsigned long long *)p =3D val; break;                 =
 \
> +       }                                                               \
> +})
> +
>  #define ___bpf_field_ref1(field)       (field)
>  #define ___bpf_field_ref2(type, field) (((typeof(type) *)0)->field)
>  #define ___bpf_field_ref(args...)                                       =
   \
> --
> 2.42.1
>
