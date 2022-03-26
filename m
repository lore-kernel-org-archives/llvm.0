Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC2D322E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648310597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bry4AKMS/vevGStNrgObkjRlJ6h49H/diQKhGrm6CHM=;
	b=ZzJTEvkoah/1Jgm09WMQYipIOSru3hyKwUdxMCcVLGyS4NWtoHuKrulvMurgmCSiJhXfmW
	2+CzOKMAuULfmhsPg95gy9wEYbEkOjmVfxRN19R29cOL/2rUmeJsfbtRge9y8SEP97xqAC
	qXr2obo+EZJ5roxsKw0r6X3Ycd/9Jus=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-3EQN_o-_OPi5J09x51HJSw-1; Sat, 26 Mar 2022 12:03:15 -0400
X-MC-Unique: 3EQN_o-_OPi5J09x51HJSw-1
Received: by mail-qv1-f72.google.com with SMTP id z2-20020a056214060200b00440d1bc7815so8129096qvw.1
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 09:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bry4AKMS/vevGStNrgObkjRlJ6h49H/diQKhGrm6CHM=;
        b=TpoLa3czpI9Mot0uPxtQ0WCq0taFNPG1fcQ5OaXbSE7sAZmQj0b1uRkcWSKfazLo/Q
         OC8IEIlnXQgNJ4Dhy0ZJ3PG4jJZJhzlIQ4XOWVTRJn8mVinCBxsfnB0Oj3Cn6eYtpjKc
         7iNTyc8z/eocIQ39FbEXtcy8EpL8e5GNVapoFaoalLmJr7oOQCWeWc2T9l3f+IX1qfcw
         3sBz0bkFU8h6MkpsOAHAVlIKtuBbc/4vcrw3SrtsvUjfT2TGvrXgdx0J4m0tclCb4vZU
         /xRbZIZw/WpBZ6EdCPbznipX8i7ZwBldjHuqolq0HoUoSOadgr5USptyJxzK1ic3zVw1
         jGOA==
X-Gm-Message-State: AOAM531p8G2FIxB4RhLaLngWQPJCuvL5sRGlhmu3XOlyefIsGzVgEv3Z
	8GJdIaPbbO8s+rvmuaC1q0DZdmWONg5Rq9owEgDMrthsvv6RJmWYhMHdczaqNayNqaEDPWO1EUx
	xmWv00cJDu00PEA==
X-Received: by 2002:a05:622a:54f:b0:2e1:cc45:312a with SMTP id m15-20020a05622a054f00b002e1cc45312amr14704594qtx.435.1648310595346;
        Sat, 26 Mar 2022 09:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6fronfcMnuSXyF+/ES2DFJZAdcP9f7lNHvdhha7BUhvMBoQroYbjy5RKRi0G+aIYV6wEqOA==
X-Received: by 2002:a05:622a:54f:b0:2e1:cc45:312a with SMTP id m15-20020a05622a054f00b002e1cc45312amr14704574qtx.435.1648310595081;
        Sat, 26 Mar 2022 09:03:15 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id t19-20020ac85893000000b002e1afa26591sm8590906qta.52.2022.03.26.09.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 09:03:14 -0700 (PDT)
From: trix@redhat.com
To: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	jerinj@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Sunil.Goutham@marvell.com,
	naveenm@marvell.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] octeontx2-af: initialize action variable
Date: Sat, 26 Mar 2022 09:03:06 -0700
Message-Id: <20220326160306.2900822-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative issue
rvu_npc.c:898:15: warning: Assigned value is garbage
  or undefined
  req.match_id = action.match_id;
               ^ ~~~~~~~~~~~~~~~

The initial setting of action is conditional on
 if (is_mcam_entry_enabled(...))
The later check of action.op will sometimes be garbage.
So initialize action.

Reduce setting of
  *(u64 *)&action = 0x00;
to
  *(u64 *)&action = 0;

Fixes: 967db3529eca ("octeontx2-af: add support for multicast/promisc packet replication feature")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../net/ethernet/marvell/octeontx2/af/rvu_npc.c   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
index 91f86d77cd41b..3a31fb8cc1554 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
@@ -605,7 +605,7 @@ void rvu_npc_install_ucast_entry(struct rvu *rvu, u16 pcifunc,
 	struct npc_install_flow_req req = { 0 };
 	struct npc_install_flow_rsp rsp = { 0 };
 	struct npc_mcam *mcam = &rvu->hw->mcam;
-	struct nix_rx_action action;
+	struct nix_rx_action action = { 0 };
 	int blkaddr, index;
 
 	/* AF's and SDP VFs work in promiscuous mode */
@@ -626,7 +626,6 @@ void rvu_npc_install_ucast_entry(struct rvu *rvu, u16 pcifunc,
 		*(u64 *)&action = npc_get_mcam_action(rvu, mcam,
 						      blkaddr, index);
 	} else {
-		*(u64 *)&action = 0x00;
 		action.op = NIX_RX_ACTIONOP_UCAST;
 		action.pf_func = pcifunc;
 	}
@@ -657,7 +656,7 @@ void rvu_npc_install_promisc_entry(struct rvu *rvu, u16 pcifunc,
 	struct npc_mcam *mcam = &rvu->hw->mcam;
 	struct rvu_hwinfo *hw = rvu->hw;
 	int blkaddr, ucast_idx, index;
-	struct nix_rx_action action;
+	struct nix_rx_action action = { 0 };
 	u64 relaxed_mask;
 
 	if (!hw->cap.nix_rx_multicast && is_cgx_vf(rvu, pcifunc))
@@ -685,14 +684,14 @@ void rvu_npc_install_promisc_entry(struct rvu *rvu, u16 pcifunc,
 						      blkaddr, ucast_idx);
 
 	if (action.op != NIX_RX_ACTIONOP_RSS) {
-		*(u64 *)&action = 0x00;
+		*(u64 *)&action = 0;
 		action.op = NIX_RX_ACTIONOP_UCAST;
 	}
 
 	/* RX_ACTION set to MCAST for CGX PF's */
 	if (hw->cap.nix_rx_multicast && pfvf->use_mce_list &&
 	    is_pf_cgxmapped(rvu, rvu_get_pf(pcifunc))) {
-		*(u64 *)&action = 0x00;
+		*(u64 *)&action = 0;
 		action.op = NIX_RX_ACTIONOP_MCAST;
 		pfvf = rvu_get_pfvf(rvu, pcifunc & ~RVU_PFVF_FUNC_MASK);
 		action.index = pfvf->promisc_mce_idx;
@@ -832,7 +831,7 @@ void rvu_npc_install_allmulti_entry(struct rvu *rvu, u16 pcifunc, int nixlf,
 	struct rvu_hwinfo *hw = rvu->hw;
 	int blkaddr, ucast_idx, index;
 	u8 mac_addr[ETH_ALEN] = { 0 };
-	struct nix_rx_action action;
+	struct nix_rx_action action = { 0 };
 	struct rvu_pfvf *pfvf;
 	u16 vf_func;
 
@@ -861,14 +860,14 @@ void rvu_npc_install_allmulti_entry(struct rvu *rvu, u16 pcifunc, int nixlf,
 							blkaddr, ucast_idx);
 
 	if (action.op != NIX_RX_ACTIONOP_RSS) {
-		*(u64 *)&action = 0x00;
+		*(u64 *)&action = 0;
 		action.op = NIX_RX_ACTIONOP_UCAST;
 		action.pf_func = pcifunc;
 	}
 
 	/* RX_ACTION set to MCAST for CGX PF's */
 	if (hw->cap.nix_rx_multicast && pfvf->use_mce_list) {
-		*(u64 *)&action = 0x00;
+		*(u64 *)&action = 0;
 		action.op = NIX_RX_ACTIONOP_MCAST;
 		action.index = pfvf->mcast_mce_idx;
 	}
-- 
2.26.3

