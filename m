Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218731BC9F4
	for <llvm@lists.linux.dev>; Thu, 26 Jun 2025 03:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909475; cv=none; b=jSTLRkwYNgak8/nPGNAeKF+W/JI5tq7i0LbzIjivplymDCwpmQW5dreYXBWZqInm+s6jBslQNxrZOZQK/Ix8yMC0SCctfESG8yPyv6pepKr7XtDCpeeGr51e+sc/dEkEPDLVupzpR+PNJ70rMjrkpE8n6vR8yTIumVCY+lFmjuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909475; c=relaxed/simple;
	bh=ZYljlwSrYjK4pNZNhsdo+DfxyUa3YDIbDGCk0li/neo=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=hoFqTLcuXOsXHcavnf4kxXSRwXpytnP9+KLNm4KVSexZgNQM0mO6M/p606tW2rpooJlI/Ap/MFseMwm7UWSHVoVfIs++jChMXITdWsUiiOjYOraF6qIPffppgkrIeF6KZap7wNHfpiilWwSMo7co/ENre7xXDxEqJdNuXfvrVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJT+SjyZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJT+SjyZ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad883afdf0cso113374666b.0
        for <llvm@lists.linux.dev>; Wed, 25 Jun 2025 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750909471; x=1751514271; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FrRrPy6xEbt7dKz/lLzFjOvbS6O+lf0ZIVlWlZFUVrM=;
        b=BJT+SjyZV3qDB72xzIsJUr0cfwtUBtTOi+pE/COG4MWW774per6Nc0us/vf45eEYqm
         Ym9oaTxZWRZM5TJrFK1fTDbMtDLRxNeTuprlAqsbXYn1tNHBpjS0s8fl6Gm4EjLyPqH9
         AouxxeQPfv1wphJYcXdhDZW5BZVDbf/jQ24nInLPRb8R+DUlHL5fFbz7XjJe6TPzkfVl
         oRRS5MqR/fTvlfzQSbjXiRx40fPyyFLdyxG5sCj4cN5obzlRi5rrppRJB5ehb5Ak5LJZ
         B2ulOuFF4eJ4mIYQ3WFUT7YW+luKpLW17gUCfTabiacNaQGSQJDoJnz8puhEaVB2PW0t
         urmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750909471; x=1751514271;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrRrPy6xEbt7dKz/lLzFjOvbS6O+lf0ZIVlWlZFUVrM=;
        b=tVxlU/yI75vIcU9SPB1FQLaw4D95Fi+VLEOCETW/Hc7oSoDH3j1q2T8TtzE6R2D2GV
         UoLAFYKzYJ8GvdnlnnhrLzQg29YBgCuRjqj1aPB1jAm1r5njfiFHTj3TEpNBnpPSV7ft
         FUSH5MCgUQ/1cz4rtTVqlypcOBeLdpCB2jolPAHm4YMgSZyc9EE+lq0+NzrHniRNYE68
         lX5xJx03J/JHUQyPizN9X3o+1mPwJVgbH0U9chfkuk4sE9hn5Qg/TtthaA+8jz5dhh6U
         0tdY0nJNpP7b7+Hr5sJvC43LVnNEMJC7XJExsGmsMTxAQoI7QTNYzDhz1RLA9KjeepBb
         eEuQ==
X-Gm-Message-State: AOJu0Yz8ZbiMXaCDKLEyv1q5OT7BulNzXUs42uZXXg1ML579lTeHY5F+
	hSn0lasV/OmN/isai45CgfO+9ROT403kJ7suXEjU3qPGAi28UNvu62UPrAsi3EGSkufrhQrqpMy
	iaP8c
X-Gm-Gg: ASbGncvPma9FDfbrvh802Nrfmxl6ZbrDAk4ThJ9uHZP/SIu67UZdJtmAJqHv6AwW3Pc
	YLCaiu1XieI+H8LlN/7oceBIKi9Z/N9AO03Vo570UAtxE9x+KRgEj/DAgerkWCWlhswaTdsp2Jd
	8JYECssavTKOhvwCVjgSSMuZSX0l8ncvoFHCCSVQOYWCKG++2EtkrRMxKKMcU+/ghXjjiVF5lvz
	f/esBJ32oK2RebNWw1tLzJ7d8ibMGVxjUxdLqtZbxvijtfxGEzT06uBPIdQQC321sUxJfk3gw8o
	kJDbL5YuwkGiSKSpZCZ1qzgnqgWxylXzCo/Gp6iWEq8kJWzouiMvIxUkzNR/buOF3IkN7opXztI
	ZgnvPbwlLTKeBcAT4UCExKcYOzUGC/y6QbA==
X-Google-Smtp-Source: AGHT+IERNs2/NQJHzupifIdf/Ni3G/93P+4EZ9kVaURlHde/P6sWBKsYR6BeYB5RZmnaEOe/4awmXg==
X-Received: by 2002:a17:906:7da:b0:ae0:a590:bc64 with SMTP id a640c23a62f3a-ae0be869836mr523696766b.18.1750909471337;
        Wed, 25 Jun 2025 20:44:31 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbe7dsm1142251466b.49.2025.06.25.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:44:30 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 26 Jun 2025 03:44:29 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1473247865.2128.1750909470759@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.16-rc2-1-g1a35c88302a3b: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2127_1274845571.1750909469396"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_2127_1274845571.1750909469396
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v6.16-rc2-1-g1a35c88302a3b
  | Author: Zaid Alali <zaidal@os.amperecomputing.com>
  | Date:   Tue Jun 17 12:30:20 2025 -0700
  | 
  |     ACPI: APEI: EINJ: Fix kernel test sparse warnings
  |     
  |     This patch fixes the kernel test robot warning reported here:
  |     Link: https://lore.kernel.org/all/202410241620.oApALow5-lkp@intel.com/
  |     
  | ... 11 lines of the commit log omitted.

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
  | 26630
  | # First few build errors in logs:
  | # 00:26:38 drivers/acpi/apei/einj-core.c:340:6: error: variable 'p' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
  | # 00:26:38 make[5]: *** [scripts/Makefile.build:287: drivers/acpi/apei/einj-core.o] Error 1
  | # 00:26:43 make[4]: *** [scripts/Makefile.build:554: drivers/acpi/apei] Error 2
  | # 00:33:50 make[3]: *** [scripts/Makefile.build:554: drivers/acpi] Error 2
  | # 01:38:46 make[2]: *** [scripts/Makefile.build:554: drivers] Error 2
  | # 01:38:46 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2003: .] Error 2
  | # 01:38:46 make: *** [Makefile:248: __sub-make] Error 2
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
  | 36661
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1711. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/402/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/401/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/1a35c88302a3b2827ec47f0b2d0530b543938fb3/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/1a35c88302a3b2827ec47f0b2d0530b543938fb3
------=_Part_2127_1274845571.1750909469396--
