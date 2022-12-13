Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA66D15B0
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 01:53:59 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id x66so1218955pfx.3
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 17:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X57yuXTgIjiBJBpuL2yp+GbYEKytps9GsEXN08UbTK0=;
        b=Mt6h5ptIZ2H9YX2m1zhJCLkmmrTb6NNaK9+5syJgKk3W0f0V0qxCl6CPT9DddJVMCN
         nGPlvCh0EWPktYZa7hMmW3dJUcKKHc9l8HVHPTDFoV16UDumVbgVkydAWqEgvKVvvG5P
         69TOi+/xCm1DZgQtx5bJ0PcUvWZFFc0FWxCyZ1z8yaMw5YYfyTqThpiapk+j6IKUgC72
         1GYJB2q+0fvVs50S91hbrykGktfzOxSS1JY13Rugg97Q6hfSKFmDbceRaxNu9S57H/9j
         +sjFHnv51b9U9ei2EP9GGHaBIsUsxdqk/0ShtQ5tDrCj9GeUtUVIMsX27SN6Mj9aIJym
         mTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X57yuXTgIjiBJBpuL2yp+GbYEKytps9GsEXN08UbTK0=;
        b=QLQAO30/lxg/3/ZzebRmJPv0Q+VfoI2N5cDSGcqI0gdT5hymF0vceIhmJBvcIg3s9o
         dBsNtcMNw4y4VzflyMDpSiZiTZIFITT1dJ/YKhTOqXAmpoeaiAAyGV7U9DzjQcPOufTD
         Vrb9vyzjFH4V8+tmGPQwy9w8ae/ID0IOsTUwRe76fXOQAgozm+Atd8iz1p0jZ69R3b3v
         gXIwwGUn9IUfQogvakvW9DcUqYBETPwHRglO3mM7tFjMs6KqMDLYO/eyWNHZzMjKXEva
         XjB5w0riNG4esAJKTvXOXfQV/3oVDOARXJfTr5TLg+MDKRb73X0l/6EMr8aNbfEBPMuJ
         T0oA==
X-Gm-Message-State: ANoB5pkWOjfpLvahp9+yKV6jAFg7j+KtvV+cfLa6P3lI59PTjENsU0K5
	mwNEdy192aZcCGDEsNPkzkG7ESE3aqjyT6U+UfK5zw==
X-Google-Smtp-Source: AA0mqf7GA1CfRJQCJ+/FMhQ0chlfomu0we9HrIOjc9rsjSnoi92lzM9POFm3ypMvRB5512cETG/tEjVVRzuzkU2cO+w=
X-Received: by 2002:a65:6753:0:b0:477:91c5:f9ff with SMTP id
 c19-20020a656753000000b0047791c5f9ffmr69735624pgu.403.1670896438818; Mon, 12
 Dec 2022 17:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <526962388.806.1670894765265@jenkins.jenkins>
In-Reply-To: <526962388.806.1670894765265@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 12 Dec 2022 17:53:47 -0800
Message-ID: <CAKwvOdnyZfVEP6OAPduD2VSzZAB=q1mvvAZs6eCgJ7wP=dLFfQ@mail.gmail.com>
Subject: Re: [TCWG CI] Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu:
 temporarily disable broken Clang builds due to blown stack-frame
To: ci_notify@linaro.org, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
Cc: Lee Jones <lee@kernel.org>, llvm@lists.linux.dev, arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2022 at 5:26 PM <ci_notify@linaro.org> wrote:
>
> Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily disable =
broken Clang builds due to blown stack-frame:
>
> Results changed to
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19761
> # First few build errors in logs:
> # 00:05:33 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds =
limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> # 00:05:33 make[1]: *** [scripts/Makefile.build:289: crypto/wp512.o] Erro=
r 1
> # 00:07:38 make: *** [Makefile:1900: crypto] Error 2
> # 00:08:15 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack f=
rame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-l=
arger-than]
> # 00:08:16 make[4]: *** [scripts/Makefile.build:289: drivers/gpu/drm/self=
tests/test-drm_mm.o] Error 1
> # 00:08:24 make[3]: *** [scripts/Makefile.build:552: drivers/gpu/drm/self=
tests] Error 2
> # 00:10:51 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack fram=
e size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wfram=
e-larger-than]
> # 00:10:52 make[3]: *** [scripts/Makefile.build:289: drivers/mtd/chips/cf=
i_cmdset_0001.o] Error 1
> # 00:10:57 make[2]: *** [scripts/Makefile.build:552: drivers/mtd/chips] E=
rror 2
> # 00:12:39 drivers/mtd/nftlcore.c:673:12: error: stack frame size (1144) =
exceeds limit (1024) in 'nftl_writeblock' [-Werror,-Wframe-larger-than]

I'm guessing the bisection logic is finding pre-existing issues
uncovered by hiding -Wframe-larger-than in AMDGPU drivers?

Any info on what the target ARCH=3D is? Guessing 32b perhaps?

>
> from
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19909
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODU=
CTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> For latest status see comments in https://linaro.atlassian.net/browse/LLV=
M-647 .
> Status of v5.15.81-80-gac2d7fa90848 commit for tcwg_kernel:
> commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
> Author: Lee Jones <lee@kernel.org>
> Date:   Fri Nov 25 12:07:49 2022 +0000
>
>     drm/amdgpu: temporarily disable broken Clang builds due to blown stac=
k-frame
>
>     commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
>
>     Patch series "Fix a bunch of allmodconfig errors", v2.
>
>     Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST=
")
>     WERROR now defaults to COMPILE_TEST meaning that it's enabled for
>     allmodconfig builds.  This leads to some interesting build failures w=
hen
>     using Clang, each resolved in this set.
>
>     With this set applied, I am able to obtain a successful allmodconfig =
Arm
>     build.
>
>
>     This patch (of 2):
>
>     calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 =
||
>     ARM64) architectures built with Clang (all released versions), whereb=
y the
>     stack frame gets blown up to well over 5k.  This would cause an immed=
iate
>     kernel panic on most architectures.  We'll revert this when the follo=
wing
>     bug report has been resolved:
>     https://github.com/llvm/llvm-project/issues/41896.
>
>     Link: https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.o=
rg
>     Link: https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.o=
rg
>     Signed-off-by: Lee Jones <lee@kernel.org>
>     Suggested-by: Arnd Bergmann <arnd@arndb.de>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Cc: Alex Deucher <alexander.deucher@amd.com>
>     Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
>     Cc: Daniel Vetter <daniel@ffwll.ch>
>     Cc: David Airlie <airlied@gmail.com>
>     Cc: Harry Wentland <harry.wentland@amd.com>
>     Cc: Lee Jones <lee@kernel.org>
>     Cc: Leo Li <sunpeng.li@amd.com>
>     Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>     Cc: Maxime Ripard <mripard@kernel.org>
>     Cc: Nathan Chancellor <nathan@kernel.org>
>     Cc: Nick Desaulniers <ndesaulniers@google.com>
>     Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>     Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Cc: Thomas Zimmermann <tzimmermann@suse.de>
>     Cc: Tom Rix <trix@redhat.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> * llvm-release-arm-lts-allyesconfig
> ** Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily disab=
le broken Clang builds due to blown stack-frame:
> ** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-=
allyesconfig/270/
>
> Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release=
-arm-lts-allyesconfig/270/artifact/artifacts
> Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release=
-arm-lts-allyesconfig/269/artifact/artifacts
>
> Reproduce current build:
> <cut>
> mkdir -p investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f
> cd investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests for bad and good builds
> mkdir -p bad/artifacts good/artifacts
> curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-l=
lvm-build-llvm-release-arm-lts-allyesconfig/270/artifact/artifacts/manifest=
.sh --fail
> curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-=
llvm-build-llvm-release-arm-lts-allyesconfig/269/artifact/artifacts/manifes=
t.sh --fail
>
> # Reproduce bad build
> (cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifac=
ts] artifacts)
> # Reproduce good build
> (cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifa=
cts] artifacts)
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
> Author: Lee Jones <lee@kernel.org>
> Date:   Fri Nov 25 12:07:49 2022 +0000
>
>     drm/amdgpu: temporarily disable broken Clang builds due to blown stac=
k-frame
>
>     commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
>
>     Patch series "Fix a bunch of allmodconfig errors", v2.
>
>     Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST=
")
>     WERROR now defaults to COMPILE_TEST meaning that it's enabled for
>     allmodconfig builds.  This leads to some interesting build failures w=
hen
>     using Clang, each resolved in this set.
>
>     With this set applied, I am able to obtain a successful allmodconfig =
Arm
>     build.
>
>
>     This patch (of 2):
>
>     calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 =
||
>     ARM64) architectures built with Clang (all released versions), whereb=
y the
>     stack frame gets blown up to well over 5k.  This would cause an immed=
iate
>     kernel panic on most architectures.  We'll revert this when the follo=
wing
>     bug report has been resolved:
>     https://github.com/llvm/llvm-project/issues/41896.
>
>     Link: https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.o=
rg
>     Link: https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.o=
rg
>     Signed-off-by: Lee Jones <lee@kernel.org>
>     Suggested-by: Arnd Bergmann <arnd@arndb.de>
>     Acked-by: Arnd Bergmann <arnd@arndb.de>
>     Cc: Alex Deucher <alexander.deucher@amd.com>
>     Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
>     Cc: Daniel Vetter <daniel@ffwll.ch>
>     Cc: David Airlie <airlied@gmail.com>
>     Cc: Harry Wentland <harry.wentland@amd.com>
>     Cc: Lee Jones <lee@kernel.org>
>     Cc: Leo Li <sunpeng.li@amd.com>
>     Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>     Cc: Maxime Ripard <mripard@kernel.org>
>     Cc: Nathan Chancellor <nathan@kernel.org>
>     Cc: Nick Desaulniers <ndesaulniers@google.com>
>     Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>     Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>     Cc: Thomas Zimmermann <tzimmermann@suse.de>
>     Cc: Tom Rix <trix@redhat.com>
>     Cc: <stable@vger.kernel.org>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/di=
splay/Kconfig
> index 127667e549c1..f25a2c80afcf 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -5,6 +5,7 @@ menu "Display Engine Configuration"
>  config DRM_AMD_DC
>         bool "AMD DC - Enable new display engine"
>         default y
> +       depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
>         select SND_HDA_COMPONENT if SND_HDA_CORE
>         select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL =
&& KCOV_ENABLE_COMPARISONS)
>         help
> @@ -12,6 +13,12 @@ config DRM_AMD_DC
>           support for AMDGPU. This adds required support for Vega and
>           Raven ASICs.
>
> +         calculate_bandwidth() is presently broken on all !(X86_64 || SP=
ARC64 || ARM64)
> +         architectures built with Clang (all released versions), whereby=
 the stack
> +         frame gets blown up to well over 5k.  This would cause an immed=
iate kernel
> +         panic on most architectures.  We'll revert this when the follow=
ing bug report
> +         has been resolved: https://github.com/llvm/llvm-project/issues/=
41896.
> +
>  config DRM_AMD_DC_DCN
>         def_bool n
>         help
> </cut>



--=20
Thanks,
~Nick Desaulniers
