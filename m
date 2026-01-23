Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CB925BEF8
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167589; cv=none; b=CbalHEf3v7THHd/vFRHbDW8toPwwprcYbN42JvUFTGOd8uyXuqHL6wf6AajZbV2dzqCVanIsYyWYT6MC62/ujJgm38DlBJzVHl7Hy/d3qYUiUQ9yxhhq98vOUAT0rwbj+kj3eephxfRmR8etgnAaz7OdNE0Jo8D2YXqtPAk+L4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167589; c=relaxed/simple;
	bh=XZsK9+tkZbEwBdgD6zjG+sJ8pV5Lsbt2U0DdToHhgBA=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=O1V/jnvGMg+sBF7iQx726AprfpXWwhcz50YYU5+ka86cKzR+6Ed2BjlVuNYkLKM/LAxX8/rVbEmCMunfY6/M+wVwcwvs9XYTUmIAzmMaPjPnNfpNpIii7OmuyOLyX0VBbroXFktd4bea5wWsjgMWwdN9IBLYm2P4AjmZGCEIzlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+IZEDNf; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+IZEDNf"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so15674755e9.1
        for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 03:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769167586; x=1769772386; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TtbaPnswRaZBUtUuzoVGqya2fnLQWociKxt0G+Y3L4=;
        b=w+IZEDNfCie490+h/0PeloXxqkm+ul08Gp9gSxBsHMNKf6mdC7cTYjkuqQ2wa2SG1y
         Wmvw1E6vMYu51rJYWZjQTQsalOaXbful7ON4ynmY221KGKd8GoD4uwhQy8H8Z47qi3gb
         jg9q/0OAy0pv4RW0uRSB2ZrejpqkCzTJaqXkvPyUtwBvowfVstNIl31zv3YOz9gYx/GB
         QcOjx0jo62K4oo3k04rVGB/xm3rWT2+bv3ZaYCsSa5/rZ+VzkDn1yASTr5xDB7LaWOYx
         4iqHPt2Uut1+syXHrbBmnGmDaIm1MOHuyHpCSdlnfwvckb9JsrJg9FA69mYAYNs1UTUP
         eg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769167586; x=1769772386;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TtbaPnswRaZBUtUuzoVGqya2fnLQWociKxt0G+Y3L4=;
        b=Q9U96E+Mha1ymKiFWxWHaAQnUhWXqMZbaXS6K17hfZJp11Gl5uJyxVfrwZySwVrWsK
         dy1xV8ko+WUCT0jreVXsW3AuEZ5k/OLSWrAI/4pooHFM0f+NWxhsYZTSGC+IZxrLyPZo
         3z4xj2pTjXwyJPpchbpqc3hfjQU76IE4r0mUQc2q5tqyw5FzrInh3m2e+Izk9tYZR+e4
         YpIsQ5yFnxbaO5Bx3UwCRyII+6a7kdppe9RKl+Y4Ea9Cilc+bfuIBZYJ+FLTbE1WgH9l
         DKQNIz5qQVO8Lr6V8/mnIk7lstV3dZksMjVAHVgwN94CLma93p+56nDxt4BRyHFr5dnE
         HKZA==
X-Gm-Message-State: AOJu0YwUgRfPI2KaDJudVjo3UJX6DWD9Qp931EshzD+2CJ1WtjW0SuBR
	Zlm7qTXufN4BJ4TtUwP0PWwwOEu8G/qPhGv6dzw1jPc6CwDJCCIc+ZTSXlfNC5fUXaVyjTW7XPN
	1vpOVRYI=
X-Gm-Gg: AZuq6aJaacXPTzY9T3mqvBdmWKkSRpE+bHaXW2VNooUe+CKsl61YLQULpZM5GQj42OG
	tsCSNCHWAIkZ3tFAUy6uR/Frzo2dHkWimmZVdiLF7/0bI5lAgnbsPgyhfdo/BuOw9DzRfa4+AP9
	6w+qbUTVlX+C0Y/wTn/vSRLK8RhISr8Ny7COO3y6+pR3VfoJupgpSMPIG8xykG0doUD4DImxcwD
	c1Hs+ZLRcDnGdA/1GMY/NXiR7lKF8BgFtKFcMc7NMf/NUrXMXrtZ77clmfdd6ibWT0QDRVAs/57
	Urda5NX3K70os5Zp0jBDujjH7ne/3qY2SmyYt8Rv4dBM6yFmtdgZAIFNk1y4sjeMreKvieqKTOL
	TTJ/n/jDAgrGDuSvPHT+KL1shOH2hEuqUkkwWgQNuZ2bL8eupXPUqKRnaufY8wRsZCu4OCHiveK
	hADH4+Y8JWiUdYPDy7c9QFgy7BcWojzhVEDlGchAtEXAH+l13Xi9nZu2/gMONYKl1Mn/eB
X-Received: by 2002:a05:600c:5298:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-4804c96513cmr49140125e9.16.1769167585742;
        Fri, 23 Jan 2026 03:26:25 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm192165515e9.2.2026.01.23.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 03:26:25 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 23 Jan 2026 11:26:23 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <896020150.20734.1769167585283@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.19-rc1-321-g52ebfd8d2feb1: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_20733_1101602343.1769167583303"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-defconfig
X-Jenkins-Result: SUCCESS

------=_Part_20733_1101602343.1769167583303
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-defconfig, after:
  | commit v6.19-rc1-321-g52ebfd8d2feb1
  | Author: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
  | Date:   Fri Jan 16 13:57:32 2026 +0100
  | 
  |     drm/panthor: Add tracepoint for hardware utilisation changes
  |     
  |     Mali GPUs have three registers that indicate which parts of the hardware
  |     are powered at any moment. These take the form of bitmaps. In the case
  |     of SHADER_READY for example, a high bit indicates that the shader core
  | ... 32 lines of the commit log omitted.

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
  | 9358
  | # First few build errors in logs:
  | # 00:32:38 ./include/trace/define_trace.h:118:10: fatal error: './panthor_trace.h' file not found
  | # 00:32:38 make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/panthor/panthor_gpu.o] Error 1
  | # 00:32:49 make[5]: *** [scripts/Makefile.build:556: drivers/gpu/drm/panthor] Error 2
  | # 00:40:07 make[4]: *** [scripts/Makefile.build:556: drivers/gpu/drm] Error 2
  | # 00:40:07 make[3]: *** [scripts/Makefile.build:556: drivers/gpu] Error 2
  | # 00:40:07 make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
  | # 00:40:07 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2054: .] Error 2
  | # 00:40:07 make: *** [Makefile:248: __sub-make] Error 2
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
  | 10839
  | # First few build errors in logs:
  | # 01:14:58 make[2]: *** [scripts/Makefile.vmlinux:100: vmlinux] Error 1
  | # 01:15:00 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:1276: vmlinux] Error 2
  | # 01:17:48 make: *** [Makefile:248: __sub-make] Error 2

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-defconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2166. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-defconfig-build/334/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-defconfig-build/333/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/52ebfd8d2feb1f37bc75c6b662b620323de676ea/tcwg_kernel/llvm-master-aarch64-next-defconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/52ebfd8d2feb1f37bc75c6b662b620323de676ea
------=_Part_20733_1101602343.1769167583303--
