Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C666AA3
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 17:56:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so7636587a12.2
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693418201; x=1694023001; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXI8G58qBJITCVjge68+nl9obJSgD1GdUL6oiLmDNDI=;
        b=iMww/DK+Rs5vE9IKrppOoEk4VjwNLapc3KFFzR4VChxh040WsSed0RqMYMgUT1br2R
         +qqcC0Mb2swRHczKHMswS2Pt2y+C6MSvHxt5WhIz3Z7SPuw8VWJo8CqDQ0Sv3pgOHruN
         ERYARa2F09kM+uQu5ebWgoDUTpfaNkpWM4WF2yFFvmCmLfzcyKb75Q4uOOgIMJ2DGQy0
         gsnntO9DTRMGI0NfUZzKIuhhtu6P1uhaUoFesdqV7aqv8sAQqnpQut940hoM6DxWd+9P
         f56IwKx1gVhK7TwvA758eNShN3ya1G+Mjg3CjDzthr2LD4Bd81mpaZKb4BqgawHoo8Nu
         pdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693418201; x=1694023001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXI8G58qBJITCVjge68+nl9obJSgD1GdUL6oiLmDNDI=;
        b=iazD/Kfu8DPmxp8V3LnqGOi2mcYdfAjyByl551OpnvA23MnpCz+OUht6Qa5QNoWnJ4
         pLrudxgJQj6sh0YrdSbJvVf1RMHY5e1MMcGI0i4g+SbitE4nYfU8jd3TSNgrFQMMKwWS
         ceLXC/gwUM48hgNNSWGXyhCGDHXuGNsnMXEtR2fnQeaMfsUsU87BTHK3UPlFXzPqrfBq
         DWhwKQY5vOQrOjgn75rmr2/z7IbZz070Sw46Iw6mhd0UPq6DZRMtulyhFD9LmjKzEPmS
         hvnY1mYmqtBCc8dOQCKo2A+V9IDgl/trsu+Sy/kNtV197phQy7ANNXR831kJCnqlitT2
         DlEw==
X-Gm-Message-State: AOJu0YwYo0escTCiL/zckiuLNZ7imw+S7yzJWGbASxJzkUJKdWJRpSK0
	afKLEoDXy7W1LIsAnBIpMQY6qTJOXLg+JfqqrAZDyQ==
X-Google-Smtp-Source: AGHT+IFrwH9v8R15ct++h699j0jys5ZO41JUXqWbc8SydhI9De04gDz2U2m8CUBKU+nT/3exLWOKvVLmzC8kiqA2yCI=
X-Received: by 2002:aa7:d4d2:0:b0:525:469a:fc47 with SMTP id
 t18-20020aa7d4d2000000b00525469afc47mr2312236edr.22.1693418201087; Wed, 30
 Aug 2023 10:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230830-missingvardecl-efi-v2-1-818081a204d2@google.com> <CAMj1kXGbBx=gWsDJ7nXPwygOvX=Ek3tPQmZ_fQpBNmVg5_7u9A@mail.gmail.com>
In-Reply-To: <CAMj1kXGbBx=gWsDJ7nXPwygOvX=Ek3tPQmZ_fQpBNmVg5_7u9A@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Wed, 30 Aug 2023 10:56:28 -0700
Message-ID: <CAFhGd8rWih8CNQyWQmcfsBoraVZ1xb8nvuxRGCJDPKdC_O99mA@mail.gmail.com>
Subject: Re: [PATCH v2] efi: fix -Wmissing-variable-declarations warning
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 10:54=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Wed, 30 Aug 2023 at 19:51, Justin Stitt <justinstitt@google.com> wrote=
:
> >
> > When building x86/defconfig with Clang-18 I encounter the following war=
nings:
> > | arch/x86/platform/efi/efi.c:934:23: warning: no previous extern decla=
ration for non-static variable 'efi_attr_fw_vendor' [-Wmissing-variable-dec=
larations]
> > |   934 | struct kobj_attribute efi_attr_fw_vendor =3D __ATTR_RO(fw_ven=
dor);
> > | arch/x86/platform/efi/efi.c:935:23: warning: no previous extern decla=
ration for non-static variable 'efi_attr_runtime' [-Wmissing-variable-decla=
rations]
> > |   935 | struct kobj_attribute efi_attr_runtime =3D __ATTR_RO(runtime)=
;
> > | arch/x86/platform/efi/efi.c:936:23: warning: no previous extern decla=
ration for non-static variable 'efi_attr_config_table' [-Wmissing-variable-=
declarations]
> > |   936 | struct kobj_attribute efi_attr_config_table =3D __ATTR_RO(con=
fig_table);
> >
> > These symbols are declared extern in drivers/firmware/efi/efi.c. Move
> > the declarations to linux/efi.h to resolve these warnings.
> >
> > Also, trim a trailing space from efi_set_variable_t typedef.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1920
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>
> Thanks, I'll take this as a fix.
>
> > ---
> > Changes in v2:
> > - Don't use static. Instead move symbols to header file (thanks Ard)
> > - Remove duplicated warnings output from b4 (thanks Ard)
> > - Link to v1: https://lore.kernel.org/r/20230829-missingvardecl-efi-v1-=
1-13d055a55176@google.com
> > ---
> > Note: build-tested.
> >
> > Also, a question: Why does the compiler warn at all? The extern
> > declarations _do_ exist as Ard points out [1].
> >
> > [1]: https://lore.kernel.org/all/CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et=
5=3DW=3DZRrQatWnQ@mail.gmail.com/
>
> Those declarations are not observed by the compiler when building .c
> files other than drivers/firmware/efi/efi.c, so they essentially don't
> exist when compiling arch/x86/platform/efi/efi.c.

I see, the linker is resolving these later then?

>
>
> > ---
> >  drivers/firmware/efi/efi.c | 3 ---
> >  include/linux/efi.h        | 6 +++++-
> >  2 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> > index 1599f1176842..7b4e59ccf09e 100644
> > --- a/drivers/firmware/efi/efi.c
> > +++ b/drivers/firmware/efi/efi.c
> > @@ -161,9 +161,6 @@ static ssize_t fw_platform_size_show(struct kobject=
 *kobj,
> >         return sprintf(buf, "%d\n", efi_enabled(EFI_64BIT) ? 64 : 32);
> >  }
> >
> > -extern __weak struct kobj_attribute efi_attr_fw_vendor;
> > -extern __weak struct kobj_attribute efi_attr_runtime;
> > -extern __weak struct kobj_attribute efi_attr_config_table;
> >  static struct kobj_attribute efi_attr_fw_platform_size =3D
> >         __ATTR_RO(fw_platform_size);
> >
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index ab088c662e88..32f7ca60b0e9 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -287,7 +287,7 @@ typedef efi_status_t efi_get_variable_t (efi_char16=
_t *name, efi_guid_t *vendor,
> >                                          unsigned long *data_size, void=
 *data);
> >  typedef efi_status_t efi_get_next_variable_t (unsigned long *name_size=
, efi_char16_t *name,
> >                                               efi_guid_t *vendor);
> > -typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_=
t *vendor,
> > +typedef efi_status_t efi_set_variable_t (efi_char16_t *name, efi_guid_=
t *vendor,
> >                                          u32 attr, unsigned long data_s=
ize,
> >                                          void *data);
> >  typedef efi_status_t efi_get_next_high_mono_count_t (u32 *count);
> > @@ -632,6 +632,10 @@ typedef struct {
> >
> >  extern unsigned long __ro_after_init efi_rng_seed;             /* RNG =
Seed table */
> >
> > +extern __weak struct kobj_attribute efi_attr_fw_vendor;
> > +extern __weak struct kobj_attribute efi_attr_runtime;
> > +extern __weak struct kobj_attribute efi_attr_config_table;
> > +
> >  /*
> >   * All runtime access to EFI goes through this structure:
> >   */
> >
> > ---
> > base-commit: 706a741595047797872e669b3101429ab8d378ef
> > change-id: 20230829-missingvardecl-efi-59306aacfed4
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >
