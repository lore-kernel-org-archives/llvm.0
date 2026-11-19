Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108225;
	b=geoS0nw8phttOB5dFI2PtZIkdQJ4To+s6ArIHQ/fw6ASUtiS6yKHTLiazjSbt/FYQtv1
	 p525Ig8wHkvbvniPvwLbpaOtdoJ9LpB132rOfjOCVgXy3aOe6fJva701v1PzAD/+InVgS
	 oud3S7k+WAFBza7hkhYAt7qZMlN3yT5jLw64jli4wQJF/AiasgBzgHp8Kr2ccuVMsyyas
	 lg47UJHLVVGg7/EWsVE+/8L25uLIUGzTvPffZ4RwZQDR7ooWEJhIkrbaccj48jslXTqY4
	 E7ztocEye/xlZKW8sOT2Tmv/Rkxb2wkAaIBVSgX/JZ5e/TLXrP9xxh/H7ByIk2iBgOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
	b=JxvkA5v/Na++pJHd7OLo3Rl/+s4M3hieuU1FtQn7BRoEuPjiRibeP6KmZI5sx4DauUAE
	 xblGB1dJlt/+kDqFuPsC3bJlcaxbvI6l1nPIvba8LQkc5rIchtsDoTvOOVLmnK5aGDa52
	 MW0kQ8NRkvQLFhjI9qGhy4TpbJHo8FHmA7VHH8kSfpImiA/aGcGVqWNwJ+8LUesn/Mzrb
	 uaZ0EWRnMahoWzxE/J7xEVn5KIeef8UqHvFG3ywZFsrPg52Un+69WLCBiQxy4H/UQ3qeU
	 u6CQwJs48UodsDHTNqWaSO7Mcso/EE2y4HCvBid0T/PongB4I0/wxhiOoStnIDLW2wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4dImffJ;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E819606CAAC
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E819606CAAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k4dImffJ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee04c49451so32436815ad.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108225; x=1795713025; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
        b=k4dImffJlfHLgcczld0k0EtbcBTIHvDdfnZIrNahPETogufV3b0i/5b92t4sKgfxwQ
         las12yz6irBuvuLH0UH9KfgU2kZxNo82XKdfGjB9ZOdl1FSoPEI09vTcVAvLpKPaxiQF
         TkVZ4YiiAcQv+zAb8bRiky3amWGxR9/f/U4Z4FX0QreTv4QGvV+dFQiZxswpy4PaI5cD
         Er0OjbcYZcuKE9dgMMrenY9ROsh3xWiHO/1qJ+6sQhTU+e2GqMR+Fx/qXt+v6twNEr0Y
         egOyZPVo3MvkSleqKkc4apCjIlykwWoc52KdypCrWgfBxYlDSWbfJGVxfK8LOa6kW5Vj
         UB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108225; x=1795713025;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7nlDoGtQsbCYF5zM2CHlDtWyCwjewwKLZSkkjg+Gqk=;
        b=KWQdiOQJA7/7hc1X4hL+NbqPTu3hiTbfkOte1RuYTl/0vqchVN5U8dh5DNIYtxT2WF
         oBiCLxTuab4W40iGbjrT9bhkyt4URde62Q55a1vgxhnhSUftb9kD4SAgIQabKZCdgkba
         qzMGGu9zIH3X/0hl1N5iS5nudKtHm5NVBNT1BjuP5HPjSK9THAeB0Z3UJ6HRyP1Jpo3l
         In5xlNHsBLNx/I+bkVXVUOk/yMcsbjzUXWZCv+J7eDRg4KboVSNmVMiEtNGf9S0Ung5Y
         VQVguZ2dntF7KSXMn7OnIYVRAGVQUCPZo5mTxqKys6sMSqGmQDrkCBOFB8Car/ssMBSW
         +w3w==
X-Forwarded-Encrypted: i=1; AL+hErHJLCaUUZF1pAvmq+zj9uqZb4obaYlqgwL0x6uVpPiXlTvQB1V++SPa5yRjsmBIivIvOO0z@lists.linux.dev
X-Gm-Message-State: APuU4Z+22INJHVFw9Ko1M2vjiBy8xskoXtn7RCteaURVFvU7yms5CnZt
	juXwmU1xjSn9r8M3GzQHKUoR1a/WOUS+VBOXcHK03qi/L9B02vX5HSp3Qrtfsvpoe6B7OiZ3DLn
	eX+mBcMoUnA==
X-Received: from plbkf8.prod.google.com ([2002:a17:903:5c8:b0:2ea:7221:e753])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2b0f:b0:2ef:d981:9576
 with SMTP id d9443c01a7336-2f03f181ee6mr4877595ad.54.1795108224402; Thu, 19
 Nov 2026 09:10:24 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:21 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171021.1535172-1-irogers@google.com>
Subject: [PATCH net] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
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
loop finishes with an error.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building drivers/net/ethernet/broadcom/tg3.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on BCM5703/5704/5705 hardware.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/broadcom/tg3.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..be2410e718fd 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
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
2.56.1.708.g77570a6a1d-goog

