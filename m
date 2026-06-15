Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D83F411A
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526661; cv=none; b=n60iV3LVC0Ow2uTGBJiqOMmj2mLNxsmIdZ6xe2ZGeKJ3Ixf92SRVswe+FyLc4ee5SB+73nvykdXki8kfF6/jiSZwQGMU5wIePszBepZhcNu3/G/Omiw2/f5aBSAkqtHl5KdiJfQ3gzeVMs2iprWrdU8m7yBcWVYyzp7F03BBDWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526661; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ8PYOE/DWCRNH2pbiqJdg0c6aiUwlefTh5OCLgxiPYTpGzlrk9G3jZ8sDIuZM99RarYvosQRUd7fwl/Up6hp3SXkoA2g+dJt3NDWd6rJ7sEqgDfPaDenyDDtQhnd0DaaPAUPkPP/+C0MCu6TF5aam4Qav352g1UDA8nZHsh4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndbumSl4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndbumSl4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so19210285e9.0
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526649; x=1782131449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=ndbumSl4PjYIb9B6TJVJHMN/ltwPfePrD2VzcMxQOUzCnFZruzdOX7bFZam5CqulMQ
         V19a25taZkKMAeu1D7JyC2o9ksVQCNZDSrQfB54qODbkje6ulSMv4bAPBnMjLidJhgai
         sjJhoK3Lea5uvu0DY/761pOV/+J5lYzfvBeipM1xG1ed6eEU2ljjycUfYMu8tMM6tOLK
         5O+bn74sqZLCuFhg78DZbdLU/9mVCltbzfMUTkEAlmt/AN8tAWs8e3HIvwEi74EBrrpI
         EXiNZhfSxNlGYio+jh+O8LsxDehhIQdqzr5ah0BjRegJb3Mt4vV9mM/tSFNlvXZwHPtd
         7TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526649; x=1782131449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=VcCNxfyaE0anysBRJg3TY8MwN24B78eH8RO7071UKmQkRDn2LfBoeDIoHHON/Uvmhi
         57B+Z0YjWRrA95FAE9ZV5CRXfA/uN7QIs2QXZ92+ZOGIZado6KBuphslhuv6H9NtPGvH
         LsyhJK+KL/GsrK+GGpg/CKag+kvUOcaE2hyzegOxgz1LZQxtd2ZDTp5V9EfeZ2SlShwU
         9KO10imfAkDswxnbjU84Nl+65mp8WgXYp8d7ByH5hogZHBHU4SbtzuoIFuOeYIe9AHiB
         WUJYpmuFrPQjSvHgEpGHv5OyOjtNhVQiQsIEuVFEnqB6jKqGlbxe0edew1olM+bDM8C8
         46GQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TmREthN2O4imTOuk3MqarBp1u0aztIhAhfw4oRrMB/6M8Cel5BF5WNG5/X6GjtAajXWpE@lists.linux.dev
X-Gm-Message-State: AOJu0YwXMwCkTHMkDnNB4+ipO5F3P3AOMTs0NC+uv+gQrv+dpKLqzYyd
	9M7YkjFUUszlEbulZcEGGIbkAZxCZkKsjo5YgWajmiPiH+d+Y5bhNtib
X-Gm-Gg: Acq92OEg/aPNT8V3RT/eJv2OTKcuFOTDdtZSeGAUmCGKNBHP4VDSZfS9KMwtenahxyY
	LIbdJ/k1gdWygV5WTnxak1hMnGsRUKcmJgxCuubgbLeqGxNFIFB2yCSnccz2m/EQ9zdsFxnEt+F
	LBMWQ8Dwa296jQulz9csZDIGzC9nkJHVi00iqDcNBqB6UTPtvFhGQVwvDZENmb/1YjggRXAAM9P
	l8bLDZJTXdRa3wcNGdwVFn3vOn13jN9WjgAFArKbfkFbM8x1oDtH/qKXnEdawtqR18RZClYsOtb
	H3n9f65uPkx67lzBR+mMxPhT4kUXuTxpgE6AbPnpHo4xWFVGe1gmqN3LXE2HiFJ9FKq2ETtjlHE
	Q7amAMDe7yitOvihzbsYD02o2kbZNyWLwNv2vyBiobiuI7p/MjbEu8FRYo4ergJObx2pRKA10Aa
	XZ2I8B96K2dLYFzBQxb8l8ODV78JYuQrIfRAm8IiYrHnPZqgv88+nirgR6A75y1gZRVg==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr195103365e9.8.1781526648835;
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
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
Subject: [PATCH net-next v7 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Mon, 15 Jun 2026 14:29:44 +0200
Message-ID: <20260615122950.22281-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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

