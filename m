Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46183210C
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 09:46:16 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id i74so5978330ioa.4
        for <llvm@lists.linux.dev>; Sun, 22 May 2022 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=suXXqsi9+jjSf0b0zBPpTnO09e3zkBqF8Eabr9WKKbE=;
        b=Sc+Bu3TQQ+v5pOsrEs+Do5GftmhkiMiSIxCa44mlZDq7mNYcxLdkwdfXKicn7DRWyb
         HJy6WmcdRs7iPjaePufoTRon/RgIAXRWuGvptGfFgSCtrtB5Uc3R//N868TVfZjB0KKK
         9YG5tmYdNtYXGnx0n/C24yH/MXnMVP1DCbqXmxIaMfuINtLRrNcmjX1RCmXKqzFDtkQX
         fenF6PfTaReYHMKNKQ02fqcpEST8I0hVooiLdcFQenVyu8jQfaCI4oyDyJI9fyMlZM7M
         drpEdkzSHlAIHKUlBsm7tUUApxovLGVTWYtzm+Y9cAPxGhuGtksm4XsjcItCKvLCCXWE
         zY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=suXXqsi9+jjSf0b0zBPpTnO09e3zkBqF8Eabr9WKKbE=;
        b=hgOs/XhtGh0KMhyCpzNENga6Y5v+XjHa/VaCh4BZ4VO5XS86UQ6Iono4diMLFSRpIa
         o8dTlVdRaoQdp8oiR3WTzZ01XZvrvIeOq0xpw5D+f0s3IYKssfoU8TZJk9oJ2MtC/D1J
         qflOsU9aobXKxZoxFoYv9/p/sD5yBbeleN14qRq03vlRswDtmmDoPpzlDxz8AkkV/xv6
         MvYseHcd7GxUhW0ohOeMgU33sMmVsDllX7jBZt2KM/cQlYcSUaYWRf+pjHtRCFLAHld3
         73gK1iMoSFTZUgRwDax9MUG1gIZ2YQJIhFKMEHPJtDjiETFot1PVHS7B0QOJ3BSGLE2C
         WWqA==
X-Gm-Message-State: AOAM531+9r6wM4meiVZgDv6fPkOEpaBMkfOsfYqomdUovJPCvZIav645
	/g9UtMYmFUIEdgtRq+O5v2GiET0NFKRHvEiJ1aI=
X-Google-Smtp-Source: ABdhPJwk75eAgmPLNvyHtlfHoP5i7/H2Vm4/MJ4t9PpFPunYJ+u9wWBwvWaEctXhAxfGgh6zp9BW4bjDSvEZguLIAA4=
X-Received: by 2002:a05:6602:1542:b0:65a:bc5d:db78 with SMTP id
 h2-20020a056602154200b0065abc5ddb78mr8040039iow.128.1653212775197; Sun, 22
 May 2022 02:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <CAK7LNAQvneCi11myLpkikuXh=i5PLtTaLe0nGpDZXgv_Q1L0Ow@mail.gmail.com>
 <CA+icZUUWww3fXvjQcefgFuq=tPO6+FYDbHE2E5PmL-BSJg4+cw@mail.gmail.com> <CAK7LNATx1QcM6BdqBSascV8J8rD6etRgRZj9PjBno5Qrb=p3Yg@mail.gmail.com>
In-Reply-To: <CAK7LNATx1QcM6BdqBSascV8J8rD6etRgRZj9PjBno5Qrb=p3Yg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 22 May 2022 11:45:39 +0200
Message-ID: <CA+icZUV=PwX_e3U3mZwLOVvsA02pgNNAPsGJSMCPitu9ndWbqg@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] kbuild: yet another series of cleanups (modpost,
 LTO, MODULE_REL_CRCS, export.h)
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Zijlstra <peterz@infradead.org>, linux-modules <linux-modules@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Ard Biesheuvel <ardb@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 22, 2022 at 8:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, May 22, 2022 at 10:45 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Fri, May 13, 2022 at 4:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Fri, May 13, 2022 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > >
> > > > This is the third batch of cleanups in this development cycle.
> > > >
> > >
> > >
> > > This series is available at
> > > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > >  lto-cleanup-v6
> > >
> >
> > Hi Masahiro,
> >
> > I cloned the repository on top of latest Linus Git.
> >
> > Not able to boot in Quemu - Not able to boot on bare metal.
> >
> > $ grep module_layout log_quemu-5.18.0-rc7-2-amd64-clang14-lto.txt
> > 366:[    2.173265] floppy: disagrees about version of symbol module_layout
> > 367:[    2.198746] scsi_common: disagrees about version of symbol module_layout
> > 368:[    2.205573] i2c_piix4: disagrees about version of symbol module_layout
> > 369:[    2.210610] psmouse: disagrees about version of symbol module_layout
> > 370:[    2.225138] scsi_common: disagrees about version of symbol module_layout
> > 371:[    2.235536] scsi_common: disagrees about version of symbol module_layout
> > 375:Begin: Running /scripts/local-premount ... [    2.298555]
> > crc32c_intel: disagrees about version of symbol module_layout
> > 376:[    2.303335] crc32c_generic: disagrees about version of symbol
> > module_layout
> > 377:[    2.306667] libcrc32c: disagrees about version of symbol module_layout
> >
> > Infos: LLVM-14 + CONFIG_LTO_CLANG_THIN=y
> >
> > My linux-config and qemu-log are attached.
> >
>
>
> Thanks for your testing.
>
> I was also able to reproduce this issue.
>
>
> The problematic parts are:
>
> [    2.298555] crc32c_intel: disagrees about version of symbol module_layout
> [    2.303335] crc32c_generic: disagrees about version of symbol module_layout
> [    2.306667] libcrc32c: disagrees about version of symbol module_layout
>
>
>
> When CONFIG_LTO_CLANG_THIN=y,
> I cannot see any __crc_* symbols in "nm  vmlinux".
>
> Perhaps, LTO might have discarded all the __crc_* symbols
> from vmlinux, but I am still checking the details...
>

Thanks for taking care.

Just for the records:

$ grep CONFIG_MODVERSIONS /boot/config-5.18.0-rc7-2-amd64-clang14-lto
CONFIG_MODVERSIONS=y

-Sedat-
