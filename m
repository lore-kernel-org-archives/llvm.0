Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75052593
	for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 13:21:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so5143156wms.0
        for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRij9HZCL8a6JVsuThtRez/O3pAdXlY0ewZXTbRVwmc=;
        b=HB3zqkC68JvCSpta6wsCOYLRc7HMliFxegfQLhHgrznjmL6gHhY5489E9zZHeeiH1E
         JIEMdwCw6fpPaiiV/LfXEhFtpDinjcLuaK+mcgKM4mW1wkDu4hpVul9Ze0NRrvV2HU3u
         xJ0dEE58tZiFFfs0RFRUgYy7aVHXDvvVCdr7a8WQdq2FAsTsblpgP2wiL27YjEzcTPx0
         5z53VxZrUsxNaOJYHzROBJq7B6FTHttGVjqCFvAUYsl5OlQGKGXUpQFhqJRpDvxQh21f
         l44q8ALdz0ReLGhr9yYr9ch73D96QkmSJZbBBQmt2ol+F22MwEZa0I8+BK0G/gy5s79H
         DtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KRij9HZCL8a6JVsuThtRez/O3pAdXlY0ewZXTbRVwmc=;
        b=o6tNwHPCKtKS7EsM2pvvmwTfSYG740G9VytYKF13ztYIDm1Fj9ZCJzmd+rhKpEvwRV
         iR3CA5bk+E3Qkcx8mtP/GLMgmkneLW+LvYY8RnrsGD/7q/CaOfJ4m0LN03xlsYJRRxPE
         qRtZ9DP2n20m+zCUfUNXBgqDYHldXeQ0hrwapuNGE3Fwga0l9YlYLYZMLu1HGqiuRiPn
         GNX8Dfn5CCSvN1kEu8MvkCoIm3R2akwM0migNLttmzE3IFKF/TZT8DFYSI8C0JDEejuK
         BUhEURU6StSaBL40K8fxEuzG2qRw2Ahy94hanmfGcjF/t6kPtmSlIYf6CEG8lIIH4mrS
         //Dg==
X-Gm-Message-State: ANoB5pnwQ3r7ODLSZ6PCLvXqgLcOLkGtVR0Sx15RML0hyKR09Sdvnix2
	c+7zIo0E9F3H4vF8l1P/UP6Oglz/AHPWb8m+
X-Google-Smtp-Source: AA0mqf7vCh9fvJWbs4dFlmbF/mL/fR0BYbGzYsuCKkgK7qgvVn3B0+tN4w8yWAUZc9crZyswj4za0Q==
X-Received: by 2002:a05:600c:3c8d:b0:3d0:6d39:c62e with SMTP id bg13-20020a05600c3c8d00b003d06d39c62emr12952911wmb.12.1670851306002;
        Mon, 12 Dec 2022 05:21:46 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id z11-20020a7bc7cb000000b003d1ee3a6542sm8941366wmk.47.2022.12.12.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 05:21:45 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 12 Dec 2022 13:21:44 +0000 (UTC)
To: Lee Jones <lee@kernel.org>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1093341861.639.1670851305453@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.0.11-93-g327d1f01a21e: drm/amdgpu:
 temporarily disable broken Clang builds due to blown stack-frame
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_638_881224064.1670851304869"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-arm-stable-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_638_881224064.1670851304869
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Failure after v6.0.11-93-g327d1f01a21e: drm/amdgpu: temporarily disable bro=
ken Clang builds due to blown stack-frame:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
20699
# First few build errors in logs:
# 00:29:49 drivers/power/supply/ab8500_chargalg.c:493:13: error: unused var=
iable 'ab8500_chargalg_ex_ac_enable_toggle' [-Werror,-Wunused-variable]
# 00:29:50 make[3]: *** [scripts/Makefile.build:249: drivers/power/supply/a=
b8500_chargalg.o] Error 1
# 00:31:27 make[2]: *** [scripts/Makefile.build:465: drivers/power/supply] =
Error 2
# 00:31:27 make[1]: *** [scripts/Makefile.build:465: drivers/power] Error 2
# 00:44:56 make: *** [Makefile:1852: drivers] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
20879

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCT=
ION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-=
647 .
Status of v6.0.11-93-g327d1f01a21e commit for tcwg_kernel:
commit 327d1f01a21eaad6184d3d4c192bb7954a6c810e
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
* llvm-release-arm-stable-allyesconfig
** Failure after v6.0.11-93-g327d1f01a21e: drm/amdgpu: temporarily disable =
broken Clang builds due to blown stack-frame:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-stable=
-allyesconfig/290/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-stable-allyesconfig/290/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-stable-allyesconfig/289/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-327d1f01a21eaad6184d3d4c192bb7954a6c810e
cd investigate-linux-327d1f01a21eaad6184d3d4c192bb7954a6c810e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llv=
m-build-llvm-release-arm-stable-allyesconfig/290/artifact/artifacts/manifes=
t.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-ll=
vm-build-llvm-release-arm-stable-allyesconfig/289/artifact/artifacts/manife=
st.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts=
] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifact=
s] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 327d1f01a21eaad6184d3d4c192bb7954a6c810e
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
index 413d8c6d592f..220fb332c8e6 100644
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
------=_Part_638_881224064.1670851304869--
