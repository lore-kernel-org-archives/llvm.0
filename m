Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE296665
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 05:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657863251; x=1689399251;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CvNvujJBORl3tcnve2CJMhHc6+JmB5rOIHaaoKSpvxM=;
  b=HyxZK8bgIIny5WTwcBcB3DyLxAvEjk4lhX/bCyOch9cvbjAcaeyfqwsf
   gj+DnbqVZUPcQblhKh9wzUd8InY7wiE2iUIy87AvbwduikfVWBhmpI57L
   kG7pcBy9j7j/lOOp2Lx8d+qj+PrdGlA7q5LECfC2F8PdDYlw9vBY3oPQM
   52J8JUahUsi4o/1r42I7KuzQ0A5CdP6HcsklFZjt0LuzDWlA6V1Q7itIg
   NBCr5g8mFJMR6mF4+HhsKv6N6vwKSw0JApRbJAg5XrQj++SVjh/AiactH
   YbvLOKVKMmM27wZ9UoNesZ1nPkrzBXGIvJ5tc6IUkC0FmD3n1gx/rxc2W
   A==;
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="172235119"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 22:34:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 22:34:03 -0700
Received: from CHE-LT-I17769U.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 14 Jul 2022 22:33:56 -0700
From: Arun Ramadoss <arun.ramadoss@microchip.com>
To: <llvm@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>
CC: Woojung Huh <woojung.huh@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Arnd Bergmann <arnd@kernel.org>, Russell King
	<linux@armlinux.org.uk>
Subject: [Patch net-next] net: dsa: microchip: fix Clang -Wunused-const-variable warning on 'ksz_dt_ids'
Date: Fri, 15 Jul 2022 11:03:34 +0530
Message-ID: <20220715053334.5986-1-arun.ramadoss@microchip.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch removes the of_match_ptr() pointer when dereferencing the
ksz_dt_ids which produce the unused variable warning.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arun Ramadoss <arun.ramadoss@microchip.com>
---
 drivers/net/dsa/microchip/ksz_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/microchip/ksz_spi.c b/drivers/net/dsa/microchip/ksz_spi.c
index 4844830dca72..05bd089795f8 100644
--- a/drivers/net/dsa/microchip/ksz_spi.c
+++ b/drivers/net/dsa/microchip/ksz_spi.c
@@ -215,7 +215,7 @@ static struct spi_driver ksz_spi_driver = {
 	.driver = {
 		.name	= "ksz-switch",
 		.owner	= THIS_MODULE,
-		.of_match_table = of_match_ptr(ksz_dt_ids),
+		.of_match_table = ksz_dt_ids,
 	},
 	.id_table = ksz_spi_ids,
 	.probe	= ksz_spi_probe,

base-commit: 6e6fbb72e48ba3da229ff2158cf0d26aa50a218a
-- 
2.36.1

