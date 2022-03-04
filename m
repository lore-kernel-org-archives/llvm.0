Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC37A
	for <llvm@lists.linux.dev>; Fri,  4 Mar 2022 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1646402907; x=1677938907;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=h9w5rLlIgRL6Mreid8VITmayzPDrxYRkE0AGDM00690=;
  b=PRu8WCGpmo2S5yB/tIcEwtNViPvLqbN1mrEHJw75TinB3xzZ/ULWWBPr
   xRW00N3ciu+mGPvkKAG52uUhcpQIwJa5blGkh6Z0aglg5ulpDKUNR0VZE
   f6DB20H3zy8ihifU69MJ4JBc+l1H8x2meTW/qL6KndA8OrzSULn2zBopH
   wwM7buk2DeNeNdM/JF9yvrbygpHitG861V+puCdFrAkSJRVdixNJL/yfY
   lkb3rKAxvcRgrtDQp8Iklj6CVuyasrnpSZLIIewkpEQFhs0Ktp0Ob2EvP
   zi7Vk3Dag9qDo7wyv1gC9jmw80ixrHMh1zlBlrkvR3hzZFcvk2fp28iX3
   w==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; 
   d="scan'208";a="155731531"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Mar 2022 07:07:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 07:07:17 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 07:07:15 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <UNGLinuxDriver@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH net-next] net: sparx5: Fix initialization of variables on stack
Date: Fri, 4 Mar 2022 15:09:18 +0100
Message-ID: <20220304140918.3356873-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The variables 'res' inside the functions sparx5_ptp_get_1ppm and
sparx5_ptp_get_nominal_value was not initialized. So in case of the default
case of the switch after, it would return an uninitialized variable.
This makes also the clang builds to failed.

Fixes: 0933bd04047c3b ("net: sparx5: Add support for ptp clocks")
Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index fa377f6e7e08..cd110c31e5a4 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -32,7 +32,7 @@ static u64 sparx5_ptp_get_1ppm(struct sparx5 *sparx5)
 	 * (1/1000000)/((2^-59)/X)
 	 */
 
-	u64 res;
+	u64 res = 0;
 
 	switch (sparx5->coreclock) {
 	case SPX5_CORE_CLOCK_250MHZ:
@@ -54,7 +54,7 @@ static u64 sparx5_ptp_get_1ppm(struct sparx5 *sparx5)
 
 static u64 sparx5_ptp_get_nominal_value(struct sparx5 *sparx5)
 {
-	u64 res;
+	u64 res = 0;
 
 	switch (sparx5->coreclock) {
 	case SPX5_CORE_CLOCK_250MHZ:
-- 
2.33.0

