Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8A1D5AC1
	for <llvm@lists.linux.dev>; Fri,  4 Oct 2024 07:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728025507; cv=none; b=GEKpQYz/PfKqOruTcdsHzxq9yDCF2+D5k4Ik0ePAYhEIC7cUK+xNiNSp9HHc2mRjW9wFqj6N6bQSCNC40G6KpFccI5iy42Iz0kCK1ffArTPnAqr5EI3hGuJZj75XaFsKX4o3nrtyfVmUC/UK1jbcQcVYc8aGx/YagOu7sE12JlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728025507; c=relaxed/simple;
	bh=ool9rJRtdIJ1plocVk4PFmJX84LlS3GcWapjNqJ7foI=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Yb3PYLjVQ6C9oJGUs4mgd1PijKmo5NWXcN1dwwRiMLelwNJqKYutUTV5ZtgVisbYx9/u83UAF26ZpXSo/8yIhU3kDuKYKYQGYZFK2qEpSjE8eEZioHBfE876wXeGSRQ+Igi80HY3GFJy82GCDOOS8eSKorDsCWcQKX2UoQqzWmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YaoH+OMY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaoH+OMY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so255640966b.2
        for <llvm@lists.linux.dev>; Fri, 04 Oct 2024 00:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728025504; x=1728630304; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sc0YswpCWm/CnKCXMCAjzhySm7yzPFIOU9Mh5fTtOYo=;
        b=YaoH+OMYBTAMAnAkHQYotEQ2vsG/wTlSTtgfoHTriGnTh9sSQK1jcUGRPHR0nR9mLS
         PmuO19i12JJlY44Zh2ArrdmRF8rsjOCretOrfg0AaQuea4nOJPPqGsODJbraNa31BeRM
         HF4AE1ibjWHlVytlKpGw8BNbTlerFe683XjJPeUUSl9OEW9ky4NjHDO1SolHdYVdABTC
         ufuwKibju/siBx5OVWrzGplkbKJYzo+CQ9Pn9KtXzxsr1oNxBtE7z0xDHBWIBYPsZ3OI
         uzX+LseiQQO+FodU8mTst9J/c/jnwegmptDrHyAR/OOnbZwbW7wlk5edbi3W8uQUCvuM
         l3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728025504; x=1728630304;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sc0YswpCWm/CnKCXMCAjzhySm7yzPFIOU9Mh5fTtOYo=;
        b=PWh6dz9f4jdHE3nFcST67eZS+tjd9zhiQOv4kA1hC4tvjUQCCqIhuCXwoNqxeW9l9W
         vWitUeGKOadF4DOoyK9ZE5XLtoYfuOuo0InY2U7UOdfmPUpNpr6i7SjkZVpNmdIhB2qq
         jT2uTOO9CYrdjrE5POVHLmJY4SdidOHHBLtbWQT+6xrNE7uEftajGUVR9ZeY7XuzxKQP
         BJrap6RAShim2xu9OFKMYKKJnsqgoEoxE5lSkQs/gGNFbVOU5B79PvJP2ErcqkP0RUDZ
         J+TZDofmb39zmQbYwTiE69uOWHyesrGPaJzJwg9KFGbi4Ku02M68QT5LJSf8FVjvG1nG
         DAoQ==
X-Gm-Message-State: AOJu0Yzh4QkDvvqCL0Uy+80WU3ZYrFVBPZU2xg3yrVPJZkqmOHIJteqb
	tEGcJmJVKQETMyAqESU7hQFOvH/EHWaP9LT3+/4Gb5Cet7skwYDwcjCwYuJzaXNv8Ena37DX4IB
	Z
X-Google-Smtp-Source: AGHT+IHji74J+tec8NId/0yfKmsElVo/L9iv9Ryq2Mmmh2qlg/K+R7g3KIHbaDddO0bujdJM+2UWkg==
X-Received: by 2002:a17:906:6a20:b0:a83:9573:45cc with SMTP id a640c23a62f3a-a991bd092ddmr169607566b.14.1728025503913;
        Fri, 04 Oct 2024 00:05:03 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a991047ed17sm187080666b.171.2024.10.04.00.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:05:03 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 4 Oct 2024 07:05:02 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <465803567.16378.1728025503417@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.11-rc4-291-g16531118ba63: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16377_963231979.1728025502532"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_16377_963231979.1728025502532
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.

We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.

We track this report status in https://linaro.atlassian.net/browse/LLVM-1375 , please let us know if you are looking at the problem and/or when you have a fix.

In CI config tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig after:

  | commit v6.11-rc4-291-g16531118ba63
  | Author: Denis Benato <benato.denis96@gmail.com>
  | Date:   Sat Aug 24 16:11:22 2024 +0200
  | 
  |     iio: bmi323: peripheral in lowest power state on suspend
  |     
  |     The bmi323 is mounted on some devices that are powered
  |     by an internal battery: help in reducing system overall power drain
  |     while the system is in s2idle or the imu driver is not loaded
  | ... 5 lines of the commit log omitted.

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
25729

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
35395
# linux build successful:
all

-----------------8<--------------------------8<--------------------------8<--------------------------
The information below can be used to reproduce a debug environment:

Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-mainline-allmodconfig-build/216/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-mainline-allmodconfig-build/215/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/linux/sha1/16531118ba63dd9bcd65203d04a9c9d6f6800547/tcwg_kernel/llvm-master-aarch64-mainline-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/commit/16531118ba63dd9bcd65203d04a9c9d6f6800547
------=_Part_16377_963231979.1728025502532--
