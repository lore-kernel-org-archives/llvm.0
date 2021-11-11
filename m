Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7762C83
	for <llvm@lists.linux.dev>; Thu, 11 Nov 2021 07:31:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECB2B61284;
	Thu, 11 Nov 2021 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636615910;
	bh=nKTRLlWeGHO7HiGF56FDAr2Uz60VV5i9mUwmGSLNAJo=;
	h=From:To:Cc:Subject:Date:From;
	b=SuFAOeX360ZHo6STmYdmkcef9x5x9/GVZBmgB2P/tcw1Prn7677LPOxi7HzC2GxmP
	 1gm8H02f+Z0DtJnntOPW5MmKch+qaKBLP117lLdDR/chrjPbAHQZ4ZwXGet6MzX8Cr
	 Lrhidj0sv/SISDDQelO/g2Iw/9rKfbVBdqrgvzPkFCSQ9h5tXOMTBcCITpi1Rz6u9c
	 KAT4UHnN64xfS0eOP6OQp3f1mGPNqGgwnhk4uML3Xe+8kzUIRzgCvLIASn5t9ZKfRB
	 PYsqS+fIK71wqZw90kmPnXalOHbZrjEZzTKcdmIHhd7bHmn8zIjHStgjxwg0jKiInj
	 +nyc1nYg3bFVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Luca Coelho <luciano.coelho@intel.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Yaara Baruch <yaara.baruch@intel.com>,
	Matti Gottlieb <matti.gottlieb@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] iwlwifi: pcie: fix constant-conversion warning
Date: Thu, 11 Nov 2021 08:31:37 +0100
Message-Id: <20211111073145.2504032-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang points out a potential issue with integer overflow when
the iwl_dev_info_table[] array is empty:

drivers/net/wireless/intel/iwlwifi/pcie/drv.c:1344:42: error: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Werror,-Wconstant-conversion]
        for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
               ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~

This is still harmless, as the loop correctly terminates, but adding
an extra range check makes that obvious to both readers and to the
compiler.

Fixes: 3f7320428fa4 ("iwlwifi: pcie: simplify iwl_pci_find_dev_info()")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Changes in v2:
- replace int cast with a range check
---
 drivers/net/wireless/intel/iwlwifi/pcie/drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
index c574f041f096..fcda7603024b 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/drv.c
@@ -1341,6 +1341,9 @@ iwl_pci_find_dev_info(u16 device, u16 subsystem_device,
 {
 	int i;
 
+	if (ARRAY_SIZE(iwl_dev_info_table) == 0)
+		return NULL;
+
 	for (i = ARRAY_SIZE(iwl_dev_info_table) - 1; i >= 0; i--) {
 		const struct iwl_dev_info *dev_info = &iwl_dev_info_table[i];
 
-- 
2.29.2

