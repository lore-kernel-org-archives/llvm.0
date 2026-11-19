Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108072;
	b=FHzvWUh3eq9Gr2KGkanRW9XGa1vjIzmTJw06wY7eP+9OxIHDL8nJy+PcIcger7expson
	 Cxox8P7jjWprzWikmOGuyHLsdz8XCflS1hn4oqbdtXR8JSWERAq8OymJtPTYtLliiSBNF
	 8Z6bK26DbGdnMgRID5uCv/gZ0ie6/+o3mo1I1zbA1tgK8pbPziRyE0y4IvVQrjvNTuV/0
	 hF2AIpI4Qx4wuHrmEJeOFyIRLYl96sD5VfnTcTq43zZ1OjGA1u5kO8hsXfdE1+D9oWG0+
	 envcOVt2EI414v5ijr/8WvwtMUAQUhkPI7sBTMUdTXas3GzqwpOpmlSVgUpWD9T1Yiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
	b=xLFVAQAWSoPTAjBPLDWW7h8lDYHWlHNwQv0c9tUA4pTyjpQ+ydQzSePhkOSmlSAgOI3T
	 lHAjLb/+mTCxld4I4+iLt3Hqq4zlayGHCma4DuIkwciUf7ZAh8tuq72ybBNrliTVuVLou
	 DtCwPi0FWAiulnRxSIOBceGJmFKJMdEwuf6VcSrdcRbINgtCuiwItRrlFlzMLttKdgQKJ
	 DTHbwub6/mjPePz90w2PfLSLaF8+okACUOETb4HeEJW316ylGnPc4zfjFSFiaZ1VMgf4Z
	 uzDm+tV2D6jxREIZNJ9rUJLsp6v/x8+gEGIu9RovkDt2eXtJqvYQpssmbICr65LPR4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TCRh1ATI;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3B606A33A
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB3B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TCRh1ATI
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b53bfc9534so896348c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108071; x=1795712871; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
        b=TCRh1ATIc6J15j7ZjbVSz+LO/s0iogTmsk0o7Kr79+rnUnQuC/xKGhjy10VBgwsvyF
         xrMQYnVZHKJltSQFFxyTDr9ZxWnxOtPt5r7GmD80JyBNRWYmKJ22AEP3JYG2zpw/nx9b
         Hc9GGHeIRLEV+ty+S7udJXfsFB4qdHDzoqS0ZHR2nTn4Xo63J5XKr4/3x4i5HV1GO+hG
         i/jDlmT40oRvu/hpOZiEfMNhzsoAsn/9jHHdh4GpIxdgEZR7k6v+kscqMcUyNM8pvnJa
         YPXEqWGfSEwr5FTGuxZOVsOakau8xlzquBK3Bu0W3O2BETmofgJNP02jAR44kfxV+veI
         XIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108071; x=1795712871;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVZQarvm50DIsaAompovSYSGFvXZlkJfKw1ZreJ7g0U=;
        b=mG5ZCWQBScEsfcY/xjyj4GYeTGp3pRUTttvFF3R0AMmMczRAKAbAe/nTPsSsYOxvkw
         v3iXcv5mx0RcdlxfE6BNfu4wkmAPmOQ+dZaP9ua9d3Cul7711+njmvQpT6c/jbJ7r5iK
         FFePpTylZzrk8n3RGP/E6KTxmHsAXv6xY+v5LhRNphtVWVk2sraLmgm4M60Y2WsAyPvM
         CT2A2b7MVAMMZWRL3q+PZ5USsTghMLCwBZOGdEweG/j/TjVhJzYuz5Flwqc2kDFAVE3X
         VieLtQZwxk366M7K5MVq3vipHNluKI/NjLHGvGoHnEtYb14cwB6sizLXcfbhwCedu4SO
         TvQg==
X-Forwarded-Encrypted: i=1; AL+hErEHikxmoSqItcRY92W6cHHzcmqZfapYQUc28EaVvcLASL/x0wqv6Kx8ZIBW6aerSfbdCV95@lists.linux.dev
X-Gm-Message-State: APuU4Z9n817fLfK8W+0HNENv3W1AAOnugOX0KYfSTccGOVgXyjQU13kK
	lDC1D1hczomW1M9pc0hjJgzz9Ri3fz2FKDnS5lTfhcKrcFqMbd4Hrq/AuklH1LfhWW3ZhwELPah
	i/9+VaqxYBQ==
X-Received: from dleh8.prod.google.com ([2002:a05:701b:4348:b0:1b0:166c:6a91])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:428a:10b0:190:da74:2c89
 with SMTP id a92af1059eb24-1b5568a287cmr273840c88.21.1795108071104; Thu, 19
 Nov 2026 09:07:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:47 -0800
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
Message-ID: <20261119170747.1525767-1-irogers@google.com>
Subject: [PATCH] firewire: core: widen fw_node max_depth and max_hops to u8
From: Ian Rogers <irogers@google.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In bm_work(), FireWire bus management checks
'root_node->max_hops < ARRAY_SIZE(gap_count_table)' (16) so that IEEE 1394
topologies with 16 or more hops (up to 63 nodes / 62 hops per IEEE 1394a)
fall back to expected_gap_count = 63. However, struct fw_node declares
max_depth and max_hops as 4-bit unsigned bitfields (0..15). On topologies
with >= 16 hops, update_hop_count() truncates max_depth and max_hops
modulo 16 (for example 19 hops wraps to 3), causing bm_work() to program a
too-small gap count (8 instead of 63) and trigger arbitration failures.

Change max_depth and max_hops from 4-bit bitfields to u8. Because both
fields occupy existing alignment padding ahead of struct kref in
struct fw_node, sizeof(struct fw_node) is unchanged.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wtautological-value-range-compare enabled; fix and changelog drafted with
an AI coding assistant. Verified with an ASan/UBSan C struct-size and
19-hop topology test, and build-tested under LLVM=1 W=1 (-Werror) and
-Wtautological-value-range-compare; not tested on physical IEEE 1394
hardware.

Fixes: 83db801ce8c6 ("firewire: Implement gap count optimization.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firewire/core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core.h b/drivers/firewire/core.h
index 8b49d7480c37..ca2150f75174 100644
--- a/drivers/firewire/core.h
+++ b/drivers/firewire/core.h
@@ -207,8 +207,8 @@ struct fw_node {
 	u8 phy_speed:2;	/* As in the self ID packet. */
 	u8 max_speed:2;	/* Minimum of all phy-speeds on the path from the
 			 * local node to this node. */
-	u8 max_depth:4;	/* Maximum depth to any leaf node */
-	u8 max_hops:4;	/* Max hops in this sub tree */
+	u8 max_depth;	/* Maximum depth to any leaf node */
+	u8 max_hops;	/* Max hops in this sub tree */
 
 	struct kref kref;
 
-- 
2.56.1.708.g77570a6a1d-goog

