Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00502153D2
	for <llvm@lists.linux.dev>; Fri, 19 Sep 2025 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758280669; cv=none; b=cUCCTFPZftcvFU/f3dUhgbD4FwvndD2+CveyLJ8E7hsWhebtI7v+liN2MD+eeHvptRyH9v8pD/ylj+lGsT99EHmKOPQ8NTQLVXD9PZGUWGE4kQ32XabTQESKQkrT6Mdq6sPYqfJNUb3FvnzbN9WI+Gn/h73dgqnyEpcvEtFFvpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758280669; c=relaxed/simple;
	bh=q5698kKDSZHB1wNgOTViVrBM4Aj99QfinXCaHY7FLIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCa3lfcY6jEl8QfKwCIlZmyk+e2LZWKsgvWK0PGd+uNiwuJWyqQpm5g9dx0MQOsjBW+45tSYLqNBH2Xgin5/GTucZKTqeORYiuchILIgQJx5EK9e5fox/qN7jcbXKUG43CScxuKr/+GYuLR9ech6Vn9hKBcThN/8NS+9abuE5Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfTH0tNy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfTH0tNy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso14299905e9.3
        for <llvm@lists.linux.dev>; Fri, 19 Sep 2025 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758280666; x=1758885466; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eDerpC/hGj1I1JP2YeLk+oYIfnI3gOZYfJE5cgP4y8I=;
        b=zfTH0tNyi/XGEKa9Hk6tv+9LsDf58BFj/h1ftv2eT6v1ByNupzKXQnJUvs8NDWO6e2
         16bCF1GesN+Sc/2F+K3I69nUFB7HxSol0m5/J14E4T/H4YCcm+Q0rhSj1s8cM+o5RjfV
         xd70qHJqptl3kQfL0rCXrk5igIHk367pmatNHuD1lP6ruxiRNiwksLnS4B944Zos1kWE
         t9OPMj72H/j/vAovcq/EFyn2GVSNI3QO3gLkuVbFWxFnQz1MjcUiRMNL94CdWCsDwYQe
         tbaZrDkShTfIl5mu3Vb9szIUGZn+QpN8txQ4LLT7QkJjEOutzSFACFTzohKKVUUhdjwp
         /+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758280666; x=1758885466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDerpC/hGj1I1JP2YeLk+oYIfnI3gOZYfJE5cgP4y8I=;
        b=WJNysEpmMir1ScQs0nHmyhGqVxZmd2xoBIRNSk+Z6cnpINkNZ/YUBmSVAdkZsjSq8c
         6xPfbOE9FJqJp3H/D5uFmpNKI7B/oX7rHeUfcvjweWpi+CwsLIlmcrXZz2CflqaffcOP
         9/SKAKT9IQxmA4cDOVzMA8f5Xt/JbAXI1b7xrBXUe+shy1hZuQfYsNxuF4aFt+NnH7m2
         51RHyUrLhiEo6VLo6o+MQdeoDD6bKKy4oGx6aidxcN61lv+nmqeWNM2fEolOLR0K5MdU
         rYWWswfGQIuQlwRd4Xm5v+hhErQmiEkD6U+9QyprjiBqEQWyyRBG3ritCzMyDjgovgVW
         5arg==
X-Gm-Message-State: AOJu0YzPCswOFuNsRKUNJnAqNSXk8fqH11J9YwgzHFSEjZi4skWBafMS
	zfmlH4qDVP6q2nSGH+0gxWzFEKK4WvZiPFs8goUzzY2xcwoCzS5JrGgjOr9MLGRvoGVPvHUPGE8
	iO9Uv
X-Gm-Gg: ASbGncudktcZncpZZIrKtFHmLnInzs+hziG92w5cNsDC52JGAjodLKkzM4c852EWSRZ
	CCQZNMZh8HgHN+SCsHQ2KcPP5SAtnWgwAfQ7Z75GVoAGStkv+3hOG5nzd1pUSb4Xe8kY+hEUzgH
	Yi5/EymcOgZtkx1kgir7q8xld02NQ+i/E+VFvxHIHpV77ausSdZWRnbj20OZLO9IuF+Lm89xH4h
	KOHOw8JueoN2k6AHZkYPkVZNQPXJdthz/cHdXkT+Bl1YBU8R+A7uKf6KKtC1RzaBXOk7qCEzK7Y
	9Hy0kEuKlhUBOfN/dVhTv2k7gQ8VwqLwzRUFVxb2pGI+e72UO/NfJ7kajq+qb+TfB4iHW9+yuU2
	bQb84ZOeyMA8UF+mr2b8TK4+MY4L8
X-Google-Smtp-Source: AGHT+IH4gxNBOMIcJl992YlFV2alD3mXRT7VpkhmEEkUDus9PLr63vvEj+3tCpbtSb6dagydt/CQiA==
X-Received: by 2002:a05:600c:1c01:b0:45d:d9ab:b85a with SMTP id 5b1f17b1804b1-4684c1486abmr21513285e9.7.1758280665777;
        Fri, 19 Sep 2025 04:17:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461eefee9f3sm119301495e9.1.2025.09.19.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:17:45 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: clang-built-linux <llvm@lists.linux.dev>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>, lkft-triage@lists.linaro.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: clang nightly builds failing on PowerPc
Message-ID: <aM071XHb5cppdEKK@stanley.mountain>
References: <CA+G9fYsJq0sPC+q6vLNKUgBqCGmmjDrfeP4R1-95Eu28FJRY_A@mail.gmail.com>
 <20230612185424.GA2891387@dev-arch.thelio-3990X>
 <CA+G9fYtX6YNqmz9vxJxa5cA5Uf2rr=RNM0nkoTzRpg79Azp2tA@mail.gmail.com>
 <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvmqz3nQ=Cgs=7J6vtRj=OhbNzgkLPmxxN+vOBTU=9zVA@mail.gmail.com>

Hi the Clang nightly builds are failing on PowerPC with the
ppc64e_defconfig.  They started failing on Sept 11.  Clang is failing on
PowerPC in both linux-next and stable so it seems like something changed
in Clang and not the kernel.

Unfortunately I don't have ready access to the /tmp/vgetrandom-fef220.c
file that was generated, but hopefully these logs are enough to reproduce
the issue.

regards,
dan carpenter

tuxmake --target-arch=powerpc --kconfig=ppc64e_defconfig --toolchain=clang-nightly --wrapper=none --environment=KBUILD_BUILD_TIMESTAMP=@1758237451 --environment=KBUILD_BUILD_USER=tuxmake --environment=KBUILD_BUILD_HOST=tuxmake --environment=KCFLAGS=-ffile-prefix-map=/home/tuxbuild/.cache/tuxmake/builds/1/build/= --runtime=podman --image=855116176053.dkr.ecr.us-east-1.amazonaws.com/tuxmake/powerpc_clang-nightly LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld config default kernel xipkernel modules dtbs dtbs-legacy debugkernel headers
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld ppc64e_defconfig
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld
fatal error: error in backend: Cannot select: 0x60f13bcf8910: ch,glue = PPCISD::CALL_NOP 0x60f13bcf5e70, TargetGlobalAddress:i32<ptr @__arch_chacha20_blocks_nostack> 0, Register:i64 $x3, Register:i64 $x4, Register:i64 $x5, Register:i64 $x6, Register:i64 $x2, RegisterMask:Untyped, 0x60f13bcf5e70:1
  0x60f13bcf5e70: ch,glue = CopyToReg 0x60f13bcf8750, Register:i64 $x6, 0x60f13bcf5cb0, 0x60f13bcf8750:1
    0x60f13bcf5cb0: i64 = zero_extend 0x60f13bcf8600
      0x60f13bcf8600: i32 = srl 0x60f13bcf8280, Constant:i32<6>
        0x60f13bcf8280: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %43
    0x60f13bcf8750: ch,glue = CopyToReg 0x60f13bcf6490, Register:i64 $x5, 0x60f13bcf8440, 0x60f13bcf6490:1
      0x60f13bcf8440: i64 = zero_extend FrameIndex:i32<0>
      0x60f13bcf6490: ch,glue = CopyToReg 0x60f13bcf8590, Register:i64 $x4, 0x60f13bcf69d0, 0x60f13bcf8590:1
        0x60f13bcf69d0: i64 = zero_extend 0x60f13bcf5bd0
          0x60f13bcf5bd0: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %3
        0x60f13bcf8590: ch,glue = CopyToReg 0x60f13bcf6960, Register:i64 $x3, 0x60f13bcf68f0
          0x60f13bcf68f0: i64 = zero_extend 0x60f13bcf8520
            0x60f13bcf8520: i32,ch = CopyFromReg 0x60f13bc01ec0, Register:i32 %44
In function: __c_kernel_getrandom
clang: error: clang frontend command failed with exit code 70 (use -v to see invocation)
Debian clang version 22.0.0 (++20250917082822+6c8fcd6089b9-1~exp1~20250917203011.86)
Target: powerpc-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-22/bin
clang: note: diagnostic msg: 
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/vgetrandom-fef220.c
clang: note: diagnostic msg: /tmp/vgetrandom-fef220.sh
clang: note: diagnostic msg: 

********************
fatal error: error in backend: Don't know how to emit this value.
make[3]: *** [/builds/linux/arch/powerpc/kernel/vdso/Makefile:91: arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1
clang: error: clang frontend command failed with exit code 70 (use -v to see invocation)
Debian clang version 22.0.0 (++20250917082822+6c8fcd6089b9-1~exp1~20250917203011.86)
Target: powerpc-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/lib/llvm-22/bin
clang: note: diagnostic msg: 
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/vgettimeofday-43498a.c
clang: note: diagnostic msg: /tmp/vgettimeofday-43498a.sh
clang: note: diagnostic msg: 

********************
make[3]: *** [/builds/linux/arch/powerpc/kernel/vdso/Makefile:89: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
make[2]: *** [/builds/linux/arch/powerpc/Makefile:388: vdso_prepare] Error 2
make[2]: Target '__all' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:248: __sub-make] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target '__all' not remade because of errors.
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld modules_install
make[3]: *** No rule to make target 'modules.order', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.order'.
make[3]: *** No rule to make target 'modules.builtin', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.builtin'.
make[3]: *** No rule to make target 'modules.builtin.modinfo', needed by '/home/tuxbuild/.cache/tuxmake/builds/1/build/modinstall/lib/modules/6.17.0-rc6/modules.builtin.modinfo'.
make[3]: Target '__modinst' not remade because of errors.
make[2]: *** [/builds/linux/Makefile:1917: modules_install] Error 2
make[1]: *** [/builds/linux/Makefile:248: __sub-make] Error 2
make[1]: Target 'modules_install' not remade because of errors.
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'modules_install' not remade because of errors.
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_DTBS_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld dtbs
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall
mkdir -p /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_DTBS_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall/dtbs ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld dtbs_install
tar --sort=name --owner=tuxmake:1000 --group=tuxmake:1000 --mtime=@1758237451 --clamp-mtime -caf /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbs.tar.xz -C /home/tuxbuild/.cache/tuxmake/builds/1/build/dtbsinstall dtbs
rm -rf /home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr
make --silent --keep-going --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build INSTALL_HDR_PATH=/home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr/ ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- HOSTCC=clang CC=clang LLVM=1 LLVM_IAS=0 LD=powerpc64le-linux-gnu-ld headers_install
tar --sort=name --owner=tuxmake:1000 --group=tuxmake:1000 --mtime=@1758237451 --clamp-mtime -caf /home/tuxbuild/.cache/tuxmake/builds/1/build/headers.tar.xz -C /home/tuxbuild/.cache/tuxmake/builds/1/build/install_hdr .

