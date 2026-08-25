Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD823202C48
	for <llvm@lists.linux.dev>; Tue, 25 Aug 2026 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787617137; cv=none; b=cZaiOFJ3YLIkGKkPGvSM2lY3Zz4IDC/H/eMAJAsL2kTCKIiwK/9aSbKPChsyI+H58cNqbmaxd+vlWiThPpIofsCTsko/iEevKPzBecQYsieJX/jQDW7Lbxu9fSW/soD6ppnH6rxu95TCOu3vaMhVSk+mX4259eEMGZzcYAQIW3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787617137; c=relaxed/simple;
	bh=xGgE8fRb2F6SeuN2setpjtGggTxd2X5TU4Mo5JMO92Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nt1eJDTp7IIzQbpurKrHVZ16uAtxpaDRAQj9ZBBMhKIvPnRUWs+13Edoy91kYMUY4sKUtyxXhSa2qT52WNkgxzYiqu2gOmtn/5tGhxY2AZ393gt4jZIZa4tgjRODCOW5CcHy6aZCXxBJRSWIx/K9ty5DtqMvWaOsWzRtrbM+OOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=YVWsqbYa; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="YVWsqbYa"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbeea240819so2454392a12.1
        for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787617134; x=1788221934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RarC5x4RvvpR7j/hUnvljw8BjrRQB7FIPxU5ozvxHYk=;
        b=YVWsqbYamb/MdXIevXx0u4VDryDOWtseDk8N0WDb07UWOGmKTEmv2TIzb/+Dxp+wJh
         C1D1MrTmQbtFOBF8LCl5mDGxYL4n3biTnmvNb/bjbBwzU8+Mhygyz12prU4udpguS/9r
         u7Lnl6A/C82UYVA7wpzb9s5ECoVgHpzvp/l+PSA6pfop88BB/1O8Ktd67oJLcVMUy7oT
         qxchsc5EpQjB5qHQyefGt0NeOhdJcLoAPj/gwRd/LYbDG649kkAWFQL15MnLDxj242QE
         adAHI92eEuYdhJyGN2g5QinQxv8yFp1yFWNw+s5wZZiCLEds9foz1ZnlqmQ7ekz37mPg
         CsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787617134; x=1788221934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RarC5x4RvvpR7j/hUnvljw8BjrRQB7FIPxU5ozvxHYk=;
        b=Gk6+h2YEwQZknZghr9TPj3cHvf/uRujoPvk9mRofm3CpHuvKZpofP8j9er/IxPUcPd
         EbHWBB/hHUTINq9LBxFMo9HCZlSC4YwUfXJ7cVieEb7tNO9T3M6CUTkDiLMs3uzcaFMY
         bKg5RK2UYBA2XSeBcSyqhGMP8b+3dvmTv4F2+R575cxcQB4hmtUqWjT5IZvV1pC90XVh
         sjbpXJAKe+QGOKX6VvwCFYQ+04TyeXgrvnU3biCHwt/CMUPFW+glqRH2uccx9aITXLye
         NllVFuH6HkbGjOkoCUu4BsLbuOmAIjj5ObzcvJlUUXniJGzZZt1wb8Poujueq7e0fn6x
         tuxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8yy5M1ZGw/yF4LLrsgRP0Rn2LGQgCQcO5N8xchUYjBxrKwLYj60OtDUMczkxMfBes6vSj@lists.linux.dev
X-Gm-Message-State: AFuF++ltcflQCwnp5EacNupCBpF2son3ouM6fc6iOlPq9uSlDSwuRmBq
	Uu10OrtOgfCQaLocqNnOLkoI31Px3N4cIMjGWEH73pCGjg69tt6k9MsTNvFEim2cpOo=
X-Gm-Gg: AR+sD109N5sJWpqm3JhJ7JyV5CRzl6NlIsSNNNLMrb+z/2KNEj0fl94MDxJ5FkD1fSV
	KabuB6m5dRPHuy6TAzShOQXV9juLROMIq74lye5Hef8dDiGThog28GYyl4CQ3MCxTzEPl+fCKHG
	gfe4wzGSjWTzgZKrLJno6s4wtD1EOE3AmZmKkQ/viY2qhQ/qlcShuFKPkVNZCIpIfhIYaLVe1l0
	o0I0jnNkUm1kM3NS3EGsZwsEeYMYpsN0IJFngCOprdVOka4YCd9abiz68Gz7g93x97WJLKyGd73
	+U5SWcAgpd5PbzNAjAVXNaLX4rqY+bfTPbWL99jVXWmLKJ9JdcuulM1WNR7StXyHigrsC/lCkZm
	WdoljwavC8uBraOonNDyjJ6mfSXJWSaQU5ePWIFI0gbOsJyAqz7n0tUqjdPNPRA/sacoeVNJVv3
	W6LqZnU0m3pytqBNwm9tKgT6xWvs0Ll+0h4WlacQ==
X-Received: by 2002:a17:90b:3902:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-395c333710emr50382365a91.3.1787617133932;
        Mon, 24 Aug 2026 17:18:53 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965547159asm31323a91.12.2026.08.24.17.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 17:18:53 -0700 (PDT)
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
	Colin Winegarden <colin.winegarden@broadcom.com>,
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>
Cc: horms@kernel.org,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH net v2] bnxt_en: Bound SW TPA IDs to prevent crashes
Date: Mon, 24 Aug 2026 17:18:40 -0700
Message-ID: <20260825001842.2501798-1-joe@dama.to>
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

Fix this by allocating rx_tpa with bp->max_tpa rounded up to the next
power of 2 (bp->max_tpa_roundup_size) entries and masking the FW TPA ID
with that size, so the wrapped ID can never index past the end of the
array.

Fixes: 54c28fab2fa5 ("bnxt_en: Set bp->max_tpa according to what the FW supports")
Reported-by: Raphael Cardoso Fernandes <raphaelcf@meta.com>
Suggested-by: Michael Chan <michael.chan@broadcom.com>
Cc: stable@vger.kernel.org
Signed-off-by: Joe Damato <joe@dama.to>
---
v2:
  - Followed Michael's suggestion on the v1 to increase the size of the tpa
    array so that wrapping indexes into the array is a simple mask.
  - Add Suggested-by because the approach was suggested by Micahel.
  - Add a Reported-by so that Raphael gets credit for reporting this bug.
  - Boot tested on a machine with a 57608 and the crash did not reproduce.

v1: https://lore.kernel.org/netdev/20260821233549.3134699-1-joe@dama.to/

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 25 ++++++++++++++---------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 9c2cc50276a5..ba710704b192 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -1517,14 +1517,16 @@ static int bnxt_discard_rx(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
 	return 0;
 }
 
-static u16 bnxt_alloc_agg_idx(struct bnxt_rx_ring_info *rxr, u16 agg_id)
+static u16 bnxt_alloc_agg_idx(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
+			      u16 agg_id)
 {
 	struct bnxt_tpa_idx_map *map = rxr->rx_tpa_idx_map;
-	u16 idx = agg_id & MAX_TPA_P5_MASK;
+	u16 idx = agg_id & (bp->max_tpa_roundup_size - 1);
 
 	if (test_bit(idx, map->agg_idx_bmap)) {
-		idx = find_first_zero_bit(map->agg_idx_bmap, MAX_TPA_P5);
-		if (idx >= MAX_TPA_P5)
+		idx = find_first_zero_bit(map->agg_idx_bmap,
+					  bp->max_tpa_roundup_size);
+		if (idx >= bp->max_tpa_roundup_size)
 			return INVALID_HW_RING_ID;
 	}
 	__set_bit(idx, map->agg_idx_bmap);
@@ -1589,7 +1591,7 @@ static void bnxt_tpa_start(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
 		agg_id = TPA_START_AGG_ID_P5(tpa_start);
-		agg_id = bnxt_alloc_agg_idx(rxr, agg_id);
+		agg_id = bnxt_alloc_agg_idx(bp, rxr, agg_id);
 		if (unlikely(agg_id == INVALID_HW_RING_ID)) {
 			netdev_warn(bp->dev, "Unable to allocate agg ID for ring %d, agg 0x%x\n",
 				    rxr->bnapi->index,
@@ -3587,7 +3589,7 @@ static void bnxt_free_one_tpa_info_data(struct bnxt *bp,
 {
 	int i;
 
-	for (i = 0; i < bp->max_tpa; i++) {
+	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 		struct bnxt_tpa_info *tpa_info = &rxr->rx_tpa[i];
 		u8 *data = tpa_info->data;
 
@@ -3784,7 +3786,7 @@ static void bnxt_free_one_tpa_info(struct bnxt *bp,
 	kfree(rxr->rx_tpa_idx_map);
 	rxr->rx_tpa_idx_map = NULL;
 	if (rxr->rx_tpa) {
-		for (i = 0; i < bp->max_tpa; i++) {
+		for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 			kfree(rxr->rx_tpa[i].agg_arr);
 			rxr->rx_tpa[i].agg_arr = NULL;
 		}
@@ -3810,13 +3812,14 @@ static int bnxt_alloc_one_tpa_info(struct bnxt *bp,
 	struct rx_agg_cmp *agg;
 	int i;
 
-	rxr->rx_tpa = kzalloc_objs(struct bnxt_tpa_info, bp->max_tpa);
+	rxr->rx_tpa = kzalloc_objs(struct bnxt_tpa_info,
+				   bp->max_tpa_roundup_size);
 	if (!rxr->rx_tpa)
 		return -ENOMEM;
 
 	if (!(bp->flags & BNXT_FLAG_CHIP_P5_PLUS))
 		return 0;
-	for (i = 0; i < bp->max_tpa; i++) {
+	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 		agg = kzalloc_objs(*agg, MAX_SKB_FRAGS);
 		if (!agg)
 			return -ENOMEM;
@@ -3843,6 +3846,8 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
 			bp->max_tpa = MAX_TPA_P5;
 	}
 
+	bp->max_tpa_roundup_size = roundup_pow_of_two(bp->max_tpa);
+
 	for (i = 0; i < bp->rx_nr_rings; i++) {
 		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
 
@@ -4554,7 +4559,7 @@ static int bnxt_alloc_one_tpa_info_data(struct bnxt *bp,
 	u8 *data;
 	int i;
 
-	for (i = 0; i < bp->max_tpa; i++) {
+	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 		data = __bnxt_alloc_rx_frag(bp, &mapping, rxr,
 					    GFP_KERNEL);
 		if (!data)
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index ab894f8addef..de46b42d7c98 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -789,7 +789,6 @@ struct nqe_cn {
 
 #define MAX_TPA		64
 #define MAX_TPA_P5	256
-#define MAX_TPA_P5_MASK	(MAX_TPA_P5 - 1)
 #define MAX_TPA_SEGS_P5	0x3f
 
 #if (BNXT_PAGE_SHIFT == 16)
@@ -2380,6 +2379,7 @@ struct bnxt {
 
 	u16			max_tpa_v2;
 	u16			max_tpa;
+	u16			max_tpa_roundup_size;
 	u32			rx_buf_size;
 	u32			rx_buf_use_size;	/* useable size */
 	u16			rx_offset;
-- 
2.53.0-Meta

