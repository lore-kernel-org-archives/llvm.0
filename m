Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9490433054
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787355359; cv=none; b=sjaG0i32H9N1iA66/tWNgP/KNfwTDBGiUmMI27kZODn4jRNtZIlaXUCC/Lg+h+Jao9ZaAEL2DSIY0EHlRDOpjtGgsMTSNGfvlX7cu+RibW66A3HALNbvs38fLBumQ8NGRyuiZTwl0agglux1qP2p4YFGTjsZe8kHfKKbSGGBMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787355359; c=relaxed/simple;
	bh=asd0oGe+4nzxMKLWV335XwiZaTgrY2kiFB5C2LrFQuE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJuCJtXjBTJW60gKTXEbxepf767CwPxS55bdKzGgdTL7nTbCaiRNX3Q4sFj4vMfoPpY8pi8cwdDuIlk4Ush3j1IwTWKjF1nx+vGZ8VfckpnPEodVkeZyNRWFiCfeF5ndGGoW9XEvVaT0TBDeJlAS/IQoQobBj/MLRE5vcUzptMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=SG6NcUV1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="SG6NcUV1"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8487214ad2bso2031228b3a.1
        for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787355355; x=1787960155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I2COMEyacsFGYmJ08hxh+ysp07Ov7pN7X0HAy5vh28A=;
        b=SG6NcUV1wZ8xDZXAundgBgrQUXQBxB6NZ8F5CpGvSAgAYAOcflsBgenqaIrhq8pg/h
         KJFp4FOpuTEm1Y9ggfajvbK75svV/UNVBSAcPqwFFGxyCXIBeUMA7Gc3UUHFTDYXZBUS
         6wNH2siblAckRh/iIDrnMhtLb0+vBfL4MsyQRDHmuaV67tSIbo4cge1JpZjICNeb1kI7
         No1Iver835qFTmQmJDzT1FZm/25gXPthrxsqjQQ51sETOVzzfyK5j6P85N96jtKNydiD
         R60mlKVPWH8CLpup9R+oCmNtxRyJc4BjlfOpCenTRqglC0siANKPgo2iTON3cAPGn9Z5
         DksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787355355; x=1787960155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I2COMEyacsFGYmJ08hxh+ysp07Ov7pN7X0HAy5vh28A=;
        b=Lds0jCYPNGcQN3Ln5QMG8RDFxrE+4Tr424QDVe38Kd+2xnJCb/JCW50bQB5RsLy5Tl
         zhHFZCsDurnpcLtBcsIebEFHbCEcqbNvdX7SHEfmJV9ZKnx3SZ8Lp5O+7l/ELfSnoxRY
         rGhe3rhqI6YbmrGTpaXkn33qKaFRHp3fUNnpsS4roq87/tNs0N1MZinIqxYNfsEWTaPN
         ekt2Lzadda78OtWbPpiXAkyvRzA67GW3jkc+LQ+cv6DaNufvaEVw1TG8OR7N+Ri23u10
         VtOD5IxLfNziRjT+jCFVOhPCyLg1JNVrrquT+u1SoyI/ufeFABEwrFZvORwVrUmKTdXQ
         gtgg==
X-Forwarded-Encrypted: i=1; AHgh+RqWhc0x5HzoT7ZHqDsSgjSG483AIhgi+pcrJ6dgf6vj6uZtrq0ZRts16cIVsKtcbsIKzs7m@lists.linux.dev
X-Gm-Message-State: AFuF++n4FmDV3WjOaMmm3SY1UZOcnT4CRz9OU0Hw1pVRqKhQQprpwaAS
	1txl1Ggg+D+JD80z6MgQ99O330Db8KsS/HHwxsB36cSNdU/8EZSCBI+XZ+P6jSUKWHs=
X-Gm-Gg: AR+sD13pq6Mt5YdrBE1jZjQiMO5C+Hr/mNnHCaOF6ALNH7+4j/fbbxxqFSGaED3/ZWU
	B3DBoSDcxMf6F8y5S6bpreY/2wx2MkhtV3UVOC6WId8PhXIclBp0w/67tW09hIcxqLeUz8a6+4v
	mgngZP2fKduKrmtNiNhrInHm0BB3JbPgRXsWqMe2tQkMMeDeifEoHbp32HVaiAPBgVbXho/Y4K7
	qA4QZOJ05uXt1hTb6d62qG3HRkYb/qYGVsQ06mlfgdg5WIkXv1M/UvSSHe6jlTnxP3RsUiAuSwX
	q8L8VhCCBO2r7hmLf5mD0FxTt+qz40lG6WJCnfz9cGeNfsNIjXsr95FzECajib3hQFgz5wNHFsY
	Jv31hk48zmUJ+opMZAmW5HNa0iyqLilaV5ryZGOMJ964QbUEoppv5tcmnNIx/DFE3OAOaK7uxP+
	CujAd3o7NnwxPIEI7sSsyeTJXbcBeB3siUxKQO/jTGcg==
X-Received: by 2002:a05:6a00:a225:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-851f9a8e890mr12978803b3a.1.1787355355122;
        Fri, 21 Aug 2026 16:35:55 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:58::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15523b579sm3637919a12.3.2026.08.21.16.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 16:35:54 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Colin Winegarden <colin.winegarden@broadcom.com>
Cc: horms@kernel.org,
	rukhsana.ansari@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>,
	stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH net] bnxt_en: Bound SW TPA IDs to prevent crashes
Date: Fri, 21 Aug 2026 16:35:48 -0700
Message-ID: <20260821233549.3134699-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TPA IDs are generated by FW and can be up to 1024. bnxt_alloc_agg_idx is
intended to wrap the FW ID to a value in the range of [0, 255] and
generate a mapping between FW IDs and the wrapped software ID.

On a 57608 with firmware version 233, the firmware advertises 32
concurrent TPAs. As of the commit under fixes, bp->max_tpa on this NIC
is set to 32.

If the software ID from bnxt_alloc_agg_idx is above 31, this results in
an invalid address being loaded on this line:

  tpa_info = &rxr->rx_tpa[agg_id];

because rx_tpa is allocated with only bp->max_tpa (32) entries. Writes
to tpa_info later in the code are out of bounds.

This bug results in a crash at boot:

Oops: general protection fault, kernel NULL pointer dereference 0x8: 0000 [#1] SMP NOPTI
RIP: 0010:bnxt_rx_pkt+0xc0/0x1560
RSP: 0018:ffffc900009b8c78 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000048 RCX: 0000000206682516
RDX: ffffc900009b8db4 RSI: 0000000000000000 RDI: 01ffffff038fe1c0
RBP: ffffc9006e687480 R08: ffffc9006e687000 R09: 0000000000003048
R10: 0000000000000480 R11: ffff8881c6083900 R12: 0000000006682516
R13: ffff8881c6095400 R14: 0000000000000016 R15: ffff8881c6b66680
FS:  0000000000000000(0000) GS:ffff88fef3c77000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc8bda40584 CR3: 000000807c812001 CR4: 0000000008772ef0
PKRU: 55555554
Call Trace:
 <IRQ>
 ? __netif_receive_skb_list_core+0x1ca/0x250
 __bnxt_poll_work+0x152/0x280
 bnxt_poll_p5+0x1cd/0x480
 __napi_poll+0x30/0x180
 net_rx_action+0x20b/0x3b0
 ? note_gp_changes+0x53/0xe0
 ? tick_setup_sched_timer+0x180/0x180
 ? __napi_schedule+0x9a/0xb0
 ? bnxt_msix+0x24/0x30
 handle_softirqs+0xdd/0x2c0
 __irq_exit_rcu.llvm.3171231171502365008+0x47/0xf0
 common_interrupt+0x85/0x90
 </IRQ>
 <TASK>
 asm_common_interrupt+0x22/0x40

This stack trace is from a crash triggered when an out of bounds rx_tpa
is dereferenced. The invalid write mentioned above is silent in this
particular crash.

Fix this by adjusting bnxt_alloc_agg_idx so that any SW index greater
than or equal to bp->max_tpa goes through the collision logic and picks
the first available bit. Adjust the collision logic to only provide bits
within the range of [0, bp->max_tpa).

Fixes: 54c28fab2fa5 ("bnxt_en: Set bp->max_tpa according to what the FW supports")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d3cb25abb632..f348fb93047d 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -1517,14 +1517,15 @@ static int bnxt_discard_rx(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 	return 0;
 }
 
-static u16 bnxt_alloc_agg_idx(struct bnxt_rx_ring_info *rxr, u16 agg_id)
+static u16 bnxt_alloc_agg_idx(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
+			      u16 agg_id)
 {
 	struct bnxt_tpa_idx_map *map = rxr->rx_tpa_idx_map;
 	u16 idx = agg_id & MAX_TPA_P5_MASK;
 
-	if (test_bit(idx, map->agg_idx_bmap)) {
-		idx = find_first_zero_bit(map->agg_idx_bmap, MAX_TPA_P5);
-		if (idx >= MAX_TPA_P5)
+	if (idx >= bp->max_tpa || test_bit(idx, map->agg_idx_bmap)) {
+		idx = find_first_zero_bit(map->agg_idx_bmap, bp->max_tpa);
+		if (idx >= bp->max_tpa)
 			return INVALID_HW_RING_ID;
 	}
 	__set_bit(idx, map->agg_idx_bmap);
@@ -1589,7 +1590,7 @@ static void bnxt_tpa_start(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
 		agg_id = TPA_START_AGG_ID_P5(tpa_start);
-		agg_id = bnxt_alloc_agg_idx(rxr, agg_id);
+		agg_id = bnxt_alloc_agg_idx(bp, rxr, agg_id);
 		if (unlikely(agg_id == INVALID_HW_RING_ID)) {
 			netdev_warn(bp->dev, "Unable to allocate agg ID for ring %d, agg 0x%x\n",
 				    rxr->bnapi->index,

base-commit: 4e15e89faac9f308baeb01f46c13a051814d2449
-- 
2.53.0-Meta

