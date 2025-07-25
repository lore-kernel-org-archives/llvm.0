Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41E275AE6
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438851; cv=none; b=XecddankJJfqKlNzJnE+UuF4t2tAkAn6pDBLPhciw1LGh8kNikZBWFLh364tz4NrM9hUzWhX7gcapgfi+iADar0ILa8R7vMaB3eCYpUDHRn3qcKZu1mvlWsMVKLsuyb+wZ+icHNOwUykF9Urn5gIwYsKn2SmG+B2h6qRRUF7zWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438851; c=relaxed/simple;
	bh=I4R5djMgHXCDLNxSr5Fpt6AzfxEGk1akVjsAzxKqDJo=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=jbsmi0gzDLp2i8YLCxtSVPcWOXBUkUeNWUepYxWfbOqgusUEBmSgm6MWJlf4HwF7Zlr9HLy1R8aiibYF8yBC80S7kdz6jPYcYzi2mElALCxHZXYcpbEOlD+MA8TZcdmG4QgipUnep+sC3FDT/gVvKyKKsgv7S5PNfTBphSQad0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIi886BC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIi886BC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aec5a714ae9so265070666b.3
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 03:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753438848; x=1754043648; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHAf8qKEO666L85E429TRVuJY0X72RF+/KbwOv9/42k=;
        b=WIi886BCJRRvA3uli69Su/uQu+cFZd/23MGPcvirwcZNqu9oClHJJt59DxIAVaBJ1N
         R1Q1pz+ZjvlqkvMBbagLDRalXdvfyVg5Gc6PmjT0YMRKsbE2/NSy156omy9GRLxQOj3k
         J4aSWizMibZ/7vIWoJAxCXplPAofipJdGPLfqAAJK7RAMsiL5u1EkjR7pguidDuOFrcd
         N+gv5MLG/eexZdnv/ph3K30pK0TpFRPZFSsBahHDxKLOjhZBn5HmN3Rk0YZH74mHP+1e
         ppEHaDV2m7L5V+6fu+Mbs5uonrgqoqZuCIritwzMRUMxFsiVGbfFxrGnsf0x4D/3NsKm
         OufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438848; x=1754043648;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHAf8qKEO666L85E429TRVuJY0X72RF+/KbwOv9/42k=;
        b=CZvOf+zHFt2JnhtIyZRaRS3eKFX+HfZadaaWMV9X6nFozBrMREc1EY5ZZmTuWJqAem
         pQitPeMt3UnVNBRx69kZPNthttLrHLahFhbpOu0mkqtx035Z3mHD8/JOK9SEYtEFur0B
         qqUEeLjSEq2LD6eZnryTUxkMQnchHGozT3yr/8NZwkA0/L7gSpuYERj7BciRZg7am10k
         l4pm76LQsMRPlquE6aEEfg90UUbjUTGPV8JxutZqC6XG5nxXdHJFD9hv3UyfsuGorQ2r
         X0h733qNyQs+OXH88ZClOn96glc2dOqCQ8d1PHH/4KOUZAQfCs2pTG6Q5f//8q27G1JW
         S7AA==
X-Gm-Message-State: AOJu0YyuCenB3bDhd5JdA2vHL0rw9+0k/FqHhz6949Kt9M7LcFY+3gl8
	e8www3HSJMvd28K71GgrIDtBfwA/ZcSi5drgF3EH1Bz5ZbfKTAj1cZdN52vemnHGMJLpyMqgmgc
	HNHts
X-Gm-Gg: ASbGncucookixZevP9oAhowuX2V9ZNXKTd79fipsaZl/HjRfQyJaGWBLSogYeLApak2
	+2QyjOK2647F6TA2PV//02/UGo8bl8e4BWv2NXrzqk+sVumXfzUQ0ipcpDFzbTgKrK55zHt05sF
	GHeusyFA2IwKgL7h8DA/G3HafLaXhJnMXBFZuTNaEygpMIdKQpYe3/x7MKXvUUJMQ5AyLpG1H8Z
	37PArUH/53W6/6288lotRBBcBk8e0LWelODTkO2qvYlnIq0nkolYDoQPA/55z4kbtFjyxyvykhx
	zNzfO4M3LjzN1JPm6DvlUwIO9fJsSFJ4qGNsJl3XosjNde+2txjJ31NXT3ogWpxbL2qgCPtWBn7
	g7QZLjTvSmi5sPnhJ7VMZHqdD+gJmKW7Dh9dVSIw7i3k8o26T7z+zeSJwayNBbDcluF4tdA==
X-Google-Smtp-Source: AGHT+IFtgslxjiLC6HprhbsQLlVuqhTw7Y+8L8nshboSx3Jltidxw1NEFMA/G3Fj5Yzls9aDSJJPNw==
X-Received: by 2002:a17:906:fd86:b0:ad8:85df:865b with SMTP id a640c23a62f3a-af61e14609cmr145791566b.33.1753438843481;
        Fri, 25 Jul 2025 03:20:43 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd319575sm1932160a12.51.2025.07.25.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:20:43 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 25 Jul 2025 10:20:42 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <511735629.4138.1753438843098@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.16-rc4-7-gb3a88225519cf: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4137_1525108411.1753438842452"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_4137_1525108411.1753438842452
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allyesconfig, after:
  | commit v6.16-rc4-7-gb3a88225519cf
  | Author: Dan Williams <dan.j.williams@intel.com>
  | Date:   Fri Jul 11 16:49:31 2025 -0700
  | 
  |     cxl/region: Consolidate cxl_decoder_kill_region() and cxl_region_detach()
  |     
  |     Both detach_target() and cxld_unregister() want to tear down a cxl_region
  |     when an endpoint decoder is either detached or destroyed.
  |     
  | ... 28 lines of the commit log omitted.

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
  | 23092
  | # First few build errors in logs:
  | # 00:46:24 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
  | # 00:46:25 make[5]: *** [scripts/Makefile.build:287: drivers/cxl/core/port.o] Error 1
  | # 00:46:28 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
  | # 00:46:28 make[5]: *** [scripts/Makefile.build:287: drivers/cxl/core/pmem.o] Error 1
  | # 00:46:32 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
  | # 00:46:32 make[5]: *** [scripts/Makefile.build:287: drivers/cxl/core/regs.o] Error 1
  | # 00:46:35 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
  | # 00:46:35 make[5]: *** [scripts/Makefile.build:287: drivers/cxl/core/memdev.o] Error 1
  | # 00:46:36 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
  | # 00:46:37 drivers/cxl/core/core.h:64:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
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
  | 23186
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1733. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/335/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/334/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/b3a88225519cfd05d71b99946d37476c941145b8/tcwg_kernel/llvm-master-arm-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/b3a88225519cfd05d71b99946d37476c941145b8
------=_Part_4137_1525108411.1753438842452--
