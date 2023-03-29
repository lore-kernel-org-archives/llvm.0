Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7FAFE3
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680094780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=86UBb8HdpgIHfVhY0bm+TJ2suHKWLXTuDDNwC3Il230=;
	b=OK2YotPEynwOTb3sLYPaXAMirjxYVtXekoSw0lD1iW7yIqf6Lc8mhGXceuAnNEWoSg5cTM
	EoYmUIv5SRekOt6OEfR11gkPyzuJr4K8MBuaRGxcDcxYJ7xXO3YHXVyKkHFBognvKf1lUo
	D1qi7DplwRgRiCiayYJOZh7l1zUOv8E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-OSA9h1v5MM2qaXaWyYyHVQ-1; Wed, 29 Mar 2023 08:59:38 -0400
X-MC-Unique: OSA9h1v5MM2qaXaWyYyHVQ-1
Received: by mail-qt1-f197.google.com with SMTP id r4-20020ac867c4000000b003bfefb6dd58so10267655qtp.2
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 05:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680094778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86UBb8HdpgIHfVhY0bm+TJ2suHKWLXTuDDNwC3Il230=;
        b=1vYXH/I8/HWiC/VwLC/w1L2RDvLEtwACV+0pP7CICpfP6LdXP9frVhdXuW765Rda3s
         X/87zCyt5hs2J1P2Ohh0UgOeRfs9dWAgk4eilixTC/LOBO529g76iK9L7n3GqGoybZ/T
         IzG40IwJlI39nuQyCvnN8rK41uPzUKxXt+S4zJ3JFh/T+u+fzboOp3Us4+TIMXcYWX/j
         ZC7pG2BkouFHd4itm2wQMvE5oCoecv6kH05KJsmg6JxkaU4RVY7XoSLGA0cblug4br12
         F+Q5TANceY+61uuRPKmLE0OdnUpDKFWQFaOQdfDNKLK2Uz37H6FnAGq6HtGp6UBCb8Qu
         mzTQ==
X-Gm-Message-State: AAQBX9f4Ufe1itommf5GcbUTpibhmRqV4scnGzM7z8St3Q2hdiObM24p
	W+daV2B9BLWhe0yvymd0A8Xgi+yLpmxnt9KIbj4u2/7ITlLma2kndY/4U1Y62t4QoBuMoPoyugI
	PuBxpwJjWDHnStw==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id jt8-20020a05621427e800b005a92bc0ea8bmr30791788qvb.47.1680094778308;
        Wed, 29 Mar 2023 05:59:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350aCFDVmgs9QLSrptBUrHI+9EDrPp4bz2FZhJVxYqlzrqAKxcL7EnPJxxdbqcRi5DywnP3LffQ==
X-Received: by 2002:a05:6214:27e8:b0:5a9:2bc0:ea8b with SMTP id jt8-20020a05621427e800b005a92bc0ea8bmr30791765qvb.47.1680094778084;
        Wed, 29 Mar 2023 05:59:38 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id mu10-20020a056214328a00b005dd8b9345aasm4515697qvb.66.2023.03.29.05.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:59:37 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	petrm@nvidia.com,
	leon@kernel.org,
	shayagr@amazon.com,
	wsa+renesas@sang-engineering.com,
	yangyingliang@huawei.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] net: ksz884x: remove unused change variable
Date: Wed, 29 Mar 2023 08:59:29 -0400
Message-Id: <20230329125929.1808420-1-trix@redhat.com>
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
drivers/net/ethernet/micrel/ksz884x.c:3216:6: error: variable
  'change' set but not used [-Werror,-Wunused-but-set-variable]
        int change = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/micrel/ksz884x.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index e6acd1e7b263..f78e8ead8c36 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -3213,7 +3213,6 @@ static void port_get_link_speed(struct ksz_port *port)
 	u8 remote;
 	int i;
 	int p;
-	int change = 0;
 
 	interrupt = hw_block_intr(hw);
 
@@ -3260,17 +3259,14 @@ static void port_get_link_speed(struct ksz_port *port)
 					port_cfg_back_pressure(hw, p,
 						(1 == info->duplex));
 				}
-				change |= 1 << i;
 				port_cfg_change(hw, port, info, status);
 			}
 			info->state = media_connected;
 		} else {
-			if (media_disconnected != info->state) {
-				change |= 1 << i;
-
-				/* Indicate the link just goes down. */
+			/* Indicate the link just goes down. */
+			if (media_disconnected != info->state)
 				hw->port_mib[p].link_down = 1;
-			}
+
 			info->state = media_disconnected;
 		}
 		hw->port_mib[p].state = (u8) info->state;
-- 
2.27.0

