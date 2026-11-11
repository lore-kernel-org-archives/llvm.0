Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794423980;
	b=3pnYvpz7bq+QKriRJcmulB7low8GyPQY2kwDliAIo2TP0iPgvwd0jFzlR3rf0crSP8gt
	 Ku33EWExLH7O2NKGoytNPx6qMKyA6zjeJ+iV8ftQCj+mj8eMIjTvsAiFJH1AccQKDlm/T
	 Or8Ku/gi9PzI7xSFGvYHfOTn2AhcDzMSQFPjGr57hn9+XNfrN/RI5JZYSTxrUOdjd2Jia
	 qaWzmOf+EjxiQfUYwQVxtlMUy8pQxUBLdKpbmi4WE7haiHHaueKVoG4mWX59d1uMZzmFT
	 RaUC9Aq7jUYgIN7wYLAPs9lCakv7gfJ+Q5ezyYXXzxolOiAgZHtcNM0+W5GFJeaJRJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
	b=Z1QA3xv26f7CH7UMhQy1mJh5SabSlVqmueayhjrnT2aXcuprAeWq1uNYowOGPMng/tXz
	 F30g7vIe2+N6VOLQ66THfmUIjstttkvi0Bxfye/L0OjRN3ByfOu1RETqrQTRUJPeT+FLM
	 rPv1DokbOjlaN4MXwHk6ySRdRoRQMhkLAFgH/VL8swl6AIKx2/W9Kg9OEcaG3XPqJQNi+
	 HKAqXt40xiy5OaUpST17Zocewxz9UInIj3aFxAZdyvU50FcixCOQpdcR+wiRLxl54qiMD
	 MCQyppjgCQ9VQh+pff11pUferzvuZlRPksLnkOWrrKbZDaiUsKMntUXguAUpqO1vhCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P7Y3LvVI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A5606A326
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 19:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P7Y3LvVI
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49134c8509fso2878721f8f.1
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 11:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423978; cv=none;
        d=google.com; s=arc-20260327;
        b=nkXlA7lJzJ3lEMFVerqmM/qkiM1tOFcfyz0gpnXlh0D35Cvs7OmzOsoDZbORS3+Eim
         DCGhZoSDN1o6vSgrzx/m/kzm9207Drc0IIvoseF1LZtP02+PS+AxdWV+JFWRoom7XvJ7
         GVHDWu9uXBmZpqFOvCftCoQzUqVubQEwnzavr+xZcT1cN0/j+N36aWAm8m/XlmXGd8v4
         QQnqJ7lP/QRKfTRtCb9bdQWzIlI3ixMZJGjM7GOV3ajznUddKEzVi0CbiL66cVGJxIws
         CtvxcPN/kNxydO5y36v4U9xr0kmhB91jpVqgHtlB1aJGI44i/kX1TCkPt6ten5WWBWPP
         7a+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        fh=TzWAWv/Yic1WLb98t7g1SVFLj6ENAbyd6m/ht7GHTkw=;
        b=FbWgBToMEAgl2QtjUQPyU251P8t1aleoDL3w8bVr4mMKbM1fI//jA4HIgg/r7ya53C
         he3b/YC53A05I9piCUDRT6rs+KdI0igDoBe+89hPQrRQRbKhi4+h4K6FQTL39ut4VGkH
         AJwRTes51MSOZuVnrR4NGsg9XIpkJudrKfULbBgjxo49xU2kGRUln1KrUscxYZKFz7EG
         pD2z8jLC3hdhHQ+SL1UfeRqv3ly78xxI+rl5QpmmZ5ZSFn/nNqkpkxssTMtxMWAEps/M
         Tx701df3CSu8i+npbWQhpRfRbcKyo2M2w7Olkv7mgVHaIUL4r8nfl/AYOQjeyqUk0ibX
         Ezag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794423978; x=1795028778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=P7Y3LvVIeWSfDnYmH/Rsa9Tgv6l6VEILy9zdzbFdmrS3yFD+Ru9hMMF84UVsTOBwkQ
         fu9/xZKHbUf6QuPXJzYMc0D9utbCBuUqUhl6FYdN1zA0PXYjc7HgTRqpG34JHap6kEYj
         RrAojc4mNjgw59zwQzKHD8AUKZSCZjWj7SzwdkZr1VZhN5tGOUiBuevF4Ar5IlDJo9IR
         bqehbnj5QFs79+lUQaB1LcxINUyQ1WpVDm6zs+oNdZlzTIqM6SSS8THRppvMSG4aONnt
         JKSY+6T7Gag8FFOclIrJlS2CDZEt48jiAqyR36/VIBeC6CEYMYB3QrltVAQxRuJvGGmV
         0PfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423978; x=1795028778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVbgEbt3S1EMnrsVzdnawE8s5u/UkK7PqX6p3ac2xvw=;
        b=HJjsIq2N5tN2wg0VuyteD7vn2w3O9RxPDQ9mNqO+3c9xhYrtXlCHBgMI++xZo1GMi9
         sMLxW2gUTb7LfFsfxF5CpwU/GduNsfG/v+OMmqwPeXXyHYeNf41piUIk9FPaMILdXLDW
         J45Xqq3uvpoelW8XbldhGKrAcUb5R5BdV1oxbMF21bSbZlrQ6CsMdcmLSNPcYtNxctJk
         OzB7iP43vu7QCE5l2OSdh50JkydZauXfcI2AgstgUT9qyOe8SrhRChNGFXawm+26JcP5
         RfHrUXtpJCK/tSZ10XnHaShaeVx1PjqKQ2CbupT56gbc03u6eeuLxVubWt0O31CexytN
         Lntw==
X-Forwarded-Encrypted: i=1; AL+hErHrH92wNjpfCqMFq2wTgKdRObCbdJitWPKLxOpcJ3CEGUnRRgWESBFtCj9ZOaPGkgb3aS77@lists.linux.dev
X-Gm-Message-State: APuU4Z8WWnA57a5X4dW45Sqa2IhXHJhcN1fpFoowZIoBlCSjEN0g4cjo
	rU0mUvs+JcrYjxI2tNTXkkELhw8XdxBLb51O5Xj0ioU/AC+Zx4coOnOTR6mEgBWP51t4PkcuYhZ
	ZVcwTyEe2LoMMfOzJRZM4qsazix2sBanHAPME+BRB
X-Gm-Gg: AYBFou0MIpM4PLd4eobDrHsJ72FFQ0crxUlRDyfRkFSQKcDbe6q6f87CFM1YXbhVT42
	YgddstsXz0mAy+vB+eweoOs1jXufLiEar8sVvnYkSfAE9gHP/ocIWNxRUi+s1Te6IumQi2BypEM
	GN5DyukoWcoMOd3Q27A8g8Srsu26G9BuO4pZVX6lHjjRhCBTEpUO49rtLbk378jR7nXVOENRR91
	8i9PqK0Li9eCvaEELFsDXO+NjTM0d2NhChzD9dv+jDOj41GgJpFiuFFVLBqqtrsqaigQ5IIylMW
	3cvkWQ0zEYPFcuGlrTydwWLn6MdDtM2T/rsBjdHAADme39hRRz6zh1SFkckRHewxshRa7StIAi2
	rvhd3KDuji3wu0B6RoC+aHGWMjfPh1dVtydpkVT97AV7iJUt0sh0PE9RdfDrlg1+1PEqdc5RZSb
	BIRjMg3QDjDrIOwFSZM5UDfbvq22ZTbRJLrLG3q16VVqfOKmCNH1vNW0/jtG+1nNbCR64BJiG9p
	EyKtcvQ6HQ+/xICtL5cx12Ox1ep4Lv8baf458ooEn5LKdEoaIjVhm1MFCw=
X-Received: by 2002:a05:6000:188c:b0:48c:4442:54e with SMTP id
 ffacd0b85a97d-499c6e96996mr5766110f8f.30.1794423977388; Wed, 11 Nov 2026
 11:06:17 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org> <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-1-6d4fb636290e@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 11:06:06 -0800
X-Gm-Features: AclHuK_uzzc5PqVw0ACAUccbGDRKU7vaepPUlXKcHRboTuGhxy6z_fiaCT06APY
Message-ID: <CAKwvOd=gkPRazfqjd2xpvW-Pr8gLXVvxBYuzuyAOWi2xwinRTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts/Kconfig.toolchain: Remove CONFIG_CC_HAS_NO_PROFILE_FN_ATTR
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:42=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> __attribute__((no_profile_instrument_function)) was first supported in
> GCC 7 and clang-13, which is higher than both the minimum supported
> versions of both compilers. This configuration is always 'y', thus it

Verified, but...

> can be removed.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/gcov/Kconfig       | 1 -
>  scripts/Kconfig.toolchain | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index 04f4ebdc3cf5..f62de2dea8a3 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -4,7 +4,6 @@ menu "GCOV-based kernel profiling"
>  config GCOV_KERNEL
>         bool "Enable gcov-based kernel profiling"
>         depends on DEBUG_FS
> -       depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR

did you want to retain `depends on !ARCH_WANTS_NO_INSTR` (deleting the
` || CC_HAS_NO_PROFILE_FN_ATTR`)?

>         select CONSTRUCTORS
>         default n
>         help
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..666d44cc6ba8 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -141,9 +141,6 @@ config CC_HAS_ASSUME
>         # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
>         default y if CC_IS_GCC && GCC_VERSION >=3D 130100
>
> -config CC_HAS_NO_PROFILE_FN_ATTR
> -       def_bool $(success,echo '__attribute__((no_profile_instrument_fun=
ction)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> -
>  # Beware of two problems when using cc-option in Kconfig compared to Kbu=
ild
>  #
>  # 1. cc-option in Kbuild tests the provided flags with all previously ad=
ded
>
> --
> 2.56.0
>


--=20
Thanks,
~Nick Desaulniers
