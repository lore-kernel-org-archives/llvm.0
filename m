Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107956;
	b=VKHmxnSSJVv6Nd/yTXJl9LgTjvUNThkY+De4VXea0KEGf03EGKwIyZY/X2Dmus/rxmuN
	 NAIRXuZX98sZEmJxM0gOWz5/T2cC+YWnFDROt6ApdBeR2qBntCbeC0xR87QHHEsOALc1W
	 xEnPQcNifj9QA20ePPjznVzfPVEN8d7dsHvlC9nEGf+oEk4x9yTxQeBaDvQiixhSeKXol
	 CxKxQYcj8nLs6ami3RGs9x2/9GgJT4CYg27DrhqSDbaXXW8NbvdFzcNaOD8V1Rw8TDfIR
	 r2SQpgxlSblJsUDzYvVpLQpa05XxtuVN4f1xWtj5dPnmhqK+HtFJ36fYb8sB4RlVjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
	b=PScpai02N7X9zdVlsEdiQsGJR9rZRf0wGG/BNPo/eafkcb7fLmtLWz8dj74Jvau7HuLi
	 ODV8Y/25Sth6qqEBPjh5cR9o64YbUpXWX9jFE7zdW1PiEkTMq1lGqbCq4iDK4nXczLcGJ
	 7o6QDFJS6d4yw24ZmgtPUF8kDY2HiMDaiT2GvXTRvGVPfumUpMxKuc9z3EBLr4qNKG81v
	 vdPxXtRmCIslyfFaZD50TpZiIg7M/+rSHOYi/8r6VZ7HvvYly+6iAThIpXzTedComcExI
	 UPTt95CVmh5no/zwl94T+Ck3fORVtNOI67zmmFosbd0wOKwVFc/AOwDpDWyVjeM4FrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IadcMKvH;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6A606A32A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IadcMKvH
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f8281066c4so28892b6e.2
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107954; x=1795712754; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
        b=IadcMKvHOy7McQCccI0Y51W3nO94qqIYXkvWY2DubJpfPoTX7lIC8sohJlkKchR6Ux
         RAPy6eLmAKy1Gie9iyNy1WaxrSp8Re8mZQ1muk0FwgdRTdyY4qZJjyCwfzUqpg+GCTsq
         V1P0WvF3cRXD0Cb/eDNSKAP9UEmX5SpNAAmz3UsMUl49jxZOCBvLvp+WpHLkyxj7I/6Y
         26csuWkqC2gdsv9jg25QGFErAoEQEXLDCpL+y0OAZBa2ENVq1ILz6faFxzIXxWsoIzDq
         8GAeRPFbYr/O1qJemm0cg9GOcUYYhcoj67qds33BUBv5YiWaN3CedT1QFrBJ1Y720Eyk
         QC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107954; x=1795712754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4oeUJ9srrE5JKAw6tZtuVueeWimXIWToAHVhV7wu2E=;
        b=qfbmQm3XOSVkfKrS38CsEXznlKDpV1MzfMpeTju5RzwZaAQBBEBlhib4H4syR19fP0
         H/+cMqzybPmlurVWJn40ah+EMpmmR6iScsrqF1Kv5fMagRbhnr9Jvt+KJJBKFYMIcYpi
         b8wdZHwaCGryJyxj5Zx5pwoXlU3yvxdRRQ/pSHHNebk68ciorl1Bqy3B6Ndttu+PRlvQ
         +rwnqcjMGxPjrTDciQRwTkRVprthV56b27uSPVP8uF/qbdsxTP5uABfb7U8RsGsSmKML
         5APgkAJrctABaW2wCMDC6Yx1WB/HBrpMYK/q0bNn4/w3B983zh89iH/sjfckvfFvTbxI
         4N2A==
X-Forwarded-Encrypted: i=1; AL+hErGUSXaQPeqk+/d3VakKqhce+o3vcrxsrNwCFgk5Bw+g8Y40Bmo+FjG5gPKVdlV6kYpx39qf@lists.linux.dev
X-Gm-Message-State: APuU4Z86mbIGZXt9IfZQAE64jn68ziftSLcMaabPf5JTZd0FLnyVyvmS
	ouxQ+Y/NMsFDlHoornWozzb1W6xZENJGcVMM3o24UZ2FWqj3Lpz4rDfT+414PrMctkNVjTzATLV
	/7NEjGtBFgQ==
X-Received: from iodz8.prod.google.com ([2002:a05:6602:6f48:b0:9c7:a5de:745e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:50a3:b0:55c:888:2a15
 with SMTP id 5614622812f47-57a0c9c219amr482948b6e.53.1795107953923; Thu, 19
 Nov 2026 09:05:53 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:50 -0800
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
Message-ID: <20261119170550.1517634-1-irogers@google.com>
Subject: [PATCH net] octeontx2-af: Fix uninitialized variables and bounds in
 MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), switch (req->rule_type) has
no default case; an unrecognized rule_type in a PF/VF mailbox request
leaves 'offset' uninitialized when passed to mcs_alloc_ctrlpktrule(),
allocating rules from the wrong hardware partition or failing spuriously.

In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left uninitialized
when !req->all and either req->rsrc_cnt == 0 or req->rsrc_type is not one
of the four handled types. Moreover, req->rsrc_cnt (u8, 0..255) is not
checked against the 128-element rsp->flow_ids, rsp->secy_ids, and
rsp->sc_ids response arrays before writing into them.

Reject invalid rule_type, unrecognized rsrc_type, zero rsrc_cnt when
!req->all, and rsrc_cnt values exceeding the corresponding response array
bounds.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wconditional-uninitialized; not tested on Marvell CN10K hardware.

Fixes: cfc14181d497 ("octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../ethernet/marvell/octeontx2/af/mcs_rvu_if.c   | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index cd9cca5a9cf5..54c1d9809ae6 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	struct mcs_rsrc_map *map;
+	int rsrc_id = -EINVAL, i;
 	struct mcs *mcs;
-	int rsrc_id, i;
 
 	if (req->mcs_id >= rvu->mcs_blk_cnt)
 		return MCS_AF_ERR_INVALID_MCSID;
 
+	if (!req->all && !req->rsrc_cnt)
+		return -EINVAL;
+
 	mcs = mcs_get_pdata(req->mcs_id);
 
 	if (req->dir == MCS_RX)
@@ -709,6 +712,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 
 	switch (req->rsrc_type) {
 	case MCS_RSRC_TYPE_FLOWID:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->flow_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->flow_ids, map->flowid2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -718,6 +723,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 		}
 		break;
 	case MCS_RSRC_TYPE_SECY:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->secy_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->secy, map->secy2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -727,6 +734,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 		}
 		break;
 	case MCS_RSRC_TYPE_SC:
+		if (req->rsrc_cnt > ARRAY_SIZE(rsp->sc_ids))
+			goto exit;
 		for (i = 0; i < req->rsrc_cnt; i++) {
 			rsrc_id = mcs_alloc_rsrc(&map->sc, map->sc2pf_map, pcifunc);
 			if (rsrc_id < 0)
@@ -744,6 +753,8 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 			rsp->rsrc_cnt++;
 		}
 		break;
+	default:
+		goto exit;
 	}
 
 	rsp->rsrc_type = req->rsrc_type;
@@ -793,6 +804,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
 	case MCS_CTRL_PKT_RULE_TYPE_MAC:
 		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
 		break;
+	default:
+		rsrc_id = -EINVAL;
+		goto exit;
 	}
 
 	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
-- 
2.56.1.708.g77570a6a1d-goog

