Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529952;
	b=IMC9dWGK9i3ggJ6iB5WPlf1QcreAQ2x+N0+11haPrJi1Bjytd1kHRysEJZzEdA3yZhmo
	 fYBgVNEY09lK7zCPFYVOJMICQMSdxyGZ2DHIyQpk49nduN2qilYDAU0MIAoBaSaTve1LJ
	 SQJ6EZiTMyd5yn8QnUYu/757q3AKJcpF/QGCD32eNg4yjRreB1fivY4bN2+OysM6jZO3l
	 8Ah3Ou35q9D4NAoEVcV4MwozV7Bvio5a9IsHLUgRJ0uTfBh19/9RMrOBGmzT41zY3L34n
	 RMYd7SQgSoOBPuKxVHPGsU+/hkstr1M6NqXvzpbUhZLfccUcX8zrcGeeNb99zAJF/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
	b=JlceaHYvFklWQNLTonpWk8eSgjyJ1ZgHUaRezYdkRrtU0D3zT5lwpVcEdgE5n12TfweU
	 mFXtowg1zErtJYYIkHRaJVQAlwK8Fl1+LdbY5Yzn6ntpXIw7QG6OgMO1D4qf/JDTimiX5
	 KXjBJv3CewHLF7H+L2YtFKPJHfx+Yi7sZ9eHLK2Qo9utlH2bDmsMXZWI1kkTd4dboK5tb
	 8EQgXSStk0hiYMgvSa82/iJ3JXQZQc6b52gPHVG5FySSbEugkM+PpqE9MqKxWKJwoO56Y
	 QMCRzDfMsupSy+Q4JBfvtZuj5OPE1okZshhxyQWIyDMfSAdE1goDE6vGklKyJZXlkMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H62TBvre;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77720606A8AB
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 00:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77720606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H62TBvre
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e47347279so125570f8f.1
        for <llvm@lists.linux.dev>; Thu, 12 Nov 2026 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529951; x=1795134751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=H62TBvregOzGSg/RDGvztUMUe/58EvJax6sHeEMaGYxfNeXWv4JBPadH8xf94/woii
         H+mfpF0zCDkQUnP4uBjR7JZk9gIv54OyBmbzRFDJrO4dgBQAFipzdggYk9D//TZueg7F
         lm5seHrZ/0AyHNtI5jBe/H5OrPAvcGi4FdzWuvjY6GkeFAOsD/rjLhA6fvXq+5PWAnWI
         ikJogzliW2KeRd15lcYEe9qZ6VqBxRWRBFgEjLDYwKiLEfzJ31V0mwx61aCPQ8qDdyZ4
         4+8bw6+XkJpSIAKTh7TK1h6KR9SKAQ4W3W/caJ7ANRNfscyk3/IAyfdw43M1KcS6w0lo
         sKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529951; x=1795134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=14ermZad6WnpBrhWCucTbh2xIU/jQwR00UUk2/oXNLNNFeZR0F8IyHz+431Z3hIvxT
         pXDghuFCnj1rLlme8i28AEGRhSXCkPXGBEIPa09fHavgJkYwbguOKqcgM02FQPaLPx8r
         VAy0C973vH7COG5WV1+IJ7LegEYUsYWXQk2FV8CKwTd7Eec3102lQzoiaP/D9T0eV2IC
         HfZyGqW+MKsUGUp/w5Q4lQQNzK+LuGTpYlsKvGDEbYk7FK+RT0wk0XUYCzY7pCygMn23
         BxKtVdy39wRcIKv+6fsUTHbX7OX6avm+l+2fgiuJVrBGK6RiRZHk2oybOGEltDRHSMOD
         wrJw==
X-Forwarded-Encrypted: i=1; AL+hErH/AERUryMMfoHRpttDZG74oa3RpFIBvbwN4R6OuB7f4uSYitqk5hi+zTrvjTByMiCGZ6+g@lists.linux.dev
X-Gm-Message-State: APuU4Z9ztbiE4Enk0yXs9YGguO6cjV0uvy+h9GLWsQEv3HcSzCqsKeaU
	OJvUWLUy0pxL8Rpi5ZlFXvWRDGEjxE9a6Ht6bzP0tc7imlaXBAKtKcWJ
X-Gm-Gg: AYBFou3U0cse79DfpAHg8n20yOjtuH7LbQmEMoQ/sGIhQjvyGIo1GDGceppnF7PL/iy
	t0hjr1yibO+GNUijFqyD0FwVJAk1TNtW9nQzDBjB9Ycm05E8BHZzeSg5T7R7Gahe2qKGDowLq5S
	uZzwMJfVz7+fDUPATmRvk53H4LVyxifImQPKhAMINpXOXOSApNPtoEBJzQBnbdqI4QgjMdP9crz
	2f5GYUl9HquIL8P4ZrSya8dJORoSLghQ8pG8LJYX5sw9xaR5nkLltH3Ph+FtOFvAPTYMHVhNT6u
	hfRXnjOIFDrQWBtQGYUessvXin+bjiqnpDSfU2IgJpMM1SWgC3XhpGlRknlIjMBXH5AkA9GUvPm
	06wObk6KzykK+S8UNsEGGdYPMWYjLHgdQt0OAEKichB3Bhb0vxpyMaM3zLT7UFvvHd4dVOe0wZr
	eJo0UOoHMNxLzbQph7eHjZqROn+u1Ni3fjmqBK4bVDyLpkogsJ73P3RZrZ8Kh8SSQPLqqiidlZX
	rJXpl5c5X/+8wSKYqmpDqgi+aJwxwDvD/f2I4bGFYNVm/UnrHwdyQ23QSiUnc4I0QfbpRa51Lxh
	VVQSw9ABe2ZldLf7iyt5grGJl2Kv2Bf3rCCds48Eh6II1jzJSPni5LRkucXH8XiWWBr2yKZQusX
	Qni0PZ9qCcJr4Drg0IMYn7DbaM8F7QoXcI4YePuXi9Pdc1M8jiOWKwg==
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr2019766f8f.13.1794529950823;
        Thu, 12 Nov 2026 16:32:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:29 -0800 (PST)
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
Subject: [PATCH net-next v19 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Fri, 13 Nov 2026 01:31:52 +0100
Message-ID: <20261113003217.197757-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid memory
can be dereferenced and phylink_link_changed() is called on freed memory.

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

