Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B8748C
	for <llvm@lists.linux.dev>; Sun, 16 Jul 2023 19:25:54 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-48165cd918dso973034e0c.0
        for <llvm@lists.linux.dev>; Sun, 16 Jul 2023 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689535553; x=1692127553;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SSAuqt+s4WpqnMkPR0UJ8Xay9OvKHBk6xAfxVDPkGGQ=;
        b=GCfnrMXYxp6tDgtZAagG8EKzfgEUkVMqLXnYtg5sUR5EMzDvuVV7JWq8MfFipjIqwp
         rQWsJLvKS3lRUTIoET8y9ScSg8YJkueRQBIMPFKiK5Ht8RCUrUCsCLc30sRywisgwuYa
         nLb0CvZurNsuecbNXH5SJbeg2xgpy3fZtgWFcqmbw0/QSt6XTJrrtiNePq+1g15mwoq3
         WKeQ2nYtg8zriWqSdiThh58oCfl9O7kfNJ9WM0qNKbHZOhFWomvLC5fXwqNHmGT/3QDv
         wuUdHkzD/emtDWaae5ODNqd9uqDeVuBXwmdmZwhAIZK+jJ5OMfLVLDFs9WzLS02quVZp
         LSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689535553; x=1692127553;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSAuqt+s4WpqnMkPR0UJ8Xay9OvKHBk6xAfxVDPkGGQ=;
        b=gEv8/rzwmDCkBiXA1pvxVM2WP4PV69thC6vfe7JoQV0KpdpXKHbSkpYDtHv7VjVhiK
         frYgw11zn65vhIzw1ujUIbIgjNvy9a5sp1khbWg9Fp+ZMvYhPlWa4WjD2P9WQW9hV2zt
         4IjmXylW0YNTJ9qNPy68Bu1cLNCPhP1aRx1vxoy4BebOTiGdfDuBRjxWmDT59vDX2J5w
         s/gJigFMmOZMNsWZqpmXyCxxv/i/zMuiOLq6N4A3new7gn0QM+Se91qMjV+nYLlomveG
         SuehanCfIMnyzgW2OWHiUq23yhIxc/HyDhhQsVJQTXM+BNqDUp5xjOKBHf8IWw9eqXSt
         BPDg==
X-Gm-Message-State: ABy/qLbtqjKDP2or+axKEnnk3rGS+GiRG65A9/g0OkE4l4t7E1kjvXx7
	k3/wfanoo2o/eTht6YsgIx0+meYGU3TZBqabPGo1HA==
X-Google-Smtp-Source: APBJJlHvGNUdX+Ovjs7gI07fwd/iRKlv+A+q7ObU+aBtLpCouxGSumprEh+gumIKhAED0yGvDqX1C9BaAGBFEGGRinY=
X-Received: by 2002:a1f:db86:0:b0:481:90c6:d059 with SMTP id
 s128-20020a1fdb86000000b0048190c6d059mr855078vkg.2.1689535553336; Sun, 16 Jul
 2023 12:25:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 17 Jul 2023 00:55:42 +0530
Message-ID: <CA+G9fYs5n6aobE04YZy3Qy1ZMhAvH6-uQRqidgFmSoei91iW8g@mail.gmail.com>
Subject: stable-rc 6.1: x86: clang build failed - block/blk-cgroup.c:1237:6:
 error: variable 'ret' is used uninitialized whenever 'if' condition is true
To: linux-stable <stable@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Linux stable-rc 6.1 build failed x86 and i386 with clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
-----------
block/blk-cgroup.c:1237:6: error: variable 'ret' is used uninitialized
whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
        if (init_blkcg_llists(blkcg))
            ^~~~~~~~~~~~~~~~~~~~~~~~
block/blk-cgroup.c:1287:9: note: uninitialized use occurs here
        return ret;
               ^~~
block/blk-cgroup.c:1237:2: note: remove the 'if' if its condition is
always false
        if (init_blkcg_llists(blkcg))
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
block/blk-cgroup.c:1222:33: note: initialize the variable 'ret' to
silence this warning
        struct cgroup_subsys_state *ret;
                                       ^
                                        = NULL
1 error generated.

Links,
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.1.y-sanity/build/v6.1.38-599-g5071846d06ef/testrun/18327562/suite/build/test/clang-lkftconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/

 tuxmake \
 --runtime podman --target-arch x86_64 \
 --toolchain clang-16 \
 --kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2SfFoWj9NmKWHRijR0hcoXGjLhr/config
\
 LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
