Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5572
	for <llvm@lists.linux.dev>; Tue, 21 Sep 2021 14:34:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d6so39648403wrc.11
        for <llvm@lists.linux.dev>; Tue, 21 Sep 2021 07:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=gCXC6nz5w5wQSBcuK1hV8m1TC+H5ka6Aa5MuRqbBdUQ=;
        b=svSSCjNIYT81blsDCOeCxeu/MogL5cMC6glJE2DfT8gNswTdpQBt7BU0sOlbDfIKpn
         6NJ13vh17llt+IeCF/KG0uWJjJBDYBGaG1pQ1ME9cT6qPbByA6kJLkbYlHAmvyPHVhdh
         3qarF0UelETCgN4JddR8QjvypdmHqGtJDXvCDFnGRndaa39MYN0P98h6HWOfpyenEp3x
         I8brpy6AlFDSLaVJO5+Ikdgt5ZkGd0fvk7mIqLfM+IVZpwSoEE+EDHUbCMTbzxCMOtfm
         sKcvONEMkdOhfm1y6f2LOl+Wf51GnQLE+7SZX2ye91IU0yiX10oN6538IODtqzQz4IoV
         gEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=gCXC6nz5w5wQSBcuK1hV8m1TC+H5ka6Aa5MuRqbBdUQ=;
        b=wGlMEfPoXsPvB+KBd7p8SuBf50+Ptw51M2NXI0wngnI0HRrvkuT3j2uNoyXBWNM9Ft
         /kI50wzo/UqFN9Um1Gu1Q+ln7gVzTm1kf25IR1JhEaDppCjlCXFY3APJ/yLAGGVaepJv
         Y9ioXOMKwUYVDivvDbH+OsOHP5ow7He1pC5u22X8YbmHtKqBjXIh6rbFC4h5BzSi/X4E
         ku+7BiIcqUOV1AtMr+1VScQck638n8ecSm7cH9BkXfSQTdl2lsoqNmjJCRbgeonZYG3t
         z1dlVriENn6W+znJVUdkyv0VX+nS+UHnjmBWgQECH+6+5QzgqZYM2EW/e2HdZ/KwveyJ
         SMPQ==
X-Gm-Message-State: AOAM532WFjPFYNl1Nc8Gh+s1HZavvM//v9HX6N1Clh/xwqZZlkNI8UOc
	2M7StD5BAJ5HB1ud0iPB2rziyQ==
X-Google-Smtp-Source: ABdhPJy+S6FWT70F03QD8rBfM5ZunJ+cSYxB+u1bVEZhUkUh/VR1EIfZlSe9aPa6m83HgJjkUCSpjw==
X-Received: by 2002:a5d:58cf:: with SMTP id o15mr34464264wrf.312.1632234888739;
        Tue, 21 Sep 2021 07:34:48 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id i1sm19353348wrb.93.2021.09.21.07.34.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Sep 2021 07:34:48 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 21 Sep 2021 14:34:47 +0000 (UTC)
To: Helge Deller <deller@gmx.de>, arnd@linaro.org
Cc: linaro-toolchain@lists.linaro.org, llvm@lists.linux.dev
Message-ID: <342384227.4073.1632234888093@localhost>
Subject: [TCWG CI] Regression caused by linux: parisc: Declare pci_iounmap()
 parisc version only when CONFIG_PCI enabled
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4072_655020919.1632234887150"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_4072_655020919.1632234887150
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled:
commit 9caea0007601d3bc6debec04f8b4cd6f4c2394be
Author: Helge Deller <deller@gmx.de>

    parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled

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
37
# First few build errors in logs:

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
20151

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-9caea0007601d3bc6debec04f8b4cd6f4c2394be/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-31ad37bd6faf871c070650f72ac9488ceeeceeb0/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-9caea0007601d3bc6debec04f8b4cd6f4c2394be
cd investigate-linux-9caea0007601d3bc6debec04f8b4cd6f4c2394be

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/17/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach 9caea0007601d3bc6debec04f8b4cd6f4c2394be
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 31ad37bd6faf871c070650f72ac9488ceeeceeb0
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 9caea0007601d3bc6debec04f8b4cd6f4c2394be
Author: Helge Deller <deller@gmx.de>
Date:   Sun Sep 19 10:36:09 2021 -0700

    parisc: Declare pci_iounmap() parisc version only when CONFIG_PCI enabled
    
    Linus noticed odd declaration rules for pci_iounmap() in iomap.h and
    pci_iomap.h, where it dependend on either NO_GENERIC_PCI_IOPORT_MAP or
    GENERIC_IOMAP when CONFIG_PCI was disabled.
    
    Testing on parisc seems to indicate that we need pci_iounmap() only when
    CONFIG_PCI is enabled, so the declaration of pci_iounmap() can be moved
    cleanly into pci_iomap.h in sync with the declarations of pci_iomap().
    
    Link: https://lore.kernel.org/all/CAHk-=wjRrh98pZoQ+AzfWmsTZacWxTJKXZ9eKU2X_0+jM=O8nw@mail.gmail.com/
    Signed-off-by: Helge Deller <deller@gmx.de>
    Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
    Fixes: 97a29d59fc22 ("[PARISC] fix compile break caused by iomap: make IOPORT/PCI mapping functions conditional")
    Cc: Arnd Bergmann <arnd@arndb.de>
    Cc: Guenter Roeck <linux@roeck-us.net>
    Cc: Ulrich Teichert <krypton@ulrich-teichert.org>
    Cc: James Bottomley <James.Bottomley@hansenpartnership.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/parisc/lib/iomap.c         |  4 +++-
 include/asm-generic/iomap.h     | 10 ----------
 include/asm-generic/pci_iomap.h |  3 +++
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/parisc/lib/iomap.c b/arch/parisc/lib/iomap.c
index f03adb1999e7..367f6397bda7 100644
--- a/arch/parisc/lib/iomap.c
+++ b/arch/parisc/lib/iomap.c
@@ -513,12 +513,15 @@ void ioport_unmap(void __iomem *addr)
 	}
 }
 
+#ifdef CONFIG_PCI
 void pci_iounmap(struct pci_dev *dev, void __iomem * addr)
 {
 	if (!INDIRECT_ADDR(addr)) {
 		iounmap(addr);
 	}
 }
+EXPORT_SYMBOL(pci_iounmap);
+#endif
 
 EXPORT_SYMBOL(ioread8);
 EXPORT_SYMBOL(ioread16);
@@ -544,4 +547,3 @@ EXPORT_SYMBOL(iowrite16_rep);
 EXPORT_SYMBOL(iowrite32_rep);
 EXPORT_SYMBOL(ioport_map);
 EXPORT_SYMBOL(ioport_unmap);
-EXPORT_SYMBOL(pci_iounmap);
diff --git a/include/asm-generic/iomap.h b/include/asm-generic/iomap.h
index 9b3eb6d86200..08237ae8b840 100644
--- a/include/asm-generic/iomap.h
+++ b/include/asm-generic/iomap.h
@@ -110,16 +110,6 @@ static inline void __iomem *ioremap_np(phys_addr_t offset, size_t size)
 }
 #endif
 
-#ifdef CONFIG_PCI
-/* Destroy a virtual mapping cookie for a PCI BAR (memory or IO) */
-struct pci_dev;
-extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
-#elif defined(CONFIG_GENERIC_IOMAP)
-struct pci_dev;
-static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
-{ }
-#endif
-
 #include <asm-generic/pci_iomap.h>
 
 #endif
diff --git a/include/asm-generic/pci_iomap.h b/include/asm-generic/pci_iomap.h
index df636c6d8e6c..5a2f9bf53384 100644
--- a/include/asm-generic/pci_iomap.h
+++ b/include/asm-generic/pci_iomap.h
@@ -18,6 +18,7 @@ extern void __iomem *pci_iomap_range(struct pci_dev *dev, int bar,
 extern void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 					unsigned long offset,
 					unsigned long maxlen);
+extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
 /* Create a virtual mapping cookie for a port on a given PCI device.
  * Do not call this directly, it exists to make it easier for architectures
  * to override */
@@ -50,6 +51,8 @@ static inline void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 {
 	return NULL;
 }
+static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
+{ }
 #endif
 
 #endif /* __ASM_GENERIC_PCI_IOMAP_H */
</cut>
------=_Part_4072_655020919.1632234887150--
