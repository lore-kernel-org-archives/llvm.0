Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA76C47279B
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120385; cv=pass; b=NTBeniLmo5iqBQmUsBUCZPxNuwsOs/kyln4OAtSZJQrFOlKL/MZ7Li9HmTPyC+3YQnB2o3zVRbBn+BrLPA/Nm1QxDuPToXSMkjZdBqGl99YjMegbSfZ8IEWWfqIk0kY4XTGk0WaI6C0fRMX+IFR9kZPbh7sd4JqlD6GRG3qu1rM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120385; c=relaxed/simple;
	bh=0JN4eWAeyH1DFvPDOFr1bp0SNGRTw2jc5rqIj+ZsVUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXSUhQLeBG69XvdTxmPaU6V6nr0UKZCNbIY180Y89amllF8VJhL3m9mHMkon0/JPpdr0njwt2K2DXpkY3cw6LAEp3nZbgMHgx1hGSVV+WCPbcRYMdlP68HXuF2ijJ5vOtENEHMh896RH9tRdMAaT64PShJHRCGOnK1NWGVUEXTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZwbTqgSn; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZwbTqgSn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ba180a022dso2085ad.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 09:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779120368; cv=none;
        d=google.com; s=arc-20240605;
        b=LzFIXOiYxkqh/FCe+FVKC5Mtl6jpE2nr9tXfQdVMo34D3SSzZDg2FH09/pebjDHBoW
         pxs0LbeWEHXBM96TSr8o3IXLWuXxPkYhsXGjue7YVwi56i35Nn4+U+dMiHmTcRh6V1+r
         n/t8EvU+bzsodSDS+lh5+A/qcenn8QWhU9+Jfp/eMamgjn5i77bTVIb/NuRnZMfy/TSO
         Vg+m9zgK0ncSVkyHh7rCBust6Eo9ihWVGr3Dwu9ge46sK64OblQZ7iuq+lOAtMcjqbFY
         ftfZqDhDwfbeuXx/9W8tS42pG5IR1kfRJIcJXhUhLrF+0XL8A4kMJJFQOllrzTokS0ym
         TKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        fh=ecWuCLf7CoHYyb7UBfTf01NG6eY/WndzG0pBOt9zBTw=;
        b=JuUFSfHT0L+eqDFkM28g7Jyg7YWBOYWk7h7w3h+RFy3URaxJyrmoD37uq1SZiXbhPB
         unpNPM+XTv2UoeoSDFEnreGlyIKZ5Pdv/BZMwIR3tO2hcXUzcPG5ykbbsoQvUqbTL72Y
         P4avBqp04hz/mAlo1pH6aojh6dE1eZA5IFiC1hwSvBDqzjCX14tn9i12KKauO2AzFKQV
         /tU8hqS3SUd+3XKVheoF+rpaJGkqSXEH2BvuAkz5UEH7Gf+whPrTcNSBM18E8QseVfAZ
         87/8DpSN4bifcWKMCanUSpz/j+LpuSFsHxD/nHwIomwN2BeUOSyDapprtvu4SxLKM5zr
         yvEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779120368; x=1779725168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        b=ZwbTqgSnRcebpB/LX9zbbOiDNyPWwA/AexKdBCiZdZHviEqRzHE4n4xv72Rfwh3/Gg
         /qBbPxVOvJ55+gKo2DSnDAiN6SXrcAASUAEYfRzm6RyQzWZwyiCCjRij3iCll51xszIY
         G24ZTGFqsdJ5fX+iROflQFfreb43xwCIcuVSSgiZz0den1fmOd+qBkms/1bYpdq3plCC
         x6V/0i6I4t86BPnnIRwmsJVbIxzFqy+l469PFN/2jwrW3ezKSqdf93GBL6MHXOQ2qTqF
         g6nPsnZavaX6CpqzStlNsAKgQATQZl2S3mfGm5XVziGYGbqdoOE1LlmHQS460oFZ80w7
         VpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120368; x=1779725168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yL2S/NNFD9uZOxHwjkGhATRbJfyjLUg+vdf0l7wFBI=;
        b=WY2hjs2iTqOEC/EZcUT0BaiapRbr5ZLDOrAIkCG7yPaQ2vhn1xJZ3Agn4KQjrn+3xN
         VisDkvt71i/f49HCS4y0/bkQAg9Ax3Tl6IGTQSz4X9OKdNrhQ/nHVIbxBqh/t2PPVa8T
         uAn9M5GbKcp/O1szGhTcrl8lS6nxB/EVTj1QkkFuEk58pm/KkUaZc5S37Reo2vFQsNVm
         OruWnSgmJeawOB2X1FIyziEyGr10y7WHnVcSibn9wLMkSTP3Dvrdhw0HcMMhadm/4lse
         V/gYQynCQLKA2ZaLPjs9IBwyaSpdsJqFNbxWxZrIeIshYaL7F9Uff1UepEWK9OMxK29d
         olLA==
X-Forwarded-Encrypted: i=1; AFNElJ/pS+L6VwF3/5vd6SckaijJQTjTfAyK0zvqw0ObnoR1kP12mX+6ExM8EY0ZP5un8UuNXk8Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu8sO1RozdZzQ5hSi9npXAQrALfLYsJDXC43zr885R2oMiv9P2
	NJFreAAwfso78sdsRZq4Jzkq3ETVXJHUoihfMQsvglpF8hlAXcK4jPOfJM9Br0XiI8UCk4KqiIO
	sSoNOYf8ypK5NLaks84NZ9th4Ez1CDuOZF7uunmob
X-Gm-Gg: Acq92OGLeI7e4+sjvpgFZ0+9cC+TMSi0T+4UAswMCJbIDMY+/HPRbICRD3Q713ABf7p
	CXz/9OzdvMVHYqPWciGxG3eE0FcSv+RBW+Cj7KBLYfSUlcn5bUX9NHHjiNaM7lkRsYEEcSUBpBg
	qZ2I5CuUA/CB9hiqCMmQdsncCPizYDZwGzvd8pP7vQd5p+JUejofZua55SLUh8jJk8/qBVmYar/
	sciIfP9pJXAktyorqjK4EKWSX8yHBvzsdoGYi/2nhW7OKVO85T/x90xmGtbtc7sJPR5uNr/JEJ3
	w7+pLho6vwE2SWl3mIjS2esuivUbqZ1xIoQbD+0cdCLRLhlK
X-Received: by 2002:a17:902:d2cf:b0:2bd:3c1b:3073 with SMTP id
 d9443c01a7336-2bdb041654emr3259205ad.16.1779120367385; Mon, 18 May 2026
 09:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org> <20260518-james-perf-llvm-version-v2-4-f12cc4f031d8@linaro.org>
In-Reply-To: <20260518-james-perf-llvm-version-v2-4-f12cc4f031d8@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 18 May 2026 09:05:55 -0700
X-Gm-Features: AVHnY4J8ZynnI8bourXp6ojaD0bCqutv1EZpQT8aGfrcInLJ1HrazyPhkbTF28U
Message-ID: <CAP-5=fWmXQEbLg=xGJwQ4s5q5xUZUTdxx2N1K71N0gztZunQrQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] tools/build: Allow versioning LLVM readelf
To: James Clark <james.clark@linaro.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, ihor.solodrai@linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:04=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Documentation/kbuild/llvm.rst mentions that readelf is included in the
> LLVM toolchain, but it's not currently included in this block.
>
> Add it so that LLVM=3D... options also apply to readelf. Users in tools/
> were Perf which was hardcoding it, and another was the BPF makefile.
> Both already include Makefile.include so convert them to use the new
> variable.
>
> It also didn't have the cross compile prefix, so either readelf didn't
> mind opening cross binaries, or it wasn't working for cross builds.
>
> Signed-off-by: James Clark <james.clark@linaro.org>

For the tools/perf/Makefile.perf part of this change.

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks for the cleanup!
Ian

> ---
>  tools/lib/bpf/Makefile         | 8 ++++----
>  tools/perf/Makefile.perf       | 1 -
>  tools/scripts/Makefile.include | 2 ++
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 168140f8e646..180dca9c57c8 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -114,12 +114,12 @@ PC_FILE           :=3D $(addprefix $(OUTPUT),$(PC_F=
ILE))
>
>  TAGS_PROG :=3D $(if $(shell which etags 2>/dev/null),etags,ctags)
>
> -GLOBAL_SYM_COUNT =3D $(shell readelf -s --wide $(BPF_IN_SHARED) | \
> +GLOBAL_SYM_COUNT =3D $(shell $(READELF) -s --wide $(BPF_IN_SHARED) | \
>                            cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*/=
/' | \
>                            sed 's/\[.*\]//' | \
>                            awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {prin=
t $$NF}' | \
>                            sort -u | wc -l)
> -VERSIONED_SYM_COUNT =3D $(shell readelf --dyn-syms --wide $(OUTPUT)libbp=
f.so | \
> +VERSIONED_SYM_COUNT =3D $(shell $(READELF) --dyn-syms --wide $(OUTPUT)li=
bbpf.so | \
>                               sed 's/\[.*\]//' | \
>                               awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {p=
rint $$NF}' | \
>                               grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | so=
rt -u | wc -l)
> @@ -182,12 +182,12 @@ check_abi: $(OUTPUT)libbpf.so $(VERSION_SCRIPT)
>                      "versioned symbols in $^ ($(VERSIONED_SYM_COUNT))." =
\
>                      "Please make sure all LIBBPF_API symbols are"       =
\
>                      "versioned in $(VERSION_SCRIPT)." >&2;              =
\
> -               readelf -s --wide $(BPF_IN_SHARED) |                     =
\
> +               $(READELF) -s --wide $(BPF_IN_SHARED) |                  =
\
>                     cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |   =
\
>                     sed 's/\[.*\]//' |                                   =
\
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  =
\
>                     sort -u > $(OUTPUT)libbpf_global_syms.tmp;           =
\
> -               readelf --dyn-syms --wide $(OUTPUT)libbpf.so |           =
\
> +               $(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so |        =
        \
>                     sed 's/\[.*\]//' |                                   =
\
>                     awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}=
'|  \
>                     grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 |             =
\
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 0aba14f22a06..63276bf55856 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -215,7 +215,6 @@ FLEX    ?=3D flex
>  BISON   ?=3D bison
>  STRIP   =3D strip
>  AWK     =3D awk
> -READELF ?=3D readelf
>
>  # include Makefile.config by default and rule out
>  # non-config cases
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index e81e5b479c56..380ad84ac51e 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -73,6 +73,7 @@ ifneq ($(LLVM),)
>    $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
>    $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFF=
IX))
>    $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SU=
FFIX))
> +  $(call allow-override,READELF,$(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)=
)
>  else
>    # Allow setting various cross-compile vars or setting CROSS_COMPILE as=
 a prefix.
>    $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> @@ -80,6 +81,7 @@ else
>    $(call allow-override,LD,$(CROSS_COMPILE)ld)
>    $(call allow-override,CXX,$(CROSS_COMPILE)g++)
>    $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
> +  $(call allow-override,READELF,$(CROSS_COMPILE)readelf)
>
>    # Host versions aren't prefixed
>    $(call allow-override,HOSTAR,ar)
>
> --
> 2.34.1
>
