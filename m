Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567353;
	b=CBjAUCkmf27z6kjm4QEV+eozYduNd475U3bxX05RvLxMm29XYTxGHsImIgLnOgAlR+dc
	 X31OT9qSISACMLpKKaxnWLsEwiZZfsLwPdlat+tk7Rm61bp3aewqAzV4TP0/9yJyFFcsE
	 RB8zz7W4A6rEP2vOXXPJKzVBaClOOd+FkYwA3WFqAoKuKgI1aJ00WnZTcFZirfV24/9Wp
	 J8R3AztaPPWogeWNPhjY8LVXWlCeT2rGH+8IW5b7kr2+ROI4eALWYJhNS5bMN1+PeJjcR
	 /NHJrqdWW3BRwAWVRH5RHx8UKQCuDcBytOulG1CwSpDSkxwVpZalTR07REjcsnOT+Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
	b=i5ToNODvL+t1lZAoj5dy4BY1XNkPn52D9oE6evQZ+T3ebxoa99AF9gbniRPwu3JxUp5s
	 qX2lCdhgSS8eK756Zj387RAlFYD1zz2BP+e8xSEmZrIUdgoHSq+DaTBnvbcx/twZochpU
	 X7ZgFRFcA7aoGacWyleKGRGXf6gkdLY1O8ouJtcypnTQ9p4RkrsfUZ2Qxzed8/XU7rdWP
	 nwWRL3mK9J77Yu4RbWMbQvgk9Qi7yuUH0nUpDHuk0wmT+jgR9L9G6zxCy5aMYpd4cx4RY
	 ifWW8Ksvzavn0n4ItCLJ59mTqGeVvvPUOQOq8hctew+4ADuopukVuy5TvWrkSO+X41A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="dyeuF/Bv";
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38E8606A321
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A38E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dyeuF/Bv
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4ab90cdf747so7572335fac.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567351; x=1796172151; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=dyeuF/BvdQr37TQyXKMQsaZ0WwiDAqqqmRc9rGMuefWgqW2UlznTM7225cKPXMBFbD
         vBGySUQzf3q1mHkBBDFPtACa83C/jk+SmZM55ZZiRBgUju0jjDoNST+Ts5exqafNmr8K
         1ud0lWgSs+CQ8XdwbZ3oulgNBEdytzOw55sMAT+DKDp9NdLZIupuuyT/vhoXcwNPWbEH
         +98b/YNQ4WAvyEUDHdikdOUoBISJjfbITaSBFGuPl8jYg1ZB/beu+zb2F5uE21qQaKzg
         L4AH0AhaNZbt5hmEBaEm7Ujiur0w4yeHna1iwKgUlD+MQzAm/E/jmTz7xshXZcQ7H7Os
         bd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567351; x=1796172151;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2lsfathSyHFGuAbntm/acIKMsCKCUM9rvg/SL1p21o=;
        b=nfiQYuCJ7zEbVOozziRqbvtL9zD5WDy3acns8crJmhpOuSItXdrgn2cjfF+ZiIe0bN
         29A1ufgushJMKuiddOqLrGluIUCEvXVcwW2xPrrEX9CEwtvAHfVPv+zJGbl4G/Vi4Mm/
         d52ElmUhlFrc2gqm9vwBjaIrJzXC417VYQtQ/WFIsJrG0xrn/HmkuY0XvohSJOI2sZxe
         hi8sGRbnI10wD5g5GiwGDEOoCJenty5Ew/+p9pnysMwrijv8S+4wgVrQesrg3Mk0xxhi
         DJBJf/fAtGWMDaZZX/nLdZO9Sx2QshbVUdFSWXkigsZdvRtZHI1WURFiIUt/E0ABm75f
         iX4Q==
X-Forwarded-Encrypted: i=1; AL+hErEnxXcLOFTndePd22SU+s3pG1+sdNfsqjY1pOxUVtp9LT3ZVVZ8opOkEMBO9w7fecoAXBAW@lists.linux.dev
X-Gm-Message-State: APuU4Z9cY1VgmFu63D4BKVXkf93fCzjRxlsRc8fD5L/ViosgtYFvOSz+
	YbjYuRjRrrPFTQ0cK3J9OtkiW/11lCVbrMEKlYz85PSGvxsaev1CJ4nfBemDu1ewnBa9ZkD1814
	yOYRtsoTU5Q==
X-Received: from oihi10-n1.prod.google.com ([2002:a05:6808:e8ca:10b0:4e8:f869:7c03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f0f:b0:4f5:dc0d:e013
 with SMTP id 5614622812f47-579789cf52cmr15894415b6e.4.1795567351259; Tue, 24
 Nov 2026 16:42:31 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:27 -0800
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
Message-ID: <20261125004227.1007723-1-irogers@google.com>
Subject: [PATCH net v2] octeontx2-af: Fix uninitialized variables in MCS alloc handlers
From: Ian Rogers <irogers@google.com>
To: Sunil Goutham <sgoutham@marvell.com>, Ratheesh Kannoth <rkannoth@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(), switch (req->rule_type)
has no default case; an unrecognized rule_type in a PF/VF mailbox
request leaves 'offset' uninitialized when passed to
mcs_alloc_ctrlpktrule(), allocating rules from the wrong hardware
partition or failing spuriously.

In rvu_mbox_handler_mcs_alloc_resources(), 'rsrc_id' is left
uninitialized when !req->all and either req->rsrc_cnt == 0 or
req->rsrc_type is not one of the four handled types, evaluating
uninitialized stack memory at 'exit:'.

Return -EINVAL for unrecognized rule_type, unrecognized rsrc_type, and
zero rsrc_cnt when !req->all, and zero-initialize rsrc_id so Clang's
value-insensitive -Wconditional-uninitialized check sees no
uninitialized path across the rsrc_cnt loop.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.o with LLVM=1 W=1
(-Werror) and -Wconditional-uninitialized; not runtime-tested on
Marvell CN10K hardware.

Fixes: cfc14181d497 ("octeontx2-af: cn10k: mcs: Manage the MCS block hardware resources")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Unlock rvu->rsrc_lock and return -EINVAL directly on unrecognized
        req->rsrc_type instead of jumping to 'exit:' (which returns 0 over the
        mailbox), and do the same in rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule()
        (Sashiko AI review).
      - Drop the rsp->flow_ids/secy_ids/sc_ids ARRAY_SIZE() checks since
        rvu_alloc_rsrc() already bounds IDs to rsrc->max <= 128 and rejecting
        upfront altered partial-allocation behavior (Sashiko AI review).
    
    v1: https://lore.kernel.org/r/20261119170550.1517634-1-irogers@google.com

 .../net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
index cd9cca5a9cf5..92c987134436 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/mcs_rvu_if.c
@@ -682,12 +682,15 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 {
 	u16 pcifunc = req->hdr.pcifunc;
 	struct mcs_rsrc_map *map;
+	int rsrc_id = 0, i;
 	struct mcs *mcs;
-	int rsrc_id, i;
 
 	if (req->mcs_id >= rvu->mcs_blk_cnt)
 		return MCS_AF_ERR_INVALID_MCSID;
 
+	if (!req->all && !req->rsrc_cnt)
+		return -EINVAL;
+
 	mcs = mcs_get_pdata(req->mcs_id);
 
 	if (req->dir == MCS_RX)
@@ -744,6 +747,9 @@ int rvu_mbox_handler_mcs_alloc_resources(struct rvu *rvu,
 			rsp->rsrc_cnt++;
 		}
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsp->rsrc_type = req->rsrc_type;
@@ -793,6 +799,9 @@ int rvu_mbox_handler_mcs_alloc_ctrl_pkt_rule(struct rvu *rvu,
 	case MCS_CTRL_PKT_RULE_TYPE_MAC:
 		offset = MCS_CTRLPKT_MAC_EN_RULE_OFFSET;
 		break;
+	default:
+		mutex_unlock(&rvu->rsrc_lock);
+		return -EINVAL;
 	}
 
 	rsrc_id = mcs_alloc_ctrlpktrule(&map->ctrlpktrule, map->ctrlpktrule2pf_map, offset,
-- 
2.56.1.831.g720f3f5937-goog

