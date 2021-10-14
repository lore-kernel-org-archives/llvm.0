Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9C772
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 19:20:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id s64so17090372yba.11
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghIdK0FoHMlyldN0eJzj8LVeRYAc3FvVHoGe9rMJ4DU=;
        b=Rdbokmn+vqYcp9RP1CdzAdGBb0+6iL3BSsHZPlPYuGsJjZOpAdYiqOON6DAEczpYsE
         LenCbwzFyuSGvvtrFRk4JEHsdmWPV44CLu7FWG+E+xsOQ+OD35/fF8/cVSqs2KTQNKGA
         y/qUMH997gw3ziV3d20AdeugL7H8yY4Lysdo4WMMCiObxN+TH8YUJJYTILo7xbIN3mUz
         Hltlu9/grCyju0Q+MOYpjzxPwMq9/zAeDqcDdxuSDwQEwXny6khtrJZ4m0Z2R2UrUqic
         OXnwY3oM3Nm4gfoakoMIqVdFz5InaF8YWHCSHD9SgNv1ztzN9MqyjJbT9/8XFvVX3J5C
         hHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghIdK0FoHMlyldN0eJzj8LVeRYAc3FvVHoGe9rMJ4DU=;
        b=7Pi07mcxZOxFNPBs8iB6qesCSGV+egtqDcVnL7eeFUB+rHxttm8jrNd536huPUcYrT
         O8TtwszJgqwnYS6zXa+lPDoz9EKffyZZswMx0gB6BwPjDQJbFhxHuUv1ZBnv21p0e7PH
         2GeyDFZ3blyUBLH0On2iH+ZL+o/tmFv8Nuc5fZJHo2HDd0cAsNxCaZDyz/T8hJplKcVp
         UgV4JoeAytB9vEwlivMNu3ctODk1ytbFnijJ8WPggfgg+g3pNtZgkIKsAw+LXD/xghsk
         2PHN5lJZg0GhVtLNTPUe5RHD4/FCCSuNZP9keqAPCk/91+/qCyAKFBnZRIC7R28U14+Y
         n4fQ==
X-Gm-Message-State: AOAM532Y0eObP8XmUKod6zUyyZLBWalvh8A0wR9N3jkRJeREuJlNi3Lv
	BTC2eqGToXOlZNMk240Z9jKPpzddh87wIF6GoBL/GA==
X-Google-Smtp-Source: ABdhPJyryvz9R2IZXRTVQhGXXspp67GbOs3I+aFZqoKFLwt3dpeEIXsSEe9qSwJn/Dagp97NYpK+qENgSS9hP+//AOc=
X-Received: by 2002:a25:6908:: with SMTP id e8mr8035718ybc.289.1634239254220;
 Thu, 14 Oct 2021 12:20:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-2-samitolvanen@google.com> <YWgE4iTPGr/ruu8e@hirez.programming.kicks-ass.net>
In-Reply-To: <YWgE4iTPGr/ruu8e@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 14 Oct 2021 12:20:43 -0700
Message-ID: <CABCJKufkH+2A-CySxHAvfZYzpvoytmRZe2_J2=Wv-kh80d=oyA@mail.gmail.com>
Subject: Re: [PATCH v5 01/15] objtool: Add CONFIG_CFI_CLANG support
To: Peter Zijlstra <peterz@infradead.org>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 3:23 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Oct 13, 2021 at 11:16:44AM -0700, Sami Tolvanen wrote:
> > diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
> > index 1f2ae708b223..5fe31523e51f 100644
> > --- a/tools/objtool/arch/x86/decode.c
> > +++ b/tools/objtool/arch/x86/decode.c
> > @@ -63,6 +63,23 @@ bool arch_callee_saved_reg(unsigned char reg)
> >       }
> >  }
> >
> > +unsigned long arch_cfi_section_reloc_offset(struct reloc *reloc)
> > +{
> > +     if (!reloc->addend)
> > +             return 0;
> > +
> > +     if (reloc->type == R_X86_64_PC32 || reloc->type == R_X86_64_PLT32)
> > +             return reloc->addend + 4;
> > +
> > +     return reloc->addend;
> > +}
> > +
> > +unsigned long arch_cfi_jump_reloc_offset(unsigned long offset)
> > +{
> > +     /* offset to the relocation in a jmp instruction */
> > +     return offset + 1;
> > +}
> > +
> >  unsigned long arch_dest_reloc_offset(int addend)
> >  {
> >       return addend + 4;
> > diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
> > index b18f0055b50b..cd09c93c34fb 100644
> > --- a/tools/objtool/elf.c
> > +++ b/tools/objtool/elf.c
>
> > @@ -575,6 +580,49 @@ static int read_rela_reloc(struct section *sec, int i, struct reloc *reloc, unsi
> >       return 0;
> >  }
> >
> > +/*
> > + * CONFIG_CFI_CLANG replaces function relocations to refer to an intermediate
> > + * jump table. Undo the conversion so objtool can make sense of things.
> > + */
> > +static int fix_cfi_relocs(const struct elf *elf)
> > +{
> > +     struct section *sec;
> > +     struct reloc *reloc;
> > +
> > +     list_for_each_entry(sec, &elf->sections, list) {
> > +             list_for_each_entry(reloc, &sec->reloc_list, list) {
> > +                     struct reloc *cfi_reloc;
> > +                     unsigned long offset;
> > +
> > +                     if (!reloc->sym->sec->cfi_jt)
> > +                             continue;
> > +
> > +                     if (reloc->sym->type == STT_SECTION)
> > +                             offset = arch_cfi_section_reloc_offset(reloc);
> > +                     else
> > +                             offset = reloc->sym->offset;
> > +
> > +                     /*
> > +                      * The jump table immediately jumps to the actual function,
> > +                      * so look up the relocation there.
> > +                      */
> > +                     offset = arch_cfi_jump_reloc_offset(offset);
> > +                     cfi_reloc = find_reloc_by_dest(elf, reloc->sym->sec, offset);
> > +
> > +                     if (!cfi_reloc || !cfi_reloc->sym) {
> > +                             WARN("can't find a CFI jump table relocation at %s+0x%lx",
> > +                                     reloc->sym->sec->name, offset);
> > +                             return -1;
> > +                     }
> > +
> > +                     reloc->sym = cfi_reloc->sym;
> > +                     reloc->addend = 0;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
>
> If that section ever gets modified and we end up running
> elf_rebuild_reloc_section() on it, we're in trouble, right?
>
> Do we want a fatal error in elf_rebuild_reloc_section() when ->cfi_jt is
> set?

That's a valid point. Since ->cfi_jt is only set for jump table
sections, I think we'll need a different flag for this though.

Sami
