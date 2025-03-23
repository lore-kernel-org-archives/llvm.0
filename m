Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B3157A6C
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 19:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742758789; cv=none; b=WekkValhguCKZmzlMfY5v9J+fpIkDq0O9sAQr+du3fTqp0Wn5sjNbF/pnR+4vHUwLfvseODof90n9lEJeJapgabhFAP2JxQ4sn+4axZBl7rbFu6bw0dJflPF5VbwobQ4aVShw+5YE0tP9VwWCf4KvNmBsDczbLsvyY/nP1ML0/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742758789; c=relaxed/simple;
	bh=qXXj2J42MZaMYC5Zhl/gdlsdcYSiBevR+DAVoIogI+g=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Us+LEd4SnpdanjpmK2W3A7T/Ob4Xr2zp7p6dZiH3zi5lL/jOk3JGQ8NvZ9sSu0tXRnxuVn2NY/0EDic4/CKoeh5rvC0M51EiYnSFTer48BfY9vK9I1TlVSdmJXDcG0DkbmJxmEm0uKGvCd6tu/1ESYiZjhe31/ChEA57sBQw3aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xl8pCZIr; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xl8pCZIr"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abec8b750ebso685834166b.0
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742758784; x=1743363584; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bJ08MT7sx2n3qDEvW+sPhb4d9lY6WyYtRvkraBCJb4=;
        b=xl8pCZIrZtggsC21lriMffh+cQIBtu9gKGb/bsUY3D5f3EuF9o4JevUcZxfVby8xP1
         JzprrBpcFL4pwnZPF+Kic506CWV4DoUMxQNjhBkIsoigKXPw5Y9Fd3SGMnasj9nL27bX
         3jYuNIam22PCujwDDBPFL8JV0pi+NPfKdcqD+shNGaqqHlqoU0kI6JZ2ALBtVsdqY4lJ
         tMO5AWTfDcRBTo1IPex09DvLUnVS8xIclgjQkf0RmA9MZoScPn+NGe3A5H7AkpfxctiQ
         9+/PJ3pXfJlucJnovuJyJZMMp3yWlYyOJKG8r7Z6y6a2yJLJWVee0b+aKrhRy5j07I/B
         0vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742758784; x=1743363584;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0bJ08MT7sx2n3qDEvW+sPhb4d9lY6WyYtRvkraBCJb4=;
        b=Kdjn9XoyjJjxrG6KmITEtaSp5GvlfoASQEL830ibcfz72oRrR0xOxXNrmnh6xhhkL4
         bJSqFaDoCgi1283rLbexeheMd1cY72Z/6kBPSGMtc2RVf82ULUaMAUVxMZYT/Xb9oUt4
         4m5rLoVL6MT7g4zDMVn1HKdeJAe0mjY2bIh7TnKbGSt8TIeR8B/g8pejKDjIecN1BBKo
         ErBTf4jITjf+s7y+fIn42Af07go1CRwTTXDLIs6vziSZ+TavPhUVw6t/r0WL9vZut3Mq
         bSx4w1aF2tfnkM7Qi6tls42X4aqVZBuN59HLXGvmZ40fu081n2rRpN2QfzXokW8AiTg8
         k48A==
X-Gm-Message-State: AOJu0YyqH6MIpXs6ch8Bzm0TyATj7vm/irwIjilHzJ6k5lV/4+lkWxD8
	wxwEnFrfwpgTA/WevAjuARsLUHU6P1bFJgZNta5beiztnU2f34Wrr4mdpqWGUAWqlpjLrKUj8i/
	M
X-Gm-Gg: ASbGncvPkz7Tb56l9nldvcsSK8lTjA6IDGGg1UGAe8P7qKPleQf0hhOPAg9f8aDYIxT
	mEzpkYDhdHb6XtkZcX1c6Uy0AOGYmcuSRAxvnd2Cky2q8eueBEqK/oxRhUMnU2FpAGo79JgKmIk
	onuYloO/nQuVp/GroksbWjsyl5nGFNrF5xwnimV4X5ab3JUg8yt3J5ygvuiWzw6KAhFqCLnYTwW
	66gTXAO2XZtpqjchrWsLp68shWlykv96jAn6jrfh3EcEG4svs/o8OwepAV1mxC1s1k1Lhhz+KoU
	Unppyp37ExWyb5oLxsUHqznmxjUgyEIuivdD9z6rFVAEhCcCqSHeg4jgx9ugJFHUB95Vgv8h+6U
	a9yDWwVr50k4YdX76
X-Google-Smtp-Source: AGHT+IGY4fLTpa0HSjoKQSmr9bhOsfbfDetm5ECA6ofY0pQxKBZBklq9VsL1BERopVCP3BZtxO+Eog==
X-Received: by 2002:a17:907:724f:b0:ac2:d6d1:fe65 with SMTP id a640c23a62f3a-ac3f24d788cmr972456966b.41.1742758783873;
        Sun, 23 Mar 2025 12:39:43 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbe0356sm553877566b.144.2025.03.23.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 12:39:43 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sun, 23 Mar 2025 19:39:42 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <2138545970.174055.1742758783365@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.14-rc7-39-g95a8ca229032b: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_174054_1124216313.1742758782625"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_174054_1124216313.1742758782625
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v6.14-rc7-39-g95a8ca229032b
  | Author: Troy Mitchell <troymitchell988@gmail.com>
  | Date:   Wed Mar 19 17:29:00 2025 +0800
  | 
  |     i2c: spacemit: add support for SpacemiT K1 SoC
  |     
  |     This patch introduces basic I2C support for the SpacemiT K1 SoC,
  |     utilizing interrupts for transfers.
  |     
  | ... 7 lines of the commit log omitted.

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
  | 26120
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
  | 35986

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1636. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/350/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/349/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/95a8ca229032b4984bba959a2c5680a015719481/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/95a8ca229032b4984bba959a2c5680a015719481
------=_Part_174054_1124216313.1742758782625--
