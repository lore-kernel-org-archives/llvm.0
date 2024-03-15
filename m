Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944124DA08
	for <llvm@lists.linux.dev>; Fri, 15 Mar 2024 18:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710526675; cv=none; b=PumXe9qnEKeDH3DKtY1zu5o5amQD44ZchWC0UOI7Mn8UCDmgQf/m0OX43/SFxEGPZNQVrLaaSo1cVZ0DgQfNmGeGsJNbCteAEl17h/c90xKMoGA6Bp5PvoRzn2V4ZaT541YfwOJIOfNpz9IWAWkkDo8JeP+2FLqQRe+jl6AQkBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710526675; c=relaxed/simple;
	bh=ZVfcKghFpU44CGFvDSPL9RecngnQoRgErJTU1t0ynQA=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=rqih37YCNcbMWUUPA7f8K27xaDxEFPylFEaEc1aTAGzye9CmAyZ0ltaJhWsJV/ZEXmMFEaX3O9Hq2/JP08NyIdjvLRUomiKNbOHjX8RVjDMPGH/0GQRz0dG7nCH0xVnKeEkyvjMfaOEJ5BjBHYhaKlKj6AmdBrp1zwCzN2Xy0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ3GnhJ0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ3GnhJ0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-414025406d7so5006095e9.2
        for <llvm@lists.linux.dev>; Fri, 15 Mar 2024 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710526671; x=1711131471; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9hrsqYWqvy2N3xKqb0wdaiGOGVuWtD1InWVVVvMtjU=;
        b=VJ3GnhJ0Qmq0qUAMWCLj4lVhQrtcOMkelSeIVCGy+/ecviL6k+FX/JAnYVRbv5cV85
         1Xkf5HGTMwc93TjFth/rGxncRBJkqcozOrM2JlyKOjiFTNbQ191dcClbSGHkkOzm7F/i
         eBsvKWpQwHiGWCwDG4LCpophnKGPq8ZsxYvs5/xEyleDrYEdriIwXxzHwkKz8SFj5R9Y
         +XusiZPFy8lkGvp2TTR6VI88E6857MK/qDg35kR8yxdzqEJHrXEsMI4kRBnYD2YaGhz8
         H4a5MxC2qxnmNuJuSKkntiS2P4wAwmjb4Ts7RSWKjwlrM4bG+GSFTvDnnS/eWodNCvnx
         mGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710526671; x=1711131471;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9hrsqYWqvy2N3xKqb0wdaiGOGVuWtD1InWVVVvMtjU=;
        b=FTGx7d/GTxt2h6viWWtViBXE4IBKmYz75x/IKij2/GOKfba3aGH5hDVEWb0IZCU/qJ
         jybzU4EPE4iiqruzmijTe9CMzo78MmJD2K3b4IHpCFbKqSHVWjQOsdOr2W/Kr6oe2w6E
         i3jE3A8jTmh9iAdVrddtzC3rqMcSBnstF7xpSLf8aUF8kFuWkt0Qi8vH0CO2d/3B+WNf
         FKTsRCbVhIJGg7CMDnFQW5Hea7mpyaWOfo3WiOqMYRr5MjEWwcNxcObf/4J0K4TcQGqE
         0pOcV0jTglftctpHHA1S19q0gv2740Clbr0PKGY0Ci3+3KZVLX3n6PL4yFrsvaw9xnqV
         xQhQ==
X-Gm-Message-State: AOJu0YwOqitv70r1AUCk50/pITYVYI4AkINz9c5Tge1dtnK9J1t5T1XA
	MEbQmedcQ6khWyShh4JK5/Z9sFrfTi3gVub+jO7pJHIQooRGsAw0BDQ4lKR6HMYrR0eFr4pPNxt
	1
X-Google-Smtp-Source: AGHT+IENQr7WxcelOh7nigDI5wtgv81nHdGdA/gH/wHd8n+vGrYMtBiyFVkuTM7TLMnZjx17Ujmm+g==
X-Received: by 2002:a05:600c:1e1e:b0:413:f50f:8014 with SMTP id ay30-20020a05600c1e1e00b00413f50f8014mr3906577wmb.8.1710526670878;
        Fri, 15 Mar 2024 11:17:50 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b0041312c4865asm9708191wmq.2.2024.03.15.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:17:49 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 15 Mar 2024 18:17:47 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1600649688.18109.1710526669261@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.8-rc3-339-g358e76fd613a: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_18108_1570128459.1710526667832"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-mainline-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_18108_1570128459.1710526667832
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1173 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-arm-mainline-defconfig after:

  | commit v6.8-rc3-339-g358e76fd613a
  | Author: Maxime Ripard <mripard@kernel.org>
  | Date:   Thu Feb 22 19:14:21 2024 +0100
  | 
  |     drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
  |     
  |     atomic_check and mode_valid do not check for the same things which can
  |     lead to surprising result if the userspace commits a mode that didn't go
  |     through mode_valid. Let's merge the two implementations into a function
  |     called by both.
  |     
  | ... 4 lines of the commit log omitted.

Results changed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
6885

From
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
7770
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-arm-mainline-defconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-defconfig-build/93/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-defconfig-build/92/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/358e76fd613a762bdba18b6b9fb0469a481de3a3/tcwg_kernel/llvm-master-arm-mainline-defconfig/reproduction_instructions.txt

Full commit : https://git.linaro.org/kernel-org/linux.git/commit/?id=358e76fd613a762bdba18b6b9fb0469a481de3a3

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-arm-mainline-defconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/358e76fd613a762bdba18b6b9fb0469a481de3a3/tcwg_kernel/llvm-master-arm-mainline-defconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-mainline-defconfig-build/93/artifact/artifacts
------=_Part_18108_1570128459.1710526667832--
