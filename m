Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C09E2C98
	for <llvm@lists.linux.dev>; Wed,  3 Nov 2021 17:13:36 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id t11so5037559ljh.6
        for <llvm@lists.linux.dev>; Wed, 03 Nov 2021 10:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Etd/bPsWAUM+aU57skuessjY1lC6fUSRgqzJAKYsJYQ=;
        b=isimaPVd2lE1bqzabGuvmuOUPXJ/hbJ6sr9zBa4aH0QwwdR/PTr6CrVmTPAfy/Z5Q2
         BitH3qHIxF66Db8CTppwT4aD08WyR/7Vk7tC8Mgt7o58/Vy8AKsSBJUwCX22kgodkBaF
         QhEfHbn+NzfpqTviZO8kb3JjXhCITEDPhNKebx9cqfDhC8OgxsqB79sW41Lszng4EOIu
         tNKsr2QwXKxxBF3+cDLCtfwe7SjOjRwCtnBY8IN4/NwoH4r/1q1U6hQZGo/kUukSvlBC
         snqYuvTDdEndu7+AhSMKTPvIDy3yncNdDwX8ZCaD772Pn2gm7xoqegn3Gk27K7sfAf0H
         DCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Etd/bPsWAUM+aU57skuessjY1lC6fUSRgqzJAKYsJYQ=;
        b=7xebGQ3cVOQ+08x6HdOrr53F2GkTqluiOtsARjwsFu4FdpJAA3S0VacSNGAj7wdSfC
         hPzYp8MOBszOeEgqI90nQozs19j/vkWApV1HeFcyP4zAoqPe7d5NwBn85REOqTkyS2lr
         VUOwnhmD8U9lq1umRs8TyJKnA2xVKsRLLRyt+jFIX7c8vF750Vk4yzg0VVqjBkicZW7e
         sKko6qxhKxa0a4LLqbOQIMc2ukE6/B4Tw5ifm7MXn+DXmuyLjLclvl8H3uaIkY8/XOuR
         t1YxP6vpLL5JT2Zy/rlCoAY75Hf1kQV3WU0OKmqnEI+EtijYpcwY1gNQBn/JdPA6r+6+
         dWog==
X-Gm-Message-State: AOAM531KL6DUh45DiAH4FuCSouRLhQl3I10zVh7hxi10mrVBB5FqrGJh
	spHa+hh3RGW7l63GgZCuhfAs
X-Google-Smtp-Source: ABdhPJyQ8DInGOjgmOq0rQRcmrOZ8O1Z+syRHQljeJHdAoSYAICpHC6OcyMmSznK3j5K5rVsb43GKQ==
X-Received: by 2002:a05:651c:230a:: with SMTP id bi10mr4515770ljb.185.1635959614120;
        Wed, 03 Nov 2021 10:13:34 -0700 (PDT)
Received: from [192.168.0.231] ([185.30.228.145])
        by smtp.gmail.com with ESMTPSA id c4sm120293ljd.10.2021.11.03.10.13.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Nov 2021 10:13:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [TCWG CI] Regression caused by linux: arm64: vdso32: require
 CROSS_COMPILE_COMPAT for gcc+bfd
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <CAKwvOdnt5G5FLgW9ryycGScRHphkWkgU8=PciCrCfxQyZJ9LKg@mail.gmail.com>
Date: Wed, 3 Nov 2021 20:13:32 +0300
Cc: llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D7FC531-CCFF-44EC-AE18-C941E30D1C85@linaro.org>
References: <205626749.4145.1635943938669@jenkins.jenkins>
 <810882F1-8476-435A-8B32-272F4D9D78D5@linaro.org>
 <CAKwvOdnt5G5FLgW9ryycGScRHphkWkgU8=PciCrCfxQyZJ9LKg@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3608.120.23.2.7)

> On 3 Nov 2021, at 20:07, Nick Desaulniers <ndesaulniers@google.com> =
wrote:
>=20
> On Wed, Nov 3, 2021 at 5:59 AM Maxim Kuvyrkov =
<maxim.kuvyrkov@linaro.org> wrote:
>>=20
>> Hi Nick,
>>=20
>> Is this known?
>=20
> News to me. Thanks for the report. This is when building with clang?

Yes, clang mainline and latest release branch.  Only kernel defconfig =
seems to be affected.

> Do you have the make invocation for this test?

The log is here:

=
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/build-3e6f8d1fa18457d54b20917bd9174d=
27daf09ab9/06-build_linux/

It seems that building aarch64 kernel with clang implies that clang can =
also build for aarch32 target:
=3D=3D=3D
error: unable to create target: 'No available targets are compatible =
with triple "thumbv8-unknown-linux-gnueabi"'
=3D=3D=3D

Which is not the case for our minimally-configured clang.

--
Maxim Kuvyrkov
https://www.linaro.org


>>=20
>> This was detected in linux-next a few days ago, but email =
notifications got lost.  Now this appears to have broken mainline.
>>=20
>> Regards,
>>=20
>> --
>> Maxim Kuvyrkov
>> https://www.linaro.org
>>=20
>>> On 3 Nov 2021, at 15:52, ci_notify@linaro.org wrote:
>>>=20
>>> [TCWG CI] Regression caused by linux: arm64: vdso32: require =
CROSS_COMPILE_COMPAT for gcc+bfd:
>>> commit 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
>>> Author: Nick Desaulniers <ndesaulniers@google.com>
>>>=20
>>>   arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
>>>=20
>>> Results regressed to
>>> # reset_artifacts:
>>> -10
>>> # build_abe binutils:
>>> -9
>>> # build_llvm:
>>> -5
>>> # build_abe qemu:
>>> -2
>>> # linux_n_obj:
>>> 37
>>> # First few build errors in logs:
>>> # 00:01:21 error: unable to create target: 'No available targets are =
compatible with triple '
>>> # 00:01:21 make[1]: *** [arch/arm64/kernel/vdso32/note.o] Error 1
>>> # 00:01:21 error: unable to create target: 'No available targets are =
compatible with triple '
>>> # 00:01:21 make[1]: *** [arch/arm64/kernel/vdso32/vgettimeofday.o] =
Error 1
>>> # 00:01:21 make: *** [vdso_prepare] Error 2
>>>=20
>>> from
>>> # reset_artifacts:
>>> -10
>>> # build_abe binutils:
>>> -9
>>> # build_llvm:
>>> -5
>>> # build_abe qemu:
>>> -2
>>> # linux_n_obj:
>>> 7716
>>> # linux build successful:
>>> all
>>> # linux boot successful:
>>> boot
>>>=20
>>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>>>=20
>>> This commit has regressed these CI configurations:
>>> - tcwg_kernel/llvm-master-aarch64-next-defconfig
>>> - tcwg_kernel/llvm-release-aarch64-mainline-defconfig
>>> - tcwg_kernel/llvm-release-aarch64-next-defconfig
>>>=20
>>> First_bad build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/build-3e6f8d1fa18457d54b20917bd9174d=
27daf09ab9/
>>> Last_good build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/build-14831fad73f5ac30ac61760487d95a=
538e6ab3cb/
>>> Baseline build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/build-baseline/
>>> Even more details: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/
>>>=20
>>> Reproduce builds:
>>> <cut>
>>> mkdir investigate-linux-3e6f8d1fa18457d54b20917bd9174d27daf09ab9
>>> cd investigate-linux-3e6f8d1fa18457d54b20917bd9174d27daf09ab9
>>>=20
>>> # Fetch scripts
>>> git clone https://git.linaro.org/toolchain/jenkins-scripts
>>>=20
>>> # Fetch manifests and test.sh script
>>> mkdir -p artifacts/manifests
>>> curl -o artifacts/manifests/build-baseline.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/manifests/build-baseline.sh --fail
>>> curl -o artifacts/manifests/build-parameters.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/manifests/build-parameters.sh =
--fail
>>> curl -o artifacts/test.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-mai=
nline-defconfig/28/artifact/artifacts/test.sh --fail
>>> chmod +x artifacts/test.sh
>>>=20
>>> # Reproduce the baseline build (build all pre-requisites)
>>> ./jenkins-scripts/tcwg_kernel-build.sh @@ =
artifacts/manifests/build-baseline.sh
>>>=20
>>> # Save baseline build state (which is then restored in =
artifacts/test.sh)
>>> mkdir -p ./bisect
>>> rsync -a --del --delete-excluded --exclude /bisect/ --exclude =
/artifacts/ --exclude /linux/ ./ ./bisect/baseline/
>>>=20
>>> cd linux
>>>=20
>>> # Reproduce first_bad build
>>> git checkout --detach 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
>>> ../artifacts/test.sh
>>>=20
>>> # Reproduce last_good build
>>> git checkout --detach 14831fad73f5ac30ac61760487d95a538e6ab3cb
>>> ../artifacts/test.sh
>>>=20
>>> cd ..
>>> </cut>
>>>=20
>>> Full commit (up to 1000 lines):
>>> <cut>
>>> commit 3e6f8d1fa18457d54b20917bd9174d27daf09ab9
>>> Author: Nick Desaulniers <ndesaulniers@google.com>
>>> Date:   Tue Oct 19 15:36:46 2021 -0700
>>>=20
>>>   arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
>>>=20
>>>   Similar to
>>>   commit 231ad7f409f1 ("Makefile: infer --target from ARCH for =
CC=3Dclang")
>>>   There really is no point in setting --target based on
>>>   $CROSS_COMPILE_COMPAT for clang when the integrated assembler is =
being
>>>   used, since
>>>   commit ef94340583ee ("arm64: vdso32: drop -no-integrated-as =
flag").
>>>=20
>>>   Allows COMPAT_VDSO to be selected without setting =
$CROSS_COMPILE_COMPAT
>>>   when using clang and lld together.
>>>=20
>>>   Before:
>>>   $ ARCH=3Darm64 CROSS_COMPILE_COMPAT=3Darm-linux-gnueabi- make -j72 =
LLVM=3D1 defconfig
>>>   $ grep CONFIG_COMPAT_VDSO .config
>>>   CONFIG_COMPAT_VDSO=3Dy
>>>   $ ARCH=3Darm64 make -j72 LLVM=3D1 defconfig
>>>   $ grep CONFIG_COMPAT_VDSO .config
>>>   $
>>>=20
>>>   After:
>>>   $ ARCH=3Darm64 CROSS_COMPILE_COMPAT=3Darm-linux-gnueabi- make -j72 =
LLVM=3D1 defconfig
>>>   $ grep CONFIG_COMPAT_VDSO .config
>>>   CONFIG_COMPAT_VDSO=3Dy
>>>   $ ARCH=3Darm64 make -j72 LLVM=3D1 defconfig
>>>   $ grep CONFIG_COMPAT_VDSO .config
>>>   CONFIG_COMPAT_VDSO=3Dy
>>>=20
>>>   Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>>   Suggested-by: Nathan Chancellor <nathan@kernel.org>
>>>   Tested-by: Nathan Chancellor <nathan@kernel.org>
>>>   Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>>   Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>>>   Link: =
https://lore.kernel.org/r/20211019223646.1146945-5-ndesaulniers@google.com=

>>>   Signed-off-by: Will Deacon <will@kernel.org>
>>> ---
>>> arch/arm64/Kconfig                |  3 ++-
>>> arch/arm64/kernel/vdso32/Makefile | 17 +++++------------
>>> 2 files changed, 7 insertions(+), 13 deletions(-)
>>>=20
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index 5c7ae4c3954b..f0f2c95aa4c8 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -1264,7 +1264,8 @@ config KUSER_HELPERS
>>>=20
>>> config COMPAT_VDSO
>>>      bool "Enable vDSO for 32-bit applications"
>>> -     depends on !CPU_BIG_ENDIAN && "$(CROSS_COMPILE_COMPAT)" !=3D =
""
>>> +     depends on !CPU_BIG_ENDIAN
>>> +     depends on (CC_IS_CLANG && LD_IS_LLD) || =
"$(CROSS_COMPILE_COMPAT)" !=3D ""
>>>      select GENERIC_COMPAT_VDSO
>>>      default y
>>>      help
>>> diff --git a/arch/arm64/kernel/vdso32/Makefile =
b/arch/arm64/kernel/vdso32/Makefile
>>> index e478cebb9891..c8fec493a450 100644
>>> --- a/arch/arm64/kernel/vdso32/Makefile
>>> +++ b/arch/arm64/kernel/vdso32/Makefile
>>> @@ -10,18 +10,15 @@ include $(srctree)/lib/vdso/Makefile
>>>=20
>>> # Same as cc-*option, but using CC_COMPAT instead of CC
>>> ifeq ($(CONFIG_CC_IS_CLANG), y)
>>> -CC_COMPAT_CLANG_FLAGS :=3D --target=3D$(notdir =
$(CROSS_COMPILE_COMPAT:%-=3D%))
>>> -
>>> CC_COMPAT ?=3D $(CC)
>>> -CC_COMPAT +=3D $(CC_COMPAT_CLANG_FLAGS)
>>> -
>>> -ifneq ($(LLVM),)
>>> -LD_COMPAT ?=3D $(LD)
>>> +CC_COMPAT +=3D --target=3Darm-linux-gnueabi
>>> else
>>> -LD_COMPAT ?=3D $(CROSS_COMPILE_COMPAT)ld
>>> +CC_COMPAT ?=3D $(CROSS_COMPILE_COMPAT)gcc
>>> endif
>>> +
>>> +ifeq ($(CONFIG_LD_IS_LLD), y)
>>> +LD_COMPAT ?=3D $(LD)
>>> else
>>> -CC_COMPAT ?=3D $(CROSS_COMPILE_COMPAT)gcc
>>> LD_COMPAT ?=3D $(CROSS_COMPILE_COMPAT)ld
>>> endif
>>>=20
>>> @@ -45,10 +42,6 @@ VDSO_CPPFLAGS +=3D $(LINUXINCLUDE)
>>> # Common C and assembly flags
>>> # =46rom top-level Makefile
>>> VDSO_CAFLAGS :=3D $(VDSO_CPPFLAGS)
>>> -ifneq ($(shell $(CC_COMPAT) --version 2>&1 | head -n 1 | grep =
clang),)
>>> -VDSO_CAFLAGS +=3D --target=3D$(notdir $(CROSS_COMPILE_COMPAT:%-=3D%))=

>>> -endif
>>> -
>>> VDSO_CAFLAGS +=3D $(call cc32-option,-fno-PIE)
>>> ifdef CONFIG_DEBUG_INFO
>>> VDSO_CAFLAGS +=3D -g
>>> </cut>
>>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers

