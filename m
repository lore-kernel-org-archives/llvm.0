Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653078;
	b=sGKQzSjSFt2dAFi3zLmboA71VBQBX6oeFOu6eSHCzzROwkv6Z87xI6K5ws1467lJ5NP7
	 kuqUMhxlgZ9Xy/Ctwor73+eMLOSzPMahw6qE/uBwLl0N2uZrIDfqbuJpDjXby4Wr7xcWD
	 B84nZ8P0kJV2LLFRYx2qUCGPWriiz014utrYa7s5yu62RqQS2IFeX7UH1TrD5uQJZLYH2
	 UQRWvIbKRAggQaYdNBb3KaOaHJJsNGAm68xnyQmF4h3q+65q4Yf4zMCWPrgeziXG+CdB+
	 Y8LkFpFySPHVfgPUYv1LJ8KM0oFRsd+u2vb7dddEc6MM4uH5fBgab3Ls5pFYL7fVIgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
	b=iie50EgincWPovU7NiT0BR6FxkMaefHXxuTZpbdX+U0Y5nW3H9bTgYooTpYKS347Kcn1
	 nhXlSECVmNY9yYC3T/d/bqQ8b4MtRTIajKXegQjRj6gq6Fdgkt70nTkwMnwnUtd3NbPsC
	 9AWjFE6SJz3DjhzhyguJwJ7+u3/QT0SmxEPN9zBGeZTcK5eTURsDv4XCaLiiqYG0n9yY1
	 AiY9skFfIYdmcqDywxgGCw334ZciwfMnJ+44XmxGhmkIxZXMopQFoNIGC6YbS1ZedKLK5
	 pLI7F+8GcVQlqs/cf3brBe9Yl+XZk/31zeTiCgLgMMWID/JGFrDTAgKyL3NdUbJn6tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tg+a+/1a";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DAF606A8A3
	for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 10:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DAF606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tg+a+/1a
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2271883f8f.0
        for <llvm@lists.linux.dev>; Sat, 14 Nov 2026 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653077; x=1795257877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=tg+a+/1aKm3sSPA4pNsj6n1OhuyiNdOwK+++MW25+lPhIUxhKbkZvkv5svZJBOj8zD
         2IeSR9itJ3yofy95c9qEZ/xBnVM4JuSn/5lWa3xKb3P/VM19R9YSS4y3MRej2NBRjTdP
         5yJmW+yNG1uuXU0/lOaSld+VPUtgcPLD1Ber5GSSqlT4UeoO6tr+nTuN27iDdSAPkkhU
         Tunk/OTtr+NmfSQaTB31O4wOd7s5u4y4HYdp9zLgQn1ojs62hGLiptgiKrYy7Zu35DVw
         y8HrugvRfmNnsxuae7g8McIKv3LVbXRCX0aLckW69kRhaGTodPpUC+SKl+mrAn3RIVsF
         2k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653077; x=1795257877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e63Y8M12V31xglIbUipFUwik+v1xDHpkZgecqf8n5LU=;
        b=FCky5bEMZDRqejFgewPOsTAxkzWyHGxqFzoXa3ISbWRwQa+yTriIdGrhHwhWGC8siF
         nowzPYMX9Dm+3ydgVuaOwq+wc4Zhg70VKJjLuIVFnHMRlwVpXoO00XPcCcWLBMctvr3A
         1ETNJ8oPnWOkW1e5JDQQAVOAs/70DIYFZSBngxEzs8AAQOXtYM77EqEnaBE3W0UqEMnZ
         yk4jH9djBUzx5pbsctVh1Os+Y35pXwTYIxvVZ2qRgFX8iWKdPsXuCNAx8PiDayLqqNdI
         VSgJ0vV/8/RpKr3Dao6whuUiPbaldThzDo9KasoHQT6AR+BwF1kUzqd7lu84IABrnh6n
         sL0Q==
X-Forwarded-Encrypted: i=1; AL+hErHzrMMf9WDQ87xrGzaRNkA/uKI4tMzzp7YKeKAF+E+CDigladzoHw2HWKkCo1E+cvmpD+Np@lists.linux.dev
X-Gm-Message-State: APuU4Z9Zc7DlBdAqYIUidXSxIT8CEcAooKFWJkb0BTEyVUnJnMfYdzqZ
	W4mMO+XTZnR+XMQgM37sooXtFa8kHPbn9Ci39G0QILU2mzvDtl/a6+6F
X-Gm-Gg: AYBFou2PE0srVya3aLWyR7wgYKWwjfSdaU2zJS/PQ2m07OoTGyWj+Q8ukwrNYpMC5VM
	NYDdpiT8NT1hyc6alRwfPduWemluzi2F7eUmV/lsFaRhbVz/a9pJqwQmyI/UwXwVO0+W14iQ81o
	IV+BGy4nv13QOxFA0ylkpv0R7sDFhPFsTakFAHKj4Bgo0ce1bHPRpZcntJvc2xxBmaHmr2pUUgH
	Mmogw8GBIqNkNDI098k0DbFq0QhxMdQBMz7a2OmF4obxN66VVFm0U1YJxqVNLJOFk5atrDP/WMY
	xYif7zCQ/2mU811SLlQIHBYNVh0QNVVHB2tTGir0ACssVvkJx3QnHIOWvd+4+2hX0edsXnGLN9N
	aU1eQp7FOAxbEEjygFzhRTZw7OTKzDTFJsipyWjg630CK0r8fDtPMS6kpdoqvzpBWlE/W2bt0oS
	8xdVBF3XsrKQ6y2FybZd5ZEsxJ9rKvR6ZY5HJklQt8Bv+6/lk07EspCFZfCdd1u5+nokJFsP/6Q
	fjqMR/m1UBEOeRNiMKNNkw4P3b1mGZklCTHlDOaPqpMDM3v2G1gNYo7X7DqKow+OArcp0TOr2Nu
	li0Au/8nXvoRSsKO6zHZdPN804uoYSjzSU9fvnI3WY/XHC9MaabGyZgd/Yr+eg+wKO7PJtLCQG2
	fenKKImqlXNsb0tmN7MaEhLM/a89njUf0cA==
X-Received: by 2002:a05:600c:8518:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb5de1f1fdmr75369625e9.31.1794653076664;
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:36 -0800 (PST)
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
Subject: [PATCH net-next v20 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Sat, 14 Nov 2026 11:43:41 +0100
Message-ID: <20261114104426.235620-3-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

