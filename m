Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D7042D76D
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440552; cv=none; b=TLTZskhlNemIpl2NpocnAxkEL0IR9DwHAeqzMvwsl8jV1lT/JumBdts+cJhN2oKH15d0EMQ6KDe2Ua0D+stUNYvNTd7F+M/dSZbUqdIk7ZqNpL6Hm3hi56Vdb6KlaxI/PMtrmxOuy0a3f3K2hI/fXvaXaOV3nOKHLCIzGZf323U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440552; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XblSCV8dpFSvTjcDUjcBXAwBq6+L4kUWGpR/aYC0lDzgi6Hryl9m4Mz43hNHayFP4mZPPu/xo2IEd7Wf5bgb12gz0aSBRc254dXdYmwaG+cMs08p6OnuIzXgzWPxBTA8c8KAeb7SP0gd2P+M7JwsWe4xMIDCCdVZYWTj1AMd2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRM+7VcL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRM+7VcL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4902715e9.1
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440548; x=1787045348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=gRM+7VcL8Vi/s8l/RrXTBVHHmjw0PQCTL58LPCYGsH/++0x9MAWfyp60IkftFTqmdN
         BFoJQbbqvu5rsMD7txvEDLTh1M856aVwDCSDHl9bKDfkllEUs4MHEx7X4sjqoo6mQVyW
         zB6nRFwzp6grxVFRLRQUa6kLC3hJsHefvh+6dvHEYH5apz5Sz/tQbKjbs+9fdLv0kQy0
         49dJBv0xPQZxxg2KhvWdyQ3IXmupS3eCS22YnNzgxjmlaRC71cvI4ASS6NUXVILB+9Tm
         oeSFoJvcrZXzmeTxfLrr2eLhov74KWzNGvIy6PqwhSeWnWkFdzvvCuHMEVivS1QQccP2
         IirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440548; x=1787045348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=WCOqCnTJbljACzT3fJS3iqBBFVTN4NtHOKkFSaxEtcIKNRbOjC478A3SX1l8efCTJj
         29ghF9OJbm+h6QuCiVCJq4idHaxvLVyhhvrvnX4ojKsdN4k76xw57ft682ZAyu8VXxnk
         Sj+1cXVF8WMW6MjuqFXatqDGiGT2LUZmFBwaUMuf6nsZho1VT7hkkEsBX7SjRpgE2WQw
         Ib5hHIhSqqZHrsTu5C5IV6VZfZ8+U+ZDWFtwqHlO/9RqhfwZ3RBe0/QNU0kHb8lYo8Tm
         WLyKJlNT/R2lEnnoem5JOAZExZemlfQbkBisDJc644Agpsm3t4C4mY5gFkW3fUrrYxSs
         aQCw==
X-Forwarded-Encrypted: i=1; AHgh+RoAbQjpuwrhyntM9PYg1tEYkbksPKfFsovHOHP1i9DUdiJPdFH12yWBtELhNN/jnZlYhYKm@lists.linux.dev
X-Gm-Message-State: AOJu0YwW7Oc/PumCGLGkRubqTga3gKMriaU5MfxtS3mlJkRdzQq0GLqC
	sxY1xSEU944hW+AWpTaDbk1rS8SSbHBzRmIC/ptqqxvHXuEejKJc/jzx
X-Gm-Gg: AR+sD12YBUbwJFF4leULnI/V7yV3RS2SyA+zR89OLqYqd2MRwIXeYTrCfKXiY4Cnxwk
	Y33tZ1+rwyGB0dD3k+MjsncqSSSlO3Viul9fjXqVB6GT3UpSBpjlsuc9oiCYGsGkG3ea3DhvDuL
	CYiC6L6CYlFY+jgEMPx/fv50Oz4uriWZgESGZ9/I9/i4RvFs3zeUOa/5TdCAMUBMQVQWIPQVESO
	cU9H1+51eqhWkqz+Ygoc1J/XoBzVYksTNVhjR5xGTLRulWJB6MzZxMvfogBrug+XbkcMgeuU08n
	143N1zr0AfQyHohqV+S2773ceEGC4T6/bxeQChFE9hhI5FdNJIGHaN1PewYlIQehep9dWnPv+GA
	DqwSCZqKK/IbQ5hac6LhNqsUoJBWAhA1PSOeUR3uRimMJGXJvm/CExtCmspGjVgb8Ox1gjPFyIH
	vXLnXCYjaRBd3aBorUSuaF04sopHitIDKYXrOdwPBGyohzTR6EFHLq4NE5Zv7/IhViJMP/umDNQ
	s4Onkk8dUVbIvBTyiPgfptcCIUufu/y7T2n9e0lbjzW9W2b1A==
X-Received: by 2002:a05:600c:4695:b0:499:726a:117c with SMTP id 5b1f17b1804b1-49978494f70mr24088285e9.19.1786440547839;
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
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
Subject: [PATCH net-next v13 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 11 Aug 2026 11:28:29 +0200
Message-ID: <20260811092843.673837-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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

