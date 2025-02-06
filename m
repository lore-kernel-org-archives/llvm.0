Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6373B7A8
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 00:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803069; cv=none; b=YYudxZC7jlXGn0LHYlYqRhMfEEmEtAvgWlfX7jEb0BdMdPfrb83K4FT0J29bFDUg+fJKX5HLZfY8oyawuGwBUhKzzcVkObNts/LOlH7BNQ8G2P7aCfu+12GZxiY9P1sO85R5+FJbBTd24h0Ybx6NkVm0Ml/eIuBXDecVeuw7BYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803069; c=relaxed/simple;
	bh=0iL3E4VG0qImG8S0CCPnqbyKDS9qsWKgPru9TE81B6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2ZufH+FTvdNYbzRfiqibWPS4+Yvn7vAR1t9SpUczDvIPdXHaAhZKsagKPwcfJoZcTFAOUa+3XC5ws7oWcqO393vOBxApSxHbwB0qS5lWcejAAylgES0C51oXPsRF4NOZ9QLnt5C0PY8ZILdYqKOHvXcWL4YxxObWbq2Y67b+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIagN/qV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIagN/qV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9f5caa37cso1377177a91.0
        for <llvm@lists.linux.dev>; Wed, 05 Feb 2025 16:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738803067; x=1739407867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4/keD5s03/Kq1V0kQTivHig4tZxw6U4TktrhJfP4+g=;
        b=cIagN/qVDrTcD48/+0DM+1lkY6xPD6Fi2u9PB2R7G5LXSeOeNfbyqypGRtM5FQFp8a
         Jtm8lORSPUs8GiwXKUOqN3meG4189vm6bvkbo8lRwFpYaP6MdI2Yz0HzD9sacZJhVXsl
         uQY1ID1TpNUN3xsK2qe27yrQyXNLj17QZ8DwaqjCvbF9A8bfHJZl9+m0DS5FbCdjPBnT
         XvizGLDneOvAQl1CA1t10PfwwNge+TyxlkZ0bxmAZNW80YXuecxvFHK+PFDSCoRdDsMm
         orKNGL5CGgDuoVv8Y/uVeVPNtCI2sOPhcSpuG7gdoHf64XyfmGfA9aG9RoOUccN3UZV1
         yvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803067; x=1739407867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4/keD5s03/Kq1V0kQTivHig4tZxw6U4TktrhJfP4+g=;
        b=TLsw3UK/Ovzz769XIzhIWnUFON9+fpaEu6RvoI6R8ehKRxxCi0kp9MsihEF3BXNuEW
         IKLYe8RUXf+Eoe5i3r1ASmWLnjNbce0KnMU8Lg70l8fQc8XIOZya7HisKpFR7Nf7sQON
         dcmho14nqg2LQFpqFOQXIQnaz4gTSp+9sGLvZuX/qoX1LdSZFd1UrpfN5mNCwXyUyMpH
         ScTP74g+c1jov9H6g92ePCEYDMGe1Vvr2IgcqNq/WdOfnjOh3EoszWnfqhxyVFwCoIee
         gDM6m+VjXJWJZWCELZ4h+yKKhZzxIi/UFw5c/DAjRSO81XVr3MRgMwP+CkeJFahPvDiT
         EeTA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFyRH3zFF5apz3rkOLdt49pIMN4jg5zhLY22bVuSvIIWy/uFkQbE2CBOWZwVwLEROihRB@lists.linux.dev
X-Gm-Message-State: AOJu0YzXwtiUeAINOxyhhhZ9gQJsUHlPP1DoFsuD+ynTrvhzdemjhJKk
	+wuXIfoivCWz17/O0/PwhakydlP6Pywm9x75G9sSBEn+D3A3mfUiK9Xo3ifM+tjjD/9+WLAynGR
	ZPN+bUo9D22ZjmVLhBA5k4PKSQYI=
X-Gm-Gg: ASbGncuY1t1jAG8NoLBLWAiWUFBhMklXe8GNgpqu8oBeEaObucJplj4ZSG409TGDkGP
	N95lOxkcX06Rphk2Dde3e3OpIgJM8TinTNhy/ZdDhZzjB2NQNIxs/cqYLVhZx5mCo5k64dXMF/N
	jnYMueUiTJg5ww
X-Google-Smtp-Source: AGHT+IEM4edWMzxCplFBh9oI0xtCLtQLZ0y5dDP0e13Ujh/dgE6X3ojtv5NwWVk+GEEYMJadgwFWheoCJuIN3yavqGM=
X-Received: by 2002:a17:90b:3b41:b0:2f7:4c7a:b5f with SMTP id
 98e67ed59e1d1-2f9ff786427mr2440811a91.2.1738803066751; Wed, 05 Feb 2025
 16:51:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <872b64e93de9a6cd6a7a10e6a5c5e7893704f743.1738276344.git.dxu@dxuuu.xyz>
In-Reply-To: <872b64e93de9a6cd6a7a10e6a5c5e7893704f743.1738276344.git.dxu@dxuuu.xyz>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 5 Feb 2025 16:50:52 -0800
X-Gm-Features: AWEUYZlmr6_GyGpRgTJA_Eakh3HYUq6e5lgl1acOQWCLsgKBEHoiIcewOpigSbQ
Message-ID: <CAEf4BzbHQ6WajDTAWHmjvA2FaAQz37sd8RwFY9ysKK7D+uc_=A@mail.gmail.com>
Subject: Re: [PATCH] selftests: bpf: Support dynamic linking LLVM if static
 not available
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: shuah@kernel.org, andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, 
	nathan@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, 
	mykolal@fb.com, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 2:34=E2=80=AFPM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> Since 67ab80a01886 ("selftests/bpf: Prefer static linking for LLVM
> libraries"), only statically linking test_progs is supported. However,
> some distros only provide a dynamically linkable LLVM.
>
> This commit adds a fallback for dynamically linking LLVM if static
> linking is not available. If both options are available, static linking
> is chosen.
>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> ---
>  tools/testing/selftests/bpf/Makefile | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>

Note, we expect [PATCH bpf-next] as subject prefix and "selftests/bpf:
" prefix for BPF selftest-related patches. Please help with
consistency. I fixed it up while applying.

> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 6722080b2107..da514030a153 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -184,9 +184,14 @@ ifeq ($(feature-llvm),1)
>    LLVM_CONFIG_LIB_COMPONENTS :=3D mcdisassembler all-targets
>    # both llvm-config and lib.mk add -D_GNU_SOURCE, which ends up as conf=
lict
>    LLVM_CFLAGS  +=3D $(filter-out -D_GNU_SOURCE,$(shell $(LLVM_CONFIG) --=
cflags))
> -  LLVM_LDLIBS  +=3D $(shell $(LLVM_CONFIG) --link-static --libs $(LLVM_C=
ONFIG_LIB_COMPONENTS))
> -  LLVM_LDLIBS  +=3D $(shell $(LLVM_CONFIG) --link-static --system-libs $=
(LLVM_CONFIG_LIB_COMPONENTS))
> -  LLVM_LDLIBS  +=3D -lstdc++
> +  # Prefer linking statically if it's available, otherwise fallback to s=
hared
> +  ifeq ($(shell $(LLVM_CONFIG) --link-static --libs &> /dev/null && echo=
 static),static)
> +    LLVM_LDLIBS  +=3D $(shell $(LLVM_CONFIG) --link-static --libs $(LLVM=
_CONFIG_LIB_COMPONENTS))
> +    LLVM_LDLIBS  +=3D $(shell $(LLVM_CONFIG) --link-static --system-libs=
 $(LLVM_CONFIG_LIB_COMPONENTS))
> +    LLVM_LDLIBS  +=3D -lstdc++
> +  else
> +    LLVM_LDLIBS  +=3D $(shell $(LLVM_CONFIG) --link-shared --libs $(LLVM=
_CONFIG_LIB_COMPONENTS))
> +  endif
>    LLVM_LDFLAGS +=3D $(shell $(LLVM_CONFIG) --ldflags)
>  endif
>
> --
> 2.47.1
>
