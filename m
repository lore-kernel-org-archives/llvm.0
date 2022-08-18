Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6477B
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 04:25:26 +0000 (UTC)
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-10.nifty.com with ESMTP id 27I4KDl0016897
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 13:20:13 +0900
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51]) (authenticated)
	by conssluserg-03.nifty.com with ESMTP id 27I4K1Uc016991
	for <llvm@lists.linux.dev>; Thu, 18 Aug 2022 13:20:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 27I4K1Uc016991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1660796402;
	bh=X+KYz3bvnotGhgU6LfGTpOOtP+9exfgnFUa2R1hO/Sw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EAvAOmy+hIeZZdWvxAw2098N9bpcv9TJw+7fwxGBO+GWTchOTz/tcdsQTpbdGe4de
	 S7jYcP5U9NlCnIvWAFVaTYZwPg/B05RPJ3USLJKhJeDhXbJsx8tUu40flatqqHKxEU
	 Jc6Of0VMT05yFGdydrdR6eMnNnfK8zL2mijc6+C6yr1A3sVosCIoloCV9hPqjiz+x3
	 Q3Qm0k1E5ue1+X0hFM2BlrDHQBEB3j4/7jrJqArVWh/w+mV4RnJPuxx5A++4B+CioR
	 JaiRgWln0FksarNJZay+2unk8O0VE2MhKjCGMNov/acHK9Z/ccdWNyLzGmP+8ZgNMK
	 0Dd6qpuVnQjoA==
X-Nifty-SrcIP: [209.85.128.51]
Received: by mail-wm1-f51.google.com with SMTP id m10-20020a05600c3b0a00b003a603fc3f81so325712wms.0
        for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 21:20:02 -0700 (PDT)
X-Gm-Message-State: ACgBeo33OooYJhvARsmMEXpj5+9qtVHXy2Ks6Gf/mTzAfMpQ8EWxScre
	KwdnYz0rygDjVNLFKx55XXDrnFIfkA5TORpjdfU=
X-Google-Smtp-Source: AA6agR7IOS4x6IdQMvHvGiYpWgJP+NC2pa9X4foDLvWbfo5Q5MSp9wdke92+HWr4Qy3S5VrzEb+RHB2eVswSdSR8Hzg=
X-Received: by 2002:a05:600c:5102:b0:3a5:a46d:5d4b with SMTP id
 o2-20020a05600c510200b003a5a46d5d4bmr619439wms.68.1660796400821; Wed, 17 Aug
 2022 21:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1659635174-2376-1-git-send-email-quic_gurus@quicinc.com> <CAKwvOdnbMs-pLRfo4O-MHOF=9=kAvDuktkeeeX7bkmnLi8LWnw@mail.gmail.com>
In-Reply-To: <CAKwvOdnbMs-pLRfo4O-MHOF=9=kAvDuktkeeeX7bkmnLi8LWnw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Aug 2022 13:19:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbtrKTgNcoBu=o6rNDmjW4Fdc+2spgZZr52YV2axyfMA@mail.gmail.com>
Message-ID: <CAK7LNATbtrKTgNcoBu=o6rNDmjW4Fdc+2spgZZr52YV2axyfMA@mail.gmail.com>
Subject: Re: [PATCH] scripts/clang-tools: Remove DeprecatedOrUnsafeBufferHandling
 check
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        clang-built-linux <llvm@lists.linux.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 18, 2022 at 8:40 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 4, 2022 at 10:46 AM Guru Das Srinagesh
> <quic_gurus@quicinc.com> wrote:
> >
> > This `clang-analyzer` check flags the use of memset(), suggesting a more
> > secure version of the API, such as memset_s(), which does not exist in
> > the kernel:
> >
> >   warning: Call to function 'memset' is insecure as it does not provide
> >   security checks introduced in the C11 standard. Replace with analogous
> >   functions that support length arguments or provides boundary checks such
> >   as 'memset_s' in case of C11
> >   [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
> >
> > Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> > ---
> >  scripts/clang-tools/run-clang-tools.py | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> > index f754415a..1337ced 100755
> > --- a/scripts/clang-tools/run-clang-tools.py
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -51,6 +51,7 @@ def run_analysis(entry):
> >          checks += "linuxkernel-*"
> >      else:
> >          checks += "clang-analyzer-*"
> > +        checks += ",-clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling"
>
> Thanks for the patch! I think it makes sense to add this.  I suspect
> the list of checks we might want to disable may grow. Maybe when it
> does, we could put these in an array and join them at the end.
>
> Anyways, LGTM
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Masahiro, would you mind picking this up for us, please?




Sure.
Applied to linux-kbuild/fixes.
Thanks.





> >      p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> >                         stdout=subprocess.PIPE,
> >                         stderr=subprocess.STDOUT,
> > --
> > 2.7.4
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
