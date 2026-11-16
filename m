Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846889;
	b=YxE3Z7ZVdal+2n1EEJOfyYe/Y/NxllA3bC8CoyI6sudQluydcXWn1sz3ntnX0QUl3atd
	 hzPS4ic7rCuXoKYf33UCs9KMB8U6hHuu6JBhbKgFgPAOhp2wt0+ICitkzeoEp/SmCHgpk
	 Fe+WrMCuqpYt2qrTx0KQTwkqdRA4WxX36CnYr3p0B5qNJcvRqTnVPHyOAu6KG7k3LbIwa
	 3qH0SrE837eGryXUwTPkX0JhH1tm0slQhGQg7xWeZzW0XH1aHTjnbOucuLmzwaMIi8XqK
	 m2sF5DCFalQjCDaBJ3jGac1RsirvXWmRyCbmaZqQZACy7nLGWMlf75MR8b/o2FTVxIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=1sRtjtDjFMBP2R1Oav2JVEWeOqsRGnGY1MA29LRWYMRt9aP1gUre7dUCngFzoBeqfOY2
	 3RKsF4LCa5U+iFnWLai6/Jmddf6vFeOof/GjG/Cks4LFyMA23uHTpy1KmFH9qpN3JaMap
	 +ryDUdCOXZRfoH8hQd3iQV2RiubRfkpZzZ+ZJ2SRxi0L0R9lg8N9LhrejXzWHwVYVhVeV
	 P+ZU+0gA8sYIsfFw3jY3YOcajcpojk2R7OZ1Njs87jE3NeTeYqiEjTatIqZ4FCNVcXIPS
	 8UVPZIqcYSPR1nAEYj/HSk4YaeL+QRQfPJ9Gg9In+Cvd095M8Us0ZgfAvO2iq3/rDmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="gooF/3Ht";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C837D606A8BB
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C837D606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gooF/3Ht
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so12392045e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846887; x=1795451687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=gooF/3Htd/mIgSLEkSYucs0zqYiuTkPustKINIz2sLqJjgjcQMsJKj7sAza8ZTjmwc
         kKQNrdaTqDMy+MKd6uP64SikAFRmQ3FNGjf9wx/agTQUKlyYq6cXUzzXTw1opfC6DZou
         SY6AejAh7eSWy9oKFdu7WCmkpwmBhjs0bcoDjJT08Riw9OubfDhn+Pj877tjmtK/0rF6
         5GdpzeE/bBoWr+q3YQ6roNwrjODhgIDgDvpdk4JXLlhrrxB07IZaPDQbMXPjzhYptMGb
         fbVEF04IhD8E0qv5j+V8uKs8jnTLUTrm5wH2TbdpDF1Df3EI5v1HMZIs9K/NKRjQ5kPi
         /5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846887; x=1795451687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=crbHIuopi7/yPKg6rvXhLE3/Urulk0ajRCqOHenKgdhsnXJbzhoiUAw1KoZxtTlIMb
         T4tsLCF3j+v7jOJNxePc9hQLuTKmQ3y7KF4OVAbfBEh4xCyejYzB4heCuFpryJWKoa0C
         KuDYB52atCm9uVXcWyXBsm+tissR1D1AcuQ+Pj/fnsUQQS+fw+F3YAJY1dTVW44Fv3sh
         JQDL8EhahxwoB69VPcCM+LfROW7uQVmBxy01IdtsA71XgDveKGTyy4etzY60Kr988iK4
         A8JXX2v2IMJ//PIQkhGeWb9Zw8Jk9KiHNiizBtcLqRNLbUwDY7gyFbLIEYrl+pSF/ylP
         a8sA==
X-Forwarded-Encrypted: i=1; AL+hErHXwUgAaUR+gqKOo8GKn3DwsvrJUKevIIKfTgze+WoEyFcFmMAAmzz6/muYVw8p1QDAocUJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+icyW7YK1X8EyvzY/LSAiysznWno3prebmfrQ/mUKxKcnHhfXh
	5hT1Qf3b2aZWBe2554ZE5LabLzyv6BolHWhTCtLxtPydHib23/75gSp9
X-Gm-Gg: AYBFou0u0fCG//lgqNG5gQAbDZRFlBjFU6hSItLqVYKVbYc2g1Z1ZEypH2tZCJZ6U1h
	ZDNktGKsCaXmHpzQF0u4Ur68D2Q/sFKmGHe5b2TGDInFbWIiMJx/ceE5V3TnDPOaRUp83+ru9UO
	9yc8cB5S9Jud+HxyNm7e+AXVTVPhmv76qdNWQehAlywhQc7FcuqbJkO8782rRkNunoZq0jlkqol
	iGI0fq8P5/1yQefyMMem8EIGwyu6pClnOG4JAHIQOv10TZP2Zx0xr9RseCv13BHQE6TrTgqc/KB
	KtuuRMh1RFRuWP7Cn2HIxmsjdHELRZzee5edlPzVdfKw1L+5RU3fczudGRWTt0AwYuTR34M+SCu
	RJNxt+KpG49y4DxIvb1OlGyifLvVitjFdGXkfKYpyDD8GbxtNVESCnhdW9fSNlAdB+ocViQf5x1
	Fply+DzvVPX2/3NrC4ytMgOn5kHCeotM5yAZEZegQsZXblgG9Dz6WxyrcS7U4GHFu0Ey7WS1NJg
	uORRBVEcQYNS8jgmE5m0qxk6Ebwma5CAvzSMuuE58BFm55uLqCm4+ME62eA3P8y6Yuf6GkRPqeB
	wzfjgH0UpVGUQnCmAf0OKML2IMA/SYSYI6pBC8oZbveNbOj6G3Qggm+wo7Tac/oF2GigacGTfFP
	2l4A47AJTMywc0c7K9RcvHoFaLz1UjDF2Qw==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr236465685e9.25.1794846887115;
        Mon, 16 Nov 2026 08:34:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:46 -0800 (PST)
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
Subject: [PATCH net-next v21 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 16 Nov 2026 17:33:56 +0100
Message-ID: <20261116163412.551438-14-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0

