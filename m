Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D370117F4
	for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 08:56:43 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so5357649pjk.1
        for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+RjuB7U9jpo35XTlJMjyzkcx01WUajTAZdTqLvn43mY=;
        b=KohAPqjSPutrK2Ck1FfjMUa7/cPQbGZ1M0NQoO8WPx7bC0XlMGPqN2ckYV5pK5jgmD
         4HYeScBXAm7F+ACI8PFhruegykDr57Lte2m8MTHYfhClGURmAfkBZ8RkdUhXPiTDvABH
         obZA2I+mzIZh6J4FM5Sf9T1B5RZyZge0UzBzFAl5cILhB81f19XEsqc+GmpS+jZr5Mcn
         3yLnEx4SGeXH2x+lB7cQjWiZ+gNcO+exdHU/XCfGeNo3aAQ2J8+Y2SzH1p4c3peFzavH
         T19k43ZylOFL2qdqJMHVvga1hWCUWxj1xcQ93XXFszfT7iWPyi8YDcymPZYiMXPaAwNm
         xMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RjuB7U9jpo35XTlJMjyzkcx01WUajTAZdTqLvn43mY=;
        b=kBZNcxG27qyK6cx5WiOOBd7NJEcPd8O9QxmVCyqwwyr5TTCZrTkfkuCaeBHr8ZuemB
         byoo+1pAbTS8hiY0wkNN02o8jHzbn6prMhrhEnZgVVnln1J6JK8DvIovwiey8j3UouDk
         W1o0/6IyIEqP/d58g6H4C6WF3qu2TrJRfMUIBeRGOnb4m/NEYnvpN2lSDFwc+Zw8jaFN
         xcmeLznUMzqjgYa3TqgHEvhiFm6AGOMvy8mPGzhyKEDilNBfMjutidyhjwgOt/ujT0fz
         aDqNKZzBgPDaoYYkp0CS8BujQht8Z9qjQiFPw5gZRYMjtkpmCiyXUhlY6Bkh18TaJ6Lr
         zWmg==
X-Gm-Message-State: ACrzQf33IZCjho53LZtkD+8pIb7TFLPsDgresMT6woQO/ajtTA/oaQdb
	Qv+nvpwKBtpakvskskkkygQEEK0szdnjvVkW
X-Google-Smtp-Source: AMsMyM4rwo9hMTlhR3enJ7I02QDmsz8J3aVekSwxD4S4yo1VwOAXLDaRKTyL5gnf9PxxO12RrF218A==
X-Received: by 2002:a17:90a:ce81:b0:212:f61d:35c6 with SMTP id g1-20020a17090ace8100b00212f61d35c6mr13485745pju.243.1667206602953;
        Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b00174f7d10a03sm3998663plg.86.2022.10.31.01.56.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
Message-ID: <635f8dca.170a0220.1cc30.64d7@mx.google.com>
Date: Mon, 31 Oct 2022 01:56:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221031
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 12 failed, 2 passed, 12 errors,
 10 warnings (next-20221031)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 12 failed, 2 passed, 12 errors, 10 warnings (=
next-20221031)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221031/

Tree: next
Branch: master
Git Describe: next-20221031
Git Commit: 6fbda10ec6f8d70d0f4446f861f7db726c2f2e7c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook: (clang-13) FAIL

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config: (clang-1=
3) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook: (clang-13) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL

Errors and Warnings Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error
    cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-c=
hromebook (clang-13): 1 error

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 5 warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 1 error, 5 warnings

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86=
-chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-=
chromebook (clang-13): 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    12   ERROR: modpost: Section mismatches detected.

Warnings summary:

    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]

Section mismatches summary:

    14   WARNING: modpost: vmlinux.o: section mismatch in reference: snd_so=
c_init (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismat=
ches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mism=
atches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)
    WARNING: modpost: vmlinux.o: section mismatch in reference: snd_soc_ini=
t (section: .init.text) -> snd_soc_util_exit (section: .exit.text)

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
