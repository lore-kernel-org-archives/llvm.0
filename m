Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFAE3F8ECC
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 12:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787508; cv=none; b=Xy0Kei38T3xGw0Gk3GXByRnLH2vb9ZZrcluCB9UfT3qm23+2cRQAZM0n6G9XV6oGSwR8hyaDcTkrPi21sPj1ZZxkbVrhXorqz0l0usWqNnCCN8eRs+qwuO7Wkw0+LQ7LYcYAN1FAbImngN49Q7LogK8TGUhqJ4YL7XlXTFyHNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787508; c=relaxed/simple;
	bh=AtNohlQ0WYu7yAy0ZDcPtcuY1C2JeuynsMtDfbhK1Oc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxD6IEeR6nLUBGDmyrFRwxWASMPkIBh9WiVS3Zc1kNxe27qq7pznFd1ZZ4pY4kmNQlHVhR2FLbss3+TD3i057iPcaWvmlKiJEBsehv8gx1oabyu7rKPcrZ4eT5MGBtp6cJ87BkVIF9xwSlBe0SVSTQO/V4C/wm9gMd1GbvT0dhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB9m/92b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB9m/92b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso6727985e9.1
        for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787505; x=1782392305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=GB9m/92bqn4Eu2+SK8rcBe3QBAwk6meoow15qBfOSUCC3gNjeNzBOGqp0EI513jPk7
         VTNCV/jy0rFeWvY8JHWXBvrKL5+7IMPP6DNvdYBeZvqTTAI2sUw1UGhiU+B5KWiW+xDa
         S06xQsWoRdpbUH5wr4j+wasGyWDQ7yjMX7AHhOmTuk0Drz9HLMGBF2QTFN0hJmTiOrTH
         UIejFjcol1f8nKKGslc2QqcX5K0j7ZL9nSOgUw+8adZVsZW2rW4N2gQzMg1qfRwkFIer
         bqZHFqe3v58e3AYtZ9DNhrZKuHRjZR144n9kfLjqlXcBxb8MqTtgiagcgDCbBh99qUB1
         Sgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787505; x=1782392305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z7ibR1uk6j3yRvHUeSG7+Ts5vUBpNZwTn1NirzFE3FA=;
        b=d+91IvRSnn45l/8nrRp71Hm2hrTIwt/9Bj0WPgt+TGZ8harlY9OZm8B1e+d8UYPpnd
         jBpv9GSSxQiRdkLcfFsTw3YeTg49j1RMy/E0PMFk8MLtpyk5fJ5drzAIQJjrTtWNEBwO
         U0S5xGZT7HpsL6ZMKiENr+5Zj5DDjrKJHgKzZ3fhgoC/ocBPdXbsESFlaiox5B8QGTfY
         Jr5YyE78Kf8WTdjX8ORyGbkFqcUu89Zf2vOd04o/aa/+Yi3fE+0djkxJ65dEkoGXGVtA
         Co56MdCoBDtPEkwCx1S5CQxDvSWKFJZkNfqTzWN5t7zX5gRIm6G9DIDO1qiSYJZN9ppc
         aojg==
X-Forwarded-Encrypted: i=1; AFNElJ9532MrVgyaKczzX4t63pg2WP5xlCvBpOcjr8Gf7WDLM6T9xMR2+7gW/bzC0iRMnzzyBw83@lists.linux.dev
X-Gm-Message-State: AOJu0YwmbNA9XHSEULBM+sJwhV0Fg35+1XBjWAjQw311bTvIKh8vrwaR
	AG+AGhc9KbRc8Tf4v2KRIeexMPZKlQWdME+IBL47ClmhCglgwNsEKDjG
X-Gm-Gg: AfdE7cmrPzIy6Bv25ZO9aLV3jNIpDP78pv71hvl4WQ98qtxXzJRbdcTwHQlcJdkJ04D
	0NOmqdwUX73ocD4H+y2sK40zC6IICZWdHaqP7V6kLEIRfMfPOR34DSHTaAjt4Iz/fOB7umcsZ5w
	v/pgjmrdtllWX15B0rBotq+N7sxGZbW2ayE5QCZjIOIRP7oRgUIqTluS+sdOxy81yQ9a+knApLI
	gYfakAW3p9iDH9lhxuQtqZflIxZPLNf0R73EGuP1v/5GjEe23jXbn4d/oj+r9UM6W/3CCqpZHFJ
	WraUkbYXbrxSiWGvoA1DliA6SmbsS8eZ4EVU4ZE1Tev+n4EC6y8laZ8+bb7UfDm1+p6uYB8IZhw
	AVvTuuoMg3rTH1WMYS3aqKd3ftY3WrWv7xeVBbxG5GJd471vPS9yMy5gr82zjEzGBPCJm+M8gs+
	A5nY+jbEry+KmjSpu6Owz7xB5Wb6oGuGjfqOLLjYek7PV5eZG2C+nbECo42iGbwQ==
X-Received: by 2002:a05:600c:2947:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-492333f5dbamr93229425e9.10.1781787505189;
        Thu, 18 Jun 2026 05:58:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:24 -0700 (PDT)
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
Subject: [RFC PATCH net-next v8 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 18 Jun 2026 14:57:15 +0200
Message-ID: <20260618125752.1223-8-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1dde0c9067..ef3ef5096d08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9593,6 +9593,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0

