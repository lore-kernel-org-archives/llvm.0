Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE7952FE33
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602746; cv=none; b=kbFpfFvAtxe7uaTQYbI0Z68bZ9IBlUZiYq1vQzL7GnZKXaDWv/6JPzz8Y59TDP1CqhBp04k5VSww9PkOiuhr6jN5xNFFmfRMS3qzfItSMeDQu+6kVd3YonNFSlrxiwPrKj++/3VUSYxCEWhwXjGtP4v34H7ozsGasZo9alul6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602746; c=relaxed/simple;
	bh=uJSONuBio8SeU9obl5bPfkUbfCcjYoh7VZVrNIcWqkg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgN+CHL9PnUwAWroF76LvYqLnItCMQkU85XdaMYZNbviDy0H4CtpF9GFdRuNZj/9ZeyhFGHKXGExAQvcz+SaOEbh60t/d3glKVIiY/VBmuGh6DeYjY6YUB3Hj+C/jg3UmD9IcBWLtlFnZ3EPiAynAhRBAff6D2LbRodYS9FFVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtI10lwy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtI10lwy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so133058f8f.3
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602743; x=1790207543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=BtI10lwyUC7uCHHlmIC+DjnBkt65SbsXhOD+V0QuyK6HkkHE5/uV6ymJktjdsSsp9h
         chrYtVKdHwOeokpIfYvLSNc17cE0rc2+ri/vfU7vlah8Pr7m8GPZmg62Jmd1+5bp3rtZ
         MrBz13OdiSxMoY+iSmI5fdgBguHSvDh0WjI0yA8zh0MbMJoXOvyzK0R4dwtN+/G0DMAg
         HW0LPi53JjFnr6dihntUB6UvygQLS2Z4W3tp/QnClc8uBiNz+6bh0vLwXUQiy/3SqR/I
         0cYvKdg9xXH8fSyyecMHSnGWwwJLlJMmznbyDE7G9K9tPrzdYpMbkJZ9fg/PKkVrIeMx
         tkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602743; x=1790207543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Co9+GXWgL7GOlvIeLE0GKxOjauA5YSOFLNwGRGVNoM=;
        b=TkBxQYyjolQPhwJTqCG+Q5ooLSRtlIrDf7oeRJ1kB/1ePQjhiVTZJo/tKLlBCL7B6M
         l9CGyuawx9hE8xP4XBuhPVqbf+OJpbE04mcZMIW09z4PR/Isg/Ojp6TJ2JBhWsqCRhKy
         k9aWt9QWovY7gbrpWLFvb09ZLZJbcLqA9r9jzp1grFOMo71PTG9V2wWVB7ynX7XzqSuv
         4jpR9XZDhmKD/JYz6ckwbNil9/lea0F8iGOwW+YNO29Sou2bXUGydb6eCPkU9jGo0e28
         cU8mUvb6I4XDL7KAaLc49ht48M+d1/AqEDIR2BOUiwkXDz41Uu+d/OxMBc7wWF2fW6WY
         qi/w==
X-Forwarded-Encrypted: i=1; AKwUvBw4TT538pFd81p1mSL6FbGAEnXorjWuVRECgEdwxfR/Gp1pG1GxbJe2GR3TmsV7btbI2Vpm@lists.linux.dev
X-Gm-Message-State: AFuF++kPkPNS6rsaTcxt+ZhZDdK8GlhH1y7xTT8q6f+ahvhsbg5AGIHs
	t6bV+Rpz4Cjdv8L/646gIeBENAkfeSirrZ6KXWj0H1nNQlWxSwG5X6ve
X-Gm-Gg: AYBFou0ccbkL4QgvtGn1tJ9A9uNrUY4pWCjx/WYQVfJUwrY/Xmi1CBaeocJ1ETD7VCH
	knF8VqpLms2JSYmW3koTu0f1nwmnmw3v3xioQ+OcM/X89dN0UK+oewwuuSGFeHlb3EF3tIYwN1A
	x0600OKpMDPkwSLVdLT3z47Jwm7ap5Ri0s3q38XILUE63JCH+oCjqZccJpDqw9Su54qYUsY9A5Y
	ps1o6nBQi4XtfCimtOVlO7Qtv0uq18jhsoLH0oU2a/AcjhSSwycOufGrRk26++DhHGUTRdWUQ+o
	CZ0Nb57jcAvDrCqXtpL4CwBNqVoHRM+xucjCS+bJdCevd1F+1JjzIw+jIcDItiCEBqpPsY4jzrq
	OHEyv1bGPQD6PrUx5pxviSMXdVFNlZbLQnCpP8SifM4ZMj7AwmMpGmfHoaqz2IAtEMrjeaWuId5
	noXSbWF1nJBBGcdPNzNERcnu+u0oxkDPKtXaNYSxy76JzipBRvGdazdVEfYQC4NFjULaHrcLmeg
	+1MG2bOq0CHmMxa8Fl3yrh2BXg7OPQQFino3nQU7Sk0oh8MjT9+6BIcpS6LZUc=
X-Received: by 2002:a05:6000:2304:b0:487:84:96d7 with SMTP id ffacd0b85a97d-4870d2718ecmr5744113f8f.53.1789602742429;
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:22 -0700 (PDT)
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
Subject: [PATCH net-next v16 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Thu, 17 Sep 2026 01:51:30 +0200
Message-ID: <20260916235200.20712-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
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
index 417d2f1e54b7..473d15789128 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

