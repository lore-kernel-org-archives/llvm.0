Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AC53F8714
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787510; cv=none; b=SZw3mk+aJFjRrQdJxRN1l6nMtdZrN5TmB11dUspwVT/YMtHZr8hO0Tg9bSOF/mplL2/TuaroeEVyE/zBEZw9khftGVaz/zRkki7ZG6xRxucF99K+7Kx+w/0GcO96rSZYGqfRPRKtrUkqRA7StG85Iz3QqsI757o7KN6vDx16ijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787510; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+CJI87nAKVrpZHKR+g8Ug7lrTUnp78Zx7/03hAkmd7AQHOxw8Wuzgqry+/iGlSd7vmY+sZ94uBmRw3+sPaYQXYztGK+EYtHLK5wrwWJzF/EE8s/9+/dDHc9vPGpgVSWJAm4J9tQV2vWXJOQOk/GeMu91t9hSFjD8WUGS9p068c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyFSsa2o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyFSsa2o"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6777275e9.0
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787507; x=1782392307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=HyFSsa2o6jdGBdh86B1KFqo2Dr4HtY3a+6MFrwjiZEm7TDdjmh5WEa6fLc3tj2e5Yz
         uqChqKQ1ESeIxJemTU/OaBYFePCkIxWytIgT4WvAyp7olwKaFd3STyJK/WxPovKVZ0re
         C569WdcLKFG5ivILiXa/wk7mgZMkEHEY/j8Y8Zq2kXwSkhBN5cO64xkn4B+Z9uEYKOZV
         qoxdDfcFQM4jcehfq9McKOYg1hRsuAG/YTy+8eb9nSPfa+QPpIWWAVTVGXJK4t3GH+JB
         I8AYECcmb4O06pgTx5hvH3wAiL6K2lwuMETYYfFmQg7gOsKdvrdDhQn+M5ivMIjl/E5v
         ZSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787507; x=1782392307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=CqnicRgPHz30+dmRvoLv9dka58yGaYR3EYpjRd+U+ZAUTb/zLZPapEbxV8duKsdlzB
         vGud9vd25LT1rwXVWfXuWtgK4urRkE51hXzM3gC7ZXdiIZx9AdJMO+nVCu6e/FScFmGy
         m0eNUpcEtEhT5z4zYPdcK5AmLGWENGcWZ4w7qXymDGae/V919xgA/xd62DGvWLrLsynO
         ilwBsh1WHe5qWMdpdbYmsGCvblWvrRdtEjy0BumINU1lmrbyIirkAGQsy6Wj5IvwFtUs
         psplGSvH9qZJ673RADOvI0gTeoZBeegzTgijNOseKtgPFBolMbIxs09ORfuMYkjUPdXW
         L/2A==
X-Forwarded-Encrypted: i=1; AFNElJ9Zpcz5L68/M03BVDPlzI4Ttbka/hT4Dm3NcTV25YM0Lyrr3eojtjRFKHpN8SuEerCw3b4+@lists.linux.dev
X-Gm-Message-State: AOJu0YyXIST/gK6AXG2ZFqVxDXrnZ7K/3txz6arGRnALtx+XctKWyveE
	J31dO3H1c7FU4zAn7g972LwgdErBj1oBpBoqCJ32MMVgNG1Pne3SZDmE
X-Gm-Gg: AfdE7cn8+4JSLQDqvkt4HUVb6seyy6UJzC+U6IcSOeNXsRJLWMOfm5HCWjqCIvgcY1E
	sgRRYTVk145foYhaTWYeVMhxHspMpGfuF/km+0FZ9sdnQpSb23lsBftlwocjzgnVsXqUpaJsrJz
	l0GDSsNIECEOytu/FtXUFkzbHncD18VIQ+xnT0talZ9YiY9/v/IY90HrZYT+x8qsPrTuWc8va9A
	kK7lU++DN/GTy9zw3RRg6NGsa99kHoW+BVRAb27QYixRc8EeghcY48Dw0nwIyU/kjMMNsuc8YDn
	SbAZWEoKodZKxpB/PdKwqTp+M9xbIldGKZm9jlk4wCp4N9rnAxsXyVdeqNP85ZRmaBSXeR91BNf
	tPWsMJZLz51AZZylmLWlQXcYgKsHM3HXHIVYSwlJ7EGXCNvGbKbEMmIUEKLjX4AX+zZlTy3Co3W
	V+sUB8i1eNgawLq8gmPn/+dTF5c8I6IfzktqlaIxhhgEISXyq20eKqSrn7THzYt7rxuANHbFlU
X-Received: by 2002:a05:600c:8889:10b0:490:44eb:c1d9 with SMTP id 5b1f17b1804b1-49234139bdfmr97586515e9.28.1781787506895;
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
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
Subject: [RFC PATCH net-next v8 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Thu, 18 Jun 2026 14:57:16 +0200
Message-ID: <20260618125752.1223-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

