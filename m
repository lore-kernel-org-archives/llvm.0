Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504412DAB
	for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 11:14:21 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id i131so1751663ybc.9
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w2bzJsB3PbL2X/ibwn3ezEZIfiFkuOTKtlMfImy68cw=;
        b=SZpX7Q3VH7kdT2mdWoO/QbBXjTZrWo4vvC/LeRfeAISTPI9+3kKF6QzsnDSlTjhzsz
         y01yoLLOAGTWPvGFzhGfBuYQOHteTyMuWJzvJLZ8YcJp4563rQJuqMyr9NtiJ1/RXc+5
         6Zcv+KoRPnYi96FeLJOPtQ1wkq2uvuViyePYA2zNupq1V7SnJVDFLHs/ZXV0Nvqn0zTa
         JHmbllz/nTATi0fRb7vfjhpD8bpJbN1Rw6PeDUyc+LLZavrgYj5ul2VLSnBKkWDgPgS+
         BOLMSfKscmE8mG4ImjW3Leym5HYNAkY4LHVbevGDqRFC9E3u5mblGFNltT/zyubmcWRB
         cO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w2bzJsB3PbL2X/ibwn3ezEZIfiFkuOTKtlMfImy68cw=;
        b=HArUrSVyYGtA0gMHrt+rSs79MhD0+GlrHmPkuPoyrHyitjRnIyAGvNmbpeuQxfUD1e
         dSfz9XOxRp0R+3qCDtGMgavBGasWkQUmG+TKvSma8WA0bly8SAc2uajYhiHhZJFZqMhA
         paosgakCA2DG5cC/bXy7aeK3H9zJDwv4R2ewAoHjJecaS+LPmL3p5UZ7fBAAqJmW5i1b
         S99XVGF6XH84MELddi95YJHkRY/3fdcphjsac675IbJBLIK7m9UK7IgByy8JJ0QNjvBD
         0pyhasIpQrZl4hdfgW7gY3pf7OIuHMlKCylqSP3hoaVOzUJXGWvCraHinaNnp7qqqCU+
         0+MA==
X-Gm-Message-State: ANoB5pm93dEIZDLO1WfhShpPza43OlE8eTr+k8wqV41Du2spA1uRuHH+
	ukIjgNyP97Kk8bAJcpxksp6o7Djjagc3nmr1D5C2Og==
X-Google-Smtp-Source: AA0mqf4HAlvllfiTAy8O9bwGOZY+LqHNa1fYXXmuHTN8m/MtWdK5qYiJCbTluraqvq+eDKvsSspGFDYmqQHDLvDcHGI=
X-Received: by 2002:a05:6902:b16:b0:6d6:9455:d6c5 with SMTP id
 ch22-20020a0569020b1600b006d69455d6c5mr20823348ybb.164.1668078860624; Thu, 10
 Nov 2022 03:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 10 Nov 2022 16:44:09 +0530
Message-ID: <CA+G9fYtaNmXOKnwH_ih9vZyFeaD+Lvzxf3WTbAV50rBtwkPxpQ@mail.gmail.com>
Subject: x86: clang: acpi-cpufreq.c:970:24: error: variable 'ret' is
 uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

[Please ignore email this if it is already reported]

Kernel build warning noticed on x86_64 with clang toolchain [1].
Build failures noticed from next-20221108 .. next-20221110.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=x86_64 SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- HOSTCC=clang
CC=clang
drivers/cpufreq/acpi-cpufreq.c:970:24: error: variable 'ret' is
uninitialized when used here [-Werror,-Wuninitialized]
        acpi_cpufreq_online = ret;
                              ^~~
drivers/cpufreq/acpi-cpufreq.c:960:9: note: initialize the variable
'ret' to silence this warning
        int ret;
               ^
                = 0
1 error generated.

tuxmake --runtime podman --target-arch x86_64 --toolchain
clang-nightly --kconfig defconfig --kconfig-add
https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/lkft-crypto.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/distro-overrides.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/systemd.config
--kconfig-add https://raw.githubusercontent.com/Linaro/meta-lkft/kirkstone/meta/recipes-kernel/linux/files/virtio.config
--kconfig-add CONFIG_IGB=y --kconfig-add
CONFIG_UNWINDER_FRAME_POINTER=y LLVM=1 LLVM_IAS=1



Build log:
[1] https://builds.tuxbuild.com/2HLg3VgMgxRXBn31n6Ig7BFwSy9/


--
Linaro LKFT
https://lkft.linaro.org
