Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91DA5C60D
	for <llvm@lists.linux.dev>; Wed,  3 Apr 2024 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712129903; cv=none; b=SspEr+EAXxpehNr5BxnitpqRdd3IGGTh0W6f8iyD53aE+2GTgAaYWHXaYlfS9qJCRQpGxlGk8WONBNBaf9n33Zw0GwE41IkEtrSJyo31vJeVxjf8KV1meu7c3GhLhOmLB2RxmHb08RX9KTqwITWcODBy+f9qAiLLdmGvszhA/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712129903; c=relaxed/simple;
	bh=9WbOVVSwUWwd5K793ppWlQLxaj4rX8ZTjnhFhq5Y5v8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cpRZQ1+3ik4ioJf0wqqIu91TgMSdxYuXgAU9Pm3A299OjklAT8IjPh6jIQXt8inR8vit3JAVM24HoHXoKkpgY4SWGUBe+E3FxXLuqByefezjrrxwZJ/vu9qsFKHZcgflzQUwZr3vy2ci+3oO+Qv3bmn+Cn4Bp+Vo3+vhOnVaiZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h5jTtbEx; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h5jTtbEx"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7e3b3e33ae3so278979241.0
        for <llvm@lists.linux.dev>; Wed, 03 Apr 2024 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712129900; x=1712734700; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKsiTWwQltevYA1r+W4p6ubtTr4MlTT13dNzhqyl5yk=;
        b=h5jTtbExD3olT3RfzP00t/JzotC1K2JGqcnUMVxx5T+qexjEu+4MgEXZy3GCdSfMne
         hesjJdY65uik9UPUVyuAzA/7STFwCzVIGXMf0x+5GBXD88m3NHBBlLYlQlRLXJHPO+Ek
         sOI19L4I34Mxz1aXqR9tQjSN0D9FpFU7+KG/7WiaT61Ov7wBOd5nn9RH0e/r+1ekHx2u
         WODxxtn2DtIS7fgzQxWUI6grllQIS38nI8vUnxqF14zsIWfqwIl+BcWlMumA0upNOZLk
         nFvtUlmQCAwg7zWHd+itA753PmgCsnQaxRJfC7EeXWX7t/VPVwcqpjtnXvIz2xb/VSO9
         fh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129900; x=1712734700;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKsiTWwQltevYA1r+W4p6ubtTr4MlTT13dNzhqyl5yk=;
        b=HiBMaeilEawklk41tFt1/BVhsj+IM6jP0lXf+gFLXe6khJ/YKckBQ9UvbW0sK6qOFR
         Oo2xkVTp3Cq3u3i0UeTjxkD8AMhOsACQt+/uNMLqCjnQWJaoF3brcdpHE1rqOwN32KtI
         QZq6FbjYMFQLenc5GZa95faEqru+pXXP//y+PnZdQ09kVlaT7GPaLvUZBHfQc2YToaEZ
         Oq65397KxI9XACDKcrn/aMVX4qYZHehYTSGPPyjUDQXE95eeGCbterEa2mbzksxbefkZ
         nBu0h7AKN36+emgIa/WVIm6fQXokoPVG6DRyC367i16qt+f2WjoxyF/hpxaxqiQgFgEj
         t8wg==
X-Forwarded-Encrypted: i=1; AJvYcCUe1DSubRhKLy4SO0xLAj3e2qWnISPh2ysDxYYfDJPM48Tvs7HQY2kweQA6Wxh46H3dSZr1eD+Ymiy7WisqJv2ivQZFPg==
X-Gm-Message-State: AOJu0Yziv/TffdL3t57vGpYx5Ww11j2as2/Og6yvOh2uo9tAmCZOqX68
	bE2BD2amJt+3D79zelw3V1+SIwU9meP9isrO0xkZOuS0U+sL3MidmkD2Z01D581a8JMfq5yhJxR
	LH2OMyQKhVpNj6GJqYKFVKBhP5s+qPZtTWFweCg==
X-Google-Smtp-Source: AGHT+IEDsnkIj6HCOWhXVjqLOlYJRYneScfnCc6Qn1cRIG8coLw2kTdZBaOy3HnsF7h3qlnpsiRbKmaYqRzZ9wPLo58=
X-Received: by 2002:a67:e359:0:b0:478:32e2:1833 with SMTP id
 s25-20020a67e359000000b0047832e21833mr11298728vsm.22.1712129900501; Wed, 03
 Apr 2024 00:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 3 Apr 2024 13:08:08 +0530
Message-ID: <CA+G9fYtj3aBdRreBmKZDQApEe2x8mugycPgN+_J5ebJzXDEq4g@mail.gmail.com>
Subject: kernel/sched/core.c:961:15: error: incompatible pointer to integer
 conversion passing 'typeof
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>, Linux PM <linux-pm@vger.kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

The riscv clang-17 defconfig build failed due to following warnings / errors
on the Linux next-20240402.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

riscv:
  build:
    * clang-17-lkftconfig - Failed
    * rv32-clang-17-defconfig - Failed
    * clang-17-tinyconfig - Failed
    * rv32-clang-17-tinyconfig - Failed
    * clang-17-defconfig - Failed
    * clang-17-allnoconfig - Failed
    * rv32-clang-17-allnoconfig - Failed

Build log:
-------
kernel/sched/core.c:961:15: error: incompatible pointer to integer
conversion passing 'typeof (*((__ai_ptr)))' (aka 'struct wake_q_node
*') to parameter of type 'uintptr_t' (aka 'unsigned long')
[-Wint-conversion]
  961 |         if (unlikely(cmpxchg_relaxed(&node->next, NULL, WAKE_Q_TAIL)))
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Steps to reproduce:
---------
# tuxmake --runtime podman --target-arch riscv --toolchain clang-17
--kconfig defconfig LLVM=1 LLVM_IAS=1

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240402/testrun/23264917/suite/build/test/clang-17-defconfig/log

--
Linaro LKFT
https://lkft.linaro.org
