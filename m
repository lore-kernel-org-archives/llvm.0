Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E01936E
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 06:11:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1g3U-1o1oFB1HB2-011y4d for <llvm@lists.linux.dev>; Wed, 30 Mar 2022
 08:11:17 +0200
Received: by mail-wm1-f43.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso191497wma.0
        for <llvm@lists.linux.dev>; Tue, 29 Mar 2022 23:11:17 -0700 (PDT)
X-Gm-Message-State: AOAM530z0QOlqqxPHPiNOWZrqRMGzvBFdOb0YuhWIcqqZq2h2cam1fUh
	iQhXaCC5mmOEwSaAG3db3qVcS3meKbcOxdWDocA=
X-Google-Smtp-Source: ABdhPJyuPUGU8Qpas92kWjeTSOPAYwK+c1Chh44bmkvoaDODFG6UE6Eq5BKcFaIwfARg8nJqf/AuHCf0Bo45fTjs1mA=
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr2776770wmc.94.1648620676900; Tue, 29
 Mar 2022 23:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220329212946.2861648-1-ndesaulniers@google.com>
 <CAKwvOdmsnVsW46pTZYCNu-bx5c-aJ8ARMCOsYeMmQHpAw3PtPg@mail.gmail.com>
 <CAKwvOdnJB5u96fm1w-R-VUayvhq58EQeqZst32NDRscK17Z8pQ@mail.gmail.com>
 <CAKwvOdmYzH91bzNus+RcZGSgCQGY8UKt0-2JvtqQAh=w+CeiuQ@mail.gmail.com> <CAK8P3a37gvycJ4zbeVvD_=6Npuep52VEP7CrgS-_8y6OXK_U3Q@mail.gmail.com>
In-Reply-To: <CAK8P3a37gvycJ4zbeVvD_=6Npuep52VEP7CrgS-_8y6OXK_U3Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 30 Mar 2022 08:11:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2RO7-SHKfe7b_LcG82gkca10c4fCJmjD_ToSP1Xm-yDA@mail.gmail.com>
Message-ID: <CAK8P3a2RO7-SHKfe7b_LcG82gkca10c4fCJmjD_ToSP1Xm-yDA@mail.gmail.com>
Subject: Re: [PATCH] net, uapi: remove inclusion of arpa/inet.h
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jon Maloy <jmaloy@redhat.com>, 
	Ying Xue <ying.xue@windriver.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Networking <netdev@vger.kernel.org>, 
	tipc-discussion@lists.sourceforge.net, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:F8F1DE1Cj9duLd+GPzJ6XwjYDQA3UtKy9wtrniN/aODBZ5nahuL
 wsH7Zcu1rLQ3enw8FYdE0W7oPPBvLFegykGVEdPzWu7HXlOMHBLLJgQN1nNmtU1fY4W5E8B
 wS2SyF8FhRMsrGMxt7vUveUtxaggh77Wlx8R+TrhjUE4SGfYuW3dgz8I9/RE3jGWsfHGS61
 U6dydNQDX5cyDi/IbaAOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+HuNLqHRgb4=:ljBUn30GpRt3dOgakapiXB
 hKuBrMrsvYzJqf/JCMwQ6Gke/rGh3EezHsrFJAccdN7CB82d08MpNzyvutAQuGSiOA2sjTYok
 U2AHjjMTPZ2V82KWlOni6hfGLVskohi9nlXm2njAcHjqx56tbswCN5TOJTMvqV3hgI/LOkLfN
 5hyauII2xS716SzZfxeJa2qXUku6V9o7BoYK+Loy9vfUyCbsL7tK1GjXYnmL8DoV9FlJCBU4V
 pMjSDgM53Lyf7PJPdgKidteY5RbtavNNw9nrqx5DPvPF/RtgMBaRb3YDZFQoKklSAlOq1MTKb
 6bEwG0rdYt3f6u45ZmCkJ12ihI9WidujJfd9Vz7i0phChOvb7rgjIVlwzJpnHKlZEjETDqFev
 nPcGVPMnfTs2DlRxp3b0fVw8PMCo6B+trJchzSnnVVHmcWSooGS9l2a+xmmF6s7HACXJQm/Ue
 UGPZTxNGld/WxlaECGRmdlplp8bqow0lnun40uzTGTapKh9faIoesQmmn3yKrqEH3mlDnIPdX
 EIwXR26lE//Ug36DNjebKcS1Q82NiFPf4uY78tpoQvDz/PXxiLXvo7V99SyzjwVsONl42fP2q
 3eNIPYJ2QpTXf00bIBf74vN+nVmgnifiBPmppigOaQzNgCvHh/o0hKENOBMcVEkCc99iIvyHW
 iVe16Zmt6eQsJgWtCOEq+7I/RJyyfU4M1rYvAeLBXlmMw0gxkGf2FiSShteWIR2EFkrNN+87A
 BZyuqnNvyrfcC/yO46LLg5WTgyRdb+EBhmh52laVaUbw2dP+BD4ycCt6VdogEQKVotjAK+Yld
 hDKAzPdQbCWgGn3WxqNLgCStJ5eSfwJjNB0fApbK+VsSoDgjeE=

On Wed, Mar 30, 2022 at 8:08 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Mar 30, 2022 at 12:26 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > On Tue, Mar 29, 2022 at 3:09 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > ```
> > diff --git a/include/uapi/linux/byteorder/little_endian.h
> > b/include/uapi/linux/byteorder/little_endian.h
> > index cd98982e7523..c14f2c3728e2 100644
> > --- a/include/uapi/linux/byteorder/little_endian.h
> > +++ b/include/uapi/linux/byteorder/little_endian.h
> > @@ -103,5 +103,8 @@ static __always_inline __u16 __be16_to_cpup(const __be16 *p)
> >  #define __cpu_to_be16s(x) __swab16s((x))
> >  #define __be16_to_cpus(x) __swab16s((x))
> >
> > +#define htonl(x) __cpu_to_be32(x)
> > +#define htons(x) __cpu_to_be16(x)
> > +#define ntohs(x) __be16_to_cpu(x)
> >
>
> This is unfortunately a namespace violation, you can't define things in uapi
> headers that conflict with standard library interfaces.

nevermind, I just saw the thread continues and you arrived at a good solution
withusing the __cpu_to_be16() etc directly.

       Arnd
