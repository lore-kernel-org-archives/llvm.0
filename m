Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D001F872E
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767651; cv=none; b=VEQ7TujwisDoHHQXrfnBWkK6YMdll6Qu945IZGC+MvUUGwpYDSrs02q3JUdQ4jBwxnAA7oyI84mnN+7mgPdxtyn2NiUo9xj7peJhWNz3MxyGqJ7/a/p7RGxoX6wXwYI2kkHrdR2wCjhm5HEji52yxPoxiXkB4jlugE1HpgUMHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767651; c=relaxed/simple;
	bh=zmMSHW1/n0eE7803U1bdyTwE8d67sTx6gvu160RS2ds=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=IYSewXkYsFByS2S8rsTJdsSpNwGovBurudrhgOoBZ1kHo+TxZJfvIPkWyySp1ouVF1u4Pw8r6kOwJkKvOh1UTLosljtU50/iSj/BcACDk7xeSEtiaqSSQYqmHQHGslFxOQcg8WE+usUUoOC6aVPfT7l1J/tUTNn+Kg/rYB0+bVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+gLKOqo; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+gLKOqo"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abf06950db5so371447066b.1
        for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740767647; x=1741372447; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPFI258uk0NIgD4HDjVMSxToE5jIhBWSwtWcv9rWiMY=;
        b=c+gLKOqoKknm+pInDQ9VLjbYuS1qM2zIMV94gUtq0LZ/Dcf55dmr+9uHjLXBgU2Iag
         BuxMVMUj9LF/lXV/shNyCldmnTvmprzG1BlfD9qPQAbYOhjfe0WD9jEZK8oJpfoNdq8H
         hD6bRE4bLzlGAW8O4Tu2lI8NEPE0fDiVUnGt9Hvj0y8cr+3PoO2bmwKmHVCoOilXW0xT
         8SMsZ5CihKRzUahsnYxKNLOoiEDImDLKRlx+5XuQYpyxSLKJAZWe4BrFaMLCwZ4uqryk
         KjYLaLhqL2MqvAGiQZ4ytEx5U2yA0gHkZ1uXKTW2lwoDaYBc+WtoQ/kIaTDZIvk7Q6Dl
         Ui4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740767647; x=1741372447;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPFI258uk0NIgD4HDjVMSxToE5jIhBWSwtWcv9rWiMY=;
        b=W9w4TWfJYWvOFrZEareAwO9ftvQuJrnWnNe5yTCl5rRJyDywHCm+NkMYFXOWIIOB75
         XNoShUPzXWQbnZxFjTymjbmHUqv6g4lvhppZ7DnOdOcZmIcCBoTq5aV1iNvRd+OItpc0
         iDx0VBRUrv+9fxinPoNYfuVApX/445PiFFPSG3dazFyXro4Z6fhraEZN6KxKO4/kC3pS
         cMB5Awo2J6lOfrQTATk5etj1b0kc89mJDgSfazCWjHV6n0V+xTSXbGFZCj+PXQ9LtUSu
         LDX6jaesyYCArpIzJOLgKlEq3Fem9nPWosMkRzOVVvHNqeNPH4yz8TffJVE7VJC308/x
         2rDw==
X-Gm-Message-State: AOJu0YyTwEh3kjGK6h8b/3atfwKCz0JejVDz1BKRTVcUnxj47UXPSsuz
	z0GoGdmq794Qr5tbpWp5z3g81yhAYgySRaIH46TOwqmOrnOWFRYjn7d1Zicr4gqO+XDS4eTKu3v
	S
X-Gm-Gg: ASbGncskW3oZuYWBP06QYr1t1jaIfadtOqZJoZUBetHhZWYgQOeP4P2oItWp9Kdmjg0
	haahUckIef0gML9pn/qUTf/ubxWL5HFxRMlPLGQY8d8NmlEiJvpndM39x2fOnr9y9kgOLcm+eXW
	AdsqwUioaW9KezaXkCTG6U1I7cWtqYKdAMDoj5e7i0J/S25pBSasA6NcYj0Ua06ZQ/AGKLkBsbE
	hAxNbxCuvpMMplYdVXXO3a2zvztXqN7z+6lSbGSnYxKOVHixQIaLw5h31hCau1eEIBTxZM1R5Bm
	lRwQ6qexTBpCnPekip9dn3ScxX1sUCuwP3isPtygfv2AmB4nx+8fPiG91H13ydzEVvGbF4VE7Q=
	=
X-Google-Smtp-Source: AGHT+IFG00A2v//0AhQVTI6dFYLbztL+OYTe1p2p4VXg53Y3S7DX7qpDMIk7WtCxWSfXnL40MTKCFw==
X-Received: by 2002:a17:907:7e93:b0:abb:6f30:32c7 with SMTP id a640c23a62f3a-abf265a2a32mr522793066b.10.1740767647343;
        Fri, 28 Feb 2025 10:34:07 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf17fa4a4asm286106766b.92.2025.02.28.10.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 10:34:06 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 28 Feb 2025 18:34:05 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <2037930697.153446.1740767646758@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.14-rc1-10-gf120cf33d2325: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_153445_1069364785.1740767645918"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_153445_1069364785.1740767645918
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allyesconfig, after:
  | commit v6.14-rc1-10-gf120cf33d2325
  | Author: Mario Limonciello <mario.limonciello@amd.com>
  | Date:   Mon Feb 17 17:17:45 2025 -0600
  | 
  |     ASoC: SOF: amd: Use AMD_NODE
  |     
  |     All consumers of SMN in the kernel should be doing it through the
  |     functions provided by AMD_NODE.
  |     
  | ... 8 lines of the commit log omitted.

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
  | 23685
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
  | 23759
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1584. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/331/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/330/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/f120cf33d2325fd95d063eccbff2e86ffc7f493a/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/f120cf33d2325fd95d063eccbff2e86ffc7f493a
------=_Part_153445_1069364785.1740767645918--
