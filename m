Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6120672
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 18:47:26 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id h9-20020a9d2f09000000b005453f95356cso4076655otb.11
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 11:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gh0/D+JLfsfJlqH0a917kdEGhqFFQged7ZchtYxclU=;
        b=hVrU/MJxinO76xEnGUnl+b27SadgUS7T+zCoRp0an0fuQ8ZGZGJ16v9S3R17wYAcaS
         k6NL45kGrbxOwgxWRTAoTDVFyqcUdgjeGNn+WCwD2o74lGAQIkXEMvy5EDJgudZ7vZZq
         jIIz7oertbBmwpibUY9ZPsXLf38+xn28/CcrM1jg4tbh/NBGYg1bZsmwg0j/kNCy1lNT
         oS6f06JnbvBmvu/8zrnNjMKZPAOI2lUn8Djx9Tmu55A3AdD2hP2EJ62oRnwZnp87Cwxf
         xR2gy1XQm11m0R96E/DxWlZGfFfgswqyeEDDVwK+7ey4wFeeohumRpC6UyjBboa8G0KM
         wbeA==
X-Gm-Message-State: AOAM531Jf4Iai5ZJdmGiR1uOV8FE+CgewcBHUJsM5abgfz8W4ToG35Zb
	46MUPiPRqIzy49HlVRqHR9Sq2fQW58N3Fffmv+M=
X-Google-Smtp-Source: ABdhPJxH+pTTbk0IZjcDwThSOx5Jir6Y4UsNlmDuGsgVm/HkIDtlTJgQC59U2XUxYN6Z5+bFQKX+f2eMjXJsAaV2l/U=
X-Received: by 2002:a05:6830:165a:: with SMTP id h26mr1348976otr.301.1632941245560;
 Wed, 29 Sep 2021 11:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927121338.938994-1-arnd@kernel.org>
In-Reply-To: <20210927121338.938994-1-arnd@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Sep 2021 20:47:14 +0200
Message-ID: <CAJZ5v0jJRYQPSfVV_hCD6uxch+vU6kvWV9-KAfqHckHgkFOeaA@mail.gmail.com>
Subject: Re: [PATCH] ACPI: avoid NULL pointer arithmetic
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Robert Moore <robert.moore@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Erik Kaneda <erik.kaneda@intel.com>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	"open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> There are some very old macros for doing an open-coded offsetof() and
> cast between pointer and integer in ACPI headers. clang-14 now complains
> about these:
>
> drivers/acpi/acpica/tbfadt.c:86:3: error: performing pointer subtraction with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtraction]
>          ACPI_FADT_OFFSET(pm_timer_block),
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/acpi/actbl.h:376:47: note: expanded from macro 'ACPI_FADT_OFFSET'
>  #define ACPI_FADT_OFFSET(f)             (u16) ACPI_OFFSET (struct acpi_table_fadt, f)
>                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/acpi/actypes.h:511:41: note: expanded from macro 'ACPI_OFFSET'
>  #define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f), (void *) 0)
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/acpi/actypes.h:505:79: note: expanded from macro 'ACPI_PTR_DIFF'
>  #define ACPI_PTR_DIFF(a, b)             ((acpi_size) (ACPI_CAST_PTR (u8, (a)) - ACPI_CAST_PTR (u8, (b))))
>                                                                               ^ ~~~~~~~~~~~~~~~~~~~~~~~
> Convert them to the modern equivalents.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/acpi/actypes.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/acpi/actypes.h b/include/acpi/actypes.h
> index 92c71dfce0d5..285bc7b73de3 100644
> --- a/include/acpi/actypes.h
> +++ b/include/acpi/actypes.h
> @@ -507,8 +507,8 @@ typedef u64 acpi_integer;
>  /* Pointer/Integer type conversions */
>
>  #define ACPI_TO_POINTER(i)              ACPI_CAST_PTR (void, (acpi_size) (i))
> -#define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p, (void *) 0)
> -#define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f), (void *) 0)
> +#define ACPI_TO_INTEGER(p)              ((uintptr_t)(p))
> +#define ACPI_OFFSET(d, f)               offsetof(d, f)
>  #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>
> --

Queued up as 5.16 material, converted into an upstream ACPICA pull
request and submitted, thanks!
