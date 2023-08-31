Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A980A19BCF
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 23:18:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-500b0f06136so2643003e87.0
        for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 16:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693523901; x=1694128701; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQdtXN7BCCE8wEkmepaEXr3RJP5QKmKAaoV5neq+eqc=;
        b=EG024z401SZKrd+yNmK9Dh7viiY1MSU+FX/g6a8ZpUPJekLy5SjwXqeI4F0ImHcwnf
         7OOZrUGnWhRExtK6GS8T0RZm6nqyl9h9KOUSv7bBtGro4F7UFr5r0YpSYDtm/YSFOJuz
         k+9O6YqdptGU23kxO3m97BwmaMnA1HGMKkp5POg6BUDMVpB1YsjV9NSqmBywbnHJGKKF
         LmTXNq3g10kHYKvdjiMRNcnZ35Q89Sj3NjAG8SOvhjtTOr8hwh9/ujaOwBltL1yyhbcB
         e7YG43xYE0U3lyTnP9RfA8snOTY0iakuyKHObWU6rHVwGnLXvpeRJ0PU2bSdZFyBHUsh
         PiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693523901; x=1694128701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQdtXN7BCCE8wEkmepaEXr3RJP5QKmKAaoV5neq+eqc=;
        b=Hk6LIe+sDJwKdYfhfLjiN0kIMzyM+CFnhX3bArH3Gig/JngjKpaSFypNKYxvVKvQST
         rhdh6OwV18wCqWLbSDrpXQsKEZWAa2zHvU+rJlMvgplfqNgkZtfxPbta3sLXtjmhESg5
         JjaTmf0xPKf6UmVTAb6Z3a+S1BZGfMj7wWoAvUxFp7635e4h5rpCdIo02mzzjN4cXjG0
         kDTZTHOlkObBsDouVMzEDimbLqX994SvtGnnZH2xIQs5KPte+Z3wO8AYk+n6MSPBnlWA
         wjh9/ynFxHA1jMRSaj7bwqsVzyolhl5Tr4AK3SBSVs1UL9fzjcbL/fsWbf5N2dt7FxH8
         kYVQ==
X-Gm-Message-State: AOJu0YzTAFERq4q5M5AKzlwJfV7b5OQqlXLtmRjNp2LLUhN9fdy5PHiO
	kVPjxaCNCt008GTnnsdp2eTx/AZoEJK6z3NVqaxcNQ==
X-Google-Smtp-Source: AGHT+IGF7FARKDfzgNhZTrXEMgQ33Qx24qL0GzFdC/NvjWYOlsJlssFkiz5fqsRhqRad7l2kK7m8mYKpWFTOO6p+9Lw=
X-Received: by 2002:a05:6512:69:b0:500:95f6:ba3d with SMTP id
 i9-20020a056512006900b0050095f6ba3dmr388357lfo.21.1693523901350; Thu, 31 Aug
 2023 16:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829-missingvardecl-audit-v1-1-34efeb7f3539@google.com> <202308311409.F4EC8BC674@keescook>
In-Reply-To: <202308311409.F4EC8BC674@keescook>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 31 Aug 2023 16:18:10 -0700
Message-ID: <CAFhGd8rZdRw1EX-=d7o57TqUc2OacNK-Uciniup=bvtyfsoxgw@mail.gmail.com>
Subject: Re: [PATCH] x86/audit: fix -Wmissing-variable-declarations warning
 for ia32_xyz_class
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 2:11=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> On Tue, Aug 29, 2023 at 10:33:16PM +0000, Justin Stitt wrote:
> > When building x86 defconfig with Clang-18 I get the following warnings:
> > | arch/x86/ia32/audit.c:6:10: warning: no previous extern declaration f=
or non-static variable 'ia32_dir_class' [-Wmissing-variable-declarations]
> > |     6 | unsigned ia32_dir_class[] =3D {
> > | arch/x86/ia32/audit.c:11:10: warning: no previous extern declaration =
for non-static variable 'ia32_chattr_class' [-Wmissing-variable-declaration=
s]
> > |    11 | unsigned ia32_chattr_class[] =3D {
> > | arch/x86/ia32/audit.c:16:10: warning: no previous extern declaration =
for non-static variable 'ia32_write_class' [-Wmissing-variable-declarations=
]
> > |    16 | unsigned ia32_write_class[] =3D {
> > | arch/x86/ia32/audit.c:21:10: warning: no previous extern declaration =
for non-static variable 'ia32_read_class' [-Wmissing-variable-declarations]
> > |    21 | unsigned ia32_read_class[] =3D {
> > | arch/x86/ia32/audit.c:26:10: warning: no previous extern declaration =
for non-static variable 'ia32_signal_class' [-Wmissing-variable-declaration=
s]
> > |    26 | unsigned ia32_signal_class[] =3D {
> >
> > These warnings occur due to their respective extern declarations being
> > scoped inside of audit_classes_init as well as only being enabled with
> > `CONFIG_IA32_EMULATION=3Dy`:
> > | static int __init audit_classes_init(void)
> > | {
> > | #ifdef CONFIG_IA32_EMULATION
> > |     extern __u32 ia32_dir_class[];
> > |     extern __u32 ia32_write_class[];
> > |     extern __u32 ia32_read_class[];
> > |     extern __u32 ia32_chattr_class[];
> > |     audit_register_class(AUDIT_CLASS_WRITE_32, ia32_write_class);
> > |     audit_register_class(AUDIT_CLASS_READ_32, ia32_read_class);
> > |     audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ia32_dir_class);
> > |     audit_register_class(AUDIT_CLASS_CHATTR_32, ia32_chattr_class);
> > | #endif
> > |     audit_register_class(AUDIT_CLASS_WRITE, write_class);
> > |     audit_register_class(AUDIT_CLASS_READ, read_class);
> > |     audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
> > |     audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
> > |     return 0;
> > | }
> >
> > Lift the extern declarations to their own header and resolve scoping
> > issues (and thus fix the warnings).
> >
> > Moreover, change __u32 to unsigned so that we match the definitions:
> > | unsigned ia32_dir_class[] =3D {
> > | #include <asm-generic/audit_dir_write.h>
> > | ~0U
> > | };
> > |
> > | unsigned ia32_chattr_class[] =3D {
> > | #include <asm-generic/audit_change_attr.h>
> > | ~0U
> > | };
> > | ...
>
> I would expect checkpatch to warn about bare "unsigned", which is frown
> on these days. :) I think __u32 should be fine here...? (Why is it __u32
> instead of u32, btw?)

Yeah, checkpatch doesn't like it. I was just trying to mirror the
implementation in audit.c as closely as possible:
|     unsigned ia32_dir_class[] =3D {
|       #include <asm-generic/audit_dir_write.h>
|       ~0U
|     };


>
> But otherwise, yes, looks good.

Thanks for the feedback here. Should I send a v2 where I changed _all_
instances of `unsigned` in both audit.c and audit.h to be `u32`? Or
perhaps, `unsigned int`.

>
> -Kees
>
> --
> Kees Cook
