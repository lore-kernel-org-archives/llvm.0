Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F0A4680
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658420137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PPUfN2aC/PVXDzfJ07LBJeBzGqwt66XBq8iYF1IJ01w=;
	b=FTMo96BilCtH4a5bMqnznbGYxqhY2X4mqMvsXauVHKLpObAMUQ78DQeOcFl/5/wRVH8/Ue
	yzKjW6pmfgOnAUrphG5k2uOATuZrS1b/LNAu4mDYm4Y9qJpXzXutLI53/GxFCk0Hm3zBI4
	7iQzvFskNQJRpXpWnInOKnEtTXIsva4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-WOeSNLPCPsCbrXPT-Uvr1Q-1; Thu, 21 Jul 2022 12:15:36 -0400
X-MC-Unique: WOeSNLPCPsCbrXPT-Uvr1Q-1
Received: by mail-qv1-f70.google.com with SMTP id d18-20020a0cfe92000000b0047342562073so1345549qvs.1
        for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 09:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PPUfN2aC/PVXDzfJ07LBJeBzGqwt66XBq8iYF1IJ01w=;
        b=4QsX9Ke7/+bkGNEwT1a/G6Uvy0z3yBLdU7Qjd8Jk/uB0VTsX8Ges6iEFydS1y5acdv
         4yqCMVSwDw4JlgPVuF4xR2prmWnR92IfI6SwbHaociBBtpzEmS6NX/xYZQjc3Orru1q3
         WdtxlsFM3YvlYmSFVNFyzN09pwlVFLldmIqp0TFVu0IGNPqnczHonmPA3RiVTSJw8Ut5
         y/cnV6mXewi9WWcnGefvauw4sn8LyhZ8AXxiZhBKSxWA/dn8ajikDq3Q4t/zMQEvX2/B
         4geMkIklwfzZrie3oM5zw5xvCFIEGY3Zbm4cBFLZrXiEoZOyjhwIyhAsfN4vxdp4LQ7n
         SQ9g==
X-Gm-Message-State: AJIora+AyxvIFvp0JM9e+0m11+wTo/A55G0/Bxx7dIhPmjEPbsq1Pqqb
	1n+pv9WKc8u+WxGMqsBnClVjhoYAZ/iJxEGckqZRn/K5XkpYkRgk6+tcw0J/81XYllNDMekt9Ou
	qsAtG4/x2Vf/4BA==
X-Received: by 2002:ac8:5a52:0:b0:31e:f585:3d66 with SMTP id o18-20020ac85a52000000b0031ef5853d66mr15116744qta.90.1658420136213;
        Thu, 21 Jul 2022 09:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBeHanWUmyHthB96zttRkCX6UHShHu5dTY7wk2xVfGz3V9RUE/OA/ewP2v5Pq5J8ymODrXBA==
X-Received: by 2002:ac8:5a52:0:b0:31e:f585:3d66 with SMTP id o18-20020ac85a52000000b0031ef5853d66mr15116722qta.90.1658420135971;
        Thu, 21 Jul 2022 09:15:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j2-20020a05620a410200b006b5cb5d2fa0sm1868385qko.1.2022.07.21.09.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 09:15:35 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: wg@grandegger.com,
	mkl@pengutronix.de,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	mailhol.vincent@wanadoo.fr
Cc: linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] can: pch_can: move setting of errc to before use
Date: Thu, 21 Jul 2022 12:15:26 -0400
Message-Id: <20220721161526.930416-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang build fails with
drivers/net/can/pch_can.c:501:17: error: variable 'errc' is uninitialized when used here [-Werror,-Wuninitialized]
                cf->data[6] = errc & PCH_TEC;

The commit in the fixes moved the use without moving the setting. So move
the setting of errc to before the use.

Fixes: 3a5c7e4611dd ("can: pch_can: do not report txerr and rxerr during bus-off")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/can/pch_can.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/pch_can.c b/drivers/net/can/pch_can.c
index 50f6719b3aa4..32804fed116c 100644
--- a/drivers/net/can/pch_can.c
+++ b/drivers/net/can/pch_can.c
@@ -489,6 +489,7 @@ static void pch_can_error(struct net_device *ndev, u32 status)
 	if (!skb)
 		return;
 
+	errc = ioread32(&priv->regs->errc);
 	if (status & PCH_BUS_OFF) {
 		pch_can_set_tx_all(priv, 0);
 		pch_can_set_rx_all(priv, 0);
@@ -502,7 +503,6 @@ static void pch_can_error(struct net_device *ndev, u32 status)
 		cf->data[7] = (errc & PCH_REC) >> 8;
 	}
 
-	errc = ioread32(&priv->regs->errc);
 	/* Warning interrupt. */
 	if (status & PCH_EWARN) {
 		state = CAN_STATE_ERROR_WARNING;
-- 
2.27.0

