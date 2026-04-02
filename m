Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF863E4C90
	for <llvm@lists.linux.dev>; Thu,  2 Apr 2026 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138815; cv=none; b=UAVAMru2rTPeEzqfysiqP812bRfMvmcB9goPYfmFVIytLdqHuROvNOcjUtpNRaEyL85xlGuyFR6FaWH4a6GNle1jY4LiIF4VFVEhWz13bZTVzQB7Hy5C2FJSrgjaIU0xccrNM4+ka3mANHlZeBwzHnC+WLkQ0Ytr7VWWwsTd1lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138815; c=relaxed/simple;
	bh=As7/gVu1sJ+y6ys4Y3SKwdd1ZSGMxwdpofSGLrL/FaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIKoOsMX+F8wktMT2txmFHtueK0n/OJIwLC00Gl7QeJWgU1NBZOaiDG0QBgBx2tXLOQMoucqu//a2oTuSosv9hkGH8QF4OHapteNvJcpt727KQihq45k48xKcpeyGqQ/B+QJ+anjJfJ382rZIFxFwuTOKWBpdMcVaJSvTzSSOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LX3jvb0p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LX3jvb0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775138812;
	bh=As7/gVu1sJ+y6ys4Y3SKwdd1ZSGMxwdpofSGLrL/FaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LX3jvb0p6JCmd2NTfa2tsvkqCOq71dyjBav4oMr73Ki45+G8rhNIosQGZ9b2pZoi2
	 H8w+Th1PaIauWvjegWhSU+3LtO+FTbIG5y5ARFQESdDeY6o+fk7eufG6E9xQo3y/Zt
	 cAM/dfkoRW/ZQb9lB1B1wdSSZC9EYNE2ea4D1yZucdW9SK+527M7BJdUlpC4DRT5UZ
	 OICnWDB43EgnCW3OqVD6L0guSfkU7FsNbV7ygiUfAdDOMWnGl75Nd/fCXs8jdJrm0K
	 L6vkhEmxY6TlQOcmuEcIeOARNgfiyqIeELEA7sgKoBgsyWR/Yrkcstp7aOFUj9x9U9
	 jFkTE4jPOqoLA==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1AAE17E7828;
	Thu,  2 Apr 2026 16:06:50 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 02 Apr 2026 10:06:36 -0400
Subject: [PATCH v3 1/4] media: rkvdec: Introduce a global bitwriter helper
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-rkvdec-use-bitwriter-v3-1-2072474ceaf4@collabora.com>
References: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
In-Reply-To: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
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
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
new file mode 100644
index 000000000000..2a5c271ade91
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-bitwriter.h
@@ -0,0 +1,39 @@
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
+#include <linux/bits.h>
+
+struct rkvdec_bw_field {
+	u16 offset;
+	u8 len;
+};
+
+#define BW_FIELD(_offset, _len) ((struct rkvdec_bw_field){ _offset, _len })
+
+static inline void rkvdec_set_bw_field(u32 *buf, struct rkvdec_bw_field field, u32 value)
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
+#endif /* RKVDEC_BIT_WRITER_H_ */

-- 
2.53.0

