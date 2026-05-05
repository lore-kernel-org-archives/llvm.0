Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376A14A3419
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005647; cv=none; b=ausb46UPJI158ddX7B8QHPPs6LaxkDFS0nBuDCVllvpcFhSL/aZR68mYAAsAhmOpMq3Lo8wQ0ROsyle2ctja3tk8invpXHsOavEQBMxoCJYcXaYYY4cs8erEVV4aORxFLkYosbVszxdj1UduQLWWVm0q9GS0ibW9NUwGDWVQzOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005647; c=relaxed/simple;
	bh=24jMbiGXKtINRJ89onrqgntIbdG758ocW05MGZvP3j4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=b1lC3Hq4Qy3bxrnztp6h5lN3NUcAVZy6GxKGXeDXslWI3iVkTF0yQ0Kuz0B/uA+92rwVsJAwLsfOCw8oopiSCMirDaRSo3Zlz/LkcJC+Q1IuGhOo4gIQsNjMb1hbYkElxgWPunLCgdIpkaJdWS6bCJEY9hGAWmSoePrbHIEjZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3C2K72x; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3C2K72x"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d146705b4so15174665e9.3
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005645; x=1778610445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=c3C2K72xx5d3agFEvf0cCEVpddBgbIeyek8/yyZBVZLxPO4Yz+kqp84tXjMqnGjs7I
         aV+oFenVTNYYwp5RanUq9+dbpRMdey1hssDnRbvgz9bKdTLY495ewWc/9Htq9s4Quslz
         fhosy7WxLsak+4i17STkUAgUmXeO6t3BNp3ZQTnkhE82CnZ+K2YbIL+LfCKt61LSGNFJ
         eg8/SW41sO+RMMIZxJbp8hdWpPe72xq9xJg1DHFHHwMpkG7suaF8oPYjlAkm+KOXpRp0
         8KlCgGpH2u+n3xMDcAMXDa59nx3QDlM4k0OV2FGV2zbRTu5680/Vp4sMJ2Oy2ClBv6Uq
         W1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005645; x=1778610445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=GH1R7CbAuxrV6Ra6uXBYiE12+zOrbyx4f/X81BrCo+ZH7DeZnHVPk4f/QDeLv110xd
         uoPqiSrMiwCBdLp6+Y8rGvIURiVIzOqQeGB11vxtu0CBSf8JExwoCHUqvLw/BPXwBmmq
         aYhlaSswbkYHCbhFRxj5n9VKQdJFq+jQvg/D4XI/GCZdLOcdoqZoSjdSDvwSzoKG5g0R
         V7qh2uFGAUahma/N3UJVO9i/HuSt3/XwEWOlB8ncH2flIV5hlsBmbA+JLuNTIDy1vgp+
         BFxDdMNEhAB6m1t74Q92LrTv5bw5cn9h0be2HsH7WUi5MP3Vpdu/ULI9pPCsNPwXnpJx
         5+zg==
X-Forwarded-Encrypted: i=1; AFNElJ9EaWlbYTyzEP2gKL1J05slxQyC9fWIOyh20Hu75kU6BRoqztuWiKDhbLCvpnyQ1N6hAtCG@lists.linux.dev
X-Gm-Message-State: AOJu0YxpXryploxTLCtMmEg/NcMFtD/Xa+aSEWqB7REE0Rf6Cua/MgcB
	vqn6fPH0PW0L8wDI/MaeObXB2jradsdke87ppsLXyHL8LN41nlrqemOQ
X-Gm-Gg: AeBDieus7qhlBFKN07FkpgxqApzVcB7vDGMKl45ue7zQmsFVu5smko0cTAqPgr/clr3
	3K6O321oJUKs782pAJScfpxCJh3916oNzLxaozBoIeU41bh3ChsJMc45yqHZrijJ/P9EgGwlfGb
	Z/VrnXNJrnUfamLNvAhJbjct1sG/wZGBF7kuhppyJEhdD8H6EFpuds42jWL/E1yPyd08ThoGcP7
	vK2bhCISkbpNJksQuTaySSpthKMzIDkBUs0f5pwi3QGIWOjAtcVfVIqv0WjGc3lUIi1BtMGUCas
	o+BP7AxlznXBpKtc2HPJ+kJIgR2bLtwFBZLO8jBDLPgvTkPk/UacQLLZSZilcgbFmBoEbOuRYGC
	G/+Uxl68jzFkqMMJfhTHOsaFXsjvtmvUr3ukeqU5AZv+ffqWelceQfQdbgqE3d0oQvDFjK6x3fc
	2vaWB8Sndd5Pk8BbytbT6tgs/QZqEuku13obMYbZBpVwaKKoTH4vivkOlH3VG8YULv3FQKyJct4
	XQ62mI=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr5237455e9.16.1778005644350;
        Tue, 05 May 2026 11:27:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:23 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 00/10] net: pcs: Introduce support for fwnode PCS
Date: Tue,  5 May 2026 20:27:01 +0200
Message-ID: <20260505182713.27644-1-ansuelsmth@gmail.com>
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

Christian Marangi (10):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha SoC
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/Kconfig           |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  144 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   13 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2921 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  280 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phylink.h                       |   15 +
 14 files changed, 3862 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.53.0

