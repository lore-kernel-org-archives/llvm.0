Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F177916419
	for <llvm@lists.linux.dev>; Fri, 15 Dec 2023 21:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaCPGOmK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54c5ed26cf6so1317942a12.3
        for <llvm@lists.linux.dev>; Fri, 15 Dec 2023 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702675170; x=1703279970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mxcQ8U3h2VEOqJmIa1ew38QPU2ZNWsAXvnsDdFpYNk=;
        b=uaCPGOmKqyHjF19/SKiZjTOkHE7damCqaZHnGKuyVEUcugYuev/eM77G/s/AOXUGgD
         bXf/B4Qg+EMCM8zoyB0Gwq2V5D9lFMi+7dV79Q+N0/qrQ3aHEILuuaiYIVUM90cm2bU1
         JFUZwmaHoZIcbGCEeCH5m2dl8RlY66WDG128yQvKJ35CGCtoStqhHHEFT5a/KI8hSg7Y
         oP5jhsOVWH6DI3tHcCFSmrlQFBwLHMK25UYg/21q4PjP1zWQveeSF/WTaoPqi5GFL8jJ
         Srf4dcqkj1vdEiE/qIDga+C7uh+J5FeLaEYVgXk2Xy1xfvHfxeus6fmrdviMdvm/PuEU
         nxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675170; x=1703279970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mxcQ8U3h2VEOqJmIa1ew38QPU2ZNWsAXvnsDdFpYNk=;
        b=ZKpw+y2CrrTGVdfitWsmkil1Gg+HHx1+tUDikxO0AzgpzgtCbe5oGkfUSSFA3QwH8j
         U/8+kW0NEzOKZs4hUzPTdWpbceeAEhgQepubtVHKTAdTTA/mOMLUyLPKe/q3VXsYu7Zo
         TmgCR4ZcHE1kUN0Y3VPoi55mow3pR9EUqYfaQ7DbDJGveDJXT6VAr6SNxeD816dAlroM
         qcWHkWW479uuc+ybVxs74PC43LofITZenFO1w6ekRBSXSsYOUv9EB5M2S1yMbF2Qd19r
         pyJ3FYx1pOdhVVUdahadEo61i/cB/pwDkWxOx5c/bpIuNU78yNvbTe88IE98XlllBAnG
         kV9A==
X-Gm-Message-State: AOJu0YzbtNFUS+SA+T8rrbl5+Y380rwR7StoOoM21imCsbOb5M2qUGqH
	m+OCQ2k3I7GSjI3AYXwldpxaWVH6fBU4s4r3zZbAWA==
X-Google-Smtp-Source: AGHT+IGWvGafUSlhGGXrv1hh40ziXnG3b+EtYKBvhRhUWYc2aqT1+gDxNub/ucJABTu5gCVtHtP+ylscuPXvzxMb7IU=
X-Received: by 2002:a50:8d50:0:b0:552:e8c3:95a7 with SMTP id
 t16-20020a508d50000000b00552e8c395a7mr409698edt.27.1702675170229; Fri, 15 Dec
 2023 13:19:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
In-Reply-To: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 15 Dec 2023 13:19:18 -0800
Message-ID: <CAFhGd8pweTJJU7=iSqXbvSW79fL54B_aLpzwW3nxJ62=UA0b+A@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 15, 2023 at 10:27=E2=80=AFAM Elliot Berman <quic_eberman@quicin=
c.com> wrote:
>
> When using LLVM as the compiler, decode_stacktrace should also use
> llvm-addr2line. Check if LLVM is set and add the appropriate
> suffix/prefix.
>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

I tried it out by dropping a random dump_stack() call into the init
phase of the kernel and redirecting the serial console output to a log
file. Using the pre-(this patch) and post-(this patch) script yields
good stack trace results. It seems llvm-addr2line is a drop-in
replacement.

Tested-by: Justin Stitt <justinstitt@google.com>

>  scripts/decode_stacktrace.sh | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/decode_stacktrace.sh b/scripts/decode_stacktrace.sh
> index 564c5632e1a2..189b00f4e120 100755
> --- a/scripts/decode_stacktrace.sh
> +++ b/scripts/decode_stacktrace.sh
> @@ -16,6 +16,16 @@ elif type c++filt >/dev/null 2>&1 ; then
>         cppfilt_opts=3D-i
>  fi
>
> +if [[ "${LLVM}" =3D=3D "1" ]] ; then
> +       addr2line=3D"llvm-addr2line"
> +elif [[ "${LLVM}" =3D=3D */ ]] ; then
> +       addr2line=3D"${LLVM}llvm-addr2line"
> +elif [[ "${LLVM}" =3D=3D -* ]] ; then
> +       addr2line=3D"llvm-addr2line${LLVM}"
> +else
> +       addr2line=3D"${CROSS_COMPILE}addr2line"
> +fi
> +
>  if [[ $1 =3D=3D "-r" ]] ; then
>         vmlinux=3D""
>         basepath=3D"auto"
> @@ -169,7 +179,7 @@ parse_symbol() {
>         if [[ $aarray_support =3D=3D true && "${cache[$module,$address]+i=
sset}" =3D=3D "isset" ]]; then
>                 local code=3D${cache[$module,$address]}
>         else
> -               local code=3D$(${CROSS_COMPILE}addr2line -i -e "$objfile"=
 "$address" 2>/dev/null)
> +               local code=3D$(${addr2line} -i -e "$objfile" "$address" 2=
>/dev/null)
>                 if [[ $aarray_support =3D=3D true ]]; then
>                         cache[$module,$address]=3D$code
>                 fi
>
> ---
> base-commit: 3f7168591ebf7bbdb91797d02b1afaf00a4289b1
> change-id: 20231214-llvm-decode-stacktrace-09538979006d
>
> Best regards,
> --
> Elliot Berman <quic_eberman@quicinc.com>
>

Thanks
Justin
