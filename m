Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653084;
	b=YeroOCC8xTWUHhML3yEkYmnsbDPFwqeHp8NE/TplI0hNIgMmO43ncmKlDrTeyv1NzPz+
	 fjZPVPFeBViSZ5/WZrNvT0kfroRqdjmP/hDdLyKk7MPrYH7ShAwSYDo+7+9ojd2whZW1m
	 WRvHcnv/OpfrBR6nsRXTL41o/enGH182GqRoveFZQ98dfK2nVFC+TnNwwKyUOqRPo/Rdk
	 4NpNgcp5dtHOwRLE8ur3TKqbgIXAw5CjQWmA1tDZmUBNx6AvVoG4yhFxhs7bHgdyr5uwI
	 nDgfRdUzoep7TG4Wp9vRmdM4q2NsyxI0JHsypw61VPlBwPzTlWA2+kDwXtp2YBhOxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=fckY3XQKI/2yNUNjh7DOE4d6kZFPOkNVuip1NYH7N6wkPwgnInnM1W3dn0kRkCCYKGfT
	 KBth1rAIYIhN+KIKWga+dvAkl/QFAw6AxKqjoH3cpy4gEc1aG2YW1osxQEM24MG3xiX/1
	 3lzmssFe2+OG2Jynn6y0r6IPIWMIMXzl7qBl4u9xRyfo8kckSb43RWnhrMXCdr2y1xWyH
	 Ua1SKi06+RDJqcX8WblS5GNVyJZ16KwtU8VH+A5gazOVBFtTs7ocoRzW7DOMDrb47n6vu
	 jfkKTMZs0/CTMaI4ON4s44yo2A+UsXguKqVc7APvdPl+LjG0JCKyOTJs9iUw7Ha/X8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUZrFe86;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8A760A380D
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A8A760A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UUZrFe86
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so14097695e9.1
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=UUZrFe86x6hYqPqC8fZCcDe+O8HZc+yabjJvBuO/rOSGMlh2CQh2Gk01ddhqXi/6Pt
         iaoHmtkGE+cYnSCeHV96uArfjWFRlg+zydMHmwpV839dlOIis43ln+w93I9Ru7NAa4rl
         kY4wYzl2PpRW39pnbeM7cY01GnsK3hrLYSvcCwLUC4Bb1Vt5wQf4RAcva00cq52x6Srd
         +M9iyTkv/gzx0Ird4ScC894AAWX19BH1UCP/SfNnnIjMex2xqjhZnd89SLyMtgKh9yWW
         m6kqO+Ev6nueei7IS+cjyBPwxnk8MKL7bh5YyTi05Syh72kwlhwQObA0pR0n+vajfY0b
         bCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=vL10BjKHx5evz/mhCq28QCl0wv66oUwYvF/CPjvYvz+Zy8RlWMB6j9KA3vBzC/9nmS
         DEGpH0L/7YV98hY4xBU6KZhg2Zc2kcQpk0riQ8bfGoF3vhzIszVfVwUfKYblGxX7CuVg
         YVWKzof4Mn8jun7oPo63MlFgUa9IJcJbLwXnTFai/MfZF8fR68vZtBS5Cpj74qEjBCea
         Ijhtokp9hgKmPSwCe7Di9Ydr3RFD4LLrBNNYcPQNLHThYzsQ0YukuY1q7bgvdNMFxZUU
         xnKFleU5nVWCNsuiRXaipHdhdMvrB2hf1DHx7o79Y0fBg3W03yAP7+tRq2phYefBlH6L
         RWUA==
X-Forwarded-Encrypted: i=1; AL+hErFaNfS7zvO9v0jsRp788PdK7Vn5uCaEN7EL5HmXwIkD/HaLxX2GNjvq1kT60M7xRI/+pYS6@lists.linux.dev
X-Gm-Message-State: APuU4Z+RstGQutQkjXOVdUKYx/sOMYGJkYlODhjTvDfEgSTLKS0v+HOI
	B15xe2RnYWzwo9655cPEohM/GtltAAUQgDmC+pJwRxtY2NrAIOt/nUHN
X-Gm-Gg: AYBFou0T6QFdz91TWXBjl2k64jltFsUIyMfYbIE5mwzogUrT4s0dGTgZOcGMIllPFAl
	7Z4BT1Mi7CsY9mZ0e3ZDhGz++nuq/LcUMZ2sWhRq+Xazai/sSBySAkkRZcJOVaV5vq+OsXfYq6l
	GIs76c/nJlMDi/APKv9xXWzSiQgXNMCzgJHH4YK9cPNyQM0QwU9GGSrKuxvsgYcdnOyNjTuHPs6
	9TukyXT/s64FhrRkmoQyckYYBFBailC3e59kZ0diEFy0Y3z/I7lkSXzuqP8OrCpJR2p+YfGcaok
	Dv00SDEgVF+SYQy9PYQpmXzqb3VFWQsK9SpFvwOba1F3FTj+1kfzQiwy1W+4ThI8huWcdK15zqu
	+LWZ4XevfA6f04lE3qaPuimlwAoOnMHsmyk3/Ui+WwGbARDUvVl6HzKuNnzhGdXPifqJ2HE8/Kf
	/oWUt7PSvIrYYC828r2XntuNGau1iXzeZaCSED4EzcB9bT6K4CZoKTGxPUSjWs/1wGfHOk7suLM
	JhFQ5zBFSoKJPiOp9ZV5sTNl1zqEh8/iRDhvNMquJofpYvPeSpq5V0NDafmrq5QsHZ7Q5Mqt/LS
	P4TkNGz7MZGAnAt5Fqbjwfc4I0hKlSIWdbzMgKWElZGKKAe/mpwt8UtwnFndXm9GrZcnktBiXVb
	XVeQ/I7M6spdPpHCFAl5KEujnaS4nyfK0+g==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
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
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

