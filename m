Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9248BED9
	for <llvm@lists.linux.dev>; Sat,  7 May 2022 12:19:12 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id e15so7857704qtp.3
        for <llvm@lists.linux.dev>; Sat, 07 May 2022 05:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y+oiGSCZb6NX25tsDNXkBW7Afl7nrsXXqru9rnhpvLU=;
        b=EVjVfXPYIT2pl1sW+WbBkp92OXUctBj433s+LBnmcW97uRKsPbxvx8bTWykOj7zQsr
         TNnujS8Pb49zFu16u0ddLu3VKMjDcbfC6fXazegN8+f0mE3WAL1eV2SWMZWF3SeBguYU
         Nhe8OO+Me6dzKehUPX5jOjwosHi9CRmaDd1nwtIKaocOYuFIg+qtpDXGXO+KGeVArJGD
         4S9wUxxLXlhiG0VGwFrTLINb08hqJfEyko4cUJi22tnorrbQit3Zk+2z2vPue2U0/7TU
         w47mD/gDrZ0ugqCxN1epRr3FceAe/MsC6iTsw1NwA52fOki95Q7IIaG1yt4pZR4SesjS
         Cieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y+oiGSCZb6NX25tsDNXkBW7Afl7nrsXXqru9rnhpvLU=;
        b=VnTUT4w0yohsyCdUYF3zi1KpiUDcq7Q4zmliO8GRVFYzaRb26uqnbGz66c3mLa6PK2
         MuaWvM0bJFGzzHaNTsp2I9/AysIccomqCV9VgQcCH07UPxjgoHzDpQEX7KI6VEVJ9duE
         10KCE8XcdZ6H5C2U9euPsOP6tPumSHeR3L06TVo/RPhHs8EqJxVpxsaNBrm/zdHscJvu
         ZfOg2EM0dis5uxyUh3T03MfH8A0rzygidEIJTLbfzcuxyGXmQKNXfIrlQbjTzClw1XsZ
         QK4vqJoHLPceYBJI7Ntknbf8I6TLqHtbAZOc9X586GMtO5zvVJVSR8/a4xoduHE0xoqZ
         Nj7Q==
X-Gm-Message-State: AOAM532HLCXYZPeWW5YHxahq6CQAwcLBZnJHBnrERSAt2awNe/91IZZQ
	M20IsiZP6QN2xu42sJjCWjytbmI6OMfOrGm29Ds=
X-Google-Smtp-Source: ABdhPJx7wlfjWdeqEwgKDAGwo8OCpkZMyW9++BoZIi/ZIEDmLSzP4QUQMRq/5r+8+GSG4TnCXGtyUkhmypL2Xin0baM=
X-Received: by 2002:a05:622a:134b:b0:2f3:d11e:3865 with SMTP id
 w11-20020a05622a134b00b002f3d11e3865mr1552279qtk.329.1651925951403; Sat, 07
 May 2022 05:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGZ=6K8wudbS--3z+JpKTsL_dfM-8Co7NwViRo0i3t2EZg@mail.gmail.com>
 <Ym2qdHAB6BMMlegB@thelio-3990X> <CAEQFVGZB6eAetmt1kk+TYbGxpfrDut37DEO_-1HECqM6FEERww@mail.gmail.com>
In-Reply-To: <CAEQFVGZB6eAetmt1kk+TYbGxpfrDut37DEO_-1HECqM6FEERww@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Sat, 7 May 2022 14:19:00 +0200
Message-ID: <CAEQFVGby3Q1mf1GGJwkFyAgaq38NvVAMx6tQM+9LO+HE8Z8Z8A@mail.gmail.com>
Subject: Re: arch/x86/entry/entry: RFC on recent kernels building error with
 llvm 11.0.2 internal assembler
To: Nathan Chancellor <nathan@kernel.org>
Cc: luto@kernel.org, Chih-Wei Huang <cwhuang@android-x86.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

> > Alternatively, you could apply the hack that Nick inserted into Android
> > for this issue if upgrading your toolchain or turning off the integrated
> > assembler is not possible:
> >
> > https://android.googlesource.com/kernel/common/+/e58f084735b8abf744d61083b92172ee23d45aae
> >
> > I really do not mean to sound dismissive or rude, I apologize if it
> > comes off that way, but we have worked quite hard to avoid inserting
> > unnecessary workarounds, as they are ultimately technical debt that can
> > be hard to manage over the long term.
> >
> > Cheers,
> > Nathan
>
> Thanks a lot Nathan
>
> It is definitely the clang version 11.0.x which is not updated in aosp
> Android 11 production tags
>
> I will use Nick's workaround which works since only lsl %rax, %rax is
> currently happening
>
> Many thanks, problem solved

Hello,
I'm back again because I was assuming that Nick's workaround was working ok,
but I have found that ARCH=x86_64 i.e. 64bit built kernel is causing
an immediate hard reboot at initrd execution,
just after hitting [ENTER] at grub/efi menu.

ARCh=x86 i.e. 32bit kernel binary is not affected, but is Nick's
workaround targeting 32 bit kernel builds?
Should it be modified to work for 64bit kernel binary?

How do aosp android-mailine kernels avoid this instantaneous hard reboot issue?
Mauro
