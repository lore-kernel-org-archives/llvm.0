Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A210F3
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 06:29:34 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4475ae93951so1948789137.0
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 23:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691476173; x=1692080973;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ER6MazoTD3CQHlWxCQhM2lCF8cG+E0zaU5EAB/f7j+8=;
        b=lmTaCCwFd1NEaL67j25R/RjzxCvpKwSYoU4cHB8i2hmS5afVLhPDwUNSpR/G+Czs9D
         VlJAwwznLzXn0JW8EaFCl4gcdlnDCw7eZneW5kJG5GKz32WImbhrOjTW+gxY4wF9Ynr3
         o6pjjyZlExTwP2rLGpv8RjynXcr3EFDUXXX/3ooq5av6YLjsuvxq1dd+JQYJgF/QaHcN
         oivW4Xv8pSAXMGTBuLUZHxhV6YgIoddx8uYhbkzxOhQLiysHDH3ZkfxPGOP6e/Q9Oz17
         QwU4UH7f+fhbe4lFY3Zefq8aJp026pN08Ef2EyMAvorLx2IwLfNKCGNRvoXl2bUv4rSs
         dqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691476173; x=1692080973;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ER6MazoTD3CQHlWxCQhM2lCF8cG+E0zaU5EAB/f7j+8=;
        b=kDepopydiG0vnrR4y2ZYz2Ctbj1TMu2j0SnqqZNSq+MnTm7jf5szlU3IHjDMfcEL7D
         jKxZlMpP8E3lKP7uxP9xtiKqZqE0qFCWVWJ1JH+7MbZaK5wrX7WgetuiWkn5VpeKC3u8
         Lyg2fjPLoKW7WVRSR4MPsh6e0Ye0MQk/RWpiShp7TDXILH71bnr/HGSDutF211CmhBO3
         0Of7P5Y0Eh8GluqimIpLZRecXuOVmixL3A+dyrVH8w5NRlqvlLSkRw5Umx2UPfGF3QcA
         JpdURR0lOFeGXRskDoycEwyafTyr4r9uaS/HGm32j1+aoBsHXR7xaMNLpOBZSbBiojUl
         k6cw==
X-Gm-Message-State: AOJu0YxHllYVD9dv1S/Ewz03aWf435pVrEUNQtu42pbAgXu6VrNrEkaC
	R55nbvz4HQuvfoIlU5moZbwxUBU/EkQvdeHIJdfZ8Q==
X-Google-Smtp-Source: AGHT+IFgWA3xpDQsfZdUGLp22gsHgxbIZreQfEFGW+WmyGTcCFwovG8A0xJB4rFnhbytWJM2qTNiJQlwpo+SSOHoSyk=
X-Received: by 2002:a05:6102:2744:b0:443:64fb:8ec1 with SMTP id
 p4-20020a056102274400b0044364fb8ec1mr5244063vsu.21.1691476173590; Mon, 07 Aug
 2023 23:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 8 Aug 2023 11:59:22 +0530
Message-ID: <CA+G9fYvPn4N6yPEQauHLXw22AWihQFxyA=twQMDCEwDjXZyYAg@mail.gmail.com>
Subject: stable-rc 5.15: clang-17: drivers/firmware/arm_scmi/smc.c:39:6:
 error: duplicate member 'irq'
To: linux-stable <stable@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

LKFT build plans upgraded to clang-17 and found this failure,

While building stable-rc 5.15 arm with clang-17 failed with below
warnings and errors.

Build log:
----------

drivers/firmware/arm_scmi/smc.c:39:6: error: duplicate member 'irq'
   39 |         int irq;
      |             ^
drivers/firmware/arm_scmi/smc.c:34:6: note: previous declaration is here
   34 |         int irq;
      |             ^
drivers/firmware/arm_scmi/smc.c:118:20: error: use of undeclared
identifier 'irq'
  118 |                 scmi_info->irq = irq;
      |                                  ^
2 errors generated.

  Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.124-80-g6a5dd0772845/testrun/18864721/suite/build/test/clang-lkftconfig/details/


Steps to reproduce:
 tuxmake --runtime podman --target-arch arm --toolchain clang-17
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2TeTE3iE8aq4t1kv169LcMmd9jo/config
LLVM=1 LLVM_IAS=1

  Links:
    - https://storage.tuxsuite.com/public/linaro/lkft/builds/2TeTE3iE8aq4t1kv169LcMmd9jo/tuxmake_reproducer.sh

--
Linaro LKFT
https://lkft.linaro.org
