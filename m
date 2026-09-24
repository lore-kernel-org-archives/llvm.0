Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8D4AD4D2
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290970; cv=none; b=dBqN0qGFWHFn1rddmKncKJfRepi0O9dewk1PoHhvk9UqeOl+YwaFdYguqAFqHds8juulkXkuDDCzNgtAhGKs2Afu0YsOj10A02Vpx2HhEEhEPvI2S4wgLQxFaRoAShdVjopNgXwvHZKseIbS1KyrE87/ZfFKCv36BepcbGifHw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290970; c=relaxed/simple;
	bh=EUXDAGX3bnyzYv6r3b1FRXNkC8ANmtHE534oi8SYwWQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfafxCDN9JEdiL7Ag6vddJBV9GFVNUARVixTFkRTSxkgYcIYbWbFCPqBonuM0y30oh2hWNrIjdVupNyby1EYujmj1P/eFLl+Ucbr6LsGoH3EeaphQinSuHUQdNfdGXiGo9uye2O/U1/9wbvz0eRzHcWB5fcmWD0Fh1LvWoaTBOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9Yctte3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9Yctte3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so2332325e9.1
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290966; x=1790895766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=I9Yctte3bYsZ9z32+h2cdc3Po0DRLE6yUd6nmdeLbn9zbDCX7K6y9gi8ZMnJw86VwD
         U8VADpEVR2FiNT94Zw29tacm6dF+YD3n/NwzQXJRWIs2LT38TfUhBx6LPiU4MDHPG/F8
         bawkEJDkP0ISzJDPQCdNPY9qfF4+aTDXctnHtAvdi7I+LBAzuG0OA/2tNgbwPeHPoRoO
         IyJwupYYgbD4JaKS0pPzh+GJw0oNZAJGjO+xFQwraHFW6BlJtLABqhUGPcfou6ru7+h4
         8kpgPoKg1PIoif5jGIbT9yHAG3qu+BfODlDS0jK2qvEpV03mu1BMLaHwkh8bVU/IKIJp
         KrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290966; x=1790895766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jGcuL1ZJ6RVaONcJJiN1h0QlP/SsYqFMDoH2EucUXRI=;
        b=lEbLfZWjbYlUn6rkbGMJGUU/Au9QLeR4VFUmtbvUWcyQIyV2J8yFCFie1MDUDzN+f/
         yjX6p+SpMwp4RRQquh3cTvd4yZcFyk+BgA6M7CqAYw6he5bYcAcyaiE3PmRGcthua9UI
         +e/TQ6/IMQPHsYqCeLP0xxqDQlILwpKZDM/Y+BCiHbhk8TBkwh5MTND+lbn7ewhQx/tq
         xJqRIJ6KJ222SRWVBZ0lgCdONlTMatB/B5AkqjnitXt9G7dVLhHfGHegTRyCcQbrhs6J
         J35cr6lO2RY2aKspTUTpQYBjWsjKtyf6hdVYR8ai1FGFhGkPrxlJyKgix/vqPtZDzYF7
         kTZg==
X-Forwarded-Encrypted: i=1; AKwUvBxYk9kvNj5w7orC0b1PT2kcoMUwqCxJj6c/rCozpn3bqD+9CFDJ7ycVrYW3IlGU0KbmrNdo@lists.linux.dev
X-Gm-Message-State: AFuF++n/1YDsGDl4kFY90sBy1ieeGU4Qdb295Vm4p90TPhrZPkqZRgki
	/oJ//ZsGbYSOKZCmTkN8Da54P8HaLX/xeng+jGz5m4GtmdKAgEHZwulv
X-Gm-Gg: AYBFou2pw3KcBGmzjavqVjN9+rwBPNsxgVvY03onh1gCCoBM7xpUrdrxNIpTBt/FMyc
	9hNQsjyl6uuhI3HC0+y0bKWqgrG6z7eqrq8tUlthNaz40Bc4rvmwuI3kHylm2seqaVNW6NNnslR
	TaTkw7TfBSMRtm2uh/rvLf1m9/FScHRd0v326/zXTGBt2jeriudoOvXqmFiBTPTqKa4DIFIPZTW
	N/ewNTaLyNR7+34n8ApD46CwrCaA5OEfXv6Kbk/uHtuACSkqX12poTlvYXcPZFeUTYT1fu6LhSu
	d5BhKfGYpSANF6XQCQDMxO35umbCV9IAVNtpIkWskq7kKjztCRfj2uTAf//oh9pHEl8dPXxeBwL
	Ll+BWsSkrxE/GJyzgve1JTS6wewfeOGh2WmsqvtkNklnM48us2XYU17EwIx7ml4PbG1th2xHi6t
	0dXnyzDYtZNyTQWGxFgtHKWyYEEPxUmHNV3FVhH9ns6KJ6BNF7TTQoX4pcrdlvlCCy+TfFRK2ew
	Va0rVL3xiD8MxWeXzmIW0NVo+XjzyKuONyDFW3CoFzDViQQSg55H6MSAZRSyaUw
X-Received: by 2002:a05:600c:37c6:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-49fe66ca0d1mr65872935e9.5.1790290966498;
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:46 -0700 (PDT)
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
Subject: [PATCH net-next v17 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 25 Sep 2026 01:01:49 +0200
Message-ID: <20260924230211.11519-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6de1ff058db6..a572e845b8a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9757,6 +9757,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

