Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B763A382F
	for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610165; cv=none; b=rNyJUMPWjpITLPmg2uALAIIYhQtcafiN7g6gjARZtP+053JLQO19XgRZJ8FPQQtHwu6jnof7Jrie2B+HwTFuH348bgLLlg1Oxz1KYR0uvIfxinrmVEJjV/zqM3DNGWMPnhaS8XhVmlVvivy1fnakSqKmJSSHXsPeOMzUS4Hbb/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610165; c=relaxed/simple;
	bh=iZGuI2jZEXcez21BvMLyyL5J5TyyPpxYgd+5RltvGbE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkqcAmbwPx61P7/50Iv1n4/xDKv/QzhymP1izaHW7rvS2HhxcMN8mkLT7s3IwPlQ+t1mp7OyMeNiwDDF/RiipMpErBiWx4DbyNggno3Iw/1SxWlwyJTfZKwM6K1ibZo+U4kw2zdXZpYjNi8hRQ/WDZpApIlv00czYAo9gphwsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4XFQxYO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4XFQxYO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4956869750eso2768515e9.2
        for <llvm@lists.linux.dev>; Thu, 13 Aug 2026 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610158; x=1787214958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=E4XFQxYOLid/GviG09sZV5SB/zb24UFfEMhIz/2FuA3BOiDQEmThUAekEXFrqo1xA9
         na+/hj4f/+dsuHNJqHbG2k59jgrRLLTK3r3HbGcUdOHqDzXPphfVKK/FoFQxiCM/41PY
         tRBZRehWvq7GKKP8PN2BLR6ZzKCDvRvl0uJoGRxtuuFmgvAwPR7JN7F4S8k8hEhm+Jm8
         GJI7eKZXctnYKHk+F2JkhtnrPbCTrpXyC4OOHkWmlSnJ9IeiUsz2Wf85JfAPlWpUkW/8
         XRD9hGsgj3eTeFRFx5mqOC2i/lZZgUV9MtarmemO3lWHhnJOr7+XEO7vGkeu/ffLW1z2
         yBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610158; x=1787214958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/6xfzqPrssPk1eiQCa0fxb1om8jeBEn9170ILCiYQUo=;
        b=MFQIEGShnQPeUeIrN9NtNyB2v4AWhthq7QvzPWm7nVB0WpoYfSlOgTPtpRo5xaMoBF
         ijNIaJgm82T/18yn6lrQCkTVhQ4sBs2FWA8IJBA02ic4jU9A20gnnJrA43qCalArIBxp
         QCKwIlG+F8BCkJNUpZlgRq0uq2jebkb3b5u+3EOX3g/kGYaUfuMhkfef7R5FpJLTf6fS
         eGADP4S8G1yBvixOMkC3Td3vSeo0efUpf7SfjHVd/2knmsnXVaSOQaMuLOAuIN5QFR0I
         geSpSGfAqO6Qo8+S60hLP5wZhuuYefW3qUz/ab8mg0OcWhRw6lnvkG8ZG9We6wckKTz7
         m8Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9EBqRMsmPlce8wL3a1AfQ4flIrXno82prSYrw1Gk0ZB37Eb08rntCXN0BBNnyik9qVYy5@lists.linux.dev
X-Gm-Message-State: AOJu0YzdiaNdEMwNQA2N0pjv8vbfXo6BEhEL6IATBuJikBSFoqHjRuEE
	EYof0ugQ+V4C5JAhUzZ2Fb3R+uyy58pommbDQun+zFMoV3QGH8U4CFt5
X-Gm-Gg: AR+sD10lnwCIsqb9JFZAZdDqFASGAvRiqVI68qcVe6ViPUaYwqxHlFT7Rlk3BzKYWHI
	/aVRyjU1k8K1mZrwwwbIqo1BE0mQiVVvkDUdaij5CZwC4wL4ewb38NQHPhgzRrKikTSZpTkxXJP
	4Skip5CgSDWY/5CLtQLNKM4J6A2kpocvLt7wp7WNoPht+d/4ZnDsQtELANtdSPYqU/RHOKyUBhz
	ujClMqxM2n2JkLSEqkFoqqYhQEWVvRyz8GXp0GY2CR6j64LJA7+AAcX4q9Yez/9Ato7j/G1+tZj
	S1c1FrcyrfULK2OWlxknRy62QsKKzjIeRRVLpSwl7brH0tCCkwwIKa5K7sbrL80DK1LaG06CFQG
	AQ1bKSptiAagqviKLkmnrFbyCnoxkTPrX/PrToMahsmAhY8KSmYMFSvu6ahttgOceSul38BT+b2
	gwO79Mt+di8RBWrj0PmjyEhLLXZZE6KpMwxzRUYFVxrqcsE+I6bKsgquAv8TnGx5XMcVZAW4VbB
	7nsQleA7kfe9wvkuHuxmj3HBet5MJEJ8q8Z1UEjJHNR8rU7
X-Received: by 2002:a05:600c:3553:b0:499:7ce1:d8a2 with SMTP id 5b1f17b1804b1-499821d1379mr41303605e9.8.1786610157531;
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:35:57 -0700 (PDT)
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
Subject: [PATCH v14 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 13 Aug 2026 10:35:09 +0200
Message-ID: <20260813083536.970196-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index 6204e3bba16d..82eae20daed0 100644
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

