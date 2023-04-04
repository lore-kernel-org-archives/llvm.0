Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513407C
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 10:53:21 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so33519999pjz.1
        for <llvm@lists.linux.dev>; Tue, 04 Apr 2023 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1680605600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AFMNv6e50Eo9GlYqb9XCB1dwGA0gALY2KZgJZCJOV0M=;
        b=b40dHQcwqpUx/XafpW0EKeZo3gMwRiWdKnEEzIYrIyyNU1RBLjO8Q4b2IN9y06jmmZ
         mjMjIv4Lag6SHx7vKz+e2vg3kqlOdJKf5zyxWMuvczCJQpDj6hgG2wOrmqjbL46mXVir
         tIU9H35oOxwoHCME/uT81fPnWDPRwx0lcmUpcdkg8ulbnpH8aQtkMWoipq6D6oHuwdz4
         foGW+8YTHhILVyLMAw49OM1adSvRvA1Hs5Q2PBkvRRyxjOqJpHT24YnD4tb1D/uX/cUd
         O0MbuHs2IZJh0AhQh/NSyONWu/ykmGp3Em8VXRkdGqgVHCn2QsDj+ZsQovVUtMUTF6s6
         12SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680605600;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFMNv6e50Eo9GlYqb9XCB1dwGA0gALY2KZgJZCJOV0M=;
        b=uhOEQDyWcBYn4iSRaTgslfUd1OUUdljlfoORlIznFp5tP4fruQr09aw15I9/i8yPAY
         bQKQAZcRoQ8ZhKkObnLk15nQ5MkVicMFY+t1XXsWjWPiK6pli9VKzg6I7H9eYGELSr7Q
         adVlvLpVR+nkqoG+fU0g6fcAk5/gEQcgF83VOAaRHQGbSABUvjaT0xT8v8KzgCxSv87i
         sORIKSFzHvEsdSST9NsZYBYqVMEplPhdyS4VzDAyrNu1mut52n6CK3ue9S790EFNCoE6
         hgB1Wn1ECJrLwQ49cyrLQmPGxr0Z1lwBJBDfk4phHInolBBiOOe89gnukZPpFN0SRHjk
         yx+w==
X-Gm-Message-State: AAQBX9fl70Jq4i8z6/pcjRT9NIwuIn3WHu5LzJUH1nmd2gRD0Z/UWMW6
	yP1ODEmJgAl1geyEbD/fsCSB+Um8AWqsuBlocEJFjg==
X-Google-Smtp-Source: AKy350aYCX0hWT/ZVCtC17hCXdexdUmk36d0QJRdgESXU7Qxz4oaEsCCcsGwjceNeEXcG3H2m2cv/w==
X-Received: by 2002:a17:90b:4f42:b0:23f:84b9:d7a9 with SMTP id pj2-20020a17090b4f4200b0023f84b9d7a9mr2164742pjb.18.1680605600558;
        Tue, 04 Apr 2023 03:53:20 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id in18-20020a17090b439200b00234115a2221sm7587599pjb.39.2023.04.04.03.53.16
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:53:20 -0700 (PDT)
Message-ID: <642c01a0.170a0220.89230.e8bd@mx.google.com>
Date: Tue, 04 Apr 2023 03:53:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20230404
Subject: next/master build: 12 builds: 0 failed, 12 passed (next-20230404)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 12 builds: 0 failed, 12 passed (next-20230404)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230404/

Tree: next
Branch: master
Git Describe: next-20230404
Git Commit: 6a53bda3aaf3de5edeea27d0b1d8781d067640b6
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

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
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
