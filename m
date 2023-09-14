Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8922628E
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 19:15:59 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-57354433a7dso737229eaf.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694718958; x=1695323758; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/OKaoFTzHFPckQ8elHjeRhc3HPJtJWQjmgI/gL6p9I=;
        b=MqsUZ4pdPNCvBJ/2eTjqqaJJ0eq9hClxV+ZB9KRE5cGVOZPsOFc08WLj1dYshAdehT
         A3Az8FK0xFOJPqBSVW20kDE/lYX+drielg8mDNTNV6TtI7BMQXkOsFI9iHyCriBbo7gT
         nOGq1VfUcX3DHqU0JRZZBhQOHiAgm3DO4oJaUmIDYWABhCqGyulBrGI4zwx9Gqm+ezE0
         Si+qjRToVBZ3tHiogIgi/0omB5mFeKbrJvqqU+mhaVkBnU5kpQ+p4XI0EJ78S3IriNas
         0UUZu0+ymIAraDagWexSvwRTubbtTOMz6FBNcIKbGEatSdpRgjTS1BBCIfQrnLLefs3e
         eKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694718958; x=1695323758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/OKaoFTzHFPckQ8elHjeRhc3HPJtJWQjmgI/gL6p9I=;
        b=p8Pz38bBpwLooaBZpCbLOnyyyt5AmWk92QZcWTBSX0LYbgXtsFXqOx8QefENfxbZbg
         jhYDlIyniZUIAcOLYBYcesACg7rEZf5VzLhLvARjr62plzvFzql7jkmNNEXXBczBr08c
         vyIB8JwIhazXHsSNFArwOgQtfYaDZoL7L9F2DDfLv6M7Ar4b67WmfNkyzdysfeP9KPmv
         ab73/yTKUXxzUDyKQz0gy0pD9DLBtFyGfYdKBcZttuyEaLtS0rwy+u0z8MwroAzFMaz0
         90DVoCWhPbEcXRotbyMnN2NMNgXBDEn3121BNNka5fFq6uAV801Zf6zm++GsEp4yeqnw
         pndQ==
X-Gm-Message-State: AOJu0Yz97hFMOUI/3afxnU6S5/LZTSm7A+3UbRZUJSoHihmY0dobKlML
	D5SvdqPBg/drpOHYqoiGhAJuxCC+c6VzHQEnoWZ8sQ==
X-Google-Smtp-Source: AGHT+IFgjCX7b6T7mbh0ViVMGicpC/DaCfIz07Wpfl/pmZh0VIBshCVYBpO+RJhvDcH2HnGIfPB6GohIOiUqcipNCFE=
X-Received: by 2002:a05:6358:7302:b0:135:4003:7857 with SMTP id
 d2-20020a056358730200b0013540037857mr3832327rwg.31.1694718958043; Thu, 14 Sep
 2023 12:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914170138.995606-1-song@kernel.org>
In-Reply-To: <20230914170138.995606-1-song@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 14 Sep 2023 12:15:21 -0700
Message-ID: <CABCJKufZJstbnjtcwKRY1CSE-eZBnbYScpD6wp9fMXmpFfdBoA@mail.gmail.com>
Subject: Re: [PATCH v3] x86/purgatory: Remove LTO flags
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, ndesaulniers@google.com, 
	Ricardo Ribalda <ribalda@chromium.org>, kexec@lists.infradead.org, x86@kernel.org, 
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

LGTM, thanks for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
