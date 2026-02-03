Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC51DFD96
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078777; cv=none; b=ttCAuk/0Qy2udRCP7xlb2vHtEVfMZOXxCvi0Q1VrHA5GTa/q2fFSdCQFyQm8y62mq3ETU3+cpixoO6m3Tiq0QPLnNH7/f4J99j9TEFZOIM8MZsbuOehtCme985lXrNNjNR3O4NDHbNdMEKo38g/9izxM7oc65sBRwTWO9TJKK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078777; c=relaxed/simple;
	bh=R2q5JAF+Sh7swULOE276AMLVexYwjDaGJ/ee8tCQUio=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=tUwwFMiXr0B71se8pJhgdTW4VkF6tSTe98uXAReBt0pJea1Y5KIjE1NawDsc2jhie01R70P+iskWNyharg9n55AM8HNBlDygvYWs526+Gh2dw1hUDuXoxno1iXoGwAiVdLDwnUtzybfXHU31KoC6ejM8qWyEVbcLuE1gnnLPx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uVsDdV8T; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uVsDdV8T"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso38519215e9.1
        for <llvm@lists.linux.dev>; Mon, 02 Feb 2026 16:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770078774; x=1770683574; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n4dIEQ6u1md0u38ird31hKspsKoUV3Nu3YVKg3DgGL8=;
        b=uVsDdV8TQimW8q0biEFUsziSlj5A2Emkip+Gclt+2zVkjQxOB6hej5Vsm/BisxMkUc
         t0hqQhAt0nHoCnU8lBFnbdYL8HeoeaOr59rXp1i5Omj48K1m0ZTa7GLIYzmQQ/T9fCuk
         CM1/zuvLCLTC6o1hHlkqFGU0k0ZtTvTV3+WAa9i+afIE4QERA4MFvr9iRb6RhtcS4nsm
         /4SBsSSWU/5tCGguWEC7SRMTjBdN58ZORt8r9X1evcLHRJB/wygIt3pTHvbBd9ER4QKt
         B1OW7rIh8RHsUEDTQ5/9dcdGU802oTO8SDgfS8LCl/kqS4J7ZfLHjNOPGL6tLbv04Zrx
         fXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770078774; x=1770683574;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4dIEQ6u1md0u38ird31hKspsKoUV3Nu3YVKg3DgGL8=;
        b=CAmzfX856wfbcPY348AIlpzjcP4BzgVmOSJU/v4W+k/AQWgyVdkmCNp3pJ6fJTAoLP
         NuApOdDp4Oep1K/ACGD19DvQWNr4pGMmybLpY/gmQkJlCJGV5cf1WnzJehCfqqo+pHh4
         tQ2X49JILXKl0b1nzBkHS1s65d1CW+hRe3UEAsq8fjzM5OuQDeHEy7sZB9dzkdAq92aC
         DU7tvKLllLvojL974OYzRuaZ2fjw89r1JWiO0CutYZDIQzAjdXKuWtmQObvylnpRGmVg
         1DhXbUAdesRLReArhDqymler5Mtoka07+j9vz6cJRVVqbTH2QeKTwSsUbW38RzqNkdYv
         GfRQ==
X-Gm-Message-State: AOJu0YwuUh4gFNFkbqGbVwsAqy7wHXvfNsoCJ7PcS4VlFwTR08aMsnFy
	X4ysktyF+9i4K4I3ApEOtdPL/X1FT9ngJ7qhcD0E14n3qPMc43rib/pk47rr90qf2Z6ziYS09Su
	FrhxC3aY=
X-Gm-Gg: AZuq6aLPbUIzRfxo8u38mOtR+k/R7l2nTIgArihGtnNyuCSCc+NV0SGr+YxTkkY1fzu
	8VBrLP5uDMcvrf1q0+dQbMmY6r/Fmf4vEPN+1ebISI5clRdRvDP+oEy8kU/aIR3+uExTJG1ZWO2
	ICBnem458wzOyBCva2rDwOCsdk6nUQd0X/st6CxRc6I5Ds6RfOxjmh1lnTrfKVBU3H5zIv/Uihr
	XTOtNob02SHW8V5S+b6SsNQ5h9gYgrgX5ZIn74i1tzMd2rHWg7rAl5M/qYh/lFXxxiZGr3tziPR
	pM4CCSUUcJSCgDtiiUaTEcqoO6D1g/sEXIGcaWXLwGbFplk2UXFvhsUUyn8qgm7vuhDrFInrBEM
	g/rfJOF67ClrWToFVy5KACLvhnseEtZSgUUfJvSvmBW5QtF4nj3IWk4zYryyk5kWtCSs78f28xn
	mTouRvpNjGsZvIH7aga6ZnG9zzO4t9j3nddV/+OUpzk5tVZGU/sUmr4rtBH1kFoQjlFjam
X-Received: by 2002:a05:600c:859b:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-482df17bd2cmr133308785e9.20.1770078774491;
        Mon, 02 Feb 2026 16:32:54 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830511bfc6sm43809165e9.2.2026.02.02.16.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 16:32:53 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 3 Feb 2026 00:32:52 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <50756891.25671.1770078773988@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.19-rc1-1-g0f5bb0cfb0b40: Failure on arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_25670_402626143.1770078773108"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_25670_402626143.1770078773108
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-next-allyesconfig, after:
  | commit v6.19-rc1-1-g0f5bb0cfb0b40
  | Author: David Laight <david.laight.linux@gmail.com>
  | Date:   Wed Nov 19 22:41:26 2025 +0000
  | 
  |     fs: use min() or umin() instead of min_t()
  |     
  |     min_t(unsigned int, a, b) casts an 'unsigned long' to 'unsigned int'.
  |     Use min(a, b) instead as it promotes any 'unsigned int' to 'unsigned long'
  |     and so cannot discard significant bits.
  | ... 33 lines of the commit log omitted.

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
  | 23576
  | # First few build errors in logs:
  | # 01:09:34 fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_687' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
  | # 01:09:34 fs/fuse/file.c:1326:9: error: call to '__compiletime_assert_687' declared with 'error' attribute: min(((pos + len - 1) >> 12) - (pos >> 12) + 1, max_pages) signedness error
  | # 01:09:36 make[4]: *** [scripts/Makefile.build:287: fs/fuse/file.o] Error 1
  | # 01:11:30 make[3]: *** [scripts/Makefile.build:556: fs/fuse] Error 2
  | # 02:03:25 make[2]: *** [scripts/Makefile.build:556: fs] Error 2
  | # 02:53:56 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2054: .] Error 2
  | # 02:53:56 make: *** [Makefile:248: __sub-make] Error 2
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
  | 23657
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-arm-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2171. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/404/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-next-allyesconfig-build/403/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/0f5bb0cfb0b40a31d2fe146ecbef5727690fa547/tcwg_kernel/llvm-master-arm-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/0f5bb0cfb0b40a31d2fe146ecbef5727690fa547
------=_Part_25670_402626143.1770078773108--
