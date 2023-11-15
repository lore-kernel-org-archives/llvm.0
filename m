Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 6A2796AB3
	for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id E98BC602582C0;
	Wed, 15 Nov 2023 17:23:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	briannorris@chromium.org,
	lukas@wunner.de,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mwifiex: remove some useless code
Date: Wed, 15 Nov 2023 17:23:29 +0800
Message-Id: <20231115092328.1048103-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'priv' is never read.
'priv' is useless, so remove it to save space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 3756aa247e77..9eff29a25544 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -1244,8 +1244,6 @@ mwifiex_process_sleep_confirm_resp(struct mwifiex_adapter *adapter,
 				   u8 *pbuf, u32 upld_len)
 {
 	struct host_cmd_ds_command *cmd = (struct host_cmd_ds_command *) pbuf;
-	struct mwifiex_private *priv =
-		mwifiex_get_priv(adapter, MWIFIEX_BSS_ROLE_ANY);
 	uint16_t result = le16_to_cpu(cmd->result);
 	uint16_t command = le16_to_cpu(cmd->command);
 	uint16_t seq_num = le16_to_cpu(cmd->seq_num);
@@ -1260,12 +1258,6 @@ mwifiex_process_sleep_confirm_resp(struct mwifiex_adapter *adapter,
 		    "cmd: CMD_RESP: 0x%x, result %d, len %d, seqno 0x%x\n",
 		    command, result, le16_to_cpu(cmd->size), seq_num);
 
-	/* Get BSS number and corresponding priv */
-	priv = mwifiex_get_priv_by_id(adapter, HostCmd_GET_BSS_NO(seq_num),
-				      HostCmd_GET_BSS_TYPE(seq_num));
-	if (!priv)
-		priv = mwifiex_get_priv(adapter, MWIFIEX_BSS_ROLE_ANY);
-
 	/* Update sequence number */
 	seq_num = HostCmd_GET_SEQ_NO(seq_num);
 	/* Clear RET_BIT from HostCmd */
-- 
2.30.2

