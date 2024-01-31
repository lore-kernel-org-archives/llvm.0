Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A9107A9
	for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 03:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706671729; cv=none; b=TjKltXJHVlTK0MmVEaG39M/wJsTtPvmMvAyB3BBDaVeQbwl5lgFyejCHQS8br1Vf3PwEa/QTYvLq1l7+i8glrtkQkcjY7iNpXQarhvj+vpYtqbGIImEIECqU/9O4RnPa7GEj4E0QSN7VGud9AA/b6aOuYUZh+viHWslOAgYEL4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706671729; c=relaxed/simple;
	bh=yQ/eYdla+PPU4xd8dAVC1+5DW9+ZXc6YyYJNNjCMHug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovr9fY9faV9N5L8WsX6rrUbf7c9Lt7GgLSZeguahkSikU/LXsplD2asxroYmEJH5WQFV0Z9kD20OT3PNHPBFTi06lFNsS81mseOrzfk8llXln5bhcdaIVevg4RtPXHdZftQXmLaG/4cjD8Xc8TpoDj0mvHzu0Y7RUEGmg8vo05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xh6Mpnaz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xh6Mpnaz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f5d62d024so2853a12.1
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 19:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706671726; x=1707276526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMaeQ3oL3vIsw8IAljbZcrRIbWnWJagVMsJJWiw2xCg=;
        b=xh6MpnazzI0HQDnKHaI4Q2/o6VY5mc+4tYJUYct79sO1b6FoaU8zUZsGm369kS/tSk
         5BSIv2oXkqI+sKzIkYmfGEWZ17/Nr2qiGo9HSZM9qCFURagpbxY7wJLgDUXAIKpPJRvP
         8oBOT9L3J5PsewgA/OTm9B6Dg7g2jGzrIl/8gVqbwDueguyMVexjCN9o0E9Xsi6Pto9B
         EykqSY3yqtDauHdLrAfRhhjBhZhH5zl2i6lJkmj/ZZoilx+1mEpbh88FgFX8fJeiiB7l
         SBVbHJVNA4NXkK03+CrLvQ982QQ045F0QLVa45OZtGidygYDJplVCP6gEEWDa+/ZemlW
         evRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706671726; x=1707276526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMaeQ3oL3vIsw8IAljbZcrRIbWnWJagVMsJJWiw2xCg=;
        b=nn55s7fnIEhDRMMEwDBT2xfxMtvFlizyRl6Naz1Y9dkZ65Z8SDhGFCW7Unam54KkXQ
         VuTmVo5aSG/dFUIXYOT4vCEFfjwYVikp64yNctUui4VmcQel0dkFOv4B5MetmEJ1YIc4
         Xq1m2YlkSkzpzNHu2jBbC58GPXotwjEnFBrN9dNchxUoA5K6S6XXVTu8npnrwr6YoPjU
         IVdgnhdgeAkWwmXrqhfG4oB/dp7VUcfQURKVTrXo4cmrMMzox27RtlQu8qzpheK/4hz4
         9bwNDGT92T40J+vohaELXmmWQ5su3sNq0jA3e2YKu4JFoUMVVYjMawkqn2yeAKtT96l/
         doVg==
X-Gm-Message-State: AOJu0YwTW0+n6MPpvh7y4MavxbyQaswv1v2fSym31sHgaAEgO6NXsz5H
	5iSyxD+Rp1TlNOiSIcAH1OflFppTt9IyCo8g09nOd+h20PRsnxysqVzFFoLA9L9fLqvar9SY+S8
	7hyoSoBiC03/EIdtZMqArFwB1VpoHAHItJwyh
X-Google-Smtp-Source: AGHT+IE1afFuPkgFJnTjU9lwWGU9GDpyqxFFzYhgU/X8bfK9rPLvyTV6OV99NSfV6MIdBW9wmYlAH31tyBWJXhO4S5k=
X-Received: by 2002:a05:6402:30bb:b0:55f:8851:d03b with SMTP id
 df27-20020a05640230bb00b0055f8851d03bmr20873edb.5.1706671726058; Tue, 30 Jan
 2024 19:28:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240130-s390-vdso-drop-fpic-from-ldflags-v1-1-094ad104fc55@kernel.org>
In-Reply-To: <20240130-s390-vdso-drop-fpic-from-ldflags-v1-1-094ad104fc55@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Tue, 30 Jan 2024 19:28:32 -0800
Message-ID: <CAFP8O3+73mVLzrfAE4mS3AQ9LGu+kmrq7s+_U2x+8sK3NP5Lxg@mail.gmail.com>
Subject: Re: [PATCH] s390: vDSO: Drop '-fPIC' from LDFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
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
>

Yeah, this is a problem of GNU ld using getopt_long with a
`required_argument` short option, and mixing one-dash and two-dash
long options...
There is also a grouped short option problem (-ts =3D> -t -s, -st =3D>
`unrecognized option '-st'`), which I managed to nudge Nick Clifton
into implementing a warning for common misused cases...

Reviewed-by: Fangrui Song <maskray@google.com>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
