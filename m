Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB55111B
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 22:59:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf7a6509deso19718245ad.3
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694213982; x=1694818782; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ETim7bqC4c0aI+Gj1+8OKYYdNlAwl+LsLJgDB3GOPU0=;
        b=KCfTGgm2dF76kO05VFToS9YMiEcHm/E67oPUYmQBKUcccylLIVdntShcqBpiEEFMw3
         EsISHLx6hRrsx7VQV8SzXoP1mqXfvCD8InplQZdj8oZIWJH3h02WA96G7ihJmYAuYaS/
         u/Iad5Cta2DRoCVIIN21GgzXxKsiQH87NUWVQ/jD0AK14kWFRjekUJk+hmP1f55VZNKQ
         NKPLEGYDDrfMi1n5jkgvMek664JnT/8EoKJBfzXXrofsGZ4G3EMNhinM7R25WAmhlOC3
         A8AUf0gyOwEygXTQiaBqtkqTd4v7/XpDCAxI55lnKUsKv3WXgPy2kd6yiakppo1W1uqu
         n85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694213982; x=1694818782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETim7bqC4c0aI+Gj1+8OKYYdNlAwl+LsLJgDB3GOPU0=;
        b=xLFEYvh41EUrc7bqb5vOJm3xpo6VU6kr2NlSc43b3r5WKpErigbYjgwdZftAMLPJay
         D88CHWr1F/hCZtcphfgenTmtQyXVwNhcJuxG3lKknwhYH0u519tE0z9El25zz7+txw8y
         UsfCsnwXh17WlcBahSc78oDbC2Alfw0X+eFRA76LKDa7L8nk4V8h/NYUHFdGk/XCMHeC
         mxWHK/KK26UU9u/JszLC+MJ3oy3fytpQFnMnWDscTfHKP1alP0A8Hbm0OVyo/lbXT4FE
         wPuCKCoQzjgFtz3tclVwHAOfm0hOZxw5XBMUd3mXW+6kVbiG0q0I2dKipGg0t+BcKuyp
         y19g==
X-Gm-Message-State: AOJu0Yw/Pd5RaBXVzIHCO5v2eF69moiIuM41veomUIOU11yJxP3Kckdz
	+rFI88v1VLwlX4+eLgxEylyhJg==
X-Google-Smtp-Source: AGHT+IHrseoLZKz9f+X23SUo9lh+9srjRT/B0C9SNO5Kl8Ketugg/YTE6oE1r1EnvshvFys7O6MlqQ==
X-Received: by 2002:a17:902:834c:b0:1c0:a417:ccb2 with SMTP id z12-20020a170902834c00b001c0a417ccb2mr3011165pln.35.1694213982229;
        Fri, 08 Sep 2023 15:59:42 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:d39f:a985:2060:eedd])
        by smtp.gmail.com with ESMTPSA id y12-20020a1709027c8c00b001ba066c589dsm2060747pll.137.2023.09.08.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 15:59:41 -0700 (PDT)
Date: Fri, 8 Sep 2023 15:59:36 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, songliubraving@fb.com,
	Ricardo Ribalda <ribalda@chromium.org>, kexec@lists.infradead.org,
	x86@kernel.org, samitolvanen@google.com, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/purgatory: Remove LTO flags
Message-ID: <ZPunWKU/TlrN9xiH@google.com>
References: <20230908225353.984169-1-song@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908225353.984169-1-song@kernel.org>

On Fri, Sep 08, 2023 at 03:53:53PM -0700, Song Liu wrote:
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
> 
> Fixes: 8652d44f466a ("kexec: support purgatories with .text.hot sections")
> Cc: Ricardo Ribalda <ribalda@chromium.org>
> Cc: kexec@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: x86@kernel.org
> Signed-off-by: Song Liu <song@kernel.org>
> 
> ---
> AFAICT, x86 is the only arch that supports LTO and purgatory.
> ---
>  arch/x86/purgatory/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index c2a29be35c01..9c0bff4992ea 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -19,6 +19,10 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
>  # optimization flags.
>  KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
>  
> +# When LTO is enabled, llvm emits many text sections, which is not supported
> +# by kexec. Remove -flto=* flags.
> +KBUILD_CFLAGS := $(filter-out -flto=%,$(KBUILD_CFLAGS))

Thanks for the patch!

Please prefer something akin to:
commit 6e20f18579c5 ("efi/libstub: disable LTO")

Please also CC Sami and llvm@lists.linux.dev for v2.

Pretty sure we use a linker script to rejoin .text.* elsewhere in the
kernel, but it doesn't look like x86 purgatory has one.

> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved symbols.
>  PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
> -- 
> 2.34.1
> 
