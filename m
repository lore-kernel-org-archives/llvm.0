Received: from ssh247.corpemail.net (ssh247.corpemail.net [210.51.61.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6964C96
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 05:55:35 +0000 (UTC)
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id NEU00124;
        Mon, 18 Sep 2023 13:54:24 +0800
Received: from localhost.localdomain.com (10.200.104.41) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:23 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: <linux@armlinux.org.uk>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <llvm@lists.linux.dev>, chuguangqing
	<chuguangqing@inspur.com>
Subject: [PATCH] The Kconfig help text contains the phrase "the the" in the help text. Fix this.
Date: Mon, 18 Sep 2023 13:26:20 +0800
Message-ID: <20230918052620.243394-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.41]
tUid: 2023918135424e7e62442672a3dfd332ceec2984494d3
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9557808e8..2321be76a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1563,7 +1563,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1701,7 +1701,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.39.3

