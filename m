Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF21CB326
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700674; cv=none; b=B80e9esTUbwFkdedNzkBzxNlpoIAym9Dh0ZPxHzRYsvuh7kI3SCsYXUMzmagURr7pY+JQiu2af1bXCxsR3stqPyQD0hhGG5c3cGpieUAimZO0phTWV0ApxOTeuzkKZY1Z9QIah4kHphqb9cH7BP/TALn2yw7qcW2hjwWgukAY0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700674; c=relaxed/simple;
	bh=pVwawjEv+bQna+TOyVmWLFrZU2pYiQZj6lUOy1p+DLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeAbMPtB2GmTRMcpbTLKfM52jNChtHN8pXcjdUA6mcXNcwLbqlN8b/z/7LfMqLXSwERRvFGU0pN1OWJ6hF2HOwJmTtjU6nMr3Z/Mz3vzAm1liT9vqXgx6f1fpeGiWmLB8p5OKGCeJV5JIsCVlXrO0D4rhzkYkBxvFZNndx7GRWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUEC/WcQ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUEC/WcQ"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-460a8d1a9b7so276581cf.1
        for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729700672; x=1730305472; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=qUEC/WcQLs/VR7d7EPv1IfPm8xoVXYBygeO20SXDKNsCQudmisa8M3NpMr4z9zdT7O
         YEfdIi7/siL2iZEYr1EOlrKISpKptgMB5UR557iNsIPlomrMSqVOEzXVsGBNsa+hX307
         OEMrM8Vz80OQoJVljwukkBtzYM6idj0+7wF1Rb5DqcthjvmNkSYhZFqE8zkPh83r1MZX
         BdPIa9PqToFYKM+DBZFZv3TjuWJLurSyhKAivs9GgqmsLZx6LoGC8LxCvhQA7YIWSvTo
         DyJKUZ4a6BV4MQ1SAHJGfS7Xv0r2j5ObeSV/OPfbudH94ByOGuAPIMnMsWud0nYYBRdb
         n52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700672; x=1730305472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K3v255rwxrb6Xkn/WhIR8L6tyWLq3uTtuFWFOaL4e4=;
        b=uDp7TGWycZmLRPWWqmBr7vAuSs5B18vOmS3HiZ8aSP2ChEzibSoK11KyPAHDvdXGSu
         HAV3mPO2fVk2ukZyZHbhtXf5T+jd0nQ+AN+g0hqqSBPM/ZwaKVhMd/NeTz0TNPlW3YpG
         u8PCEhADywoyrhb7aKrNQM6SsmeeIJBwFECHZN5jF9v/OzceXBIGQdukegLvs/+q3g/r
         8hFSLMgaI2DVCboPon5TAfl1HSwOp9UUzSkC/IPVOYiBag263IsaIuLQubULVOI7o+0f
         LRRuMQGx6GgtlRInn1UDDHbmKe1e+u6SwWlxNUeTK04pVN6S5GDxuWfdaSfaL6rXcCtY
         rdLg==
X-Forwarded-Encrypted: i=1; AJvYcCXv3/Ed7ZGgdl+XkSkC+N/oeuIQu8Sa6kXwhKBokiXH7BFH68/iO5z9gWPZZMe6+8S917zT@lists.linux.dev
X-Gm-Message-State: AOJu0YxaS/bNjWGc/aLIDHs3+rCFXlPF7QQj7r3Oq+WUbIEQv1tGuyOV
	gVw5NLKG9tufeZi/JoH0KADVT1BnDHc10ZNbl4R5JYpNDdK8k5g832knhqtMN4oss6CU72ZbT8X
	54qxDgtNWQRg5TWDbanYVG7/rn5HYWjXWfJzr
X-Google-Smtp-Source: AGHT+IH2imFVE/wFvhmVSrl3gRKWK7JMCBWJZCpQm7LLKLkfCbOmNxarfGKGqSg3+1hZSos8edhUHSKaLAIboEsXkAs=
X-Received: by 2002:a05:622a:56:b0:460:49fd:6db0 with SMTP id
 d75a77b69052e-4612220c175mr534981cf.29.1729700667272; Wed, 23 Oct 2024
 09:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-6-xur@google.com>
 <CAK7LNAQ0RwJYkCXHj8QMH3sqXgY2LBTiYV8HnKD8oANB8Bb+Yg@mail.gmail.com>
 <CAF1bQ=RuLmO9S1W6ofmgVQZR7pBqR3iN7gCuUO2TkwGQwM76Kw@mail.gmail.com> <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
In-Reply-To: <CAK7LNASB8WZACuQyQQWvjfODTHTrPrbWBNrP0nsMQkQhDr+Pug@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Wed, 23 Oct 2024 09:24:15 -0700
Message-ID: <CAF1bQ=Q78Xr-ByjOYVVinCHtqSaMyVfHjHWgvPqN7+j3XTyGuA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] AutoFDO: Enable machine function split
 optimization for AutoFDO
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:50=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Oct 22, 2024 at 8:28=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > On Sun, Oct 20, 2024 at 8:18=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrot=
e:
> > > >
> > > > Enable the machine function split optimization for AutoFDO in Clang=
.
> > > >
> > > > Machine function split (MFS) is a pass in the Clang compiler that
> > > > splits a function into hot and cold parts. The linker groups all
> > > > cold blocks across functions together. This decreases hot code
> > > > fragmentation and improves iCache and iTLB utilization.
> > > >
> > > > MFS requires a profile so this is enabled only for the AutoFDO buil=
ds.
> > > >
> > > > Co-developed-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Han Shen <shenhan@google.com>
> > > > Signed-off-by: Rong Xu <xur@google.com>
> > > > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > > > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > > > ---
> > > >  include/asm-generic/vmlinux.lds.h | 6 ++++++
> > > >  scripts/Makefile.autofdo          | 2 ++
> > > >  2 files changed, 8 insertions(+)
> > > >
> > > > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generi=
c/vmlinux.lds.h
> > > > index ace617d1af9b..20e46c0917db 100644
> > > > --- a/include/asm-generic/vmlinux.lds.h
> > > > +++ b/include/asm-generic/vmlinux.lds.h
> > > > @@ -565,9 +565,14 @@ defined(CONFIG_AUTOFDO_CLANG)
> > > >                 __unlikely_text_start =3D .;                       =
       \
> > > >                 *(.text.unlikely .text.unlikely.*)                 =
     \
> > > >                 __unlikely_text_end =3D .;
> > > > +#define TEXT_SPLIT                                                =
     \
> > > > +               __split_text_start =3D .;                          =
       \
> > > > +               *(.text.split .text.split.[0-9a-zA-Z_]*)           =
     \
> > > > +               __split_text_end =3D .;
> > > >  #else
> > > >  #define TEXT_HOT *(.text.hot .text.hot.*)
> > > >  #define TEXT_UNLIKELY *(.text.unlikely .text.unlikely.*)
> > > > +#define TEXT_SPLIT
> > > >  #endif
> > >
> > >
> > > Why conditional?
> >
> > The condition is to ensure that we don't change the default kernel
> > build by any means.
> > The new code will introduce a few new symbols.
>
>
> Same.
>
> Adding two __split_text_start and __split_text_end markers
> do not affect anything. It just increases the kallsyms table slightly.
>
> You can do it unconditionally.

Got it.

>
>
>
> >
> > >
> > >
> > > Where are __unlikely_text_start and __unlikely_text_end used?
> >
> > These new symbols are currently unreferenced within the kernel source t=
ree.
> > However, they provide a valuable means of identifying hot and cold
> > sections of text,
> > and how large they are. I think they are useful information.
>
>
> Should be explained in the commit description.

Will explain the commit message.

>
>
>
> --
> Best Regards
> Masahiro Yamada
