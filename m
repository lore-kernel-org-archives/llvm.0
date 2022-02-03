Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662DF2F29
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 19:50:48 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q22so5445430ljh.7
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 11:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aVBeKDKPYFp+Sm22VFGesckBrKnktcRnAdKBFblfodE=;
        b=AbjtmmjGWQpWdgmjPMsIc8GVNpR6kfz4i/s3EjeX9oSZeV1gQ+cJTDv9UvwEH5rH6C
         kMf5vi9O1DUi3v8wRd+r927wglgfPiddZu468FnuMFIuDLhtL3ChMK/MxHI7PBY8gzQ/
         zLOk6W9kMaJbsX0qZJ4X9jOZ6qInlhIMmfIyV/8XOmLBwQhOwmWniKtgiynBLd825bbA
         5uSzfQYGoAvd0YSJGL+WNkDpnmx4YYLhUd06MnlzN/B455n933bNLVnktWVuVW1HPvAL
         YcUfyDkoaKoXtKRPjTYXPkTK/x5PDS1HKlZYI/K/8Dlhe6U9B1tNuyAqaavcy5dWL9Sl
         K7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aVBeKDKPYFp+Sm22VFGesckBrKnktcRnAdKBFblfodE=;
        b=lilC3gaJ5dBgATFGAJCfgv/OSnvePw8TI/8k8e2k/QquiHK7lLPlW1kAIbVPCRMAwO
         ZurKNkaFV/WITtFKazmdrQGS8QBoERawDS2cm8J0VaGANandurbj6esiUvx9xSzD5GGm
         mxBSg1u6TMyOo1QzL9TrYfZM683v8HDOxgBEmdZ0myoWObTx0c3CBXW9/IPzs9zX/4ya
         9AaJgjADl7lGwYoOlXoaKybzMzQfcV4iUVcEwaReefTgJtCgBBQfg7tbKvlD4BItwACr
         B8Q44lN60pIo2hM1fXUsDDDMCBPC3XHYviRx/sGda8E8q8GGuNXLw2KKB3FF3ceFBv69
         dJDw==
X-Gm-Message-State: AOAM531wGZ1eVIDFWef3hHTJO/lCO5x45iTEnf1JAjn5hB+mnYuVwHFI
	BFGlfr+A4KJ4OGj6wzPbdVRQBdI2QDmJIVnAxPxkDg==
X-Google-Smtp-Source: ABdhPJxc3sO/oNI/Ujb2wt/q0D3RYB++ahedSpN+JSsytdZf3f4yykiSmktj8jSXmlhjNSYVKgmXGFiLyRxkOQ+A/4w=
X-Received: by 2002:a2e:954:: with SMTP id 81mr14783838ljj.198.1643917846193;
 Thu, 03 Feb 2022 11:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net> <202202021237.487D3DE73@keescook>
 <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net> <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>
 <202202030911.4914709E@keescook> <CAMuHMdUBKofPP-6EofE3B7d6k0zv0nPJ7e4pjsznPF==ApJ6qg@mail.gmail.com>
In-Reply-To: <CAMuHMdUBKofPP-6EofE3B7d6k0zv0nPJ7e4pjsznPF==ApJ6qg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Feb 2022 11:50:34 -0800
Message-ID: <CAKwvOdnJ3w2Jb9tBZ+JnEfviquj2WktemCd833f=_P66a0qVag@mail.gmail.com>
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
To: Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <keescook@chromium.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	Andy Shevchenko <andy@kernel.org>, Matteo Croce <mcroce@microsoft.com>, 
	Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 10:10 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kees,
>
> On Thu, Feb 3, 2022 at 6:15 PM Kees Cook <keescook@chromium.org> wrote:
> > On Thu, Feb 03, 2022 at 09:04:22AM +0100, Geert Uytterhoeven wrote:
> > > Not if -ffreestanding, which is what several architectures are
> > > using nowadays, to a.o. prevent gcc from replacing calls to stdlib
> > > functions to other stdlib functions (e.g. strncat() -> strlen() +
> > > store, strncmp() -> strcmp()), which breaks linking if the latter is
> > > only provided inline.
> >
> > Hah, for i386:
> >
> > arch/x86/Makefile
> >         # temporary until string.h is fixed
> >         KBUILD_CFLAGS += -ffreestanding
> >
> > This "temporary" is from 2006. ;)\

IIRC I sent a patch removing that. Yeah, Kees even signed off on it.
https://lore.kernel.org/lkml/20200817220212.338670-5-ndesaulniers@google.com/#t
I still think that's the right way to go, perhaps worth a resend to
rekick discussions.

>
> And before that, we had it in the main Makefile.
>
> > 6edfba1b33c7 ("[PATCH] x86_64: Don't define string functions to builtin")
> >
> > Removing that appears to solve it, and appears to build correctly. I'll
> > continue testing.
> >
> > > It works after dropping -ffreestanding.
> >
> > I wonder if the other architectures were just copying x86?
>
> At least on m68k it was added because gcc added new optimizations
> that broke if an architecture provides some functions as inline.
> As the kernel is not supposed to be linked with the standard C
> library, -ffreestanding should be correct, isn't it?

The kernel does not link against a libc; but it does provide many
symbols that libc would provide, with the same or similar enough
semantics that I would strongly recommend we _don't_ use
-ffreestanding in order to get such libcall optimizations (there are a
lot; see https://github.com/llvm/llvm-project/blob/main/llvm/lib/Transforms/Utils/SimplifyLibCalls.cpp
for some examples) and simply use -fno-builtin-* when necessary, or
fix the kernel implementations individually.

-- 
Thanks,
~Nick Desaulniers
