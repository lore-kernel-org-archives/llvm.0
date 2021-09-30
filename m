Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D952FAE
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:53:11 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so2161696ooh.7
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWz5foWcr+bWR6CSFDKJoUEhYPxpGczQBoONhahdcus=;
        b=OJc36zIDK5C+Tb3bHNBI+W8xbqsvlVE51B4aySuXZamiC419RbGZ4zuLkMhWYMEGLf
         C4LfN4i97m5V3pxALH8lYQh/4XerNj7I2ZH9ugI1Hh4sosJQYv3avHUA9vgF3PNY5kR0
         4Z7q54TsM5IyDvZ81N7aVGdZh/m2SnkMq9CqgBqcwGhwam8Xmhl3dK+ZzkHmRDCb1n3H
         A/SLloSfBfmfVeauVybcvdF6wAVb06ORb9Dl35Y5XmB95BzAdDzC7hbLsomMet/VMMZe
         pfva1K1cGhZ1V19JGZehw2vUkkUvkNZhdfttXSgWjuGM/6eqEW96Y6k9S6FtsvQ6fd2d
         Cf7A==
X-Gm-Message-State: AOAM530sT8DOsAPGLxlnC8Mf0MBplNFxkQmNsaPwnKmlBPHigWGhypMB
	/zz86UXCPmcpBz8F+P/4IQHWWLpf/JqlFrptygg=
X-Google-Smtp-Source: ABdhPJw8+m2xqrDVqABBbHFhPc+Vi/u0KcQlXUvSeYYp71RAa69bRuSXSureyv6cjZyWA10UqXHMSc2jbi7XhFK/J08=
X-Received: by 2002:a05:6820:17a:: with SMTP id k26mr6219832ood.37.1633027990202;
 Thu, 30 Sep 2021 11:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927121338.938994-1-arnd@kernel.org> <CAJZ5v0jJRYQPSfVV_hCD6uxch+vU6kvWV9-KAfqHckHgkFOeaA@mail.gmail.com>
In-Reply-To: <CAJZ5v0jJRYQPSfVV_hCD6uxch+vU6kvWV9-KAfqHckHgkFOeaA@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 30 Sep 2021 20:52:59 +0200
Message-ID: <CAJZ5v0jDKK6ecsubVDv_=EUF3goiiDW28tvbKF9cesMphgKaug@mail.gmail.com>
Subject: Re: [PATCH] ACPI: avoid NULL pointer arithmetic
To: Arnd Bergmann <arnd@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Erik Kaneda <erik.kaneda@intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	"open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 8:47 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Sep 27, 2021 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There are some very old macros for doing an open-coded offsetof() and
> > cast between pointer and integer in ACPI headers. clang-14 now complains
> > about these:
> >
> > drivers/acpi/acpica/tbfadt.c:86:3: error: performing pointer subtraction with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtraction]
> >          ACPI_FADT_OFFSET(pm_timer_block),
> >          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actbl.h:376:47: note: expanded from macro 'ACPI_FADT_OFFSET'
> >  #define ACPI_FADT_OFFSET(f)             (u16) ACPI_OFFSET (struct acpi_table_fadt, f)
> >                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actypes.h:511:41: note: expanded from macro 'ACPI_OFFSET'
> >  #define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f), (void *) 0)
> >                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actypes.h:505:79: note: expanded from macro 'ACPI_PTR_DIFF'
> >  #define ACPI_PTR_DIFF(a, b)             ((acpi_size) (ACPI_CAST_PTR (u8, (a)) - ACPI_CAST_PTR (u8, (b))))
> >                                                                               ^ ~~~~~~~~~~~~~~~~~~~~~~~
> > Convert them to the modern equivalents.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  include/acpi/actypes.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/acpi/actypes.h b/include/acpi/actypes.h
> > index 92c71dfce0d5..285bc7b73de3 100644
> > --- a/include/acpi/actypes.h
> > +++ b/include/acpi/actypes.h
> > @@ -507,8 +507,8 @@ typedef u64 acpi_integer;
> >  /* Pointer/Integer type conversions */
> >
> >  #define ACPI_TO_POINTER(i)              ACPI_CAST_PTR (void, (acpi_size) (i))
> > -#define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p, (void *) 0)
> > -#define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f), (void *) 0)
> > +#define ACPI_TO_INTEGER(p)              ((uintptr_t)(p))
> > +#define ACPI_OFFSET(d, f)               offsetof(d, f)
> >  #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
> >  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
> >
> > --
>
> Queued up as 5.16 material, converted into an upstream ACPICA pull
> request and submitted, thanks!

And reverted from there, because it introduced build issues.

Can we use alternative definitions that don't depend on uintptr_t and
offsetof()?
