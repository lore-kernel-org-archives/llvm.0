Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454B14C59B
	for <llvm@lists.linux.dev>; Fri, 30 Aug 2024 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725000324; cv=none; b=br/UqUuETLt8kls/YigwONwuLPTAnltrH4/ebPfdt6Exz5q0LB3vogsUClrcppQBdBMibBuuGa1F8XdiNmbliG7UDVFbbEExMvLjo2drXy9PEkpJPPgN+OhaTM1982C0DCg6SOOdz1T9bF6xLofn6YbOs2acuq+52kRftfkOduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725000324; c=relaxed/simple;
	bh=z2tMGYCX6QIF8USqnak/joMuhfj1TNUKUkBSSXPLdCM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hhu3obWsCgQV88E1ZmiqEjyinDgI8mEkS7UZd227OOvXKjSDTwsj0TQPeUg4Bh89qJETPixbmzJ895AuxfKqx8KQ4bAqELW75bX0/IoGXlkRhb0n9GTefaLS95GxUlM8C7pSdo/F5OZTP5ARvyayzLOv5vgfeGXeKmImJKPRNW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FDe9Ang4; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FDe9Ang4"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-498eb76145bso679705137.1
        for <llvm@lists.linux.dev>; Thu, 29 Aug 2024 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725000322; x=1725605122; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rbpFfZAAGy+MvWzUwDXlPYpxkRy+IDxVTjCRFwW+Hxg=;
        b=FDe9Ang4AlU1ZQry/RdZ30cYG4JOlN/G5PQmCvByuRyj+Pd7PBS1k3X/kxcZBDeHjs
         7Wu/uPx4RFBOzEn8f8nsYv4U2Gaj2k05xbsmdjM4126Zh1yYiOx3cFA9k+eKyX+vAjKi
         sR4CRZY9YS0tp/DjNpK5SqYTG6Ir1Nd1zuhGUv4GWECQL1sv56/8I7WNQ44nivAgnOtp
         MIIiBHCcMFsSrKh0dtOapmm5D2ElHsAsOGo4qa0J6GYPOi/LO/SWKmL7hYaapYv66aJW
         /mgBH+2jmWhXJZR4HV0J3xoQ/giaEoi4ux1MF2kCj/3/+xEJO09R/2CZTvOAMnrbPd9a
         q+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000322; x=1725605122;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbpFfZAAGy+MvWzUwDXlPYpxkRy+IDxVTjCRFwW+Hxg=;
        b=vpcup9/OjA36ZSiXyYWJI50L7zDWITKbTdVBhYypzVdiBFpWwduxoH0r6uqqqFdkl9
         Cb/XyhwnqprsjVi4y5RllyGkWDHJjv7eIZ283ZheXgLx9XmqwPIeyLbt/EuaJLBYDbxM
         qyQqgZXFg/sXkDbwpdpA5cmgCyacKaj07e/e/C1kdWTRzbtaQwDd9yeW1r0XQvWB6DOi
         oEw41HhJwK9kGI2hdMQTGudziD26+w3YZ50JY0NeQt3NTrjoYg5WZUGJi2zjz9i/JOPo
         6/ayviM20KHM5FDQ+Cc6opsa2u3XSFUFhQf6wkMQ21tC0rDzPi366LQgK6PuageowZXp
         Ifhw==
X-Gm-Message-State: AOJu0Yw14m00jNNinMA/hwMfqqwCmNH4cpKXMnpmR3CXNB6pekuKf4Li
	1hViIzKV20L8YJuC+K55hZsJeLZHCNumSZtqGcc0kaKYAwwnsqT6uWjxdscw8vRmRlrsMjnEVUl
	aekGAAO/3gMTYkeojUOfJxLueC9iKk0Gtgl33D3X0+he4wWrfX4Q=
X-Google-Smtp-Source: AGHT+IGjtT+iRsWBRGw877rPBsoWnB7aehlawvTFpCsFP81H03YlByPMlEYvHuWNIHaoPnc0CqKmfajXR5onhPoZMMU=
X-Received: by 2002:a05:6102:3754:b0:498:ccd9:5b1e with SMTP id
 ada2fe7eead31-49a5b017424mr6994044137.4.1725000321654; Thu, 29 Aug 2024
 23:45:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 30 Aug 2024 12:15:10 +0530
Message-ID: <CA+G9fYtemFfuhc7=eNyP3TezM9Euc8sFtHe4GDR4Z9XdHzXSJA@mail.gmail.com>
Subject: net/xfrm/xfrm_policy.c:1286:8: error: variable 'dir' is uninitialized
 when used here [-Werror,-Wuninitialized]
To: clang-built-linux <llvm@lists.linux.dev>, Netdev <netdev@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

The x86_64 defconfig builds failed on today's Linux next-20240829
due to following build warnings / errors.

Regressions:
* i386, build
  - clang-18-defconfig
  - clang-nightly-defconfig

* x86_64, build
  - clang-18-lkftconfig
  - clang-18-lkftconfig-compat
  - clang-18-lkftconfig-kcsan
  - clang-18-lkftconfig-no-kselftest-frag
  - clang-18-x86_64_defconfig
  - clang-nightly-lkftconfig
  - clang-nightly-lkftconfig-kselftest
  - clang-nightly-x86_64_defconfig
  - rustclang-nightly-lkftconfig-kselftest

first seen on next-20240829.
  Good: next-20240828
  BAD:  next-20240829

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------
net/xfrm/xfrm_policy.c:1286:8: error: variable 'dir' is uninitialized
when used here [-Werror,-Wuninitialized]
 1286 |                 if ((dir & XFRM_POLICY_MASK) == XFRM_POLICY_OUT) {
      |                      ^~~
net/xfrm/xfrm_policy.c:1257:9: note: initialize the variable 'dir' to
silence this warning
 1257 |         int dir;
      |                ^
      |                 = 0
1 error generated.

Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240829/testrun/24977652/suite/build/test/clang-18-lkftconfig/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240829/testrun/24977652/suite/build/test/clang-18-lkftconfig/history/

metadata:
----
  git describe: next-20240829
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: b18bbfc14a38b5234e09c2adcf713e38063a7e6e
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2lKF49FRX1FB3IVv46cfZc30s9y/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2lKF49FRX1FB3IVv46cfZc30s9y/
  toolchain: clang-18 and clang-nightly
  config: defconfig

Steps to reproduce:
---------
 - tuxmake --runtime podman --target-arch x86_64 --toolchain clang-18
--kconfig defconfig LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
