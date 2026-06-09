Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302848A2C1
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017983; cv=none; b=sF8KVftWwZqdjQVWhj5uYZEcLiTETebhddGpRPR0Y1vsgDKhQxb4tNRNywpTppGA7cv2TlgLdsO2U34HENR6PNDrmCEF+Ph/UeErwWLJbwPQMG/SO3QTqG9NwLnkFw8jUDxf7eU4qMhyIKdHeLFe7Uqq2k8j/R0K6/cA82Cx+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017983; c=relaxed/simple;
	bh=xcOGKoMm03lLeS9XJqjHXKkCWUlcva6I470XZxVXAW8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JsjmZGFrM4qsmy80zm7AQgPK9T+a9qslGEuk4hV8fSuUD1bomhWoMetZYWO9LYkXAfsZ+kNfKBNTCeeNgcL3IbBFRPMQTiD9CBVBl6O1+ANZwLHVih8gykTuvZ/u5XwKe9se4H9+B8DCgVRPUJ53KYvPcagunGWNMWxXV+fuWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IO3TsEbd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO3TsEbd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso916160466b.2
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017976; x=1781622776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8EM4W/LPFkVTamC5bX+lGeXNaVfuL6P3AGe9bieX5rA=;
        b=IO3TsEbdV0yfdlJrvbcNxaT0BVBlacePfYurDyQ1tZptQ30+7wM3sLcIztN41xVeKq
         tve5Q9FXtm8FpWyTXKGfsSDymLiFri+lktAdt978W2zvXEKugAg+yxAu3Skejdd3ggry
         l91qMxCGiVxsnBRKjy5ovPij+YcboyMcR4FIoxPP13m/WPBPw7xIIqKuW3QQiiYx8F12
         62wnySoV+G6vUCeZQ15wB1sOycSNZKUWhW4K3YjVMdSHOyQ5Q2SlOoToxVba5qQiMzXd
         gRKCdbJ2Kyfz1/HSD4TB1yWaEYvRsupO01MX6ByIEh24KOI8vJNkHMCSNIAUzPQ6pkCp
         U7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017976; x=1781622776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EM4W/LPFkVTamC5bX+lGeXNaVfuL6P3AGe9bieX5rA=;
        b=iCiBbtyWHqq2ErE/GCkqU63hlw4JuYCidjPFDUDvyJOaIlSOGorGbX1NsoFriXDCAh
         /RCdlTdorWodn28TXcVu8MrZ926FNLwDymLucytXRCSU+e3AtHx+JDLaXOb1m2E9lDyD
         9aVL2rOJyArnytzFmVB6XPMFTbqhFucEWNro6gCnG5PZRDWXOXAoautI04U7/Qq+hCYA
         mNGHDonf75QTxED8nFwehrQfVlhAve/f7/h2C2gFM9PoghPbfnyWdd0DVW5Wtch/del1
         0d14onIHoFmORIBs/zpruUIjvI+yKVqvW1lINThwdQ4ChSNjDwMK5vczmkuLgcVsQKs8
         fN5w==
X-Forwarded-Encrypted: i=1; AFNElJ8Q7C+kQkx8eYz4mLiW6MzMQAJcmMUseRmAB536SSR2V5dMfMau5q/0lni9Abna+uyM1SSI@lists.linux.dev
X-Gm-Message-State: AOJu0YzsmSQSAkyWpVUdFtb9EfWLffpj/YETpWYWJue3ubHwF29Os6Wi
	LVdDuQD31b3OPlj2NM0Zd2hRFu9z+pS9qfBkhPW/oRik0wxDRGF19NCJ
X-Gm-Gg: Acq92OHBaM+jLCH5G2mDPdhXyh5O+dqor3Zm3r/XHFntvaSzmav0lmhPsDgI2i8RxvC
	sheCdiIDwfMdsjlEqRB2ptq70wfoS3OLriiy5zbJdWoCxj5aHdIWLxiXqb91hOOWwA7c58YZ25h
	PgZSD2nm8OXI/nkiTFpES5ch+jBT/5+no2xx7VRs8DqRqT6qyR1hxREqmvG8uCa9G5YMh3qLwpo
	+FRG0oEIkLU86HkCiMaz0EXVbrv5jXTeKuOuB1umAsH5DlfnA7UpzJp89BJv7aWnTJVw3qvAg/z
	bfBcR+N3a0BmCYJq7XfuDZagLPEaS3hsqyVO9Z1Pk8Lr3BV00/4iQhNrk3qLCMOKIThDLcfaxxg
	AJ1/PTChvbP+3Llo8wTsVTXossr1UQ76val9G4josnY+fAWZ5AAjA5NhTozlKVG7e1BqjjM/Em1
	/FhlXhOWehIimh8mg76k7AkXsrFn67xDZQ
X-Received: by 2002:a17:907:a0b:b0:bec:b4e3:e930 with SMTP id a640c23a62f3a-bf936ce5946mr185365466b.12.1781017975406;
        Tue, 09 Jun 2026 08:12:55 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:12:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 00/12] net: pcs: Introduce support for fwnode PCS
Date: Tue,  9 Jun 2026 17:11:56 +0200
Message-ID: <20260609151212.29469-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

At times there were 2 different implementation (this and the one
from Sean) but Sean agreed that this can be picked and used in favor
of his implementation as long as his case with race condition is
correctly handled.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_get.

A PCS provider on driver removal should first call
fwnode_pcs_del_provider() to delete itself as a provider and then
release the PCS from phylink with phylink_release_pcs() under rtnl
lock.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS. (the same function can be used to get the number of PCS
defined in DT, more info in patch 0005)

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be avialable.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

It's worth to mention that OpenWrt is currently using this on
Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
already ported in staging tree for testing.

---

Changes v6:
- Rebase on top of net-next
- Add Documentation files
- Add fw_devlink patch
- Fix some comments typo
- Rework the airoha_eth.c implementation with new multi serdes code
- Extend PCS code with PCIe and USB support
- Align schema to new property
Changes v5:
- Rebase on top of net-next
- Use the new force_major_config
- Reword some comments and commit description
- Return -ENODEV instead of -EPROBE_DEFER to perevent race condition
- Drop phy_interface_copy patch (Russell pushed an equivalent version)
Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (12):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  net: Document PCS subsystem
  MAINTAINERS: add myself as PCS subsystem maintainer
  of: property: fw_devlink: Add support for "pcs-handle"
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha AN7581 SoC
  net: airoha: add phylink support

 .../bindings/net/pcs/airoha,pcs.yaml          |  260 ++
 Documentation/networking/index.rst            |    1 +
 Documentation/networking/pcs.rst              |  228 ++
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/airoha/Kconfig           |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  167 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    3 +
 drivers/net/pcs/airoha/Kconfig                |   12 +
 drivers/net/pcs/airoha/Makefile               |    7 +
 drivers/net/pcs/airoha/pcs-airoha-common.c    | 1313 +++++++++++
 drivers/net/pcs/airoha/pcs-airoha.h           | 1309 +++++++++++
 drivers/net/pcs/airoha/pcs-an7581.c           | 2093 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  316 ++-
 drivers/of/property.c                         |    2 +
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phylink.h                       |   20 +
 21 files changed, 6123 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/airoha/Kconfig
 create mode 100644 drivers/net/pcs/airoha/Makefile
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
 create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.53.0

