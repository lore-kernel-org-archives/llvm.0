Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2266E146D7F
	for <llvm@lists.linux.dev>; Wed,  4 Sep 2024 22:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725489407; cv=none; b=ds+H9HZd0EJZw9w73qPwRtJSeon27TydbsjrF5Zpm4p4nL8JzJY6hSYHMVz9ThU/2VXGYfA84Mr4wrcY8WcvMH6I6NrkHiWXl3uIRWke3QAqg+DrDRNoO/19L3xcPjDMibolcpZVc+WAlPO0+6PxKmmgm2w+fN0QAUren4lormo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725489407; c=relaxed/simple;
	bh=5r0lJ9UNKLZgKsa8qZH/2f8ua7MPxUhfTLSSPcSjv0I=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=h+RV2n0+ojj2AdIy5fEOsMm3OvGNpjaREmG64xUBpyTZC4+fYKWWI8dtiE9IX2ZhiQ2VRxqpgArOokyeZk1LUQzwTyZ0F+bZ120OaZuf6xB+XLys/JckH5I+deI7boriblpXdXNxnxvlh7VKxDmn9AG0rBxg8LpFPDfhQXJdHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eTDxNWG1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eTDxNWG1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374c84dcc90so36570f8f.1
        for <llvm@lists.linux.dev>; Wed, 04 Sep 2024 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725489403; x=1726094203; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neixDsfWSvKP9NLUVqQFsDa2E/vyWXuFC8jA2RO97Sg=;
        b=eTDxNWG1Szjh+nBXYz17ryne3EtLPBDBb6CKvJAxQa/sJ/KFnku6umHuk4JMiVIdbd
         NZGI2SskosBZOO6NAh9BfW48zO8wXv8xn28O13dltGNHlo6/hSi62meWItLxbtF2u25e
         m1F4xzW5/9N60NCJFSrxkkLl/hpQgexvsbV7d+U8wfWTp18PgZntg8lzUpRdBy4QAWXc
         N3GD4SBGHV+5U2batcTb8TmWl6EsenC5HT3YsRvjTM+YvqTnAYGb1QeIJAgKr+vPRSJ+
         lm1AKM4HNdTq/HV/CL4r21U9Prduygx/HR2m7bjhI9sNYYQr/XkoQbYXU7xWqFaPGxWn
         1nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725489403; x=1726094203;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=neixDsfWSvKP9NLUVqQFsDa2E/vyWXuFC8jA2RO97Sg=;
        b=WL3585r6e+Qe3zByeu8mQ47F0G29H4vQa1Tmmsi0MdgzgXwIypRKMllOMKB32eRQD1
         mb81p3QwA29zkixJoeGxV1QNC+wT20Oaetyo3Y1odsXfT63eTuoVG7+fbozywssn5Zlc
         hMGAjHFAaRYzvo+WHMRC3WLNBp6yQry4kRm9kLyykT/PZ+a5p+HRrgtFsCHoz+ApvMSN
         PkSy1SxfBoS6FNt62whjABJKF4WXmt7Gh8m2qBnddt49NPBdYlWDOTJkcBQd7VqYFYOw
         qayG8IuYk9nYoMFudWuMdi9v2bE9QgGukfTmyE7FLMxRuRzglVryqz0JGaeoJM/M5fqz
         SsrQ==
X-Gm-Message-State: AOJu0Yxnm0psLviXEx5SRwWirIUZdebkY4FPsEhFViiyRDaji9iFaNDg
	ZBaT+GgePtRJkbxwZsOoZbhw53JQdL8h63UIkp+6XydgxwLv+6i1YNvQOkBojgm5bUNom0oBkUR
	1
X-Google-Smtp-Source: AGHT+IFftUj9/TGj9HoUVfrCkiMl4RAxOhiBwwn7Sg2/RAowDLunzmnStcjRAP7/dH6Q+NsGen/CSw==
X-Received: by 2002:adf:e3c9:0:b0:374:b71f:72c9 with SMTP id ffacd0b85a97d-3776f452fd1mr2706177f8f.16.1725489403229;
        Wed, 04 Sep 2024 15:36:43 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df0f41sm214684785e9.19.2024.09.04.15.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:36:42 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 4 Sep 2024 22:36:41 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <2051722969.176113.1725489402796@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.11-rc1-143-g4e7795eda4459: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_176112_1777319573.1725489402090"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_176112_1777319573.1725489402090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1339 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-next-allyesconfig after:

  | commit v6.11-rc1-143-g4e7795eda4459
  | Author: Kent Overstreet <kent.overstreet@linux.dev>
  | Date:   Sun Sep 1 18:08:25 2024 -0400
  | 
  |     bcachefs: bch2_sb_member_alloc()
  |     
  |     refactoring
  |     
  |     Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>

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
23322

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
23397
# linux build successful:
all

The configuration of this build is:
CI config tcwg_kernel/llvm-master-aarch64-next-allyesconfig

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/234/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/233/artifact/artifacts

Reproduce last good and first bad builds: https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/4e7795eda4459bf3e69c87c793bc34f610f9d981/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/4e7795eda4459bf3e69c87c793bc34f610f9d981

List of configurations that regressed due to this commit :
* tcwg_kernel
** llvm-master-aarch64-next-allyesconfig
*** Failure
*** https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/4e7795eda4459bf3e69c87c793bc34f610f9d981/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/details.txt
*** https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/234/artifact/artifacts
------=_Part_176112_1777319573.1725489402090--
