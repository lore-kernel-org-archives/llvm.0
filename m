Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1370A33E2
	for <llvm@lists.linux.dev>; Tue,  8 Nov 2022 19:11:34 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id l2so14984186pld.13
        for <llvm@lists.linux.dev>; Tue, 08 Nov 2022 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pUpe96PPi7zC6uGDQKFNUbNBwpZpBFiX2uqs7bfme/4=;
        b=GfDHzXp84vaNzGCJgs/3f6oakhtlX8jfW8j1c0y0XNsuIKtCXI14CpK7WDjma+6iHt
         bWYiujnzQ6axCg8XLn3tPjBdizAf4YBIyUm7pzvEz5hiZ+VrWNAdLBfKbw1CWS7lbBPw
         IDAOnHmJhalEDiRoTpYGqAAWmMDVudXz/6u+XOoBvXW9rI9Dx2M5407Wjsfo/xTmcEcd
         390yVb8dvQRxWQURQ5xCRlLN7g1HepL/a4MGNUSjIY++H4vzatjC/NlbMmbCJEkZfH1g
         a+X0JSoYL1lvPyAm61Lj02cGsXZiv72dypEcBytpLhgdNP+ZpcBcpIe7YW6gH/Izup+a
         vaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUpe96PPi7zC6uGDQKFNUbNBwpZpBFiX2uqs7bfme/4=;
        b=tgbqdsNIntl370im+XglXFUJAiUhQBuw/Rm3qCfhpTDPnOugCJu8flWrAwX+u2Jlj1
         Bi5cNRPzHWD/bPgeBawRRK9pkeo9IB45IWUW/HGMR9B1tjOOa4uYuU48nct+NwBi/IQx
         lCyb9wQrj7R39jA1PkroGvBPCOghKPJlJaUG2rB9jTYBL5zdHE/d6FAUVjHRFBStLf8P
         SKjdUaWe8ec3YcWh2Am1PdPTiXrMmcZaQYt0X/yWJQdF5WaL3vQWJ+3yiFSzF1GywWU1
         LuyLWfU5D6UM+UC+1WX0kt3WD5NUZoZKpBh9f1UYG01yY+5ntJS7TLaya0GDh6V2r2kB
         rMnA==
X-Gm-Message-State: ACrzQf3kurSVF6w8Xs1YgLm6hiV9rhwmV0cByAYSI+x4OcqHMHRgAYYO
	qE73DF7+LRFEFNsu54wQTw44nfSICmFKyIdR
X-Google-Smtp-Source: AMsMyM5RIzwiSji7FlmgPzjQfSuIers4DZhSJnJqW9grbnDey4MNtjbqStbMSMeAwM61kuzNxZMn6g==
X-Received: by 2002:a17:90a:5517:b0:213:b122:41b3 with SMTP id b23-20020a17090a551700b00213b12241b3mr55904456pji.121.1667934694224;
        Tue, 08 Nov 2022 11:11:34 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001869f2120a4sm7325536plx.94.2022.11.08.11.11.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 11:11:33 -0800 (PST)
Message-ID: <636aa9e5.170a0220.99053.be78@mx.google.com>
Date: Tue, 08 Nov 2022 11:11:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20221108
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 12 builds: 7 failed, 5 passed, 7 errors,
 5 warnings (next-20221108)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 12 builds: 7 failed, 5 passed, 7 errors, 5 warnings (nex=
t-20221108)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221108/

Tree: next
Branch: master
Git Describe: next-20221108
Git Commit: b6fc3fddade7a194bd141a49f2689e50f796ef46
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

Build Failures Detected:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config: (clang-13) FA=
IL

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
    x86_64_defconfig+x86-chromebook: (clang-13) FAIL

Errors and Warnings Detected:

arm64:

arm:
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 1 =
error, 4 warnings

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
    x86_64_defconfig+x86-chromebook (clang-13): 1 error, 1 warning

Errors summary:

    5    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('voi=
d *' and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_=
t)' (aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned =
int (*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-=
mismatch]
    1    drivers/pwm/pwm-tegra.c:148:53: error: signed shift result (0x3B9A=
CA0000) requires 39 bits to represent, but 'long' only has 32 bits [-Werror=
,-Wshift-overflow]
    1    drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is un=
initialized when used here [-Werror,-Wuninitialized]

Warnings summary:

    4    clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    1    drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variabl=
e 'ret' to silence this warning

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 FAIL, 1 error, 4 warnings, 0 section mismatches

Errors:
    drivers/pwm/pwm-tegra.c:148:53: error: signed shift result (0x3B9ACA000=
0) requires 39 bits to represent, but 'long' only has 32 bits [-Werror,-Wsh=
ift-overflow]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    kernel/bpf/dispatcher.c:126:33: error: pointer type mismatch ('void *' =
and 'unsigned int (*)(const void *, const struct bpf_insn *, bpf_func_t)' (=
aka 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (=
*)(const void *, const struct bpf_insn *))')) [-Werror,-Wpointer-type-misma=
tch]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 FAIL, 1 error,=
 1 warning, 0 section mismatches

Errors:
    drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is uniniti=
alized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variable 're=
t' to silence this warning

---
For more info write to <info@kernelci.org>
