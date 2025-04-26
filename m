Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2DD14D2A0
	for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 19:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745696057; cv=none; b=txdU+nlGG1ery77nXy43UPpbl4cVITvWiSV/vhV2x2btudeKxAgy6TD22ep+tM+kCbDi5nfknG1ccXwCXaqsVOgPR2vwF+LZbAyI8U6xxHUimzqR7q9Kfp22KAfsvJuLW3An0rpboe9zSPYLT9pk32U7DranRrn3CNXD0JVt55A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745696057; c=relaxed/simple;
	bh=HBlxK4AawqfYPS0GhpPe0PN4s5T2JQ/nvCV6tzL3U00=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=OQFvBqlj5stglrS3brJebHSa4XQtysmir5qSphguTrpSdirGV215wueZNRdM45DsGXtI2X2QojaCKL1d9B5oGon5tzlk18sov0jwnljWY7+0NEQtft8qTlmPy9V2bquT7p9Af6Ij5IVjgHzQl3Zb/6DY1Xjq4FqE7aMRhyZAtqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FklYMRjf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FklYMRjf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so564103066b.1
        for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745696053; x=1746300853; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3alXIn8OrPaSy6pt058myi7d9sgrq3J8qKIPENyqG0=;
        b=FklYMRjfRrZs0kNdBIS53/RtrN5O/GK8jVmoZlqdL+sgtJ/GCMNlt7MhasRi7rOGK0
         Pd5+4GtMBexzu9fCRkry9NI16zWMxjaekAnVpFzXeD6yfp8aruTUOljVno0GxrmwhQYN
         msxqpG4fiiQFRfV3ogHgvhGun17Bvx2SW/2p3tDpxlosn27s4ikuxnZ3pGc3oLG0CbX+
         E0+1yt/ULFo0PdjmBfVIvKvs9vlrj5GjKG83FnZ3sFRHGcULdDL8V5szMP2FsxAu06P4
         A2FVoZZDSfTslb+Y2U0KXP7HZq1hbAzBhAlMPFmfVgYtH8OKIQB7WIvNLAGOvC0qKyv6
         VpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745696053; x=1746300853;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3alXIn8OrPaSy6pt058myi7d9sgrq3J8qKIPENyqG0=;
        b=wjBNPiz/8JjaZCZmQQQw+2cLQkxvlrw6bNkr2HgyTICrpzxuk76fRafasvjfM+tp2Y
         CHxKmEzMKfvjK9L9P+MMTBxY++wfLiCK9TT9zhqiQqKHzc8S/eBbfNAyNaM7CEhZl/ko
         H+vDHQu+6c5/r3HusB3R44rpLorMBoFI7TAPAu80w9NXyuEiMtcjcwo9QbJ9nmAu0DNM
         2l3ojZ7HSPkRKi0rZb40qYXuuvoGf9QxwUjZgu0N+w/mtHVsWECpCOyj+Awehami+Q8t
         4btj32uhvqQdTWzgceFmPOyBK2sbWKENQH3opVqx1QTJ+1cE8cEhcPxuqQ3GeggbFrE9
         jVsw==
X-Gm-Message-State: AOJu0Yyl13MUl9k/KODy7wWx5BjWg34k/dtod6E2ywk2DyMWLCfMpVwl
	XsZ1Wn/nlXX6l/pcXqfyrvdENWGg2CecCesSGB4PWx0CrKol9scm4uGt7C5/2muwEXmwZinV974
	q
X-Gm-Gg: ASbGncuEbW8sGEcQFKypXOSA69gds9emVadFiHzjOp/2ja0K2owyf4cAy6xnfqLU+WX
	gxCS9ElTx0Md4J+cFWBBSmTVVyBl+W6CRfGGngmUeyjUROPv9HLRX3owt1ITfC9VEKWrzMc5psU
	8O1WWksxWAK5Yfjp+ewwBLUVAvmStQ4yf+fUE7MU3qHZTbyWN4j23QQnkqe47WV4cImlU2ezYkc
	LEFAuhrB+yqb9HMvtTvdtTGYlq4jIhuKr/at0GicwVyL2yBNfWqRsouRoK/W/7Sl53/nc3VwHJf
	5gssh1ZpXtxVcn+dRKddjtNHG8cxPelwbZOpcmWPgy07PteOwh8DseeCt5sTCEt4IFC6n/x/gKx
	ANfk+sVZh0mDa
X-Google-Smtp-Source: AGHT+IEYrfbGxXDqAeLmH1tIb+0ieo/NONpgzvoFv8OnHg9nfRO5UhD+WK17hRFHqQV0ER1HIMVdaA==
X-Received: by 2002:a17:907:da9:b0:acb:1165:9a93 with SMTP id a640c23a62f3a-ace5a124befmr1106953566b.3.1745696053261;
        Sat, 26 Apr 2025 12:34:13 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm326291166b.118.2025.04.26.12.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:34:12 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 26 Apr 2025 19:34:12 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1123415294.9419.1745696052831@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-9781-g576161cb6069: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9418_837266803.1745696052154"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_9418_837266803.1745696052154
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allmodconfig, after:
  | commit llvmorg-21-init-9781-g576161cb6069
  | Author: Aaron Ballman <aaron@aaronballman.com>
  | Date:   Fri Apr 25 08:21:41 2025 -0400
  | 
  |     [C] Warn on uninitialized const objects (#137166)
  |     
  |     Unlike C++, C allows the definition of an uninitialized `const` object.
  |     If the object has static or thread storage duration, it is still
  |     zero-initialized, otherwise, the object is left uninitialized. In either
  | ... 15 lines of the commit log omitted.

Produces Failure:
  | Results changed to
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 23469
  | # First few build errors in logs:
  | # 00:03:16 arch/arm/mach-bcm/platsmp-brcmstb.c:110:11: error: default initialization of an object of type 'typeof (timeo)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:03:16 make[3]: *** [scripts/Makefile.build:203: arch/arm/mach-bcm/platsmp-brcmstb.o] Error 1
  | # 00:03:17 make[2]: *** [scripts/Makefile.build:461: arch/arm/mach-bcm] Error 2
  | # 00:03:22 ./include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:03:22 make[4]: *** [scripts/Makefile.build:203: security/selinux/avc.o] Error 1
  | # 00:03:25 ./include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:03:25 ./include/net/ip6_fib.h:271:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:03:27 make[4]: *** [scripts/Makefile.build:203: security/selinux/hooks.o] Error 1
  | # 00:03:29 ./include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:03:29 make[4]: *** [scripts/Makefile.build:203: security/selinux/selinuxfs.o] Error 1
  | 
  | From
  | # reset_artifacts:
  | -10
  | # build_abe binutils:
  | -9
  | # build_kernel_llvm:
  | -5
  | # build_abe qemu:
  | -2
  | # linux_n_obj:
  | 25485

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1671. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/302/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/301/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/576161cb6069e2c7656a8ef530727a0f4aefff30/tcwg_kernel/llvm-master-arm-next-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef530727a0f4aefff30
------=_Part_9418_837266803.1745696052154--
