Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFF4BA50
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218464; cv=none; b=e/gxlXS3cvjyUbw9pemoqG+Mv/OK36jMuxqOShBfEtlEtKuX7e4bp4k78X1SUkJoxsCevJ8GXlbQctcCqGUJzUzIh19khQ83qdB82j5OTD4vllvHQuUe35CPDGAKpDT9Tl3OQKhwif69o5JsW7Ki99nMIsi+f9in1lX3tKpNsVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218464; c=relaxed/simple;
	bh=jzPS1MIJa+RhF/d+gPQtAnLrbpRnCK0ZcoiHsJ+4FnA=;
	h=From:Date:To:Message-ID:Subject:MIME-Version:Content-Type; b=Ya7LBQSWqlpDXp2yx3OOB0KTsXw1EuIErph/0VF5Fm9kVssdVFyRXisoGFy1DXLU/+yAGi1lh7fiYC40l4TfyZN6Va/Z6ZBFZUoqZzJfybLdf4dz+IQDEo9G+dglcU5exV21qRwO5zURgBDZlaX0UlZGqeS170Z8D/ztiwpgV08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiSfLHEK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiSfLHEK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2687370f8f.3
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 13:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746218460; x=1746823260; darn=lists.linux.dev;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u8XfeSUI4BPeTYflOCv4ZSZhLhhpIW3GFvzhIR0YrNM=;
        b=qiSfLHEKc4ChxocTCY86xBM4Giy0JmLThVYXfv+xFsQgEByAlla9d4EK2WG77IwOOr
         MODnyGK/3hqxStC10haN6DXN2umWyHdbmc1jp0umskr9M0l0zJtIDvM3zRXjNmKyBYRm
         Cc7O59YkqZaD8OyjN829Rd/xU0AeBigdACWHWNxXv2+0Hu57i5jx/MLL2DNBZpbtofn3
         FnBldHym1lfoVC6CSJoxnntzJEe+vwdYOtBRw7fYMh7GzWjlLSZOLZTVTCRPil4tErUS
         vpVXNfVkYjZqzuWWHCk/SXnkyVFXkUcEPhARoosRKIAHtI1nA+R/pNaFMA4E+AJ6DcHK
         gTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218460; x=1746823260;
        h=list-id:mime-version:subject:message-id:to:reply-to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8XfeSUI4BPeTYflOCv4ZSZhLhhpIW3GFvzhIR0YrNM=;
        b=d86XdkCNgAEi28ufT5sR7BDUvQjkK5/0Ah06q840nxl0Zbo2dMG/d9MFTyat+Wz4Ex
         ZyjoXYXAY1CRqhvCKWnQGN7683zNCIfKDLnEFAcSHQB1sWDOsmYHGKXRigXa5vSexDvm
         xU4RMYHQETxGzUWvh+UqRyXWvoEK+twgVq0VW6R2clJv+nIj/S8bRprM369QC0E5PwFy
         ruuHTjm16BjLANoQMrYehtZHWIs/iUgSuY0ZTUUsFZwYgmaxim/AR7IrgpcPpYKukPDG
         j/eyd8yfod7XpuUz9nUV/gefb4vcI4R3/3NCssKpqwkZWkjswyIOC59M0UYoesLD/EuO
         dwDQ==
X-Gm-Message-State: AOJu0Yzk1MChR41NhgiWcJoxjKf/uy/3fLQbR6sC89Ab/TTE476mO6G8
	D+KvbfLCwkkXgWn+hLdaCjwe8VAtS4arlLeTQZLHi3udCPXE+MQS4h2GBq2xmiSg8WPdeZ2FEk3
	h
X-Gm-Gg: ASbGncstKSwtj/k/9lKpF3ijrP25VwxKtgg/Etz1kCBnbH6omaCYJQ/Vu+b8AcMXEQ/
	JbF4I/I62b4nRkIYbetGZX6lBrkibYLad09JgUQQwvX199JFePUcuRHquGbsj5aIZOQVKVkL8h5
	HWxy6urnHQHJx852xLF3a2swnYDkv40EdyIMBaYLbNsoXh+l78wfX06gH5N5U0Wpyy5gUYU/8uZ
	IOjpQ428e4RTSAKm4TBi2CIvd6CqZ6fD+S9Z/c2+GYWt770zLApcMpv3ykRTdcgRMUuvhzLeDLB
	btrrUwsHXXCalzwW/yldBLPONZXp29pHBw/SnJnUV550mc4e5wVxJNzuzDz9uWlJ7wycnPdHz0f
	9r5HKnm9pKv1f
X-Google-Smtp-Source: AGHT+IEcEmKdrtMpcRKT32Brv9qEexQAyw1FY9Dd75mXBHtZftB7XSIHGBoQMEzK+a1EWXKijjnSyw==
X-Received: by 2002:a05:6000:40e1:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-3a099aee21bmr3697088f8f.47.1746218460393;
        Fri, 02 May 2025 13:41:00 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm2971855f8f.25.2025.05.02.13.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:40:59 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Fri, 2 May 2025 20:40:58 +0000 (UTC)
Reply-To: linaro-toolchain@lists.linaro.org
To: llvm@lists.linux.dev
Message-ID: <28506718.2850.1746218459923@jenkins.jenkins>
Subject: [Linaro-TCWG-CI] llvmorg-21-init-10348-ge8ae77947154: Failure on
 arm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2849_1068567117.1746218459097"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-stable-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_2849_1068567117.1746218459097
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear contributor,

Our automatic CI has detected problems related to your patch(es). Please find some details below.

In tcwg_kernel/llvm-master-arm-stable-allmodconfig, after:
  | commit llvmorg-21-init-10348-ge8ae77947154
  | Author: Aaron Ballman <aaron@aaronballman.com>
  | Date:   Wed Apr 30 10:14:18 2025 -0400
  | 
  |     [C] Add diagnostic + attr for unterminated strings (#137829)
  |     
  |     This introduces three things related to intialization like:
  |     
  |     char buf[3] = "foo";
  | ... 16 lines of the commit log omitted.

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
  | 23152
  | # First few build errors in logs:
  | # 00:09:17 arch/arm/mach-bcm/platsmp-brcmstb.c:110:11: error: default initialization of an object of type 'typeof (timeo)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:09:17 make[3]: *** [scripts/Makefile.build:207: arch/arm/mach-bcm/platsmp-brcmstb.o] Error 1
  | # 00:09:21 make[2]: *** [scripts/Makefile.build:465: arch/arm/mach-bcm] Error 2
  | # 00:09:21 ./include/net/ip.h:484:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:09:21 make[4]: *** [scripts/Makefile.build:207: security/selinux/avc.o] Error 1
  | # 00:09:25 ./include/net/ip.h:484:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:09:26 ./include/net/ip6_fib.h:271:10: error: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:09:26 ./include/net/ip.h:484:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-unsafe]
  | # 00:09:27 make[4]: *** [scripts/Makefile.build:207: security/selinux/hooks.o] Error 1
  | # 00:09:27 make[3]: *** [scripts/Makefile.build:207: io_uring/io_uring.o] Error 1
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
  | 23196

Used configuration :
 tcwg_kernel/llvm-master-arm-stable-allmodconfig

We track this bug report under https://linaro.atlassian.net/browse/LLVM-1674. Please let us know if you have a fix.

If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.

-----------------8<--------------------------8<--------------------------8<--------------------------

The information below contains the details of the failures, and the ways to reproduce a debug environment:



Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allmodconfig-build/283/artifact/artifacts
Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allmodconfig-build/282/artifact/artifacts

Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e/tcwg_kernel/llvm-master-arm-stable-allmodconfig/reproduction_instructions.txt

Full commit : https://github.com/llvm/llvm-project/commit/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e
------=_Part_2849_1068567117.1746218459097--
