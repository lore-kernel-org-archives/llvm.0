Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9099C977
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 20:02:14 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a652700c36so232885ad.0
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681934534; x=1684526534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56W2W/X8fkj8VZX3/1DTAaK9+j9FvXQXuYPz0XAniuc=;
        b=Tm+PqrTiBoRJA04/Kl60G2CqwjByx5la8XcHF9okQZRzsClYBxiJTHt0YG5c7Ih8mT
         LqiugknROCpyehmf+fFE2yLXzkxa7RRDDerSCmGNO6gj8wHE1MUCc2qXLU1NwoxWHQTN
         PB/mAP8j6XUow6402YryLB5jYviHopAJ4iYiURfF9qoPqv16Riw+InNihTXtwAWmPte2
         WzvgnJ1CLUIbSsA3WkAuSE2s+YmMzyBgHqf77zkPrj56JYAOdVHMo01j2j2szEV7YTIA
         39nPjEODCVxQsypbfnaq1e0jji5goKJ9EUboMoqyesJEob+LeW9h6gbLFLLBA+vTiinI
         dJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681934534; x=1684526534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56W2W/X8fkj8VZX3/1DTAaK9+j9FvXQXuYPz0XAniuc=;
        b=hWWAc7Y6Oy2lWLYlSZVveO03S2K7KeT0j3g+NZ6ETNJ/pmQH1gQKfblnUCmu7g5gVu
         J+GlrUgIGEgRSp0DE1OEH0tqv/C8gM5TosJl0nXuUb6u6JBHxOy89JjiaPJuxPjKtYs4
         /E4Xi+cG2XWIdzitAiiZAjvClPSoiZ0CTCsGNhipSTsQBEv8RNF3Qxm8JvQT7ULSmTca
         G/9LEwghpRrd2jmXddIo1dCBBDXhEEP/WJISwRQMBRWIrwJ2hErlZaG0tFobX41TwkjI
         k9hNqYgLJKbj7Nr96hRRg07Gbhltp8G3q5IZmVpp8+YgdjExgyqwpquCekZ6I5xlo4IM
         S6jQ==
X-Gm-Message-State: AAQBX9epaK2ku9lfwijvd7oVCIKo6sOBV5jXXlBwLdLWVZXVQf7PcksN
	Q+Il5AFoivvchpdh9QmU2cCEIif1M9zTQ2mNXwpQRg==
X-Google-Smtp-Source: AKy350bP2Be/0rsmuq+XyQQsawPtRMQK0eA/jETVaSN8vBy4wBas0Titboop37b7IKAN7OP4R+HvW5JzRwQ8J+LMRZI=
X-Received: by 2002:a17:903:228c:b0:198:af4f:de12 with SMTP id
 b12-20020a170903228c00b00198af4fde12mr49157plh.18.1681934534077; Wed, 19 Apr
 2023 13:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414005309.GA2198310@google.com> <CAKwvOd=yQS+0oDC46Hc5D_V0JET8=xbQmAJrpBdg7c4i2EyqHg@mail.gmail.com>
 <CAKwvOdk+D6HuWwAH3EJtwDyPqoiP+2z62ek2hnmbhDV2CJwnbw@mail.gmail.com> <CALGbS4V+x1JkiPL2o59LgtbSQhzg_RKM5TYE7i7qZx0qz23y-g@mail.gmail.com>
In-Reply-To: <CALGbS4V+x1JkiPL2o59LgtbSQhzg_RKM5TYE7i7qZx0qz23y-g@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Wed, 19 Apr 2023 13:02:02 -0700
Message-ID: <CAFP8O3KQRbmgyvuyuxNOa6TZ7MawN7YoGHvpFQ=oibEo3aUfDQ@mail.gmail.com>
Subject: Re: clangd cannot handle tree_nocb.h
To: Florent Revest <revest@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Joel Fernandes <joel@joelfernandes.org>, rcu@vger.kernel.org, 
	nathan@kernel.org, trix@redhat.com, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, paulmck@kernel.org, 
	"revest@chromium.org" <revest@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 6:00=E2=80=AFAM Florent Revest <revest@google.com> =
wrote:
>
> On Tue, Apr 18, 2023 at 6:28=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > + Florent
>
> Hi there!
>
> > Joel, Florent is doing some cool stuff with clangd and kernels (check
> > out the demo at go/linux-kernel-vscode).  I'm pushing Florent to
>
> Apologies for folks outside Google, this is an internal link to a
> kernel dev setup I originally created for myself, then for my team and
> apparently more and more people are starting to use it internally. :)
> If there's enough appetite for it externally too, I'll try to
> open-source it someday. Anyway, in the context of this conversation,
> it's just something that uses clangd. :)
>
> > publish some of the cool stuff he's been working on externally because
> > it is awesome. ;)
> >
> > Florent, have you seen any such issues such as what Joel reported below=
?
>
> Yes, I've seen this problem a bunch of times. Afaiu, Clangd operates
> under the assumption that every source file is a valid compilation
> unit. My understanding is that it's generally a good practice to keep
> things that way and I wouldn't be surprised if the userspace Chrome
> code-base Joel saw enforces this (iirc, it's a rule for
> Google-internal C++ too, all headers must be interpretable
> independently).
>
> However, from the perspective of the C spec, anything can be included
> anywhere and a C file can only make sense if it's included
> after/before certain other things are defined/included. Spontaneously,
> I would call these ".inc" rather than ".h" or ".c" because I would
> expect a source file to be always valid and this suffix makes it
> clearer they depend on their context, but as a matter of fact source
> files that don't compile when interpreted individually are quite
> common in the kernel tree. Other examples that have been reported to
> me include a lot of kernel/sched/*, since many of these files
> (including .c files) are included from kernel/sched/build_policy.c in
> a specific order to form one big compilation unit.
>
> Unfortunately, I don't know of any solution. :( This feels like a
> limit of C or compile_commands.json to me. "compile commands" can not
> be enough to interpret any file, clangd would need a way to express
> "interpret this file as if it were included in that spot of that
> compilation unit" and maybe even need a bunch of heuristics to choose
> one such include spot.
>
> I don't know if clangd has any plan to address this and so far I've
> just lived with these error squiggles.
>

Some information about Clang based language servers

It's good practice to ensure that a header file is self-contained. If
not, for example, if a.c includes a.h, which is not self-contained,
a.h is generally compiled on its own (as if using clang [options] a.h)
to confine diagnostics/completion results to a.h and not to other
headers included by a.c.

However, this design choice may cause language servers to emit
diagnostics that you don't see when building the project.

For my tool ccls, the index file for an included file (e.g. a.h) is
computed when compiling the main source file (a.c). Therefore, if the
project builds successfully, the index is always accurate.

Language servers usually have the limitation that only one
configuration of a main source file is recorded, e.g., you only get
index data for either clang -DA=3D1 a.c or clang -DA=3D2 a.c, not both.
This limitation exists due to technical challenges and practicality.
If a main source file has 10 configurations, when you edit the file,
do you compile it 10 times to get all indexes?

---

My setup is like this. I have been doing it since about 2019, though I
rarely read Linux kernel code :(

Ensure you have the following Clang and LLVM tools. If you build them
by yourself, create a llvm-project build directory, say, /tmp/Rel
```
ninja -C /tmp/Rel clang lld
llvm-{ar,nm,objcopy,objdump,ranlib,readelf,strings,strip}
```

In a Linux kernel source directory,
(https://github.com/MaskRay/ccls/wiki/Example-Projects)
```
PATH=3D/tmp/Rel/bin:$PATH make O=3D/tmp/out/x86_64 ARCH=3Dx86_64 LLVM=3D1 d=
efconfig
PATH=3D/tmp/Rel/bin:$PATH make O=3D/tmp/out/x86_64 ARCH=3Dx86_64 LLVM=3D1 -=
k
bzImage modules  # generate .<target>.cmd files

scripts/clang-tools/gen_compile_commands.py -d /tmp/out/x86_64
```

emacs -nw fs/binfmt_elf.c   # check out lsp-mode and eglot

For neovim, use https://github.com/neoclide/coc.nvim or the built-in
client. I prefer coc.nvim.


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
