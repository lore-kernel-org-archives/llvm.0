Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624D3A8EF
	for <llvm@lists.linux.dev>; Thu, 21 Mar 2024 05:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710999701; cv=none; b=ZAWMrIkdGUyf/XTAHOEZmGOprg+SIHWfZ/FI6JXDwdwhx+7luDz8wkKsw2YYf6wVkB+d7h946RxkRAmpKo40gz+K0aoxH87LPH6dst9jo3/zUYZ2Y7OgfLFs8EFdssNbDQYLsHbCnEgV/s8rHTHmgqsBOMf3N/5yylZtht5C8Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710999701; c=relaxed/simple;
	bh=JGPMJGfgsFzOSyKECSD6R1dVYgtpQD6eUxZb55LhisI=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Tj2EhSut3lvIiD8TbvsQYCrXf+VNIo1RqDAoz5v8Xk4lpbk2GGMihq0urz3pqJxUXTFnI/GbW9WwpdksMxDwFBn2/owf+MantQz5bEXxXgzqyIN8CibhKTpE6EAdvQB7xQSaDW8U7SweGj9ufc1LrbXUUovpjN//UdgvxskFwJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUztAdid; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUztAdid"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33ed4dd8659so1023923f8f.0
        for <llvm@lists.linux.dev>; Wed, 20 Mar 2024 22:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710999698; x=1711604498; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rC7lg0TNPJlSpdOK3iyBt46Rd9DlTy58BwO+uu9oi+s=;
        b=EUztAdidrhC7oimAjzMeaH/eOT/gjq3PRRo0SpkGXcH8m3vobmJwxEJrHduJcnXDtZ
         0btLZp9DIkFOMh9IRR3eFV7Q9DgMu+wpSV4tmTS9Jiu7SUeeRpAR1joDc387GY5qKa33
         U3UucXGeY1dVvRJGyNZhCM/zuvL6DVoz0Kh+AuGPrMmBwiBWsEKcfMWx8OYWJvU99yYu
         0+ZOkXWL5O4wR67qYSe6BqoVGkGcuih0tgJg+tSpFSu0c4qUs5o+gzxmDjUKSWEBFIHn
         xxZp95KOltUARMuAR1k2oqFnO4S7I4jQJgTCsePHGW8sNlP1TgBwhcqGZ7ZL9lp09PkI
         30hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710999698; x=1711604498;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rC7lg0TNPJlSpdOK3iyBt46Rd9DlTy58BwO+uu9oi+s=;
        b=FfNJ7kxZpRH+GUjwdGC5LIkoUtIesyhjDAZdfGzWkFak09jqrqorf+ufejwfMwl632
         lOPQv61VcwDbyz0vztLhaqanGwLYZ6Q3D3D4Yl3ffYP8K1EaLtdrlJ007P2dvNfHajUD
         pkLnaV57lF3ijLJwhXgqL7SryLzfYlhw0ZAVa0ahjJ2F8LnBtE0ZL7Kok7AYgCsxoUCn
         wC/+g+q5Cji579EI5zf9my3o1UeHg5eVxctsKf65oBJ1jsouz5AQJl+pb1M2tJKllQsS
         j+w7fIt4TVYhchkJGOE9lnk8Ida3GXbJtXQloPrTrcqGbp2R/LMp2vRn0OwB90mMFkTG
         Fg2Q==
X-Gm-Message-State: AOJu0YzU4CYF5ZBDG73ZgUEPAZ3JP4BYg4dmaiB5a2NhqbYRWv9Ap0Bz
	4ejlPcLBzFQ2UeTaMKljLyJ/SBk7ahdsfFntjF5ZlDK5XAYXbWpwP2xGBpmblzZITP5KwWb1Bh0
	a
X-Google-Smtp-Source: AGHT+IGYlYBndiCng67CMbhXuNfx42KhXlgdzE4ijcFr7zuwvpzuGBzlnLRF4ci+gqZmUJiI1AzXMw==
X-Received: by 2002:adf:e389:0:b0:33e:d16c:4e1 with SMTP id e9-20020adfe389000000b0033ed16c04e1mr1242470wrm.22.1710999698111;
        Wed, 20 Mar 2024 22:41:38 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id p6-20020adff206000000b0033cf5094fcesm16252851wro.36.2024.03.20.22.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:41:37 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 21 Mar 2024 05:41:36 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <2023814728.487.1710999697604@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-19-init-5887-g3eb9ff30959a: Failure on
 aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_486_1739752986.1710999696992"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-lts-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_486_1739752986.1710999696992
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We appreciate that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1176 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-lts-defconfig after:

  | commit llvmorg-19-init-5887-g3eb9ff30959a
  | Author: Yeoul Na <yeoul_na@apple.com>
  | Date:   Wed Mar 20 13:36:56 2024 +0900
  | 
  |     Turn 'counted_by' into a type attribute and parse it into 'CountAttributedType' (#78000)
  |     
  |     In `-fbounds-safety`, bounds annotations are considered type attributes
  |     rather than declaration attributes. Constructing them as type attributes
  |     allows us to extend the attribute to apply nested pointers, which is
  |     essential to annotate functions that involve out parameters: `void
  |     foo(int *__counted_by(*out_count) *out_buf, int *out_count)`.
  | ... 15 lines of the commit log omitted.

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
7780

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
9331
# linux build successful:
all
# linux boot successful:
boot

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-lts-defconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/115/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/114/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/3eb9ff30959a670559bcba03d149d4c51bf7c9c9/tcwg_kernel/llvm-master-aarch64-lts-defconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/3eb9ff30959a670559bcba03d149d4c51bf7c9c9

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-lts-defconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/3eb9ff30959a670559bcba03d149d4c51bf7c9c9/tcwg_kernel/llvm-master-aarch64-lts-defconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-lts-defconfig-build/115/artifact/artifacts
------=_Part_486_1739752986.1710999696992--
