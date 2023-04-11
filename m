Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA1A2F21
	for <llvm@lists.linux.dev>; Tue, 11 Apr 2023 21:46:10 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id f2so844974pjs.3
        for <llvm@lists.linux.dev>; Tue, 11 Apr 2023 14:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681249570; x=1683841570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zejEY/r4Tfq5XbhV7cIEeG2i14mVKUoGXnXZCvl+x7Q=;
        b=CLg+ltyt8lASxe48oYWEGyvYpWrGarOtutiNF9Vk13x1OeLE0F+KPxrsUoBJvXUCDW
         Qs+dJdu4uYEpFbW0vzfYvS9OET3zKkBHUBOaHcfIcOibi1lRxY+r6F2gqxRJM49eoD2Q
         FYVEeH3ctTVcah2+UTWp7zh5lExOcPEm9cPq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681249570; x=1683841570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zejEY/r4Tfq5XbhV7cIEeG2i14mVKUoGXnXZCvl+x7Q=;
        b=gP2TyRRlHROdJChB3u9qr6yO9wdxC2wdcTAyJmFhW5NIXpjRp6sDnmvMyP2J9dhIuo
         9Urw9rfNiC0YCLUx4P0NSpmBVP6ZFYE279VCVSoqplLms9UBoaj2tfaC5GTws7ffuoEl
         rNuIK5CbaYwmzaFQPcTMPGt/1nZ9mIl6YSzH0RxqMxz0ErUCcs0hNpVt8FVTh0lNbpeB
         KJKYdiJExGuQUq0ISfBV+x6jLp7Y1h4qMSpc68gSTrMO7pIbj1EquJTBBWvtknJ2pqpa
         VcSpAm6BY/hponK3gASbYfi86/BRcQV1OGuNJJfcGGPdwJh7A3QIobiYN/XFg2Vj4hqz
         e4GA==
X-Gm-Message-State: AAQBX9cXtZwyvzITyMW35xvyQTgqBi9WJKC8CcjpeTgvOiyR9KFTMmP+
	wtZlDoJXKc8hYUKSAr4MrqdqWzhM6yfB5fH/FXI=
X-Google-Smtp-Source: AKy350a9RSMMgCtfHgpgEc/0y9eP8AyQLPNkiJ99cXVX9qTPPXdPE5/bNLtvym28V9vcha9Lh5FRow==
X-Received: by 2002:a17:90b:33c3:b0:236:73d5:82cf with SMTP id lk3-20020a17090b33c300b0023673d582cfmr16395501pjb.9.1681249569735;
        Tue, 11 Apr 2023 14:46:09 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709029a4100b001943d58268csm10137843plv.55.2023.04.11.14.46.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 14:46:08 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id q15-20020a17090a2dcf00b0023efab0e3bfso12459392pjm.3
        for <llvm@lists.linux.dev>; Tue, 11 Apr 2023 14:46:08 -0700 (PDT)
X-Received: by 2002:a17:90b:384f:b0:23f:9d83:ad76 with SMTP id
 nl15-20020a17090b384f00b0023f9d83ad76mr15506588pjb.23.1681249567905; Tue, 11
 Apr 2023 14:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321-kexec_clang16-v5-0-5563bf7c4173@chromium.org>
 <20230321-kexec_clang16-v5-2-5563bf7c4173@chromium.org> <20230330111523.4b98c8ce@gandalf.local.home>
 <20230330151826.GDZCWoQkQBj4BYbwWw@fat_crate.local> <20230330113127.3011e021@gandalf.local.home>
 <20230330160017.GEZCWyEXQVQZRBbYif@fat_crate.local> <CAKwvOdkULKxoifiVO4H4yomt1DHQxw0ntdO6QgMXk2BpM-urRg@mail.gmail.com>
In-Reply-To: <CAKwvOdkULKxoifiVO4H4yomt1DHQxw0ntdO6QgMXk2BpM-urRg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Apr 2023 23:45:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCvSDcQi2Qbwu8ddpPDAYehu2VoOB6x-v_PaMkWnwAGxYQ@mail.gmail.com>
Message-ID: <CANiDSCvSDcQi2Qbwu8ddpPDAYehu2VoOB6x-v_PaMkWnwAGxYQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] x86/purgatory: Add linker script
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Eric Biederman <ebiederm@xmission.com>, 
	Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ross Zwisler <zwisler@google.com>, 
	Simon Horman <horms@kernel.org>, "x86@kernel.org" <x86@kernel.org>, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nick

On Sat, 8 Apr 2023 at 01:22, Nick Desaulniers <ndesaulniers@google.com> wro=
te:
>
> Hi Ricardo,
> Thanks for the patch!  Please make sure to cc our mailing list
> <llvm@lists.linux.dev> for llvm specific issues.
> scripts/get_maintainer.pl should recommend it, or you can find it from
> clangbuiltlinux.github.io.  You can also ping me internally for
> toolchain related issues.
>
> Start of thread.
> https://lore.kernel.org/lkml/20230321-kexec_clang16-v5-0-5563bf7c4173@chr=
omium.org/
>
> On Thu, Mar 30, 2023 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wr=
ote:
> >
> > On Thu, Mar 30, 2023 at 11:31:27AM -0400, Steven Rostedt wrote:
> > > On Thu, 30 Mar 2023 17:18:26 +0200
> > > Borislav Petkov <bp@alien8.de> wrote:
> > >
> > > > On Thu, Mar 30, 2023 at 11:15:23AM -0400, Steven Rostedt wrote:
> > > > > > Make sure that the .text section is not divided in multiple ove=
rlapping
> > > > > > sections. This is not supported by kexec_file.
>
> Perhaps this is related to CrOS' use of AutoFDO creating .text.hot?
> If so, it's probably more straightforward to straight up disable PGO
> for kexec. See also:
>
> commit bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimizati=
on")

It was indeed due to the AutoFDO, adding

KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=3D%,
$(KBUILD_CFLAGS))

to arch/x86/purgatory/Makefile

It is definitely simpler than adding a linker script, but I am not
sure if it is the correct way to fix this... Seems like splitting
.text in multiple sections is an implementation detail of the compiler
and the only way to force it is with a linker script... Or am I
missing something?

Shall I send a new version with the KBUILD_CFLAGS ?

Thanks!

>
> > > >
> > > > And?
> > > >
> > > > What is the failure scenario? Why are you fixing it? Why do we care=
?
> > > >
> > > > This is way too laconic.
> > > >
> > >
> > > Yeah, I think the change log in patch 1 needs to be in this patch too=
,
> > > which gives better context.
> >
> > Just read it.
> >
> > Why did it work with clang version < 16?
>
> I'll bet if we bisect llvm, we can spot what might have changed, which
> may give us a clue on how to get the old behavior back; maybe without
> the need for a linker script.
>
> Ricardo, how did you verify that your fix was correct? Surely we can
> check using command line utilities without needing a full blown kexec
> setup? If you can share more info, I can bisect llvm quickly.  If it
> requires profile data, you'll need to share it, since CrOS engineers
> still have not posted public documentation on AutoFDO as I have
> repeatedly asked for.

The simplest test is to run:

$readelf -S arch/x86/purgatory/purgatory.ro | grep "] \.text"
[ 3] .text             PROGBITS         0000000000000000  000002a0

If there is only one .text section then that kernel will be load
properly via kexec_file().



>
> >
> > + toolchains ML.
> >
> > --
> > Regards/Gruss,
> >     Boris.
> >
> > https://people.kernel.org/tglx/notes-about-netiquette
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



--
Ricardo Ribalda
