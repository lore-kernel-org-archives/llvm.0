Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC21F1302
	for <llvm@lists.linux.dev>; Sun, 16 Nov 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763286389; cv=none; b=F+e4sjeyHBCCVH6M2zUJOjr41L9L3MslD9D9VSOPEB3ZI3+DQ933jmn+ttMza0cR1e9R+eLEyQE2BwpkhLSK1NHyO0d5bCCN0QZ2vi3ncvhbL1zp6xyo+6eAhSiIKzO9hFVjZo0ejmmUuas8RgfacskKUdVLcMDYMBhYjLpeKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763286389; c=relaxed/simple;
	bh=6ztonvgPJsydE2Fr7BC1wM68Y2LeGVGJ5yWHycYPRlE=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=T2IuCSepYGa8t3Pe0NKZdA2fbRCTfGy6h1EV2LJ1/SofboGF6sPVIazPxeZYwOY6vw3OcqW3XO5QitajF6NhPER891KItmNUIqKT6YAKGo7Pesl0DHfYSZzZzsWNcBl+YKuXTL4BxP/noDuokTY4NNOkmYXgif+fesskrOfVJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFW0QX1t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFW0QX1t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a1c28778so877255e9.3
        for <llvm@lists.linux.dev>; Sun, 16 Nov 2025 01:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763286385; x=1763891185; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GHeZFihplztQLyEoF6TlocJd0Sds99NnBKFRe7duhUw=;
        b=KFW0QX1t3lnkdazHtRdM8Gm194seYIqbyOL9yyDd0Uy/9YbYwKXu7Vj/Igats4NEqo
         mSqGjogVS9ucNHDbT3Ro3gto6aKtnjkIpC9OWs6MW7bWZAcN62DiB0ICJtabKbqrEVjp
         0AHmDzIJl4fjNy+2D6enll8btN7Xh5scOpw1Jm7J6mmfxx2CVKVXXruI/Nnb9Q8cVstt
         w2uW14EgY5dPYvE+s/yONpWLM+P5mv8NfcaG7K6ilL2uPPH1qr1PX4PAj2Ku9JfxuAKC
         lyaVj5t3zKlis6sLIF+A8dEG9CjB71WNNfe4kYedMVPICx7LemWkbjVrcEH3BvgDcaQP
         E92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763286385; x=1763891185;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHeZFihplztQLyEoF6TlocJd0Sds99NnBKFRe7duhUw=;
        b=Nmf/F5ln7C3yQ++1fgE4BKc2/5T7LTunffYI1nPCd2IY+Qw9aSa3YpAPF9jzJgcAjy
         sq7TncaqalDPyhl9UiTr85VWrF/pfKz+UEpZdkrzqADyN7/brBbnPD/RHmzwWfoR2Fzo
         bTqk7chq89DvAMQG74mADWPgVEcmIb1HyNDaB/J/AyU2lPPgCQs/g+sN6neqOtzaAl16
         ++WmSj22rJjGIdv6CN9JRyOXGVuU587DLba+5ZoxUMGBQ4kRKjjWLnHP5TPXhxTtPdbC
         jkVsdQrXCeun+m2R6AHNcSHD+wry/4oKQEvHtz18GplbQyF2Pt9sdJdcPSp81CXqtQhL
         6KNw==
X-Gm-Message-State: AOJu0YziEfCRul4U6lyVTgRsBGG/fJqpb3imIATl1aVO6JF/kqGDcBwo
	AdsNRYiKP9JNlceCBQz5l+MTTORSJVQSUzPQqQvcv6eWI2UB8O7c8YYtsd3i1zRzldwqbx055LH
	i71uv
X-Gm-Gg: ASbGncsP/wQKyS5r0WFektegH0RRob/rfX9RTFwYJLRneCFOg5tRrPEjyxn2MVlmu7G
	BPHJI2IWblmR4CnmJtTWuDQ/5Yg0DUEheKKF3u+qczvZ4sKtvx6OVUVn43oeb5GbGZBoYTEmIOt
	ax7Nk1jM8oNoUriUmEQfv8ZbeLHaSAnZIoivB05xeukXyLEUZr3GRtYyaLAKQ3uyVbaXDmaC2vu
	CXc5WNA0MlqLkZVU0LYUWPpi96fdvqdsZTwm5k2VNTqr3/gSAqv9qjy75MiWMmuPPIcr77Z7Spz
	ro5njD1PmA6muAquO3NrmMvMkuC/L2TQkkZrgxnyzBLvF78ebVdXYKfsH3TdOx64pEkTcQYTTdq
	2Lw2KiwMbMYxX3bkqmFw3e3R/Dvykam0Sngnj6Z7VFEespZIYQPRD+O0ZE+1hWYexCynmA9uT8r
	EATryDX0AnL/Ax6EYC9fB0vRLcqN8RZSlHQ4PJoh6McBaAqE+6e5eUvaaJgQ==
X-Google-Smtp-Source: AGHT+IH3M3qhGH8sf9N/L3RM+lQStIZ4B1aplu6/H+SFScP+8MkQGwd1fDoxNP0CgsE09TV0zwaF4Q==
X-Received: by 2002:a05:600c:4585:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-4778fe4fa2emr84077915e9.7.1763286385350;
        Sun, 16 Nov 2025 01:46:25 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e442c2sm251831725e9.7.2025.11.16.01.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 01:46:24 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 16 Nov 2025 09:46:23 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1094974019.2375.1763286384876@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.18-rc1-73-g3ffeb17a9a27a: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2374_1112577533.1763286383999"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_2374_1112577533.1763286383999
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v6.18-rc1-73-g3ffeb17a9a27a
  | Author: Christian Marangi <ansuelsmth@gmail.com>
  | Date:   Fri Nov 7 00:57:08 2025 +0100
  | 
  |     pinctrl: airoha: add support for Airoha AN7583 PINs
  |     
  |     Add all the required entry to add suppot for Airoha AN7583 PINs.
  |     
  |     Where possible the same function group are used from Airoha EN7581 to
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
  | 27020
  | # First few build errors in logs:
  | # 00:37:42 drivers/pinctrl/mediatek/pinctrl-airoha.c:2064:41: error: variable 'an7583_pinctrl_drive_e2_conf' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
  | # 00:37:42 make[5]: *** [scripts/Makefile.build:287: drivers/pinctrl/mediatek/pinctrl-airoha.o] Error 1
  | # 00:37:53 make[4]: *** [scripts/Makefile.build:556: drivers/pinctrl/mediatek] Error 2
  | # 00:47:13 make[3]: *** [scripts/Makefile.build:556: drivers/pinctrl] Error 2
  | # 01:59:07 make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
  | # 01:59:07 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:2010: .] Error 2
  | # 01:59:07 make: *** [Makefile:248: __sub-make] Error 2
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
  | 37290
  | # First few build errors in logs:
  | # 01:31:35 make[2]: *** [scripts/Makefile.vmlinux:100: vmlinux] Error 1
  | # 01:31:52 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:1242: vmlinux] Error 2
  | # 01:49:18 make: *** [Makefile:248: __sub-make] Error 2

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2119. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/470/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/469/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/3ffeb17a9a27a668efb6fbd074835e187910a9bb/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/3ffeb17a9a27a668efb6fbd074835e187910a9bb
------=_Part_2374_1112577533.1763286383999--
