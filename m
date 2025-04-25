Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AE1632D9
	for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745599969; cv=none; b=uV5AXTJ3lwHgoOapefFa5+D3g2kRSqm7YRIL1bWTAKGuUfTJ2FOSu8dMLFD+zDDrCYnFhOwti/MvlUoGHKB2R3f/7q2KRmMdpKIC58Yttdw6l08NWTBnYtt4yEd5zctXmTx0/t14nfiMmCL1DbmsJW68A0XmwtJx9UKhP40q9qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745599969; c=relaxed/simple;
	bh=E/6K11Nu1doilIwKesstDitPx1319vRFjJrnwsJWGlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUxBTB2xZq4+fvMnK/BhftYSz+gcCbtrl6A2XUbnczcxFQKiZAQ+usi8HBfT4xNpSkKAIcqcDmoHIwc0kTKp6ORF8NNm8ug2H2xE2qJxzJ0Z4fD6D32gkNQoTChWjH2Jhoapww0fOXWeS1ehO5T6MhT7fmy5984bG61f9vtWtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nB5xOaLq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB5xOaLq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73c17c770a7so3330453b3a.2
        for <llvm@lists.linux.dev>; Fri, 25 Apr 2025 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745599967; x=1746204767; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPE0jw/cbWW6nhWNEm39me5DCK6XBagvczncyZzTTCk=;
        b=nB5xOaLq85zAlusl+26CDcoY4/n8vcdZZ7B7hmeSmoBsCRr3s8MOR8YZdqcZMDJ2kg
         EWbTzHXXnp8Nt4jGHNg7guoGR/CvbO6q/kN01OVopmQs5xKo2HYG+/cuaPSBNcUbyhbG
         RdojS976eh6dpNs6HOx/hbuV3q1nclFrJ9uzFKDz/Giq6G4PC8tRJS48br8LYcSwaunY
         S2TDFRjfHLdRNOG+tftk9NaAZW/Ncc/zJG1m0VPdGPkXHUJqVWmjicOWcK3p+GJTVnCQ
         c372l7lOeTRGnokIp9C1RCwcvrLqi+VmRB+BTJmuIXES4lFgqmlYnv0MvJBLyXAR5T3f
         eKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745599967; x=1746204767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPE0jw/cbWW6nhWNEm39me5DCK6XBagvczncyZzTTCk=;
        b=VoT90Lrr00wcGIi79prG8kcrH6LjQD0n6l4aEXMoKaDf/faa5RHdGLzXbXs0O8LivS
         JVcB41Qin/OOAx6YANncCEzfGGRYM98wo8SQ0PbgW7x7Gof47azvTrgcal28xcPkEoJY
         Oc6uip2Wv+v2Du23Bc3D+RXyEJD2UJgkLT0jhNwqq5koM9pFjXdS/Upv77lJc8TJe1ca
         nh+hmAbP0OdxiuWd9rt5cdpJr8B+X0rfER/JpS44cPl00EGtu/e/N6nFHNCtI3LpVd0n
         KYl0D/XCZwyA07Z9hCSTYMhNlrQmV4pYj5WnN9b9Etul7GxMerv8Dim5bkPjVDkUxPSL
         OrcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlD44v6E4gzAdvkDqn9bA5c5NoIZznjO8b/pdgEc3t/B6PlWGE4lTDS0ja/lMOXpibCkCu@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm/zX5O3TbaeDUptqU1vv7s3ft+flAnE3IhUVuiX0HKr2T4Dnm
	LdWnZblhV01NEZbAvXwg6Y4eSwndE+0cSJTobEExYkOuK5QgGu77zjugbmHX/t1dTFbof3QGFAa
	OW9ed7r2RQc8mBg+/FEXKn/o+jxg=
X-Gm-Gg: ASbGncvPtYUUkGV411RACqUcecutjRktjZYHDsyVXhi7R2tyTQGfOXWgCFYUBt65zOd
	tzoVLRXBAhLUz3MFd88JwxKlUWLQ3aHHdjXdGzIHD/RA9rXjB7R/teEIg9aMx+DgzyjaElk3UUa
	r//IG0vJtuw6zp5YSNou8Zv4waR0/tXmDbvI3J4aBB53C/nhJt
X-Google-Smtp-Source: AGHT+IHsE4tpFV00HDt6z5NOiZdy4xqMC2tQ7aGg3Q1NBqpL8kEB1l+fIJtawgH16A553JEcLhActfPM/+fohqK2riQ=
X-Received: by 2002:a05:6a21:4002:b0:1f5:931d:ca6d with SMTP id
 adf61e73a8af0-2045b6ae067mr4051413637.1.1745599967202; Fri, 25 Apr 2025
 09:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425095042.838824-1-jianghaoran@kylinos.cn>
In-Reply-To: <20250425095042.838824-1-jianghaoran@kylinos.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 25 Apr 2025 09:52:34 -0700
X-Gm-Features: ATxdqUEVCDIzlgDehq91RGcWZVxbp-q_nLVPhO7lnNt562E0ZXlBsA1KFWVfwvI
Message-ID: <CAEf4Bzabjf68a-bP1RuHUEAdiz0MuWuyS5w+nZagEOHesDQgpQ@mail.gmail.com>
Subject: Re: [PATCH] samples/bpf: Fix compilation failure for samples/bpf on
 LoongArch Fedora
To: Haoran Jiang <jianghaoran@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, daniel@iogearbox.net, ast@kernel.org, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, bpf@vger.kernel.org, 
	llvm@lists.linux.dev, chenhuacai@kernel.org, yangtiezhu@loongson.cn, 
	zhangxi <zhangxi@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 2:51=E2=80=AFAM Haoran Jiang <jianghaoran@kylinos.c=
n> wrote:
>
> When building the latest samples/bpf on LoongArch Fedora
>
>      make M=3Dsamples/bpf
>
> There are compilation errors as follows:
>
> In file included from ./linux/samples/bpf/sockex2_kern.c:2:
> In file included from ./include/uapi/linux/in.h:25:
> In file included from ./include/linux/socket.h:8:
> In file included from ./include/linux/uio.h:9:
> In file included from ./include/linux/thread_info.h:60:
> In file included from ./arch/loongarch/include/asm/thread_info.h:15:
> In file included from ./arch/loongarch/include/asm/processor.h:13:
> In file included from ./arch/loongarch/include/asm/cpu-info.h:11:
> ./arch/loongarch/include/asm/loongarch.h:13:10: fatal error: 'larchintrin=
.h' file not found
>          ^~~~~~~~~~~~~~~
> 1 error generated.
>
> larchintrin.h is included in /usr/lib64/clang/14.0.6/include,
> and the header file location is specified at compile time.
>
> Test on LoongArch Fedora:
> https://github.com/fedora-remix-loongarch/releases-info
>
> Signed-off-by: Haoran Jiang <jianghaoran@kylinos.cn>
> Signed-off-by: zhangxi <zhangxi@kylinos.cn>
> Change-Id: I5fca6f0cee21e429982c5a3865efc5afeb3fa757
> ---
>  samples/bpf/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

applied to bpf tree, thanks

> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 3fa16412db15..927d72659173 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -392,7 +392,7 @@ $(obj)/%.o: $(src)/%.c
>         @echo "  CLANG-bpf " $@
>         $(Q)$(CLANG) $(NOSTDINC_FLAGS) $(LINUXINCLUDE) $(BPF_EXTRA_CFLAGS=
) \
>                 -I$(obj) -I$(srctree)/tools/testing/selftests/bpf/ \
> -               -I$(LIBBPF_INCLUDE) \
> +               -I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
>                 -D__KERNEL__ -D__BPF_TRACING__ -Wno-unused-value -Wno-poi=
nter-sign \
>                 -D__TARGET_ARCH_$(SRCARCH) -Wno-compare-distinct-pointer-=
types \
>                 -Wno-gnu-variable-sized-type-not-at-end \
> --
> 2.25.1
>
