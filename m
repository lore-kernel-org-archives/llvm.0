Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488B7F
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 16:59:21 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id v4so22759942ljd.10
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=aFMdnoSdQKc1hKJ4aWcPs1vZQqSLlN6PGVB7IjxjeRo=;
        b=dv6IXXPVKRMz6YTdxerUbZtrxkD57QvgFU9qks7i966jP11BcaGqPifg5OIUWy3EYX
         mMgyvXbJi1VFAiV8Pbz58CsuuxkBoNFHe1RJVczsg7QvGiZ25s6ZTuL94biLXCG5KYo4
         LQTwB3Ee57Kv9b8MFcCsgpE0TH4FzD+DUzo75P3H4jfu7vo1RwkBmEnUxk5J/CXRaKmO
         FWA1KeYLV+pNX7/hEm5A+GaFAjW9ItCpuyQphrfbocsUheV4MVhtnUfX2i9ZDpVa0ZV7
         1NoSwzF3YBbX63FGThNaDjh+zZJlqNNKl2/S812mAUQYsrUf/rL1kfPBZ+evl1mBuZ++
         S7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=aFMdnoSdQKc1hKJ4aWcPs1vZQqSLlN6PGVB7IjxjeRo=;
        b=j65p2QVDfrk/lpaYqF5ULeLa6sS1jate3mGF7zMRpLSaIux5N/NmOH66YsclZWzKh9
         cIh335e6zd5PjanGSVoaytAw6LQFgCGV+eqGAnFTO7hIPss3N41+xHaeZO04MaE3rdiv
         5EwmutGPdh3z2jvi9h4UzsvqLHSs4YkjFt5V69u1pfwG6Q7BvlmMOdmKTycr+biLdusb
         b5NJs6SkIU3UT6tY1nLkl4i5CGaNhmxDnfNxnQod1/THMIm3X9xR0FDnccqqL+cGk/+7
         oyfXIrfQfaUHbheYZQP3QLyzXxDWtrKrVHkfOuC7EY7bio76juLqk+nQ7mu9uCHEEkYM
         BiHA==
X-Gm-Message-State: AOAM531qb1VddP8b362PdtmjmU8ZQuXA0bAPp0nxFHkVY1KKjZdBfKTv
	sKDTPsUFT7vUhDx4qcCDZFcC
X-Google-Smtp-Source: ABdhPJxd2Up3CzD8WOw6V3Kbo8AA4WIopiMvZv8L8y48Ohm3mvtzpJgRvviepEu4ZqwpICGdtwPGUA==
X-Received: by 2002:a2e:a794:0:b0:250:5de1:1ec5 with SMTP id c20-20020a2ea794000000b002505de11ec5mr4283229ljf.270.1651597160007;
        Tue, 03 May 2022 09:59:20 -0700 (PDT)
Received: from smtpclient.apple ([31.173.83.165])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25934000000b0047255d211e6sm990563lfi.277.2022.05.03.09.59.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 May 2022 09:59:19 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset
 representation
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <YnFLeL93iHk+3vBd@dev-arch.thelio-3990X>
Date: Tue, 3 May 2022 19:59:17 +0300
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Nikita Popov <npopov@redhat.com>,
 llvm@lists.linux.dev,
 ci_notify@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0143746B-3EFA-4E83-8864-93A25AE026C5@linaro.org>
References: <962475179.3377.1651244787786@jenkins.jenkins>
 <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
 <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org>
 <YnFLeL93iHk+3vBd@dev-arch.thelio-3990X>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)



> On May 3, 2022, at 6:34 PM, Nathan Chancellor <nathan@kernel.org> =
wrote:
>=20
> Hi Maxim,
>=20
> On Tue, May 03, 2022 at 04:35:04PM +0300, Maxim Kuvyrkov wrote:
>>> On Apr 29, 2022, at 8:20 PM, Nick Desaulniers =
<ndesaulniers@google.com> wrote:
>>>=20
>>> On Fri, Apr 29, 2022 at 8:06 AM <ci_notify@linaro.org> wrote:
>>>>=20
>>>> [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset =
representation:
>>>> commit b9dc5651477b4c3c132662e763308b27963248a9
>>>> Author: Nikita Popov <npopov@redhat.com>
>>>>=20
>>>> [GVN] Encode GEPs in offset representation
>>>>=20
>>>>=20
...
>>>> # linux_n_obj:
>>>> 22258

After the patch LLVM can build 22258 .o files of the kernel ...

>>>>=20
>>>> # linux_n_obj:
>>>> 22260

... and before it could build 22260 .o files.=20

>>>>=20
>>>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>>>>=20
>>>> This commit has regressed these CI configurations:
>>>> - tcwg_kernel/llvm-master-arm-stable-allmodconfig
>>=20
>> This is reported against "stable" Linux tree, aka =
linux-rolling-stable branch [1].  So yeah, it's not a report about a new =
regression, but rather a report about regression reaching a stable =
branch.
>>=20
>> Does this answer your question?  Or is the report still looks not =
right?
>=20
> I think what Nick is getting at (or at least where I was confused by =
the
> initial report) is that these warnings (or errors with CONFIG_WERROR, =
in
> this case) have always been present in this configuration in the
> linux-rolling-stable branch, so I would not have expected these being
> present to trigger a regression report for LLVM.  In fact, the "last
> good" build has the exact same errors and results as the "first bad"
> build, with the LLVM hash being the only variable from what I can =
tell,
> so I would not expect a report to be generated in that case, but I =
don't
> know the conditions under which bisection starts.

The metric tracked in this CI is number of .o files produced in the =
build of Linux kernel, and bisections identify commits that cause this =
number to decrease.  Note that the snippet of warnings and errors tell a =
very approximate story about the regression.

In this particular case the regression report is about =
drivers/staging/rtl8723bs/core/rtw_security.o, which could be compiled =
before the patch, but after the patch we get:

00:32:31 drivers/staging/rtl8723bs/core/rtw_security.c:1288:5: error: =
stack frame size (1040) exceeds limit (1024) in 'rtw_aes_decrypt' =
[-Werror,-Wframe-larger-than]
00:32:31 u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
00:32:31     ^
00:32:31 1 error generated.
00:32:31 make[3]: *** [scripts/Makefile.build:288: =
drivers/staging/rtl8723bs/core/rtw_security.o] Error 1

--
Maxim Kuvyrkov
https://www.linaro.org
>=20
> Cheers,
> Nathan

