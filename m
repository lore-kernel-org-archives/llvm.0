Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C5A192
	for <llvm@lists.linux.dev>; Sun, 30 Oct 2022 05:32:13 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k2so22168828ejr.2
        for <llvm@lists.linux.dev>; Sat, 29 Oct 2022 22:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asgKbOnD9cfUmi2p6Wdhk87kcmDkNWJ/DXpKZUmzQIY=;
        b=NuCtqmEzJZzzL1ENlh0FJmJn10fKkiD7XJMZyDGPQE8r1MQvIX1xb84exLv+w6Dof/
         SsU1ISP3XWLjki3rrVEMVTvmf6QMCjm5NTIiUxVRyHYJpfk6LGT3UOa9tNdSpctPYo6+
         teF6GvZzmiGl/T7InMEveYDUm12JMNCdCSlCc6OCaFCwBUv1Ls02rYc6rf8xcbduPY8l
         g747chOPkTp99yOiQK7qu2tZyCcdQiBWIcqkyxi8khTYbQxAVjAHGFJLrqc+TtifD/R6
         kdu1WHZKWReSlFKICOqbw4NuNUv/NuOfXwnYBpTnkD67WRDbtD+LTbcvLAIvHxKyaWrB
         2NGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asgKbOnD9cfUmi2p6Wdhk87kcmDkNWJ/DXpKZUmzQIY=;
        b=LX2mbCW1glU9PK6cA9Z7TMtw9LH0ntFJ7pYblNyd8p0i0zBadapEjOzYYEtUHb4ixy
         TSNnc46cJJqDSN57+NUil9BU0jUNIKeZjb5u/I3EmBDvQ8txiHjStuk9jG//IbRs0anN
         8Bmi9Et04hVfnfbF5m1kfZHswnITXLySmgNfuAEtaSBudCfvIKlwuy1LcyZjOKgfQfMz
         oTGEDPMREZLaRwFmtvOfo37GVbjYlWc0ymfyyeNJuC8cGkYfkpUwF1acIR0nFLXpP2eK
         ufoRUjPo20046oYQaihDCPqR7PWzK23Nuxwt0MG6k1gPtH8hwyg8DL8ip4HHRcNkMxDZ
         4LmQ==
X-Gm-Message-State: ACrzQf1AQ9CYlFqLPaGxICCjfetchw1occ+cQghIvr4VqIbYzaiizXd/
	GJeEh/HjCRMz8g15Jvvbc0oE4kODA55qvw==
X-Google-Smtp-Source: AMsMyM7LWECX9Oml4akAvL2+E4wamxnhmWvKRS4vSCcY/W96tlrVm1gkHYN1UOiIJHhdI2LWnkrZqQ==
X-Received: by 2002:a17:906:847b:b0:7a6:2ad9:298 with SMTP id hx27-20020a170906847b00b007a62ad90298mr6565873ejc.90.1667107931985;
        Sat, 29 Oct 2022 22:32:11 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id f17-20020a05640214d100b0044e937ddcabsm1648676edx.77.2022.10.29.22.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 22:32:11 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 30 Oct 2022 05:32:10 +0000 (UTC)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1881268615.19581.1667107931487@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.1-rc1-147-g74fe0c4dcb41: ASoC: SOF: ops:
 add readb/writeb helpers
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_19580_784563440.1667107930919"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-release-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_19580_784563440.1667107930919
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Failure after v6.1-rc1-147-g74fe0c4dcb41: ASoC: SOF: ops: add readb/writeb =
helpers:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23077
# First few build errors in logs:
# 00:04:20 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds li=
mit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:20 make[2]: *** [scripts/Makefile.build:250: crypto/wp512.o] Error =
1
# 00:07:21 make[1]: *** [scripts/Makefile.build:500: crypto] Error 2
# 00:10:33 sound/soc/sof/intel/../ops.h:309:56: error: too many arguments p=
rovided to function-like macro invocation
# 00:10:33 sound/soc/sof/intel/../ops.h:309:18: error: expression result un=
used [-Werror,-Wunused-value]
# 00:10:33 sound/soc/sof/intel/../ops.h:336:37: error: too many arguments p=
rovided to function-like macro invocation
# 00:10:33 sound/soc/sof/intel/../ops.h:336:10: error: incompatible pointer=
 to integer conversion returning 'u8 (*)(struct snd_sof_dev *, void *)' (ak=
a 'unsigned char (*)(struct snd_sof_dev *, void *)') from a function with r=
esult type 'u8' (aka 'unsigned char') [-Wint-conversion]
# 00:10:33 make[5]: *** [scripts/Makefile.build:250: sound/soc/sof/intel/at=
om.o] Error 1
# 00:10:36 sound/soc/sof/intel/../ops.h:309:56: error: too many arguments p=
rovided to function-like macro invocation
# 00:10:36 sound/soc/sof/intel/../ops.h:309:18: error: expression result un=
used [-Werror,-Wunused-value]

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
23167
# First few build errors in logs:
# 00:07:42 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds li=
mit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:07:42 make[2]: *** [scripts/Makefile.build:250: crypto/wp512.o] Error =
1
# 00:10:46 make[1]: *** [scripts/Makefile.build:500: crypto] Error 2
# 00:18:01 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame s=
ize (1072) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe=
-larger-than]
# 00:18:01 make[5]: *** [scripts/Makefile.build:250: drivers/gpu/drm/tests/=
drm_mm_test.o] Error 1
# 00:18:01 make[4]: *** [scripts/Makefile.build:500: drivers/gpu/drm/tests]=
 Error 2
# 00:31:51 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1=
435:12: error: stack frame size (1080) exceeds limit (1024) in 'smu_v13_0_7=
_get_power_profile_mode' [-Werror,-Wframe-larger-than]
# 00:31:51 make[5]: *** [scripts/Makefile.build:250: drivers/gpu/drm/amd/am=
dgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.o] Error 1
# 00:37:57 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c:3=
043:6: error: stack frame size (1432) exceeds limit (1024) in 'bw_calcs' [-=
Werror,-Wframe-larger-than]
# 00:37:59 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c:7=
7:13: error: stack frame size (5560) exceeds limit (1024) in 'calculate_ban=
dwidth' [-Werror,-Wframe-larger-than]

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCT=
ION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-=
647 .
Status of v6.1-rc1-147-g74fe0c4dcb41 commit for tcwg_kernel:
commit 74fe0c4dcb41678543915cb97928c366ac1aaceb
Author: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date:   Mon Oct 24 11:52:57 2022 -0500

    ASoC: SOF: ops: add readb/writeb helpers
   =20
    These will be used to add more consistency in the SOF core and
    drivers.
   =20
    Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
    Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
    Reviewed-by: Rander Wang <rander.wang@intel.com>
    Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
    Link: https://lore.kernel.org/r/20221024165310.246183-4-pierre-louis.bo=
ssart@linux.intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>
* llvm-release-arm-next-allmodconfig
** Failure after v6.1-rc1-147-g74fe0c4dcb41: ASoC: SOF: ops: add readb/writ=
eb helpers:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-arm-next-a=
llmodconfig/425/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-next-allmodconfig/425/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-release-a=
rm-next-allmodconfig/424/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-74fe0c4dcb41678543915cb97928c366ac1aaceb
cd investigate-linux-74fe0c4dcb41678543915cb97928c366ac1aaceb

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llv=
m-build-llvm-release-arm-next-allmodconfig/425/artifact/artifacts/manifest.=
sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-ll=
vm-build-llvm-release-arm-next-allmodconfig/424/artifact/artifacts/manifest=
.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts=
] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifact=
s] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit 74fe0c4dcb41678543915cb97928c366ac1aaceb
Author: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date:   Mon Oct 24 11:52:57 2022 -0500

    ASoC: SOF: ops: add readb/writeb helpers
   =20
    These will be used to add more consistency in the SOF core and
    drivers.
   =20
    Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.c=
om>
    Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
    Reviewed-by: Rander Wang <rander.wang@intel.com>
    Reviewed-by: P=C3=A9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
    Link: https://lore.kernel.org/r/20221024165310.246183-4-pierre-louis.bo=
ssart@linux.intel.com
    Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ops.h      | 18 ++++++++++++++++++
 sound/soc/sof/sof-priv.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a72f8043be64..511c798eb1eb 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -302,6 +302,15 @@ static inline int snd_sof_debugfs_add_region_item(stru=
ct snd_sof_dev *sdev,
 }
=20
 /* register IO */
+static inline void snd_sof_dsp_writeb(struct snd_sof_dev *sdev, u32 bar,
+=09=09=09=09      u32 offset, u8 value)
+{
+=09if (sof_ops(sdev)->writeb)
+=09=09sof_ops(sdev)->writeb(sdev, sdev->bar[bar] + offset, value);
+=09else
+=09=09writeb(value,  sdev->bar[bar] + offset);
+}
+
 static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
 =09=09=09=09     u32 offset, u32 value)
 {
@@ -320,6 +329,15 @@ static inline void snd_sof_dsp_write64(struct snd_sof_=
dev *sdev, u32 bar,
 =09=09writeq(value, sdev->bar[bar] + offset);
 }
=20
+static inline u8 snd_sof_dsp_readb(struct snd_sof_dev *sdev, u32 bar,
+=09=09=09=09   u32 offset)
+{
+=09if (sof_ops(sdev)->readb)
+=09=09return sof_ops(sdev)->readb(sdev, sdev->bar[bar] + offset);
+=09else
+=09=09return readb(sdev->bar[bar] + offset);
+}
+
 static inline u32 snd_sof_dsp_read(struct snd_sof_dev *sdev, u32 bar,
 =09=09=09=09   u32 offset)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 403e81220244..d3ede97b6759 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -171,6 +171,10 @@ struct snd_sof_dsp_ops {
 =09 * TODO: consider removing these operations and calling respective
 =09 * implementations directly
 =09 */
+=09void (*writeb)(struct snd_sof_dev *sof_dev, void __iomem *addr,
+=09=09       u8 value); /* optional */
+=09u8 (*readb)(struct snd_sof_dev *sof_dev,
+=09=09    void __iomem *addr); /* optional */
 =09void (*write)(struct snd_sof_dev *sof_dev, void __iomem *addr,
 =09=09      u32 value); /* optional */
 =09u32 (*read)(struct snd_sof_dev *sof_dev,
</cut>
------=_Part_19580_784563440.1667107930919--
