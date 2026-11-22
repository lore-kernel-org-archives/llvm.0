Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323212;
	b=YoK106eSOQioAjJHuTrexoz5iW2Ua87CFxmp06mEMVYu27dKtVPPfLIrf2M8p4vsQPM6
	 4eDzqNGKu9madnskIR+Ye+mBxmFIrpKOQkLI8K8xDq3oug7Cy0mINWmOce5iP6/IOA/XW
	 KINg/sDPut0uR5FEB0tUDvafZ7Y0sTBYQK2ZPewHg9t69hG9kOu1nuWo/oKE7yPKgFT1V
	 0YPr6GC2xfMA768ksmH4nXqHOuJLf9v533JsD48VTSp/gsaMNt9fX/83CiLoDlZkFD8Zq
	 iY9iizWc3IHqRugtusO9kafeV2wMVb6O538ljaNtsHQewu0s2y+w/hxFoTwr4nRfJOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
	b=iduor+GlSYjYpoKCLN+OjGtiUQ93DWAXcEkkS0GFy4QcriXXTe3nHOIEERQpvSBOs7r9
	 aS4I1Fm4JroxkuOw0XHAct2Fq35GRNJgeku0a9WhN5hcPqiSnT+NWWxlNL5MoujD6PKu8
	 9fYU+56C4+bdYc46cDiyu0mCCRvhBMuQi6xMS6JBXNMzcR4jGMERP3tRfkyuypZe5Y43Y
	 LaWWBnRYVzSi1WKVSlzcQ1solJbuLuLb2hMezjGRdOd/D9+3Po7y5kaNi/4DTYQlSr9fg
	 eSX0YKfCFxtX3WDajj80dnPTNUMTzxC68UXipWJ/Upfsl6nV7c1KcdXLhPFtuQl1klQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="XHKZ/LTq";
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B2606A337
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572B2606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XHKZ/LTq
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so2908203eec.1
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323210; x=1795928010; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=XHKZ/LTqysnkio3Ux3rVTO5QapEtv31JXxS94rzsgWDoH0dyZ/22bowgU9tzD/K95o
         zmR7/NEPrz9ukH+ubsiLNUTgNqgdFjJBybYpC2OA/NcKfgUP4By9COPIMAHNjsKjDsAv
         3PSWxuc/qO3ZvXG95aUcGhF4mwEssvFHlOf/CfF4j6AJgxOufas3oQFL5jMe+k7FbT6v
         hJ20T9pALxEfLpxlJN7fg3ZoC9MCbC35IfuZxAswr4+tIDr7zomWKyTIQ/7wwbyP2rrt
         DjZj97IHavAw2BNyorrZI5PV7i1sBoJHdlKUe52eL/o5J+zryKeq7NA1acf52GwiAnTU
         9YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323210; x=1795928010;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDpU6PvkkR9T5YMpWrxr6Vm8fDQspCIPlW5JeeJkxnA=;
        b=w7PbLs5Bi++1i7Ppp/4KL4wEIFmwrqHHHi6rFUwWxZ4tSstEzZZvqCc4GDehgRwX2h
         5mYm4UPa8VXKBNwS1T+BLjqSx2WxorT/L8TeiMeyZecq7WsjiBhsQ9zEVlNqEh5Nrjxn
         GMPZES6GuIHi9ZWdrbfCPcDyGgkbLDIVar8ARKUSo0rwnLnw5exVdr+MOY2rRl22D7L3
         BvQ9Yx33tbZQc31Mpgj+sIbCy2zDtC15Esn22WqjxclISsieeSjT9IBj9aIaZ409oUW6
         6e6IKXFBA2Xx/ijPfucbpkxvMlJYzQGHn+OuzBXwSQPKl6f6tAMTirhbskZBkl6fNjYO
         xC/Q==
X-Forwarded-Encrypted: i=1; AL+hErHp66scZK+aWTKT+PmR8ImSPAHZGBxGZuEGSTnRWEweq4syRH6FCHrnhW2a3MqcdD2VIdB2@lists.linux.dev
X-Gm-Message-State: APuU4Z/3+uJjTlRdYGHVPl6LY3EqnfAS5H1qnQZNcL9oPg8MAxplYGNC
	UJEM+RrxAgX5WITx0tGYvFCyrE6lWJOUbtp50LeZGuLgAYzb/UVD70Yy1/3pfDkX/v0rpMRxVUF
	iUe1OsR/pUg==
X-Received: from dlbtu1.prod.google.com ([2002:a05:7022:3c01:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:dc3:209b
 with SMTP id a92af1059eb24-1b5568ac6b0mr7480933c88.22.1795323210085; Sat, 21
 Nov 2026 20:53:30 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:26 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045326.19641-1-irogers@google.com>
Subject: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), the 10-iteration retry loop discards the
return value of both tg3_readphy() calls on continue and never checks
err after the loop terminates. If MDIO reads fail across all 10
retries, phy9_orig is never initialized before being written back to
MII_CTRL1000; if tg3_phy_write_and_check_testpat() fails across all 10
retries, the function silently continues as if the PHY test pattern
succeeded.

Record err on both tg3_readphy() calls and return err if the retry
loop finishes with an error so dead MDIO hardware fails probe cleanly
via tg3_phy_probe(), and zero-initialize phy9_orig since Clang's
value-insensitive -Wconditional-uninitialized check does not correlate
the earlier continue on err != 0 with the post-loop 'if (err)' check.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Target net-next and drop the Fixes tag (Andrew Lunn).
      - Also zero-initialize phy9_orig so Clang's value-insensitive
        -Wconditional-uninitialized check sees no uninitialized CFG path across
        the earlier 'continue'.
    
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..4d375328621c 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,7 +2544,7 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
+	u32 reg32, phy9_orig = 0;
 	int retries, do_phy_reset, err;
 
 	retries = 10;
@@ -2558,7 +2558,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		}
 
 		/* Disable transmitter and interrupt.  */
-		if (tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32))
+		err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
+		if (err)
 			continue;
 
 		reg32 |= 0x3000;
@@ -2569,7 +2570,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			     BMCR_FULLDPLX | BMCR_SPEED1000);
 
 		/* Set to master mode.  */
-		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
+		err = tg3_readphy(tp, MII_CTRL1000, &phy9_orig);
+		if (err)
 			continue;
 
 		tg3_writephy(tp, MII_CTRL1000,
@@ -2587,6 +2589,9 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 			break;
 	} while (--retries);
 
+	if (err)
+		return err;
+
 	err = tg3_phy_reset_chanpat(tp);
 	if (err)
 		return err;
-- 
2.56.1.750.gf70dc682cf-goog

