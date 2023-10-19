Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21701225D3
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eqnaa3UN"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7ab9f1efecfso2880124241.3
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697729371; x=1698334171; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcCWZrS9nr2T1Ft3SnepOqpeblKGImQnACoIdicePjc=;
        b=Eqnaa3UNJ4plBgWLDEDYxLoUtcbsiL3AwunaGI8/V1/oaTEo+WH/P4+4CJOHSOXwDL
         d+Y48Pp69iP7oWBYELAUPUfum4XPDaJOmEaU4oqZHUzuIV1iyHO2vI2LHEYu97yfjr7U
         xLMBmMQYrkBGLDkX74HnBOTwzWXIlZUHB/2lst0St95PpLA1cVKvT3+YC17eJaxj6dna
         OyQx4bkHZ4OzoIcdvHMuAZszvu5SEBmGkXVdS9Kxp5AO8OKEpBgDoJ4Ypkh0etO9pv74
         l4A/l/a1eE9DBCozHT3Ev6ndNp7nQZvqsFzxI/xaGP72TdZLLsPqteqB1YK6j262UDKi
         0Cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697729371; x=1698334171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcCWZrS9nr2T1Ft3SnepOqpeblKGImQnACoIdicePjc=;
        b=R+NMIP/VP/AB+gMk/EEQFpGHEMEzDxRcZx53IUHrIPJurP6wQcVT4B7sbpAiCPIueG
         iWB8tiwU6SmWLWGbfD4SEo95OO6YupRwe73BtFzPKQaF91CWeOoMsA2JuIAnWVcRJhJK
         TDEd2aF8F0oGb2oGOKpMb5czZmTt059WcIYAR04jDpqG6c7sjq/maFShA+uk+jY5m4mZ
         efCfqc45ZJMId5EOgjY3+98PeQoVeXFSpTyRUtZ6OKZ+/LVMs61fiIyOzKNXxMhYEtn9
         Y7fxw+Qz2py9SZzsrO3vvF0Ic2f7Kh9Ppby6AI1ZdH9gEXGK/4mtiDcjF5ekVMYNLLGU
         Rnog==
X-Gm-Message-State: AOJu0Yz/e+6EYw2B8t9GrupJP1aDPiDhAIJY7Me+pCdwea5yOdSqGCb+
	2CcEaZ8WWzPufspbZU2XE4WiEqRGQTg9FhhUgL42b7xc4kfZ4KkNzOpS2Q==
X-Google-Smtp-Source: AGHT+IExtpbxdBhQiplIsId+RjA6Ng1l3yPFnI90JPewRHxp0H1F3923YuNaDMbqTC0oMvbxq4PJ+5TwP756RdbTIeY=
X-Received: by 2002:a67:b048:0:b0:457:c9ae:6c6e with SMTP id
 q8-20020a67b048000000b00457c9ae6c6emr2554036vsh.12.1697729370667; Thu, 19 Oct
 2023 08:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <937553743.43340.1697682701023@jenkins.jenkins>
In-Reply-To: <937553743.43340.1697682701023@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Oct 2023 08:29:15 -0700
Message-ID: <CAKwvOd=bG0a_aOK-PvFFpkjsFN8cYc9xmeXMoOkHpUuan_zupw@mail.gmail.com>
Subject: Re: [Linaro-TCWG-CI] llvmorg-18-init-8757-gfd311126349b: Failure on aarch64
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the report. Looks like Nathan has reported this, too (as
have Google3 folks):
https://github.com/llvm/llvm-project/commit/fd311126349b8fe1684d62154a9fa5a=
7bbb0b713#commitcomment-130346081

On Wed, Oct 18, 2023 at 7:31=E2=80=AFPM <ci_notify@linaro.org> wrote:
>
> Dear contributor, our automatic CI has detected problems related to your =
patch(es).  Please find some details below.  If you have any questions, ple=
ase follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #=
linaro-tcwg channel, or ping your favourite Linaro toolchain developer on t=
he usual project channel.
>
> In CI config tcwg_kernel/llvm-master-aarch64-stable-defconfig after:
>
>   | commit llvmorg-18-init-8757-gfd311126349b
>   | Author: Florian Hahn <flo@fhahn.com>
>   | Date:   Tue Oct 17 19:17:40 2023 +0100
>   |
>   |     [VPlan] Insert Trunc/Exts for reductions directly in VPlan.
>   |
>   |     Update the code to create Trunc/Ext recipes directly in
>   |     adjustRecipesForReductions instead of fixing it up later in
>   |     fixReductions.
>   |
>   |     This explicitly models the required conversions and also makes su=
re they
>   | ... 2 lines of the commit log omitted.
>
> Results changed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 8020
> # First few build errors in logs:
>
> # 00:12:40 clang: error: clang frontend command failed with exit code 134=
 (use -v to see invocation)
> # 00:12:40 make[5]: *** [scripts/Makefile.build:243: drivers/platform/chr=
ome/cros_ec_i2c.o] Error 1
> # 00:13:18 make[4]: *** [scripts/Makefile.build:480: drivers/platform/chr=
ome] Error 2
> # 00:13:18 make[3]: *** [scripts/Makefile.build:480: drivers/platform] Er=
ror 2
> # 00:13:37 clang: error: clang frontend command failed with exit code 134=
 (use -v to see invocation)
> # 00:13:37 make[7]: *** [scripts/Makefile.build:243: drivers/net/ethernet=
/intel/igb/igb_main.o] Error 1
> # 00:13:46 make[6]: *** [scripts/Makefile.build:480: drivers/net/ethernet=
/intel/igb] Error 2
> # 00:13:53 make[5]: *** [scripts/Makefile.build:480: drivers/net/ethernet=
/intel] Error 2
> # 00:16:54 make[4]: *** [scripts/Makefile.build:480: drivers/net/ethernet=
] Error 2
> # 00:16:54 make[3]: *** [scripts/Makefile.build:480: drivers/net] Error 2
>
> From
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 9166
> # linux build successful:
> all
> # linux boot successful:
> boot
>
> The configuration of this build is:
> CI config tcwg_kernel/llvm-master-aarch64-stable-defconfig
>
> -----------------8<--------------------------8<--------------------------=
8<--------------------------
> The information below can be used to reproduce a debug environment:
>
> Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarc=
h64-stable-defconfig-build/60/artifact/artifacts
> Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarc=
h64-stable-defconfig-build/59/artifact/artifacts
>
> Reproduce last good and first bad builds: https://git-us.linaro.org/toolc=
hain/ci/interesting-commits.git/plain/llvm/sha1/fd311126349b8fe1684d62154a9=
fa5a7bbb0b713/tcwg_kernel/llvm-master-aarch64-stable-defconfig/reproduction=
_instructions.txt
>
> Full commit : https://github.com/llvm/llvm-project/commit/fd311126349b8fe=
1684d62154a9fa5a7bbb0b713
>
> Latest bug report status : https://linaro.atlassian.net/browse/LLVM-1007
>
> List of configurations that regressed due to this commit :
> * tcwg_kernel
> ** llvm-master-aarch64-stable-defconfig
> *** Failure
> *** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/=
llvm/sha1/fd311126349b8fe1684d62154a9fa5a7bbb0b713/tcwg_kernel/llvm-master-=
aarch64-stable-defconfig/details.txt
> *** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-def=
config-build/60/



--=20
Thanks,
~Nick Desaulniers
