Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874123D80
	for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 17:37:09 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so2496769pjl.3
        for <llvm@lists.linux.dev>; Thu, 13 Oct 2022 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2Z/H4vUNoQZ07a2uDtHw0I2miAywOm74HMO3BI9Jf8=;
        b=a45rOd6YOV1u4I7OaJkd8XnvdlBU9nTiwEtyZN2ki6km4MoGLn3YP5F6/cKNjIppq4
         2F12m1LSL/y58Sgl0RkSA19ykWKYqpjFzC+hQ3vrqk7EfNzZ109+r7DkWNmyoa5Y2W2k
         ZqSFJBCfWdOlq5vCzPDLVb11MxcHiq2iwye5/e88+HMG1Ln4gdxsvO6IAV8DsQ94RKcF
         5zldLwsH9FH1aAe11DUtxs6IoA6JRAWHaBki7XQLSyuwrj7wNY4pIrxbZ7fI4YRyhITj
         g8ISpM6xDM6auGbqDvgMvSgrYEMfnyGq1lvQgq6hLjlPDGOztlU7NMJKDanxbcugJxFf
         nABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2Z/H4vUNoQZ07a2uDtHw0I2miAywOm74HMO3BI9Jf8=;
        b=kSFzkvbO+GSm8u+2q0mt9lyHwmfXNovhbyAn3W22CbH8f8ZU13yhXurUlZdOfZEp27
         mrkp6AGH6Vo7+TUeu17wxNFAYJAiAE/V/I+wjZs9Fm7SOfUvh9n+Va6Rtu8J/76HDBvI
         IMBBqKv9fwmCisupXwqY2KST6SCW6DjjCDIU0dthTc4IHuKSAdoNyQJMi41dCzVub915
         kVs01ID7XXNv48+cYiUq/arleKrX2786GiJYRPrRfyNmIkyc61HvRNZZ3Mco4V2v7pHy
         q4dpw3Hew4nYSXh+nGEqBxRyo6psOyJttJrWQDsO6LPB0ktwhTkhlEQW8uog+vCNN0Qi
         oHkg==
X-Gm-Message-State: ACrzQf2nq0PYqYJ5bgL98oGc5citLUz2sTxs+/owUCXrAE8gIercFZjS
	sUREzunNRoXRg/61q7QDMzB2k5n2KUOCwzXmmZlgdf8DmVI=
X-Google-Smtp-Source: AMsMyM4gKOyZtV5IJ9gUK/qpsuqMcuIX7PLd7Xdz/1yzahpum6emxM3V3Vpx/etUXOI4c2X/sfK7Loj82PyKYP8thgU=
X-Received: by 2002:a17:902:b218:b0:184:710c:8c52 with SMTP id
 t24-20020a170902b21800b00184710c8c52mr833375plr.95.1665682628763; Thu, 13 Oct
 2022 10:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABgnqwAZW=ro3BWdjar97RLif5mdeNGz7XssiKFyHcnfnC+uqA@mail.gmail.com>
 <CABgnqwDx_tiQKonycPMKKDXnnhyoEvcvaBSZVeyNuVenJ2FrkQ@mail.gmail.com>
 <43ee826c-5f1a-4fb3-b644-49caf5778ad4@app.fastmail.com> <84f832ae-bfc5-a718-e757-11c47164ec03@arm.com>
In-Reply-To: <84f832ae-bfc5-a718-e757-11c47164ec03@arm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 13 Oct 2022 10:36:56 -0700
Message-ID: <CAKwvOdnh864Gk4Oa2kV77Cc4QmvwFKncLxvAU5WGDDtp7j4ZAQ@mail.gmail.com>
Subject: Re: coresight: etm4x build failure with unrolled loops
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Luong Ngo <lngo@google.com>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2022 at 1:26 AM Suzuki K Poulose <suzuki.poulose@arm.com> w=
rote:
>
> Hi
>
>
> On 12/10/2022 07:33, Arnd Bergmann wrote:
> > On Wed, Oct 12, 2022, at 1:20 AM, Luong Ngo wrote:
> >> Resend with another Arnd's email as arnd@arndb.be is not working any m=
ore.
> >
> > arnd@arndb.de is my normal address, if you are seeing problems with it,=
 can
> > you tell me what went wrong? If you got a bounce, please forward that t=
o
> > my @kernel.org address.
> >
> >>> Hello Arnd and Suzuki,
> >>>
> >>> We recently enable coresight driver in our kernel and the build faile=
d with the exact same error that I found your discussion of same issue in t=
his mail thread (https://lkml.org/lkml/2021/4/29/862). The suggestion fix b=
y changing etm4x_relaxed_read32 with csdev_access_relaxed_read32 indeed fix=
 the compilation error. However, the change was not upstreamed. Do you have=
 insight into why the fix was not submitted?  Is there any chance for it to=
 be submitted?
>
> This was committed upstream, as :
>
> 4d45bc82df667, avaialable upstream since, v6.0-rc1.  However, I see
> that it was not sufficient. We need the same fix for "write"
> operatoins too. Something like :
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h
> b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 4b21bb79f168..38192eae55b3 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -525,7 +525,7 @@
>
>   #define write_etm4x_sysreg_offset(val, offset, _64bit)                 =
\
>         do {                                                            \
> -               if (__builtin_constant_p((offset)))                     \
> +               if (__is_constexpr((offset)))                           \
>                         write_etm4x_sysreg_const_offset((val),          \
>                                                          (offset));      =
\
>                  else                                                    =
\
>
> I will post this out and queue it as fixes for 6.1-rc1

SGTM

>
> Thanks
> Suzuki
>
> >
> > I think that issue came up again on the clangbuiltlinux project, and
> > we concluded that we should resend one of the old patches, but I don't
> > know if anyone did, or which one of the them we decided on. It should
> > not be hard to fix.
> >
> >      Arnd
>
>


--=20
Thanks,
~Nick Desaulniers
