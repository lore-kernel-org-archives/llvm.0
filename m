Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD78F54
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 20:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680296152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4iXEOFNILcUMsIjcydKfmGYblvwSUsIqK+R28wpgVSw=;
	b=bP2w9VckhFMfUjAMjeLH1fZ1b2HSeeqFMMUuU+TYLy8uUSNAr6KQGvfwDKWwblG0Gb9GSq
	urOwLvU8NwbIkHxGey7xtxyD5ccLeMF0UQ3KPB35LsNYk1allNrcynlc/ugLE8VHXumtgd
	jqtqMb6vt0qq/1QkWm/NU+lbw5jqgQE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-DtDy6kSDO1ecF6Vac4tZIQ-1; Fri, 31 Mar 2023 16:55:49 -0400
X-MC-Unique: DtDy6kSDO1ecF6Vac4tZIQ-1
Received: by mail-qt1-f200.google.com with SMTP id h6-20020a05622a170600b003e22c6de617so15459324qtk.13
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 13:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680296149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iXEOFNILcUMsIjcydKfmGYblvwSUsIqK+R28wpgVSw=;
        b=u2HsE9uxMhY9n80i1loNoOaEsCBiYyrMdEdiG9KaV60rE/EjXdSb/oDINYC7+9QKch
         LrMtQ+7o34G1JPatk24V7Kgm1uIshgtEOaSI9S2P9oA2y0Ua3ypEL/vq1hKwN75HCjkj
         wW0WOg8kq+E9CuuVRnWiwTW78mnjsnurQKb6uUggl34bnWKAM7WUKvNJOZk+k2Zte9t5
         T6eZcPV+UpJJfgd2LV3cX7wFuI0smDGKOZwHBMA4EPaDW2bR0M3q6nBdeu9ieQkjNP3U
         ilrKNQWHeCZTE6IBEr2Fk5+FcXj+R5pIEVYRgnFK1atln0y9L6IkQA4KMAEZzGGzmi9o
         IbLQ==
X-Gm-Message-State: AAQBX9dUF7oh/PpYIiQN4GWLRQbEOz2FBQIJNVU7uMPE66kK3a+GaCI+
	w9tmZg08D3Q5j2d5JcZDfEjp7f+ygnPHk6TMBOWAPDb9/YWHYlaZAC5XET+zURpcYszMSPnUYaV
	LlANjQFtwmHHWvA==
X-Received: by 2002:a05:6214:d83:b0:5df:3310:c1f9 with SMTP id e3-20020a0562140d8300b005df3310c1f9mr28014875qve.5.1680296149145;
        Fri, 31 Mar 2023 13:55:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350b7lU6rfvonQF6UvzHAg1z9y6+ns7pWBTCXqEidZmccRyfV4/pcAgSDviIOorQpDT9jgOtcwg==
X-Received: by 2002:a05:6214:d83:b0:5df:3310:c1f9 with SMTP id e3-20020a0562140d8300b005df3310c1f9mr28014849qve.5.1680296148838;
        Fri, 31 Mar 2023 13:55:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id o6-20020a0c9006000000b005e0cd3c21c8sm875543qvo.13.2023.03.31.13.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 13:55:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jes@trained-monkey.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-acenic@sunsite.dk,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: alteon: remove unused len variable
Date: Fri, 31 Mar 2023 16:55:45 -0400
Message-Id: <20230331205545.1863496-1-trix@redhat.com>
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
drivers/net/ethernet/alteon/acenic.c:2438:10: error: variable
  'len' set but not used [-Werror,-Wunused-but-set-variable]
                int i, len = 0;
                       ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/alteon/acenic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index d7762da8b2c0..eafef84fe3be 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -2435,7 +2435,7 @@ static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
 	} else {
 		dma_addr_t mapping;
 		u32 vlan_tag = 0;
-		int i, len = 0;
+		int i;
 
 		mapping = ace_map_tx_skb(ap, skb, NULL, idx);
 		flagsize = (skb_headlen(skb) << 16);
@@ -2454,7 +2454,6 @@ static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
 			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 			struct tx_ring_info *info;
 
-			len += skb_frag_size(frag);
 			info = ap->skb->tx_skbuff + idx;
 			desc = ap->tx_ring + idx;
 
-- 
2.27.0

