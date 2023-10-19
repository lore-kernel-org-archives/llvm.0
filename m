Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B2609156DB
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 805C5608BCF73;
	Thu, 19 Oct 2023 16:40:33 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: woojung.huh@microchip.com,
	UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] net: lan78xx: add an error code check in lan78xx_write_raw_eeprom
Date: Thu, 19 Oct 2023 16:40:23 +0800
Message-Id: <20231019084022.1528885-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check the value of 'ret' after call 'lan78xx_read_reg'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---

Clang complains that value stored to 'ret' is never read.
Maybe this place miss an error code check, I'm not sure 
about this.

 drivers/net/usb/lan78xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 59cde06aa7f6..347788336b11 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -977,6 +977,10 @@ static int lan78xx_write_raw_eeprom(struct lan78xx_net *dev, u32 offset,
 	 * disable & restore LED function to access EEPROM.
 	 */
 	ret = lan78xx_read_reg(dev, HW_CFG, &val);
+	if (ret < 0) {
+		retval = -EIO;
+		goto exit;
+	}
 	saved = val;
 	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
 		val &= ~(HW_CFG_LED1_EN_ | HW_CFG_LED0_EN_);
-- 
2.30.2

