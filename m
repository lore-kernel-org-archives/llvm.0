Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963401A317E
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746994404; cv=none; b=ehZuZ5G/L9/FpoyKj1+rnOEcsuCMGo+o+tSkWuQ0+m5KRiDCzruhIpUPu4BYwN81MQ1b7yeApOlcSWQhoBspF+xaYCd0vnCFzFg3230i5IBVNf4R/lBXU3VQH1bygPAcCPhPII5BWUEhhdZAcR/2lpesR1I1ZWqszqnf11t/jNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746994404; c=relaxed/simple;
	bh=dbzfp//VkOlTcDUuZ1Iq1EBVhPZUpGEIiSSwXuigwzI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HJBOi+QcFeHGwtwGdIXgso2RcGI3eMjvKMMr2F+iJXo82LnmDVM9cS7o3CLYZEfPGo+/Uk7mn06nb0LdHsfDkHpZDqRXBCf0wLdUsmDeumRqtoVWJegN93t5ww6pc/OSI9ncqyucVzXdLXpHd3Hl9nAkMOJoNt56zB/Z/KG8yMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dL5msPyV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dL5msPyV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf680d351so27641805e9.0
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 13:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746994400; x=1747599200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRQTyAD6/LtJP1mViFxGTV7MWeC7Erzm+rbDZD3bI7g=;
        b=dL5msPyVEUTLx+VLQcyVMENmVMAnzt0ABy5RJ2HhxDhN9sP/Kj9mQydJdNKkyhvuJE
         kub3Vp7xiy5BPsNSZ1NqlMGSKQvjW32S801obv8SYK7t5pSEtfX7IHV4/Yrq7oapeJPL
         O4wnlR2jcRSc+CZjeUfJrSPlsiuyrGt4xwBseJgkxF7dnolmkeg9qreabtoWRWQwaTWQ
         +EUVawMkUIOP9zPY72Tr4F7Ih2ZmI79+p3kvdzP1BrdUeQ1ZFQ8lE4uTVCl3eHHTUR+g
         UidQHdnT5mgICM4pk869f+4nnebMv7Tc/syvSQO2lQ96c/Pgg1SWCpAVHeRBYKX/emCc
         7xVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746994400; x=1747599200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRQTyAD6/LtJP1mViFxGTV7MWeC7Erzm+rbDZD3bI7g=;
        b=JfpthL2kZ/gpIXfbR+bIoit2LGj2NPJDJgVdBmxFUaEJyqQJxBzldauUhdEAiPf29N
         grWekqueOUKYq+g0og+pwQi8FDhhQpZqi1KQZMdFU39j8pzzuisnebAEk+LIuUS5urfw
         6Gc90iW0T9B0TG1Isr7sRkhgPx65cC7S0uAx08UXfYbYFZypRkj1pCqCL7KS+3hQaAJe
         7fornU1NyX2LMc+M9HX+/7i39YvMQWbXm+p/9LvAfDD8rjNjhJWPsHvzVsN+kjC0Bicj
         xmiNPjruHvB/rbn35CMYUwh76IgUg+bXRfDQrEOYmFdxyaCirpw6V5r7pT70/QJC+68l
         xfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+8pfF0DMhu1GZgajUthNCuaEmvwd90ku5nfyC59XR0RHateadvT24ijAYg8SEUML2moWn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0HxoEd8jTTp2HzIxpwDN89eOFAXYw+Xu2Y8bno8Nhm7aU7dQP
	3crEX92XMjjrPKvxqu2yEX6tykGOnIEmSPKRPsLaR8Jat/3p4v4R
X-Gm-Gg: ASbGnct5/WNLY8Eomi18T/4Y1HThQz5wW7V+3gTZ42G6FmK2JtbRn800u0/81/tjf5C
	yqCK/RAbkuJ3/uVlfpBMPfk/UWFzq4Fn33Pb2Wd5m238jOzakw35YrRDN67rZz5iLu249fM3RzD
	P71iU10uv3hc1GQOK63mgKsSx0W7IgJ9QcuUDm2ED8HebXRhOo5FscIAsx1I3FUupKoGdbLdbI1
	DjbUhKnSWMMZn0luvkPyiYsV7V4EeUJa2G5g6Sm+CBQG10HEgLZd5dT6P9yt5n/qdLc70J2/qCW
	5ckC+Goe60XR3qTGqwI0mszC0+fn4ZtmCbpTvjLkvi+DZkGdST0A3a/NzUH6VpBB03VztUdyGcs
	CklhH1LQfomnSMAyTcuk9Lsyg1RGnUKc=
X-Google-Smtp-Source: AGHT+IGefwAiFZcWgg17TvQ1kAB3qdQoikkJRf7xlh5CqFYtfFSxmQQSC9lri+IHaKSlJy1iOEhTeQ==
X-Received: by 2002:a05:600c:1c9e:b0:441:bbe5:f562 with SMTP id 5b1f17b1804b1-442d032fc29mr118863085e9.16.1746994399418;
        Sun, 11 May 2025 13:13:19 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm100615165e9.19.2025.05.11.13.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 13:13:18 -0700 (PDT)
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
Subject: [net-next PATCH v4 00/11] net: pcs: Introduce support for fwnode PCS
Date: Sun, 11 May 2025 22:12:26 +0200
Message-ID: <20250511201250.3789083-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
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

There is currently an equivalent series for this feature where
a wrapper implementation is proposed. I honestly don't really like
introducing layer of layer of wrapping to workaround stuff, so
this is my attempt at giving a more direct approach to this.

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

---

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

Christian Marangi (11):
  net: phy: introduce phy_interface_copy helper
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
 drivers/net/ethernet/airoha/airoha_eth.c      |  155 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   13 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2921 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  287 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phy.h                           |    5 +
 include/linux/phylink.h                       |   14 +
 14 files changed, 3883 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.48.1

