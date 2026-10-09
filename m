Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3426A4FECC5
	for <llvm@lists.linux.dev>; Fri,  9 Oct 2026 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570548; cv=none; b=dcFnS+yGSiE619yxy29htnXapgESWwzgR7FwNvY56U461jtZzVl+vR9rG3NpvYpqnuioagLdO3S5kopFR9kfm4pYo5SJ/PQ/S5VyNVRfBc9w0vp7enpVh1JcekHmpv/9ctd980OO0Oh2fEbQBC8TqlSmkKh+Fpi3Nh/aj8hKFe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570548; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JALGsIo+ixH/aTklU/81ph/nqExl9qeSoSqBajEeYZ+hlLHTaJw4pIsxl++YwUxQSArnTimL81VSDLg9i3lDzVWDxVhM/4oFp+bUMlae45PaZNfxUrUxNKEkRBr7ge3zloABLbc1sOy2GgPrHZnktEpZpB8eirkCQj44kBKsGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FszuhiOw; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FszuhiOw"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b060ec084so72635f8f.0
        for <llvm@lists.linux.dev>; Fri, 09 Oct 2026 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570543; x=1792175343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=FszuhiOw0dKbHqAKM4UsDtJt/8PBPNh8JvOtKrAUsTbWJRCrBWsinUh+KjL5q5/UXD
         BvY1qCjh9vWs0sEXKbjz4JjjKTRZ1YTjNQrzzZeKKAGD9CmTEbGo/DJQnJXuN9lDq4rW
         aQgjvI2ubIJXw9y5OzN3zHVzzMdXql3WFKenHqDmi2rh92ZDOchJjCo0rVGiCu9Gx9yr
         CZjRntxV5aIG+l+qjVSJwY8mk1Qsjpvf/gik+WGo6Y30OUo514oDo4qLrPTopLitFAJm
         B6oeIBe8QilzaUrd3vQJuKxIFJJiLEEd3G0J/gTSLVRw2PewOkBYEcZrfBZ8wDv5ESry
         2iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570543; x=1792175343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=0bm3gvW1IL7rRqUzJgV2J79PzCUA290z/7XEBZT0/sB+M9C36YCwLjj9zdAfUmMYUr
         uMHMF+qcv7BRxwDI4PGRRnsh6ToYhE8yyaKeoC7+taVs+KG4eqpVufOFZdDNcukCIOk1
         wbIdAAN6NaSto5CX1RtTaxpzaga39KDn26IayTYv1jTMsLQOictTg0Ueo5p6pp/3Q0AW
         WGIC3VGCBf+ceE+Gq3NqRTO9eBk173GmDgq38nfJE9l+eLYSYgVWH2MOZ39BzC3bEGd3
         /HJELEz5i4f+Z/0sqi+3SFAaNkp7LSanoq7cIJLGksww/y1iF13T9sXHZ8Nf7u3yMffY
         awfA==
X-Forwarded-Encrypted: i=1; AKwUvBzXIctJlRwZ7xC8sBsyYncZ4/a0UBCYOa0+EFqk95B3+3c+PT5ItQiH5Dw1I/sJs/Vj4dzU@lists.linux.dev
X-Gm-Message-State: AFq9FYI33Jago7/2P8cIw+qnJ2kOE/nauTc6N3ff6v2gr1ak0wDeJVnb
	jlHJ8OFNa3Gvr6PMuMOFn1o1/rpeETzgO+2MLk1Vm3hWpSZ1ILLQfuOA
X-Gm-Gg: AYBFou3bxy1uDDL7mH3a/DDYb21Cap67QY6fon2gyDDJTLxyLCs+AvAsNStpN8zDSNK
	8iB4RPK4uL+wEjqLa4MJVoJN6j8Zn+9lf3NCXnkp+Nrn1La7CPL88cUNqHTtrsNkRMG0chmjKsj
	Q6mRlQa2wDmwYdYEJE29rt3CmnP/+afRy/B5cy/qjjycp6UAOFcpy/eIzK4NrYygfI+JM7M2CaO
	Van3cfRgAaO5gXtRnprsnZh7+rvNJAMWhdRm2TDEOh5gW/QjhaS4pvnXJLakBR3wmfbnWF5+vGL
	ri2V8gejfx0xiIQ68u7FZZc9KUDlh35RcYMjolfIaFpyTLZlM1qUxyq8eBU7T/3a6oSGliRNgFR
	fnyw+dXgTdeVX6aMJmWK8ahTU+cndkWLdj3ggE/Jg/Fn2+GO8gtat+iCdk8r4vZY4JRX9gdSTno
	WcvItIHEplLegIumRA3y+Eux17zRwmPam1WIJppiknalPogMSlpe0jkWA26pUq3XoaEXXB763vM
	ItWXjNNkqASHnJ99drk+qjEnkCQl5MRH850N0fd8IOfvyrZTWgsFRssG/CoLCp6uhdrdD7+Bgib
	heejNNfqBs30PqsbOA==
X-Received: by 2002:a05:6000:25ee:b0:48b:e50:715a with SMTP id ffacd0b85a97d-48dbace01abmr5330100f8f.34.1791570543097;
        Fri, 09 Oct 2026 11:29:03 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:01 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri,  9 Oct 2026 20:28:00 +0200
Message-ID: <20261009182836.50631-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index 1156e6c61a08..9441afe372c3 100644
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

