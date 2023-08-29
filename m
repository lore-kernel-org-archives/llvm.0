Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F56FBB
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 23:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACF0C433C9
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693350240;
	bh=jVzcnu/UgsHYD4Nl9qqosC0UyycvjOZKdeezuanMBlY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DxMhXdXxu1qyJS62dRGlKNkaGR40o4lIiXGmEj2Wf3hvyPEd6+BFf0WI8bY/SGz6s
	 VedDJR8qevhsKshlwr3cIyQrwst+4q9y0BeqSwCLFqz73NV7OlSYGJ2qOLVEh5k5aj
	 fi4CzeKW+NTw9TnDyejN8fHO4Wd3Q9WFNnLRkPiSueedJWT5NhyESEyqu5KrWpGYzM
	 gItsSJUx+s83cmk1dxaBstEOH2/UUnIDAYfK8jvFO/Uyxm29mqf0N7+jpEu2DAXim/
	 HPB2Dp125ItEiWiy2r8urt8f2MdyaCBM360XutYA//dBNPMJNFQOCjZwbK5seAT2he
	 bt1st1AIMFu0g==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4ffae5bdc9aso7902387e87.1
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 16:03:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YyZOAlfXton+bMS52Eb4veGyp4A7ytF7nK/e+77WHDnnDedCALt
	VtXMa4AIiBxpjWT2ObZXEClEQv39M2fWrl+61c4=
X-Google-Smtp-Source: AGHT+IGIqSRBbmlWliRp4UptnUYFlODvNphG0DEO9yK/aY0OPFiqZtDaXA7n3RqP+rAtqSAo4Ru1d2zsSyM1QBhvxkQ=
X-Received: by 2002:a19:e006:0:b0:4ff:7602:5879 with SMTP id
 x6-20020a19e006000000b004ff76025879mr179992lfg.55.1693350237951; Tue, 29 Aug
 2023 16:03:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829-missingvardecl-efi-v1-1-13d055a55176@google.com>
In-Reply-To: <20230829-missingvardecl-efi-v1-1-13d055a55176@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 30 Aug 2023 01:03:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et5=W=ZRrQatWnQ@mail.gmail.com>
Message-ID: <CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et5=W=ZRrQatWnQ@mail.gmail.com>
Subject: Re: [PATCH] efi: fix -Wmissing-variable-declarations warning
To: Justin Stitt <justinstitt@google.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Justin,

On Wed, 30 Aug 2023 at 00:54, Justin Stitt <justinstitt@google.com> wrote:
>
> When building x86/defconfig with Clang-18 I encounter the following warnings:
> | arch/x86/platform/efi/efi.c:934:23: warning: no previous extern declaration for non-static variable 'efi_attr_fw_vendor' [-Wmissing-variable-declarations]
> |   934 | struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
> | arch/x86/platform/efi/efi.c:935:23: warning: no previous extern declaration for non-static variable 'efi_attr_runtime' [-Wmissing-variable-declarations]
> |   935 | struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
> | arch/x86/platform/efi/efi.c:936:23: warning: no previous extern declaration for non-static variable 'efi_attr_config_table' [-Wmissing-variable-declarations]
> |   936 | struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
>
> These variables are not externally declared anywhere (AFAIK)

They are:

drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute
efi_attr_fw_vendor;
drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute efi_attr_runtime;
drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute
efi_attr_config_table;

> so let's
> add the static keyword and ensure we follow the ODR.
>

One Definition Rule, right? Better to spell that out.

> Link: https://github.com/ClangBuiltLinux/linux/issues/1920
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> When building x86/defconfig with Clang-18 I encounter the following warnings:
> | arch/x86/platform/efi/efi.c:934:23: warning: no previous extern declaration for non-static variable 'efi_attr_fw_vendor' [-Wmissing-variable-declarations]
> |   934 | struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
> | arch/x86/platform/efi/efi.c:935:23: warning: no previous extern declaration for non-static variable 'efi_attr_runtime' [-Wmissing-variable-declarations]
> |   935 | struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
> | arch/x86/platform/efi/efi.c:936:23: warning: no previous extern declaration for non-static variable 'efi_attr_config_table' [-Wmissing-variable-declarations]
> |   936 | struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);

This is duplicated. Is this a b4 fail?

> ---
> Note: build-tested.
> ---
>  arch/x86/platform/efi/efi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
> index e9f99c56f3ce..30c354c52ad4 100644
> --- a/arch/x86/platform/efi/efi.c
> +++ b/arch/x86/platform/efi/efi.c
> @@ -931,9 +931,9 @@ EFI_ATTR_SHOW(fw_vendor);
>  EFI_ATTR_SHOW(runtime);
>  EFI_ATTR_SHOW(config_table);
>
> -struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
> -struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
> -struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
> +static struct kobj_attribute efi_attr_fw_vendor = __ATTR_RO(fw_vendor);
> +static struct kobj_attribute efi_attr_runtime = __ATTR_RO(runtime);
> +static struct kobj_attribute efi_attr_config_table = __ATTR_RO(config_table);
>
>  umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>  {
>

This won't work.

Those variables are referenced via weak references in generic code.
The idea is that the weak references resolve to NULL pointers on
architectures other than x86, terminating the array early and hiding
the non-existent variables.

Making them static in arch/x86/platform/efi/efi.c means that these
references will remain unsatisfied, and so the variables will no
longer be exposed on x86 either.
