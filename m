Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65DF17F8
	for <llvm@lists.linux.dev>; Mon, 24 Jul 2023 06:56:31 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b89cfb4571so32478915ad.3
        for <llvm@lists.linux.dev>; Sun, 23 Jul 2023 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1690181790; x=1690786590;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q4tuatl9rjslbyslL2L2ghCzx3XVBOKIw9ZPqPxe60A=;
        b=cNzEsWNplGcQVOs8Ivaop2wvDl6fLZUZHW8pXRs+TK1ji5sz8jH0PkZEnmngs5koIv
         wie3Gd2DLAdnkRck+Ilrpb6WTqd6biD8+1i8vk/5eFVOvZHDA/mGpDiTlQm3uSGADMkF
         PKK7whFzMHpIZFXx2fkD2s6Pnz4lJ3YatB3r37K74wvZB3s9Kx5zCiRCY2cWtuKRKGEv
         iU2DO1bt0ffuCxthGMjcvnS2pNOPg9h+J95p1UekYjVIplynvFM7ns4qpfgjAwJ4WcfF
         XhRWasjTQyi9ZKsLiXnLhb1vBpv3YvQ6LLV9dhJvy0TwrK4F0F2A2o5jfOvhXq262NeS
         aYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690181790; x=1690786590;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4tuatl9rjslbyslL2L2ghCzx3XVBOKIw9ZPqPxe60A=;
        b=LL+ApXwXs7L+3DgoLwFMyL/JDCJ/LxKkSsVh3OckYQ3lUswQ0VlnE1iS2eWFZuGw3C
         +ztdtmzagMBiSf2Z1Z6oz8ocT/KGJcDUeGRsv9OKqYyv5h8icjHCKZo+abgKnwrznJCU
         L7cZIqPtE/07QSQ2jC1hkUs1UD2PidaAIBAe9NjbaHzHsHAFPu434GbGBFvkzlho9SXb
         Q/VaFwA27Sz2CTEdaE5u6djO6Cb6vACNK/euli86zohctDVTLlrYCzJ2wJcPfNDfOyWe
         YxH2ZTGTfSi7mUy901hkE4aesxscLZeyBMAp7u99vk15E+yAGWsowsHSZDv/xlAmrXq8
         ODcg==
X-Gm-Message-State: ABy/qLbmCBRe5YKYfBv1ukYExTZwpZtCPvPqIIA4feTyHx9doZsamHzi
	wECChRC+b1LmyJbu6m3c5NSGhycjQl7VFVtaICY=
X-Google-Smtp-Source: APBJJlG9voW0Y7YsbrFvcOBKngv9rJwqHUuQpdWf+noHSqH4pPf5JyrhSqEPH/6h/v4kqcB4DtgozQ==
X-Received: by 2002:a17:902:f682:b0:1b7:f654:7bc7 with SMTP id l2-20020a170902f68200b001b7f6547bc7mr11922757plg.68.1690181790513;
        Sun, 23 Jul 2023 23:56:30 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e80200b001b6740207d2sm7989284plg.215.2023.07.23.23.56.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 23:56:29 -0700 (PDT)
Message-ID: <64be209d.170a0220.5010e.e3bf@mx.google.com>
Date: Sun, 23 Jul 2023 23:56:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20230724
X-Kernelci-Report-Type: build
Subject: next/master build: 18 builds: 0 failed, 18 passed (next-20230724)
To: llvm@lists.linux.dev
From: "kernelci.org bot" <bot@kernelci.org>

next/master build: 18 builds: 0 failed, 18 passed (next-20230724)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230724/

Tree: next
Branch: master
Git Describe: next-20230724
Git Commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 6 unique architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---
For more info write to <info@kernelci.org>
