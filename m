Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0413FE6
	for <llvm@lists.linux.dev>; Sun,  3 Oct 2021 13:19:41 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d6so25043264wrc.11
        for <llvm@lists.linux.dev>; Sun, 03 Oct 2021 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=KC1lZFK+gvPO9JjqLHRjGCX0Z6fra+3Zl5CZ8tkZ5oo=;
        b=INwxFwn0u+cXq6Ot3lZ322IS9yQSr2A79vjsw8WaqhlVY13n1D3m2/nREESc/yKGyh
         pEgCcII1MhdUX3OF3czXUb9QA3Br9U5DlUgaOIRNQngyeRFtp43h70C7WUr68uuv5fAq
         AzBPJP9bsOU3dHTJCnMa1NWe/kID0odtWmgAkLFgVdijNtjl2H3E/8lT3QZTmjfeFI5z
         qQg8KpQNO6vMw6nQxrdhz8iea28ouvdLhFnKJmBFLW0+EzzT+zMFp+a5EFV+iAf80XzG
         pvoj/oEna+0Ed4C0fDjxxIwFN4EN9YaKIey+KPNkRu7t2LhAt9MGr4KePrg3OEpoYrS9
         E1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=KC1lZFK+gvPO9JjqLHRjGCX0Z6fra+3Zl5CZ8tkZ5oo=;
        b=LRdtjhJrfcHfCzOqteIoJNMSQu4jRD+axYOtivDb44MLJ7il4lmh2/UnxblF1vBRyt
         vbvdapumgeJyCkozDGAxsNDuvwMSUre55TjOn3fTyhBmGMpLTiJ44OXYJ5TeEFb0aT7F
         XbZD1nXn/Vfaw3o/s9taNjt1g6c65RdE/5/myYpZr5PqUj2xx2TgzlktrWNIxcW60Rxw
         myGofkq1/Ll5uQ+dE49IDOR3WNy2Vwq/vIKXmMphqR4cUf4iQZGozYxKcH4ZE8t0+iUU
         uyFck7AAXKup9AH+LpsYd/Bb/PiXw2sP5EUP6pofQDZzOeDg/ubBVX8QTpjtlGdhCxiU
         Ajtw==
X-Gm-Message-State: AOAM532GcrBRlC8hV1dYLaXmKZNYqfxMFtQ/5qtFsKz1UuyJwKhKerLE
	bRRYpdvW4s0fRZ9k3Suk3jjAzQ==
X-Google-Smtp-Source: ABdhPJxTMOBM6VllIIdO2JjG19Otyv7+a3uhVbXWEe2WvIjE6i/tRvRnKfb5VWqnz8WQ57csq73LLQ==
X-Received: by 2002:adf:a114:: with SMTP id o20mr7644392wro.95.1633267179459;
        Sun, 03 Oct 2021 06:19:39 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id c132sm13776630wma.22.2021.10.03.06.19.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Oct 2021 06:19:39 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 3 Oct 2021 13:19:37 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <47614391.8488.1633267178998@localhost>
Subject: [TCWG CI] Regression caused by linux: net: ks8851: fix link error
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8487_1636587997.1633267177105"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-mainline-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_8487_1636587997.1633267177105
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: net: ks8851: fix link error:
commit 51bb08dd04a05035a64504faa47651d36b0f3125
Author: Arnd Bergmann <arnd@arndb.de>

    net: ks8851: fix link error

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21878
# First few build errors in logs:
# 00:01:10 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least version 4.6 of GCC [-Werror,-W#warnings]
# 00:01:10 make[1]: *** [arch/arm/lib/xor-neon.o] Error 1
# 00:01:10 make: *** [arch/arm/lib] Error 2
# 00:01:20 crypto/wp512.c:782:13: error: stack frame size (1176) exceeds limit (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:01:20 make[1]: *** [crypto/wp512.o] Error 1
# 00:01:36 make: *** [crypto] Error 2
# 00:02:04 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in function '__igt_reserve' [-Werror,-Wframe-larger-than]
# 00:02:04 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
# 00:02:04 make[3]: *** [drivers/gpu/drm/selftests] Error 2
# 00:03:24 drivers/firmware/tegra/bpmp-debugfs.c:357:16: error: stack frame size (1264) exceeds limit (1024) in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than]

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21880

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-mainline-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/build-51bb08dd04a05035a64504faa47651d36b0f3125/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/build-3b1b6e82fb5e08e2cb355d7b2ee8644ec289de66/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-51bb08dd04a05035a64504faa47651d36b0f3125
cd investigate-linux-51bb08dd04a05035a64504faa47651d36b0f3125

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-allmodconfig/14/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach 51bb08dd04a05035a64504faa47651d36b0f3125
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 3b1b6e82fb5e08e2cb355d7b2ee8644ec289de66
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 51bb08dd04a05035a64504faa47651d36b0f3125
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Mon Sep 27 16:13:02 2021 +0200

    net: ks8851: fix link error
    
    An object file cannot be built for both loadable module and built-in
    use at the same time:
    
    arm-linux-gnueabi-ld: drivers/net/ethernet/micrel/ks8851_common.o: in function `ks8851_probe_common':
    ks8851_common.c:(.text+0xf80): undefined reference to `__this_module'
    
    Change the ks8851_common code to be a standalone module instead,
    and use Makefile logic to ensure this is built-in if at least one
    of its two users is.
    
    Fixes: 797047f875b5 ("net: ks8851: Implement Parallel bus operations")
    Link: https://lore.kernel.org/netdev/20210125121937.3900988-1-arnd@kernel.org/
    Reviewed-by: Andrew Lunn <andrew@lunn.ch>
    Acked-by: Marek Vasut <marex@denx.de>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/ethernet/micrel/Makefile        | 6 ++----
 drivers/net/ethernet/micrel/ks8851_common.c | 8 ++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/micrel/Makefile b/drivers/net/ethernet/micrel/Makefile
index 5cc00d22c708..6ecc4eb30e74 100644
--- a/drivers/net/ethernet/micrel/Makefile
+++ b/drivers/net/ethernet/micrel/Makefile
@@ -4,8 +4,6 @@
 #
 
 obj-$(CONFIG_KS8842) += ks8842.o
-obj-$(CONFIG_KS8851) += ks8851.o
-ks8851-objs = ks8851_common.o ks8851_spi.o
-obj-$(CONFIG_KS8851_MLL) += ks8851_mll.o
-ks8851_mll-objs = ks8851_common.o ks8851_par.o
+obj-$(CONFIG_KS8851) += ks8851_common.o ks8851_spi.o
+obj-$(CONFIG_KS8851_MLL) += ks8851_common.o ks8851_par.o
 obj-$(CONFIG_KSZ884X_PCI) += ksz884x.o
diff --git a/drivers/net/ethernet/micrel/ks8851_common.c b/drivers/net/ethernet/micrel/ks8851_common.c
index 3f69bb59ba49..a6db1a8156e1 100644
--- a/drivers/net/ethernet/micrel/ks8851_common.c
+++ b/drivers/net/ethernet/micrel/ks8851_common.c
@@ -1057,6 +1057,7 @@ int ks8851_suspend(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ks8851_suspend);
 
 int ks8851_resume(struct device *dev)
 {
@@ -1070,6 +1071,7 @@ int ks8851_resume(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ks8851_resume);
 #endif
 
 static int ks8851_register_mdiobus(struct ks8851_net *ks, struct device *dev)
@@ -1243,6 +1245,7 @@ int ks8851_probe_common(struct net_device *netdev, struct device *dev,
 err_reg_io:
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ks8851_probe_common);
 
 int ks8851_remove_common(struct device *dev)
 {
@@ -1261,3 +1264,8 @@ int ks8851_remove_common(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ks8851_remove_common);
+
+MODULE_DESCRIPTION("KS8851 Network driver");
+MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
+MODULE_LICENSE("GPL");
</cut>
------=_Part_8487_1636587997.1633267177105--
