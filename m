Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25991C2A1
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 17:22:27 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-64aaf3c16c2so7025146d6.3
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694712146; x=1695316946; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8eQORumJtaroUI8JT9bu5D1IY7lPGvpUmpxNHPhsvg=;
        b=cicS9qJZ3zAIBa6W/MJG8zw66eH0w9o8q/iLroc6ZOcz4MSZxJ/dOywYwMW0L9oymX
         /0YiYF5Flfw4ZpFlTYLMVjd7N8MPlzybxItRfrIC882/096SJGOdvO1ZR7TthsCD4wiF
         NSjrimjAUwPF9R99Rfr9ee/YOUyqPGMfgjw/QDO+lHkRHi7+ma8hhRRlCXEiEkLkczfy
         6To5wTdqYldaDelWfXDNQofo3glvUM7zaMN618NtvcfCga/ClAaHEqIoix39DzkUBoVl
         sMKTNj3baukWLBE5H0MxsQBqJ5x/8h0i4eHtbgx3Lio0eLOeHexC7KzZgtVRH8umueBg
         SQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694712146; x=1695316946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8eQORumJtaroUI8JT9bu5D1IY7lPGvpUmpxNHPhsvg=;
        b=cinVSyZEk8EGC5eErviqkI6+PV2CgnZbGSeviIXQDhkZLw4vKhNm6UIGi43EO0qckx
         zE4MH3xL8vDS1YMBhGkZbLCvdJv29BeIAYx4YWBPNiqC9ZEZ4E0wLf1Oeqdjuwh3mM2I
         faknLpsQlthDAoO9ZXZsR1ZI1lOnSE0Sg4WBYQ2K2+levvYLnEI9RgkUEW21r/pMl4YT
         6gEaAzBQpbwVMKDc/rMcE2DgFbo3p48+UhivrmtA3JgE8duasLN1ayLtRwE6xccTITio
         EyoZjj7ZnCh5UeQEj3NtbuvU/8tFuLmPBPxZJAw7fqHKOlvJloKPEQahrNV8RKgSSSJO
         Dy0A==
X-Gm-Message-State: AOJu0YzXqBckGuzo4pB7xlUDUmZnCF2NHVelaigNAWred/eswOSj0C55
	duoOujCrzUhuCgWSvM3jqRvgbSmXfF+DtXfWK7Sq8g==
X-Google-Smtp-Source: AGHT+IFA5G/u9fTxemIh7ppyemUF4heb6N+w5pTJ0x1vdhIE9rGnXqUnizt0BXWM/DV2ecQatLz805H4QnF5kKUSyAs=
X-Received: by 2002:ad4:5851:0:b0:63d:7214:638e with SMTP id
 de17-20020ad45851000000b0063d7214638emr7042473qvb.56.1694712146470; Thu, 14
 Sep 2023 10:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914170138.995606-1-song@kernel.org>
In-Reply-To: <20230914170138.995606-1-song@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Sep 2023 10:22:12 -0700
Message-ID: <CAKwvOdnisbzAx3eQD_U8gQU05WzuOr48VRJfySu5WRTWZVDiPw@mail.gmail.com>
Subject: Re: [PATCH v3] x86/purgatory: Remove LTO flags
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Sami Tolvanen <samitolvanen@google.com>, kexec@lists.infradead.org, x86@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 10:02=E2=80=AFAM Song Liu <song@kernel.org> wrote:
>
> -flto* implies -ffunction-sections. With LTO enabled, ld.lld generates
> multiple .text sections for purgatory.ro:
>
> $ readelf -S purgatory.ro  | grep " .text"
>   [ 1] .text             PROGBITS         0000000000000000  00000040
>   [ 7] .text.purgatory   PROGBITS         0000000000000000  000020e0
>   [ 9] .text.warn        PROGBITS         0000000000000000  000021c0
>   [13] .text.sha256_upda PROGBITS         0000000000000000  000022f0
>   [15] .text.sha224_upda PROGBITS         0000000000000000  00002be0
>   [17] .text.sha256_fina PROGBITS         0000000000000000  00002bf0
>   [19] .text.sha224_fina PROGBITS         0000000000000000  00002cc0
>
> This cause WARNING from kexec_purgatory_setup_sechdrs():
>
> WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> kexec_load_purgatory+0x37f/0x390
>
> Fix this by disabling LTO for purgatory.
>
> We could also fix this with an explicit linker script to rejoin .text.*
> sections back into .text. However, given the benefit of LTOing pugatory

s/pugatory/purgatory/

(maybe the x86 maintainers can apply that fixup if/when picked up)

> is small, simply disable the production of more .text.* sections for now.
>
> Fixes: b33fff07e3e3 ("x86, build: allow LTO to be selected")
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Song Liu <song@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> ---
> AFAICT, x86 is the only arch that supports LTO and purgatory.
>
> Changes in v3:
> 1. Fix "Fixes" tag. (Nick Desaulniers)
> 2. Add description of an alternative fix, with linker script.
>    (Nick Desaulniers)
>
> Changes in v2:
> 1. Use CC_FLAGS_LTO instead of hardcode -flto. (Nick Desaulniers)
> ---
>  arch/x86/purgatory/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index c2a29be35c01..08aa0f25f12a 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS -D__NO_FORTIF=
Y
>  # optimization flags.
>  KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))
>
> +# When LTO is enabled, llvm emits many text sections, which is not suppo=
rted
> +# by kexec. Remove -flto=3D* flags.
> +KBUILD_CFLAGS :=3D $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
>  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
