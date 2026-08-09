Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3563D952D
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307502; cv=none; b=p63hraWfJm4AgMcBBMzKQziNlJJVlCBdo3DhhAKhPrpYvvjcw0lyxBknPhy4/2eWby9aDj9H3rlc1wSm3YQFKAkBKuuKiPpNc1/Mu4FBIch1vb+aeBRPH1PctdaHCMw+/LKyWQBeOzFV1DY2niZx2wDuYqgUhMPrkpuwVxlW+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307502; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9kASXwKimCEmSeA0Got/tkNGBQE/nObC+yZJ6YDvLEHRa39f/qsUciEz9nLRssvyj5VUPRFCUSeObckfTuGT7LzVLbajUXmDYhVezRLgcgo32kAc/Arev/By1ue+Hfi1th4KbBL0XHuzzLcy5jGVmLDGannkbl2/bhQVJkSfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0SSODE1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0SSODE1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so10775835e9.3
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307497; x=1786912297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=m0SSODE1YLy4XbeJEZxmS3LjuJep6zfJrFBC/hPlTQmy+TlzxWw0x8zty7fvsOzK1f
         6CPp8+yUzWU9ntMiSXcGzvpumgmriZfFtM76jCBH8H7OH/orGrA23zqHAeUQAm8y+TEz
         h7CSTIxvTdF3+4Wy2zQT8SMCmueNSQc2WOh+Uebs0Sx+k/wWZMD0S76f9+9FbG8pmO5i
         gt2PK616jxDpOMoy/mKW2zcc9iCP6tmdgj4IGSOqXutGFk4Zhct6oxBMAnBIQcGd6Jxe
         UaGagQcNAlToZKHAjNV0Mpr4+RVfK4yBVRpimebvD8bZXNVcC3UxbjxBmmgPXuXtj/nZ
         iDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307497; x=1786912297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=V+8y14EZQG0xAZvneE6nuvN+UEYuWLJ/j1ZIGu2HfeeUKoTCWfMbja09BdoAMoS9Ue
         EKS1sftegneMpjajk1ZLoO1qsayvXDKAYr9d10oMrVfw3uImNWZNGsYiKW1JsF36TCd6
         5BryKtFJSWyzjaKogouYN2D+nXIyiF7C/Vt1vQjmUcQblIU2pNhU58zCsVugIP/zyRHG
         j+OrUF2/xTXYRz71zqIqMpVaLJR+OSZ2sOqfIMGqOrDSak8qRoec6ys7BmJjhARnW4Ra
         rvBOmOzxYwlB8TZsFNeztOQPk4WMREbmTAi33mf2R1mGvlU8lZGwJjqg6AtVTfrEaZhc
         5V1w==
X-Forwarded-Encrypted: i=1; AHgh+RqSm9qSWfgqSuKLHuT+Dvd+JJXHkbTUWecrPOw7kwq0orQo+ZvZzNRcfziTWnwWfqhdWU6q@lists.linux.dev
X-Gm-Message-State: AOJu0YxWa2bTJ5JzKrnleCPy/FHGmHEaMEDE6DssQQFh13DlqmcZ7+Ei
	FwC+vd6VcFi/3eN1lQLI73FDqX2Pyzlyk0wHyGdBpX5dS3wsqjgdNU07blp69GYz
X-Gm-Gg: AR+sD12VR+z75k7Kq3PuMqXhCr7xsbKTqx5bJST3R+2HywZggJUTnEQzkAkjKCm1N52
	3LoPDMsZlQv78VdWhax1Zp1PCA2lDF+ZC3KWCZylhhn0dWZJrCIqi/z2P8AkbNQjpMXdL9QWza4
	ysX2YR7S6pWPEVj/A4gKnGdfnImC+bbDpIP95m/LlyzzKjxVcriW+oe+yjQOsjCHenadZByt8Fr
	BKDdEGF2Awe7oXxlwVng43C1ZV/xYz4e5lKh3mcIz7VqUSuWiRiRhJX64p/+lO5YkIuhYP4mHCv
	Xv96B8yOBMyNb2X6IKgiuPFtmscX4kqr2S0uqWymmbsEYTnUS+dbfvjHwQMTjM1mtUpt5TF5Ohb
	Qe/n9hBV7bww2fFlffIRNjOFFDO0W5GUkB/8jqJdG0PwAY3AL/H3n9lmgLLZ0W/VDhB7iGeCY0G
	viHPe+AK34ysQQGZKXKYH0ZX7SUOrMBv9RPk0lUGzYXbIMe7YgEZ4+1/E2y1X9s52SnxP4LhMne
	3s9vlkYNL61pF3nJ11gAXSh1OicQPoTiZKNBgT550q9Ovnn
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr520537665e9.15.1786307496663;
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v12 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Sun,  9 Aug 2026 22:31:01 +0200
Message-ID: <20260809203116.640271-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b69050f22717..b9a5cd123775 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0

