Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1492C80
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 17:54:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f23-20020a7bcc17000000b003972dda143eso7252087wmh.3
        for <llvm@lists.linux.dev>; Sun, 29 May 2022 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=iPkRXkc6svW1vQOA60qcvVCYTJcrrjgzAmQlsxkDpPA=;
        b=A8UmOgSOIeNZmZI9y2WUF1ybNRRMFYQCTxN1ZGSbSTGakbSWfGMvWo8+SI7HmTbRZG
         eEqJyDGmmxg6WuOQDyGN4FTg68Kq4Ias8K7DOGRCpS6xyjDB38Bar6ljtINnkLS5WAvY
         Z+D/udFPpyXwyAyoYnwz+2RxGiLMNrVN5TQSEN3V0CfRFJEBmhumWlhzYnyMye8qpOV/
         hn3IEBEUdKbxbJ9rS4RlMJkAIPy5B/rGgy0LG4wIzTQnDg6xVxm3BT+oiEDy3roYDMgi
         TXbvPFV6WsJ1JVIcWjIB2qgtX/E9rztqV5P/mgVFdkdsx8KqJB30oxUX0zGrYZV5OrfB
         FLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=iPkRXkc6svW1vQOA60qcvVCYTJcrrjgzAmQlsxkDpPA=;
        b=izISqlMVNHS9FZ7Wj8LGmQI4IDLWfPOMAqQOiwI/ZwL42VgGZ4mK1WniJTl5jOYdyE
         DgXfqf6IV/09a0TF34de2yLkuTM5rhra17SfMKEeE07tn/CpAaBHrvwwRNM2nRUVnGc6
         jhjxHGf/pmhTDjCUVqF1htnEKtRlIVi0wHsbthqNu2EyLQOlWQgpRa8yvDylkbkubi7/
         2lI7a1yzIBt2an3wbiJpjaBvberx84oC5ToWC/yyfzvP4ML4zPIrjr2haqc+U47FF2M8
         A0fFR49vbd+SnczNKZLWfqWHgKryJbYP3rtzEwrNVXhLhZjFjkmIa6GZX94rtqLZfP/P
         ADMA==
X-Gm-Message-State: AOAM533psaXtvnoMw/Dqr0AKyBwcKKxHRlrT9bDK8WOlNhN88GLJ8Y5C
	WVbtyx9bqi9Ft20EWe7qU4JINA==
X-Google-Smtp-Source: ABdhPJxU3vL/iRxRMeGyOj9COHdq2PHFW89JbQQ80EtwKY3yVWXriLlhocs73CL+6kPoRkIGbdRYfQ==
X-Received: by 2002:a05:600c:4e91:b0:397:8870:a3e9 with SMTP id f17-20020a05600c4e9100b003978870a3e9mr12643064wmq.141.1653846881261;
        Sun, 29 May 2022 10:54:41 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d5948000000b0020ff877cfbdsm7012510wri.87.2022.05.29.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 10:54:40 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 29 May 2022 17:54:39 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <1031873030.1325.1653846880509@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by linux: crypto: poly1305 - cleanup
 stray CRYPTO_LIB_POLY1305_RSIZE
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1324_1007808186.1653846879806"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-arm-mainline-defconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_1324_1007808186.1653846879806
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: crypto: poly1305 - cleanup stray CRYPTO_LIB_POLY1305_RSIZE:
commit 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8
Author: Jason A. Donenfeld <Jason@zx2c4.com>

    crypto: poly1305 - cleanup stray CRYPTO_LIB_POLY1305_RSIZE

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
6483
# First few build errors in logs:
# 00:02:05 ./include/crypto/poly1305.h:56:32: error: use of undeclared identifier 'CONFIG_CRYPTO_LIB_POLY1305_RSIZE'
# 00:02:05 make[3]: *** [drivers/crypto/caam/error.o] Error 1
# 00:02:06 ./include/crypto/poly1305.h:56:32: error: use of undeclared identifier 'CONFIG_CRYPTO_LIB_POLY1305_RSIZE'
# 00:02:06 make[3]: *** [drivers/crypto/caam/ctrl.o] Error 1
# 00:02:07 ./include/crypto/poly1305.h:56:32: error: use of undeclared identifier 'CONFIG_CRYPTO_LIB_POLY1305_RSIZE'
# 00:02:07 make[3]: *** [drivers/crypto/caam/debugfs.o] Error 1
# 00:02:07 ./include/crypto/poly1305.h:56:32: error: use of undeclared identifier 'CONFIG_CRYPTO_LIB_POLY1305_RSIZE'
# 00:02:07 make[3]: *** [drivers/crypto/caam/jr.o] Error 1
# 00:02:07 ./include/crypto/poly1305.h:56:32: error: use of undeclared identifier 'CONFIG_CRYPTO_LIB_POLY1305_RSIZE'
# 00:02:07 make[3]: *** [drivers/crypto/caam/key_gen.o] Error 1

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
7270
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-arm-mainline-defconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/build-8bdc2a190105e862dfe7a4033f2fd385b7e58ae8/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/build-e68b823ab0ba03323805e54743d16200ba0224d4/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-8bdc2a190105e862dfe7a4033f2fd385b7e58ae8
cd investigate-linux-8bdc2a190105e862dfe7a4033f2fd385b7e58ae8

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-mainline-defconfig/16/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach e68b823ab0ba03323805e54743d16200ba0224d4
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Thu May 26 11:35:47 2022 +0200

    crypto: poly1305 - cleanup stray CRYPTO_LIB_POLY1305_RSIZE
    
    When CRYPTO_LIB_POLY1305 is unset, CRYPTO_LIB_POLY1305_RSIZE
    is still set in the Kconfig, cluttering things.
    
    Fix this by making CRYPTO_LIB_POLY1305_RSIZE depend on
    CRYPTO_LIB_POLY1305.
    
    Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
    Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
---
 lib/crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 379a66d7f504..a80b8c4dc2cf 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -85,6 +85,7 @@ config CRYPTO_LIB_POLY1305_RSIZE
 	default 11 if X86_64
 	default 9 if ARM || ARM64
 	default 1
+	depends on CRYPTO_LIB_POLY1305
 
 config CRYPTO_ARCH_HAVE_LIB_POLY1305
 	tristate
</cut>
------=_Part_1324_1007808186.1653846879806--
