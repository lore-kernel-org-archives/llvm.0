Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846873;
	b=Y5hM4AOKLzJYPOkBYZCk7PdkfptqrysnDKIqw16cKv5wVsgO1TNJcYH26y1CCN9vx8uO
	 Ky5EnrIXWWly7Zt2aXtJEAVzmUer9N6zXtLk3a396bmHw0Gl0f627SAyGowBfxmlARNe4
	 HvQg2rKJWHY8cu8d1lD9+78gXeyRFFwqBYQnXrJLrRzmHQsUP3jBYN5sfxGGLkukg5gd8
	 JsCcHtv9C2AGS4D/acpOG2m0ggWpTy9kD41Q06N87v6yV0+rLrw1dnFwCPLohDfwgoC1a
	 oLjFgWnojjL+NAmz2RpUyPg069p6k5nd/mjtMubUdaZujwPKIL5nXj3Ycuj65XqzKkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=v1rRZEnyN4VL8Y1JG+V4jRs72LJwFrAppL1uh7a+vjlIz4ln0LxDTodxSzRrhesPWRpG
	 WlZWrSblIAOOW8eD+sii2wCdmCBlyHH6It+CQ+gmQ6TTUMORN/QEc9kmnMF49ldb+7+fZ
	 DMVCl50ZQbdULucFan/gKj6R/goyDRIJ6OV9ep/h+YpGxaw2y4KXUKmgUxgfqXS79nm4S
	 Ie9/ikCHOFvKFCP7lkGk02SB/CfX6lmMJKBfAlUXMG0cIOD2cwlbSwbeNYVXLhdcQ7ndj
	 58QjWa+A3sDt9S5HU+Jx1S6LXmsP8GIYpLyw6xmv4Yh69J1/8Okmywk29nCFaDPA6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6QGlJsx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D09606A8A8
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D09606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6QGlJsx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20889205e9.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=e6QGlJsx/U12Kgj9i11WC4MDpaeNs7/8+m4Hh5eNGmFqI3qHpoBK/Lj392HMSu97ee
         y0n+xCk8imMLvWE6YxNZBfF37w65ccm88c10H8SCCAKocRUkI+XjzrMo346V1nCMtu7w
         UFAwtEB8zWGaH9Q0cOqaP4EWyjycmu3HeRzZo0llqOeGhDSrOhP/MYZhC0lkcKUkl19u
         eGlvzg7WQIHIQKe3dR6DbZ5f+39pzv2VfRQoiaIRwpCR/Y/EeqRJTN9oIe95DixJ0wBY
         kWw5ecWXkV73hUrqKFINJsTEvaehtLnq9bnayq3JbwEOkdRAYOQjCw/Fnlz0evsHW71O
         7ISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=kHf0lzDtbXh/i6+bZO4/9OK09GArsPsNehSX4lWcPSM+BNA0PU6zEyCiFLskyPV2+3
         XbE4hcvWky1Ngfh749lSZfgIYTdToMM5KkdkCYZ6PoQqzf4r355io48QU7lhLhXbDgQA
         wsoTN7sZpAzvIEsdDkmeQsx8PQHlXo0g1P6sKk0Z73TGebbRCtSjio1CnUv4LMskQhA3
         t7CVa0if4v9B8b0PL0Q1dfAEToyV2ajyvBCnmHyIDH8g43hmdPnCNm8u8ZDoxxtHeZXR
         m7SGJGzs3j+nEQwERv2xDvUwZyiFV6N6p34Rw8X7Clf6vLTvj5NAms4lIvppV1ggEpcS
         ko8A==
X-Forwarded-Encrypted: i=1; AL+hErGYaiJ4xM2cQrrVrr64aM8a2JzSsKmt0nRhrqCEFUjAW1CRSV6JtEUHy0QgTxQIaxEi/bJ6@lists.linux.dev
X-Gm-Message-State: APuU4Z8Y6Q9TJr//tzxr4e6E8EU3iKid6X+rxxylhfDpYOxaNlDQM6i/
	vbMrH7lmtidWt2IPHhRqyJ495Z2OAIRgJS/R5Gw0r09yJvBfGo30i+6s
X-Gm-Gg: AYBFou21reYTHIfYmQs+8NEtdnTQFlAdYJcCbVP37SToRpbAdF9djnDcNfVns6UyIWv
	MfqEC4C99K4wNEyqmKkZgFhQMnKr8HGIzEG1DQIdUybRSbTjNvjPC9p6RjFeHQXcv0r9yAGP2uO
	9qxDQK0KjFnO5SsH6nhzCUw26o3VQGpHnsdBjOYUDfseNWSkWIl/r7E6WA983+1i8GbZ9y9BUoX
	Yi6kRVL5rRpaSmbZ+eb3zMMLNwCgqWFSIHO9r0Or4RzU1XHI41p3zQQMLn4PZdsGmA0fTIq8j2x
	2h+N1n9tasUzRcfeqFQyowlcBcwhkRIBFyu19wsvT0bFjuNXHQU//Dn17AduNp+bgZx3y/2Azkn
	YQq6cgTa4OhixFsV9gS4LsEq5PqV6AAlmHF+ubwEHyCjZVC/iik78OtasP+Skj7f1TOF1l1NiZV
	ihS8NU61kLJpowh50eAqUeHt1RETys97a6bYtCcFyzQMtqUJinjiyOY6wzMUjWYUcdu7poJ6Zgu
	kYZbcQNYbEoP49uoLxkPmL0/Xtx0mmM8Ga9F+cgf9r00fh+jN2OzTUM+G3rylvz6EgLnDiBiqoJ
	9YjZMBGAIJkoeHrruMVrTaYyeftFDkAAIhBvwX6RmLZhobJhrp34GSAytWPql28tWSQcMpwC+0n
	qwFZPAP8oPrszze71CXjQHJdmB0e7eDpthZ78NdCPaBXZAvmEnM6bzxw=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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
index e8ba906cfba6..091c3a79c120 100644
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

