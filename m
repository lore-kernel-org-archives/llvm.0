Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34C2746B
	for <llvm@lists.linux.dev>; Tue,  7 Feb 2023 17:53:55 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id ay1so11325863pfb.7
        for <llvm@lists.linux.dev>; Tue, 07 Feb 2023 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdYE59jhPLW5Gb7FO8je7hhIrAWkaxoGJtFNcprqnSQ=;
        b=XnCnEs57gV6IP+bsQDPe4v/3TMTZd2doPEhxGIGrFEuzInPWIlRGemVLO9RrzetJI/
         EqlXgqoRiutdWtZqH++xWuYA4v2zlwn5cOsLgezYp72ltsq2K9K0fx/ykuqAvl7z+rd9
         0cId9EamcZ96gv4O/AxeXVoMicV7svnpyy67qPujKf+wn3IIVyt5QEP0eCa0yNvfwxc3
         EYknggtxmnMdkDUgc7rZBRTh0aEv4Q7o3eopGMsOnNsGFCmi///o5FsSPnFOEs5o+QHW
         c7cU+BFjexuUt1XNDXYrPHtFwvvmdILSekEGhL105o6B+P02cJ6Q1HS7TVk5518mYgDa
         D3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdYE59jhPLW5Gb7FO8je7hhIrAWkaxoGJtFNcprqnSQ=;
        b=5/NGdyZd1iBpVYJ3rmRfPE/OsOdvJkuqWpa7k1gwku5t4QuzPbww41/ZB7w2SnNHHa
         4zkvman6oJxxS+cIUghycsKEAJAejuHZXPpOmfDQ7OacNlrN7VNIxVWg5sAbNCDh3UG8
         tPTVe+4IBq7zuV1nKJ/LgTd2yLZ0OWapnRRd23Zy2hXk1eSOLslshumYVBlM78nTxqpH
         x0lgtN6XC3uPBntzc1hacumLa8DD176Z7UBZwEXks16Kr4trScuqzI2soWdguSPhC3XK
         DWE+FQM5Po6/+xs8VMrX13CXNk1v20IxX/EVTkRrBJ6ahjiUvNgloZKxFuoi+egz2tY/
         1vAg==
X-Gm-Message-State: AO0yUKX60YopJckASwg2KVBP+WUHZfjwS1LmVy4chgNDpIA40TUvFSS0
	rbOfO++N1XJkPvFJAsgt4Bq3fmlx/wD7S2B++FtyYA==
X-Google-Smtp-Source: AK7set/qKH/bwZI3A1l24hMrTzSX/mf325pQPJNjwqBzOqXunbdFkTlUHvFoGmrlWKgmJTn+CxLRGm0IHL3JGtQo2U0=
X-Received: by 2002:aa7:9472:0:b0:5a7:6ee6:6710 with SMTP id
 t18-20020aa79472000000b005a76ee66710mr774606pfq.29.1675792434988; Tue, 07 Feb
 2023 09:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <63e1f7e0.170a0220.7142.de7c@mx.google.com> <Y+IRiiRtXvUzXOGp@gmail.com>
 <c3cd3489-ca32-bdf5-4538-d95532bf9430@collabora.com> <Y+JU07y+lvYAtZQT@sirena.org.uk>
 <85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com>
In-Reply-To: <85031c0c-d981-031e-8a50-bc4fad2ddcd8@collabora.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Feb 2023 09:53:43 -0800
Message-ID: <CAKwvOdmKYM21sb0dryEqeWTXh8gsN50KeCtnKW2dzqMLkyjcEQ@mail.gmail.com>
Subject: Re: tip/master build: 205 builds: 5 failed, 200 passed, 9 errors, 22
 warnings (v6.2-rc7-273-gd67c17ddc899)
To: Guillaume Tucker <guillaume.tucker@collabora.com>, mingo@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, x86@kernel.org, 
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>, 
	"kernelci-results@groups.io" <kernelci-results@groups.io>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2023 at 6:18 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> +Thomas Bogendoerfer +linux-mips
>
> On 07/02/2023 14:40, Mark Brown wrote:
> > On Tue, Feb 07, 2023 at 10:56:04AM +0100, Guillaume Tucker wrote:
> >> On 07/02/2023 09:53, Ingo Molnar wrote:
> >
> >>>>     4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used w=
ith =E2=80=98-mhard-float=E2=80=99
> >>>
> >>> ... but this exact same error was 'reported' a year ago on January 22=
:
> >>>
> >>>>    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used wi=
th =E2=80=98-mhard-float=E2=80=99
> >
> >>> So these regression reports are useless in this form and they clutter
> >>> people's inboxes. Is any person reading them and acting on them to ma=
ke
> >>> sure these emails are sensible?

FWIW, I read these reports daily. I only address the issues that look
specific to clang though.

> >
> >> About the actual kernel build error, I guess it's a shame nobody
> >> has fixed this yet.  I'll take a look what the root cause might
> >> be.  If it's a KernelCI build configuration issue e.g. using
> >> wrong compiler flags then we can fix that, otherwise it's
> >> probably something to report more directly to some MIPS
> >> maintainers.
> >
> > Honestly at this point I think we should just drop the affected MIPS
> > configurations at this point, as Ingo says they've been failing for
> > so long with nobody caring.
>
> Maybe the MIPS people just haven't seen this.  I've added Thomas
> and the linux-mips list to confirm.
>
> After some investigation, it turns out the error happens when
> doing "make modules_install".  Here's the issue:
>
> * modules_install is listed in "no-compiler-targets" in the
> top-level Makefile
>
> * as a result, scripts/Makefile.compiler is not included
>
> * arch/mips/loongson64/Platform requires the "cc-option" function
>   to add -mnon-loongson-mmi
>
> * since "cc-option" is not defined when just doing "make
>   modules_install", the flag is not added and the error mentioned
>   above occurs

+ Masahiro

>
> GitHub issue: https://github.com/kernelci/kernelci-project/issues/176
>
> Here's a hack to prove this point, need-compiler is defined in
> the top-level Makefile so it shouldn't be used here but
> this "fixes" the problem:
>
>
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 490dea07d4e0..024f62dbef76 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -317,10 +317,12 @@ KBUILD_CFLAGS +=3D -fno-asynchronous-unwind-tables
>  KBUILD_LDFLAGS         +=3D -m $(ld-emul)
>
>  ifdef CONFIG_MIPS
> +ifdef need-compiler
>  CHECKFLAGS +=3D $(shell $(CC) $(KBUILD_CFLAGS) -dM -E -x c /dev/null | \
>         grep -E -vw '__GNUC_(MINOR_|PATCHLEVEL_)?_' | \
>         sed -e "s/^\#define /-D'/" -e "s/ /'=3D'/" -e "s/$$/'/" -e 's/\$$=
/&&/g')
>  endif
> +endif
>
>  OBJCOPYFLAGS           +=3D --remove-section=3D.reginfo
>
>
>
> I guess another way would be to unconditionally add the options
> to the cflags, in fact there are other places where this appears
> to be done.  I'm not sure which GCC or Clang versions support it
> or not, so that may not work in practice.
>
>
>
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platfor=
m
> index 473404cae1c4..b7b2db13f1a2 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -12,7 +12,7 @@ endif
>
>  # Some -march=3D flags enable MMI instructions, and GCC complains about =
that
>  # support being enabled alongside -msoft-float. Thus explicitly disable =
MMI.
> -cflags-y +=3D $(call cc-option,-mno-loongson-mmi)
> +cflags-y +=3D -mno-loongson-mmi

Nack. Clang doesn't support this flag. See also
commit 0e96ea5c3eb5 ("MIPS: Loongson64: Clean up use of cc-ifversion")


>
>  #
>  # Loongson Machines' Support
>
>
>
> This was reproduced using GCC 10 with the latest
> kernelci/gcc-10:mips-kselftest-kernelci Docker image running as
> root.
>
>
> Is this something someone familiar with MIPS would like to fix
> properly? If not then please confirm that we should just drop
> the loongson2k_defconfig builds from KernelCI.  Is this kernel
> config actually still maintained in mainline?
>
> Thanks,
> Guillaume
>
>


--=20
Thanks,
~Nick Desaulniers
