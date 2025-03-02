Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4442BD04
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 17:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740935763; cv=none; b=onVo194NGdTPXhCqx9H+ihGx0oSXYoLRngAXf5mAC9qA4+co97DL54OagiLgZckgh18J0pPndgvh9x9cuuBF+WhkTx8QRdr7Dk2PaAE8KGkgpoczSiqI6+kj35GoAV5RSmSnoHxfxLVR4HAKo5hMjmgMTET5as3nMirpvlB1TW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740935763; c=relaxed/simple;
	bh=C+5LcGfBUtvq89KxisTyEENM0n4q2gqsCs7v54Y82pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C0ji1v+Bl0T3TeYXNo8EMuJfsO25EQi7qFEKDB7fb5vzqF2Tb3TAvV3UgXlGi/CoxQoTUEVFCJdjP18moBnqZ1zsX7rl3TKeHliAA2rnpbFy7BqyzRVmJUDOnpfyMk5pquXNTnmESsGz/tA0J2fgStNDmtYgcxK54LrpQEOLuWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDj4WH9/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDj4WH9/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5143CC4CEE4
	for <llvm@lists.linux.dev>; Sun,  2 Mar 2025 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740935763;
	bh=C+5LcGfBUtvq89KxisTyEENM0n4q2gqsCs7v54Y82pI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HDj4WH9/fXb4a6FHY8+/WyoVpyhprrK1a8xum5NBI8MAsvoW7YOcnX5YVS3EltEux
	 cBGPJMsmIFWQLZAgNBPaCFm/gSJdViEQ4BObczfPqv/ronOU2bYsT5bB1sztwCey96
	 mBopFYdAqbE9bypiHA43xzR6upiqg6O0dihhB8NkfE6HU5aX3mj8bFbo3KAgCYkwBd
	 3Od8IIPY4iQ7+Q1Sko8DKh2h+VvoRgGJnnShTFTBhpPME9I9IRS0TpPpR12/Yzbjzo
	 1WtLekTirw4iDDrS8o7hbmvDfoRcqczewnCQEz28gWUTvJVnUaj170m1Ogzh39/NHa
	 t5mg/sXRmXMSg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3861383e87.1
        for <llvm@lists.linux.dev>; Sun, 02 Mar 2025 09:16:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAwliwg7nihG8lTHZ3uIoWukxgGUNF5jVMpS5RRYqRoiPCVATjrglAvalXGQUIvy+3OOS3@lists.linux.dev
X-Gm-Message-State: AOJu0YzpaKYGNrT9CVn4gNtfeTgYJ0l3GuAwyysQSjZo9ks34Dp1rd1a
	OvScoJ61A76w9Det1brIvokJ0uW+fVlpTc3ED+3Qf8qbHM08NS1krVBxrbNaFjXt4zQkHWB4TW9
	kiaq5ktqbWSZeq+VfnWrtDuVEnhw=
X-Google-Smtp-Source: AGHT+IE37MiTtp2DXxPPSPuVqZfd9k0kkjXkkvCGTVMafD7ZcM6Ah7S8qYxRs8jydGahzE5e9WltMc2yukg0OnBMWok=
X-Received: by 2002:a05:6512:e8b:b0:546:1fd8:3876 with SMTP id
 2adb3069b0e04-549432de15dmr5315785e87.14.1740935761962; Sun, 02 Mar 2025
 09:16:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250225100037.2709624-1-arnd@kernel.org>
In-Reply-To: <20250225100037.2709624-1-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 3 Mar 2025 02:15:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsT2sop_uUgERvJ_EhbFj825MPPrqqZv64_13z19KeHQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpSchcyIguDDJsm_gNw4MryJBtW1epPJBL1qrMzD1bJvalXRCihjJfRFnA
Message-ID: <CAK7LNARsT2sop_uUgERvJ_EhbFj825MPPrqqZv64_13z19KeHQ@mail.gmail.com>
Subject: Re: [PATCH] [v3] kbuild: hdrcheck: fix cross build with clang
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 7:00=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The headercheck tries to call clang with a mix of compiler arguments
> that don't include the target architecture. When building e.g. x86
> headers on arm64, this produces a warning like
>
>    clang: warning: unknown platform, assuming -mfloat-abi=3Dsoft
>
> Add in the KBUILD_CPPFLAGS, which contain the target, in order to make it
> build properly.
>
> See also 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
> detection on clang").
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to linux-kbuild. Thanks.


> v2: use same approach as the other patch.
> v3: fix changelog text
> ---
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index 58a9cbe4eba4..b9a2640b4bb7 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS :=3D -std=3Dc90 -Wall -Werror=3Dimplicit-fu=
nction-declaration
>
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64=
.
> -UAPI_CFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CPPFLAGS) $(K=
BUILD_CFLAGS))
>
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS +=3D $(USERCFLAGS)
> --
> 2.39.5
>


--=20
Best Regards
Masahiro Yamada
