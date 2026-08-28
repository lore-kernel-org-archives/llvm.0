Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A5395D8E
	for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944174; cv=none; b=YoSfk0QZOGNHJuM08HmD+FqZOf8GYjXME5BNua2uNLG07B6WOfXZ1gOqFlvSRi8np9WI3C6TTVKj3ll5Wd28bQLBp4VW0tPbZXXw9o3H0ke43WLk+xq2zpwPT366n4glT9i4/Dr4MJ42dzngB80aMrsYoh7Qgfe+i0JpAM6pNHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944174; c=relaxed/simple;
	bh=DHabpYVWMUcN0lqRBbQnflmxJiSHhXw8v4pgMuAsD4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OTI9+KWAbKqxl9CIupEplRl9mjj7CNv/uMFblWzilBbOCmPrNozaguDzLIVhz6VreE5n8dgFCNFBgDoU34RFeBJ47uTaMFujIDerSKAaKgItzfZB4LKMxhxBaOxMEAc7NoaciYVrW/Zg+Af5U2MVHvAP7SJo7LjEV5PDpOUuJkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=v1iH3+wH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="v1iH3+wH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1722946a91.1
        for <llvm@lists.linux.dev>; Fri, 28 Aug 2026 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1787944171; x=1788548971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/lEFlCrK4GzQ7/ozFU2BwCF0kJaOjHy8A8aVuPPG8g=;
        b=v1iH3+wHFuwe+B7hEL4GyBvq/iDiESATAxslmLz3vzpqWyfrsbXGDn+R0CJGDMq0AO
         +8Hb/thSHbKurytr8sEaoqj/+VWTNpIKepdCq+wuHX3fyKPSJK0H1V1pWGaWkjRqWMQr
         JJeMMMGLaH1tyjsxugc082w9xw6P8pdV/NsNoRLoyUY1wMicYt4gzjIYeC81W2/NJoJN
         uB4Jz1LPE2Ncl4CEKpaAXNoEe8lKBZOHdrlt9PXc6c5CS0L9m9aB9QB5v80wyYAoRuKF
         aBygs1c0pXFMh8iD5MXYWctFeodA5OJh+rEJDGcyjlrDnUbiA2S7nxDAAh05jXbnTS9h
         uL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787944171; x=1788548971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/lEFlCrK4GzQ7/ozFU2BwCF0kJaOjHy8A8aVuPPG8g=;
        b=d6/1A4UAzom6dVFnE6NvkJ+9Zrhc+ihNYG0sHGX5W2IKkbFBqUIuQPEgx20pgJPnth
         s+8f+NBV+np5QMKnAMNW8IgymluvdgcRsfyBfaQoW8d7ap9aEUInnkXxQKt8A3RGzxmY
         +MfEBnIqQLMzvK40xs1o74ZZo3854cTNjDR4AklcjAp1k6U66uLxRTgs1dctWzo9nbze
         ifp3KA0DCNVd93e7toB5pBt/I7a2XfcHyMdNMTyrYjtEX/wZH+gLzQYhXw+9X7VGEahD
         awrxxAdnLFPyDVrMfybrxEz7FhIb8KdsxGW/8y5MUNZF0YbzWbKRw9LZEelIRRMjyjmm
         twMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJT5kjBX4RJCUtzkbYpniF71Od2vJZuza4x8cMYpaPsolevwpks+dszV9jBaE6Caq2DMv7@lists.linux.dev
X-Gm-Message-State: AFuF++m+HPGixmejk+i0G28jpCtcbVR/iHxdvfUrueDc0IGGMGVrWdeS
	Hc5QPLIzdhhaRYzxGUqsIbzenOY4gAeUo3bQQ68QZXU0V5pg9uvK0Nn65j1w8QZbjyg=
X-Gm-Gg: AYBFou05NfDRw0nO2Ojw6Noc/8+ZMTj5LuzxyDcps4gTHJlS9/OaB1ExTNwyqkI1xE5
	jf2vY8mWOqobAqnO2I8FJGD5KkHUMGJEZcDt83agJmBCjdWX1DXH04TiO84fXWkgFVwMIi/HMQL
	zrpArxgcXVFrfBMIr3/J+Q16x+t1nsvbtHHnm9thJ38Q7Ye1/8BhMkki5+1TJAnHoXFkdLTycpJ
	zadj/RaLE98gU6JV84wDl44moOWv0EdxQDmj3lPcW1Z2GGpFb4FLwH7tkYQNhRBosR/6Qhmoq3q
	pyEvxSurfa2BfolpR+WE9+YB3uB/3PpuFObQutOnp8f3BbQF8vTmtjSmaleIkUpSv5gaCvYYWW6
	ypf/3LezIr6oJJVzE3+tThww20sf4GzpCKGNNzJX25tSMxNOkWd8CNW8RZskGQjfhCnf3jZownv
	hyWePY50ejGm1ktEc70Zxm3XeXeuT++nQhNXZdLWt1y7flF2GuKU18
X-Received: by 2002:a17:90a:c17:b0:398:a2ed:7b5c with SMTP id 98e67ed59e1d1-398a2ed7e86mr764024a91.24.1787944171359;
        Fri, 28 Aug 2026 12:09:31 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm3649871a91.0.2026.08.28.12.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:09:30 -0700 (PDT)
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
	Rukhsana Ansari <rukhsana.ansari@broadcom.com>
Cc: horms@kernel.org,
	colin.winegarden@broadcom.com,
	linux-kernel@vger.kernel.org,
	raphaelcf@meta.com,
	Joe Damato <joe@dama.to>,
	stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH net v4] bnxt_en: Bound SW TPA IDs to prevent crashes
Date: Fri, 28 Aug 2026 12:08:59 -0700
Message-ID: <20260828190900.1767611-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TPA IDs are generated by FW and can be up to 1024. bnxt_alloc_agg_idx is
intended to wrap the FW ID down to a software ID which is used to index
rxr->rx_tpa, and to generate a mapping between FW IDs and the wrapped
software ID.

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
v4:
  - Moved bp->max_tpa_roundup_size init out of the early return path and
    documented that TPA is unsupported there, as suggested by Michael.

v3: https://lore.kernel.org/netdev/20260827185700.2157164-1-joe@dama.to/
  - Addressed an issue Sashiko pointed out, where max_tpa_roundup_size may be
    left unset if bnxt_alloc_tpa_info returns early, which would lead to out
    of bounds access.
  - The other pre-existing issues Sashiko pointed out are unrelated to this
    patch and would need different Fixes tags, so they are better served with
    separate patches in the future.

v2: https://lore.kernel.org/netdev/20260825001842.2501798-1-joe@dama.to/
  - Followed Michael's suggestion on the v1 to increase the size of the tpa
    array so that wrapping indexes into the array is a simple mask.
  - Add Suggested-by because the approach was suggested by Michael.
  - Add a Reported-by so that Raphael gets credit for reporting this bug.
  - Boot tested on a machine with a 57608 and the crash did not reproduce.

v1: https://lore.kernel.org/netdev/20260821233549.3134699-1-joe@dama.to/

 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 28 +++++++++++++++--------
 drivers/net/ethernet/broadcom/bnxt/bnxt.h |  2 +-
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d59bcca73a2b..bee54cc86996 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -1514,14 +1514,16 @@ static int bnxt_discard_rx(struct bnxt *bp, struct bnxt_cp_ring_info *cpr,
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
@@ -1586,7 +1588,7 @@ static void bnxt_tpa_start(struct bnxt *bp, struct bnxt_rx_ring_info *rxr,
 
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
 		agg_id = TPA_START_AGG_ID_P5(tpa_start);
-		agg_id = bnxt_alloc_agg_idx(rxr, agg_id);
+		agg_id = bnxt_alloc_agg_idx(bp, rxr, agg_id);
 		if (unlikely(agg_id == INVALID_HW_RING_ID)) {
 			netdev_warn(bp->dev, "Unable to allocate agg ID for ring %d, agg 0x%x\n",
 				    rxr->bnapi->index,
@@ -3584,7 +3586,7 @@ static void bnxt_free_one_tpa_info_data(struct bnxt *bp,
 {
 	int i;
 
-	for (i = 0; i < bp->max_tpa; i++) {
+	for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 		struct bnxt_tpa_info *tpa_info = &rxr->rx_tpa[i];
 		u8 *data = tpa_info->data;
 
@@ -3781,7 +3783,7 @@ static void bnxt_free_one_tpa_info(struct bnxt *bp,
 	kfree(rxr->rx_tpa_idx_map);
 	rxr->rx_tpa_idx_map = NULL;
 	if (rxr->rx_tpa) {
-		for (i = 0; i < bp->max_tpa; i++) {
+		for (i = 0; i < bp->max_tpa_roundup_size; i++) {
 			kfree(rxr->rx_tpa[i].agg_arr);
 			rxr->rx_tpa[i].agg_arr = NULL;
 		}
@@ -3807,13 +3809,14 @@ static int bnxt_alloc_one_tpa_info(struct bnxt *bp,
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
@@ -3832,6 +3835,10 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
 
 	bp->max_tpa = MAX_TPA;
 	if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
+		/* TPA is not supported at all, so there is nothing to
+		 * allocate. BNXT_SUPPORTS_TPA() is false in this case and
+		 * neither LRO nor HW GRO can be enabled.
+		 */
 		if (!bp->max_tpa_v2)
 			return 0;
 		bp->max_tpa = min_t(u16, bp->max_tpa_v2, MAX_TPA_P5);
@@ -3839,6 +3846,7 @@ static int bnxt_alloc_tpa_info(struct bnxt *bp)
 		if (bp->max_tpa <= 32 && BNXT_CHIP_P5(bp) && !BNXT_NPAR(bp))
 			bp->max_tpa = MAX_TPA_P5;
 	}
+	bp->max_tpa_roundup_size = roundup_pow_of_two(bp->max_tpa);
 
 	for (i = 0; i < bp->rx_nr_rings; i++) {
 		struct bnxt_rx_ring_info *rxr = &bp->rx_ring[i];
@@ -4551,7 +4559,7 @@ static int bnxt_alloc_one_tpa_info_data(struct bnxt *bp,
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

base-commit: e2a6641e3bfde58f2284f9859c2b0fdcc6d1c0da
-- 
2.53.0-Meta

