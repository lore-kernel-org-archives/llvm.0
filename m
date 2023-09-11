Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593C11C87
	for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 16:00:01 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-64cca551ae2so29840836d6.0
        for <llvm@lists.linux.dev>; Mon, 11 Sep 2023 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694448000; x=1695052800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhCiYm6x7iq9o4rbclNiuNRftcu8ARPlt13VmKx0QnQ=;
        b=kCSTyt8IQ1HAbMsNz5M87S5/HJAmZPv2qMPDjcryHPY9/H+t9JP0ba3a0cZGZUjvUq
         7XpvC/CNgcvy9cbRAgLAV3j1YrRdd28q191AAl79AB4Ekgvhz3gozGLAIixt8xXItkWZ
         xfCv5Nv/CJgb0Pe+YjkClfPQHwt5Xy9heEb2GZvQkHvZYPqaOkR3zePlr4cLgdYNECU9
         qIdHBouj0Ga0bx8i0SBGUngJKDRLK83nuFIbr9M3t0gXKkCYL1xQwZUjZVqsKSeZ2ho0
         RzevhufK3ab0vC49v7SLOtvMqf0eLBPXyIH2ZsIrfZW5F5mCtQ5LmO8e/zktWQ6VZI1l
         W54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694448000; x=1695052800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhCiYm6x7iq9o4rbclNiuNRftcu8ARPlt13VmKx0QnQ=;
        b=vT1b558hORFDZLlHS5c4DTo3SHaN325BhuWaMGSVHhbuRAIoYey0fSOMXER0OgB2D+
         tJ8FqyVbfr5nXPQQspV6h8x+gjch5BZaQra1bBPcfUprjhG8slm475eXXZ6uuLRqXCrn
         gCOkJa+Qr/3CO9gUzp3RiLmHnoyWBVY8h0uS76hJqq32B3UlbtnDHx6fwxScJXfn8+6R
         BNayEGf1MR7WX6bPdRHtfp8a1xPHRhYaSmwFILPfWPVttafhITtBTk+5IlGW53hQn7j5
         zE/7asD0LYiTRd3bPJ9/mSiKVeRTd89LnWpzPsrE2Kuf+Pi1hw4BM7WfMioBa44tZRvT
         HAIg==
X-Gm-Message-State: AOJu0Yw4aGERsq+9199OKYjCAX7hlb46vQ3wV1towLvq+zegUIhPMiX8
	a7Wt+xjTa9Fz8uUEfJ6RBpsn+KRVtbasMRm9z0NpmA==
X-Google-Smtp-Source: AGHT+IG1BrjMOhxrQ5uTqPmUsGxbwZhnQhQdQWAFkmEevIFzaHDDcwRIiVmuW4KxFZCM92Owt5ocwv+noWH4lf1gUmY=
X-Received: by 2002:a0c:8ecb:0:b0:655:87a1:49c4 with SMTP id
 y11-20020a0c8ecb000000b0065587a149c4mr8746780qvb.39.1694447999884; Mon, 11
 Sep 2023 08:59:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230908231244.1092614-1-song@kernel.org>
In-Reply-To: <20230908231244.1092614-1-song@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Sep 2023 08:59:48 -0700
Message-ID: <CAKwvOdmGSNj0FF0Mx97xAq6Zn5nc816k1QMzXQtR2C+VDq_3+Q@mail.gmail.com>
Subject: Re: [PATCH v2] x86/purgatory: Remove LTO flags
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
	Sami Tolvanen <samitolvanen@google.com>, kexec@lists.infradead.org, x86@kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2023 at 4:13=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> With LTO enabled, ld.lld generates multiple .text sections for
> purgatory.ro:
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

Thanks for the v2!

>
> Fixes: 8652d44f466a ("kexec: support purgatories with .text.hot sections"=
)

Dunno that this fixes tag is precise.  I think perhaps

Fixes: b33fff07e3e3 ("x86, build: allow LTO to be selected")

would be more precise.

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

-flto* in LLVM implies -ffunction-sections, which creates a .text.<fn
name> section per function definition to facilitate -Wl,--gc-sections.

Overall the question here is "do we really need to optimize kexec?"

If the answer is yes, then this patch AND 8652d44f466a are both
pessimizing kexec (though having it work at all is strictly better
than not at all).  The best fix IMO would be to provide a linker
script for this purgatory image that rejoins the text sections back
into one .text.  For example:

commit eff8728fe698 ("vmlinux.lds.h: Add PGO and AutoFDO input sections")

I assume people do care about the time to kexec, hence the raison
d'etre for projects like kpatch.

I'm fine to sign off on this approach if we don't really care, or want
to care more later, but we can do better here.

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
