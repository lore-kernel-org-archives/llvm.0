Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E815B0
	for <llvm@lists.linux.dev>; Tue, 13 Dec 2022 01:26:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v7so7233880wmn.0
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 17:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qpWpo0K5ghgLoD9bhM2W9spPlD0s30Y35b2d5WXIzc=;
        b=eCLuIrNt4e79Z4crKeSarwGkZcpHxul5MEcoR3QVFJTFh1aZW7fyLlRcCQsVDova/E
         wTt2wLFGvHsCGDneaSEHZjHsmmhE9QF7JiBGmV3HkXrojGvgfojX2wYB0fO7OygBY64p
         GgTmz3caugn1Yu7xXMCD21hHbReyl9bLa+noAdKmCf6h3g5suo8owr99z0CKVuxtJYp2
         Kk610GlhIWk1qMd7mJ944bnj6PpfHb4581yMUuiwRJczAS52gOCSSehG+wO6Kjm1jg7P
         lOKjcO6q11XfTpq65d0O8eNwFhjpTOYINgkFzQ/ryDvMOtYxV0MjYcCIYEeAZ7qGXXBK
         WtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qpWpo0K5ghgLoD9bhM2W9spPlD0s30Y35b2d5WXIzc=;
        b=uwCZT2YqLl6u4L+/4pNUP1UoSkth0zCe7+85aWD2sPmgy3csOVzJBvyhB1U2CLBY6E
         Owi0K9rHmQ32SZBTnCFJy4WTbWqFG/e4vRcoyg8oGqT6eSP6wjoT/5sRIbPzC6rZO3Vu
         oD9Qhiv2JepuBdlE0TIC2KLzJvwMAPMK0Jhu4LnfsJRftnQZDW7GyMH21qNkMSwOu6Q+
         rbIS0uZoRDYmymLWLdQEKATgQRLe8SlRMms9hGdNIGxsrKwXIAQ6XzN6Va7Nifbdt6gX
         EG2BxuwNtdomfzhFRlITNBrhOEX3xvcu1gKm8Wa20suR1O4uNag+j524u+VajTgaOstr
         LTfg==
X-Gm-Message-State: ANoB5plfjgRyv6eM7AMyD6Jxzm6NLhePkrS1IHIB6iLX50ZZ3xTg1BWu
	/6fFHXXl6kjYKTtkhjy+tjoTDw==
X-Google-Smtp-Source: AA0mqf7WtoYRvZTsFKp7OfusK5d/n1FACN0uFzqJfml8mt4p2gWNCbsbrMah1VcvHhD16lkryezg2Q==
X-Received: by 2002:a05:600c:3c8d:b0:3d0:6d39:c62e with SMTP id bg13-20020a05600c3c8d00b003d06d39c62emr14544244wmb.12.1670894765785;
        Mon, 12 Dec 2022 17:26:05 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003cff309807esm11840821wmn.23.2022.12.12.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:26:05 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 13 Dec 2022 01:26:04 +0000 (UTC)
To: Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <526962388.806.1670894765265@jenkins.jenkins>
Subject: [TCWG CI] Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu:
 temporarily disable broken Clang builds due to blown stack-frame
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_805_1376999867.1670894764479"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-arm-lts-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_805_1376999867.1670894764479
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily disable br=
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
19761
# First few build errors in logs:
# 00:05:33 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds li=
mit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:05:33 make[1]: *** [scripts/Makefile.build:289: crypto/wp512.o] Error =
1
# 00:07:38 make: *** [Makefile:1900: crypto] Error 2
# 00:08:15 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack fra=
me size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-lar=
ger-than]
# 00:08:16 make[4]: *** [scripts/Makefile.build:289: drivers/gpu/drm/selfte=
sts/test-drm_mm.o] Error 1
# 00:08:24 make[3]: *** [scripts/Makefile.build:552: drivers/gpu/drm/selfte=
sts] Error 2
# 00:10:51 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame =
size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-=
larger-than]
# 00:10:52 make[3]: *** [scripts/Makefile.build:289: drivers/mtd/chips/cfi_=
cmdset_0001.o] Error 1
# 00:10:57 make[2]: *** [scripts/Makefile.build:552: drivers/mtd/chips] Err=
or 2
# 00:12:39 drivers/mtd/nftlcore.c:673:12: error: stack frame size (1144) ex=
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
19909

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCT=
ION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-=
647 .
Status of v5.15.81-80-gac2d7fa90848 commit for tcwg_kernel:
commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
Author: Lee Jones <lee@kernel.org>
Date:   Fri Nov 25 12:07:49 2022 +0000

    drm/amdgpu: temporarily disable broken Clang builds due to blown stack-=
frame
   =20
    commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
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
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
* llvm-release-arm-lts-allyesconfig
** Failure after v5.15.81-80-gac2d7fa90848: drm/amdgpu: temporarily disable=
 broken Clang builds due to blown stack-frame:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-lts-al=
lyesconfig/270/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-lts-allyesconfig/270/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-lts-allyesconfig/269/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f
cd investigate-linux-ac2d7fa9084892c2c1232016ecdeadf4b354212f

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llv=
m-build-llvm-release-arm-lts-allyesconfig/270/artifact/artifacts/manifest.s=
h --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-ll=
vm-build-llvm-release-arm-lts-allyesconfig/269/artifact/artifacts/manifest.=
sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts=
] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifact=
s] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit ac2d7fa9084892c2c1232016ecdeadf4b354212f
Author: Lee Jones <lee@kernel.org>
Date:   Fri Nov 25 12:07:49 2022 +0000

    drm/amdgpu: temporarily disable broken Clang builds due to blown stack-=
frame
   =20
    commit 6f6cb1714365a07dbc66851879538df9f6969288 upstream.
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
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/disp=
lay/Kconfig
index 127667e549c1..f25a2c80afcf 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -5,6 +5,7 @@ menu "Display Engine Configuration"
 config DRM_AMD_DC
 =09bool "AMD DC - Enable new display engine"
 =09default y
+=09depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 =09select SND_HDA_COMPONENT if SND_HDA_CORE
 =09select DRM_AMD_DC_DCN if (X86 || PPC64) && !(KCOV_INSTRUMENT_ALL && KCO=
V_ENABLE_COMPARISONS)
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
------=_Part_805_1376999867.1670894764479--
