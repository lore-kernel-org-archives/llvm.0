Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030312C81
	for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 15:35:46 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id w10so23738833ybt.4
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0lincm8RXR6uBNLZqXdUZLWmSPqPmrrBGxkwcemXX+k=;
        b=lNkB/tzENYRNN34nvlEabksBcuXaIB/leiAX1+iCfoj/b7p26GFIfxa90d1JOnEKUn
         XZKj9UNrTFBXybsY/8EOO+01cWT21/Loc8ZlO0KeZgGAEpb5ntvlqVZg6ZGUtf3BAYZO
         jwdaDV6nZI/+P4sXBvs3De/832d6ypXLERSvwTkkoSMfwjQ0JMCzvWR0F+wLdrQFmJc4
         HgFYODOdkHQvSTJ5clWvZw+5ydBrccKyIhjM/L5uyxh/RrMM2nSTnNZ5zuYbe2zOO3Zb
         F+IpuoKcRqhb7+B+kUuJtack9NO9oEXz0zG9FnxLitirEkTXyUKjPuvhW3Um9pKU0jjo
         f97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0lincm8RXR6uBNLZqXdUZLWmSPqPmrrBGxkwcemXX+k=;
        b=OZl5Q2ETtwK+t1lFE+EZFTwsHgijoHLE4CfMT3FgjiPaFVZOplAXabGK8jb6djknuU
         sPPIu94FPo7UznW0490S5bKZbAKVpgH6hjE4qhK513F6O1U6FiLB2z3d8vNTJPIYWLMp
         Eqxx4XoObhSv2i8fi01l2FMqQ02odD1oyuW/P7OBjtum1VxhtLmqdYjpmCKWwxApMSOq
         s5aFXUDVCJSYUYrYQ3+qzFCWq+Ibx/Wuhxwj7v1tqBF0qEn4MaOAxC7gTYMowFbcCBom
         K7N8dbOZDVGDbeJtnuloxDHQu/+YCed1dKmG1HLv5zf3xL1zsOdLXbS67MQjhjdq0qao
         Lonw==
X-Gm-Message-State: AOAM532y7Lvn9KjrZpbRflS4+H6dtiGG9LimrhIGwcl4xMPD4tAByQq8
	KDQFLy5cwjIiq2KJFcnf4sTVYdkWgvTJZrZO4pysGA==
X-Google-Smtp-Source: ABdhPJzljSLIPUpS+oPZCNQDD4Du++b8bGyu4mYPoIqhgOBbZGmGRfYID1OXr7Qv58vv/WOKGqkAKULFLdmcQqhh5fk=
X-Received: by 2002:a25:aaec:: with SMTP id t99mr15016754ybi.456.1634312142950;
 Fri, 15 Oct 2021 08:35:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-4-samitolvanen@google.com> <7377e6b9-7130-4c20-a0c8-16de4620c995@www.fastmail.com>
In-Reply-To: <7377e6b9-7130-4c20-a0c8-16de4620c995@www.fastmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 15 Oct 2021 08:35:32 -0700
Message-ID: <CABCJKufbRDv1pfr7aPMcPsqDNJHf+_Otc88TMKg+xnLC-01Kzw@mail.gmail.com>
Subject: Re: [PATCH v5 03/15] linkage: Add DECLARE_NOT_CALLED_FROM_C
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 7:51 PM Andy Lutomirski <luto@kernel.org> wrote:
>
>
>
> On Wed, Oct 13, 2021, at 11:16 AM, Sami Tolvanen wrote:
> > The kernel has several assembly functions, which are not directly
> > callable from C but need to be referred to from C code. This change add=
s
> > the DECLARE_NOT_CALLED_FROM_C macro, which allows us to declare these
> > symbols using an opaque type, which makes misuse harder, and avoids the
> > need to annotate references to the functions for Clang's Control-Flow
> > Integrity (CFI).
> >
> > Suggested-by: Andy Lutomirski <luto@amacapital.net>
> > Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > ---
> >  include/linux/linkage.h | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/include/linux/linkage.h b/include/linux/linkage.h
> > index dbf8506decca..f982d5f550ac 100644
> > --- a/include/linux/linkage.h
> > +++ b/include/linux/linkage.h
> > @@ -48,6 +48,19 @@
> >  #define __PAGE_ALIGNED_DATA  .section ".data..page_aligned", "aw"
> >  #define __PAGE_ALIGNED_BSS   .section ".bss..page_aligned", "aw"
> >
> > +/*
> > + * Declares a function not callable from C using an opaque type. Defin=
ed as
> > + * an array to allow the address of the symbol to be taken without '&'=
.
> > + */
>
> I=E2=80=99m not convinced that taking the address without using & is a la=
udable goal.  The magical arrays-are-pointers-too behavior of C is a mistak=
e, not a delightful simplification.

Sure, if everyone is fine with the extra churn of adding & to the
symbol references, I can certainly switch to an incomplete struct here
instead. I stayed with extern const u8[] because you didn't comment on
the potential churn previously:

https://lore.kernel.org/lkml/CABCJKud4auwY50rO0UzH721eRyyvJ8+43+Xt9vcLgw-SM=
YtHEw@mail.gmail.com/

Boris, any thoughts about using an incomplete struct instead of extern u8[]=
?

> > +#ifndef DECLARE_NOT_CALLED_FROM_C
> > +#define DECLARE_NOT_CALLED_FROM_C(sym) \
> > +     extern const u8 sym[]
> > +#endif
>
> The relevant property of these symbols isn=E2=80=99t that they=E2=80=99re=
 not called from C.  The relevant thing is that they are just and not objec=
ts of a type that the programmer cares to tell the compiler about. (Or that=
 the compiler understands, for that matter. On a system with XO memory or i=
f they=E2=80=99re in a funny section, dereferencing them may fail.)

Makes sense. It sounds like the macro should be renamed then. Josh
wasn't a fan of DECLARE_ASM_FUNC_SYMBOL() and if I understand
correctly, you and Boris feel like DECLARE_NOT_CALLED_FROM_C() is not
quite right either. Suggestions?

> So I think we should use incomplete structs, which can=E2=80=99t be deref=
erenced and will therefore be less error prone.

Another option is to just drop the macro and use something like struct
opaque_symbol instead, as you suggested earlier:

https://lore.kernel.org/lkml/CALCETrVEhL9N_DEM8=3DrbAzp8Nb2pDitRCZGRAVcE288=
MBrJ4ug@mail.gmail.com/

Any preferences? I wouldn't mind having a consensus on the approach
and naming before sending v6. :)

Sami
