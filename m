Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DEA48C8C9
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018009; cv=none; b=h/mTooK5aQbTQBzYnSRgeeHlhFfXMYkmbLo/dV05Blx3xc5GXxYfWopN8U1k26LpjJKRMSNUaS2S9eWvlw+1naDHM/d21pUT3AtStEkGaw4NHwpHvIZl7o2Xgfw23ahgrxxcqfN6S1tastHfm6FK5n/eH903fYOeNypqEnPcU1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018009; c=relaxed/simple;
	bh=xyrdZBv2jUyBNv4T6zqXsmecpMfSiIR0CElP0cmzUiA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXiQhlf1qPc1qhF4umD93BCDLzI3TPU1h+dkxLA+XgIXEKkrZtSybNbTfDqXO7juJTfM2a1qxJ5ZizZ2xd4y1mdcO3vADDzaKpsLPE+UCSc+VGXaaTwROjvyTnx/IwfDvA0kTpyvjuDJ6ReCHpJ6CHHVzDxr9FMtVPj1Dttoh94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8x+Opa1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8x+Opa1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso690649866b.3
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017999; x=1781622799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSf0R7tWifC6OwsYwt6uP7ibjMLjaY8AWyTpXb94lXI=;
        b=J8x+Opa1QylM305zlb6CDCjink0nF4xXDLBC0MjTd6aTn+hV048cmzFsuIkiW29byG
         JYzyEB2V+9p5YNyPmqeS72x9JguepG7iUTC/s3mY+eWNjZAwgxuFabuO7o2EBS9yooXb
         gsHT9njCujYew9WDH7eayOeDgYAg1u4mwh6Fs/bEvnvnc7hwadSR4i7/A12h4JVa3vs8
         Ahz4ZLqS65fhZyE9/pqWZSuF3aRWtwEoGUEMGAPNS0ZmDSjKzDtCnZ0k7ry2cqElWGDh
         Sn1PHU3tB2FzYKouZ35DPqGzqGUySmdAM9Ucc4+95k3gFMQrUygziLcOJn2UyJ0nxj5L
         9j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017999; x=1781622799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSf0R7tWifC6OwsYwt6uP7ibjMLjaY8AWyTpXb94lXI=;
        b=FMDsM4Tc1FuY6iYi7c8KhQYG+gkeE7RHPvVt+iZ8TjD4aOuKjqrPmJQ0pVq/u0ZDhg
         v1rLjUq2VCz9r8JD1ixFCQwmwi8yf1XI/8bR6r806fHLhoBKoqZjB3NjrjTSGVe8B+05
         5HiLYs1A4ZagPjiixnlVJHphvqotUdtfX0G28JNIimaWVr6RFMqPpbD/04ZFv1jTtZsT
         ZUdquqAkkYbn1n/gSmt6nlNA36udzW9buSCtrGlFMsZh/9Q+6imkR+nH+iF5Sl6Iho7m
         09JhpKAAKWNZyC0uepa/ABX2W97IeaZPow0a+0sxnBrVBXA5vX3Tqo3vW9e4D+63QRhg
         s/Pg==
X-Forwarded-Encrypted: i=1; AFNElJ//lY31Fll252X/WOJ/hZvdJ1ASrHxcYXtH8lUOe4Zgg1RgrlPmj4XFzkIRcHWpbzC/wbVw@lists.linux.dev
X-Gm-Message-State: AOJu0YwIusNx6k8p3UWXwBa/6DNjeX/JMjGPXqB29FWLOdfypfSzGNOe
	uvufhkmZ1xTRkgBRwPULCPQ0BGUMr7OlX9TVl1YVFrodsgDt+o6U4aUN
X-Gm-Gg: Acq92OFUR+bWKDHF+u/8FMViA5rFpg9Go7CRqXxknN+ptemDh7a12H9AUX5HIup5ccc
	7WKkextrjxMiDiWGZ7Dbi/CuKThP5R6hzXVbg1SERx2yHFbyvkuPiYGAKOfbn6sGITiNtSydSLz
	ryDfZbLZiixqY+TMmEolIB8IDRmabheH/9SrLZx9zP9ggTSxNT4XI1y7yeBJVJPiUnoz08QHx0a
	R/ToFuPU8Xx3LQ5DDVUHkfT2WT9dyTNMN8xijQrU743Qpjn1Fk2CwoLjYznXVNFPFONZRLQznlH
	qXCpTkUTRWsCardedjrR8E66ztSwpK4SHpHd+zKLBlJgSAp0q9IedfYZ4VtRKP+MmdczybcjQr5
	uUEFT9VwbxqM4ZAdZY13842bCODstiHaz07E+lFqmgl8WrTbWwp3ofEI/MyT10PvXeVuG9ROAbo
	9YFaXJ8QagzJPO3QQvZas2CU7f5pkhFUaZ
X-Received: by 2002:a17:906:6a01:b0:bdb:a519:5677 with SMTP id a640c23a62f3a-bf371a55a97mr920359666b.16.1781017998468;
        Tue, 09 Jun 2026 08:13:18 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:18 -0700 (PDT)
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
Subject: [PATCH net-next v6 06/12] net: Document PCS subsystem
Date: Tue,  9 Jun 2026 17:12:02 +0200
Message-ID: <20260609151212.29469-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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
 Documentation/networking/pcs.rst   | 228 +++++++++++++++++++++++++++++
 2 files changed, 229 insertions(+)
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
index 000000000000..9436ba43cebd
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,228 @@
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
+used by similar subsystem with a ``#pcs-cells`` on the producer and a
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
+On :c:func:`phylink_create`, phylink will use the ``num_available_pcs``
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
+of the PCS to the MAC driver and just implement the ``num_available_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_available_pcs`` and ``fill_available_pcs`` of :c:struct:`phylink_config` to use a PCS
+for a MAC.
+
+The fwnode implementation expose a simple helper to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_parse`. The helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and a pointer to the maximum number of PCS to parse. The helper can also be used
+to obtain the number of PCS parsed (without filling the array) by passing
+``NULL`` for the second arg. In such case, the third arg will be set to the
+number of PCS parsed in the fwnode.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_available_pcs``.
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
+   				                      unsigned int num_available_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+   					                    &num_available_pcs);
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
+      // Parse available PCS and fill num_available_pcs.
+      err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
+                                     &config->num_available_pcs);
+      if (err)
+         return err;
+
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
+callback based on the value set in ``num_available_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_available_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink and :c:func:`phylink_release_pcs` should be used to relase
+them.
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arg, the fwnode where the PCS
+provider should be registered to, a get function to return the requested PCS
+based on ``#pcs-cells`` and a pointer to reference private data for the get
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
+registered and can't be found, the fwnode parser helper returns ``-EINVAL``
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

