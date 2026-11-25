Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567355;
	b=RL08+nNBWA/kc+IIe0DJriH2CFsYiBNOow/tcz75caCxi7AfGaX7HhetsAitKtTy197w
	 pkvDoi07YUlJyuAtJa6DXJsB4wGiwvfSW699i26LBKIkZiKRojO8YC4y3rITXcw4DZiCC
	 JJqMBvk9RkQ5mHUVH/UQHQHY7jVkuMWmx1iSM+GWMjakd70nztaYDepz0P6QMi8SvQk6u
	 UAiECuKEZQ03CYnYl3POIGxYWb+4cPDHot3ImGDutff3D9J6TZE+Gza4b1j/AtUY/xHpx
	 UxCSWMB41yQzuk/0L4waRyDOhodMF+SCaBhFgkK0LvGmBuskRC96wE2CLiPonRZhMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
	b=I7FduVHhqFPMJbjdoO1p+Hz46dnn7DiM6hgPmzS3TR4kTgIndzvLtg2ZpnMl/5KpJp2q
	 NTmfsJheFcvZmL/39HIRCElzknhk8YYQfsfw8q6pOCMYQdLQty3QrctBFsVZC4jTg4jzv
	 UY16YKm9qpaAXyL1h71xOGjLPPSH/6WdoLLFYJ0R77K7Ue6BhwHoT58SpGwerZZE15YFu
	 jS6IgtPNQulXOh/MVpxR5g3b1uDpNdovXlZx2xss1baOuAoalUZxucIUu77RuYxxlYRmr
	 vlbff3wkYzxZDDKUdm1uwdj8erKa5C+sReggHHZa/+6hcF+8s7f6/PX4H/OkKP0mEjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OmmaGpYa;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB9606A330
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CB9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OmmaGpYa
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6894673eec.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567354; x=1796172154; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=OmmaGpYai1aSGB0yya8san48Jx8KuhSFbiEM/oQN4VpCOd8V4ahkIMjkS8uhXlsJnB
         IY30c0rUsvMU9CIluOSTdFGXpAVfVF1z5o0wBMPo2oP1y0TFFH2gq9i/GwQYFXKHJFXW
         zUbMHrZMvN7dDXfUV86IHUAMWmWaWAHhyCtTlLVCX/dGEieTkbSinD1DCpyWHH9XIcmo
         IIU2Vh5eX3hY6ZH599clTrodE5y4yLIa/gTkYJxHcd2f6GsaW1LkDRueyWaHKHlF+EVr
         xcpElrx9s+aiwKQrKpDi7cvXI700pR1ES5EXuAUuMTUjt1bmxydr77pyKjSCMsdHTd5G
         7K9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567354; x=1796172154;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=nlbhih/HZglCEBuvu+Q2+b+eoof2B5gsxhmFMju+wa99aWWuqkYZFHrtl0mqNPKbq7
         lto7BRxneMHxmiFkwM0TE5iyCw8wH0+Mq687VTUrrb7P0Mt9EfAe240awslkKXLBjF0G
         L2kT7Yb3pOZg5waHGSMjHCLKy49Q3mBowPUKtH4GNE2ZGls9z/XgS/gfp46ceKyWlocp
         +r9FrEESCnNNz+6Q6RPX6o5BUlp2mN1xo8kETsJh2yS2PSim5PUrVqEbYSIEXw1c60L3
         +3DqwEEQGxWh6d0oAa9ps4ukmO4PLZ3P5mF2670LbkYkkRJXAqwabjwLsnLuSE1ELhyl
         kMlA==
X-Forwarded-Encrypted: i=1; AL+hErHyEuz9V0vXFAxHxsRDc1jX/YGbGkm06nxasx8o/5ly3OUpwTagxYjPJfxQFLk6IpIViprv@lists.linux.dev
X-Gm-Message-State: APuU4Z/TjIW9SysnZYX9LgL/D7mtd2eAo1RNvUoO1wDsPqAQUwW76FPo
	QXGZlObefEk5rk1hbmIEpP84aP9MkoJF7I/OcoxDG0f5WR/uiKjzy1WFjfQOVlykDyAIMxjRIjE
	rhzNBeTbS/w==
X-Received: from dybmf45.prod.google.com ([2002:a05:7301:92d:b0:386:c9b4:86cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6192:10b0:386:a7f2:88e2
 with SMTP id 5a478bee46e88-386a7f28967mr9694191eec.23.1795567354105; Tue, 24
 Nov 2026 16:42:34 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:31 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004231.1007868-1-irogers@google.com>
Subject: [PATCH net-next v3] tg3: Avoid writing uninitialized MII_CTRL1000 in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), if MDIO reads fail across all 10 iterations
of the retry loop before MII_CTRL1000 is read, phy9_orig is never
populated before being written back to MII_CTRL1000 during post-loop
cleanup.

Track whether MII_CTRL1000 was successfully read with a phy9_orig_set
flag and only restore MII_CTRL1000 when phy9_orig_set is true, while
keeping the existing post-loop DSP and MII_TG3_EXT_CTRL cleanup intact
when tg3_phy_write_and_check_testpat() exhausts its retries. Also
zero-initialize phy9_orig because Clang's value-insensitive
-Wconditional-uninitialized check does not correlate phy9_orig_set with
phy9_orig.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v3:
      - Keep the post-loop DSP/MII_TG3_EXT_CTRL restore sequence intact when
        test-pattern retries are exhausted instead of returning early with the
        PHY transmitter disabled and DSP 0x8005 blocked, and drop the
        inaccurate tg3_phy_probe() claim from the commit message (Sashiko AI
        review).
      - Guard the MII_CTRL1000 writeback with phy9_orig_set.
    v2: https://lore.kernel.org/r/20261122045326.19641-1-irogers@google.com
      - Target net-next, drop the Fixes tag (Andrew Lunn), and zero-initialize
        phy9_orig.
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..21d21fb2b016 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,8 +2544,9 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
 	int retries, do_phy_reset, err;
+	bool phy9_orig_set = false;
+	u32 reg32, phy9_orig = 0;
 
 	retries = 10;
 	do_phy_reset = 1;
@@ -2571,6 +2572,7 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		/* Set to master mode.  */
 		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
 			continue;
+		phy9_orig_set = true;
 
 		tg3_writephy(tp, MII_CTRL1000,
 			     CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);
@@ -2598,7 +2600,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 
 	tg3_phy_toggle_auxctl_smdsp(tp, false);
 
-	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
+	if (phy9_orig_set)
+		tg3_writephy(tp, MII_CTRL1000, phy9_orig);
 
 	err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
 	if (err)
-- 
2.56.1.831.g720f3f5937-goog

