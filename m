Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA52F34
	for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 18:13:48 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id g20so11479664iob.2
        for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 10:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BjjFYrn+Z6BrwQksjCuz3/lydaArAzbP2sbV0KLxPy8=;
        b=mDcdpD6C65llUIoIz/g73Qv2HxpnsfFNkS3BkoWu3dvAZxVO9ycZQRhftDXBjzdFyT
         GAOPYs51hmNOxa+YK6h8ahRLs7o5qM2Us0JxKohJ1hThqrmD2Bn2A9NaFKBvvg7g08nP
         7XSGr4ZnSsNQosAABu8H62PG1Qjhz6E2ri1GtjC5u957GLP1FnNB5LAKewlM/qWlZfVd
         f/Nsr+iLVCkO3m4gXR3VmAYFmoYAs7Z5lsWI55lje+23UhbRHXsm5nd+wiyntih14bpw
         1fwidRCQNsa79iqh+85+FO1KYKD3JtqrhH4ZgMBuKimDWdSHD3PxeEiSZhJ4TaFc6e6p
         o6sA==
X-Gm-Message-State: AFqh2kr6KszNvY5VFg/z4nXfn9zkeEIAqLo1uYERHERUYZfeDlFprXSp
	A3VURP5tqdI2/Hmo5iMavbPS3rc5kpY4w4sB8Ls=
X-Google-Smtp-Source: AMrXdXsFDmiFbOwAISGoYvX96GPBHqjsnblzpwinRTNmG/43jaVn4C/GjMuEMo/LrdYQwGIRK6DNTbQ8+wvW98l2lTo=
X-Received: by 2002:a5e:c00c:0:b0:6a2:8015:afef with SMTP id
 u12-20020a5ec00c000000b006a28015afefmr2425943iol.149.1672424027483; Fri, 30
 Dec 2022 10:13:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221223142419.3781410-1-ammar.faizi@intel.com> <20221223142419.3781410-2-ammar.faizi@intel.com>
In-Reply-To: <20221223142419.3781410-2-ammar.faizi@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 30 Dec 2022 19:13:35 +0100
Message-ID: <CAJZ5v0j1nB9W=uNHKhqLHovTgAq_5ZYkzp6z==AspY4Dfp3PxA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ACPI: Silence missing prototype warnings
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Robert Moore <robert.moore@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ACPICA Mailing List <devel@acpica.org>, 
	LLVM Mailing List <llvm@lists.linux.dev>, "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 23, 2022 at 3:25 PM Ammar Faizi <ammarfaizi2@gnuweeb.org> wrote:
>
> From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
>
> Compiling with clang-16:
>
>   drivers/acpi/acpi_lpit.c:142:6: error: no previous prototype \
>   for function 'acpi_init_lpit' [-Werror,-Wmissing-prototypes]
>
>   drivers/acpi/ioapic.c:212:6: error: no previous prototype \
>   for function 'pci_ioapic_remove' [-Werror,-Wmissing-prototypes]
>
>   drivers/acpi/ioapic.c:229:5: error: no previous prototype \
>   for function 'acpi_ioapic_remove' [-Werror,-Wmissing-prototypes]
>
> Include "internal.h" to silence them.
>
> Cc: LLVM Mailing List <llvm@lists.linux.dev>
> Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> ---
>  drivers/acpi/acpi_lpit.c | 1 +
>  drivers/acpi/ioapic.c    | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/acpi_lpit.c b/drivers/acpi/acpi_lpit.c
> index 50540d4d4948..3843d2576d3f 100644
> --- a/drivers/acpi/acpi_lpit.c
> +++ b/drivers/acpi/acpi_lpit.c
> @@ -10,6 +10,7 @@
>  #include <linux/acpi.h>
>  #include <asm/msr.h>
>  #include <asm/tsc.h>
> +#include "internal.h"
>
>  struct lpit_residency_info {
>         struct acpi_generic_address gaddr;
> diff --git a/drivers/acpi/ioapic.c b/drivers/acpi/ioapic.c
> index a690c7b18623..6677955b4a8e 100644
> --- a/drivers/acpi/ioapic.c
> +++ b/drivers/acpi/ioapic.c
> @@ -24,6 +24,7 @@
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
>  #include <acpi/acpi.h>
> +#include "internal.h"
>
>  struct acpi_pci_ioapic {
>         acpi_handle     root_handle;
> --

Applied as 6.3 material, thanks!
