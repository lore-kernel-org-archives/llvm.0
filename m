Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791042FAF
	for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 12:01:54 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id y201so2587627oie.3
        for <llvm@lists.linux.dev>; Wed, 29 Sep 2021 05:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DPTFjBNMYZsH/LoF0h0iC/ghN40ymuV4zkUVlZxxnn4=;
        b=L73EvFV8K5MMr19oC6dF32LWcuseMt+GPwV0g40AEKNnfMMnZdi6JiZr0vIy5UKWhz
         JHj5ioH7gY712iXtbOXkduev5GF5/QV4Y96z6jl5mbRbShCpXoJmKTKD8covpVk3nT9o
         J4T5wrnahdrurQhcek/IlNFAZ5klfjoBr0GjaOFlO5fGUM7p+0wZWpbJSpyI7hjdoZzE
         tUaYM7gx996tymhntTrx25JWgJou7cPAc6Uvxo5Q1JHy07ARqdHpVcR7QgxVPny40mI5
         N24b1aTxGzKXPYpktTeUVCtp/fH4DLy+4bT7iA2itNIqvuDvS7lFLktQ5KjikpXCdLac
         eTZA==
X-Gm-Message-State: AOAM530SavOMxKJH3lmgcm8ZEh4Y7BXkyiXtg9MwzAKAGmmN25WWTePW
	bDy638Y0CWkU9hHkwMozuBj5S7fGR8mus4+kuJk=
X-Google-Smtp-Source: ABdhPJxoNw5TPiy7tXyGhRFCBqyoslPg2WsTrtX+8FsVJTpHKJufbkxvO43p83wgr2KyAiyOScD/EBdm7rFq04tgduc=
X-Received: by 2002:a05:6808:178c:: with SMTP id bg12mr8017044oib.157.1632916913639;
 Wed, 29 Sep 2021 05:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927121338.938994-1-arnd@kernel.org> <92b02547-3aa5-537f-a782-7a25854d88fe@intel.com>
 <BYAPR11MB32560CEAC6CC3C2E93FBBF9387A89@BYAPR11MB3256.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB32560CEAC6CC3C2E93FBBF9387A89@BYAPR11MB3256.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 29 Sep 2021 14:01:41 +0200
Message-ID: <CAJZ5v0gHgMVjKzKUnJ0HkE+Bz7-1Rav3FnLA+ycF94JTw5V=ww@mail.gmail.com>
Subject: Re: [PATCH] ACPI: avoid NULL pointer arithmetic
To: "Moore, Robert" <robert.moore@intel.com>
Cc: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "devel@acpica.org" <devel@acpica.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Len Brown <lenb@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 10:39 PM Moore, Robert <robert.moore@intel.com> wro=
te:
>
> I can take this patch as-is, I think. I'll try for the next acpica releas=
e later this week.

Thanks!


> -----Original Message-----
> From: Wysocki, Rafael J <rafael.j.wysocki@intel.com>
> Sent: Tuesday, September 28, 2021 10:44 AM
> To: Arnd Bergmann <arnd@kernel.org>; Moore, Robert <robert.moore@intel.co=
m>
> Cc: Arnd Bergmann <arnd@arndb.de>; Nathan Chancellor <nathan@kernel.org>;=
 Nick Desaulniers <ndesaulniers@google.com>; Erik Kaneda <erik.kaneda@intel=
.com>; linux-acpi@vger.kernel.org; devel@acpica.org; linux-kernel@vger.kern=
el.org; llvm@lists.linux.dev; Len Brown <lenb@kernel.org>; Rafael J. Wysock=
i <rafael@kernel.org>
> Subject: Re: [PATCH] ACPI: avoid NULL pointer arithmetic
>
> Bob, this is ACPICA material.
>
> Would it be possible to apply this to the upstream from the patch or do y=
ou need  a PR for this?
>
> On 9/27/2021 2:13 PM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There are some very old macros for doing an open-coded offsetof() and
> > cast between pointer and integer in ACPI headers. clang-14 now
> > complains about these:
> >
> > drivers/acpi/acpica/tbfadt.c:86:3: error: performing pointer subtractio=
n with a null pointer has undefined behavior [-Werror,-Wnull-pointer-subtra=
ction]
> >           ACPI_FADT_OFFSET(pm_timer_block),
> >           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actbl.h:376:47: note: expanded from macro 'ACPI_FADT_OFFSE=
T'
> >   #define ACPI_FADT_OFFSET(f)             (u16) ACPI_OFFSET (struct acp=
i_table_fadt, f)
> >
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actypes.h:511:41: note: expanded from macro 'ACPI_OFFSET'
> >   #define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f=
), (void *) 0)
> >
> > ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/acpi/actypes.h:505:79: note: expanded from macro 'ACPI_PTR_DIFF=
'
> >   #define ACPI_PTR_DIFF(a, b)             ((acpi_size) (ACPI_CAST_PTR (=
u8, (a)) - ACPI_CAST_PTR (u8, (b))))
> >
> > ^ ~~~~~~~~~~~~~~~~~~~~~~~ Convert them to the modern equivalents.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   include/acpi/actypes.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/acpi/actypes.h b/include/acpi/actypes.h index
> > 92c71dfce0d5..285bc7b73de3 100644
> > --- a/include/acpi/actypes.h
> > +++ b/include/acpi/actypes.h
> > @@ -507,8 +507,8 @@ typedef u64 acpi_integer;
> >   /* Pointer/Integer type conversions */
> >
> >   #define ACPI_TO_POINTER(i)              ACPI_CAST_PTR (void, (acpi_si=
ze) (i))
> > -#define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p, (void *) 0)
> > -#define ACPI_OFFSET(d, f)               ACPI_PTR_DIFF (&(((d *) 0)->f)=
, (void *) 0)
> > +#define ACPI_TO_INTEGER(p)              ((uintptr_t)(p))
> > +#define ACPI_OFFSET(d, f)               offsetof(d, f)
> >   #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
> >   #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
> >
>
>
