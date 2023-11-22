Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A20DB156CE
	for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id E795A606AC67E;
	Wed, 22 Nov 2023 14:59:53 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: kvalo@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	yangyingliang@huawei.com,
	libertas-dev@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless-next] wifi: libertas: if_usb: remove some useless code in if_usb_prog_firmware
Date: Wed, 22 Nov 2023 14:59:09 +0800
Message-Id: <20231122065908.907045-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker complains that value stored to 'ret' is never read.
Remove these useless code to save space.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/marvell/libertas/if_usb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/marvell/libertas/if_usb.c b/drivers/net/wireless/marvell/libertas/if_usb.c
index 2240b4db8c03..77cc55616ef5 100644
--- a/drivers/net/wireless/marvell/libertas/if_usb.c
+++ b/drivers/net/wireless/marvell/libertas/if_usb.c
@@ -830,10 +830,8 @@ static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
 	}
 
 	cardp->fw = fw;
-	if (check_fwfile_format(cardp->fw->data, cardp->fw->size)) {
-		ret = -EINVAL;
+	if (check_fwfile_format(cardp->fw->data, cardp->fw->size))
 		goto done;
-	}
 
 	/* Cancel any pending usb business */
 	usb_kill_urb(cardp->rx_urb);
@@ -848,7 +846,6 @@ static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
 restart:
 	if (if_usb_submit_rx_urb_fwload(cardp) < 0) {
 		lbs_deb_usbd(&cardp->udev->dev, "URB submission is failed\n");
-		ret = -EIO;
 		goto done;
 	}
 
@@ -866,18 +863,15 @@ static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
 
 	if (cardp->bootcmdresp == BOOT_CMD_RESP_NOT_SUPPORTED) {
 		/* Return to normal operation */
-		ret = -EOPNOTSUPP;
 		usb_kill_urb(cardp->rx_urb);
 		usb_kill_urb(cardp->tx_urb);
-		if (if_usb_submit_rx_urb(cardp) < 0)
-			ret = -EIO;
+		if_usb_submit_rx_urb(cardp);
 		goto done;
 	} else if (cardp->bootcmdresp <= 0) {
 		if (--reset_count >= 0) {
 			if_usb_reset_device(cardp);
 			goto restart;
 		}
-		ret = -EIO;
 		goto done;
 	}
 
@@ -908,7 +902,6 @@ static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
 		}
 
 		pr_info("FW download failure, time = %d ms\n", i * 100);
-		ret = -EIO;
 		goto done;
 	}
 
-- 
2.30.2

