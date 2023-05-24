Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6857560862
	for <llvm@lists.linux.dev>; Wed, 24 May 2023 18:36:59 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75b01271ad4so5391385a.1
        for <llvm@lists.linux.dev>; Wed, 24 May 2023 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684953418; x=1687545418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyKhzzitnQIRqANrfC+2toyTEKa4rF8aIxTk5fKJhHY=;
        b=fmT3cX3Wsx+87nRD+VugraPBMuh+gW7kLVkFdYGrIsLxg1e+w8yXHmxgUSmnfi7GZj
         Yg1i42oDV1Sx+6Qn6ZDWMQ66HnbcYvf9kn2YAxbQ9PELFtRNPoXyfpoVozHUJbX086na
         AJ3bAv54qPNQS8PdAzDyPqcKBmC6h4BAP5B1xDBF3O1xwY9ukWRnkLDmlPbmyHRIchaF
         cBmVOLDw97BUSBhggudO7wvHMy6Il7JsH9YKkLVImVo+/kWY0MCG6IeMBL1s3Vt2+8pM
         SB/PBbhwx7WPh8S/2gEGBri5wPeEZ27pLTgXLbFc3jh/Fc/BGyfsHUsbbvUbcblYhco7
         iEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684953418; x=1687545418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyKhzzitnQIRqANrfC+2toyTEKa4rF8aIxTk5fKJhHY=;
        b=JCFsIagLC7papLCsqawHGQm84FpaQJ7qaiG1H4dnWMomYuSlnsd93UwH2FRlOn/pER
         oNVK1Z8vDhpSWVjWYlZLfQ0ZjRCZRtVVPXrx6d57C/KrhhyKvhYwVesiydb4Ns2SZQI8
         26zKtP26fPRuc4Mi1h96stZnp6uTqYTC1SFbvrGFAspG0PmqVs1YeXBmEblwXZ40x+13
         HkZ1y1b/BnblaQPpWC5jbZjgN0ku6LSX6mGRiPmwo7/GR3If1IH6sJW/5dCputBOw5yd
         eMW74jTuJDjDktsEgCP/htV9ZM1GNRj5S1qnPU/VH82mmI6FnmXzHZx6zDtR6WYx4Gw9
         yNnQ==
X-Gm-Message-State: AC+VfDzTKJ8tQ5VP2BfNPsrMzr25lB65ybKF1o/hZK4z2fBreb92Xjbt
	h3Xp+tHyzH7nLrkmZB/Mf6Mfz8gfYHUxTwvQGKfXZA==
X-Google-Smtp-Source: ACHHUZ6CoLVDJlZtKx4HPhAHD1RMPE8j9MA6A070cFSOn6B9HVNQsa7PewCJRyb1JISEPUunsHmrHRlfLDtjTlANRJY=
X-Received: by 2002:ad4:4eae:0:b0:625:aa48:fb73 with SMTP id
 ed14-20020ad44eae000000b00625aa48fb73mr2811706qvb.61.1684953418109; Wed, 24
 May 2023 11:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvhPgoP57ip1cW5TaWJfkbkHA2SZqd5fFoTJ7rDGA138w@mail.gmail.com>
 <CAKwvOdkABkajMqBS=xcHxXUTQGXbTN3tj1GcPqpGgGkmAGLkDA@mail.gmail.com> <20230524130104.GR83892@hirez.programming.kicks-ass.net>
In-Reply-To: <20230524130104.GR83892@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 24 May 2023 11:36:47 -0700
Message-ID: <CAKwvOdmxLg2chSbaGxtu6cNKRshoLyK0Dpk2Ndrm3-S8ioV7hQ@mail.gmail.com>
Subject: Re: next: i386-boot: clang-nightly: failed - intermittently - BUG:
 unable to handle page fault for address: 000024c0
To: Peter Zijlstra <peterz@infradead.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, x86@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 6:01=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, May 17, 2023 at 11:11:51AM -0700, Nick Desaulniers wrote:
> > On Wed, May 17, 2023 at 8:21=E2=80=AFAM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
> > >
> > > Linux next-20230517 build with clang nightly for i386 boot fails inte=
rmittently.
> >
> > Keyword: intermittently. That will make tracking this down fun.
> >
> > Our CI also hit a boot failure on tip/master with the same splat:
> > https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs=
/4998374271/jobs/8957285746
> > Though the CI pulled down a SHA
> > 0932447780e1f9a43bf68ef7fe3d9b41b46d58fc
> > which looks weird on
> > https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=
=3D0932447780e1f9a43bf68ef7fe3d9b41b46d58fc
> > >> Notice: this object is not reachable from any branch.
>
> Github isn't willing to show me content unless I log in or somesuch
> nonsense.

Ah, sorry about that.
https://paste.debian.net/1281050/ should be the log of ours.
https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2=
/builds/2QEtkwi60Mn3NLX4U0sDCAH0qqp/bzImage
is the corresponding build artifact.

There's ongoing discussion in #x86 on LinuxNet.  I suspect that a few
of Naresh's recent reports are all perhaps one single issue.

Arnd mentioned https://lore.kernel.org/all/CA+G9fYvVZ9WF-2zfrYeo3xnWNra0QGx=
Lzei+b4yANZwEvr5CYw@mail.gmail.com/
which looks similar but is with GCC.

Either way, we're seeing this in mainline.

>
> > That this failed in -next and -tip in the same way makes me wonder if
> > something affecting this is coming in via -tip? Maybe the splat looks
> > familiar to x86 folks?
> >
> > I haven't been able to reproduce locally when my machine is relatively
> > load-less.  If I do a kernel build in the background, I was able to
> > get QEMU to hang, but without any splat. That was using tip/master @
> > f81d8f759e7f.
> >
> > Naresh, when you say "intermittent" do you have any data on the
> > relative frequency of this boot failure? (Also, please make sure to
> > use llvm@lists.linux.dev in the future; we moved mailing lists years
> > ago).
> >
> > Looks like our CI report linked above has an additional splat though
> > via apply_alternatives and optimize_nops.
> >
> > >> [ 0.166742] Code: Unable to access opcode bytes at 0x36.
> >
> > Peter, that smells like perhaps either:
> > commit b6c881b248ef ("x86/alternative: Complicate optimize_nops() some =
more")
> > commit 6c480f222128 ("x86/alternative: Rewrite optimize_nops() some")
>
> So I did find me a 'funny' there, but nothing that explains boot fail.
>
> It would think that 'PAUSE' is a 2 byte NOP and replace it with NOP2;
> which is not quite the same thing. The below seems to cure that.
>
> Let me continue poking at things...
>
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.=
c
> index 93aa95afd005..bb0a7b03e52f 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -159,9 +160,12 @@ void text_poke_early(void *addr, const void *opcode,=
 size_t len);
>   */
>  static bool insn_is_nop(struct insn *insn)
>  {
> -       if (insn->opcode.bytes[0] =3D=3D 0x90)
> +       /* Anything NOP, but not REP NOP. */
> +       if (insn->opcode.bytes[0] =3D=3D 0x90 &&
> +           (!insn->prefixes.nbytes || insn->prefixes.bytes[0] !=3D 0xF3)=
)
>                 return true;
>
> +       /* NOPL */
>         if (insn->opcode.bytes[0] =3D=3D 0x0F && insn->opcode.bytes[1] =
=3D=3D 0x1F)
>                 return true;
>


--=20
Thanks,
~Nick Desaulniers
