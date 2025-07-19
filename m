Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD79233721
	for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913889; cv=none; b=uFXegeCK61u77m8AT5dqGtusjg1ACTgGbsjaMlqJ5CUGfpBLiGwCG6VKi6jq00eN5jZYK1gqVkcVAhKkLxpvA8d8yMRm8g2EFi4MJZoxdBZP+PovOu3Xi0+tI6wnbXRDLus41spmDdWY3Mjy4r0IdjzCFfliPhmVyWOKk6ktVtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913889; c=relaxed/simple;
	bh=tkJPSIi59XHN9fF/q4MByoCVzmykKuP7k9Ib+L/auVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nje9vDTNFeYh/c7mI2yNsKBjbqATDlwOpdwuH0Rq23AvqAZ1yuKrWFKGHYdjHsLB24/cUCIAyAqlflho86n6MLUqme6R0SDsHh1qQQUF2ag5NEvZIDgjiDITE/g/hC3l+Tp2sNv9F9iCbR0tf6wQmejiHf8jV07Z5Q9YBGaYP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3spwGth; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3spwGth"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45617887276so19655025e9.2
        for <llvm@lists.linux.dev>; Sat, 19 Jul 2025 01:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752913886; x=1753518686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDcGeiGNqBeCksEvhHpD9Yw5aiU56UCUr558cU8kIhI=;
        b=g3spwGthR4soP1JTHu8E16AEWcp+Nw5a4qX5+XMg3xH1gdruRgrRc+YjSI1GozT4wR
         pQ94W1Rm1U+5H46h+aT3M14RMpCLADr09FnccMyjG+b5un3oI/nkFLaNvE7/r1HYJe96
         ZsTnplClIAhmhUvc80g+cvBcw6bOw5jVggUS31tb8cd01vYs3mkhivXzu7e6Izgja7P8
         4EXCMxhqclwTfF5XzycZaT3kLHmn75wTd1d+0iNrmdhnPLADq/RBGIpT9jhQ26WZVpO4
         T79tEN/NnN4yjH6KjnC7MMNgLzlqlk4AKWWX14X3nDWcQlOnGQEn5aqg88lfycRkYMAa
         +wqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913886; x=1753518686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDcGeiGNqBeCksEvhHpD9Yw5aiU56UCUr558cU8kIhI=;
        b=AsZKo9o5fA+t6KF3L6B2ZJLrcTVEp0mzpIjL1nR+1+d1R6x6vUDDSDW0iKktaOYucR
         QogdthMwytM5Oydi8JyMOuD7mWHV6hi01JgaN/cNOFmb2D4t09plfq++B8MFbkNR6RvK
         u1OFBYiVGswvs/C1p28hrLXe8ybnKinWb0tEvvhV6Uq4mp/dQwgVQk1XvbQG9cMzx/gr
         SmZ1K+QSpqqyb9VYPLItaLPRM+Gz7wCL1PM+ydxEoi/j6x6rEbHrFHQXXlkOcmb4+vLS
         nDcTCRqgeKmE+OG7SnPpE+gWvT5zQzybc2yrmgfdq4eL9PuutIoPGzKFzZa87iR+qlYB
         0Ynw==
X-Forwarded-Encrypted: i=1; AJvYcCVX4G0+bbqsn+fe1K0ynkFOJB0uIyAAy/T9x25gzVTLsMYGwaipX47j6XBsChZaxzR/ymjZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3XsClE8Y/sbtiB1e7VVPayhunNx+LsH2CF11AXDRbwX47Odx3
	60kVN/OzS280qrECKf3kckXYKVXDVr8FAMb6wr8txrHvjqY7d++Wnka5
X-Gm-Gg: ASbGnctjK47VDqpN5n0aKT1uIzLVnQTUtymEcAOdwcrQqmYgiawjDJcp5+TZs5Lq5yD
	wbSn8k3+yFgwW4+GhQK/BUvsfklOh3TWEHZKRjFwQdzi6fD00SyNpOvQsHlQXxapedA+4yt7rDr
	kZHhZYnyh29ul8bAhkCCTPn2oQ9WYnUH0sI4+9N+npgQaby1Tn3b12tPVLN64QPQcpDrnRGXCo6
	AXNKXQ0nLkNNCsWyk9EMLVLYFCf9seKgLadLRcCxgIDes2DF+XhcGVw4156+YwAeTgfIu4vELav
	LaYfQCPPDTYbpLpj/ihQdTIuiF5rxROcEqO612IyAjLCUoM6fvLEpQCNxEctasDeHHw5v3xT0db
	gwIZPTMxkS8e9jxn7CsY=
X-Google-Smtp-Source: AGHT+IFkNet5uHb3/c8lWyYxDXjpEWHstlNMS2AHrN4Vc1bp9rHxD673u6W8OpqkiwvNZniTA6tRGQ==
X-Received: by 2002:a05:600c:3488:b0:456:f00:4b5d with SMTP id 5b1f17b1804b1-4563a1f42c0mr57061125e9.22.1752913885695;
        Sat, 19 Jul 2025 01:31:25 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:3::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca254e7sm4146417f8f.4.2025.07.19.01.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:31:25 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	shuah@kernel.org,
	horms@kernel.org,
	cratiu@nvidia.com,
	noren@nvidia.com,
	cjubran@nvidia.com,
	mbloch@nvidia.com,
	mohsin.bashr@gmail.com,
	jdamato@fastly.com,
	gal@nvidia.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next V6 1/5] net: netdevsim: hook in XDP handling
Date: Sat, 19 Jul 2025 01:30:55 -0700
Message-ID: <20250719083059.3209169-2-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250719083059.3209169-1-mohsin.bashr@gmail.com>
References: <20250719083059.3209169-1-mohsin.bashr@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jakub Kicinski <kuba@kernel.org>

Add basic XDP support by hooking in do_xdp_generic().
This should be enough to validate most basic XDP tests.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mohsin Bashir <mohsin.bashr@gmail.com>
---
 drivers/net/netdevsim/netdev.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 611e7f65291c..a7628f5c09af 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -387,15 +387,34 @@ static int nsim_get_iflink(const struct net_device *dev)
 static int nsim_rcv(struct nsim_rq *rq, int budget)
 {
 	struct net_device *dev = rq->napi.dev;
+	struct bpf_prog *xdp_prog;
+	struct netdevsim *ns;
 	struct sk_buff *skb;
 	unsigned int skblen;
 	int i, ret;
 
+	ns = netdev_priv(dev);
+	xdp_prog = READ_ONCE(ns->xdp.prog);
+
 	for (i = 0; i < budget; i++) {
 		if (skb_queue_empty(&rq->skb_queue))
 			break;
 
 		skb = skb_dequeue(&rq->skb_queue);
+
+		if (xdp_prog) {
+			/* skb might be freed directly by XDP, save the len */
+			skblen = skb->len;
+
+			if (skb->ip_summed == CHECKSUM_PARTIAL)
+				skb_checksum_help(skb);
+			ret = do_xdp_generic(xdp_prog, &skb);
+			if (ret != XDP_PASS) {
+				dev_dstats_rx_add(dev, skblen);
+				continue;
+			}
+		}
+
 		/* skb might be discard at netif_receive_skb, save the len */
 		skblen = skb->len;
 		skb_mark_napi_id(skb, &rq->napi);
@@ -936,7 +955,7 @@ static void nsim_setup(struct net_device *dev)
 			    NETIF_F_TSO;
 	dev->pcpu_stat_type = NETDEV_PCPU_STAT_DSTATS;
 	dev->max_mtu = ETH_MAX_MTU;
-	dev->xdp_features = NETDEV_XDP_ACT_HW_OFFLOAD;
+	dev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_HW_OFFLOAD;
 }
 
 static int nsim_queue_init(struct netdevsim *ns)
-- 
2.47.1

