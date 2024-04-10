Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F3181311
	for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 19:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712777001; cv=none; b=YoMamRtcdTKLRavXRRcd9RyZREYnBE4dN5RtBKgJcgoK443HrGa2bXVIbbiKN2hhVKHy97rgY0AsNK9Sv09RsojR5bHNhsqIiJs2FOOeU96cpDDovYQtW8d2tjf9zks8onDwZUWFxClQXrKYSJbjC9/d0nokfM1Z9slVv0XoK5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712777001; c=relaxed/simple;
	bh=lT1Zm8JHcfddh2weMtUQK4dvHTVIqbaTDfgt1QyEJTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBhmR+aUOQEUngEG0oZpO9MEkxO2sBiY+L9zHn1E3lv77D6cp6Ih++blFL0Id4doRZS+YeX57TcYc+YvN7VPBPTsCaIikyMY7llu+nL/cKSWyCT5zwDcRw0JhW4D5TpO+QhJK4bAzJE//r9S9P+1ZECHAVt3ocnNncyC9imbShw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kf76E2vO; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kf76E2vO"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56fd95160e5so90a12.0
        for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 12:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712776998; x=1713381798; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqRnr/YaOnp8eBWYbEFORhlsTmhT0mCO9vyhiwgW7oI=;
        b=Kf76E2vO7ckg7960zkUK8973zrlZ+VfIYnAEbH2w0V8wghwQWTZny2QMMs9qSslJWI
         JoaE+y3UPGMs+DoqLgWdDlIJ60TCwryQL0sfORmAKFr5BZIPtMClVrWABDplPhv/8GFe
         w5jDIH25EY3TB6TlUf8yuneU9bNa2w3kNEuLenbGxfnrXVEUNLf9Gg2scgPiC9Ohkmm0
         /5bf088exD6ocKu+dHMbPjqT1V8T5SWRLZrT/GQTDCfrLkBpiqP3I3PdqLhraBDoEiaC
         buNtDNcpEyr2wHWNQc4gZu6u39vrp0+3SlJXtsDXcgKY2YCwXmiIPMeN7Bl4yC96OqrJ
         JVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712776998; x=1713381798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqRnr/YaOnp8eBWYbEFORhlsTmhT0mCO9vyhiwgW7oI=;
        b=O02BRM3+HTm+3o5kR5VZr16tnHCFMkslrZhmbjm8gB6v/fcTA25epl9Rf6vNKZmi0v
         8vyx4XVmn7gvPar6yqcoVL/GkM0wXqaVy/pV8cM/sySBQoezkxuKX8bghhy1QqmOMGf5
         WYNlkvPeU1vLaiWQKXTWMnd0kX2Il1h7TOc2Kka/FO8WBMy4q4fdMx4soS1oc+7sDN+P
         Ea5zwd7AhinQByLgQxUDjRw+2E0qYFMwzfYcX6L/x9Pph377uhHTgM6925OYy6kcWkuV
         HKMbJyknFr/THjnM4bFs4acNyWL5yxJyH96W2NlCA6Ze2vCrMXNu2KIzYxXiOf2kBemd
         O8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvRnd3LVXP6MRGB9r+SbEb0qrQdy4WehRy1uJECp81qbFl0++xlR1ALsZhqT0TLK/oW3wwV+qX2Q6/L9UQJReNzi4zSA==
X-Gm-Message-State: AOJu0Ywyc7Y6xnsaBojr+2cmSyXgppiuEsuYgYiw36J1TWJRSpkSrX2S
	7vC3tn5S7BrQ8hlOwC4RmxhfQSf1DbAPGmUbMwvrd6RGcztJSjKo427Uv2o3PWLyMU4e2A2rx6W
	MJ0ZCLquKIMQcviYYz2g8aB8W2+0Dq9xYiR8=
X-Google-Smtp-Source: AGHT+IFAOIO1d/iE/5tpsvrjq0hzFjN9sk6VBlLidVlN49CH1ZkO6MA65QTtwl46FDq7idQCIyEQI7r1t4J0W6UQ5z8=
X-Received: by 2002:a05:6402:214d:b0:56e:72a3:e5a8 with SMTP id
 bq13-20020a056402214d00b0056e72a3e5a8mr25655edb.3.1712776997947; Wed, 10 Apr
 2024 12:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=whHWjKK1TOMT1XvxFj8e-_uctJnXPxM=SyWHmW63B_EDw@mail.gmail.com>
 <20240408084934.GC21904@noisy.programming.kicks-ass.net> <CAHk-=witEwVvJ6Wh4xdP-sUkLQSwcRTtg_NSuGMMgvYmcs3teQ@mail.gmail.com>
 <CAHk-=wg=Wdct5f9W2-tvwfRefv3xmw1-9Ko+RG+6=xjLu4ndFg@mail.gmail.com>
 <20240409104540.GB21779@noisy.programming.kicks-ass.net> <CAKwvOdktV5vnKwET1PhM8x0urK+LUhAC=uc28RXHUsvq-7_vbA@mail.gmail.com>
In-Reply-To: <CAKwvOdktV5vnKwET1PhM8x0urK+LUhAC=uc28RXHUsvq-7_vbA@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Wed, 10 Apr 2024 12:23:01 -0700
Message-ID: <CAGG=3QWEbY0UbMHBkFMm6RxEz=CG8mauztsc1sT9efcy_MMjUA@mail.gmail.com>
Subject: Re: More annoying code generation by clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Anvin <hpa@zytor.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 8:37=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Tue, Apr 9, 2024 at 3:45=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> >
> > On Mon, Apr 08, 2024 at 12:42:31PM -0700, Linus Torvalds wrote:
> >
> > > Actually, one of the github issues pages has more of an explanation
> > > (and yes, it's tied to impedance issues between the inline asm syntax
> > > and how clang works):
> > >
> > >       https://github.com/llvm/llvm-project/issues/20571#issuecomment-=
980933442
> > >
> >
> > So that same issue seems to suggest Nick is actually working on this an=
d
> > got stuff merged. Nick, what is the status of your efforts and should w=
e
> > indeed do the below as Linus suggests or should he upgrade his compiler=
?
>
> Sorry, I'm no longer working on the issue.  I should mark that as such.
>
> The feature got hung up on rewriting one of the register allocation
> frameworks in llvm.
> https://github.com/llvm/llvm-project/pull/74344
>
> I have a new set of responsibilities at work so I probably wont be
> working on that issue any time soon.
>
I plan on picking this up. Could you please create a WIP branch on
GitHub with your current work?

-bw

> >
> > > diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-=
clang.h
> > > index 49feac0162a5..0dee061fd7a6 100644
> > > --- a/include/linux/compiler-clang.h
> > > +++ b/include/linux/compiler-clang.h
> > > @@ -118,3 +118,15 @@
> > >
> > >  #define __diag_ignore_all(option, comment) \
> > >       __diag_clang(13, ignore, option)
> > > +
> > > +/*
> > > + * clang has horrible behavior with "g" or "rm" constraints for asm
> > > + * inputs, turning them into something worse than "m". Avoid using
> > > + * constraints with multiple possible uses (but "ir" seems to be ok)=
:
> > > + *
> > > + *   https://github.com/llvm/llvm-project/issues/20571
> > > + *   https://github.com/llvm/llvm-project/issues/30873
> > > + *   https://github.com/llvm/llvm-project/issues/34837
>
> 20571 is the cannonical bug for this.
>
> > > + */
> > > +#define ASM_INPUT_G "ir"
> > > +#define ASM_INPUT_RM "r"
> > > diff --git a/include/linux/compiler_types.h b/include/linux/compiler_=
types.h
> > > index 2abaa3a825a9..e53acd310545 100644
> > > --- a/include/linux/compiler_types.h
> > > +++ b/include/linux/compiler_types.h
> > > @@ -380,6 +380,15 @@ struct ftrace_likely_data {
> > >  #define asm_goto_output(x...) asm volatile goto(x)
> > >  #endif
> > >
> > > +/*
> > > + * Clang has trouble with constraints with multiple
> > > + * alternative behaviors (mainly "g" and "rm").
> > > + */
> > > +#ifndef ASM_INPUT_G
> > > +  #define ASM_INPUT_G "g"
> > > +  #define ASM_INPUT_RM "rm"
> > > +#endif
> > > +
> > >  #ifdef CONFIG_CC_HAS_ASM_INLINE
> > >  #define asm_inline asm __inline
> > >  #else
> > > --
> > > 2.44.0.330.g4d18c88175
> > >
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
