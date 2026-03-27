Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E9312831
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624569; cv=none; b=PFzT/1QCvZF/FgS03DyqwQuhVQGdSsHRt8hsuuh6FUWxQ733XI7+GxOBJe/JLLn3UA36xQ4ZQ1yXnezcdQEpgjw0QSQH4N+4vKS3K6UAePGXLny/HzVmfn0SMDLfsQH4jS/hMrnLMLeLEbrhHRy/n4oUQMXeVuYuXK+n1a224+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624569; c=relaxed/simple;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IF2tD0aqa2LojWuraaa17BM2v9M/afNIIr7nLk78Yxc8bS5pr1C23A/bgm0hUmK8JL4LqEkUV/j9mkx6GS3W7IadfWEWLMyEUcuY2WodAXmYPQMoDoYmJYAU7Q3+cLe/vQjApLfKQxexVVTxBh4EWXutA5MTCWNo1wp3bTSQIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YBY1xoer; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YBY1xoer"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774624566;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBY1xoer/CEtYGdfvDkOJnUC9SEAbOn19cLaA4YK5TmfTL8j2/MKqDSC2s1lRmLQE
	 jOll7A7DaKycsm0VSd19fTkJuFd7toxN34H61yCao80zuEwt74i0vm1ziK/W7XF+at
	 Gk/pnI3+5inCbtpO8397vE4RTw2U+GURK85ujwqbb5b47D044Dt1Yl4n2uSVFmOmg6
	 tYeDNAGtLtZJ+UdKeae0I/KZLi1MGO/eU+fffnUMmzzaXi+IZ6yDx2iR8bGEir+x1P
	 X+P2uAwC7JtG0K10cPOWfsDRAynN629FU4OQ9YFKFQ2H4ZadpIW3jtglXsjCSVRsaE
	 mAaz8Tv8lQ7uQ==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C84F417E5A68;
	Fri, 27 Mar 2026 16:16:04 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 11:16:00 -0400
Subject: [PATCH 1/4] media: rkvdec: Introduce a global bitwriter helper
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v1-1-982cf872b590@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
In-Reply-To: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0

The use of structures with bitfields is good when the values are
somewhat aligned.
More mis-alignement means that compilers need to do more gymanstics
to edit the fields values.

Some cases have been reported with CLang on specific architectures
like armhf and hexagon, where the compiler would allocate a bigger
local stack than needed or even completely freeze during compilation.

Some fixes have been provided to ease the issues, but the real fix
here is to use a bitwriter instead of heavily unaligned bitfields.

This is a preparation commit to provide a global bitwriter interface
for the whole driver.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/Makefile    |  1 +
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.c    | 30 ++++++++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    | 25 ++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index e629d571e4d8..11e2122bcbbf 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_VDEC) += rockchip-vdec.o
 
 rockchip-vdec-y += \
 		   rkvdec.o \
+		   rkvdec-bitwriter.o \
 		   rkvdec-cabac.o \
 		   rkvdec-h264.o \
 		   rkvdec-h264-common.o \
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
new file mode 100644
index 000000000000..673ebb89002b
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip Video Decoder bit writer
+ *
+ * Copyright (C) 2026 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <linux/bits.h>
+
+#include "rkvdec-bitwriter.h"
+
+void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value)
+{
+	u8 bit = field.offset % 32;
+	u16 word = field.offset / 32;
+	u64 mask = GENMASK_ULL(bit + field.len - 1, bit);
+	u64 val = ((u64)value << bit) & mask;
+
+	buf[word] &= ~mask;
+	buf[word] |= val;
+	if (bit + field.len > 32) {
+		buf[word + 1] &= ~(mask >> 32);
+		buf[word + 1] |= val >> 32;
+	}
+}
+
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
new file mode 100644
index 000000000000..44154f1ebc65
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip Video Decoder bit writer
+ *
+ * Copyright (C) 2026 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ */
+
+#ifndef RKVDEC_BIT_WRITER_H_
+#define RKVDEC_BIT_WRITER_H_
+
+#include <linux/types.h>
+
+struct rkvdec_bw_field {
+	u16 offset;
+	u8 len;
+};
+
+#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len })
+
+void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value);
+
+#endif /* RKVDEC_BIT_WRITER_H_ */

-- 
2.53.0

