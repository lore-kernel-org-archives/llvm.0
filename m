Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3F33C9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 21:00:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id y19so23538127ljd.4
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 14:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mcJ7nAGhD4o7aoZTMUQzh1oxdnZrW4zTkO1Hzwe0Sxs=;
        b=Pz3yD+u7Q/KLYAaKYApYBf8/ZC6E5wBK4FZXZFltQdHz4eKemcfl9QvkGi/3Um29NP
         lNRKZh/JFh/Wntlrlf910hXLe+J71KSZkW9T9MBcylsk9nCCCHTOvySi4DdG2o8+HCS9
         8THe8lHoNmQs8b1/HEbeugTirqbKIhOpR9zn12RJ2GB88AjIpSayb9LWFGABr0/mvjJp
         AhKwL0BA39ktxKof/U1Ni50W0OFD6CwT/x3mQFbyBKkm/zVmi4yVxVurO9sDHSstU4pX
         FIwSDXJYBuSN45GRqZhGPmq28yo1EZUxcPt4IQR2XkG9QjbZY9uwQfVMAz+dyKYlaH0m
         IURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mcJ7nAGhD4o7aoZTMUQzh1oxdnZrW4zTkO1Hzwe0Sxs=;
        b=qryWVZ+FWnXBXPyWQq86F8OLcVr11W2KwjvgyWU4zoDjjPjrSbief8OWGtPZsQYe+T
         74rO/cst/Sw9aa+O/PSi3lx1bULTwYhj52kiIxWkRBaeOGKVrQEJyHPcB0ESSlsVS+8G
         iLfGvB+iccGGZHcsSKR4nRqPGnYK/fVXZ8XgX2K3Tz7qX3cALQ/nOqKrhyIzrXeZXJ5y
         dh0Lv984hell6CDNUlgo5zN1Cw8kqlBFyXldli823N6f37YNcqiF6FhF28/RhEzyK1Nz
         REmIekqXI115ZHWrx3idgSJRrXCwrQJNSNOTL/OGQyjAROqdDbGurQmbchUBk8hBrveH
         rlSw==
X-Gm-Message-State: AOAM5307x2f5De42Y8DstF4dhigZ/rptq64WTzNAhKyjCXViOYBy5pRd
	YCd0Jb10/8vVQc2m/xlVPnIh7LykinE3guFXARMU5A==
X-Google-Smtp-Source: ABdhPJw0z7HXHTi2aDwGHKFrsjE7akpPNWJguZylE8Hc6mBKrQQRkyDj3NlE/X44FKytAOcqK7qT0i095qGuIGug4wM=
X-Received: by 2002:a2e:854b:0:b0:24f:b98:e2d2 with SMTP id
 u11-20020a2e854b000000b0024f0b98e2d2mr11257798ljj.165.1651611603161; Tue, 03
 May 2022 14:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <962475179.3377.1651244787786@jenkins.jenkins> <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
 <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org> <YnFLeL93iHk+3vBd@dev-arch.thelio-3990X>
 <0143746B-3EFA-4E83-8864-93A25AE026C5@linaro.org>
In-Reply-To: <0143746B-3EFA-4E83-8864-93A25AE026C5@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 3 May 2022 13:59:50 -0700
Message-ID: <CAKwvOdkXY-E_tod8vMF+a7o0iECW+7ag7fysfwpq=6ute1ZR4w@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset representation
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nikita Popov <npopov@redhat.com>, llvm@lists.linux.dev, ci_notify@linaro.org, 
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2022 at 9:59 AM Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org> w=
rote:
>
>
>
> > On May 3, 2022, at 6:34 PM, Nathan Chancellor <nathan@kernel.org> wrote=
:
> >
> > Hi Maxim,
> >
> > On Tue, May 03, 2022 at 04:35:04PM +0300, Maxim Kuvyrkov wrote:
> >>> On Apr 29, 2022, at 8:20 PM, Nick Desaulniers <ndesaulniers@google.co=
m> wrote:
> >>>
> >>> On Fri, Apr 29, 2022 at 8:06 AM <ci_notify@linaro.org> wrote:
> >>>>
> >>>> [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset rep=
resentation:
> >>>> commit b9dc5651477b4c3c132662e763308b27963248a9
> >>>> Author: Nikita Popov <npopov@redhat.com>
> >>>>
> >>>> [GVN] Encode GEPs in offset representation
> >>>>
> >>>>
> ...
> >>>> # linux_n_obj:
> >>>> 22258
>
> After the patch LLVM can build 22258 .o files of the kernel ...
>
> >>>>
> >>>> # linux_n_obj:
> >>>> 22260
>
> ... and before it could build 22260 .o files.
>
> >>>>
> >>>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, RE=
PRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> >>>>
> >>>> This commit has regressed these CI configurations:
> >>>> - tcwg_kernel/llvm-master-arm-stable-allmodconfig
> >>
> >> This is reported against "stable" Linux tree, aka linux-rolling-stable=
 branch [1].  So yeah, it's not a report about a new regression, but rather=
 a report about regression reaching a stable branch.
> >>
> >> Does this answer your question?  Or is the report still looks not righ=
t?
> >
> > I think what Nick is getting at (or at least where I was confused by th=
e
> > initial report) is that these warnings (or errors with CONFIG_WERROR, i=
n
> > this case) have always been present in this configuration in the
> > linux-rolling-stable branch, so I would not have expected these being
> > present to trigger a regression report for LLVM.  In fact, the "last
> > good" build has the exact same errors and results as the "first bad"
> > build, with the LLVM hash being the only variable from what I can tell,
> > so I would not expect a report to be generated in that case, but I don'=
t
> > know the conditions under which bisection starts.
>
> The metric tracked in this CI is number of .o files produced in the build=
 of Linux kernel, and bisections identify commits that cause this number to=
 decrease.  Note that the snippet of warnings and errors tell a very approx=
imate story about the regression.
>
> In this particular case the regression report is about drivers/staging/rt=
l8723bs/core/rtw_security.o, which could be compiled before the patch, but =
after the patch we get:
>
> 00:32:31 drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: sta=
ck frame size (1040) exceeds limit (1024) in 'rtw_aes_decrypt' [-Werror,-Wf=
rame-larger-than]

Nathan,
I'm trying to remember, was it that CI systems should be disabling
CONFIG_WERROR? Wasn't there some other config to denote that "I'm
testing" that has implications for CONFIG_WERROR? Perhaps the config
I'm thinking of should be set for these builds?

> 00:32:31 u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
> 00:32:31     ^
> 00:32:31 1 error generated.
> 00:32:31 make[3]: *** [scripts/Makefile.build:288: drivers/staging/rtl872=
3bs/core/rtw_security.o] Error 1
>
> --
> Maxim Kuvyrkov
> https://www.linaro.org
> >
> > Cheers,
> > Nathan
>


--=20
Thanks,
~Nick Desaulniers
