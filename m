Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63A2F2A
	for <llvm@lists.linux.dev>; Mon, 21 Jul 2025 01:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753062741; cv=none; b=Jii5WrkXZCd3xcwz4jOvJY/jufIUdxshr7VmgE8CwGHHkGTM4e37mtk9Jv+OCIrq7A2joTa67mLIF+JVAGfs06d2UL7JDgPcRPSyGfVbwb6JTMV2Zwvr1WjPA1vSbGHTqB7lsWq0AysrzPxuQyZnOXimIbfFV2wXlRvVr3YkWG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753062741; c=relaxed/simple;
	bh=6MUS0NyEHPj7SnEIvJTksbKXFjb/uxE4RX0DjphEbtU=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=XSDmMoaAu0w+LHrUjRVPa3Wo49k9iU0ipSO9o5Qz6/KzjMZdXwQjDjOGpQfVR2xUrUWH7wpcRacH2lbt2uva4VAqSgNdh0Yu15R2rsd6zPEb11D0hfESiQUPhP+oCNXaqZ87pvF/TQTSdFl1Fm2cupz6jRLYGfKS1SuINqMlKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbUuxXrJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbUuxXrJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5ec407b1so599658366b.1
        for <llvm@lists.linux.dev>; Sun, 20 Jul 2025 18:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753062736; x=1753667536; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UqM6dZuJNBDuCBCAKdyi4d32vBsj3LZ7gJiZ6xNN2V0=;
        b=vbUuxXrJ/gG7xpVib9FCU52tRPH/JveqmiYrsl9DjIq3H3Oy+gRWeDHULroR5vJ7S8
         UWkphcmVOsKyvNssi10eGbFVEtdrVXDnE9Pb69X0wGg3I4IBSoMNMem3rMXugmegGbow
         TThh8sEXz+OBckMmmmc4/nHX4rzi9GBPLMx/UY1T5KJQatmHvtj09iZSsoERnsSDkenF
         hfHu0pl06VAeLg8NLk5cCj6u6eoLq/RrlgLXZRlfI15rmEF9Fy9T1NYO4DUHHbsHjSD1
         m029fv/7TAhIi78/RKM8ARFglOsGTviFz3bI7aXmGIGIsMjjm82M3K/76UBQs7CqN8s+
         IUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753062736; x=1753667536;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqM6dZuJNBDuCBCAKdyi4d32vBsj3LZ7gJiZ6xNN2V0=;
        b=Rs/0jszZ/tQM2m7w4HLRYdIESfILOsT0Pd3Lsog0o83XkJrZ247dhpRctyudKU/I1p
         HddsJ72WFJEfFek2VSj124qhQ1528YoIIk01WZFHz5mIqkIjF2C/UHsVYnfC2o1vtzRP
         OjQtKXVoEX9HUNIbm1l141k5VWrTMnSnWvftp+yZm6MgsIESNeiPtXpuDeSgPRwFsKic
         2sW8iV0ZFbyPLlqyZLdj6Dh5VpyXnU9FbNGt5r/55KHpaFlOk/n2L5bJapOv8kePiHJw
         DAubs/+9SuD3RnttJAxDPvw7+KIXOtgsUaKS/5EiF70tkz00WzQH4W9wxdJ4hUkUpgEq
         npKw==
X-Gm-Message-State: AOJu0Yx6Oe1CP5ed6LkNlKsZgv2jICG7qfqOnV1wjFL4djzD4Foe2FGt
	tpdlKh9Dx4HVakt+UfvY2nqAIuNhRT4z5k+2T5f95RyarGTm0Lz0qnxHmQARSCVcMtJwAm3SjGs
	ZD8lQ
X-Gm-Gg: ASbGncvwJ1gtJdswrwB/vvSz+AuWbMFqY7IWZI/flGMJSCUCTQ01woy6LVd4XWIchKQ
	H1WDJ2j7Q/4L/BPwX6nOpnuwohjJR5S1q6O54suPmO7aflVCKTLnJmFxso6PDT7FjRkX77YBNy9
	tq/oJkt3jtXrqOUyXhUIatXfqzm4Cr0rqk0e/BHVy4tv8LTSlMSylcSat2ejHChHa3SOH3Gd2eb
	HFcMhSXPOwNWVa6mrI1tKdk4oH75q14Mue193Ffyk158CJgHlhaidm3xmivKw8nNiPCDJnjfzcM
	oV8dab8FHotd8/JQId5233W7scSkIlEki/6YsyLMYJa7LQqWWZjw4ht/g6T3np0HN3rvht0hGYO
	rXafhYcwN5W2DcKZczbK1Mm1MvNmiFzoNHJFxzEDmdj6zwYqC6iJ7jE4goNZSJGT/5/+vgQ==
X-Google-Smtp-Source: AGHT+IFOhPlzOzJT5HU2Zci/N04IiqXlV5j4qKEHUEF+0Pk3HBJ8sVdBhyELdxe9PokE1BxjgzbaFA==
X-Received: by 2002:a17:907:c81b:b0:adf:7740:9284 with SMTP id a640c23a62f3a-ae9ce1b1643mr2132065666b.57.1753062736258;
        Sun, 20 Jul 2025 18:52:16 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7952e9sm584221066b.7.2025.07.20.18.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:52:15 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 21 Jul 2025 01:52:15 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <277676995.7500.1753062735857@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-19167-g00dacf8c22f0: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7499_1483395328.1753062735187"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_7499_1483395328.1753062735187
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig, after:
  | commit llvmorg-21-init-19167-g00dacf8c22f0
  | Author: Igor Kudrin <ikudrin@accesssoftek.com>
  | Date:   Mon Jul 14 15:44:43 2025 -0700
  | 
  |     [clang] Add -Wuninitialized-const-pointer (#148337)
  |     
  |     This option is similar to -Wuninitialized-const-reference, but diagnoses
  |     the passing of an uninitialized value via a const pointer, like in the
  |     following code:
  | ... 9 lines of the commit log omitted.

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
  | 26625
  | # First few build errors in logs:
  | # 00:21:02 net/phonet/pep.c:829:37: error: variable 'dst' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
  | # 00:21:02 make[4]: *** [scripts/Makefile.build:287: net/phonet/pep.o] Error 1
  | # 00:21:06 make[3]: *** [scripts/Makefile.build:554: net/phonet] Error 2
  | # 00:31:27 drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.c:2728:13: error: variable 'diq_start' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
  | # 00:31:27 make[8]: *** [scripts/Makefile.build:287: drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_lcn.o] Error 1
  | # 00:31:50 make[2]: *** [scripts/Makefile.build:554: net] Error 2
  | # 00:32:09 make[7]: *** [scripts/Makefile.build:554: drivers/net/wireless/broadcom/brcm80211/brcmsmac] Error 2
  | # 00:32:09 make[6]: *** [scripts/Makefile.build:554: drivers/net/wireless/broadcom/brcm80211] Error 2
  | # 00:32:09 make[5]: *** [scripts/Makefile.build:554: drivers/net/wireless/broadcom] Error 2
  | # 00:33:02 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1894:21: error: variable 'hdr' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
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
  | 36665
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1732. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-mainline-allmodconfig-build/338/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-mainline-allmodconfig-build/337/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/llvm/sha1/00dacf8c22f065cb52efb14cd091d441f19b319e/tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e
------=_Part_7499_1483395328.1753062735187--
