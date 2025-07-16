Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94872F1FF2
	for <llvm@lists.linux.dev>; Wed, 16 Jul 2025 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752661786; cv=none; b=FXF3a/OpUwXKqvDQ9LcU0nE6Lmo+V0wCUfdH+dt0p+XiS83oatDgVAbq71NYiF8QhBq0FfSJ5GqgLuPkEihKETi0c+iVqVV7zumBo58biob5uhqzI1oX4zDB1l6cONwgtvyN3FgI235gutIgbYzxqNROkebHtAhqRJXmzT2Zo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752661786; c=relaxed/simple;
	bh=G2c7cVrbOOl+l0VIMivo+PfbHYpVyyJngCUZ6BTqWNs=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=K3RSVDXodNgoJ1bIS5YoLpXPkkxuQqnnySf1GjP9ktmrodGCHXZDrYNNyyk0dNdvvgB9Bp3UTWTADzHpsWSpccZIZZ6NlPF7ARxQUMeo2era4P4BBM8YI9KrF14QCXAWnz+ypwfTxpjiFKJli9d6L6SRfu9paj4da5zZYUd1EpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTgZm2NW; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTgZm2NW"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10044691a12.1
        for <llvm@lists.linux.dev>; Wed, 16 Jul 2025 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752661783; x=1753266583; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbpZQx7ayAm1/hznn/3QwlftiGmiNe82OsCNc2kh9BY=;
        b=lTgZm2NWK4CpfQTiI3RPp0QDx2MovXRJupRxRyvUXHilT2qkHLboqi1/+MVbc4iUxi
         pu/9rkjClrM/oSV6Q79rURFL6Ulh5+VOhG3HQArYrdEHGgBNUPX1KwJOq4vOktFmBDzA
         LsZ5BvIZTAr2f40AUtIIrIkJP5bb6ctc6nBII0Ov7X0EE7HvsWkECkzQiWs0lbFOxS8L
         v7NSZFjiQPvMc85AgfbFs98G2wNiM+62AAyM6ftEVxhKKCKE4BTgvLIZAmumSap9Aqqh
         wBMwpfaq9oU0i2ROsBUR6p9mnLWUqaFCqi2WQn6RVhdQ7kOBsR5p1Y5IWKbS1ojCPYa0
         UsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752661783; x=1753266583;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbpZQx7ayAm1/hznn/3QwlftiGmiNe82OsCNc2kh9BY=;
        b=qr8Nl4Rs/1HPRi7hrv+M/hjoY+QzRThxLeZe4YEX9n2NjdZXkcNYpp+Z1+TcAj9JGq
         DV8xAJ//V50h/d3qjTtZeanTjXq0LQfonG5VX7WoFKQWbeInju4/l0oL5D0sjxZMJp9+
         mtx+wA82EMYP5QSy2riJL/0c2Ed0rhWEJYwBm3ojGDYsmkC1UnV7DYfTaLf3taq5pAZh
         aM9/7+kPsZo4TiaL4GNw0dd7NletHrkYfFNFuuOCTzyyf29SVT33asbVVmRVtxA98o12
         NUmth31N4AKJpCXsTRWcU+PNaxlbnuxAMonbrIE3l68hBizwLHfoLKrE16TK/jRa6g0+
         yWdQ==
X-Gm-Message-State: AOJu0Yx53uq8NU415kc8bsPkXDb5H5XT321eoh8oSKOUlLF6UqgpriU5
	MrBTv5txRsQaaBrdpGf8DmfQnsKTjsg3oeVJo5dSZ8J+lP++dW6cjaYMtIrUDlJaG+yRmMl321O
	8Wr28
X-Gm-Gg: ASbGnctsODd2C1FkuOQxHYkOZrA8ResQ5iDYVAjWFckZUXmOaEoui0lLxV5B9TWoTqb
	EzjbFHXcE9PgG9jpgmXbpYCVmVg6iusnJZ5lSfhXF5o2bICFAWfEG3+WsMizJgNa65O9iXlW3o7
	qbJn/zac2Mk4CD/BSVPcxwX1UqC8YANWHFe0MxdElZ1atCGqHRZUGuUFfI2LQ6MbP0nx6dh2DYt
	kWj59Wu3aLgXnkVfZfsoTwVfiZwkp7a5Ho9oF4Iuqdq647O7Md1aYODU4xWeNr2WzdvzBCgaM72
	BTLYxUv37DPqOy+3Xw7dkuWtdQeAgIcZdWqh2QMr544JmEkucEbsTBmHwLCPXaQwN6chU+ekOEY
	jIoMySHV0+ILXRz5GVH3rpOfzvLPEjx7Ez0TxXTritZgdY5pjb+G2mTNzhVzPqx1+T6XrjQ==
X-Google-Smtp-Source: AGHT+IHrEMcPylZEIZV6wxxMQO5LDUaKoWgHwhVrpQ/aZj8A9gzIHofx1sg/gT7TCv5oSy+K8GcFTQ==
X-Received: by 2002:a17:907:2d07:b0:ae3:bb4a:91fb with SMTP id a640c23a62f3a-ae9ce1feb96mr225918766b.59.1752661783031;
        Wed, 16 Jul 2025 03:29:43 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df311sm1152923366b.165.2025.07.16.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 03:29:42 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 16 Jul 2025 10:29:41 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <1943133762.1083.1752661782629@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] v6.16-rc5-47-gf66f9c3d09c12: Failure on aarch64
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1082_854603034.1752661781788"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_1082_854603034.1752661781788
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-aarch64-next-allyesconfig, after:
  | commit v6.16-rc5-47-gf66f9c3d09c12
  | Author: Ben Horgan <ben.horgan@arm.com>
  | Date:   Wed Jul 9 10:38:08 2025 +0100
  | 
  |     bitfield: Ensure the return values of helper functions are checked
  |     
  |     As type##_replace_bits() has no side effects it is only useful if its
  |     return value is checked. Add __must_check to enforce this usage. To have
  |     the bits replaced in-place typep##_replace_bits() can be used instead.
  | ... 7 lines of the commit log omitted.

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
  | 24165
  | # First few build errors in logs:
  | # 00:10:54 arch/arm64/kvm/sys_regs.c:2627:3: error: ignoring return value of function declared with 'warn_unused_result' attribute [-Werror,-Wunused-result]
  | # 00:10:58 make[4]: *** [scripts/Makefile.build:287: arch/arm64/kvm/sys_regs.o] Error 1
  | # 00:16:45 make[3]: *** [scripts/Makefile.build:554: arch/arm64/kvm] Error 2
  | # 00:16:45 make[2]: *** [scripts/Makefile.build:554: arch/arm64] Error 2
  | # 02:29:17 make[1]: *** [/home/tcwg-buildslave/workspace/tcwg_kernel_0/linux/Makefile:2003: .] Error 2
  | # 02:29:17 make: *** [Makefile:248: __sub-make] Error 2
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
  | 24235
  | # linux build successful:
  | all

Used configuration :
 tcwg_kernel/llvm-master-aarch64-next-allyesconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1725. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/414/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-aarch64-next-allyesconfig-build/413/artifact/artifacts

Instruction to reproduce the build : https://gitlab.com/Linaro/tcwg/ci/interesting-commits/-/raw/master/linux/sha1/f66f9c3d09c12f6ceea17d1ba22be2cb8bc9e4e4/tcwg_kernel/llvm-master-aarch64-next-allyesconfig/reproduction_instructions.txt

Full commit : https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/commit/f66f9c3d09c12f6ceea17d1ba22be2cb8bc9e4e4
------=_Part_1082_854603034.1752661781788--
