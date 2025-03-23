Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8472E338A
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742727190; cv=none; b=lX1I6lgmIClsBn6uZZso2ixe2tWQm12x78Ndyms2cip5RAxABB5dacMOif56MYOY7bU4ktzod+XrcGD5dnbZupd8/nd7PCgw5rX66EUm7/69skYFRV4Q8Uke5ptnPb7FsfNelQr5AbjvBMHUsDS2SatRjUhSanBa+lTAX+kGkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742727190; c=relaxed/simple;
	bh=uffvmTlMMmGJpJoMN3P9vtJLJtt5AuZpH8l3cz6j0GY=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=H5QFgYuT9BdPU3nGoNyS6NZZRkwGf6Xtz84EfxGW3E5611DOFxnu9LAJzrGdI8Zhs95Y4j5Rs5uGuOydmcB9pZE96Tp9EKucqdVK3kZdEYvWU+alqetGNA9oMfCUCfmnnA9p9kXUQgINYh+wnT86o15xAlaKE0TlC4JjMgdd6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUfvDGZW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUfvDGZW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so579807266b.0
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 03:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742727187; x=1743331987; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/bXkWabeXE+wAwm2BjjvZWbnX5FoFmjofMNNAwDsBw=;
        b=cUfvDGZWbctOHN1BNeGx0GkOPbcbGtztwI30GralHEaVLcbGU2UjB2QlTCAE93GfYT
         b/m1/8P29mHeg2WiTZQWAUWTpYjfC3rqzwlc70crM3zIaEKy81r/nrFdyl0+2nAYHUfy
         ltrRkoLoWiu/LHziyQ9CLGgzzrTUHMvEl3QaTbkXqTwXga8yT28/eu9Kg6Gw7X8+w/xh
         5o0pQLqvAOlU6N6f0e+jC0i0Z4fEh0ypaCz24al7fIT27zCoLaNW9qJvEnd/PAnhK66N
         A1IFmSE/FEarpVyxDLYVBKc325XvMiMnsRlTr8HjJTzgNO/eAXZgjxWXnoyPxVt98720
         hALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742727187; x=1743331987;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/bXkWabeXE+wAwm2BjjvZWbnX5FoFmjofMNNAwDsBw=;
        b=Ma2lJtw5e0d2f6Rw+hP7LLcVpC2wOi2TvmVNr/gg30tVbvWUIz3Z7ikJIS5G+vCTjP
         PmMBB1SN5WliPy5cRsYrvYhQRAbpXdVNQLqX+n7JX3AIFaHRsvYcltvvGpLv5eUOI2X9
         aWXrPX0Plz0r7Yguu4RDw3rY4ie50/Y8VI3a2C3/esB8LPDRUVqLPbZ1TuwHV8/fYgqs
         vy8LIvDjtvfrvv9YlqU2bNLcb+/MivvTAVAXV6R9O/hT/p151/K7ZR79PxuKEAD8k7ta
         wPZm/4aCGNsZqp95AUytQwFuP88F9tOOS9X5e/CKgiiFCHoiIenJ9ccyR7jlV3w1owmB
         9SnQ==
X-Gm-Message-State: AOJu0YzPHiWs+rqbd0TXCe/XcfhDrfBf1ZEkl6DkF/WaSVHovl0h0nCZ
	q28uB/yRC/k3qZWY3YoYWwxpmMnx4xJ3HYN48gXYkdYtMq9ESXHqzdRdVINVGlg7joukHCSj7EZ
	m
X-Gm-Gg: ASbGncuerH5Avel2ohM4AGQn8N2gFqG6fG2vLeXKywAuKmpid9xryRM4GsTVgmGtBch
	cmnsT5ouIOlwXArBI6pzV2fgUgiTuXXTpdzc0sKagrfQztc10Pcojf0NoI+9sJWBnQJL7EByLS5
	N8g3Aelj2rd3uBK0ilYEsg152M3Mw+x7j5zpPMyqVVmQB6jvVd27c9EhEMsl6ZuhHyW27H2Whgv
	3EqU27AIV+OWr0vKQZJ0D0KAYioviZLQ8UfQfyM+3+HiIE+pFzPYQM8dIPeyVgJlNaWONkzOSw3
	xXBVW4qhkbBL/G4PFlnMl0y0ZLMakl5pMcs+qzYTwXabfzebF16hfHxgJ0E37WBMAHQNC9E240J
	3d6yzAWek49Ocn+aX
X-Google-Smtp-Source: AGHT+IGXlXa7Dvj1QKMbxrdmBFEOjkp0Rg8kxFW461h2+vMtRxOrYSoaDJ1Bx7onRfzqMnNwOQg2hg==
X-Received: by 2002:a17:907:724f:b0:abf:38a:6498 with SMTP id a640c23a62f3a-ac3f24ce705mr734485366b.55.1742727186418;
        Sun, 23 Mar 2025 03:53:06 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3961sm486892866b.45.2025.03.23.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 03:53:05 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 23 Mar 2025 10:53:04 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <193242711.173777.1742727185695@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-5943-gac9049df7e62: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_173776_211413130.1742727184904"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_173776_211413130.1742727184904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allyesconfig, after:
  | commit llvmorg-21-init-5943-gac9049df7e62
  | Author: Henry Jiang <h243jian@uwaterloo.ca>
  | Date:   Fri Mar 21 09:49:10 2025 -0400
  | 
  |     Reland "[Transforms] LoopIdiomRecognize recognize strlen and wcslen (#108985)" (#131412)
  |     
  |     Relands https://github.com/llvm/llvm-project/pull/108985
  |     
  |     This PR continues the effort made in
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
  | 23757
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
  | 23760

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1635. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/350/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/349/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/ac9049df7e62e2ca4dc5d103593b51639b5715e3/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/ac9049df7e62e2ca4dc5d103593b51639b5715e3
------=_Part_173776_211413130.1742727184904--
