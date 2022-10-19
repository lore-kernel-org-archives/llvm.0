Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2A7E
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 07:14:21 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1326637be6eso19584268fac.13
        for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCI54v0Rf8ATjdy0PWOnOz4uJnbZUgYVC9Clhp5Yr/E=;
        b=XVsvKOfDeu5lZr/6hIwIShZbwHJbIczeFhsm/wVT0a2NgJSp3iompTlJNdciNDjGJP
         TaHHGwssR3ZVq5XV75wtH+mSEW0uJqki/w3uDuYq+SxxXJtSuW+OGDksT4mrNsSnEe66
         ZuRYLhI/L7OHzF/jXoocL3QUG/sA3vCy9r60eBIepw00qcta1tuD4tAJJxL7cLxJFsKO
         zprZZm1fbHJRwEoXQkeAyxbE4XcpDZfBFFTMpW0bq2VF4MD1y6ZU3V9jZ1bXw4JwTSs0
         iM1QFwKbCs8e4uB+LFY0BgN0HCyxFNBZF2LCVZEHySNr623Nxb/CcUh8LtFxtRELR35G
         /r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCI54v0Rf8ATjdy0PWOnOz4uJnbZUgYVC9Clhp5Yr/E=;
        b=1EDxfM1/WXNpV7vdgi/i+5rH3+k2XxdAsO/RQSFS/c66IrZuiurlH6jJMxiKhGdlDl
         0Nd+OhsUCyZcoQnOhjDoNWHm6UKV2bHZLXjMGKyw7xk/MlcijSdTt7gD895kw6o0QKJt
         izmcf+C/fn9dXhXppjlLUNR7RKIjTpnu2D3Jm7Gp8Apye4N3mAwycJcJrLfPx+rwnel9
         b3o6GiugFQ/KDIvt1VBjIjzKGB+oV24IpPA1tRaDrt4kYGzywo0MElMInxisVFC6Y3wd
         faYgzJzzVkyA2r+KzWtkFzYFHWHCch+llOdoJiehBaOCPFW5b6KPE6Fr61K/aaehC5jt
         EShw==
X-Gm-Message-State: ACrzQf2ACDNajBuThPNJ++JIfUinTGDLGqTTMsQX6rPN0yfD/XtyIH20
	FfhAmAF3Iegyxw4wE/4ISG5I96UfgnCKD5wS
X-Google-Smtp-Source: AMsMyM7H8xvglSnJpqvftWnpAKnjeiC2CboLlGk7VWVY+cgazR3ujitkWkEL37kWwsEFRTxnhOtnSg==
X-Received: by 2002:a17:90b:4b48:b0:20a:8ea4:a18d with SMTP id mi8-20020a17090b4b4800b0020a8ea4a18dmr43606618pjb.75.1666163649438;
        Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y64-20020a62ce43000000b0053e72ed5252sm10406814pfg.42.2022.10.19.00.14.08
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
Message-ID: <634fa3c1.620a0220.5cf93.374e@mx.google.com>
Date: Wed, 19 Oct 2022 00:14:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221019
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 221 builds: 19 failed, 202 passed (next-20221019)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 221 builds: 19 failed, 202 passed (next-20221019)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221019/

Tree: next
Branch: master
Git Describe: next-20221019
Git Commit: a72b55bc981b62f7186600d06d1824f1d0612b27
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (clang-16) FAIL
    multi_v5_defconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    imx_v4_v5_defconfig: (gcc-10) FAIL
    multi_v4t_defconfig: (gcc-10) FAIL
    multi_v5_defconfig: (gcc-10) FAIL
    mxs_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-16) FAIL
    defconfig+CONFIG_EFI=3Dn: (clang-16) FAIL
    defconfig: (gcc-10) FAIL
    defconfig+debug: (gcc-10) FAIL
    defconfig+kselftest: (gcc-10) FAIL
    rv32_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-16) FAIL

---
For more info write to <info@kernelci.org>
