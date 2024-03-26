Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3B91412AAFE
	for <llvm@lists.linux.dev>; Tue, 26 Mar 2024 06:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711433594; cv=none; b=dWEqgxqVHCWh+zAvVeXIrxnFTx6tzbUR+wxJVk5mm7QW8apcf62tl1p8o4uXBvOn6tDR9rWhiWkZQAq89G2uZUfjTkx2Fa+hRkZVwDsrCVT76M7QwuX7G3Ks1TLXLVrsuoMu+19JbmKdWKZP9wP1DveuwB7olQUD4AXX9P+jS9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711433594; c=relaxed/simple;
	bh=NdKLQ7JamUzG1z9KVDouidvoQOk9dDTvpTFBpz+UgxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=NCzOTC36AdS8AGUzbzFYaaH/MbotslXGI7K4K//g5eIctWJc9l5kQz0uH3yAV4QzPezRogRSlKktwoDGotAXQF+nSYiM6GMNv0S2ityaVKQGRKV/gJo1MX5IS/4/ea24JTlXGlHKb5Hp3iGWyv05ZOInaGugahY+/rm2cnhf5dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id DDADD6070B0AA;
	Tue, 26 Mar 2024 14:13:07 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sgoutham@marvell.com,
	gakula@marvell.com,
	sbhatta@marvell.com,
	hkelam@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net v2 2/2] octeontx2-pf: remove unused variables req_hdr and rsp_hdr
Date: Tue, 26 Mar 2024 14:12:36 +0800
Message-Id: <20240326061233.4133148-2-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240326061233.4133148-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker(scan-buid):
drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:503:2: warning:
Value stored to 'rsp_hdr' is never read [deadcode.DeadStores]

Remove these unused variables to save some space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2: add "net" in subject
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index 3f46d5e0fb2e..637b05c79c42 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -450,7 +450,6 @@ static void otx2_pfvf_mbox_handler(struct work_struct *work)
 	struct mbox_msghdr *msg = NULL;
 	int offset, vf_idx, id, err;
 	struct otx2_mbox_dev *mdev;
-	struct mbox_hdr *req_hdr;
 	struct otx2_mbox *mbox;
 	struct mbox *vf_mbox;
 	struct otx2_nic *pf;
@@ -461,9 +460,8 @@ static void otx2_pfvf_mbox_handler(struct work_struct *work)
 
 	mbox = &pf->mbox_pfvf[0].mbox;
 	mdev = &mbox->dev[vf_idx];
-	req_hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
 
-	offset = ALIGN(sizeof(*req_hdr), MBOX_MSG_ALIGN);
+	offset = ALIGN(sizeof(struct mbox_hdr), MBOX_MSG_ALIGN);
 
 	for (id = 0; id < vf_mbox->num_msgs; id++) {
 		msg = (struct mbox_msghdr *)(mdev->mbase + mbox->rx_start +
@@ -494,7 +492,6 @@ static void otx2_pfvf_mbox_up_handler(struct work_struct *work)
 	struct otx2_nic *pf = vf_mbox->pfvf;
 	struct otx2_mbox_dev *mdev;
 	int offset, id, vf_idx = 0;
-	struct mbox_hdr *rsp_hdr;
 	struct mbox_msghdr *msg;
 	struct otx2_mbox *mbox;
 
@@ -502,8 +499,7 @@ static void otx2_pfvf_mbox_up_handler(struct work_struct *work)
 	mbox = &pf->mbox_pfvf[0].mbox_up;
 	mdev = &mbox->dev[vf_idx];
 
-	rsp_hdr = (struct mbox_hdr *)(mdev->mbase + mbox->rx_start);
-	offset = mbox->rx_start + ALIGN(sizeof(*rsp_hdr), MBOX_MSG_ALIGN);
+	offset = mbox->rx_start + ALIGN(sizeof(struct mbox_hdr), MBOX_MSG_ALIGN);
 
 	for (id = 0; id < vf_mbox->up_num_msgs; id++) {
 		msg = mdev->mbase + offset;
-- 
2.30.2

