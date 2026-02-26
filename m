Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9CD314B95
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099672; cv=none; b=H1+7pp8rtxdRgpG0Ol4cdQkkyQpSEbUbVvoQ4bN3/RN4NN6IhoyiOneELvBYmI9DxKCivvmLQhD7ViZbeEn9+NyjLC/Uhd2blWEIW8YcOI+y3OIeC6XEGFNaH2E1kHnurj8flhds4iJSUc1wui9MxB67W6CCYpUj7yKmu7encpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099672; c=relaxed/simple;
	bh=qPiNTA2/vt2q1V9Fugqzcmlvd6NZvxm95K7c+rDS2ZE=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Mu5raY6TNWIA1RGhHFzZCWPeZL71S3Blr26NSLI6oTKR3mjmNdORTNgbPIYNgN9JofE8iEhJUPoxtkS+60HGmN/ulYQfIQL6Fuhc48j+veMIxo9P7kfsEfRVisOQ89ISJlzcVmw2crnMQdj8MMO89z8F8Ok7c/SSsK0SD0+iUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zv8UZu4l; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zv8UZu4l"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so8127345e9.1
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772099669; x=1772704469; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LzrO7Z2qcZY0jlnewcS+DmZXpBFG8MXS2WarLhVkXws=;
        b=Zv8UZu4lWZqeP2d3oAH2mua6ZRVno8hhlfqleidgVcIYHMxwIyVQkHVGlXqeFBwkNs
         Q/JSKh//Lcw75/cIg9SidPwUJpEMMdZkQcyyY96LwPg5xnikjmyOizKIOJKrYPV1eEQN
         NH3T3kp1hLWS/sD+tCVJmM1yZXd0+QaO5dU3jTtu5waNKkoZI7OnARwhooBA30q/usry
         z3jhcIrRthHLwDW3sy4Cj9Ze/o7h8QuZD+cxktyrCohX0Kpn+y9VtNaGM/Hc4tF82r8h
         fnNRLBVFSMSNtm/640q99AubN2xAIyLPRPt0/67sDOD7P7NFT/s4YV5AQ6sRSiTZm76E
         J7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099669; x=1772704469;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzrO7Z2qcZY0jlnewcS+DmZXpBFG8MXS2WarLhVkXws=;
        b=X+rCzBFoK4RbnLyyNFLSTCznpLzwmflYr+80KfZ5N6Y1NIy9C7RwjV5Dk+bPsCS66z
         +p/KRFnLht5mAUpe7oT1PJ4i4SpCKixNmAj3RTY2oDQtmybhPiQwbnj5cEety2cO56B4
         C4tsEtyEgS66PlqsGaqrVwHxznlQAkuZpnOH09FhtvKCrNH8msWJVyaOyCDqyDvb4aiL
         v4O+V/jRXn1JeplS1LaisxPjA1Dz8JP6WzkJCyoNSHaJtU7fIUeosQseLXxzG+WCP/+z
         +P5Qfspcao03FfCZihcoy339gIW12jb6k8bN+p1fPd0i+A9tmbHzHM02pbYug+xsKwZK
         h/iw==
X-Gm-Message-State: AOJu0YxAVlWNl54kKxFeiBxWupMd7IHhXOflCmb3gWL36inyVF5bL2eV
	h/m6B2ligCUVZr5uRD5INYb83S4n0SLfkhis6U9a3bcGYBQjaYiGSsRWg/ardhBjhNGQcqjpemU
	rgKFyFRY=
X-Gm-Gg: ATEYQzzpXXjPEwI2H8Ju8puMuF7fLN9gbaVFKuEMhoFadJO0GU8pqFwr6NjeL4zzGzR
	VI6SJRb+a1R/ZUFRf5yoxfkg3I9rmUBa2yXlzGJ97uqK0LmQ5Me+sMB0Oa9OGBE6RfJKKNYJlVM
	uAOLtLtbGzTAGXDtavNIiG4EaFzt1GAcWy+PemmGg3U7iGbtvjq0HMulbL6iAHGTTb8nscPIbwi
	qRNdy52lSxhLEWGLu4Cb8i1sujkenqJDZL17zsdzOm6F6g6iRbc2yi/PG15ZVlR+zh9VR3Yr6O7
	x/xFuaDOFbxdp/3/uMv8tj20tq/rmsIaKaBnAG4Lc7T38BSBs9ggvFO43rk18SEkuPjY/tn0E06
	oDyLyIjJD4yQUNYyXwUyKrYZpoqLzji8edRr41W8ulSlt2SFCeygrXjyrOVfmTRMeJKkSzWCedd
	r1JtDCgD4xfp/ms1E5cg2/zxZjOB+It/nL+gSxmDN1+FWs7peOH9YyOSJjaPFRcW3cJ5Ayaw==
X-Received: by 2002:a05:600c:4505:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-483a95a854amr326907115e9.7.1772099669272;
        Thu, 26 Feb 2026 01:54:29 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm143117785e9.13.2026.02.26.01.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:54:28 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Thu, 26 Feb 2026 09:54:25 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <153019050.36877.1772099668879@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.19-rc2-729-gcbe29da6f7c0d: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_36876_653247032.1772099667741"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_36876_653247032.1772099667741
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allyesconfig, after:
  | commit v6.19-rc2-729-gcbe29da6f7c0d
  | Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
  | Date:   Wed Feb 18 21:55:48 2026 +0100
  | 
  |     drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
  |     
  |     Add basic test cases to check outcome of the fair VRAM provisioning
  |     for regular and admin-only PF mode.
  |     
  | ... 3 lines of the commit log omitted.

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
  | 23586
  | # First few build errors in logs:
  | # 00:35:13 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:22: error: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 14940110848 to 2055208960 [-Werror,-Wconstant-conversion]
  | # 00:35:13 make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/xe/xe_gt_sriov_pf_config.o] Error 1
  | # 00:37:54 make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/xe] Error 2
  | # 01:12:30 make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
  | # 01:12:30 make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
  | # 01:12:30 make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
  | # 01:12:30 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2054: .] Error 2
  | # 01:12:30 make: *** [Makefile:248: __sub-make] Error 2
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
  | 23667
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2182. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/416/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/415/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/cbe29da6f7c0d0541ec135e7292b35b97f8ca402/tcwg_kernel/llvm-master-arm-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/cbe29da6f7c0d0541ec135e7292b35b97f8ca402
------=_Part_36876_653247032.1772099667741--
