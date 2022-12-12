Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B81FA5
	for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 04:22:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id ja17so1358323wmb.3
        for <llvm@lists.linux.dev>; Sun, 11 Dec 2022 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urLWD5NO+dW80vWOJ+SuYNXKtLa54sUlVEhvLu50+Go=;
        b=FfUDjn4k+vV+0PZelAuzZpDJ7MPL72TERz4tPYEn4e/lO63h3yCesjMWcdrDewD8me
         mVS1oyzq/mR1yn81c3y+oUA+amwuA3jtGqxMdaIrKEaGL342CJUa7ehW8pe8kCjbsNot
         rzFWMpJrV/ODzatu/EIQtKSgpNfK44AIxHRYm0HMj73qTAaNd2YwhrDKpslQAhZcqqZY
         bFoog6YmozVsQWOnDjdXGLQ2p8VXZnCadk/6wQag2n3Rt3nCOxUtZ3E41lpAmHgqWtRB
         s4neZn+5vayjUCISC2g8FBNsT+ZIx2i69a+hmO44YSuIerFzttxBIe5HRUHnqY8rgoek
         Tc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urLWD5NO+dW80vWOJ+SuYNXKtLa54sUlVEhvLu50+Go=;
        b=edtRTcDggG5ExUuy+fltx1gyKGYmyGjXq2yV77OyUiiO9cpXWMPMS7/5mUle4JdELD
         iSWWE88vnsd8D/d3Xb/zblwWZstwrx4AKrdq3FMcVLyE9LOTQ6FvYHru5yhY6to03PDq
         BUZPYzoz1MarJByMiIG1wp04dTel89kopO+IWb05lTi6QRglSHj7jUrvzmxfIw84FhP8
         SvRM40Tk4FOHpZnNXTemcVxvvXqydOO3/zqjxrO9u/q4DStJYc1BrS6DyDc1aPFQfWAz
         KJSVT7AtBiYSXiMANDSVp5p+rDmpY+NRtWS15YsrAjB11yNIa7sCIsGgppzfFfavif/x
         XVmw==
X-Gm-Message-State: ANoB5pl/NZX/UouPb6nWc+aYRndEuc0yMv6fDy8bSEhppI9Z/yH+VGsC
	k7Zf0XaXnCAbEgq7AM4ddPIv+Q==
X-Google-Smtp-Source: AA0mqf6rSFwJ8k9Q6063R45duiHLaP1U+FllOp8julTNfEMQ89GvdZj+WdT25LwwSiwzQaVnt5LeBQ==
X-Received: by 2002:a05:600c:3496:b0:3cf:7385:6783 with SMTP id a22-20020a05600c349600b003cf73856783mr14381008wmq.36.1670818918514;
        Sun, 11 Dec 2022 20:21:58 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b003b4cba4ef71sm8271012wmq.41.2022.12.11.20.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 20:21:58 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 12 Dec 2022 04:21:57 +0000 (UTC)
To: Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <863917218.529.1670818918106@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc4-59-g6f6cb1714365: drm/amdgpu:
 temporarily disable broken Clang builds due to blown stack-frame
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_528_1876074884.1670818917527"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-arm-mainline-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_528_1876074884.1670818917527
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Failure after v6.1-rc4-59-g6f6cb1714365: drm/amdgpu: temporarily disable br=
oken Clang builds due to blown stack-frame:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
20820
# First few build errors in logs:
# 00:02:53 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds li=
mit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:02:53 make[2]: *** [scripts/Makefile.build:250: crypto/wp512.o] Error =
1
# 00:06:26 make[1]: *** [scripts/Makefile.build:500: crypto] Error 2
# 00:12:09 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame s=
ize (1064) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe=
-larger-than]
# 00:12:09 make[5]: *** [scripts/Makefile.build:250: drivers/gpu/drm/tests/=
drm_mm_test.o] Error 1
# 00:12:09 make[4]: *** [scripts/Makefile.build:500: drivers/gpu/drm/tests]=
 Error 2
# 00:15:47 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame =
size (1088) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-=
larger-than]
# 00:15:47 make[4]: *** [scripts/Makefile.build:250: drivers/mtd/chips/cfi_=
cmdset_0001.o] Error 1
# 00:16:00 make[3]: *** [scripts/Makefile.build:500: drivers/mtd/chips] Err=
or 2
# 00:19:35 drivers/mtd/nftlcore.c:673:12: error: stack frame size (1136) ex=
ceeds limit (1024) in 'nftl_writeblock' [-Werror,-Wframe-larger-than]

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21000

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCT=
ION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-=
647 .
Status of v6.1-rc4-59-g6f6cb1714365 commit for tcwg_kernel:
commit 6f6cb1714365a07dbc66851879538df9f6969288
Author: Lee Jones <lee@kernel.org>
Date:   Fri Nov 25 12:07:49 2022 +0000

    drm/amdgpu: temporarily disable broken Clang builds due to blown stack-=
frame
   =20
    Patch series "Fix a bunch of allmodconfig errors", v2.
   =20
    Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST")
    WERROR now defaults to COMPILE_TEST meaning that it's enabled for
    allmodconfig builds.  This leads to some interesting build failures whe=
n
    using Clang, each resolved in this set.
   =20
    With this set applied, I am able to obtain a successful allmodconfig Ar=
m
    build.
   =20
   =20
    This patch (of 2):
   =20
    calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 ||
    ARM64) architectures built with Clang (all released versions), whereby =
the
    stack frame gets blown up to well over 5k.  This would cause an immedia=
te
    kernel panic on most architectures.  We'll revert this when the followi=
ng
    bug report has been resolved:
    https://github.com/llvm/llvm-project/issues/41896.
   =20
    Link: https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.org
    Link: https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.org
    Signed-off-by: Lee Jones <lee@kernel.org>
    Suggested-by: Arnd Bergmann <arnd@arndb.de>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Cc: Alex Deucher <alexander.deucher@amd.com>
    Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Harry Wentland <harry.wentland@amd.com>
    Cc: Lee Jones <lee@kernel.org>
    Cc: Leo Li <sunpeng.li@amd.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Nathan Chancellor <nathan@kernel.org>
    Cc: Nick Desaulniers <ndesaulniers@google.com>
    Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
    Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Tom Rix <trix@redhat.com>
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
* llvm-release-arm-mainline-allyesconfig
** Failure after v6.1-rc4-59-g6f6cb1714365: drm/amdgpu: temporarily disable=
 broken Clang builds due to blown stack-frame:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-mainli=
ne-allyesconfig/477/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-mainline-allyesconfig/477/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-mainline-allyesconfig/476/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-6f6cb1714365a07dbc66851879538df9f6969288
cd investigate-linux-6f6cb1714365a07dbc66851879538df9f6969288

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llv=
m-build-llvm-release-arm-mainline-allyesconfig/477/artifact/artifacts/manif=
est.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-ll=
vm-build-llvm-release-arm-mainline-allyesconfig/476/artifact/artifacts/mani=
fest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts=
] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifact=
s] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 6f6cb1714365a07dbc66851879538df9f6969288
Author: Lee Jones <lee@kernel.org>
Date:   Fri Nov 25 12:07:49 2022 +0000

    drm/amdgpu: temporarily disable broken Clang builds due to blown stack-=
frame
   =20
    Patch series "Fix a bunch of allmodconfig errors", v2.
   =20
    Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST")
    WERROR now defaults to COMPILE_TEST meaning that it's enabled for
    allmodconfig builds.  This leads to some interesting build failures whe=
n
    using Clang, each resolved in this set.
   =20
    With this set applied, I am able to obtain a successful allmodconfig Ar=
m
    build.
   =20
   =20
    This patch (of 2):
   =20
    calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 ||
    ARM64) architectures built with Clang (all released versions), whereby =
the
    stack frame gets blown up to well over 5k.  This would cause an immedia=
te
    kernel panic on most architectures.  We'll revert this when the followi=
ng
    bug report has been resolved:
    https://github.com/llvm/llvm-project/issues/41896.
   =20
    Link: https://lkml.kernel.org/r/20221125120750.3537134-1-lee@kernel.org
    Link: https://lkml.kernel.org/r/20221125120750.3537134-2-lee@kernel.org
    Signed-off-by: Lee Jones <lee@kernel.org>
    Suggested-by: Arnd Bergmann <arnd@arndb.de>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Cc: Alex Deucher <alexander.deucher@amd.com>
    Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: David Airlie <airlied@gmail.com>
    Cc: Harry Wentland <harry.wentland@amd.com>
    Cc: Lee Jones <lee@kernel.org>
    Cc: Leo Li <sunpeng.li@amd.com>
    Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Nathan Chancellor <nathan@kernel.org>
    Cc: Nick Desaulniers <ndesaulniers@google.com>
    Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
    Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
    Cc: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Tom Rix <trix@redhat.com>
    Cc: <stable@vger.kernel.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/disp=
lay/Kconfig
index 6925e0280dbe..f4f3d2665a6b 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -5,6 +5,7 @@ menu "Display Engine Configuration"
 config DRM_AMD_DC
 =09bool "AMD DC - Enable new display engine"
 =09default y
+=09depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 =09select SND_HDA_COMPONENT if SND_HDA_CORE
 =09select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128)
 =09help
@@ -12,6 +13,12 @@ config DRM_AMD_DC
 =09  support for AMDGPU. This adds required support for Vega and
 =09  Raven ASICs.
=20
+=09  calculate_bandwidth() is presently broken on all !(X86_64 || SPARC64 =
|| ARM64)
+=09  architectures built with Clang (all released versions), whereby the s=
tack
+=09  frame gets blown up to well over 5k.  This would cause an immediate k=
ernel
+=09  panic on most architectures.  We'll revert this when the following bu=
g report
+=09  has been resolved: https://github.com/llvm/llvm-project/issues/41896.
+
 config DRM_AMD_DC_DCN
 =09def_bool n
 =09help
</cut>
------=_Part_528_1876074884.1670818917527--
