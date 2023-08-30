Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EC4538A
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 13:25:12 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6beff322a97so3099502a34.3
        for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693401911; x=1694006711; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmogliSTtL2RB5d6BjlDVGsgCldCZrhobb3z+lU+kTo=;
        b=CVeqRwQu78rPTghPVhmlo+3JJsvRbZMR/be7TlCOAdoEi/XRu25Llff+rBHC89ctf2
         ZAexVghc5TIfA/Ofk7PdVB2wliGylfW2qt7i754g9gfvuQcl+7mtGn+rD9y9jGErtCXd
         tYHEYMd0+A+PhIIOlTRJ4uy7cJZxetp5MQPyZhaWESA4AhMhr8d9aXUhLYlOEPwsS2nr
         XXrMgpyS0lBlwG/K4XQ2HQJlT2fH/e8XZrz8nNsyVBFFHJgpxRVgo+ZLDPJL5pvqYBME
         mRE6CbnpvraAeEpebRgwMgZbznXDQEpKfsEYt8UHW6q8Ab81jSMFp2De+xNtx0M+B8Ym
         dZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401911; x=1694006711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmogliSTtL2RB5d6BjlDVGsgCldCZrhobb3z+lU+kTo=;
        b=cTWPjK0YChrz4bMb0KEKr8N+y/8aC27jCxv+AGlqo9DAcX+rZgGKNttWoSvd2TaxsU
         uh9V0RNpywRugOxi2ohv6LkzX+d0Mov32DJqZrKuqURPXtgx/VlFAwJi51lrF7ZWw1d6
         aE5qYHG2wjSw2H2QfnaHJiwH2vMRpxvVoK+a00YftVGphVSZxSEl3nyWlFCz/0VYhNpY
         tHZogayzcCfu9agRXQUcjTJbOF12tZ0uH84k0xNGpGJC+uVZICPAk+kwUJeeBAw9cILw
         8CdfmHDARt4NahQ2YQ2bh1a+D+C4pvqqo2kHlw4Z/gUzsDfOhPYZaFW2dMhNCfvxtBE6
         e1CQ==
X-Gm-Message-State: AOJu0YxQr2YsPzKuNqtqvy95iLTq4qllJowDtBbIUsYUmNvej9by9A8A
	CAUdxG6+Rivqa041IEZkvX+ixCItvCmasypq6Jw=
X-Google-Smtp-Source: AGHT+IGcm+fuYV6DElZl0ERELQLCKFcV4jDm/YiJBfQen9r6vTRbRZD6JbCmADX4a3ozRdhakxdldUDiTEXW6Kpe6p0=
X-Received: by 2002:a4a:2a1c:0:b0:573:55f4:516a with SMTP id
 k28-20020a4a2a1c000000b0057355f4516amr1923557oof.3.1693401911143; Wed, 30 Aug
 2023 06:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829-missingvardecl-efi-v1-1-13d055a55176@google.com> <CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et5=W=ZRrQatWnQ@mail.gmail.com>
In-Reply-To: <CAMj1kXE_xs+wWno4G4U+6CFCOwO7JWcmNv4et5=W=ZRrQatWnQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Aug 2023 16:24:34 +0300
Message-ID: <CAHp75VeEvWXQoMwfmMixw_DHWrXq3=eSPkxgzJaKTT0L3G_Fpg@mail.gmail.com>
Subject: Re: [PATCH] efi: fix -Wmissing-variable-declarations warning
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Darren Hart <dvhart@infradead.org>, 
	Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-efi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2023 at 2:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
> On Wed, 30 Aug 2023 at 00:54, Justin Stitt <justinstitt@google.com> wrote=
:

...

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
> > These variables are not externally declared anywhere (AFAIK)
>
> They are:
>
> drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute
> efi_attr_fw_vendor;
> drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute efi_attr_r=
untime;
> drivers/firmware/efi/efi.c:extern __weak struct kobj_attribute
> efi_attr_config_table;
>
> > so let's add the static keyword and ensure we follow the ODR.

> This won't work.
>
> Those variables are referenced via weak references in generic code.
> The idea is that the weak references resolve to NULL pointers on
> architectures other than x86, terminating the array early and hiding
> the non-existent variables.
>
> Making them static in arch/x86/platform/efi/efi.c means that these
> references will remain unsatisfied, and so the variables will no
> longer be exposed on x86 either.

So it means that we have no definitions in the header for these, right?

--=20
With Best Regards,
Andy Shevchenko
