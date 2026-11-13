Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529962;
	b=agpqCUpA9Dt8iatgyZ/DM94CLOOFS1BgEvmNmBztTpDNMTW05j+Ptfs+MVGw/+WxffX0
	 1Ipmcf6G8HM2M/vplaSiqH7+mMcq+CwGEJ4dqe1B86LutuhNKe4TVHXqVLKuDIe6KbOoW
	 hppBrHXYCKNt1bVOMZvFTVI6h8OgEsdMnW9WTanomIJMktnXIWgucTPI35+VsWQebljOd
	 9mgrpIQI4I+9ZaephOwmlqJNZ84Gy6kPHwupH4htIekGgUrutHYw/aLlg4AEwm77qwfMK
	 XuRwOmCrTNYWR+YsGKqBLHI4fSgE7IgJNRo8HymtEQTR+FxDlHn1hl1Bb8iqArpDiuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=WbkMFRR8Ig4YIjEK6UorfVloQdqoFEXLVRlCVDHvfAn8elBNJsvwNJ4gM248ma2+d+P0
	 NUjst7ybI/3RCnBVR4bT2m4YE+ibV/QVYNo1cMrooNQhA4Az8RbDuYSCCZ256suhko5mq
	 llry0umsliLgW30v2HiWOq+jl8AKV9Xppc241cK7nCde3RSux4zFgsDSW/mqGCpnYHOqf
	 w/k2KFJN6VWjopZrx0/Svkde1bOp4wWxLcuoT6AESXZFhUSGbh/7cOPrc1gyYJZNjcnul
	 j4U8jin1kzuzCOSX8fGT48OQm8rP6pQLi980F7QpoqhUsLMUlBmFh1PwXtqBT1Dhelg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWwXYVkE;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A860A3806
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 349A860A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWwXYVkE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5832655e9.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529961; x=1795134761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=uWwXYVkE/AbBzVMArKlsBJFcz1acbqQpCLf6Ta7+VzcVVv03WaxvoX+wYfAoQH5q4r
         tElndt5CvvcIxFlwCnJ4HbFTKwwhmFBBw88VhNllk3LWjFA3qvTsMQOrTM4ZA8wBUCAS
         fgUtldce/KbL/0vhzQXUNajhwFvzVyzoXM4SveAkxbPcFhFjHyM9b6Kx2mFyfYxKjSyK
         i9ucCkzsvR/vHo8ria21lCo2wvO+e3tE45bHho9lWxyQAbPevy2fnVNjHdcKg35wd52Y
         TIZEEZS9aGcM7eDS7OhV6Qmfy3c4DHCjZtOW4IenmW2Ck0PgYz+wBtHdV3Pfp/Tlvr9d
         VXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529961; x=1795134761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=XrfvyLqtcI7Tbn7pkCHUTltOcUHyI9WYgixGCiD7NAwlfZa07hIhW60S5kXR6J0L8P
         yhT9trInd/XcZCUJS1gY9eiOMn51CxeRMBcaMYVsR8uAV4CQscjlB4NEtwzDX9FFhAEr
         /98RKws3asfRgy82vNTvoxSSGd5fEBSHYYGhcRoKOTEXhB+j4+OE/xTdeGbJpxVRUJ0Z
         f7yExnjKQiNPtlllmVjpTbxPUYWVLQiJjeVZ6qtaeTA1fznCh08AvxgLHRVDwtbDFSEB
         pPG81+V48s086wlh5cq0s4AtuKXAADbhgpC9K19qg/G9nfXtoOkPguNiEs51nBEiDCwA
         1fTg==
X-Forwarded-Encrypted: i=1; AL+hErFbhUkOUfiBzGXrJbvqtyFSnXdy/k7o46ZUAM9tmBQ6cbm4Yg3NG0DLZf6MVZjFaBlBsE6S@lists.linux.dev
X-Gm-Message-State: APuU4Z8DgpOImgQPHkA+inXSyp7ZCk+duJ300eCCBeXPC1Wy9zu7EeC3
	THb9t1LEb7SEKlbrkLn1DMB9rPq29GE1LLwvwpVyF0CP72lG/NjE6Nhk
X-Gm-Gg: AYBFou1eTvsJdZGDevpA2CZ9QxLNehhqjFskadTDGImGMuP5ptf+yXF6+Jz6tyswAf5
	miHdyzZwSGG83BhJBQo1+Vd6AUmmpXUAKnZ8j15glmby2rVO6fCnNWl4paovNk01yr5EdXMgS6V
	OVIrUw09kH4KMg6KvSIuViH+SQ4nzD/t51fOTRMMK+Pw1o4bqzEcFlfjCgS26/KFG/VJQYfNy9U
	jGMPabw6f0N0BrAgxK67oxR6DopXzmRr4NuzZRYE4znGpHWEwQjj5OWqL9lsBCPLCua+Oks1Mkd
	TFoGRvJi9Ej4jQk4zOCYvpi1vODMWAvp7dj2xjUy5zyEKoEXFcQAkz/7xgMItBYTkmf6nzinyjn
	vkrMOw8kceU9xrfw89h04Q5xyPZF09rBosmLP0omJoNeOzx84+Caq+qaS6VhnIOLJ3e4439Dfv0
	wTBB7M6HwUWfu7BtWjasNIVUJn3odciDuEXQNmY5bF42ujxYfJIsp1Pkwb0X9ZtPgR1n5dTZAnm
	uyjmA1FzW7p12x0fAf17hjh58sClFTDmh8E7qsHAWFZxIxzH8slh/dabeVtkW991GI4miPexQeA
	+7xz+JavUaoXsvwmCqbGNXaAQtb1njahuZ1upjjbzA5fWMG3/pRY1Orln1Zq6+ESwxUPqZ6Qw1D
	i0uk3PTh0pvJrVGmeyUwDR+8LAeY8M/upPCia4sOxM1LuynbI4wb3vmw=
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4bb55a92fa1mr18062495e9.20.1794529960557;
        Thu, 12 Nov 2026 16:32:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:39 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH net-next v19 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 13 Nov 2026 01:31:55 +0100
Message-ID: <20261113003217.197757-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

