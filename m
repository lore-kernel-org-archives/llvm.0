Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B47E0
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 05:42:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id j7so11810644wmp.2
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 22:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=kAauFpU8DuCxksUHIo00C+eQ3yxOgA7pIDOa9Eb0eJI=;
        b=uaJag287PTp2CZZ+kBOCRexpjIhGBznrdx8Tm9/MKvjP3bhwHig30x5EDGLMsVkzCh
         cCLjKB03RpgiCzbT2uwqdOTwGW7Nt9mN+sEJf1xwuEGRsmBzS7t/UT0n+p7iaO4Xrdq/
         eBjgi+9nBDqri3DkDSJrrR9mk4heQ/JtjVf4l76C6uavHfNFtyDPrY+ZGFkiigC6f9jO
         Rk25qZS1AFZJV6/ZJeBLeJtK+EY0LrKbDZQ+05fujNBQJEBQJTIvdRFu3ezdU4asBL4A
         Vk/KbdjrmYZVybI7Td0HrcgwesiA8floHLYYUujmsfjmfaGW0HVsSOKyIqKDaV2WDkCM
         OeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=kAauFpU8DuCxksUHIo00C+eQ3yxOgA7pIDOa9Eb0eJI=;
        b=ELY/Zr+lQ9Gxl3TFq2iHpDGJn0tS9AJB9PoezY8KBw+amJmpWWnF4pTwu54ER9l4hj
         z6SKfyw+KPXH8IFakzvuU4idaEJ0WddJ5bO05zRELBQ9Pw5WZ+JGdD89a5/edVktKXng
         dO7lybgM5uNLiu8poO50rS8zn/FfCIXgzZJTPGls2Wl22ipDWKJkHzSbRHJw7m6dDzs2
         nlBSFxJUhBiKeBF24QAo/sbqXNtKXMoyHp3e+XTjYL/jTcCVhneN08fmtOeqvzF+Nd87
         Gdgqoxf1Zf/uWmL3+oPAev4pwut7XT8NWja5mndsoKL+CooZWcE9AxwkD+sXm31G53xz
         Sb/A==
X-Gm-Message-State: AJIora8TuqIhV4vJdTY4hoxzvLRDKLRTQ8bcZS/T9j+MVljVORROyA9H
	oGyTdqkGIcI0ZA28t/7zMGjyuw==
X-Google-Smtp-Source: AGRyM1t+dmT8f0SUA8hFrI4emcQw4vhVtiXTVnTspVpldICMVOGM5zj46XpDE+7ATegzFwl466jTsg==
X-Received: by 2002:a7b:c31a:0:b0:39c:4783:385e with SMTP id k26-20020a7bc31a000000b0039c4783385emr8426495wmj.185.1657258946588;
        Thu, 07 Jul 2022 22:42:26 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id d11-20020a5d6dcb000000b0020e6ce4dabdsm38658005wrz.103.2022.07.07.22.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 22:42:26 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 8 Jul 2022 05:42:25 +0000 (UTC)
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1791141562.180.1657258946129@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: lib/bitmap: Make length
 parameter `len` unsigned
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_179_712606477.1657258945216"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-norov-allnoconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_179_712606477.1657258945216
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: lib/bitmap: Make length parameter `len` unsigned:
commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
Author: Paul Menzel <pmenzel@molgen.mpg.de>

    lib/bitmap: Make length parameter `len` unsigned

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
547
# First few build errors in logs:
# 00:01:34 lib/bitmap.c:351:6: error: conflicting types for '__bitmap_set'
# 00:01:34 make[1]: *** [lib/bitmap.o] Error 1
# 00:01:37 make: *** [lib] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
564
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-norov-allnoconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-aaa4ab5ec04480fd0c16c7452d28444c862b2b87/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-dc34d5036692c614eef23c1130ee42a201c316bf/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
cd investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach aaa4ab5ec04480fd0c16c7452d28444c862b2b87
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach dc34d5036692c614eef23c1130ee42a201c316bf
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
Author: Paul Menzel <pmenzel@molgen.mpg.de>
Date:   Thu Jul 7 23:50:52 2022 +0200

    lib/bitmap: Make length parameter `len` unsigned
    
    The length is non-negative, so make it unsigned, and adapt while
    condition accordingly.
    
    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
    Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/bitmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap.c b/lib/bitmap.c
index b18e31ea6e66..0746beb336df 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -348,14 +348,14 @@ int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
 }
 EXPORT_SYMBOL(__bitmap_weight);
 
-void __bitmap_set(unsigned long *map, unsigned int start, int len)
+void __bitmap_set(unsigned long *map, unsigned int start, unsigned int len)
 {
 	unsigned long *p = map + BIT_WORD(start);
 	const unsigned int size = start + len;
 	int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
 	unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
 
-	while (len - bits_to_set >= 0) {
+	while (len >= bits_to_set) {
 		*p |= mask_to_set;
 		len -= bits_to_set;
 		bits_to_set = BITS_PER_LONG;
</cut>
------=_Part_179_712606477.1657258945216--
