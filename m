Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E2494A09
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018017; cv=none; b=bPecrwtwqftcJ9biNCsX8daj5ernFxCI/VfwkxkX0OJKUFbW5GzdCY0qjjdYN0PSlUVC7Vda3TvAvRdQK30DUq9ggcYpWQDWermiHWOO9Me5V1bzWCIMUqLdoPY44K7RQmI3liNQDHEKWJgNLxM2sbzJE3ekHrAMrdJmK61Pj2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018017; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvL9RhB6znbUD2ALeadmGj24xrIuNeRkMqpemhBtna3oCycpOZg7rlGJYv3PiY+FM3WuOa339TB3Ok9iOUW8q+4wiE6XdhYEXZEunYEi3Ru1VLUUzymTW14RFXuy0JIYBTM5VbGhK6g74I+duOd6D/4fiR5sUFhP6lbIy4F4Wzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yttfz7zi; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yttfz7zi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so10362342a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018007; x=1781622807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=Yttfz7zi7K+aZETRILyHnZt0VgruYvdCw5/fxgsQsckP7mFbmSi5b96DVqRQvqOe5h
         Vaiu6pMZ8MgGwztxaBDm5U0k5sNU0BRQHMZMTYV+A6ZeddN6aoklTG4mlHypbEiuRkxA
         aFybWRQzN4s7+jC5LiCpKyLc+LZX21Es71YWQSajCe2PgeixJUxtKW1/jwkhYhpeWlMc
         MPMNdN6wonyIqhxEI2UTBIORMLuv8DwblG4zJVdsNBVkp1IOHz9SYH2BDuuy8UvO3vE/
         DeOPylsUyIrcEOj/+1jY9FDpNTAaX8pns91yHdROsGK5NOlYzt9tHjAWaxCzVdt5E6Pn
         WwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018007; x=1781622807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=joxNyWZHtf2aUUV63m7w+YX28+CYPnzsUWWgf0UNwbhsHfUwa7g6k3E7Ut5E2brdQk
         Lj2X8GdHhaOJx2tVT1XWgLcAeeHOD6sKJQYgs2pAXmEav49ooUUtUKEAMfoA6d05FZYJ
         otUa22o8mwgnbiwVt0RIiqQHy4CmNoYtnNQrRx8OHBoIX7R/ojq/uo197UBbAlsqZ/Ma
         oHKLKYSVubHTWwPU3MXn2VMOmnscWsLvSu3Oc68pXz3PYK4hHH3vfw0WBWMJ8Gxd0BYy
         TIovpPDYC5qWco2rZ3JTHnqetYupVMnAm3B5ejJVM9uzf/QFD9Z2q1gq0BgO8uwj1Rib
         vr5w==
X-Forwarded-Encrypted: i=1; AFNElJ/FgUCE4HJYIUJu0jlONcfnLYmu2d+fxSaiqk5L4gii9AZq4vTyzHn0KeApyYm9XgdGEpid@lists.linux.dev
X-Gm-Message-State: AOJu0YxbQJr6+3daVwlD8I2AUOlNR6IaBsp8H9lDdR4TD+WtdSIc0+VO
	GqKq0VWHkmT4HetxxB2dR5FyR1s8x7PnGce5uWKZpojIuXFAt0f7t4wX
X-Gm-Gg: Acq92OEKAoBsVu1g5eFXYF9bnE3Z9QqO9SwGkOgQEm53qR+LrZH1Dd7fnLoaXe2kx7J
	fNIVvSkiFPUZkd434u/HDcsndvzHS/Y3MqldVyhhYFCm9shUk3lWRL3hjuuW32WZib57jAzDZ86
	x5iSCW1+/fqZdpo1IeWac84SURy42MRqSvNam1v+e+sqGE7nSobGTkQEOpmYxFm6KX/NmeBA/eq
	KFlekLbd6rrfne3oN+3k113Xx6X48eF6cbNlYaxUrNvOommKJrOeoTxBH63AI13bkJw/HsyYq2B
	kQK2O/WgfUFcLj04sCz57QXX5NYMGCPX1DXLjo9nqns2Euj+ZkgR9iWrXYm0srIqqc6e1ZO+nFX
	hrVTj7CWhmbWjrB4AuxP87rC1AcPO4yEujtXtZYg6rp7Ox5SFCvrWSngD72jSaZSAApGbCZ9S2D
	prWWsCMUqkjBxYTUELHohbmciQmXrobEp5
X-Received: by 2002:a17:906:d552:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bf93a00a5c3mr170280066b.49.1781018006681;
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Tue,  9 Jun 2026 17:12:04 +0200
Message-ID: <20260609151212.29469-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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

