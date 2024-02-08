Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5950260
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 23:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707433264; cv=none; b=Ctx03ONaSK4iSOlyMK6LW6LILrtJsSElQyeEYoTQvXHmUlRKPUGS1CeiwOKb0JnZtlzWJJbI6/gfjlnZj3VlyIN52F4WTlhv1j5l4sQVwGLyCYFgkMpZ+aB/MlkC0Q65aulPxEmiRU0vNHS+4inIAhJKpmLyC/Q/gtXA2XGK6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707433264; c=relaxed/simple;
	bh=T9DDf7RsGoXWqs5fi1eBpo3w0CqfgK/I8uG6yNAa+ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9fFEO9XaGRs7YzNJdN36bV/KYJ4RP3hgSgSDLngPz4+lgWF664oGHxMEiry0o2ksezT26QV+ZoCKxbv6Wm8CTsTp7Yelh7wJLUKfg8wh7Zn6x60kiLR9ryiUG+ZmJa4a440R/LWKKiRMqq/ESvoaaAH5Wv7xCvijpMEQk51JWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A7ShvIoK; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A7ShvIoK"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a271a28aeb4so38780666b.2
        for <llvm@lists.linux.dev>; Thu, 08 Feb 2024 15:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707433261; x=1708038061; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTWSYLzAcDMw/2lTiSmQrTx2vg4LrA8IhSZigmrVOqg=;
        b=A7ShvIoKrlrX15N4drUy+DvTDjhAp7xeKnSzuxJV5uAED53Ys5Cno5noHlFCWUUQs0
         Q99EmzIjlhrf77X2AxMUNCkjYfUGUdKoItY+R62pRqjZZm3VbzHnQPDcssZRxUmTDapq
         +qd8Q17K25MIOeg/s3N3JOW8VOChHEOZVRWK0gC07yLGxGt9LRaszLj/evMR9b/12Ah4
         KGyLOCW5BeLOtjUyiqywt9VYwiF2gagHa2r/O9qwTqJqn4WOKBmguswimcRjWq5sZgvx
         djxBNZCnCkNhVVdDzhxFmPRkFeHFKicmNVFQff8jfCO2clkvh+/6N7K44d9KODE/Sp19
         ewTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707433261; x=1708038061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTWSYLzAcDMw/2lTiSmQrTx2vg4LrA8IhSZigmrVOqg=;
        b=T4W2wKN4FVzl8axX1iBaLQTIdqvzRPcNdgdNukyH9Kza5n7UuHdl7FI9F8+ctRaGjg
         fVWo73VCutbITKC7xzPjxrY2zC0TQxMkZHXQbtSzqvo0PFUVG0x2623e1GOkwwWaR1Ry
         tWYP0lxbQ9AknCtiFyGG5d0mqMkY4DjpTPgHdJJ37Hhw6gMQ+kShVDk/m+zTcNgsZvb7
         ZDXB9pNTN8KAVa5X7Zk7Eng+07aUafaXuZDTTf1MgI87z9jAUq5wl6OSb1dhQbI7Zzsr
         hVJdT5Izm28uXfQVWi2aC1hdhDLvisxyRjrmN+8sxjfrMHwbth1zTp/zA/3DuTVu/mW4
         qVeA==
X-Forwarded-Encrypted: i=1; AJvYcCU5PBzPyfOF2vR8lsrXCWZ/8tbx5K6wVNBCJLws6Ygsoq1e58MLKw/Ms8j96/frH1IKxrbrfr+Xob6c30y/g39Wfn3Vng==
X-Gm-Message-State: AOJu0Yx+SMgbJZRBQpr9UDhF7lTgkOkChPNIdXnk1VzFtHEkhY3QLj8r
	7X7FGPfC1DhBAGdT84CnWVo79x78BMHuyqi3e94vf6Aj0CDbOILyyf6RoNmxUt2gnwnXW1M4yI7
	QXcPGh4rZf+Z9UF+fjNitnjnh1rD9f7rqM5p8
X-Google-Smtp-Source: AGHT+IH8BJDXACmNpp8QPe3ebkb//40qQr/VkDrymZgcm+C+RRTeTAoH+7Eei6pPd766qsIY5vYGmF8zo397bshm+fY=
X-Received: by 2002:a17:906:491a:b0:a3b:bed0:e497 with SMTP id
 b26-20020a170906491a00b00a3bbed0e497mr528049ejq.8.1707433260596; Thu, 08 Feb
 2024 15:01:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130-s390-vdso-drop-fpic-from-ldflags-v1-1-094ad104fc55@kernel.org>
In-Reply-To: <20240130-s390-vdso-drop-fpic-from-ldflags-v1-1-094ad104fc55@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 8 Feb 2024 15:00:48 -0800
Message-ID: <CAFhGd8oACnUVU-HXD0m_7ES3t5dOTSpGkvkE1R1Xdmgh-Q94Gw@mail.gmail.com>
Subject: Re: [PATCH] s390: vDSO: Drop '-fPIC' from LDFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ndesaulniers@google.com, 
	morbo@google.com, linux-s390@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:14=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> '-fPIC' as an option to the linker does not do what it seems like it
> should. With ld.bfd, it is treated as '-f PIC', which does not make
> sense based on the meaning of '-f':
>
>   -f SHLIB, --auxiliary SHLIB Auxiliary filter for shared object symbol t=
able
>
> When building with ld.lld (currently under review in a GitHub pull
> request), it just errors out because '-f' means nothing and neither does
> '-fPIC':
>
>   ld.lld: error: unknown argument '-fPIC'
>
> '-fPIC' was blindly copied from CFLAGS when the vDSO stopped being
> linked with '$(CC)', it should not be needed. Remove it to clear up the
> build failure with ld.lld.
>
> Fixes: 2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO"=
)
> Link: https://github.com/llvm/llvm-project/pull/75643
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yep, fixes the problems I was having with ld.lld.

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> Hi all,
>
> The LLVM folks are working on SystemZ support in ld.lld and this issue
> came up from my initial testing. There are also some other issues that I
> have come across in testing that I note in the GitHub pull request
> linked above. If they seem like kernel issues, any expertise or help
> would be greatly appreciated towards getting this working.
>
> Cheers,
> Nathan
> ---
>  arch/s390/kernel/vdso32/Makefile | 2 +-
>  arch/s390/kernel/vdso64/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/M=
akefile
> index caec7db6f966..b12a274cbb47 100644
> --- a/arch/s390/kernel/vdso32/Makefile
> +++ b/arch/s390/kernel/vdso32/Makefile
> @@ -22,7 +22,7 @@ KBUILD_CFLAGS_32 :=3D $(filter-out -m64,$(KBUILD_CFLAGS=
))
>  KBUILD_CFLAGS_32 :=3D $(filter-out -mno-pic-data-is-text-relative,$(KBUI=
LD_CFLAGS_32))
>  KBUILD_CFLAGS_32 +=3D -m31 -fPIC -shared -fno-common -fno-builtin
>
> -LDFLAGS_vdso32.so.dbg +=3D -fPIC -shared -soname=3Dlinux-vdso32.so.1 \
> +LDFLAGS_vdso32.so.dbg +=3D -shared -soname=3Dlinux-vdso32.so.1 \
>         --hash-style=3Dboth --build-id=3Dsha1 -melf_s390 -T
>
>  $(targets:%=3D$(obj)/%.dbg): KBUILD_CFLAGS =3D $(KBUILD_CFLAGS_32)
> diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/M=
akefile
> index e3c9085f8fa7..caa4ebff8a19 100644
> --- a/arch/s390/kernel/vdso64/Makefile
> +++ b/arch/s390/kernel/vdso64/Makefile
> @@ -26,7 +26,7 @@ KBUILD_AFLAGS_64 +=3D -m64
>  KBUILD_CFLAGS_64 :=3D $(filter-out -m64,$(KBUILD_CFLAGS))
>  KBUILD_CFLAGS_64 :=3D $(filter-out -mno-pic-data-is-text-relative,$(KBUI=
LD_CFLAGS_64))
>  KBUILD_CFLAGS_64 +=3D -m64 -fPIC -fno-common -fno-builtin
> -ldflags-y :=3D -fPIC -shared -soname=3Dlinux-vdso64.so.1 \
> +ldflags-y :=3D -shared -soname=3Dlinux-vdso64.so.1 \
>              --hash-style=3Dboth --build-id=3Dsha1 -T
>
>  $(targets:%=3D$(obj)/%.dbg): KBUILD_CFLAGS =3D $(KBUILD_CFLAGS_64)
>
> ---
> base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
> change-id: 20240130-s390-vdso-drop-fpic-from-ldflags-0338365b4bc5
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
