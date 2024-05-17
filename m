Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E2C12FB0D
	for <llvm@lists.linux.dev>; Fri, 17 May 2024 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715988799; cv=none; b=DDORQRj/sCfXOoNUwfNpLatSxvBU1M3cjzyK6e+TvcSV4kHM4YnWwFzwayr499QJTYczV0Vqf+OtTU2/5gHXIPrpd+22JEkE1iDTtuGxbPLDHo2zuMEyADlMGtesDTpWC+BEOblslCTv9Z/Gsi7wyKwZCSCW1gYfQBcyI1s+rR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715988799; c=relaxed/simple;
	bh=6E7a1R54O4oY/Bv3V3I/b/LpPkVXPb2htFKqeLsOJQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiAAMrRse7w/ES3SLqFZ79R6uTPcgH43T22LwaDgS1OLfr7JOYRi3cg9CA/t1/ytWQQ90/Cz97+LGQHGw15Vivll8coOSxFtYrSOZEQl57Dnu0eykO56yW3g9joOwuN+FdurblKaPc0Uqs1NFXr1tZXlUR41sRDh2tEtA2ItS4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xa8znnrs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xa8znnrs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-351d4909711so348926f8f.1
        for <llvm@lists.linux.dev>; Fri, 17 May 2024 16:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715988795; x=1716593595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qy5GA9CL6efAYNR6rsn4txm+1VlWlDb+jy2cujQvFME=;
        b=Xa8znnrsn/Uz/+3AJ3Jl/iFRB1HhnZzu2Ru2/CgSykRLrWQszOHaAq8S2S9UvX/JP+
         krjR9qrItgt+X+wpyChAWpGayT1fuFpl2zLGg3O22ElkpKVbKn4AGzV3MVGX4wV73XWm
         cgwym+jrvq7+X9bxcWi0+0DbkQC8/VIztRJb3XNwauNnFMh3twTBkYA/hMc+jyEbWWSJ
         AvUZenMRFAsWBJ0wSQQJdhCwMiCqGAW91+FnD3dQqXjI4MsMBRDjUfmduhOq1EyC7GMS
         Bhp/kTgz54efTqOKbtoNV7iopDLj2J33w8Fzql3iRMOqOnwFpwPZzrRMlRq0/0iHJFB7
         Lvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715988795; x=1716593595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qy5GA9CL6efAYNR6rsn4txm+1VlWlDb+jy2cujQvFME=;
        b=NRKz+HucTDwJhKa3xxUdb+/gTvT0uNDCoqCQRJR8P1/X8Fyv2sC4m8NTUcUpV0X2e/
         TWnS0q7Ef4/6/JLcra2TezePEfg4okPG0GSLDFHeTTZkbTkZ+OuGSUjl4WimCUuvB8SX
         2dAQ2N6d5Sz3vz7FVp34ubOz9TkilGtE0IKVfGWVrjc/Y3i0C7bLbFYf6UrbLbSvYDh7
         6ZqBuglAPsDDDPmiDbxflpTodxYtT6S0qtlyTVYVqTx7aHE87st5di9ZQMEgO01U5BDC
         6RoNEz5MUP1GwRkiVJEQ3Ded1VcIH1vA8vnlX8vAtAQ+xgrjYbtsdo7nqnX5FafOmlpK
         DMZg==
X-Forwarded-Encrypted: i=1; AJvYcCUk+1KKolQsObDx6kzLKOHM7rFPH4+9LKZoyQGVYLwOpUa+0I4z13WRh8lM5YkNxGcVIJUNfICJTk34mGdWStOWR9nLJQ==
X-Gm-Message-State: AOJu0YyXFATn0p31ib0Dto6/BGnM2xHiA25wb4SgcH532ooIOKDipqo2
	1ZpdZTyZ5272MTci0vlisJyjEV029c8m+I4R2pKTwHvVBzaiGsf3nUd1tZ1/l5VCDgfZl7l8rHj
	VWa5uLHBSz+saPXI3QkjMZRY2XlrIXY9Y
X-Google-Smtp-Source: AGHT+IFkvtdpZQ7uzEvzJEF1GhJfoeLNWA35B9P6yCrzkpFHgHgdYb8Apw1NgA9K6XxflUZUV0/k/R3PENWBVmlX+kE=
X-Received: by 2002:a05:6000:e50:b0:34a:6fac:6dab with SMTP id
 ffacd0b85a97d-354b8dfddc1mr333994f8f.12.1715988794866; Fri, 17 May 2024
 16:33:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABWYdi0ymezpYsQsPv7qzpx2fWuTkoD1-wG1eT-9x-TSREFrQg@mail.gmail.com>
In-Reply-To: <CABWYdi0ymezpYsQsPv7qzpx2fWuTkoD1-wG1eT-9x-TSREFrQg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 17 May 2024 16:33:03 -0700
Message-ID: <CAADnVQ+YXf=1iO3C7pBvV1vhfWDyko2pJzKDXv7i6fkzsBM0ig@mail.gmail.com>
Subject: Re: bpftool does not print full names with LLVM 17 and newer
To: Ivan Babrou <ivan@cloudflare.com>
Cc: bpf <bpf@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 2:51=E2=80=AFPM Ivan Babrou <ivan@cloudflare.com> w=
rote:
>
> Hello,
>
> We recently bumped LLVM used for bpftool compilation from 15 to 18 and
> our alerting system notified us about some unknown bpf programs. It
> turns out, the names were truncated to 15 chars, whereas before they
> were longer.
>
> After some investigation, I was able to see that the following code:
>
>     diff --git a/src/common.c b/src/common.c
>     index 958e92a..ac38506 100644
>     --- a/src/common.c
>     +++ b/src/common.c
>     @@ -435,7 +435,9 @@ void get_prog_full_name(const struct
> bpf_prog_info *prog_info, int prog_fd,
>         if (!prog_btf)
>             goto copy_name;
>
>     +    printf("[0] finfo.type_id =3D %x\n", finfo.type_id);
>         func_type =3D btf__type_by_id(prog_btf, finfo.type_id);
>     +    printf("[1] finfo.type_id =3D %x\n", finfo.type_id);
>         if (!func_type || !btf_is_func(func_type))
>             goto copy_name;
>
> When ran under gdb, shows:
>
>     (gdb) b common.c:439
>     Breakpoint 1 at 0x16859: file common.c, line 439.
>
>     (gdb) r
>     3403: tracing  [0] finfo.type_id =3D 0
>
>     Breakpoint 1, get_prog_full_name (prog_info=3D0x7fffffffe160,
> prog_fd=3D3, name_buff=3D0x7fffffffe030 "", buff_len=3D128) at common.c:4=
39
>     439        func_type =3D btf__type_by_id(prog_btf, finfo.type_id);
>     (gdb) print finfo
>     $1 =3D {insn_off =3D 0, type_id =3D 1547}
>
>
> Notice that finfo.type_id is printed as zero, but in gdb it is in fact 15=
47.
>
> Disassembly difference looks like this:
>
>     -    8b 75 cc                 mov    -0x34(%rbp),%esi
>     -    e8 47 8d 02 00           call   3f5b0 <btf__type_by_id>
>     +    31 f6                    xor    %esi,%esi
>     +    e8 a9 8c 02 00           call   3f510 <btf__type_by_id>
>
> This can be avoided if one removes "const" during finfo initialization:
>
>     const struct bpf_func_info finfo =3D {};
>
> This seems like a pretty annoying miscompilation, and hopefully
> there's a way to make clang complain about this loudly, but that's
> outside of my expertise. There might be other places like this that we
> just haven't noticed yet.
>
> I can send a patch to fix this particular issue, but I'm hoping for a
> more comprehensive approach from people who know better.

Wow. Great catch. Please send a patch to fix bpftool and,
I agree, llvm should be warning about such footgun,
but the way ptr_to_u64() is written is probably silencing it.
We probably should drop 'const' from it:
static inline __u64 ptr_to_u64(const void *ptr)

and maybe add a flavor of ptr_to_u64 with extra check
that the arg doesn't have a const modifier.
__builtin_types_compatible_p(typeof(ptr), void *)
should do the trick.
