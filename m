Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526F54C7E
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 16:19:30 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id v4so7798899pjh.2
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 09:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wIyr3tfM4bHWTTMjqYpwMqQSPdZYUx72CzPTDgmkS4Q=;
        b=HTpiToFi3NSo6DfuQH6HfMU2ZPkTyt1GE1UeWP/LembqiOmHHmqQzxmtQ6qHUYvGyy
         g3IsC9Sp10QBiCYvNXe0nejyjM1i2fZIJj2FU5ko0UOG/ZKnbl0J7Vw6tpdJi5Z+ukyV
         EdYTNPfa5zjVW78AcETVU8L9+tPnLCsLsw81hlZL5qBkcAwQ+KdTiA60BsHn3AR1/KTU
         5Z2VGdp4Ct3Kg7gVvX2SJbCDIE9+QaHb+NhvZN9KRIJvifpDdPEAxcbmAHuj00Tjwx8w
         cTvO0UshQPw+tehzkBNKgK1t6nHlfU1fDsDSSKZcIUtwuna/miUmYnCZ8flfU9oyk5j6
         IZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wIyr3tfM4bHWTTMjqYpwMqQSPdZYUx72CzPTDgmkS4Q=;
        b=c9CCVUP/E4hRGGy6sp1w+29rk9X63NG2IG9J7RXRHE41CQyzauneYUfeNOiERYk002
         cFux75t2cXkm/00CK8EEjqpRxCBj0YK0onxdkZWm6ZAIAq2JYVIK6rB72o6sAK0BW76n
         3mpSd4jhghVo1LXcdPtP+75d32Rjrt211iEK3u9KeoCwDdwRxQzhHIpBJS5bM5KTwJZT
         X/u7SEALv5dhy9Xvz+q0VoktTVqQ7oKsMKlwnkrbQloxsYRwdJ548WiC1Q7kgNiuEE3u
         QnKILu/vNByOWB6/znslXnkIjlmFHD4nF1ax9Aj3oEYDYUYDLoh+tlv31jpAhHVGtJMx
         AX3Q==
X-Gm-Message-State: AOAM532DRLkpi3RMVSKaandMgciUgETvrsR/jCLvyI9YwiG6BaWDozTd
	WoimrsBGqi/elYzDShgcw6RDtw1XMUn+yl/h6z8=
X-Google-Smtp-Source: ABdhPJxV1BUgwR/EVZUg7kcGTXT/jucsZ3xwTbyIFw6CPqziVeUzbe2b9vBMZu15JDr7cUnjlIaj1A==
X-Received: by 2002:a17:903:2308:b0:151:8ca0:cd8d with SMTP id d8-20020a170903230800b001518ca0cd8dmr174157plh.119.1647620369346;
        Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090a02d700b001bf6ef9daafsm8439878pjd.38.2022.03.18.09.19.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Message-ID: <6234b111.1c69fb81.cc7f2.740c@mx.google.com>
Date: Fri, 18 Mar 2022 09:19:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220318
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 223 builds: 11 failed, 212 passed (next-20220318)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 223 builds: 11 failed, 212 passed (next-20220318)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220318/

Tree: next
Branch: master
Git Describe: next-20220318
Git Commit: 6d72dda014a4753974eb08950089ddf71fec4f60
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

---
For more info write to <info@kernelci.org>
