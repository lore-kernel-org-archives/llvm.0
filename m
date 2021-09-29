Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019F72
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 19:13:19 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so4210413otx.3
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/WQwciV4kH9qlmumlGivjLJN6ySXaV6TVusvL35OKM=;
        b=5gqUzNpF0R0PDzMt3LO98Ymmj1iWe/PZF3ZCQCEH/7B/pG2pa0XLjzV3lhqrBF6Vqc
         nJW75aKLgDbe3Hsp8SdDyouE22UTs72WMEppowCxmCx0xDfVrHc1yVllwZSeMIEuJGfL
         VrG04X8twVB10l6TrmVwpRuNVtl8dyhXsauG4GJtfBWaQqjFxg0sC2Rz9Y0//STDnKsI
         mPbpS60ALsWg+cvu8Oz70/FtseEf8Zkg4MiVkgNprdWJDT31YRLUOuL+nhR2xEr0zheE
         82DzcsdaUkrxBi7Jf2CJ8PTiViO8F3UDAvtABIS+FX3ocmiZdaXfKIfagFClybNp9qws
         udaA==
X-Gm-Message-State: AOAM530TqaOzH3dbHvsl7LvqHhHFB4+7hKt+pYqK1JGIoflvqODdDE9K
	PoHcNzvYRlBev5IKQY6G8WzYYjK832fvN69YWSklGKtX
X-Google-Smtp-Source: ABdhPJw0vt/bBZzouEmyLqdC0Zbn+/cKmyfJ3LuVcgYM2+N3TpHoEbktUk4VmZemtq4x3GdAFWsDqmWJgpw4C6e1cbw=
X-Received: by 2002:a05:6830:165a:: with SMTP id h26mr1450970otr.301.1632942798995;
 Wed, 29 Sep 2021 12:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1800633.tdWV9SEqCh@kreacher> <8879480.rMLUfLXkoz@kreacher> <YVS5k1H8KyVAk/h8@archlinux-ax161>
In-Reply-To: <YVS5k1H8KyVAk/h8@archlinux-ax161>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Sep 2021 21:13:07 +0200
Message-ID: <CAJZ5v0jSOpBbt8C5ema1t7h8Fb49F7DSyrUfht5xUXibVBU2Qw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] PCI: ACPI: PM: Do not use pci_platform_pm_ops for ACPI
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PCI <linux-pci@vger.kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Bjorn Helgaas <helgaas@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 9:08 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Sep 20, 2021 at 09:17:08PM +0200, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Using struct pci_platform_pm_ops for ACPI adds unnecessary
> > indirection to the interactions between the PCI core and ACPI PM,
> > which is also subject to retpolines.
> >
> > Moreover, it is not particularly clear from the current code that,
> > as far as PCI PM is concerned, "platform" really means just ACPI
> > except for the special casess when Intel MID PCI PM is used or when
> > ACPI support is disabled (through the kernel config or command line,
> > or because there are no usable ACPI tables on the system).
> >
> > To address the above, rework the PCI PM code to invoke ACPI PM
> > functions directly as needed and drop the acpi_pci_platform_pm
> > object that is not necessary any more.
> >
> > Accordingly, update some of the ACPI PM functions in question to do
> > extra checks in case the ACPI support is disabled (which previously
> > was taken care of by avoiding to set the pci_platform_ops pointer
> > in those cases).
> >
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> This patch as commit 9896a58cdd59 ("PCI: ACPI: PM: Do not use
> pci_platform_pm_ops for ACPI") in -next causes the following build error
> when compiling x86_64 allmodconfig with clang:
>
> drivers/pci/pci-acpi.c:1125:7: error: variable 'adev' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (!adev || !acpi_device_power_manageable(adev))
>              ^~~~
> drivers/pci/pci-acpi.c:1110:26: note: initialize the variable 'adev' to silence this warning
>         struct acpi_device *adev;
>                                 ^
>                                  = NULL
> 1 error generated.
>
> Should the adev assignment be moved up

Yes, thanks!

I'll fix it up in the tree.
