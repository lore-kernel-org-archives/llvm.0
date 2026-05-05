Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292554BCABB
	for <llvm@lists.linux.dev>; Tue,  5 May 2026 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005663; cv=none; b=CixAwDLQ9F9J+rJpmRvpoqAaFG6vFWcshWfqo7gi+EuaRfZo/10qaBDzgBO1dnC1o6y89ciAbsVh5iFzSrwn+U9CW9lkQXzLMbBVl1U0FXnOVQgoAzK1YwmTMJM3DVwPsX3S+MW5oVh9bzD/7cuuPmiD34TI6fKA6uT/FrTFx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005663; c=relaxed/simple;
	bh=z9crCwe7rX7Mram2FgQSb/0FBR5Vy9InpMtWAVeDhuc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gqq4XKVe5a643S0tgHF4JjJRuXvpqPyLFip/1pMQo/6EesdsXAH3qjLVhhgTvUxzS2Pc7aidEOIiFikKnI68cFyX1uIfado6l4K6fbupbH/0KTYP4YgnNy3SLZtCNWRMWcLXeicZW0YirJxPN76jr7pZlIM/qaMaGO9T1xH6p7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ph7wuSgZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ph7wuSgZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so54314945e9.2
        for <llvm@lists.linux.dev>; Tue, 05 May 2026 11:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005659; x=1778610459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=ph7wuSgZOU20efXHrJUGuQ/McJs3cUhJLMXmUBfclWqKS5+JlVBasvEm2GwxyCHmEo
         JUg3sNtHAb31bL53jlc+MVFvidb56uI03B/pSbkr2WmIwL8wS5D/My4s9dNaR3aa1SVA
         /bAGfFQ7WW9Mc0HuLZ1aq993vwIzKCUb9Qyg5pg1nexc29ylABOim7RY8Q0eRSrwmA1j
         gozb4penQnm19k2tNbnU8BmZSIIALjakNP2hzWLc6SV2+CQcm7SUKqwRSlDnCVr8TOQh
         002Mynu1eDuo1JoEb3Y7rDpUSEMb0ZrggTyA2WeMugXlbLXDY23JmWcXinJ8cOkNMnar
         KYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005659; x=1778610459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+otCYoEYq8tITJGMUn5AwoyVWpaSds7MSzdEdQ+mkI=;
        b=qcGsT8FqqdryFdyte/6NkpINTjJ0g8VNk1TUSpOfFWG2yPjcH2Gx1TEGOneTgha9jJ
         S8lceTxsE1sv+CK5T+6iWQ7NDEO/T1vniIhPqYG9TgZDGNDj3msmNORmumDSi2QFgoxA
         c6ZH21fj7Vyq523svZ2bZmVAJ/Tq7eDbA2iZZQqDGNT+7pGnj4uMFVdcZ7zsFBHp45z9
         RqS5l3TeqvJ4lnMUVM/59ZyyuwzSjxnNbXj6u5Qi4Kyb/6SuxrE8A4U+FGS5cmsbEc58
         5h/rVXSgxuv/4dw1A64+lExRTD2lHhJb790AWaGQWKfv9q+feMnyNKJ1I7y8fYW8bgue
         YVFA==
X-Forwarded-Encrypted: i=1; AFNElJ/So7jbvb1tvnuHJ8O0b7X2GvHw66qJ1CNbmjTv0dfZQbGZvI0zy59V/psCVgMK2TAOra9F@lists.linux.dev
X-Gm-Message-State: AOJu0YxKJKQtxP9NdrZZzFGuPnF+12rsmz6XeQcqBYSkx8bGEWwSDeSC
	VMgO9xBs6f4yE5maZc1C7PlnkS8/XlW2shTOfIrnarX7tMkkseoaBt7q
X-Gm-Gg: AeBDievEfYNMu9yaCuEoBVfQyFEZt8x6m1dXw+K6qPhX4SrTk5jhxQ73jzHggnbzV5C
	PlzFE/FxayA/XDtoshik6lWV3Eyy5jNYQ/beEpBMCC3UdzzNOrEBVvUu3NTUzuF33nIsxLaso/M
	364OR+mFNA2K+I5cafIETt3a1YfZEPnpHEh2AYFsN95VulIWBp01/dX5AUGNs9v5XH3S1TUQdnQ
	igl8QBR5T5sFUKDwoOjig+OduHPHgPy5NC+d6GJwBIjTiaw6blHPNsN0oTBtJEg8W7iMVggFKDf
	Dw+tKx1BN2kDv8nBbmu3BkLl7NvXxCaS8SB/ftnvD1PoCAyW3av9Qp9XTppG+0HeiaqnkgkIoQz
	MelgqU+oNcwyw9kSGqPGBnT1gThX3g4TG9iOEm5bLakgUdr+3tJWbrcUp6r1AILXR/dkyOPEBf2
	L/f4PxvNrfnHRA2cMKhK3pGczZt7SQOw/8iMdW/QtI5zqca78GqJ7cbHLtnuzpo8uVQ+GFiOM6k
	Te+pQU=
X-Received: by 2002:a05:600c:4f53:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48e51f42798mr6028415e9.14.1778005659102;
        Tue, 05 May 2026 11:27:39 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:38 -0700 (PDT)
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
Subject: [net-next RFC PATCH v5 07/10] net: phylink: add .pcs_link_down PCS OP
Date: Tue,  5 May 2026 20:27:08 +0200
Message-ID: <20260505182713.27644-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Permit for PCS driver to define specific operation to torn down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called before .mac_link_down to torn down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 8 ++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4ef31bb4eb05..ef2306840c5b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1036,6 +1036,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1735,6 +1741,8 @@ static void phylink_link_down(struct phylink *pl)
 
 	phylink_deactivate_lpi(pl);
 
+	phylink_pcs_link_down(pl->pcs);
+
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
 	phylink_info(pl, "Link is Down\n");
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index aef4a4fcf6e5..aefdca01b77b 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -523,6 +523,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: torn down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -550,6 +551,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
-- 
2.53.0

