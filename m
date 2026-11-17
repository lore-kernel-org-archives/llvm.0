Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919212;
	b=2EZ9K3P/LW4hfdoKDej27+DxuDRvgq4ZtdBPrkJslkXWF0gl+Jhjcd4SREvcfneb9YAx
	 JLK4HKIUkeY8azK4rFA67OjYg34t6ESKfxFy/bz7rTp1Nm0nB7dcyF6UYZvIWrOHm8XmW
	 /f+VAjDvJ8la2DZ8bJDbyX1FuW4ZjFaMU2/PMFXpALbrZR6weVb8pWeTtN3V9J8LYNa56
	 KKNbU1pw0UjwXeuQGUfr3Jr16kbY3Ba0/0boDu9FzNRS+UpmWb/k573QvmmKLjwQ9zwBv
	 08CeORRru2hMwpTubGUAOMTkM3DNPIy66L4ISUncyYbKcEabcuwhllYkfmZUX5tNR0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=mwf92ruUWpyU80uE+UTpUMtkG5JTaF81TSB1gtaKK9qEnMCkOL7PIEuAHc/pVBokUPp6
	 15Ldr46XczsL7YkuExoYV/PaHH+aXiV0YTwrhZoUwfNn+RhPmfogI70lLUwl2I2K10p9C
	 AHdf2dJKxuDL0rlYZm4Bsys+mDUd1g9wQSOpoTZ8kKRxtTJIhQziM4RErcw8tf8bAedsP
	 JkCXL3I0F6EzOp9F1WWQUstZEsZx2KrtFJmDbgymMDU1YE6mZ7v0oplSrS70mtqDCCYfA
	 SOOFs9iDSLB1dqaJR0LT8gSPkhBGfuaxYvHGtznj82gUTv6ZJnVeWQVCxYVOogjpruQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GMEbvs+t;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A67606A8A4
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A67606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GMEbvs+t
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33277825e9.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919210; x=1795524010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=GMEbvs+tpNoUttp5th1MZdFPcs6tbvksEV3dSDnJUhaCcpPG8NrIlQNrORVGp8OMCm
         uRfz6WGqPWfaD64hu4PaTBhmgFZPqTiczqp4tr2iB2gwOKn9u2BcXPqanqsSnd5II5JP
         dwF1VcFKS9QFG2C4BzB3s+GUHpNBR+WlOVNc+dRnkDWfHmMrbZmnrJvtHGRhpW2uBRo1
         bMX90LPCC88L4rYDYLb0EmhmIfcqUiibfyPeMEZaMAdZ2abcaHVCeJ66aiT+RlGUjCaG
         2QaaOZ+19gbFoeTJYA9xaqShx07UhtEFs288rKLZRpxMNj8kXxcF5y2NhXgpO+y/ZE2+
         002Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919210; x=1795524010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=IQV4+P9x+h67n0sb6FlOPGDyYGLaEQl8R6CT+NRu9IR3PSiybKYU7wfD3MjBiW7bfg
         mdF/vCFD8WPX4tfd0iLkx+P7Z3PdJ/1mp+lh98ibjlvXTRdcWNuz8XXXImBXdRSUfyHr
         sRH9oqFUvYyPDQ/wgYddHTB0REVPWNg8U8y2NBIRuFYIX1oQRs5PXKs7rQZKX1x9pPoh
         mGTs/QyYNZcZnzOBI019giXVj2/Afe++pFsNhHJ47X1MJYIwxzP2GmfnXaDqmGUm9aIy
         Z8Rf3+SOJmnq0UqxQyqcQ9Cfx/xquFktK3eAx39lNRDF9h9bD5f8+C+elHsVRA6O2SIp
         +bpQ==
X-Forwarded-Encrypted: i=1; AL+hErFS4vU5kzr7YZtIRR4ySMIh4xZ+ywQnRK6FEiGFm063SQQKx+4cBO8NoH0vPkREbUvSz1di@lists.linux.dev
X-Gm-Message-State: APuU4Z8XLFiZaYC45V0MXm60NINZAnmy8LUuNAp1tmpKdeqKH7A2AuNd
	z/nxtXSMA+CuOgDh5Yq1Bu8pKEvAd+FL6EPE3ZFtwzlveCPVHvWf5Bwy
X-Gm-Gg: AYBFou3xwD88Yv4MqKTH3r19VX7ip70i08SAD5dUsNgemwYAyrmxzvlfvOyH6B042GE
	Zobfr0lNrAw66TSvRObW5WDgoOc6reSeZhRhaZLnRnAhqYguOd4lpeIAJFhT/wI/4s1iKc4+N3U
	IVpNm843ZqtqqhHVdkVsTqAiTrt0y3pEZAVfQJP0qYLvAtWv2AVBCuf4N6R7e04Uwip4JHWIW1f
	b+nyl1RGlnGt2IA6Y8Ny+PFpHsBEXyU7BSBauA3RViB2SJKzBywrxABew8REO1LDe/+DLc93flC
	AgUX24F9EsCADRpfKJ26E7AVd309Qqn6gwt1nMNOr+MEoxcCMaTfA0wFXLjqUREx6sTza0IjEFV
	plT+NDihQVNdGAX0zfHC8NmgsLkqPxtKjBrRSv0HOuNQjH512MxNYHKuKr2BQp7oaasifHwgr1K
	xC110KKvWgPPyYwTobd5pmW2iBTbutlpbKf3h073KMSXVIx5Jh96uium4GToME5m19BhfnX8FgN
	la2j4NCyXrI4owgcndPkkomSJyrB0LV3N/Aj59sgdH8w8ZKX3PdqrMbT/8OL5SyqItOJymiBXlh
	S2LQRAjYgnXJ80QoecP1doFZIm7s6o1FC88hm5MPSwKgEhk6vv9+2MowOB+hcWiNj4oh1JlHYJU
	9ikY5IQz5xFjbRsEDo0EkAcFH/UriOqCl6w==
X-Received: by 2002:a05:600c:474f:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb76d61fb0mr87328795e9.2.1794919209827;
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
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
Subject: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-ID: <20261117123956.11981-2-ansuelsmth@gmail.com>
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

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
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
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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

