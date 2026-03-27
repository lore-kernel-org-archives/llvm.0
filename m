Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB486379EE2
	for <llvm@lists.linux.dev>; Fri, 27 Mar 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639109; cv=none; b=G7a63bnLGLl3pHdyoR8zp/lhITBq5I7RkXm2CL1eXtvGHijS0ot522B4dpUXPG9GUlXlFzCrcCbjlsFRG8FTlYaDOVuBWmpc56DaVawqZPVanD/xH3NDabLlQ0IPfDrJE2WZaw2F9DNy4zciGaToAMe3NoxmxKo5alg9bPFDrnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639109; c=relaxed/simple;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZFKiEmtBP4xS8uoLivwFyOzArQn+8D5TzE/7Hdf9WcssS31+fu511kjx8LSVCs6+MU9aoUWT3CZ0R5imImljnoPlhEOCi28xUekGzcoMogESj1ZEcBr22OmMPnycQjZHYlKDE3EvXwXu0sMNSzeptzkyl/19UeijhP+fVqu7BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=js398oCJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="js398oCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774639106;
	bh=93cbvhOhHO3BIlQLuu3rBBU+F598t09c4s9HxlgYH/E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=js398oCJLpreDTw6u5FZahbx6EWOjhJcND++MlDK0ApHbOKfRIit3P4sHacDgOzVf
	 xKDhhOgga94EvDQbRuJJbtSfzhUVt+nKK/hajSA2glZtgQ5zND36Dv03tX7j4xncnk
	 tGFESIDXLgWr0lCvf6RvwVIIMbDZLZ/FohbAzsYOz3j4BQOu1Ruk697EzaEtYhs/hF
	 I3woUN0xNC3j2G3fEQ979lCvGUR5a1OZZeX6qb+UlHKzw9QDTcxT5QfGR4uvgut0b1
	 SkJDXBO3cLkGrXLTXNGjlEUwgLszItyP6WH6LCuFYCkFPsK7rYakRe9KjmTNkndTbe
	 3Jk71ROoz6ivw==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 425DF17E5BE7;
	Fri, 27 Mar 2026 20:18:24 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Fri, 27 Mar 2026 15:18:19 -0400
Subject: [PATCH v2 1/4] media: rkvdec: Introduce a global bitwriter helper
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rkvdec-use-bitwriter-v2-1-a5a4754b0518@collabora.com>
References: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
In-Reply-To: <20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com>
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

