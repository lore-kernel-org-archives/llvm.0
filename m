Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFBF305E19
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 20:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773089110; cv=none; b=r5nEkwll5WDOi5NEzac9ryjfq1MRwf6/SwOH2a8rezKwRQCYG8fD/VdBLYL4FuZwK79cvkktAdAC+qX/jy/hOY9BskCh1AmQwmO1H4fW6ezvqi823zFsH0Z78vDKvQGvJ2mOdWSfRrNy1TTuHxk1jYbtYS+6N6v4AZuUq9xACQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773089110; c=relaxed/simple;
	bh=08dEyKmsWuAcWA4Z7AfzoFqqnOlI07Xk4MCFkwukRfA=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=KgJHfSj6btkU4Z85JACBvxJVD9X2SL9wStLfsVkXIarm0nQgABH3s/W4XajoASNIM3/01Hvev8SpLR2dFzVnglUKzWG/TSPi7p+O9Cu+bTwR/MHflITGM1IWpH5GXo53ERdgl3B9/mn4++WD7LK2/K6jM5Ca12IyBS7q/+jN/1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXtviKgn; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXtviKgn"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so11522945e9.1
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 13:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773089107; x=1773693907; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pW0NEwM1inY47yIpYO2BQwkT4nvIjnkouCd6QVAds4A=;
        b=dXtviKgnuaUZt6Fl9kO71UhW67D5qiE/U0e5IjxsBkWOE5sV+MdjPrpDOPZrE8+RM9
         V5hnIt+LI0pWSdLAkcX29mt46zq7XGGTIMebz7PGv0g0e4sj+276bYUwXIUctKTTLVEh
         IoW+RklQMOEvUeeACoViH6UjkiFy53Y8V1xDIJvUslDpnXxI+3Rfoi6birFR2oufcOgH
         7go0gvNbupFcgVRRC7A4dNJP8xqRWrFGRLWOW/PRFN+iE1NkEM7TbY+isSrWF4wF88Ds
         1g4Zj9+GxV/Lft4r0WGSWx7fwAYwCrUUiPvVZec8abPRz75cB1hTR/q/QpAZVGb1Ju39
         wqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773089107; x=1773693907;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pW0NEwM1inY47yIpYO2BQwkT4nvIjnkouCd6QVAds4A=;
        b=N+yl+3IfIUkgM/IxAznUgyZaReTNv7juEhwJdXnqyqRMaCz8AUsJ/t8n6uhZqmx+yM
         EvgfSuK2P3V6fKhxjQABcNvAMjHsRAUkXNGcr8ft5GWIc+/zn9G/nLDT/U2hX7ASRwg5
         Rmqv9gh0N3iNQWP/vAXyO6pe+AYWNtSbygUxmgehiymKf5EzegCeOrflKNzsuPKP4SUu
         zaBE8/SLEP7uiN+AC4WSgW8raUJ18VV13s3yPrbK0RfgvXR1dmIryqoG5hFDjFOI9rw/
         w11wOC0yKwF2lGJTurOgVQBMhceLFHIIMLn8kE2icP40pKmW98cbbrjgAIq8rPJzXf9Z
         poTQ==
X-Gm-Message-State: AOJu0YwuUdm6xuc6dYHd2aqwWlDjbxQng26WDxjyrjWKwJo1rnSY1EJV
	exlF/DOsM+A2fd8MG4vpb+BzPEhIFAdiZYKDQuUSsvhbnY91bB3Yqp5bbkc6tPtxN0dbK5z4Tja
	qbFOd
X-Gm-Gg: ATEYQzw86ADtfGd6+VAmupmHyPL4r6wir3SzNGWPVrNnY+2+lxPzkTC+jbVfz0Clwna
	/G3z+ECeEsazJETOMfb+Ffj8qA1NSZG2OVzCzN2EI1x1nhr90D39nPxisz30y8bayAfjj1TV5hs
	B2LA/hhnO9Yi45v2roO35824i4bj+0mPmy+xneuxlGANbjMPPsXCFpq558wgyRa9m9kPnsvB9V/
	TXp4gsKdnFjorAtLG+6fmCHJuTnkfWHkq6Yp9mTE5GkroMsuDQsZdaozS9oYzD1QeJ3FR6+dPIZ
	pj8cA0IcNLbWuwupclObxWyrSyGDBbRZymP6kXMRXUrkmEjH2WyuZD75Lz1yVhaT3RVojefvXb2
	V2PYY0PEZ+JOa6zADY8zxK7Cw6HUpyPnVwUAigqa+Fhoc8NYmFRq/5BV2zOq8HYCX8JMhyYYqVx
	6fHbYHkbYNxgbJhVXeTI7QXnm5CpIy1KIhk9x15SyfFjO/Bl+YiFu4UrB13tyagq1dOFR7/Q==
X-Received: by 2002:a05:600c:3f0c:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-48542782705mr8211225e9.32.1773089107490;
        Mon, 09 Mar 2026 13:45:07 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48534fa65a6sm109348275e9.2.2026.03.09.13.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:45:07 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 9 Mar 2026 20:45:05 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1414278353.44514.1773089107071@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v7.0-rc2-17-gd22ba968a7a90: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_44513_1313110423.1773089105196"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_44513_1313110423.1773089105196
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allmodconfig, after:
  | commit v7.0-rc2-17-gd22ba968a7a90
  | Author: Thomas Zimmermann <tzimmermann@suse.de>
  | Date:   Mon Mar 2 15:08:43 2026 +0100
  | 
  |     lib/fonts: Compare font data for equality with font_data_is_equal()
  |     
  |     Add font_data_is_equal() and update consoles to use it.
  |     
  |     Font data is equal if it has the same size and contains the same values
  | ... 13 lines of the commit log omitted.

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
  | 26355
  | # First few build errors in logs:
  | # 01:20:59 make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
  | # 01:20:59 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2051: modpost] Error 2
  | # 01:20:59 make: *** [Makefile:248: __sub-make] Error 2
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
  | 36615
  | # linux build successful:
  | all
  | # linux boot successful:
  | boot

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2190. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/456/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allmodconfig-build/455/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/d22ba968a7a90ffbda1875532f6d854d5830bb55/tcwg_kernel/llvm-master-arm-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/d22ba968a7a90ffbda1875532f6d854d5830bb55
------=_Part_44513_1313110423.1773089105196--
