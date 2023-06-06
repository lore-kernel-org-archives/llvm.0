Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC9446BE
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 08:47:34 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-439494cbfedso1408629137.3
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041253; x=1688633253;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vPzItteNtao+YX2FbM8/rysut6Tk9dQVilNxpZkVgzA=;
        b=HqUxxfmVhiaWGaexE8Xb1vP01EV/Lr1DGPmtIdT/oBaFSMrbzSA7bF/zS/DxG9BuiG
         8QbFSBEf3oCN5lKHUG1csB+Sr36Gx33Lv3Diww2h1/D7x4wzV8PDILnJ8Njv5q5SgUtE
         QmthRiRoUkOMd3QuGZhioNaoVZ3gQmPvYvCzHYe5h5sUt0NcWWAAJf3P8SSgpkQXJXZG
         Qcq3eTnyjNV5SqzR3DhRcmVBkFyXsuZv2dWaol7/L1ztTI69xU1+8ZMtSj6vYVXEv9C/
         xYSaaOh/Ck1gGxQJpSvz4DlDUgiG76Fe9oWhgIF7K8Pq+wZAEme6yh9ZUL32OgDPSQc+
         oeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041253; x=1688633253;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPzItteNtao+YX2FbM8/rysut6Tk9dQVilNxpZkVgzA=;
        b=UM7g48VdViRaHMoMl/+pPKP1MdDaagHqiR+qzfMLLn10k6kMLsU2BIDtkaohBt5nGB
         WuppeloN4mjvpgZ6BlWU20pv+EJLaqhXiXjND4Neb7l8nqYPSQW5JlkgEAWTB12+lZZI
         6DIXtwBRbLf2mjnJWFMHx1YpcqMPpYL7GoAS0va61VgCqeexjWGgiQ+w+bp3Wlxvjjay
         qPo78s7L00oPgzs02MV2IkS/mNiTUnb2Q0lOsXAM4WW+8fHcxx8f7L1nOXsMpnFtKoIK
         zKoKLVey9OCpVawsJacCBFD9o+KAnXrzcUy4UGrfows0rn0HVMumFaIRQz1MS//QHpAW
         xR4w==
X-Gm-Message-State: AC+VfDxth7qHYtpT8kW3aY0kg33zt859sv8gD0D81RZz074EtZWPZW2V
	ydsgqGmVugcsGqdiEiYSh3wwzRZ0ZLk1DLgBXsvsjQ==
X-Google-Smtp-Source: ACHHUZ6M0VbEpBR3xvgxWdprNCWe6vkpORlSkghO/R13HK9fvMgepkWPezLh27ZmsCxT/zpLB1TsiWPrzkHhpbGn7WI=
X-Received: by 2002:a67:ec86:0:b0:426:20a8:a5b0 with SMTP id
 h6-20020a67ec86000000b0042620a8a5b0mr778337vsp.13.1686041253410; Tue, 06 Jun
 2023 01:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 6 Jun 2023 14:17:22 +0530
Message-ID: <CA+G9fYv0a-XxXfG6bNuPZGT=fzjtEfRGEYwk3n6M1WhEHUPo9g@mail.gmail.com>
Subject: arm: shmobile_defconfig: ld.lld: error: undefined symbol: lynx_pcs_destroy
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

Following build regressions found while building arm shmobile_defconfig on
Linux next-20230606.

Regressions found on arm:

 - build/clang-16-shmobile_defconfig
 - build/gcc-8-shmobile_defconfig
 - build/gcc-12-shmobile_defconfig
 - build/clang-nightly-shmobile_defconfig


ld.lld: error: undefined symbol: lynx_pcs_destroy
>>> referenced by stmmac_mdio.c
>>>               drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.o:(stmmac_mdio_unregister) in archive vmlinux.a
make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

links,
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347517/suite/build/test/gcc-12-shmobile_defconfig/history/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230606/testrun/17347562/suite/build/test/clang-16-shmobile_defconfig/log

--
Linaro LKFT
https://lkft.linaro.org
