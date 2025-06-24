Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C8A25BF04
	for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768247; cv=none; b=UoDSaoK+Bdksj777qhXlqUn0/eUUT/5vy5hR2NKYvAYa7IHQa8X2iWo464BKxb8L4g315dllFiHTXcmStZDC+o1MjxwjYMeZ1xE+iOhwV6ZW9ePoXPaChRp/pz3oHsAEgaX9P16DHpZVybz563u9dQNb65gGQq5px4Bh9cELMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768247; c=relaxed/simple;
	bh=ublTluIkiUx0a/4U2QdORjw4u5rDtOUtwTYsJd7GAGs=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=s5Kh6BJi3l0LrHdDS0t6p8hg6FUOKpm8NQ4ijEmIL5zmSHZXWeeI2//rMarnK8hbsBP5ayUVzTzs49p0BbNYpopv+BoqN8OHWiZbTb/4vZL0octhS+h8IqVguAIMkwJatFUdScjDV7dnAlYgifZjj/Ipsd2y2sdMzOK0JGe8I/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjJt2Fjm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjJt2Fjm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad89ee255easo964602066b.3
        for <llvm@lists.linux.dev>; Tue, 24 Jun 2025 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750768243; x=1751373043; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXO+H09j1Qa4dpuFC/q3mVDE2ilTxl5Myf/HIkZN2vk=;
        b=ZjJt2FjmzDMi3QAYTL/W/TI1CEb9ovwvm53E8HCFDTaaUCVuL5X7tOFzgUc2/akMLT
         zgYunKyid+3wGZNjns2/6i2PVMMd1vQPuFTIIvjJmgAx0JCEJnY48pNwp0UNqkJD/FzD
         hXXVU/9xBdpuf4R4kmhMxYw05ujZZ2ytSU5vSPALC598nbwqQ0KU/25nN8YRgmfJlVAW
         ymhkG/I2hZIGX3f5Dquf7LVxPGFmF+hHZlMw4VRITjZrrC3GBcKGonIa82NUGR6fm4wd
         5Q9QRXiflkAqTQfFSWyhsJTelbn70sgtLzBC1+KdB7DSM/HFUkR4/gP5zc1L/I4VHJqf
         eUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750768243; x=1751373043;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HXO+H09j1Qa4dpuFC/q3mVDE2ilTxl5Myf/HIkZN2vk=;
        b=fyg1dShiMtO6t1Hz6MqDBBTEHihzDes3SuzPIwL7C2CP5mK/12G5LxeFrpMT9CN6DT
         tCLvsAKaIxOTmCYoYyXZ7uWvF5zYlzjJl4o07uxZ5564mZeKolwsRdF7IybHzrdjGJfX
         maYB2NMZxWQWMhmsmcvyGbXa7wR4nf2d4Q5bWAzgcte/SopqH4aPsoHVzUBadPgrd0HO
         SvEHLzlsJI2qLzR8wNa2upBNWECWUW4WYkoJHvc64lUTjDeC11Sr+vQiAkb+MKz/cgEM
         9MyYewZ7JDAVlcyS1ADnsZKkab8rjZTvyBWFmm8J/19j54c0Oboke+JcnRJ/iH1IldBl
         03jQ==
X-Gm-Message-State: AOJu0YyJXeIujy8y26AVam5qvSAc4jCWdBi/JQEOSeb7jGE852gi2lgw
	cilpnHcz2ApFtYCcCGaVx1QGE8VmA5GQsZJGA8Mwxvmy5/nmkC10GBr5FPU28PgFtWPc+342ppo
	fC8DO
X-Gm-Gg: ASbGncsBChy7rP/106mx2tJMTRR9dWQ6QlBVaylLquRED7ms3TG06t3D4l56XL+cU4/
	oz/B8/9rFGGSfWzbL6aPZNiUSsxPAyx+RIIBwSuyaZhwoMnTJy3sNm+gH0fF3H7jSGfawhYIpvq
	V9OLNeq3FoCai2nLMK3qIGujE75rkEqj8MO2XaAdOmmrOfq6TIXupuW9iykRSSins6FuGhD4dj7
	szgvvcFc6vgr46soqJa1XLZFn5yDCCPHgm5iuvag/PRg9HwngPSiXSR3KTMOeCUI9yFO3990GZ0
	ZV62N+S5GAWSlwiV1fMQNICTxEr3IkHNXlccZ/znngOam612JIhZqfK5P+eevuXy/0iHREkoOvf
	BvWNEcUWOrHpNB6XF8K+CRDUak8HAkQ8nig==
X-Google-Smtp-Source: AGHT+IFz5ZfQa6cs/wRww4vBuyf1f/X909PtbUdaN8IzT9jAY3R2N6jlNKNvJ8OZjpBZiuRWpMRYug==
X-Received: by 2002:a17:907:1ca1:b0:ae0:11da:c923 with SMTP id a640c23a62f3a-ae057fa141fmr1618005466b.58.1750768243459;
        Tue, 24 Jun 2025 05:30:43 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm869907266b.111.2025.06.24.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:30:42 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 24 Jun 2025 12:30:40 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1487295619.32663.1750768242661@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.16-rc1-91-g2c3809bd6f65c: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_32662_632499735.1750768240246"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_32662_632499735.1750768240246
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allyesconfig, after:
  | commit v6.16-rc1-91-g2c3809bd6f65c
  | Author: Ricky Wu <ricky_wu@realtek.com>
  | Date:   Mon Jun 16 14:49:56 2025 +0800
  | 
  |     mmc: rtsx_usb_sdmmc: Add 74 clocks in poweron flow
  |     
  |     To conform with SD spec definition, that the host must provide at least 74
  |     clocks before issuing first command, let's add these clock cycles at
  |     MMC_POWER_UP.
  | ... 4 lines of the commit log omitted.

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
  | 23105
  | # First few build errors in logs:
  | # 00:43:27 drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
  | # 00:43:27 make[5]: *** [scripts/Makefile.build:287: drivers/mmc/host/rtsx_usb_sdmmc.o] Error 1
  | # 00:44:47 make[4]: *** [scripts/Makefile.build:554: drivers/mmc/host] Error 2
  | # 00:44:47 make[3]: *** [scripts/Makefile.build:554: drivers/mmc] Error 2
  | # 00:56:26 make[2]: *** [scripts/Makefile.build:554: drivers] Error 2
  | # 00:56:26 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2006: .] Error 2
  | # 00:56:26 make: *** [Makefile:248: __sub-make] Error 2
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
  | 23186
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1710. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/319/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/318/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/2c3809bd6f65cdd8c13853af1ab2a80ddf80528d/tcwg_kernel/llvm-master-arm-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/2c3809bd6f65cdd8c13853af1ab2a80ddf80528d
------=_Part_32662_632499735.1750768240246--
