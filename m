Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809A2F5A01
	for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 22:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110616; cv=none; b=SIjuhjY8JMMbp9Ln9/OtqK6aftbp9hRV0RzLXkJo5Gjd1dmxi7MbMsdWkQvTi/Ojq8+8V5tuKL4O9mLbK9UOg7a5N+zpL8Z8TWJaDcXCkGFH4lJsaZ+RWvlFjPK/nsZKavEQV+v/VaK51z9pCl1AkkjxsQ2eVvYZiUR5rSyzTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110616; c=relaxed/simple;
	bh=/Nhl3mIYXGJHHFjg3EygYmeUeSdJR0DpH9MQd/PCEXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pg19WPFtGyxP3n4dO60+tfTS6hu+vZ6adHnmY6UwV1PJniS6nCnKzYtph9YmT6JRSPRfUSvNNPanuQ8XkVlFJEKSflfkcBVK+lm8KkaLd2Mopswr+sQvmiguT7mL5OF6gFFNoOfijJiT6/RV/WOe3tjswry/miOQsV+rgbAeOHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncjjpsp9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncjjpsp9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29558061c68so80902545ad.0
        for <llvm@lists.linux.dev>; Tue, 25 Nov 2025 14:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110613; x=1764715413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVMrUcori1mIamaeJyLOiP2EJku4pRClbvk7rP/G8rw=;
        b=Ncjjpsp96KoT9L1PGUJ3sfWJv175Cp66jOzQMtu9q8RJU6zzNvh02ZQ8Yagea5hiOe
         e1x5UXP9fbaOAphHOIwueYXqAj1nVaWdxdIALzfADfZfMVthV+0AhEVPwNR9RozMvj+C
         pQTrqHKNRUA1LXnziJsk8D3bvokYH+8u15GU1jCx9FfAanu1A/5hNgs9pD/PhdwPfDli
         BThTZlrXzPp1nkd40JPTwn7mb0RUyBt6j3I8IvQ1+ozm7N/dTVucpFXnuB8pah4sdgW6
         rCToMkdrmp9sUjaNsw0PMq0H0TJZQBV7BMOTNEQ140eIrQ0EhAfEbwkVeAgVe2nSIzz7
         UO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110613; x=1764715413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cVMrUcori1mIamaeJyLOiP2EJku4pRClbvk7rP/G8rw=;
        b=BVD7uwZ1d3EvPxsVnke3izIRtx1G73WA55Ilxr0okCBX4XqmTmMOS7SSNQDeU5YgQG
         246AX3Sp9YfFxFJHGQ3zgvSs5tRpS/Ry9MrDO3JRqAgqjvoiyr7zvwjGA8o4S491NYWc
         Dn8ftYkcxfKCMFE3KfkKIdPLJFB8xQcVm+lh9lMFP2CQGlhteIOa0YuctxU2ZlDQn52P
         iiRiR1er6mw6Aym4hJlSluIzviIGrUyxKHjIiFfyqcSCMUGOhvou/DfOkZI1W+sFRxdT
         uEYdGAbd9N67Q1Y0rca+0q729SsRhhcg1SgC7WC/yePx0FVq29bzg0KaNr55az7wxChD
         fRFA==
X-Forwarded-Encrypted: i=1; AJvYcCUZUMRZLV6KIm2v02vpmXlpnRL0bN7MGjZs2i2q6ECcg4QoMEXkwuUOAtenKOHAOEt0xVu5@lists.linux.dev
X-Gm-Message-State: AOJu0YxyWW636MLKBsufCTmEJdDrxR9nAuK5icKngt90BodGdCDNZNHR
	oWXIumwVjeDIYxNSzr/JD3PKXl3q4dwH5sYuuOx/V4hqEEVAi3U71ymKT2bnpduxxShNOO2vWC4
	Z6XCrnJpqgY8j432TdMOCcfjbclGB0Ro=
X-Gm-Gg: ASbGnctGbEeCO2j6IiiXuTI+cfK+eEU1DXXNYPvgTJNFoC1vpucEcj5lR7B6gv1Cfqd
	CV3700RkSt2V/rz7Y/lOZZh/i/GSqpvV+/A7o4wVSsICnGJpWNtCWI2/iCYZskBuKlchkX7pjv0
	cNTw7Gp3j6I2dY5s/GwvlQwD1jHxlaSMwCe8CsjaG/J5vUy7lHIvz4m+QUxqLrF25R/OelkZzj8
	mtS50oGeayyo7rr0WylmHTE0OIObMxE7Yt39xa4M44u7Vhecswv4yU1+lO+dnk+OrWKA15GGLoR
	aeknUPRJz6I=
X-Google-Smtp-Source: AGHT+IEIXW0bJtFY6fBiBfGeQC5yH/czaAj2wo9rlJL3fHEdtl/Tr3I/+PPIwGRCv6tUVuOs4JGXiZrhojYZTOuidXU=
X-Received: by 2002:a17:90b:4b84:b0:340:ba29:d3b6 with SMTP id
 98e67ed59e1d1-34733e6c89fmr17055678a91.6.1764110613389; Tue, 25 Nov 2025
 14:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119043739.1860428-1-hoyeon.lee@suse.com>
In-Reply-To: <20251119043739.1860428-1-hoyeon.lee@suse.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 25 Nov 2025 14:43:20 -0800
X-Gm-Features: AWmQ_bnRM1RtbO-FP8JP9v9A4ffp0WSyeJFZokaOzGcZKQJuatArGzGeKGqHx-s
Message-ID: <CAEf4Bzbjbd-_3d2rpL1D72hngwNbSAbyPQDOn9fv0X4zpEcCCw@mail.gmail.com>
Subject: Re: [bpf-next] selftests/bpf: propagate LLVM toolchain into
 runqslower sub-make
To: Hoyeon Lee <hoyeon.lee@suse.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 8:38=E2=80=AFPM Hoyeon Lee <hoyeon.lee@suse.com> wr=
ote:
>
> The runqslower build invokes a nested make, but the selected LLVM

I think runqslower in kernel repo has long since served its purpose.
There is no point in maintaining its Makefile. The tool itself lives
in BCC repo. Its original purpose was to show real-world BPF-based
tooling end-to-end setup and implementation. BPF, libbpf, entire BPF
ecosystem has evolved and grown, I think we can remove runqslower now.
Do you mind just sending a patch dropping it instead?

pw-bot: cr


> toolchain (via LLVM=3D-<version>) is not propagated. This causes the
> sub-make to call the system-default 'clang' and 'llvm-strip' even when
> a specific LLVM version is intended.
>
>     # LLVM=3D-20 V=3D1 make -C tools/testing/selftests/bpf
>     ...
>     make -C tools/bpf/runqslower ...
>     clang -g -O2 --target=3Dbpfel -I... -c runqslower.bpf.c -o runqslower=
.bpf.o && \
>           llvm-strip -g runqslower.bpf.o
>     /bin/sh: 1: clang: not found
>
>     (expected: clang-20 and llvm-strip-20)
>
> Propagate CLANG and LLVM_STRIP to the sub-make to ensure LLVM version
> consistency across all builds.
>
> Signed-off-by: Hoyeon Lee <hoyeon.lee@suse.com>
> ---
>  tools/testing/selftests/bpf/Makefile | 1 +
>  tools/testing/selftests/lib.mk       | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 34ea23c63bd5..79ab69920dca 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -306,6 +306,7 @@ endif
>
>  $(OUTPUT)/runqslower: $(BPFOBJ) | $(DEFAULT_BPFTOOL) $(RUNQSLOWER_OUTPUT=
)
>         $(Q)$(MAKE) $(submake_extras) -C $(TOOLSDIR)/bpf/runqslower      =
      \
> +                   CLANG=3D$(CLANG) LLVM_STRIP=3D$(LLVM_STRIP)          =
          \
>                     OUTPUT=3D$(RUNQSLOWER_OUTPUT) VMLINUX_BTF=3D$(VMLINUX=
_BTF)     \
>                     BPFTOOL_OUTPUT=3D$(HOST_BUILD_DIR)/bpftool/          =
        \
>                     BPFOBJ_OUTPUT=3D$(BUILD_DIR)/libbpf/                 =
        \
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib=
.mk
> index a448fae57831..f14255b2afbd 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -8,6 +8,7 @@ LLVM_SUFFIX :=3D $(LLVM)
>  endif
>
>  CLANG :=3D $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
> +LLVM_STRIP :=3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
>
>  CLANG_TARGET_FLAGS_arm          :=3D arm-linux-gnueabi
>  CLANG_TARGET_FLAGS_arm64        :=3D aarch64-linux-gnu
> --
> 2.51.1
>
>
