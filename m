Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F138412B89
	for <llvm@lists.linux.dev>; Wed, 10 May 2023 12:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15ACC433D2;
	Wed, 10 May 2023 12:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683721955;
	bh=MxBP5jLAkaod1vzTeTn3KMLAWc/AHr+UNOpEZNvg6Ik=;
	h=From:Date:Subject:To:Cc:From;
	b=VZByduWC1kHJu0oDwQbaQ3J4zG3C0guPpvRfqPi6+H05DB82ZD0uE1W4rg6Pn/Xl/
	 N6znYUHPxRhpDgFPOUkWEwW/KhrVA367xv4PsWM6v/71DEMxCdBFWmKq2VrrzHiDTC
	 eCczpz4g4UMonLMd9qZep0gD9XJ+iDRiBO0cmrMnNRjsEMla2nZzjDOj8Qw8uGwMoW
	 fjVjzWU4XQYuxWTfvsvg9CWrNjTrE5xngJ18+klLfz1WkblFjBW/QnSTZnw+kxrB/a
	 +hhbGBp9zNpblPBkhqND+AHgSapRCsvK3CiFvDPGoDPmQ6/nJjEuiaM0ANyAsAYiub
	 T+9c000bg/B+w==
From: Simon Horman <horms@kernel.org>
Date: Wed, 10 May 2023 14:32:17 +0200
Subject: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
X-B4-Tracking: v=1; b=H4sIANCOW2QC/x2NQQrDMAwEvxJ0rsBySEv7ldKDo8i1IHWNnZRAy
 N8rsrdZ2NkdmlSVBo9uhyo/bfrNBnTpgFPIb0GdjME737uBHKpn/HAqWFhps2BcMy82Qw5tQXc
 TvtIQ+7snMMsYmuBYQ+ZknrzOs5WlStTtvH2+juMP/uIpUYYAAAA=
To: Wolfram Sang <wsa@kernel.org>
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, 
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-i2c@vger.kernel.org, llvm@lists.linux.dev, 
 Simon Horman <horms@kernel.org>
X-Mailer: b4 0.12.2

Rather than casting pci1xxxx_i2c_shutdown to an incompatible function type,
update the type to match that expected by __devm_add_action.

Reported by clang-16 with W-1:

 .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1xxxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
         ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_action'
         __devm_add_action(release, action, data, #action)
                                   ^~~~~~

No functional change intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
index b21ffd6df927..5ef136c3ecb1 100644
--- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
+++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
@@ -1118,8 +1118,10 @@ static int pci1xxxx_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
 			 pci1xxxx_i2c_resume);
 
-static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
+static void pci1xxxx_i2c_shutdown(void *data)
 {
+	struct pci1xxxx_i2c *i2c = data;
+
 	pci1xxxx_i2c_config_padctrl(i2c, false);
 	pci1xxxx_i2c_configure_core_reg(i2c, false);
 }
@@ -1156,7 +1158,7 @@ static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
 	init_completion(&i2c->i2c_xfer_done);
 	pci1xxxx_i2c_init(i2c);
 
-	ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
+	ret = devm_add_action(dev, pci1xxxx_i2c_shutdown, i2c);
 	if (ret)
 		return ret;
 

