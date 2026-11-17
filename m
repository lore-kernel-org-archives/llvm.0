Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919231;
	b=D0/r2Q1Mt+s2mCHHKThc3MXNk/BKYX8Cju9FpAc84qHMDCgC2b5ueZNcw2+GU1XfyYxg
	 lnKoUA03u/6Wyq3QWJFAToEj22LGNXbQkRUlehDYi1b9pev2fyBUdzi58XGRxS4QsZimg
	 9iFionShcnpmHb/y4kn1uoJ2cWSLeprSyuD+bvXQjNcZA/h+nXss4EFhl7awtPCXpGrfB
	 vg+X7iTxHy4i5V0TR5L4o/gIPkXtNCeVvnK70BPgr+BAo3DBR/25yqlgxvBnxNvzoTqSx
	 ipfwvqypRe70+Ac4mSLa17q4QOxML5SkKV5uadRFuGxj/oHUjzIppzKkAuqTi1OWqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
	b=dKgbcK4x6iivbZVqhID3N40Y6Y/VORIazERUbnogtrjSSKjk39ZW7Ie0mXJnECo4v+mc
	 t2Ibgv46xENWwF+6OoZZudE27pGvnPEXNFlH5b+I8AlNlldpsNYM3eGxhRs06mqBHA9Ff
	 ITYOsPAJv+3TUL+K2eadGfardb6QIgwyGs+LF+euFIe5rP6GlaOWTQBIXX85kbeIeIZok
	 i5J0bRUv5g4/oqR1WQQwxZxwbTlsHQ9r2reK3qRt8vEIWe2Ppi6Rr/vjE2Xzxfc9cVptC
	 Z8whDGDBseDY9nuMV1xPbfqjEisYB7W36+Gu3JP3V4t4uqSAyXzjhbwuTlhQr3roQJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEQVPJB+;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E92606E82A
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81E92606E82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEQVPJB+
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so22342325e9.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919229; x=1795524029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
        b=YEQVPJB+o77YIFxDmYaeni8m8WULOBcumNFuqMSMIOe/zgKTSkVS3+wmHxieM7x4zB
         2NxC5cXA5B1TGdC4j0zvkGB9U1vJR8kIkkvpHLYCxpnq8/iW2aC4pNqTzF3W9Gf/aaiA
         yYnkU+twycHlZB8K/Aevo3BdQxe3vXSt8lrMrpxwp6OGXNpsAYgzjN4HLtyh+V+yqJsK
         GYsRZ8umUgGWO32LGPHjoJAPlYL3b/NaZMB7nHHWIvivzLAi2gUd0ad/LKLB7gpoxAHC
         dqjAhyo5swwckgJiA9nrm6O3z1dVRe8oAOHZsXqw3tAzNVU/EAmR6P+FCc2f9oiqapE8
         OgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919229; x=1795524029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pvEhqoQU9qwof/ZCvruZqPsLisOWBTlPTHxj6hsS5vs=;
        b=jjCUUHYUZjFM97mdv8HzVtcOgtD6JW84EZL9r6HESiMqwULHnfwekKEPK1QrWNNe1E
         f34szd5+5BXGifg185iuW5aQfg0JKa9SqZbXPt8ZBlmmatWNvfo9mKnU987XQOqugYmR
         oaTTxx5A52yynXD4pt8cZFQikqeNXR5cRdfTB5i0JQnWwGZlQ7rvTN94AmwzaYOcWChq
         T910jGpQMNf7hPOa7VwE/4VsIPhO9bTJs8mhWDwFSvzGMwd2oj+3S45aKPrS2PGkbyg2
         zUjiMgXF6zgrLs85EgEHlQG2ILzAhY8O7+V1xKI8YKdjCHCN7wpo/EU3anJ7C8yLl1Fb
         C8ZA==
X-Forwarded-Encrypted: i=1; AL+hErGzGckHw9egds8tcQLG6YZ10N79i0iAgZbLiir0Ac/7k4/ESw2tSThOMxxSM80kRKy9mTzq@lists.linux.dev
X-Gm-Message-State: APuU4Z+fOKFQZaqWuB9VzeY+0GriSHsiOZhZovhojp3S/S2hgK8RCX+x
	oplrcdylE23Bi077ds0EXcCQMG9jj9eWBJWqX8/PlRe3NeStzWWI2cAv
X-Gm-Gg: AYBFou1ykw9x918FpP8FPWguEeEAQtWVPK6tav4wieJfU2gHDSXFJSCkP1OjndSGoWQ
	gkl5e2ZucQMNdVHPCuKhCqB98GDaguCBzq6Jxra15yjCrnkS7uNQrmJGxjFQsnDa2rNc+5Ig/4p
	VhFu3kpeArWoyDzvAVocnXVL+gegzwblkZ2eYgy9RBgncODnL9tY4TFu86wm2ZdL5k5vzIirmsU
	4+w59Sw0/Td2a7YYLdbOR6DfgwHYjw6z+iKV5plQx6oz6r3P3EaGXucu6bu36auUjclt/OmTWJ0
	YwoQt1idruM/HjJokoUMFn9hUvHSTTLewRytup35Jy91LGH2tEvtT1FoJFWPp163T8oS/QyUU43
	AheCi2nMMNp/W+PM35WUXC7tE4HJrYRTWWUTEtfoaoOU/QAOgc1kd8eTSG2VrqxxwulO7oxLfty
	ZGi0yiAhXJFtPDjkTFmEKyn+FpTMMwIsC9CqrHZ8G8DwbzQv6KMYSSKLjaD2kxTL59yq03G5ubh
	T12CzTa+qZePa08EdODafTtbvKIXQ8ctwAf5oT/aXHnwnRekH0VgKEf3+FUhwJLvM6gdVEUO33e
	Yh9PaN5lOye6G5adjjE46qlTrGVRthIlfkG+aPgBsYTrsj5RvKRxkb5S1vzWMvlzvi66tbGNOQm
	CcXb5EAfpsHTP3W22/DbSERIugMReIJKhhQ==
X-Received: by 2002:a05:600c:6989:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb68233edamr212734265e9.20.1794919228634;
        Tue, 17 Nov 2026 04:40:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 10/15] net: Document PCS subsystem
Date: Tue, 17 Nov 2026 13:39:50 +0100
Message-ID: <20261117123956.11981-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Also update the sfp-phylink migration guide.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst       |   1 +
 Documentation/networking/pcs.rst         | 231 +++++++++++++++++++++++
 Documentation/networking/sfp-phylink.rst |  35 ++--
 3 files changed, 243 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/networking/pcs.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b05..3fce8f6ac089 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -28,6 +28,7 @@ Contents:
    net_failover
    page_pool
    phy
+   pcs
    sfp-phylink
    alias
    bridge
diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
new file mode 100644
index 000000000000..71d1283a72cd
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,231 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+PCS Subsystem
+=============
+
+The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
+of PCS devices. These devices contain the upper sublayers of the Ethernet
+physical layer, generally handling framing, scrambling, and encoding tasks. PCS
+devices may also include PMA (Physical Medium Attachment) components. PCS
+devices transfer data between the Link-layer MAC device, and the rest of the
+physical layer, typically via a serdes. The output of the serdes may be
+connected more-or-less directly to the medium when using fiber-optic or
+backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
+with a separate PHY (such as over SGMII) which handles the connection to the
+medium (such as 1000BASE-T).
+
+Remark on usage of .mac_select_pcs and fw_node PCS
+--------------------------------------------------
+
+There are generally two ways to look up a PCS device.
+
+1. MAC OP struct .mac_select_pcs (considered deprecated)
+2. Internal PCS handling with ``num_possible_pcs`` and ``fill_available_pcs``
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+Implementation 2 makes the phylink core code to select the PCS
+provided by ``num_possible_pcs`` and ``fill_available_pcs`` either
+via internal MAC handling or firmware node (fwnode)
+
+Implementation 1 is considered deprecated and it's suggested to
+switch to implementation 2 and where possible switch to firmware
+node design.
+
+.. _pcs_fwnode:
+
+Looking up PCS Devices (fwnode implementation)
+-----------------------------------------------
+
+The lookup of a PCS device follows the common producer/consumer implementation
+used by similar subsystems with a ``#pcs-cells`` on the producer and a
+``pcs-handle`` property on the consumer::
+
+    pcs: pcs {
+        // ...
+        #pcs-cells = <0>;
+    };
+
+    ethernet-controller {
+        // ...
+        pcs-handle = <&pcs>;
+    };
+
+On :c:func:`phylink_create`, phylink will use the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper function in
+:c:struct:`phylink_config` to compose the list of available PCS that can be
+used for the phylink instance.
+
+Phylink will then internally handle the selection of the correct PCS for
+the requested interface mode based on the interface modes configured in
+``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+A PCS is considered eligible when the requested interface mode is present
+in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+``supported_interfaces`` describes all interface modes supported by the MAC,
+whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
+
+For the special implementation where the PCS is internal or part of the MAC
+and a dedicated driver is not needed, it's possible to leave the implementation
+of the PCS to the MAC driver and just implement the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+.. _pcs_consumer:
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_possible_pcs`` and ``fill_available_pcs``
+of :c:struct:`phylink_config` to use a PCS for a MAC.
+
+The fwnode implementation exposes simple helpers to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_count` and
+:c:func:`fwnode_phylink_pcs_parse`. The :c:func:`fwnode_phylink_pcs_count` helper
+takes the fwnode where the ``pcs-handle`` should be parsed and return the
+number of PCS entries described in the fwnode.
+The :c:func:`fwnode_phylink_pcs_parse` helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and the maximum number of PCS to parse.
+Contrary to :c:func:`fwnode_phylink_pcs_count`, :c:func:`fwnode_phylink_pcs_parse`
+helper fills the allocated array with ONLY the available PCS and return the
+number of available PCS found. PCS that returns -ENODEV will be skipped and
+won't be inserted in the allocated array.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_possible_pcs``.
+
+It's mandatory to specify for what interface a PCS is needed. This can be done
+by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
+If the requested interface mode is not present in this bitmask, phylink does
+not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
+for SGMII but require one for USXGMII)
+
+With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
+is the following::
+
+   static int mac_fill_available_pcs(struct phylink_config *config,
+   				                      struct phylink_pcs **available_pcs,
+					                      unsigned int num_possible_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+						                    num_possible_pcs);
+   }
+
+   static int mac_setup_phylink(struct net_device *netdev)
+   {
+      struct phylink_config *config;
+
+      // ...
+
+      config->dev = &netdev->dev;
+
+      // ...
+
+      // Parse possible PCS and fill num_possible_pcs.
+      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
+      config->fill_available_pcs = mac_fill_available_pcs;
+
+      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
+
+      // PCS required only for USXGMII
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
+
+      phylink = phylink_create(config, //...
+
+It's worth to mention that it's phylink code that takes care of allocating
+the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
+callback based on the value set in ``num_possible_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_possible_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink.
+
+.. _pcs_producer:
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a xlate function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the xlate
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_xlate` can be used as the xlate function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function
+on driver detach.
+
+A devm variant, :c:func:`devm_fwnode_pcs_add_provider`, is available to
+automatically release the PCS provider on driver detach.
+
+It's worth to mention that xlate function MUST reference already allocated
+:c:struct:`phylink_pcs` pointer and MUST NOT dynamically allocate new PCS.
+The returned pointer is used to identify the PCS across provider lookup and
+removal notifications.
+
+Late PCS registration handling
+------------------------------
+
+It's possible that a PCS becomes available after the MAC finished probing.
+Contrary to the usual producer/consumer implementation, when a PCS is not
+registered and can't be found, the fwnode parser helper returns ``-ENODEV``
+instead of ``-EPROBE_DEFER``.
+
+This is to prevent race condition with particular devices that register
+MAC and PCS with USB or PCIe and require the MAC to be registered before
+the PCS.
+
+The phylink logic correctly handle this special case and keep the phylink
+instance in a fail condition.
+
+The PCS fwnode implementation provides a notifier to which each phylink
+instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
+registers. When a new PCS provider is registered, the notifier is called
+triggering the :c:func:`pcs_provider_notify` function.
+
+Function :c:func:`pcs_provider_notify` will check if the just added PCS
+should be used by the phylink instance. If it should be used then,
+it's added to the internal list of available PCS and a phylink major
+config is forced.
+
+If a phylink instance was in a failure state, with the just added PCS
+now part of the available PCS internal phylink list, provided all other
+conditions are satisfied, the configuration is retried and the failure
+condition is cleared.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
diff --git a/Documentation/networking/sfp-phylink.rst b/Documentation/networking/sfp-phylink.rst
index 5bf285d73e8a..306505118eba 100644
--- a/Documentation/networking/sfp-phylink.rst
+++ b/Documentation/networking/sfp-phylink.rst
@@ -311,33 +311,20 @@ this documentation.
 
         priv->pcs = lynx_pcs_create_mdiodev(bus, 0);
 
-    Some PCS can be recovered based on firmware information:
+    PCS that should be recovered based on firmware information should implement
+    the external PCS as a :ref:`PCS provider <pcs_producer>` and reference it
+    with the use of PCS fwnode helper :ref:`PCS fwnode helper <pcs_fwnode>`.
 
-    .. code-block:: c
-
-        priv->pcs = lynx_pcs_create_fwnode(of_fwnode_handle(node));
-
-12. Populate the :c:func:`mac_select_pcs` callback and add it to your
-    :c:type:`struct phylink_mac_ops <phylink_mac_ops>` set of ops. This function
-    must return a pointer to the relevant :c:type:`struct phylink_pcs <phylink_pcs>`
-    that will be used for the requested link configuration:
-
-    .. code-block:: c
-
-        static struct phylink_pcs *foo_select_pcs(struct phylink_config *config,
-                                                  phy_interface_t interface)
-        {
-                struct foo_priv *priv = container_of(config, struct foo_priv,
-                                                     phylink_config);
-
-                if ( /* 'interface' needs a PCS to function */ )
-                        return priv->pcs;
+12. Populate the :c:var:`num_possible_pcs` value and
+    :c:func:`fill_available_pcs` callback and add it to your
+    :c:type:`struct phylink_config <phylink_config>`.
 
-                return NULL;
-        }
+    Refer to :ref:`Documentation/networking/pcs.rst <pcs_consumer>` for
+    further details and examples.
 
-    See :c:func:`mvpp2_select_pcs` for an example of a driver that has multiple
-    internal PCS.
+    Notice that the previous implementation of populating
+    :c:func:`mac_select_pcs` is considered deprecated in favor of the new
+    described above.
 
 13. Fill-in all the :c:type:`phy_interface_t <phy_interface_t>` (i.e. all MAC to
     PHY link modes) that your MAC can output. The following example shows a
-- 
2.55.0

