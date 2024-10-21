Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1A31FF03C
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729554207; cv=none; b=jproksZqDpxpPFu3xK9Lad0gev0sSJIeQ05rDC7bvy2hpqtx1taSjoc4FeVCo+iprJcIXZ11JjegRWZ6NqVospTjZgfFjnqTQKk44Bak1dDEDejDpVoKuCDX5FodKGANaS9Ri1aQ8L7bOwuRUsuTZF3fMSgw9g7IaEhDO67EUxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729554207; c=relaxed/simple;
	bh=670Rx8VhAsuQw1rqEOWFlDm06/IQZHXSWxj6k8/pKYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adQy9IY4SkUur4S1gOHjp63uZ3QZArlyGSDuwZZkUhW+FyXP6XOhBxPGYYm/W0lZvoqlMEvB01O/iDCXRmj32UJAWGJABaNO+lc9eCnfyDTd0LZGocoTxys3aIl5ChIAMimtA0+umdoZhwmsrfvzU87vrbWQ57vrL/Z1oxMLGxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUWnLFqf; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUWnLFqf"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460a8d1a9b7so83011cf.1
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 16:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729554205; x=1730159005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH1I9Ut0mQYyKMoQvkGxIgww2ZJ9ePwLy+OSXFMT9R4=;
        b=xUWnLFqfE5Y8hOZK6qFJU6BTKR0y73g+F/iwaAl+gbaxCxls2K1MVSx5jM+HDEtTNo
         gSZw9cPtqNAqBwHJgkWsyqTZ7yiV2mmR2WeQ+UNKX9Boq+WWYXHu0WExaFOH/JCBQwlf
         LdDUchgtH+Sm2N93lw9ukrPeS7cANJ8M3LHaL5D5uEZduq+swohm3ACCkNkEgZaA3eak
         boR0UW4/1kSAFExFHpQojKni/mGpoyPR7tHzeZAuOsoGK8LkTxJUlo3SiGE9vH0dk87j
         GK41h7S2YTGVTp5Px+EOxnFhSzOFBYA5uH0yDHkC6Ki0h1ue1DKGNcqOheHDz7tHeDpe
         MOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729554205; x=1730159005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH1I9Ut0mQYyKMoQvkGxIgww2ZJ9ePwLy+OSXFMT9R4=;
        b=A9HY2jSi+XK6kf5KHgs3JDzdyY0nax9LxHH1jeVtJvaFzRwTOP/McXto29JjmJffGY
         sLnr2rOKSOZw1aWnJK0vtgh6QCr7DlZQ7Js9TkeZ4JID2B5J9BldHg39eaOqnvrsgr9G
         m+NUm6RRzrKgGBGOOKQ1/cYMpfpBuLOzBOrMjH3lL6AG2+L6zFbp4As7zJWj27hzDynG
         3Dz8y1GX3+QwtZp3gv6kJsUqffKybZDZf2D1Tm41W3VwN2d+vagbBKby8fThvyicCbaO
         0Sg0Ms1CN8yhYdi/82Hzm55DmR1afo3HZJH/XZEoIiGRgRJdI1kScqTTBYmQDjaexk/v
         yBUg==
X-Forwarded-Encrypted: i=1; AJvYcCVRNBSGX4y2DYe1+qjhMgDe76ZXr/d4pLPHIjApnaT76NluqopZXcu574ObIYeuT/a0Yrj6@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt01R/5GFPttDqPtJkbe+FVjl6VYYExs2jG+WcE6GoilzNj7vC
	x9kYx7f5AsbKKNgAGbgchfFNLbbYzsKicEvx5SR61Dri+39gsEQSt/6zHLj3G1RHm+UMYE+B4TY
	ErYdFCgWiyj+mQnWRU/ry4BE31fl+xCfVAX+q
X-Google-Smtp-Source: AGHT+IGBJEGpd9nQo0o209R0pXE8dMLJ0OAC0OgWVKOeU4WwTY9FO3DmQPqrzs2Q2l7L/01n09HMzEfWkSHfOjpUeOI=
X-Received: by 2002:a05:622a:1827:b0:458:1d2b:35f6 with SMTP id
 d75a77b69052e-46100b9b324mr1762321cf.24.1729554204431; Mon, 21 Oct 2024
 16:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014213342.1480681-1-xur@google.com> <20241014213342.1480681-4-xur@google.com>
 <CAK7LNARqnhZuDf75_juBtdK0GV8jL_aDjnuyU=-8zjdCZetF1g@mail.gmail.com>
In-Reply-To: <CAK7LNARqnhZuDf75_juBtdK0GV8jL_aDjnuyU=-8zjdCZetF1g@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 21 Oct 2024 16:43:12 -0700
Message-ID: <CAF1bQ=S1Hv=fJxk38dYkRTAXWQO_4W8QLTfbNRbihg8UvUKvGQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] Change the symbols order when --ffuntion-sections
 is enabled
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

On Sun, Oct 20, 2024 at 7:15=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Tue, Oct 15, 2024 at 6:33=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > When the -ffunction-sections compiler option is enabled, each function
> > is placed in a separate section named .text.function_name rather than
> > putting all functions in a single .text section.
> >
> > However, using -function-sections can cause problems with the
> > linker script. The comments included in include/asm-generic/vmlinux.lds=
.h
> > note these issues.:
> >   =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if =
dead
> >    code elimination is enabled, so these sections should be converted
> >    to use ".." first.=E2=80=9D
> >
> > It is unclear whether there is a straightforward method for converting
> > a suffix to "..".
>
>
>
> Why not for ".text.fixup"?
>
> $ git grep --name-only '\.text\.fixup' | xargs sed -i
> 's/\.text\.fixup/.text..fixup/g'
>

I did not move .text.fixup because it currently groups together with TEXT_M=
AIN.

Yes. For all the kernel annotated sections, we can replace them with a
".." string.
For compiler generate strings, like .unlikely, .hot, and .split, we
need a compiler change
for that (maybe under an option). The process will be long.
Or we can use an extra script, like objcopy to change them?

>
>
> I do not know how to rename other sections that are generated by compiler=
s.
>
>
>
>
> > This patch modifies the order of subsections within the
> > text output section when the -ffunction-sections flag is enabled.
> > Specifically, it repositions sections with certain fixed patterns (for
> > example .text.unlikely) before TEXT_MAIN, ensuring that they are groupe=
d
> > and matched together.
> >
> > Note that the limitation arises because the linker script employs glob
> > patterns instead of regular expressions for string matching. While ther=
e
> > is a method to maintain the current order using complex patterns, this
> > significantly complicates the pattern and increases the likelihood of
> > errors.
> >
> > Co-developed-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Han Shen <shenhan@google.com>
> > Signed-off-by: Rong Xu <xur@google.com>
> > Suggested-by: Sriraman Tallam <tmsriram@google.com>
> > Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
> > index eeadbaeccf88..5df589c60401 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -554,9 +554,21 @@
> >   * during second ld run in second ld pass when generating System.map
> >   *
> >   * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
> > - * code elimination is enabled, so these sections should be converted
> > - * to use ".." first.
> > + * code elimination or function-section is enabled. Match these symbol=
s
> > + * first when in these builds.
> >   */
> > +#if defined(CONFIG_LD_DEAD_CODE_DATA_ELIMINATION) || defined(CONFIG_LT=
O_CLANG)
> > +#define TEXT_TEXT                                                     =
 \
>
>
> Why did you do this conditionally?
>
> You are making this even more unmaintainable.

Again, we don't want to change the default build.

If you think the change can apply to the default build, we would be
happy to remove the condition.

>
>
>
>
>
> > +               ALIGN_FUNCTION();                                      =
 \
> > +               *(.text.asan.* .text.tsan.*)                           =
 \
> > +               *(.text.unknown .text.unknown.*)                       =
 \
> > +               *(.text.unlikely .text.unlikely.*)                     =
 \
> > +               . =3D ALIGN(PAGE_SIZE);                                =
   \
> > +               *(.text.hot .text.hot.*)                               =
 \
> > +               *(TEXT_MAIN .text.fixup)                               =
 \
> > +               NOINSTR_TEXT                                           =
 \
> > +               *(.ref.text)
> > +#else
> >  #define TEXT_TEXT                                                     =
 \
> >                 ALIGN_FUNCTION();                                      =
 \
> >                 *(.text.hot .text.hot.*)                               =
 \
> > @@ -566,6 +578,7 @@
> >                 NOINSTR_TEXT                                           =
 \
> >                 *(.ref.text)                                           =
 \
> >                 *(.text.asan.* .text.tsan.*)
> > +#endif
> >
> >
> >  /* sched.text is aling to function alignment to secure we have same
> > --
> > 2.47.0.rc1.288.g06298d1525-goog
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada
