Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC828EE
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 10:52:04 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id w19so1848640uad.7
        for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 03:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987923; x=1684579923;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bD6SfECQ2ADOvv3hp+b+Hh0rcGbyto+SEbR60lrY1dY=;
        b=G7bYMg0O1BCstKbdpADc8/oJ1/2A4VRecLc565KFfTzpscmWiEkfXnzHnvIadofIFh
         OjMoY4hElAUDLJfC5I2BDJj0x4JWRKJl5zxihU7sPH+99KSCFiiAf/YKkk/n7ktRfHOF
         5HnSgFVrcZuMpyHv8qgvchQ9ggGaS2yu6IeZKRKC5vQeS43iqeGN2iMpy9/PIMMPpNXa
         w3ZV4S5e5vSdzQOwWA0FhyV7W9lN7YCUtHCL2WzIVQi4mSWWlUzJgcr+nAVzXtM2/TCS
         6LYvyWq2gjAJyZHwxRJmUqTsJ/9Atr5wLeamrewfCk5M1xIotLjmotwiqcTZzSYY0uq4
         6Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987923; x=1684579923;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD6SfECQ2ADOvv3hp+b+Hh0rcGbyto+SEbR60lrY1dY=;
        b=S0UqI0f5Q+Ju04dMZ3NkMq95JQC0UixFurcC8dHDmCBzEePhXM7lqchmTk1f18y32i
         nO5gTOxAOgrSEs9se2Oo+fgvVNbpBcWgF2fj+3+r9cdWFPZrYAzsrvdOhyJ/dbmPunBv
         SfYQrZdi5EjxR8szkmGjp1UgguuFnHkWOM/GIGkCtZqoxZKfYZZdIsfci26uFPqQKlcl
         t/oItMD0PdIxJCXDcVS1RdA2AaFwrU18pLiq5rfDK+f8lvoK7gXLyP3TXZCk2SrxyLlb
         v52a8rNHB3Tl73KSrSaMOTKZSfFRG67J5C5UZxT8XfvI2crMbQfwfSybYpR9ETpELfGn
         Z89w==
X-Gm-Message-State: AAQBX9f4n0CmeQN5ggYyyyVhXuEjR7FwCr3uUN967VsA6Ms62w3ucpBH
	PfHd/PopjWtokef+kJQC08YVxRAMPvAEXIw2RZ69Z6kBTF1oVIXs+JI=
X-Google-Smtp-Source: AKy350Y55UZ8B68XNljcnA3b3qT2rounlfBKD+bGk83+L3xVWuciribECtEXexgCfK0NMqXchyhX8hjTQd13EK9qZjo=
X-Received: by 2002:a1f:a407:0:b0:446:b903:d76c with SMTP id
 n7-20020a1fa407000000b00446b903d76cmr1199528vke.5.1681987922927; Thu, 20 Apr
 2023 03:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 20 Apr 2023 16:21:51 +0530
Message-ID: <CA+G9fYuMEEzTUyF-pCVuZYd+BU53_8MRyXoOmbYEo1O1v=9teg@mail.gmail.com>
Subject: next: arm: drivers/net/phy/phy_device.o: in function `phy_probe':
 drivers/net/phy/phy_device.c:3053: undefined reference to
To: Netdev <netdev@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"

[ Please ignore this email if it is already reported ]

Following build failures noticed on Linux next-20230419.

Regressions found on arm:
 - build/clang-16-omap2plus_defconfig
 - build/clang-16-davinci_all_defconfig
 - build/gcc-8-davinci_all_defconfig
 - build/clang-nightly-omap2plus_defconfig
 - build/gcc-12-omap2plus_defconfig
 - build/gcc-12-davinci_all_defconfig
 - build/clang-nightly-davinci_all_defconfig
 - build/gcc-8-omap2plus_defconfig


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
------------

 arm-linux-gnueabihf-ld: drivers/net/phy/phy_device.o: in function `phy_probe':
drivers/net/phy/phy_device.c:3053: undefined reference to
`devm_led_classdev_register_ext'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.o: in
function `davinci_emac_of_get_pdata':
drivers/net/ethernet/ti/davinci_emac.c:1770: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.c:1772:
undefined reference to `of_phy_register_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.o: in
function `davinci_emac_probe':
drivers/net/ethernet/ti/davinci_emac.c:1990: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.c:1990:
undefined reference to `of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.c:1991:
undefined reference to `of_phy_deregister_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.o: in
function `emac_dev_open':
drivers/net/ethernet/ti/davinci_emac.c:1497: undefined reference to
`of_phy_connect'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.o: in
function `davinci_emac_remove':
drivers/net/ethernet/ti/davinci_emac.c:2022: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_emac.c:2023:
undefined reference to `of_phy_deregister_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdio_probe':
include/linux/of_mdio.h:23: undefined reference to `__of_mdiobus_register'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/davinci_mdio.o: in
function `davinci_mdio_probe':
include/linux/phy.h:458: undefined reference to `devm_mdiobus_alloc_size'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw.o: in function
`cpsw_remove_dt':
drivers/net/ethernet/ti/cpsw.c:1410: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw.c:1411: undefined
reference to `of_phy_deregister_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw.o: in function
`cpsw_probe':
drivers/net/ethernet/ti/cpsw.c:1318: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw.c:1322: undefined
reference to `of_phy_register_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw.o: in function
`cpsw_slave_open':
drivers/net/ethernet/ti/cpsw.c:614: undefined reference to `of_phy_connect'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.o: in
function `cpsw_remove':
drivers/net/ethernet/ti/cpsw_new.c:1354: undefined reference to
`of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.c:1355:
undefined reference to `of_phy_deregister_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.o: in
function `cpsw_probe':
drivers/net/ethernet/ti/cpsw_new.c:1290: undefined reference to
`of_phy_register_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.c:1289:
undefined reference to `of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.c:1354:
undefined reference to `of_phy_is_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.c:1355:
undefined reference to `of_phy_deregister_fixed_link'
arm-linux-gnueabihf-ld: drivers/net/ethernet/ti/cpsw_new.o: in
function `cpsw_ndo_open':
drivers/net/ethernet/ti/cpsw_new.c:768: undefined reference to `of_phy_connect'
make[2]: *** [scripts/Makefile.vmlinux:35: vmlinux] Error 1


Details:
-------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16368708/suite/build/test/gcc-12-omap2plus_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230419/testrun/16368708/suite/build/test/gcc-12-omap2plus_defconfig/details/

Steps to reproduce:
---------
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

tuxmake --runtime podman --target-arch arm --toolchain gcc-12
--kconfig omap2plus_defconfig


--
Linaro LKFT
https://lkft.linaro.org
