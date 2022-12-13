Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AD2907
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 11:08:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id c66so17171972edf.5
        for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFS4bG7KYVOyDph5+OpYpFGjRAjFq8CKezAKlqxWkkY=;
        b=zCKDoVyX9lL6Iwmj+VFZdjfoEXicC5eed9D1T1QIffwS1oKm30imHzqCAmt48z1wWG
         JahH/8eQIZFtqMCPPNdiWKa35QldZc5/NPWZ8VLMhPHzJcGxEqZRqHhC/Ork9fOpdlJZ
         jpDy8rX3dYurib89PmHAybJu0fGSqdJXaEPfxd4bAtsSyGhIy1QQvqK9yvJ4TpB8qDBP
         s71R6HeyhWiI9Ngm/hc2677gpazaWGlu1zH81eHe2Xd3J2CFtm2UI700itVMWeZ4TKh2
         IKoidWovxRuOV6OrF6GDy7WWp6oKqk8YeJWQL7eSyRf5pKi5dl0Eb8LfyPwKDKxi3B7B
         IxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFS4bG7KYVOyDph5+OpYpFGjRAjFq8CKezAKlqxWkkY=;
        b=62u8EXIR4gfGyPwQF0oOkIy9fBRFu2Sw1JngNEjUfEXoYZ26Q7PqWpOBuqgnzxY9+m
         xVwq8cBnflgz2YD+zsS0kw5ZzRGrzH84rN6ohMJDqGUFzKpDCKpdx0lserjzQt7cUDvh
         pjEp5dos0fOk40h0bkPUXQswNvXo3fwVGz5n+IWAqkkfScasvGBBceJIbow3AC/K3RWb
         yr8qZLd1FmOLoWVQ3HKhgoFeagFx/5mn3h9n80Ww4Q1bd/LIG1q2SAT6y1ho0mHumzu8
         TsFTTFn0+HLpQPwrhKfBDebLQsM2xr2lBvwJmGvk5A+vOQvYxo8EJe0uHsNVbRpaPdCY
         Fv0g==
X-Gm-Message-State: ANoB5pkiykybR746aBVaWxmltFA34Ly2PuiYgjnwvSDqvqEGm/BN+isT
	Ct6Zl5WYKJ434l42ohAqS7wW
X-Google-Smtp-Source: AA0mqf7IL3yThXWOHGIeqU/qwY0euL+Nez8JufsAEnTex32fL+o9x69ikX/CGCF2O6x5mZ9OhHl0Zw==
X-Received: by 2002:a05:6402:2989:b0:467:4df0:7185 with SMTP id eq9-20020a056402298900b004674df07185mr15743173edb.4.1670929716565;
        Tue, 13 Dec 2022 03:08:36 -0800 (PST)
Received: from smtpclient.apple ([2a00:cc47:21e1:4900:8142:afd4:bcb2:e324])
        by smtp.gmail.com with ESMTPSA id z16-20020a1709063ad000b007c0be4861e8sm4374789ejd.23.2022.12.13.03.08.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Dec 2022 03:08:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [TCWG CI] Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu:
 temporarily disable broken Clang builds due to blown stack-frame
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <CAKwvOdnyZfVEP6OAPduD2VSzZAB=q1mvvAZs6eCgJ7wP=dLFfQ@mail.gmail.com>
Date: Tue, 13 Dec 2022 15:08:33 +0400
Cc: ci_notify@linaro.org,
 Lee Jones <lee@kernel.org>,
 llvm@lists.linux.dev,
 Arnd Bergmann <arnd@linaro.org>,
 Laurent Alfonsi <laurent.alfonsi@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A632BE5-4041-4361-AAE1-55A0AD58A470@linaro.org>
References: <526962388.806.1670894765265@jenkins.jenkins>
 <CAKwvOdnyZfVEP6OAPduD2VSzZAB=q1mvvAZs6eCgJ7wP=dLFfQ@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)

Hi Nick,

This regression report is both right and wrong.  Our tcwg_kernel CI =
loops track the number of .o files generated during kernel build, and =
whatever causes the number of .o files to reduce is considered a =
regression.  This was a great approach in the times when LLVM could =
build only part of the kernel.  In this particular case before the =
commit we could compile 19909 .o files, and after the patch we compile =
only 19761 -- because the patch removed 150 files from the build =
process.

[The stack-limit errors are present both before and after the patch, and =
were caused by a different problem.]

As I'm writing this, it occurs to me that we can avoid such spurious =
reports by allowing number of object files to reduce due to changes in =
linux commits.  If an LLVM or GCC commit causes the number of compiled =
objects to reduce, we still want to treat that as a regression.

Another thought that occurs to me is that we need to setup wiki pages =
about our different CI loops explaining what they track and which =
regressions they detect.

This is detected in AArch32 configuration building linux-stable with =
tip-of-trunk LLVM.

Kind regards,

--
Maxim Kuvyrkov
https://www.linaro.org


> On Dec 13, 2022, at 5:53 AM, Nick Desaulniers =
<ndesaulniers@google.com> wrote:
>=20
> On Mon, Dec 12, 2022 at 5:26 PM <ci_notify@linaro.org> wrote:
>>=20
>> Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily =
disable broken Clang builds due to blown stack-frame:
>>=20
>> Results changed to
>> -10
>> # build_abe binutils:
>> -9
>> # build_kernel_llvm:
>> -5
>> # build_abe qemu:
>> -2
>> # linux_n_obj:
>> 19761
>> # First few build errors in logs:
>> # 00:05:33 crypto/wp512.c:782:13: error: stack frame size (1168) =
exceeds limit (1024) in 'wp512_process_buffer' =
[-Werror,-Wframe-larger-than]
>> # 00:05:33 make[1]: *** [scripts/Makefile.build:289: crypto/wp512.o] =
Error 1
>> # 00:07:38 make: *** [Makefile:1900: crypto] Error 2
>> # 00:08:15 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: =
stack frame size (1032) exceeds limit (1024) in '__igt_reserve' =
[-Werror,-Wframe-larger-than]
>> # 00:08:16 make[4]: *** [scripts/Makefile.build:289: =
drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
>> # 00:08:24 make[3]: *** [scripts/Makefile.build:552: =
drivers/gpu/drm/selftests] Error 2
>> # 00:10:51 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack =
frame size (1096) exceeds limit (1024) in 'cfi_intelext_writev' =
[-Werror,-Wframe-larger-than]
>> # 00:10:52 make[3]: *** [scripts/Makefile.build:289: =
drivers/mtd/chips/cfi_cmdset_0001.o] Error 1
>> # 00:10:57 make[2]: *** [scripts/Makefile.build:552: =
drivers/mtd/chips] Error 2
>> # 00:12:39 drivers/mtd/nftlcore.c:673:12: error: stack frame size =
(1144) exceeds limit (1024) in 'nftl_writeblock' =
[-Werror,-Wframe-larger-than]
>=20
> I'm guessing the bisection logic is finding pre-existing issues
> uncovered by hiding -Wframe-larger-than in AMDGPU drivers?
>=20
> Any info on what the target ARCH=3D is? Guessing 32b perhaps?
>=20
>>=20
>> from
>> -10
>> # build_abe binutils:
>> -9
>> # build_kernel_llvm:
>> -5
>> # build_abe qemu:
>> -2
>> # linux_n_obj:
>> 19909
>>=20
>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>>=20
>> For latest status see comments in =
https://linaro.atlassian.net/browse/LLVM-647 .
>> Status of v5.15.81-80-gac2d7fa90848 commit for tcwg_kernel:
>> commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
>> Author: Lee Jones <lee@kernel.org>
>> Date:   Fri Nov 25 12:07:49 2022 +0000
>>=20
>>    drm/amdgpu: temporarily disable broken Clang builds due to blown =
stack-frame
>>=20
>>    commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
>>=20
>>    Patch series "Fix a bunch of allmodconfig errors", v2.
>>=20
>>    Since b339ec9c229aa ("kbuild: Only default to -Werror if =
COMPILE_TEST")
>>    WERROR now defaults to COMPILE_TEST meaning that it's enabled for
>>    allmodconfig builds.  This leads to some interesting build =
failures when
>>    using Clang, each resolved in this set.
>>=20
>>    With this set applied, I am able to obtain a successful =
allmodconfig Arm
>>    build.
>>=20
>>=20
>>    This patch (of 2):
>>=20
>>    calculate_bandwidth() is presently broken on all !(X86_64 || =
SPARC64 ||
>>    ARM64) architectures built with Clang (all released versions), =
whereby the
>>    stack frame gets blown up to well over 5k.  This would cause an =
immediate
>>    kernel panic on most architectures.  We'll revert this when the =
following
>>    bug report has been resolved:
>>    https://github.com/llvm/llvm-project/issues/41896.
>>=20
>>    Link: =
https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.org
>>    Link: =
https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.org
>>    Signed-off-by: Lee Jones <lee@kernel.org>
>>    Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>    Acked-by: Arnd Bergmann <arnd@arndb.de>
>>    Cc: Alex Deucher <alexander.deucher@amd.com>
>>    Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
>>    Cc: Daniel Vetter <daniel@ffwll.ch>
>>    Cc: David Airlie <airlied@gmail.com>
>>    Cc: Harry Wentland <harry.wentland@amd.com>
>>    Cc: Lee Jones <lee@kernel.org>
>>    Cc: Leo Li <sunpeng.li@amd.com>
>>    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>    Cc: Maxime Ripard <mripard@kernel.org>
>>    Cc: Nathan Chancellor <nathan@kernel.org>
>>    Cc: Nick Desaulniers <ndesaulniers@google.com>
>>    Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>    Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>    Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>    Cc: Tom Rix <trix@redhat.com>
>>    Cc: <stable@vger.kernel.org>
>>    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> * llvm-release-arm-lts-allyesconfig
>> ** Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily =
disable broken Clang builds due to blown stack-frame:
>> ** =
https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-ally=
esconfig/270/
>>=20
>> Bad  build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-ally=
esconfig/270/artifact/artifacts
>> Good build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-ally=
esconfig/269/artifact/artifacts
>>=20
>> Reproduce current build:
>> <cut>
>> mkdir -p investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f
>> cd investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f
>>=20
>> # Fetch scripts
>> git clone https://git.linaro.org/toolchain/jenkins-scripts
>>=20
>> # Fetch manifests for bad and good builds
>> mkdir -p bad/artifacts good/artifacts
>> curl -o bad/artifacts/manifest.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-ally=
esconfig/270/artifact/artifacts/manifest.sh --fail
>> curl -o good/artifacts/manifest.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-ally=
esconfig/269/artifact/artifacts/manifest.sh --fail
>>=20
>> # Reproduce bad build
>> (cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true =
%%rr[top_artifacts] artifacts)
>> # Reproduce good build
>> (cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true =
%%rr[top_artifacts] artifacts)
>> </cut>
>>=20
>> Full commit (up to 1000 lines):
>> <cut>
>> commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
>> Author: Lee Jones <lee@kernel.org>
>> Date:   Fri Nov 25 12:07:49 2022 +0000
>>=20
>>    drm/amdgpu: temporarily disable broken Clang builds due to blown =
stack-frame
>>=20
>>    commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
>>=20
>>    Patch series "Fix a bunch of allmodconfig errors", v2.
>>=20
>>    Since b339ec9c229aa ("kbuild: Only default to -Werror if =
COMPILE_TEST")
>>    WERROR now defaults to COMPILE_TEST meaning that it's enabled for
>>    allmodconfig builds.  This leads to some interesting build =
failures when
>>    using Clang, each resolved in this set.
>>=20
>>    With this set applied, I am able to obtain a successful =
allmodconfig Arm
>>    build.
>>=20
>>=20
>>    This patch (of 2):
>>=20
>>    calculate_bandwidth() is presently broken on all !(X86_64 || =
SPARC64 ||
>>    ARM64) architectures built with Clang (all released versions), =
whereby the
>>    stack frame gets blown up to well over 5k.  This would cause an =
immediate
>>    kernel panic on most architectures.  We'll revert this when the =
following
>>    bug report has been resolved:
>>    https://github.com/llvm/llvm-project/issues/41896.
>>=20
>>    Link: =
https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.org
>>    Link: =
https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.org
>>    Signed-off-by: Lee Jones <lee@kernel.org>
>>    Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>    Acked-by: Arnd Bergmann <arnd@arndb.de>
>>    Cc: Alex Deucher <alexander.deucher@amd.com>
>>    Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
>>    Cc: Daniel Vetter <daniel@ffwll.ch>
>>    Cc: David Airlie <airlied@gmail.com>
>>    Cc: Harry Wentland <harry.wentland@amd.com>
>>    Cc: Lee Jones <lee@kernel.org>
>>    Cc: Leo Li <sunpeng.li@amd.com>
>>    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>    Cc: Maxime Ripard <mripard@kernel.org>
>>    Cc: Nathan Chancellor <nathan@kernel.org>
>>    Cc: Nick Desaulniers <ndesaulniers@google.com>
>>    Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>>    Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>    Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>    Cc: Tom Rix <trix@redhat.com>
>>    Cc: <stable@vger.kernel.org>
>>    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>>    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>> drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/amd/display/Kconfig =
b/drivers/gpu/drm/amd/display/Kconfig
>> index 127667e549c1..f25a2c80afcf 100644
>> --- a/drivers/gpu/drm/amd/display/Kconfig
>> +++ b/drivers/gpu/drm/amd/display/Kconfig
>> @@ -5,6 +5,7 @@ menu "Display Engine Configuration"
>> config DRM_AMD_DC
>>        bool "AMD DC - Enable new display engine"
>>        default y
>> +       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || =
ARM64
>>        select SND_HDA_COMPONENT if SND_HDA_CORE
>>        select DRM_AMD_DC_DCN if (X86 || PPC64) && =
!(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
>>        help
>> @@ -12,6 +13,12 @@ config DRM_AMD_DC
>>          support for AMDGPU. This adds required support for Vega and
>>          Raven ASICs.
>>=20
>> +         calculate_bandwidth() is presently broken on all !(X86_64 =
|| SPARC64 || ARM64)
>> +         architectures built with Clang (all released versions), =
whereby the stack
>> +         frame gets blown up to well over 5k.  This would cause an =
immediate kernel
>> +         panic on most architectures.  We'll revert this when the =
following bug report
>> +         has been resolved: =
https://github.com/llvm/llvm-project/issues/41896.
>> +
>> config DRM_AMD_DC_DCN
>>        def_bool n
>>        help
>> </cut>
>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers

