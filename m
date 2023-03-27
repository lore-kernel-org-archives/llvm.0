Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A42F3A
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 23:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679961274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bN/6UZ/3G3OFwtl3tDJU5Pd1KJsgKsolxsW5pCSkgR4=;
	b=WLIssPveYcYDhvunF6FIg5lVle20hiq/nboHaHFqf61/xjFkWYRKbMsuQ+mfUPg45heE8j
	Pl1sdjyQgiY7CM4SUWyHXhprrOWBe8JrM8mI/tPenO8UqtApi+Nt0c0w6zk1rvsMkMi8UI
	EvZwty2KthXOvr2etgDcRtF9AygCprs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-ohNc5ke4OT2DWhYlsP2oYA-1; Mon, 27 Mar 2023 19:54:31 -0400
X-MC-Unique: ohNc5ke4OT2DWhYlsP2oYA-1
Received: by mail-qk1-f199.google.com with SMTP id 206-20020a370cd7000000b007467b5765d2so4857163qkm.0
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 16:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679961271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bN/6UZ/3G3OFwtl3tDJU5Pd1KJsgKsolxsW5pCSkgR4=;
        b=hTBLHYbczAO7ylrsia1j8YeaNQRMO1rLtldtPCtNzKoFeTXHFJrUWZ6cinu0hOJmng
         2kUrQJTK56KwxR4PzLWkjjgQ4jkerW21B+kfqwkOkd7DaU5FpVWwoA7h+vM+BJ1bRvHv
         QfdjR7tsuffttJ7W/T94byHbtD/38XhWKxLIKhfLecINGvzd72flhb5FlESV425lTclF
         HD8cwK79vY5bQV67Sn7mz0//diot0ZFCVxBtEa95QRFUaI7f/sd3RzCxTkNLpR2LG56j
         H9RPYcLsXwZM6gGHFYhYESiC2mh50eiwPv3EyyM4uW7gntf+CgsfDLlsCx/LPi9QkcQh
         FPWA==
X-Gm-Message-State: AAQBX9fgPZaoOmZD7hisj6N88/08sq4nW4D8656mkdozuCDdrSu4x+ae
	Yab44lfGyP/tmjSql0k/4YcJbeHuUuCa4F+VXpxc3ZZkHm6i1Ph7P66Txq0Y2ctHMDIdTyI358a
	nlATcEcXS5S3vcg==
X-Received: by 2002:a05:6214:1c45:b0:56b:7ec7:b158 with SMTP id if5-20020a0562141c4500b0056b7ec7b158mr24155029qvb.36.1679961271137;
        Mon, 27 Mar 2023 16:54:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350YG2xhiotyuMY1L5G1mR7yrlH1f/ryIRtriuEls3TFl4S1M/12D5tDvSsBcKMGolgb5vfZ0sA==
X-Received: by 2002:a05:6214:1c45:b0:56b:7ec7:b158 with SMTP id if5-20020a0562141c4500b0056b7ec7b158mr24155015qvb.36.1679961270903;
        Mon, 27 Mar 2023 16:54:30 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m124-20020a375882000000b0073b8745fd39sm17118677qkb.110.2023.03.27.16.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 16:54:30 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ethernet: 8390: axnet_cs: remove unused xfer_count variable
Date: Mon, 27 Mar 2023 19:54:23 -0400
Message-Id: <20230327235423.1777590-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/net/ethernet/8390/axnet_cs.c:653:9: error: variable
  'xfer_count' set but not used [-Werror,-Wunused-but-set-variable]
    int xfer_count = count;
        ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/8390/axnet_cs.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/8390/axnet_cs.c b/drivers/net/ethernet/8390/axnet_cs.c
index 3aef959fc25b..78f985885547 100644
--- a/drivers/net/ethernet/8390/axnet_cs.c
+++ b/drivers/net/ethernet/8390/axnet_cs.c
@@ -650,7 +650,6 @@ static void block_input(struct net_device *dev, int count,
 {
     unsigned int nic_base = dev->base_addr;
     struct ei_device *ei_local = netdev_priv(dev);
-    int xfer_count = count;
     char *buf = skb->data;
 
     if ((netif_msg_rx_status(ei_local)) && (count != 4))
@@ -662,9 +661,7 @@ static void block_input(struct net_device *dev, int count,
     insw(nic_base + AXNET_DATAPORT,buf,count>>1);
     if (count & 0x01) {
 	buf[count-1] = inb(nic_base + AXNET_DATAPORT);
-	xfer_count++;
     }
-
 }
 
 /*====================================================================*/
-- 
2.27.0

