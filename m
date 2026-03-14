Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8A7125A0
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522049; cv=none; b=jv6q0m+fbFL6idc79Qw9g/q+9rC75vRK/UHO8ormc9+Sa9zEJX9j9NYhKhORhUwtSCL6fURCsLLQXP0vfwFBn6vRCdbMGLUh6ynx2oVcqbgaXfZ7sF5KEhWlokt2wEqQ9As+sVx/JghuQT+mgS/7q33RThkLfNbeWI5NG5XMbDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522049; c=relaxed/simple;
	bh=HvK8DCYq7ftY+IqAjZoph+mhMslUVYNPgVGSEMfb/kc=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=g45T7/FCPqnnywOhrdcxD7PMcxIrpgZqEh7jh9PTblKdLVlqmdaR5yiK+cuSJVz7uMUslXVXmE0Lvy9PnRHLsbMEVTmyZhRVeAXa4tr14jvP5JHK7u99wxQEeJtplRXMkiEdqdjMcd1fp3UTrM8XSEXrBUadMPqXNucgFt6/H60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGl+oKJe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGl+oKJe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so38705255e9.2
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 14:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773522046; x=1774126846; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UzYFnz5Qj7jIdELXN01x+T9fD8wn1N0N7euC1Yo9rtI=;
        b=PGl+oKJeWUOnvUrz8CCenehxS3U7iCAs9hpPNC/E5hcuDoAbr6LPwr1c2JoWNb+CbC
         LTWFY1K4EMgJoD5ZN0NRWLSDdYSr4XwX/eeNyA2PpwWF51Hg8kBuNvMbAgPLxoig3O8R
         DL5RsZXJ2klVu0XVUfGcd3mT1xYqW0stf1WCPt24IjtZ1Acvjd3SBCchHgpbHbNORZ8+
         ceJToP2gO1mgIi6yMkaBelogez3I9RfoKv5bBuxQ5PSWqtr+mQHxWffGE6McTWgtwqWM
         lSe+H7MEqclVRWwmQhi+EbTSS6G7nFp8+y17bfxvHZCZy7rgXi45G950/bb6p6qvyBu1
         Zx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522046; x=1774126846;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzYFnz5Qj7jIdELXN01x+T9fD8wn1N0N7euC1Yo9rtI=;
        b=MY60x6CSLmK5MrLZZvqwbFIAs+sAOg/1pfNJUwfJ5U1cWVxRjJIdVRdE3NQtPT1JLy
         z1pFIODM8wG/SKKQh0mysks1vIpBvEJiBDNsk2cxiSg22vmpg7CzszLeo+wRW1JbrXrh
         TUXzMR7AZFh3hcLLyfcF6vCasbH+GBXRhEZz/DeJlph4SZGKyXgVlLdJMOTK6dfZUld6
         6tVwsHpw8RCDZftxluVmHXhJke4HIYrxxh/JJkTTA2IWE4AXNk4+ldcjDDYDdXP4OsTx
         H9dqetUv16pZpLEPu/u8HS+CxVMuqIJSsLkgqwhnfvQZtn16yKruFre7ydTtl9cPtHQ4
         qj6w==
X-Gm-Message-State: AOJu0YzB2p97lc11JG9ReoErx+bATzgdW845VLD9Eu2/eEAWDMFU9t79
	Atbb3xKrcQkCWc+Qs/1XL8JLNWw/7VGvgM4wJalbkNP0b7ei8jnvL17GbIc9VYt7oAcQr122eRT
	s25B4
X-Gm-Gg: ATEYQzxSrcdhR/7hCPyJDQqeUYDDdfGfSCKv+7oI5BfQkuKrQv0jJ3wR0qDU+ZlPk3f
	SYlbnfc1xHwwKq48rJK+5TJ0W50A5g8hNiJ/CS8abO5hspyj//O6H2mPd0UWEwlppl+2FXEm94W
	40LNRmHekjvTMY55C7c9NEDSnhfwFO0bMogUpH96aFK0VZ0aufyLx5GYM6gmufF3ew+WcGAu/Rf
	VlGAy5Ou2hHejhQ5S21yTeNF/zAnRKTJkJTSGucO8hu8Tt2oao3qlk1OzWICAOJ62tMVTTxFboJ
	Mako5syoNsldoF6StWwdEYnCJl60m2mVA2a2uRozRTohbvYFL2VA2DXIoSBFFOpcYkT/K9mHSZ+
	lKCJADoe2sYjUi1lK3Yt4hG+xuYo6zt0KhLQV7KJS+IqatFYvtDOIjfIQYTjYXH+e1stOg+cnXG
	SlwKlbAkiC9945JYg6Ltl0KEidgntfWh1wCDAB5BAXmeUxJC9KxV/+EfzFhg69cQb1Dgc7QQ==
X-Received: by 2002:a05:600c:c0c3:20b0:485:5981:1411 with SMTP id 5b1f17b1804b1-4855981166bmr80861145e9.23.1773522045637;
        Sat, 14 Mar 2026 14:00:45 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485577835ebsm100427915e9.7.2026.03.14.14.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:00:45 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 14 Mar 2026 21:00:43 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1977231884.48273.1773522045160@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v7.0-rc3-18-ga717943d8ecc0: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_48272_2038541687.1773522043985"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_48272_2038541687.1773522043985
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allmodconfig, after:
  | commit v7.0-rc3-18-ga717943d8ecc0
  | Author: Vincent Donnefort <vdonnefort@google.com>
  | Date:   Mon Mar 9 16:25:04 2026 +0000
  | 
  |     tracing: Check for undefined symbols in simple_ring_buffer
  |     
  |     The simple_ring_buffer implementation must remain simple enough to be
  |     used by the pKVM hypervisor. Prevent the object build if unresolved
  |     symbols are found.
  | ... 5 lines of the commit log omitted.

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
  | 27514
  | # First few build errors in logs:
  | # 00:52:51 make[4]: *** [kernel/trace/Makefile:147: kernel/trace/simple_ring_buffer.o.checked] Error 1
  | # 00:52:51 make[3]: *** [scripts/Makefile.build:546: kernel/trace] Error 2
  | # 01:08:47 make[2]: *** [scripts/Makefile.build:546: kernel] Error 2
  | # 02:57:07 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:2101: .] Error 2
  | # 02:57:07 make: *** [Makefile:248: __sub-make] Error 2
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
  | 37972
  | # First few build errors in logs:
  | # 01:44:35 make[2]: *** [scripts/Makefile.vmlinux:100: vmlinux] Error 1
  | # 01:44:53 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_1/linux/Makefile:1295: vmlinux] Error 2
  | # 02:14:50 make: *** [Makefile:248: __sub-make] Error 2

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-2192. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/512/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allmodconfig-build/511/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/LinaroLtd/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/a717943d8ecc0e533c581bf04473b50f6f17f2cb/tcwg_kernel/llvm-master-aarch64-next-allmodconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/a717943d8ecc0e533c581bf04473b50f6f17f2cb
------=_Part_48272_2038541687.1773522043985--
