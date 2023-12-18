Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13E498A8
	for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dWnId7ZZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c2308faedso40223545e9.1
        for <llvm@lists.linux.dev>; Mon, 18 Dec 2023 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702917477; x=1703522277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUE9wOcs5DhS6rCyT7en0Ycls+VZryCuy04V3s7BDwY=;
        b=dWnId7ZZ4AYDcI53/Fjto/A0hfVebxYrtEyty0zhPfG28+q5sbfgZ/rpEYdqRBT63f
         V39DsxGLhVlWX49dcP8dFjD5WAF5un0nBdX/t4uJDFChfLs4yB+z+NZU+mMTfws+G+XL
         YnnWj3o3YWYeeXCpxwxpAyq+OWNbmE/KrhS01E9McZPfSdagykdSD0CYxCZwkMaDJ43J
         WuzLvJP4DQA9SiVd4LilrP0imTaunyStC69JFaAjXQBeu6SXqqVite3JpEgVW5/+IdXT
         47dkQfMU1IjKUc4NHHs+er9Er5JaS8MuD8wX4lKEfcgNMOIKl4H41+sN4b6XpNiL/Tse
         VTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702917477; x=1703522277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUE9wOcs5DhS6rCyT7en0Ycls+VZryCuy04V3s7BDwY=;
        b=kdWzIkD6opo7J5pKDdEe2EqESDpQg7UdNWi6Sbu79CnqpYhv6Oq9+yl5vI0OMqHzA5
         W9J7PAHxlBGY96AfjBTs0lhgVbm1lSBrYOSAUqrlhHXU7NV6oX4wY54QD//fTppWmjA/
         1iuV7oA7q3Sl5ntkbx36wIVk0e7Ao7zH0haemkVL5kD21va+L3iGwGTLlQc4Ry8YUoAb
         OgRDlq+ZtdKhe1ha/Snmd/O6v1lIj40ia5qv+Vy2HYacegnrIKt6zF8CHT6l7CHt8qjE
         4sfQzHdZZ4XMVdCTuLvZq9E04m1jD8WnBHnQ1cFnhnmo1hZKmoSB8waNFGS7zJ13im0d
         Yq+A==
X-Gm-Message-State: AOJu0YyVxR4XW07sDX1mHHzV/5kNekVTv1+GSDYcNwpbJd5IxPTRr7jd
	9WuBuIbNB/1UTfNq8uTmHOUwS9pOlGTyN3fXnDZW1Q==
X-Google-Smtp-Source: AGHT+IHXrsR1IvFyccMxPBaIu18/8JzznbiYFGpcdylejDvJk9lKQolYCP+MFBgLmXsqvurqf6AGybBA4PfkuxeHX/8=
X-Received: by 2002:a05:600c:1649:b0:40c:1205:c253 with SMTP id
 o9-20020a05600c164900b0040c1205c253mr8598699wmn.183.1702917474422; Mon, 18
 Dec 2023 08:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
In-Reply-To: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Dec 2023 08:37:43 -0800
Message-ID: <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Manuel Traut <manut@linutronix.de>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 10:27=E2=80=AFAM Elliot Berman <quic_eberman@quicin=
c.com> wrote:

This patch looks familiar...
https://lore.kernel.org/lkml/20230929034836.403735-1-cmllamas@google.com/

Masahiro, can you please pick up that patch?

Elliot, Justin, can you help test/review that patch?

>
> When using LLVM as the compiler, decode_stacktrace should also use
> llvm-addr2line. Check if LLVM is set and add the appropriate
> suffix/prefix.
>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
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


--=20
Thanks,
~Nick Desaulniers
