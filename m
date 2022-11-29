Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C201B639
	for <llvm@lists.linux.dev>; Tue, 29 Nov 2022 06:12:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id w79so12740217pfc.2
        for <llvm@lists.linux.dev>; Mon, 28 Nov 2022 22:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ylL3m3WkiaiBb1U9qwe4tuLSx4Mx2eaOKu2W3qoSE8Y=;
        b=aSRBeCo06Spcs51wfbTD/e6lmaswNiK45v7D1Tsq0T1JCZgv8RYvyfoDHzS7C4flaL
         0HaoDcCY7Qhy7MdWCcItuKcVjWS0GL8fuHnkMKnZJEE+GgiOVlLrzY5XTL8ZgjissbPh
         2SGd8hgmr6CcptwDRKPuohi3GvXsJ3cyyEsqHicNpfUhLTAm8sEU231ETSJmaKuPNLK1
         5zCZcNKNnLXCkcoYIXyBwMyzYMpLxf5GVDt6ctlVLB/LILfC1gzjxD75yFGms6/XSBAF
         Xo3zzj/FX4V/r3KPlrylSvTAgajFHKZx5GHXEoL66z7XYOiDkF7gYewdMqTQTsjLecH9
         8seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylL3m3WkiaiBb1U9qwe4tuLSx4Mx2eaOKu2W3qoSE8Y=;
        b=S6I0X4+8NPxTwKb4BZ5ezCnWOBbeAmhzFGxlliBl0kijA2TW7ZuwpVifwaxAEN1e6l
         0CQ2inWA8wercAO7zA4bk718czyRTt/CgacqKQ6LS+GlLN/KAoOvX5jwKiRyWTs0QgNE
         gnIwYhJvg2rMI1VJmpVz/KpiEcWr1jQTJY7Udp0LtdbYMiZp4yg6xlX9vaye+OVTNaH3
         1s444HlLi5u/08GWglfaZBV0HZFgQOLXVjJ+YFhSSxrBEo33I0XZJXrnrcWyM7+7kt7o
         PLdAbCmjpb30Y/AePdPs0fwoSZQHYLfI8DcFyzlv2tH7PqwwBwuwe6WA9KSMoD+eXg4M
         MHcg==
X-Gm-Message-State: ANoB5plwiiZvgC/lawaD26wL38zXutxjo4ZcanWugXW7aORqv0D2Sb2i
	deuDLnGg0azIK9KazggUEPt+i2eCakZIQaTmLbQ=
X-Google-Smtp-Source: AA0mqf5mX5k7cnT6mWh6RS5eMICYc8rzqgGWyrRUbcIABQdcc/zD9KRYIANcy2TM0aSIhpXdjVgXBw==
X-Received: by 2002:a63:d14f:0:b0:476:95a8:de78 with SMTP id c15-20020a63d14f000000b0047695a8de78mr34622435pgj.66.1669702361736;
        Mon, 28 Nov 2022 22:12:41 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b0017305e99f00sm9898632pli.107.2022.11.28.22.12.40
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 22:12:40 -0800 (PST)
Message-ID: <6385a2d8.170a0220.8f5b4.e50e@mx.google.com>
Date: Mon, 28 Nov 2022 22:12:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20221129
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 14 builds: 0 failed, 14 passed (next-20221129)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 14 builds: 0 failed, 14 passed (next-20221129)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20221129/

Tree: next
Branch: master
Git Describe: next-20221129
Git Commit: 13ee7ef407cfcf63f4f047460ac5bb6ba5a3447d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 3 unique architectures

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
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
