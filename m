Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750EA2C1AE
	for <llvm@lists.linux.dev>; Mon, 18 Mar 2024 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753968; cv=none; b=ozextTnvcTaVjEB3UUz43ONX1GULgN0f4mp7CN5/fg4947MD+k72iQsQ/wqYNNN+Jmw4PK9xmbGCJl+FL29hMA8KRv4z/f4/bw4Cw1LPuO5zn6ii7rNx0KiEnZ4BPg7Dc0ulExLrluezx7sm5Wwq2amw5IEn/KsBxpz5ER2Cgwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753968; c=relaxed/simple;
	bh=8y4vSdVUZCk+aPZhva5pLco3uG5l2lCYnp2HRRGYbkg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SPjZdz/Wj924JZIPnEJusMAFFCktB29QJA5hxMiO6wLDA4jlVACxSvBTpS87vilZHpSosnKOMTWjjI2fAnO9m+eAYBPR2bcGF4YI7HacBXcTje9O7EnNO1R3gzP3rVztNMy3dNTIDmJfCQi821aQXWkboovAU3FBHy3/sK5PuTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y1YkOZMl; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1YkOZMl"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d43c633fecso876531e0c.3
        for <llvm@lists.linux.dev>; Mon, 18 Mar 2024 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710753965; x=1711358765; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dr558Gtc+rRfkIYnJ72l9uUtS+S0kUdV5Cm0VXr/mqc=;
        b=Y1YkOZMlR5PlZQ5481FdEdwXisdVBEPuQ4HTIHsNDY6oKHIEnfs7eIU34/xRvUCkIr
         zBpoMNrd4blXwcxz9/yqEyWEcBwtWNJ0h+HiuYO3NlEYe17sY/Lju/an0Vam66Oc37eg
         aqOa5hu2Hp2TumpZyNwr4rN5X2CYMjU7CXiJ8mGOsdi8SAGYpyHMnccpx8MAURNpv06+
         N6w7BaJcNaaGn1ZkGZBs/8KaBj6W53hVuIckMeAtgQ7QBylBgZvbTUZg9d9WS3KXGOr4
         g50/Cp0xe61ZvNHwWUbBBZUi0RtSeuMJJeFHDLP9Qpk6//kiHDLz3JygzLcszjwfASmm
         xwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753965; x=1711358765;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dr558Gtc+rRfkIYnJ72l9uUtS+S0kUdV5Cm0VXr/mqc=;
        b=ENkBSak576hQ6uTGXY7bhSsXQtHmCRQT9CzULEDqi8CSLLEp1jkuf9+4UV30ncEJRr
         q4zcYPVry+DZXM0p5rlDsVu68kE7G64aHwC/jeUq7mBhW6SiONhdJ1SRz23bRIsjnIkq
         8nPfIpAD3l9cuj7aEf5w2BiLoKQ1R8z2BQUA2MB556rOX9oUgAhLSalIfzJaAoUHtoTc
         3vbyZNiYEdCJ2A/uJ6UAkRFYgzEEt/+FIP5Ghk/7NSQ1Lq0E/6TH2vFA5KUOlIqqP87T
         Pq1GkYsf2t/LAxYE1Jbky2ZO00iMALHH9MJiMC+j6nVu9vbkGVvIyIJlDNCq+JORi91S
         Yd2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZQjFYgPKPXTNe/UdpuI6949FXSfj5l0tIreAx3ufMrE0L+aow1eMQP5VNv8L+cFxgTdzuIply3KD8nHiM2QEW/ukXCw==
X-Gm-Message-State: AOJu0Yy0FYy3Ux4412Vpsm4xvnykNlNaZbOrLo7phIdkfma4uhvtmd0S
	j1L7PoQG/3Dm6kxY0MkwWy+zTKd0+tc15iTd1iBpoFuF6hRZjYVLnd8/q/BcpRkKFqn2+yFeZ9f
	FaOf5F0PiHNvyL16hZjk6Ov1f8ncXEcv+IOKnea985CMjhJU3nRM=
X-Google-Smtp-Source: AGHT+IFDDQIlK3lVhoDg3KpbK/eh3Hhxm8PIDTagoTjsDxY8wbny4dXn7KvLQWqbF5dW8Rr0jLCdFvvcFrJRC5YENVg=
X-Received: by 2002:a1f:724c:0:b0:4ca:615e:1b61 with SMTP id
 n73-20020a1f724c000000b004ca615e1b61mr7860598vkc.10.1710753965337; Mon, 18
 Mar 2024 02:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 18 Mar 2024 14:55:54 +0530
Message-ID: <CA+G9fYs=OTKAZS6g1P1Ewadfr0qoe6LgOVSohqkXmFXotEODdg@mail.gmail.com>
Subject: net/sunrpc/sched.c: error: result of comparison against a string
 literal is unspecified (use an explicit string comparison function instead)
To: Netdev <netdev@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org
Cc: "David S. Miller" <davem@davemloft.net>, Nathan Chancellor <nathan@kernel.org>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>, Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on x86 kselftests build with
clang nightly  / clang-17 on Linux  next tag next-20240318.

This build config is generated from kselftest merge configs [1].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----------
In file included from net/sunrpc/sched.c:31:
In file included from include/trace/events/sunrpc.h:2524:
In file included from include/trace/define_trace.h:102:
In file included from include/trace/trace_events.h:419:
include/trace/events/sunrpc.h:707:4: error: result of comparison
against a string literal is unspecified (use an explicit string
comparison function instead) [-Werror,-Wstring-compare]
  667 |                         __assign_str(progname,
      |                         ~~~~~~~~~~~~~~~~~~~~~~
  668 |                                      task->tk_client->cl_program->name);
      |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  669 |                         __entry->version = task->tk_client->cl_vers;
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  670 |                         __assign_str(procedure,
task->tk_msg.rpc_proc->p_name);
      |

[1] steps to reproduce:
-----------
tuxmake --runtime podman --target-arch x86_64 --toolchain
clang-nightly --kconfig
https://storage.tuxsuite.com/public/linaro/lkft/builds/2dqIWv3Qq5qYmJfnmKfkSg9fvN0/config
LLVM=1 LLVM_IAS=1 debugkernel cpupower headers kernel kselftest
modules


Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2dqIWv3Qq5qYmJfnmKfkSg9fvN0/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240318/testrun/23069554/suite/build/test/clang-nightly-lkftconfig-kselftest/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240318/testrun/23069554/suite/build/test/clang-nightly-lkftconfig-kselftest/details/


--
Linaro LKFT
https://lkft.linaro.org
