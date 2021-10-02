Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA43A3FDE
	for <llvm@lists.linux.dev>; Sat,  2 Oct 2021 05:36:05 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s21so18682938wra.7
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 22:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=tJpPAyVQwCwi5DrdOlS+o3Q05uzbYfcFprP9Fg+v5js=;
        b=iE9Mnt23m+w8EVRQKoAc4+u46ud6YSbYTdDhDbTh2yB9lOBaBJs/itBYnkmWKJEJBQ
         TNIXVfhJqfZbZ06HjWGbMHwPI/6mugQRIAMTYD9ZSTHulZj459SpMt2r5YcVho9/bZOB
         faWrlClkcA8LcrPohntz4c3UbjsS+a6cfPdSR9fUo672wLSfo7vwDrXClei1vYJJvxz4
         2yFhSY0XItk63zJvMWu4QPRF0KfFZlID12k7PgjFu6E+t8lC8NlZ5IWJ0b69RDxBYemF
         ytSyZLIcoP7pxiCAQ/HoaL3Wg08BMuA8D7h0FzKhgM4cRr1MK5qH72mpA6LRyex3wPDj
         8l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=tJpPAyVQwCwi5DrdOlS+o3Q05uzbYfcFprP9Fg+v5js=;
        b=sdFyNfM8ize9LXTlPj/ZaANnMuclA6RvQuIrtrIt0gV56i7+gQL6YfPvXnfPFwrBxI
         YOuFnZyJ4ZHd/RS3kGvcvVb6/Qv+BEspuJYfsIjmRC6WXTloXBvMzd5BKfqggLeGouFi
         Wx82NMVB4OE7YgEef7ErIoSE+g9kBYqqwIhsanYE++xDfX1YAxRQ0MtDA+5fzN5T16CJ
         nWHX4aCCSS63EwZjDqGNlBJL9sz+RpcLFrK/prQuaLXhQousgcyH2LmrZwx0JGUMNSp4
         sdelf1uxIgUCe9KzwXPuI0x42KVVJMLGNmMVTsc2p4KkLBsQiDt0+C3sj01sNNfZnOhr
         BTkQ==
X-Gm-Message-State: AOAM530vVaFaNn61HzQV23iOhcESF7uvsyMwRpwhxl1dDnxK1kYYVEj7
	7OKgtkLSG6TyCxJQN4SRD1VR9Q==
X-Google-Smtp-Source: ABdhPJydY6Jyq5bMVjPKF5sOwimPkIib7c2RNhR3Au+cdEigYGaFFLyqxmsx2PKwoIn/J425H5HDSQ==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr1698432wrt.108.1633152964243;
        Fri, 01 Oct 2021 22:36:04 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id z17sm7463651wml.24.2021.10.01.22.36.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Oct 2021 22:36:03 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 2 Oct 2021 05:36:02 +0000 (UTC)
To: Geetha sowjanya <gakula@marvell.com>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <999263249.8081.1633152963728@localhost>
Subject: [TCWG CI] Regression caused by linux: octeontx2-pf: Use hardware
 register for CQE count
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8080_732488619.1633152962759"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-release-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS

------=_Part_8080_732488619.1633152962759
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by linux: octeontx2-pf: Use hardware register for CQE count:
commit af3826db74d184bc9c2c9d3ff34548e5f317a6f3
Author: Geetha sowjanya <gakula@marvell.com>

    octeontx2-pf: Use hardware register for CQE count

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22041
# First few build errors in logs:
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:38:15: error: unknown type name 'u64'
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:38:43: error: unknown type name 'u64'
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:38:53: error: unknown type name 'u64'
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:40:2: error: use of undeclared identifier 'u64'
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:44:21: error: use of undeclared identifier 'result'
# 00:04:14 ./include/linux/soc/marvell/octeontx2/asm.h:47:9: error: use of undeclared identifier 'result'
# 00:04:14 make[4]: *** [drivers/crypto/marvell/octeontx2/cn10k_cpt.o] Error 1
# 00:04:14 make[3]: *** [drivers/crypto/marvell/octeontx2] Error 2
# 00:04:14 make[2]: *** [drivers/crypto/marvell] Error 2
# 00:04:19 make[1]: *** [drivers/crypto] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
30185
# linux build successful:
all
# linux boot successful:
boot

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-release-aarch64-next-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/build-af3826db74d184bc9c2c9d3ff34548e5f317a6f3/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/build-13d45964c1b4cc8cc5b3693a4b2ba4992eea4370/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-linux-af3826db74d184bc9c2c9d3ff34548e5f317a6f3
cd investigate-linux-af3826db74d184bc9c2c9d3ff34548e5f317a6f3

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-aarch64-next-allmodconfig/35/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/

cd linux

# Reproduce first_bad build
git checkout --detach af3826db74d184bc9c2c9d3ff34548e5f317a6f3
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 13d45964c1b4cc8cc5b3693a4b2ba4992eea4370
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit af3826db74d184bc9c2c9d3ff34548e5f317a6f3
Author: Geetha sowjanya <gakula@marvell.com>
Date:   Tue Sep 28 11:25:26 2021 +0530

    octeontx2-pf: Use hardware register for CQE count
    
    Current driver uses software CQ head pointer to poll on CQE
    header in memory to determine if CQE is valid. Software needs
    to make sure, that the reads of the CQE do not get re-ordered
    so much that it ends up with an inconsistent view of the CQE.
    To ensure that DMB barrier after read to first CQE cacheline
    and before reading of the rest of the CQE is needed.
    But having barrier for every CQE read will impact the performance,
    instead use hardware CQ head and tail pointers to find the
    valid number of CQEs.
    
    Signed-off-by: Geetha sowjanya <gakula@marvell.com>
    Signed-off-by: Sunil Kovvuri Goutham <sgoutham@marvell.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>
---
 .../ethernet/marvell/octeontx2/nic/otx2_common.c   |  3 +
 .../ethernet/marvell/octeontx2/nic/otx2_common.h   |  1 +
 .../net/ethernet/marvell/octeontx2/nic/otx2_txrx.c | 69 +++++++++++++++++++---
 .../net/ethernet/marvell/octeontx2/nic/otx2_txrx.h |  5 ++
 include/linux/soc/marvell/octeontx2/asm.h          | 14 +++++
 5 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index 78df173e6df2..4c3dbade8cfb 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -1006,6 +1006,9 @@ int otx2_config_nix_queues(struct otx2_nic *pfvf)
 			return err;
 	}
 
+	pfvf->cq_op_addr = (__force u64 *)otx2_get_regaddr(pfvf,
+							   NIX_LF_CQ_OP_STATUS);
+
 	/* Initialize work queue for receive buffer refill */
 	pfvf->refill_wrk = devm_kcalloc(pfvf->dev, pfvf->qset.cq_cnt,
 					sizeof(struct refill_work), GFP_KERNEL);
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
index 0a792fce55f1..069d1b925102 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
@@ -343,6 +343,7 @@ struct otx2_nic {
 #define OTX2_FLAG_TC_MATCHALL_INGRESS_ENABLED	BIT_ULL(13)
 #define OTX2_FLAG_DMACFLTR_SUPPORT		BIT_ULL(14)
 	u64			flags;
+	u64			*cq_op_addr;
 
 	struct otx2_qset	qset;
 	struct otx2_hw		hw;
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
index f42b1d4e0c67..3f3ec8ffc4dd 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
@@ -18,6 +18,31 @@
 
 #define CQE_ADDR(CQ, idx) ((CQ)->cqe_base + ((CQ)->cqe_size * (idx)))
 
+static int otx2_nix_cq_op_status(struct otx2_nic *pfvf,
+				 struct otx2_cq_queue *cq)
+{
+	u64 incr = (u64)(cq->cq_idx) << 32;
+	u64 status;
+
+	status = otx2_atomic64_fetch_add(incr, pfvf->cq_op_addr);
+
+	if (unlikely(status & BIT_ULL(CQ_OP_STAT_OP_ERR) ||
+		     status & BIT_ULL(CQ_OP_STAT_CQ_ERR))) {
+		dev_err(pfvf->dev, "CQ stopped due to error");
+		return -EINVAL;
+	}
+
+	cq->cq_tail = status & 0xFFFFF;
+	cq->cq_head = (status >> 20) & 0xFFFFF;
+	if (cq->cq_tail < cq->cq_head)
+		cq->pend_cqe = (cq->cqe_cnt - cq->cq_head) +
+				cq->cq_tail;
+	else
+		cq->pend_cqe = cq->cq_tail - cq->cq_head;
+
+	return 0;
+}
+
 static struct nix_cqe_hdr_s *otx2_get_next_cqe(struct otx2_cq_queue *cq)
 {
 	struct nix_cqe_hdr_s *cqe_hdr;
@@ -318,7 +343,14 @@ static int otx2_rx_napi_handler(struct otx2_nic *pfvf,
 	struct nix_cqe_rx_s *cqe;
 	int processed_cqe = 0;
 
-	while (likely(processed_cqe < budget)) {
+	if (cq->pend_cqe >= budget)
+		goto process_cqe;
+
+	if (otx2_nix_cq_op_status(pfvf, cq) || !cq->pend_cqe)
+		return 0;
+
+process_cqe:
+	while (likely(processed_cqe < budget) && cq->pend_cqe) {
 		cqe = (struct nix_cqe_rx_s *)CQE_ADDR(cq, cq->cq_head);
 		if (cqe->hdr.cqe_type == NIX_XQE_TYPE_INVALID ||
 		    !cqe->sg.seg_addr) {
@@ -334,6 +366,7 @@ static int otx2_rx_napi_handler(struct otx2_nic *pfvf,
 		cqe->hdr.cqe_type = NIX_XQE_TYPE_INVALID;
 		cqe->sg.seg_addr = 0x00;
 		processed_cqe++;
+		cq->pend_cqe--;
 	}
 
 	/* Free CQEs to HW */
@@ -368,7 +401,14 @@ static int otx2_tx_napi_handler(struct otx2_nic *pfvf,
 	struct nix_cqe_tx_s *cqe;
 	int processed_cqe = 0;
 
-	while (likely(processed_cqe < budget)) {
+	if (cq->pend_cqe >= budget)
+		goto process_cqe;
+
+	if (otx2_nix_cq_op_status(pfvf, cq) || !cq->pend_cqe)
+		return 0;
+
+process_cqe:
+	while (likely(processed_cqe < budget) && cq->pend_cqe) {
 		cqe = (struct nix_cqe_tx_s *)otx2_get_next_cqe(cq);
 		if (unlikely(!cqe)) {
 			if (!processed_cqe)
@@ -380,6 +420,7 @@ static int otx2_tx_napi_handler(struct otx2_nic *pfvf,
 
 		cqe->hdr.cqe_type = NIX_XQE_TYPE_INVALID;
 		processed_cqe++;
+		cq->pend_cqe--;
 	}
 
 	/* Free CQEs to HW */
@@ -936,10 +977,16 @@ void otx2_cleanup_rx_cqes(struct otx2_nic *pfvf, struct otx2_cq_queue *cq)
 	int processed_cqe = 0;
 	u64 iova, pa;
 
-	while ((cqe = (struct nix_cqe_rx_s *)otx2_get_next_cqe(cq))) {
-		if (!cqe->sg.subdc)
-			continue;
+	if (otx2_nix_cq_op_status(pfvf, cq) || !cq->pend_cqe)
+		return;
+
+	while (cq->pend_cqe) {
+		cqe = (struct nix_cqe_rx_s *)otx2_get_next_cqe(cq);
 		processed_cqe++;
+		cq->pend_cqe--;
+
+		if (!cqe)
+			continue;
 		if (cqe->sg.segs > 1) {
 			otx2_free_rcv_seg(pfvf, cqe, cq->cq_idx);
 			continue;
@@ -965,7 +1012,16 @@ void otx2_cleanup_tx_cqes(struct otx2_nic *pfvf, struct otx2_cq_queue *cq)
 
 	sq = &pfvf->qset.sq[cq->cint_idx];
 
-	while ((cqe = (struct nix_cqe_tx_s *)otx2_get_next_cqe(cq))) {
+	if (otx2_nix_cq_op_status(pfvf, cq) || !cq->pend_cqe)
+		return;
+
+	while (cq->pend_cqe) {
+		cqe = (struct nix_cqe_tx_s *)otx2_get_next_cqe(cq);
+		processed_cqe++;
+		cq->pend_cqe--;
+
+		if (!cqe)
+			continue;
 		sg = &sq->sg[cqe->comp.sqe_id];
 		skb = (struct sk_buff *)sg->skb;
 		if (skb) {
@@ -973,7 +1029,6 @@ void otx2_cleanup_tx_cqes(struct otx2_nic *pfvf, struct otx2_cq_queue *cq)
 			dev_kfree_skb_any(skb);
 			sg->skb = (u64)NULL;
 		}
-		processed_cqe++;
 	}
 
 	/* Free CQEs to HW */
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.h b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.h
index 3ff1ad79c001..6a97631ff226 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.h
@@ -56,6 +56,9 @@
  */
 #define CQ_QCOUNT_DEFAULT	1
 
+#define CQ_OP_STAT_OP_ERR       63
+#define CQ_OP_STAT_CQ_ERR       46
+
 struct queue_stats {
 	u64	bytes;
 	u64	pkts;
@@ -122,6 +125,8 @@ struct otx2_cq_queue {
 	u16			pool_ptrs;
 	u32			cqe_cnt;
 	u32			cq_head;
+	u32			cq_tail;
+	u32			pend_cqe;
 	void			*cqe_base;
 	struct qmem		*cqe;
 	struct otx2_pool	*rbpool;
diff --git a/include/linux/soc/marvell/octeontx2/asm.h b/include/linux/soc/marvell/octeontx2/asm.h
index fa1d6af0164e..0f79fd7f81a1 100644
--- a/include/linux/soc/marvell/octeontx2/asm.h
+++ b/include/linux/soc/marvell/octeontx2/asm.h
@@ -34,9 +34,23 @@
 			 : [rf] "+r"(val)		\
 			 : [rs] "r"(addr));		\
 })
+
+static inline u64 otx2_atomic64_fetch_add(u64 incr, u64 *ptr)
+{
+	u64 result;
+
+	asm volatile (".cpu  generic+lse\n"
+		      "ldadda %x[i], %x[r], [%[b]]"
+		      : [r] "=r" (result), "+m" (*ptr)
+		      : [i] "r" (incr), [b] "r" (ptr)
+		      : "memory");
+	return result;
+}
+
 #else
 #define otx2_lmt_flush(ioaddr)          ({ 0; })
 #define cn10k_lmt_flush(val, addr)	({ addr = val; })
+#define otx2_atomic64_fetch_add(incr, ptr)	({ incr; })
 #endif
 
 #endif /* __SOC_OTX2_ASM_H */
</cut>
------=_Part_8080_732488619.1633152962759--
