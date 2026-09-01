Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4EB471D1D
	for <llvm@lists.linux.dev>; Tue,  1 Sep 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251428; cv=none; b=Cngfg3Vu6ve91UESr+2z5DU+Tp9HLqvuqul2A0IJiC6QijdhlDdE67EQ3/gAE9XEBcou4Jok3v9nsmdfOj+z9/Qj8aznvAcArwRF+wuyR8YMml9L744WsAKYZ3Vvu84xFv/RosRJUvtrTscmm0Zx82a7R1A2eR0KymRPrhWT564=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251428; c=relaxed/simple;
	bh=QkfsO9iIXWwWqn2LLgm3fPfnrSGchfrNPnJ7yZr1hKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anuNfEciaCEvgMMeSd1Y5RPb8zu1IhiZe7a6xQMtbIdUq5PY5AG+tv1VD4zQvRQ9004MQfCrDyPbgA/0Hh/JIcwcdKw6IIix12dl2mfRUdcMjmmxBrgz0OgEddrwMiZ9vV6b0G/ilnhCkmAso6sTr0Qjt9nZ4MroyyyK6MuXmmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhLIVtk1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhLIVtk1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso29962745e9.2
        for <llvm@lists.linux.dev>; Tue, 01 Sep 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251424; x=1788856224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=FhLIVtk1huURlh88xCSnSGLSATlCn/NYneGg5hwFjEPRgJH2z1lexNongNPFpTHwUl
         O+arMLg68dwg6IHsWlXOOuQOw622KhwSk+unHBa7yvwP5UyB7N+NNFs8zUX/Ta5g9iEa
         bgR+V9hs1x3oobBaV8eyFyPEyIhfL16IeAR17QaMG8+trnEXZatbxrErwm49rvpiGMjb
         ZGR2MiKaaxUy4fHN7zulGpAvDfxBs3IcgoN92hFaHKrNQMxXGE28xv6gmmnBoOOtwyBy
         sFFj++JHFfDY1BpYHN9DupXBz/L7pVsrwt2WfDK+GLjhdc6CwiBH0ClDyIBzoepn1l9i
         onqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251424; x=1788856224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=GDX9KmbcXA4F/HGJ8diSjEJ2ViH6qNHkYsgnjj0Rjm8Q51AT5vUvenYchH25BFswRo
         i6puEevm1rHRAnut/pyv/bm80LpbTvITI+EKcxKYmSC+scIXJEJCadYLNz+HFRK+Z4A4
         iNO6rmBKVzRh29tHaRF69kwhK0aODo3VpFlSe6IL8MxVBtttIsZkPnN1p5v6g5zoOOVS
         vQvm6HacHFihs7Ay2nEhOdFTn7pEFvWQMgx2Jx4r+2zK1FIHgIy8rTmvFbwQFt/WU2H7
         ehanSnJRGL/imm/bXK8B91Md4cpQOdS1TrD15vkci3NWp/mqhyfkXj16nRZVigaOyh5C
         e5BA==
X-Forwarded-Encrypted: i=1; AHgh+Rpmp8V5ivnLckQT5vfAq9MEQGLTDhAskjRNOQKNb8VdSpHNSlYGxTjE3Q9xTk+KkwjFTSFD@lists.linux.dev
X-Gm-Message-State: AFuF++mDOvEnYP6WHc87Pz9LJxhXrjWmYdCwvYBQTkAO3fqZ0DzZVPbB
	vDarvesJPLRzOjCcZc0oGeY5h/jwt9dM3+iHN/pWR2K84XgMKIVzriKo
X-Gm-Gg: AR+sD124jjSg/aHsnstvUTtIqX8IVmWX1iUODk9SJ7OkHU4p1TgzNHd/rUoAM5ikA1k
	dsZxeGJW7fKgiFBI8Q7EqVe6mXzeMk5oYccYGNFv9Jwmkct1TqYoHJ872M1oxUMKtPx5tU9SZj6
	X87fyPWuChc226Gb6ui7ZMYigX069XkRIkm3zwG0OHYMrHpltFYcTu7/Vw0Epv/rVqkTw3vqhDU
	YnBTXOYqZbsVVkzm31IlIwdYsdQopCVrVY2CU4pBF7TuQr5nFpl0K4xKd7JTPPkMhWhNrrEf6x4
	8AfgRtl+LIRtTmrfB/o/h9TbnYBNiOWfK97qiVBkj7QnsSnPtwgQs52T3K9jFJ4bNjLePEoB7Cu
	soApc+BDpe1XFltX4MnUxRH+PLBpxPbb9JqjKh97uqSk8c9nOPn2DDRraVVhNh0uFO1BQnd/M3o
	8rBaPoe3dlwIf4OixFAfFtJ73CV5LLYCvUsqQWLk/hwap7ZwyL7aM1FvvHPN8zB5yIBuZSYDGrU
	TGdS9s9qSAZ2RHk5RS1mAoblIVBvwE+LOiSqsR6osmq3nMoS8Gk
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr438008405e9.12.1788251423887;
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
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
Subject: [PATCH net-next v15 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue,  1 Sep 2026 10:29:19 +0200
Message-ID: <20260901083001.8044-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index d7391a60f01f..96f72eb5a6fa 100644
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

