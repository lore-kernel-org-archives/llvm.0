Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919220;
	b=LXeFALHPUoYJISpaAyMi1HNLATY9jmyLWE2Tx+bDdQTxK2Z5bUJz8POBe+QdK87DGOcm
	 /I3r2aQujMLl6ArMxek66JPIKVNxxUuEfpADs+dDpLdE1FvnBW99T1AEva/Fn95TN8e2I
	 RQ7skgINq6Lgqmay7iY4dyhYjLVGCrh+8Thd8DoMLV3dplWxCaSCFUtYeajxcispHPvXq
	 4j4JjN7pXOBz4eLXTD8fMaI60AlN0YIY5jlemOnInW44DHNEl3CstklpaNrInwd5DhXj/
	 Okgp0T00p+fhWkYSaDft8Ixx1/hK9xHFiAj52mML67L+hIAB/3gvnusgqHy0tjsi7JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
	b=fZsJGJFFgqXT6xjbEkoplNL+dyVMEPW2VUe9l5xx16C3l/R50vpQsazAw3YJU+T1dWBK
	 tjxfDVrSWvJqbHIN2J+igs+mqldQ2tPgp7huw0wsskZEN6MDFRuyF1mkMCpzRHEJAQq7/
	 rM1z0kyHEi4BDb1kZInXhGty2diThOEJceEq2EVyD5FSnSYpjSO8snu4mHllpKgznHsC0
	 4JBE/K3Ukt6448eqDf6/7PvDz8MngTiKV+Q2zI2PRNzTEMaV3xXQ0knMKG1N5Ya3hIZvS
	 WTXKdYdOVkUC6YKus1Ms7gzy/96PEyqtC7fM6pW6JGwI12BxAVsgSj8BtJ31aoXuPFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5izg3y2;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE55C606C2DF
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE55C606C2DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C5izg3y2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47828645e9.2
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=C5izg3y2T52l/OcG6IYcU6WNWKsP45d2M8PaqBmnS5fpei7DomrJZyLyCJ4numBNly
         RLaAPeRf2kqsvt0GtlPZsVfjWmbzCuvS7yCPwMGEz5SNVlWY24zRBjmSxlxmpGkaeKh3
         NaueIaC+WGi+7GRNlDOD4u0ncwV2TX1Lol8ReRperpFMjTEnaSn9Ywuq1s0qCipTJsGg
         99fh8kR7aIBTx809QJiTYHAd+pMfdaPIdMDuQhtXNHF4mkaVh5Pt8bCi+m3TxI5VEl9C
         2oFDbsZ1JaLoN4f8bHl/ofQfowHKyJw4i3AxHCaeCRtbpJ9BaiqdU1p6BMCJbVJND+Cg
         7Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=uSD/89DjMsrNkmG3FM4o+5715WqlO5Rq81LgcS4W+NeR+dPtuua+v6/9dTBxCVduyI
         3Lv5eoHjbXsqhO6MEbzg/Ww3p7+WYB5IJ5BzHtfPkeXP6VwkklFtc0Z6vZV8Ts+neVzl
         iLgQ+ZvIv0/aeDNRT+9KOFcqCJrTEstauDXYR/5aX3zHhxZaDkHLRc8XFenGr17sRYic
         kB1BLe+BvhLlifjK212EZcYq1QUII7UL4y4LGaWfDyK8sD7B4zZmuWSDTO5iySY7yymt
         EXPesWe+WBVzlbPWPhqecxJnTTU24cbIaAjVmgTwAC5SaUmfriyGmjE5g8MOsNCtQ051
         87sw==
X-Forwarded-Encrypted: i=1; AL+hErGMFaNK/87EYewYKvyv+SvMMwU+yj6Gz68fRHaRiBAlE3Te62qRhAutUxZQG9Na+vs+pFsT@lists.linux.dev
X-Gm-Message-State: APuU4Z8YlMgfCt0y8U27J1JIUWbhpQkXo2G3Evir+vwFWgZfn3mQSV6y
	MKX3etu3/jayTlxPvtEjWypU/g1tCe/QSRYIHrEHnNHyCXA0oySOUZU57qLTQw==
X-Gm-Gg: AYBFou1HXM02O17tLG6vZQjNW5HmsOjxvceQZ8XpxV+cLVTDlAOrSZBqzLcrLBmMYJf
	sIW3laWHA3RnL0E4h7r8lWiDb1WlQQlpUjsk9r0ua5yaIruBfuP+BUeMQ32vxXdlY8H5QQcms4J
	oQ1YA505INt/oRzDtm8vQ+E4Hb79+n31y7MFtUk786V6qsgrc9gNDqCKiTviqnFWC+trOVWTFA7
	D/bFgr1WRe3LZblQ60J0Dexuph93ejpKEy5AUFjEVWccsnWnwCul+1Vd9MevQDHXxC0Hc4ESqvc
	T3mxacZma5A9z3HsYzYGN1uHx9kvwWNLLzioeANf8CW8/NTzhAehKkoCwz+7sfUveRJ8vp1xkvJ
	4yjiJ5axAOT2KX4QlFX28+1gUDwyKr2HVSlpy0cdpIhSBe1tk0G7wN6J4GRWuLiWkJhbkxXXEQw
	aLMbnCmQkSj/YjLy9jfvFrvgyGBRzMe0Aq5FR9yBKh7CBb2Xe4ZSYNbsKUTLSGSMFQbhQbHo9cY
	M8uvnpaX97waIAkhtFjG5+CocvPOyQKyHSG2EhlL80yHSDngnTCzE7GKrgn0J7RZ306L9oxcbfa
	VNKyUC2U2pmuvMNWE1e89/SLEhoyYTXW6MMyB52puQz5UsSEeELJBFuuKUY32Gkh0rCUJBASoEH
	p7Tw51LT+560PIXxPl+gYRPtXbAG9VGs565w=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

