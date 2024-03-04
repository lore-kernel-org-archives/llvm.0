Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D417565
	for <llvm@lists.linux.dev>; Mon,  4 Mar 2024 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540996; cv=none; b=iPdhCzAk+r3RiEWWxhdhyu1l5nioT1Id8hI/le07UHRsPQDqkO0Zvm8RFClLcvubxX7gnvNc3nomh27X27ng8jPA877RSYPI8vkzy6TGTRqTevN3lXLhiBJAHuiY+eL4IDVvJ9rSpU1vWo+BpEhBp5GWq8fMyBbKK254fZVb7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540996; c=relaxed/simple;
	bh=855HXyumfO4lGoRTJldMzwX52GXeoZJbsylC1zXFQTU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aLkkVrXeltHLvLUdnMetvYEgZ4pJXahD7OkgNmNwHNloWndm3Yyx7WtYntyljP1jtTbFlmRIFM1LWY1MsNNG8YsvVH9eVGF0Mub07GX4cihtouDub9JN+7CaOMx6kS7X4Wx25amXGjB0bGAzpxIbHDBt3aMhaYnQu2dTPCNAsI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YgrMO5+v; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YgrMO5+v"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d37114045bso159915e0c.3
        for <llvm@lists.linux.dev>; Mon, 04 Mar 2024 00:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540993; x=1710145793; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o3GGlCV181E94WRidZ0LVeyv3WpChZrfj0kDrJP16hM=;
        b=YgrMO5+vNtgNhBKHZCLRm303HZZIbzwjNkrip+94JRrOrrj7srjiZqibpD/uRK38KO
         ORfJa9UZS67/OHiM8/bvpE+4t02ha3X47WxaYxnG1TW4o/FIfy50r66OzrF9mQULr98T
         hPz/YURJWiqbL0b+VE+ovKXNUS08weEXIfa0Uqxo2wz7tK40JuM44gdArjhQZkKRmli2
         Bfg7zj7zkAVMt6QZ1FU6f/q8uakIpSzuYF4h/fsX1PjVlf6T0CB+qFilh0bLIRI1Bmvr
         j+l7CHk0rLSIA3tNI79Ck+5SMaKVAA//v8p3pyyRJjITg1qD+DOEVpNLDtFhdsqNe4n+
         AArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540993; x=1710145793;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3GGlCV181E94WRidZ0LVeyv3WpChZrfj0kDrJP16hM=;
        b=BUrmAXWHXN+Wp81QGwWHDbByLLkt7Ef2Vi8mais6s+fPbcF/XL4zWFT1tItFHva23a
         FaSWVH5RbSOG5B5AD3RRe0ZhGfvkMboeQj7hfjSg1IV8cdUBfGj6sD59bcdUp8URotl7
         aVcGwDqEArxroO/BWhoOSR/vM6Z2VnlZLRkanDqZn3/Khl1OGY3krEMKjVwVYgPC7TLg
         Ye/aXkPMtDvDbgWWI8FSFv+YZhdPWilUwGqN8I+LeZNpNQsY0gkfP5WDPyxIimg8f7Gt
         fMnEXM1jpHnTQpdYkaodRwSAe0rG5s5IDp/KRVy9W7rh0i3uz7/lCfMJJZDdrwNqWa5/
         Lxew==
X-Gm-Message-State: AOJu0YydGBRls6Ve3qBy3h9kLqbaVYHfCIXPFKVukJPldDGFQXuRhV8k
	37q7hoaHzVVfSkelgAitZHF4r19oNPbhsLoZBm+UCGk58V7q8fO18rUpLEv4hgvzC1Ck9csfDgP
	Z87OirEx/T0v99WXV9YbxmaecBoMw8JUhT6SElI0kPZyuTuQIUXA=
X-Google-Smtp-Source: AGHT+IHMSOeh5GY6I6DXd64OZ9n7Vyuo30pfgw0GakfsMx5QkuNzPAp++atjVb8SFBMEn59buE99Z2AdIPWEWcDK/iQ=
X-Received: by 2002:a05:6122:80f:b0:4d3:4ac2:29f4 with SMTP id
 15-20020a056122080f00b004d34ac229f4mr4865194vkj.2.1709540991914; Mon, 04 Mar
 2024 00:29:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Mar 2024 13:59:40 +0530
Message-ID: <CA+G9fYuxkL=naKEvQtGtgLq9aemoO5i4q=D3snaDtnQMnbFj8w@mail.gmail.com>
Subject: include/linux/vmstat.h:508:43: error: arithmetic between different
 enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
To: clang-built-linux <llvm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The x86 clang nightly defconfig builds failed on today's Linux next
tag next-20240304.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
In file included from include/linux/mm.h:2208:
include/linux/vmstat.h:508:43: error: arithmetic between different
enumeration types ('enum zone_stat_item' and 'enum numa_stat_item')
[-Werror,-Wenum-enum-conversion]
  508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  509 |                            item];
      |                            ~~~~                    ^~

Steps to reproduce:
 # tuxmake --runtime podman --target-arch x86_64 --toolchain
clang-nightly --kconfig x86_64_defconfig LLVM=1 LLVM_IAS=1
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2dDE2PIbgOKyvV21FDe74HgYh8l/tuxmake_reproducer.sh


Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22918589/suite/build/test/clang-nightly-x86_64_defconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22918589/suite/build/test/clang-nightly-x86_64_defconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240304/testrun/22918589/suite/build/test/clang-nightly-x86_64_defconfig/history/


--
Linaro LKFT
https://lkft.linaro.org
