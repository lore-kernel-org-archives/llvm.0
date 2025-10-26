Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7424E4C4
	for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761498085; cv=none; b=RiMLzUA7/XVBMqIFRModsjAS+3PCCRyT35lAk3P3ufkrj52nWqgZMEM7c/Wrg8HHL4eIV+jRHEpPrOv/05T5Q381L7UolNJ64t+4k8nrpvXmXV9Z/1ZwQdYW+0xuY7gFk1wKRxwwacy6tEdoO5ERU0eZ88tpgJddwxzbfNV3hxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761498085; c=relaxed/simple;
	bh=3uBbliirVc3jww5q5Y2adj9XHH1YIm2yJyF8Be72/3E=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=q8rZ8Dj8W8ADIp5UIEi73MXVyvKWAp+P0WiCJZSuB40WYNBnzEuz9hA2rUW+mJaQxNMjRcT4UA6nF8NpAznu5EojB9o+NhMw2nsTJNg77Ofccs0QwfK3cuzKk3GRC5orf5jnqegATRxBd+y40hV5FmMeG/hy6Kfk52G6R5kg9yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EXMnc7JD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EXMnc7JD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47112a73785so23472395e9.3
        for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 10:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761498081; x=1762102881; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NhJNOPdN2CYb23xAVGLTmgNPNqLAx0EC8t93YAryYiY=;
        b=EXMnc7JDGVIF13iUi54lLNlOTVqipDSmDUNRw986kdDbJ9hC0ixJDQCmc7ZLAFRSAq
         hB0nAi/7mx1yAj9i1le+wrJWyrHPYVWkzFcaIaaDjZ3coNoz8TygNGojFEaVpzg4BMCd
         3NR0UNc2vkLTmDCCsjmRSwLB42RSf0X/rt69GBzmeRc8pqerjba+mixNJgGZkVuNvANb
         E9EcalITJtQnrRw0Rc7OBjfZV4Abz06bUqufowHd6pyiMbygX/RQDoccD+PVnJzIwhK0
         qXleaY8DinwBCLPCxlSNVlkF+lykDWBTCaTMfpHx11WQ7Q/pgKYFI5v+PR1TPK1IBsKq
         Gm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761498081; x=1762102881;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NhJNOPdN2CYb23xAVGLTmgNPNqLAx0EC8t93YAryYiY=;
        b=d4uFnMdlOfIBtF+9wj7KmFxnoiUDdCN4THmzy65i0TwjY/4NRCmntWXvtr1LUT6Wko
         pMMtF5d2v8VGP84o1ePyLQRK8J+/USrogwwINP5CjunxNtCCYxtoUKgz2z3mGNT4szhO
         b+g9R621P+bxu1zt1FcbmrCfCyjUTUAmBnaCUN7qP+FVCGAd+ZAH201fiRMLHvVxGGF8
         ZUo9L5keKJufbz727uvu9Qpj1fA45hTDNBVao8CfcGWaJvDCwTIjbWRjLa0Ghmj+EupR
         170AprE1XH9n0SG6zoRVgB2sBFBYnnRxNa34cLl9CQY+oEm54XYibHWd+moEVE86CQH2
         ziIQ==
X-Gm-Message-State: AOJu0YxddfdaX5HAe2bx5ws6XBg7vAN2Ah8DZatxeemgfkF9fQOJjqA/
	9lC9FiaG1w9aB/638H0VoV5UsNRj/92fcPt3dPy8xfJH7t1Cet7ruaoah0DN+mdtApUJXUBUiQ4
	rN/x9
X-Gm-Gg: ASbGnctogHMf7YLSQDUqfv/Ivc/45DBmiozM76ibf5mn6PJOj1+hlOhTTCYMr2PH+p8
	7+AafRBMdIQ92gERTmrzXvuedBAX5cnuRXqTR/zbYEQ6gwzMI+HLds0Fd3Aaz6N4wqTWesz9BEN
	2DXsyu0OPfrZaAyDWDQ8bAmmpjmnbriBbEiZf7q1f5z+MpViOWU3vuz2UKfCMDiIwh/S4FifG5h
	HQmw6SG3Hcu8lX5o3CbJHOQEF0V2J9RifOTxIsFU8flo3bVO02A0KlayvUW99SE/jXzhKk+X9t/
	g+YMzTS1pJfIn+Z8rMJ3lm9RpK86CFwcrC1pZ/BEOy8QQk53XNanO/aPyHtqavsBOtyH0vS+2II
	J2vIYy/H+tqbWPAmV5nE0RyiqD040Xy/69zmvXZaE5SIjhLb5dksXi5AxF4SZa6y30F7kGQDcmA
	8F6zweLRs53zTyvAyqYbLPHvOGFK2ssq3THxuEHSTrMNs9D5k=
X-Google-Smtp-Source: AGHT+IHQNSa8w2tKLfocv42lR/lVkPv8jCKPOl/P2mlp7a1kjXIKYMs2PUrc08l0JawmYYHiMlQK4A==
X-Received: by 2002:a05:600c:5298:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-471178a748bmr233880465e9.15.1761498077817;
        Sun, 26 Oct 2025 10:01:17 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbb2bsm9420039f8f.13.2025.10.26.10.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 10:01:17 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 26 Oct 2025 17:01:16 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <481166937.2108.1761498077256@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.17.3-130-g86f364ee5842: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2107_1210027701.1761498076417"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-stable-allnoconfig
X-Jenkins-Result: SUCCESS

------=_Part_2107_1210027701.1761498076417
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-stable-allnoconfig, after:
  | commit v6.17.3-130-g86f364ee5842
  | Author: Masahiro Yamada <masahiroy@kernel.org>
  | Date:   Thu Sep 18 10:05:46 2025 +0200
  | 
  |     kbuild: always create intermediate vmlinux.unstripped
  |     
  |     [ Upstream commit 0ce5139fd96e9d415d3faaef1c575e238f9bbd67 ]
  |     
  |     Generate the intermediate vmlinux.unstripped regardless of
  | ... 14 lines of the commit log omitted.

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
  | 693
  | # First few build errors in logs:
  | # 00:05:55 make[2]: *** [arch/arm64/boot/Makefile:23: arch/arm64/boot/Image] Error 1
  | # 00:05:55 make[1]: *** [arch/arm64/Makefile:180: Image] Error 2
  | # 00:05:55 make: *** [Makefile:248: __sub-make] Error 2
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
  | 693
  | # linux build successful:
  | all
  | # linux boot successful:
  | boot

Used configuration :
 tcwg_kernel/llvm-master-aarch64-stable-allnoconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2107. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allnoconfig-build/258/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-stable-allnoconfig-build/257/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/86f364ee58420e4e0709a1134e0d0d01bcc1758b/tcwg_kernel/llvm-master-aarch64-stable-allnoconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable/commit/86f364ee58420e4e0709a1134e0d0d01bcc1758b
------=_Part_2107_1210027701.1761498076417--
