Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755BE13AD37
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712677048; cv=none; b=oK797FzlIyR2rNlj3r52qmYPtdXm/9p7UjzV5Y34E8j7t/TEKFTN5OX4llZCCZjvP4+pqsvEdJGaqUC4VdHjoMPWSB7DpyKX6ArMCfgyPKzi1c+eUO26qG56W+4I4Ep267CWudPmJKMwIcrB4K/3IBqiDEF11Nnt44C1DXnTn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712677048; c=relaxed/simple;
	bh=Aqminu13BA5RfzICIWKV4tMcJYaOt32oW1/5Ll0JWxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrzaF4gIyCRBrNRF2LX5dkBollPPAaOdOfvb0NswQRyHhvLT2TVSVzR3hrMKQ6UkSXzxnv9nru+HHsrXnNIY0qBF1l9Qiy2a/doPWxQ3ErxzSLbt7geHcVu0VGSgCIefDbSkOZ31ntfUUilHtscfdBH9NTph1Av56E1o+U/jc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xHqjtRV6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xHqjtRV6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34641b7c49aso344005f8f.2
        for <llvm@lists.linux.dev>; Tue, 09 Apr 2024 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712677045; x=1713281845; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3wHvYb+xH1G7TOL58ej8375ZusY8e96JWmR5Aw1tE4=;
        b=xHqjtRV6sHrzQ5p9CMDXPKcdPXIIZhx2tf8zVTDoBgPdM6hjLZpq8kNvUsgrxqJ0oO
         kWChGZ6GmMCLey0EpnayDs5AwZ2yPXhrWK4PSsOV/AEuy1seslx/NqIerREwZdnl3P8K
         EoWFcjCAISkRwv/kJ+t/ZZvlhYNQ5c0osvOzW3QvFGhcJZrHy0t8ZPJAGeu9GqoLgS9n
         7wna2kYWgri4+9CkKXSNVtX8fGxltA2wkv7y717yvEYI8Gjn1NW4BZrBW1XpGx93VjdU
         WtI0jGG4OaLGHCylHjS9Ps8RcfNXqK856PjAcq7FSh+dRqhh9pGo/Dtsq4mHt33JnKDk
         k2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712677045; x=1713281845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3wHvYb+xH1G7TOL58ej8375ZusY8e96JWmR5Aw1tE4=;
        b=it+NWJ3psrzG1nfXKajvc45Num2rdDk0e7VjEYs6yTiFtgIGRyTvE1vxBM5oskb6sq
         SZYS9nvnRfiWb8V2zz/GJWElWhrnul8MXS9IKqBG0Ul5jzZUmnb5H2ELKOKgYxBepzfZ
         MwkJ/xdhVVHniylQafBaVK2AQ1avCfMU1qvmA9KXOtepBkKidDjcCckslQVpcXkv+khQ
         1JJC6GZMMqwzwy0p8JbLqT/gCCn+z5ruXIWIOJlMvH7eFsolxWCVTnRGbFsgEX7XVd7m
         WzggP1tV/r+SnXriGAVNtOjOK+Rly8FUh3WWL0gKG/vzXFAMpyYPA5tuiXokjb3skxEe
         K8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW13OkL49pTIRNkrRWcIlehYmEDraNhzanbQpecMlmR+KZ30ThhRS2iIZ6HAW4TiTw+oEiJktTbNFg2lYDbATtRD5cyQ==
X-Gm-Message-State: AOJu0YyQBWU+TI48EyFk5OUWP8dXEo5YsY1d010EfnWopr6UXUUgPjfU
	u/9RWMfhwuG8y3uO6EzmiSLzitlb5mxL9cX9mSMYqF6U2LbTk01biT+cJAbwc7yrc7cFS1H4Jf8
	91sndDXL5mJVSp9/WMtA5kYXUvGtvGm5Vd3r8
X-Google-Smtp-Source: AGHT+IEATApo3o8XfWViXxHA3nBf59pbXIp4qO5W17tsNOoEx8kff/kEukGenu4hXqklT5aG6y50jY3+j+NZ6v/SAgs=
X-Received: by 2002:adf:ec50:0:b0:33e:8aba:cd0a with SMTP id
 w16-20020adfec50000000b0033e8abacd0amr75524wrn.9.1712677044575; Tue, 09 Apr
 2024 08:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=whHWjKK1TOMT1XvxFj8e-_uctJnXPxM=SyWHmW63B_EDw@mail.gmail.com>
 <20240408084934.GC21904@noisy.programming.kicks-ass.net> <CAHk-=witEwVvJ6Wh4xdP-sUkLQSwcRTtg_NSuGMMgvYmcs3teQ@mail.gmail.com>
 <CAHk-=wg=Wdct5f9W2-tvwfRefv3xmw1-9Ko+RG+6=xjLu4ndFg@mail.gmail.com> <20240409104540.GB21779@noisy.programming.kicks-ass.net>
In-Reply-To: <20240409104540.GB21779@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 9 Apr 2024 08:37:10 -0700
Message-ID: <CAKwvOdktV5vnKwET1PhM8x0urK+LUhAC=uc28RXHUsvq-7_vbA@mail.gmail.com>
Subject: Re: More annoying code generation by clang
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Anvin <hpa@zytor.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 3:45=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Mon, Apr 08, 2024 at 12:42:31PM -0700, Linus Torvalds wrote:
>
> > Actually, one of the github issues pages has more of an explanation
> > (and yes, it's tied to impedance issues between the inline asm syntax
> > and how clang works):
> >
> >       https://github.com/llvm/llvm-project/issues/20571#issuecomment-98=
0933442
> >
>
> So that same issue seems to suggest Nick is actually working on this and
> got stuff merged. Nick, what is the status of your efforts and should we
> indeed do the below as Linus suggests or should he upgrade his compiler?

Sorry, I'm no longer working on the issue.  I should mark that as such.

The feature got hung up on rewriting one of the register allocation
frameworks in llvm.
https://github.com/llvm/llvm-project/pull/74344

I have a new set of responsibilities at work so I probably wont be
working on that issue any time soon.

>
> > diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-cl=
ang.h
> > index 49feac0162a5..0dee061fd7a6 100644
> > --- a/include/linux/compiler-clang.h
> > +++ b/include/linux/compiler-clang.h
> > @@ -118,3 +118,15 @@
> >
> >  #define __diag_ignore_all(option, comment) \
> >       __diag_clang(13, ignore, option)
> > +
> > +/*
> > + * clang has horrible behavior with "g" or "rm" constraints for asm
> > + * inputs, turning them into something worse than "m". Avoid using
> > + * constraints with multiple possible uses (but "ir" seems to be ok):
> > + *
> > + *   https://github.com/llvm/llvm-project/issues/20571
> > + *   https://github.com/llvm/llvm-project/issues/30873
> > + *   https://github.com/llvm/llvm-project/issues/34837

20571 is the cannonical bug for this.

> > + */
> > +#define ASM_INPUT_G "ir"
> > +#define ASM_INPUT_RM "r"
> > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_ty=
pes.h
> > index 2abaa3a825a9..e53acd310545 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -380,6 +380,15 @@ struct ftrace_likely_data {
> >  #define asm_goto_output(x...) asm volatile goto(x)
> >  #endif
> >
> > +/*
> > + * Clang has trouble with constraints with multiple
> > + * alternative behaviors (mainly "g" and "rm").
> > + */
> > +#ifndef ASM_INPUT_G
> > +  #define ASM_INPUT_G "g"
> > +  #define ASM_INPUT_RM "rm"
> > +#endif
> > +
> >  #ifdef CONFIG_CC_HAS_ASM_INLINE
> >  #define asm_inline asm __inline
> >  #else
> > --
> > 2.44.0.330.g4d18c88175
> >
>


--=20
Thanks,
~Nick Desaulniers
