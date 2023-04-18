Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2936AFC3
	for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 17:49:34 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-51b33c72686so1979054a12.1
        for <llvm@lists.linux.dev>; Tue, 18 Apr 2023 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681840174; x=1684432174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlIxeOWy4t6oNXCBK7WY5wY7Tp+89AfzXIVcFw6Esng=;
        b=F0vmAUYI6vw0QV9Xa4+wYvpq5W5eNg7Dix3wyxxY1HNfGO9Es0s54210TBtEvrS13N
         ZURx54bjmjG0rp9avMzCSj7tfEGPvqO985LuiQeCoFLHp3DsHfci92tcG3c9GeHZwvnu
         VUH2ITP4bsjdzdmAp9OtqXgYEXPpe/WrOoT50e73Sky+MZPXxnLbJYmWkj5qRN0KPCSe
         SSqGVgTGtNB+HrMTkTsvVOjh+yJvL8DiQCbBEDPJ60+07H7b8mruQNaP684n7+PNhCWw
         RqbbxRI596LCql78trh9D3Ww6cOmGUX7nO5+kCtoLKg836bgZrFHE4st/eY6AkX0SRB9
         xFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681840174; x=1684432174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlIxeOWy4t6oNXCBK7WY5wY7Tp+89AfzXIVcFw6Esng=;
        b=C0Y8fbxojcpqZ40zAWvbrOFIimbpgg7WQt6xGAL12L9o2ZO86StYS3uMPuOpx87rFf
         v5JzEAbSJSeCmKtCtMlbdbmTmWEnk6pCVYoiIlFJs6q/1/pzJSA3Huvjgs3mOWotzsRm
         7gJr6hv3Bu7p7A2NxQCpu0UuhLFoUPvpnf+etxrvZXfYiJ4r+uTOgCAW33SNIGVc0ozb
         /2zKm5esT7rBnuWjmo8R13w0Ig2x/tcuhb2g5qDN8GNX8zyyTHum2uzpX8KDU9a3eau+
         4RqTDiDybT1SHrG/6m6Jcur2Gii2VUJOuCObB/MVkPODI+bWlIhNi/vCRgz2wBVTp1kc
         y80w==
X-Gm-Message-State: AAQBX9cAvHsNfY82VQCPRAHVLXpwI8uiWOpWFYD4hF8gbITyzs+tNoQ+
	z/eoMLJ9FS7lC3MWkb7ehQdHm9yitvzS8/35jQyy9w==
X-Google-Smtp-Source: AKy350YrkykFuX9C6FMngEXAngaFBdSEPN7VQptU9h4a3p/UiakXeVMbpqehZB0WAdTS0ezf8ptktEt6I8iBC9XybPg=
X-Received: by 2002:a17:90a:4594:b0:22c:59c3:8694 with SMTP id
 v20-20020a17090a459400b0022c59c38694mr342535pjg.44.1681840174174; Tue, 18 Apr
 2023 10:49:34 -0700 (PDT)
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
 <CANiDSCvSDcQi2Qbwu8ddpPDAYehu2VoOB6x-v_PaMkWnwAGxYQ@mail.gmail.com>
In-Reply-To: <CANiDSCvSDcQi2Qbwu8ddpPDAYehu2VoOB6x-v_PaMkWnwAGxYQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 18 Apr 2023 10:49:22 -0700
Message-ID: <CAKwvOdkbB4qpjZWRb+2CnOqxNgEY-JB4JvkXSFmOLB_1C=owqQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] x86/purgatory: Add linker script
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Eric Biederman <ebiederm@xmission.com>, 
	Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ross Zwisler <zwisler@google.com>, 
	Simon Horman <horms@kernel.org>, "x86@kernel.org" <x86@kernel.org>, linux-toolchains@vger.kernel.org, 
	clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 2:46=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> Hi Nick
>
> On Sat, 8 Apr 2023 at 01:22, Nick Desaulniers <ndesaulniers@google.com> w=
rote:
> >
> > Hi Ricardo,
> > Thanks for the patch!  Please make sure to cc our mailing list
> > <llvm@lists.linux.dev> for llvm specific issues.
> > scripts/get_maintainer.pl should recommend it, or you can find it from
> > clangbuiltlinux.github.io.  You can also ping me internally for
> > toolchain related issues.
> >
> > Start of thread.
> > https://lore.kernel.org/lkml/20230321-kexec_clang16-v5-0-5563bf7c4173@c=
hromium.org/
> >
> > On Thu, Mar 30, 2023 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> =
wrote:
> > >
> > > On Thu, Mar 30, 2023 at 11:31:27AM -0400, Steven Rostedt wrote:
> > > > On Thu, 30 Mar 2023 17:18:26 +0200
> > > > Borislav Petkov <bp@alien8.de> wrote:
> > > >
> > > > > On Thu, Mar 30, 2023 at 11:15:23AM -0400, Steven Rostedt wrote:
> > > > > > > Make sure that the .text section is not divided in multiple o=
verlapping
> > > > > > > sections. This is not supported by kexec_file.
> >
> > Perhaps this is related to CrOS' use of AutoFDO creating .text.hot?
> > If so, it's probably more straightforward to straight up disable PGO
> > for kexec. See also:
> >
> > commit bde971a83bbf ("KVM: arm64: nvhe: Fix build with profile optimiza=
tion")
>
> It was indeed due to the AutoFDO, adding
>
> KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=3D=
%,
> $(KBUILD_CFLAGS))
>
> to arch/x86/purgatory/Makefile
>
> It is definitely simpler than adding a linker script, but I am not
> sure if it is the correct way to fix this... Seems like splitting
> .text in multiple sections is an implementation detail of the compiler
> and the only way to force it is with a linker script... Or am I
> missing something?

I think with the use of `unlikely` GCC will put code in .text.cold, so
it is possible to trigger this using simpler means, but...

>
> Shall I send a new version with the KBUILD_CFLAGS ?

I still think the cflags approach is way simpler.  If someone tries to
use unlikely in purgatory: "don't do that."  Same for PGO.

>
> Thanks!
>
> >
> > > > >
> > > > > And?
> > > > >
> > > > > What is the failure scenario? Why are you fixing it? Why do we ca=
re?
> > > > >
> > > > > This is way too laconic.
> > > > >
> > > >
> > > > Yeah, I think the change log in patch 1 needs to be in this patch t=
oo,
> > > > which gives better context.
> > >
> > > Just read it.
> > >
> > > Why did it work with clang version < 16?
> >
> > I'll bet if we bisect llvm, we can spot what might have changed, which
> > may give us a clue on how to get the old behavior back; maybe without
> > the need for a linker script.
> >
> > Ricardo, how did you verify that your fix was correct? Surely we can
> > check using command line utilities without needing a full blown kexec
> > setup? If you can share more info, I can bisect llvm quickly.  If it
> > requires profile data, you'll need to share it, since CrOS engineers
> > still have not posted public documentation on AutoFDO as I have
> > repeatedly asked for.
>
> The simplest test is to run:
>
> $readelf -S arch/x86/purgatory/purgatory.ro | grep "] \.text"
> [ 3] .text             PROGBITS         0000000000000000  000002a0
>
> If there is only one .text section then that kernel will be load
> properly via kexec_file().

Got it, profile data will be required to reproduce then. If you can share.
--=20
Thanks,
~Nick Desaulniers
