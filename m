Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFAB208D5
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 17:21:33 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-414ba610766so222881cf.0
        for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695489693; x=1696094493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA637fn4lFty7zWiP+OrSwzPySKA2HmpKzTELZBFHyM=;
        b=ZMEhWOcSaMRMCXH6yJeUfxbojyDzkkgYwKWbCTjk7UcowbyNqWk6MqaVcEJRJpUIwB
         AF+YL8AWOE32cLZHSRvN07cgyZARvbUHmG2Zoh23OcoZAsQFQJh1WAgTn26h6P4NH7xk
         ixs6MEEPloSTFWVZEIm3WsfGsdNN1PqaMFsjC2yYTJfHRJqA1rXUOsWrB6H3R2AxX1yn
         NWVmr+zuqxVzZg01B2QT7Fav+aQywYFc+B8rCA/TDrvcSsU9VC/bhg6oLaOMy1iRzphC
         NcgrWZifNx8V40zK13EeIT9oYp/+FB4UUE5I9UMOO+wAV5ZnHjyeDDHoxpK6TFjBTdRC
         qY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695489693; x=1696094493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JA637fn4lFty7zWiP+OrSwzPySKA2HmpKzTELZBFHyM=;
        b=Gbzobnmk+GYRJniHCSJMDTBVgOUf1bgcaHTxo9BDqlJh/5ayGqMzwN1clR/i+qZmkM
         skvKCn55BwDrsl6pEeUtkwrAzwCKsMoNGhqC1jYXgwweylk2EQj4PvYGkhntdxeqVh0I
         Yol6aa5yfv5FU0GiLGsFSPQKKcIg9Co0bCxfxgU6UBTFbfh53EuXyLKWkdUkS8FlDtpT
         odzmBb5d96olD6XgrejOKgPanFWVQGf/Mk1qVpOSPRi9oL/wyWYPGkJVUY+KtkBZFrUy
         IF0TqSHj9HOnvtkRJeH8UQRnS/Pob+blgb/dZLg0CnEXtZ+Pj9rJUVrMx/C5f8uczb5A
         WSFw==
X-Gm-Message-State: AOJu0YwAmg1DjaVO9UYOWgqZjgYwj24W9LWmQofWxscxdAJ17a/Vm1Rz
	QSeOjkFJmaoZnngKdPEBc8lw8crDxMcdye0kyrGeBA==
X-Google-Smtp-Source: AGHT+IHpcbQKbg/M1gEo5U5bAAeOREpxxwaaVhXM9IzKqk+ZthWEQOqOrKTgUKmSbzmvQRoRG22wEHqEIktpTxEYqUw=
X-Received: by 2002:a05:622a:107:b0:412:16f:c44f with SMTP id
 u7-20020a05622a010700b00412016fc44fmr214013qtw.6.1695489692762; Sat, 23 Sep
 2023 10:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230918210631.3882376-1-jbrennen@google.com> <CAK7LNASSgCFYequw+0zQpUC-9yLHvJLHZ97Ko1ejUYZVTkM81w@mail.gmail.com>
In-Reply-To: <CAK7LNASSgCFYequw+0zQpUC-9yLHvJLHZ97Ko1ejUYZVTkM81w@mail.gmail.com>
From: Jack Brennen <jbrennen@google.com>
Date: Sat, 23 Sep 2023 13:21:21 -0400
Message-ID: <CAF5hLgJOMJ70whVsPhZgsiVGYv10S8mpXvzY1HnreV6X4oZg4A@mail.gmail.com>
Subject: Re: [PATCH] modpost: Optimize symbol search from linear to binary search
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mainly just clarifying that we're willing to change the behavior in corner
cases? The existing behavior has one set of quirks about which symtab entry
is returned, and your proposed behavior has another different set of quirks=
.

It's probably OK to break builds which have an undocumented assumption
about the order of symtab entries; personally, I'd rather not risk that mys=
elf,
but if somebody with more experience is willing to back that decision, I'm
OK with it.

Also, there's an alternative approach that uses bsearch from the standard
library and a common comparison function between qsort and bsearch. I
considered this alternative earlier; maybe you would prefer it because it
eliminates having to reimplement a binary search algorithm.
I chose not to do it this way because of trying to duplicate the quirks.
If no duplication of the quirks is needed, this becomes easier.

The idea for that is to build a sorted array of syminfo that look like this=
:

(section_index, addr_lo, addr_hi, sym_lo, sym_hi)

What this represents is the situation where for any lookup in the
range from (section_index, addr_lo) to (section_index, addr_hi)
inclusive, the nearest symbol will be either sym_lo or sym_hi.
There are four different meanings for (sym_lo, sym_hi):

(sym_lo =3D 0)
This is a placeholder for a duplicated address, and it cannot
compare equal to anything. After we sort the array, we set all
of the duplicated addresses except for the last one to sym_lo =3D 0.

(sym_lo =3D MAX_SYM)
This is used to designate an address being looked up. When this
is seen, it compares equal to any other syminfo that has an
overlapping range.

(sym_lo !=3D 0, sym_hi =3D 0)
This represents the last range in a section. There's no following
address that could match. Should also have addr_hi =3D MAX.

(sym_lo !=3D 0, sym_hi !=3D 0)
This represents a range in a section that's not the last range.
sym_hi may be usable to satisfy the lookup, but only if it's
closer than sym_lo and if allow_negative is true. Note that
the address of sym_hi will be addr_hi+1, so we don't need any
additional code to fetch that address.

Here's a sample comparison function:
int syminfo_compare(const void *a, const void *b) {
  const struct syminfo *sym1 =3D a;
  const struct syminfo *sym2 =3D b;

  if (sym1->section_index > sym2->section_index)
    return 1;
  if (sym1->section_index < sym2->section_index)
    return -1;
  if ((sym1->sym_lo =3D=3D MAX_SYM && sym2->sym_lo !=3D 0) ||
      (sym2->sym_lo =3D=3D MAX_SYM && sym1->sym_lo !=3D 0)) {
    /* Overlap is equality - test for it */
    if (sym1->addr_hi >=3D sym2->addr_lo &&
        sym2->addr_hi >=3D sym1->addr_lo) {
      return 0;
    }
    /* No overlap, fall through */
  }
  if (sym1->addr_lo > sym2->addr_lo)
    return 1;
  if (sym1->addr_lo < sym2->addr_lo)
    return -1;
  /* Note that if we are comparing a lookup (MAX_SYM) with
     a placeholder (0), the lookup always compares greater.
     This causes us to search to the "right" of the placeholder
     for a match, which is what we want. */
  if (sym1->sym_lo > sym2->sym_lo)
    return 1;
  if (sym1->sym_lo < sym2->sym_lo)
    return -1;
  return 0;
}

So this greatly simplifies the back-end searching. It's a bsearch()
which gives you either a miss, or one or two alternatives for the result.
On the front end, you have an extra step after sorting which massages the
search array into the right configuration.  There's actually not much code
needed to do that.

Is that of interest?  The leveraging of bsearch() in that way?

A few other responses below...

On Sat, Sep 23, 2023 at 4:50=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> > +/* Populate the search array that we just allocated.
> > + * Be slightly paranoid here.  If the ELF file changes during processi=
ng,
>
> I could not understand. In which case, the ELF file changes?
>
> modpost loads the entire file to memory first..
>
> In which scenario, the memory content changes?
>

modpost doesn't load the entire file, it uses mmap to map it into the
address space.The easiest way to imagine this being an issue is that some
buggy parallelization happens and something is modifying vmlinux.o while
modpost is processing it.  Of course it's probably acceptable to say,
"Don't do that!"

There are two alternatives here: actually read in the entire file, which
is certainly suboptimal, or just live with the fact that mmap makes no
guarantees about whether changes in the file are reflected in the memory ma=
p.

> > +       /* A bit of paranoia; make sure that the end sentinel's address=
 is
> > +        * different than its predecessor.  Not doing this could cause
> > +        * possible undefined behavior if anybody ever inserts a symbol
> > +        * with section_index and addr both at their max values.
>
> I could not understand this comment.
>
> If section_index and addr both at their max values at [table_size - 2],
> ->table[table_size - 2].addr + 1 wraps to zero.
>
> The table is not sorted any longer?
>

That's correct, the table would not be sorted any longer. But by design,
we never do a relational comparison against the end sentinel. But if
we rework the search, either by your suggestion or by using bsearch(),
this sentinel goes away.
