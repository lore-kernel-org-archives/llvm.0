Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172313F7869
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787507; cv=none; b=ib3Fl7zcuS59xyMOCzXojNKxCyETkBASpNXUNOWyHQ8gcfDXmakvENQY3r7lghN1hpSdhyXhhLfaZwAjMN7/kbf9lO+vL34QA+3nuDuOh0DtLn3GNI96aV89tlyxH2oQAomOm37ao/AeRHznbhcPQOCc0clzU6S2WmIAB9P8eiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787507; c=relaxed/simple;
	bh=G2FXsp8rc8X6cn3GN9/7ENRjhOMTdXRbI6ic9QN690w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDuYYJLbYWjd2AhdtjnVVOxsl5jRusNUK9uKRhG0aKMPbhJJXVwZST8F0kC5lQUhk9N0LM+32pvtJbQQzQpMfZ+xp5C/FST7w1mPhi8mjemEqPtYG8A9xSdFNQf7W8Wl4VUhemcyLNrqE1u6egZ6vdiq/Yhq/8YSY27AdFjXFYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fco3aSeK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fco3aSeK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-462342ac290so1058032f8f.2
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787503; x=1782392303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=Fco3aSeKJfD238nufoELV8SNc6ASD3QtGwDqrQdOhhP2nC3g7MyAkQj/WukgPnjdas
         9Lf5AfcX+6K09St5YYlclJIRtHK5iWF4CiyPgP3Q+bCq8Rc4tKA+bzkVeExxSMzC3X83
         NJbpEJZDxW/dsLVTrcD4x4plhu8rbVXnRq+wZhfA66dPFcu+YipVM07WrtN4m0h9GHck
         fFEODjqI7OBGKmw8/LqDzKdHlTtLjTgH6mRjZotSBsO3K2ATWW6W03CN33bmSSBEyf3q
         yPEFwfqenSNklvkDKVGrSHbMr0Uc8DTLXcmp8l6eHY0eHTSBAkmCEGapxQznDjv9N8mg
         n5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787503; x=1782392303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=l+N+GPcSIQGhBReOox9oyFr6/+Z+4gJ+5DP+htwunFMdxGHNnVRz30uS7tDM0PYF6h
         s8cajGoBAKiKjiI4rxkSyZZL5HaZn+EZXewr8qfy6tMeGh0Ah3enylMAmbo8VtNYE6c3
         A6mK4nb2VP3j4ley/iQbb85Y081FRlqXGVch0SFAx32t3udSym4QUrEd2eyCClQ/iVoS
         GhcQDHVljx8dDGwBsaptCqd+SvVRXTP4kEA81nlhR7LGOVhS1Lj1m3em+uHyJj12+T3N
         Q4vTXSblHHebp236qp2TQi+4scdCkTFFgxZFtIhwwdaGNtpC0AN+TwFhXfgR0iYN9JNq
         Qizw==
X-Forwarded-Encrypted: i=1; AFNElJ8NHkHbjdtuP9O2+PMieNlgngGFI55s52gqNC6A5Ek62hv6+vGk2cjXcpokBAljCddfYHMf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgu32YtLZr+AvqMFdYvu2ZfuAIBxsS94/GKEK+Fk+mnoCnszve
	jefg6sNrv5HQ/Y5d8IMb1UD6AOC8UNrNoReZ7G/XwZok8izDGWwYgCZ9
X-Gm-Gg: AfdE7cl0dOWsxtkaCILCEVVAIW2JqEhaVlhZ+m3CiaoqIH5JHl0t0bCobF0ng4Miay+
	MPM/55IEt3uxe7Sr6AZ2Xesty+Box+LhBEZuSGXWOrlKUbwX3mB4fXD6kJzaiIrbVsVXhQuiTwW
	bqEo7icd4PbxmG7UkBxKtmbfxCJDIpnmUbL7UvYy+yCxoVM9b3+RaD14Xp+QOnzxLbuWCt7pZAZ
	2eTeyGSyYvpgq+yPZIEJV94554Ix/hFqTD4MK70jshyO9WyllTaYqKkZpcQ80sI4Tx2AvRzYTAK
	jKRTHs6bEBSXBbh9BUZHsfQEVGVLTPPXQFXICqwv3nM7RfuVzvPl8XcLJpJ8cZW5ImkrwczgrPP
	ZrA/FbvUAyKChdmHddNt1eIRTMR/pYDst94kiQHDpaC2CKs1XICfTRCixtU3T9l15sdKGbSB2cY
	1MhYFmpiN46NLuIW/cnfobKqv+pQ3Wg7BGCkYDcIpT/9DIWrkeiA6Gv3bTNQLTNw==
X-Received: by 2002:a05:600c:3b9b:b0:492:3445:ecf8 with SMTP id 5b1f17b1804b1-4923445efbdmr126249705e9.3.1781787503384;
        Thu, 18 Jun 2026 05:58:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:22 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 06/12] net: Document PCS subsystem
Date: Thu, 18 Jun 2026 14:57:14 +0200
Message-ID: <20260618125752.1223-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/pcs.rst   | 229 +++++++++++++++++++++++++++++
 2 files changed, 230 insertions(+)
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
index 000000000000..98592cdee3ef
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,229 @@
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
+1. MAC OP struct .mac_select_pcs (considered legacy)
+2. firmware node (fwnode) PCS entirely handled by phylink
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+This implementation is considered legacy and it's suggested to
+switch to the new fwnode PCS.
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
+is held by phylink and :c:func:`phylink_release_pcs` should be used to release
+them.
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a get function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the get
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_get` can be used as the get function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function and
+release the PCS from any phylink instance under RTNL lock with
+:c:func:`phylink_release_pcs`::
+
+   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
+
+	rtnl_lock();
+
+	for (i = 0; i < data->num_port; i++) {
+		struct pcs_port *port = &priv->ports[i];
+
+		phylink_release_pcs(&port->pcs);
+	}
+
+	rtnl_unlock();
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
+.. kernel-doc:: include/linux/phylink.h
+   :identifiers: phylink_pcs
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
-- 
2.53.0

