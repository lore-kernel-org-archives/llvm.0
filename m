Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9B51F0E53
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746867367; cv=none; b=FS+P1tdAKki0wESbG5wLxcH9YMRtdyn3FLP5i5Jl5YPbbwysorSCeDvuIBN2LUDSkoTSS0NSADQX/DxEyYetHI3pR0cluHBUm645JHx7UJOff3FcBtWNyHfxo6pF9WUCZkOpYkZYIK+zBEyEq5ashHjqFEs3knXAGk5KjR+koZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746867367; c=relaxed/simple;
	bh=q/6kjsQl8uKq9Wxv4d5NoqfXaQibiCuO98lH0DMSwKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k/MKNcApB/FtLf+d8AqDzIIChMmVCmQBPDHtN38BXyDXNop7SLA7hazgaqdGGCgZhNZ1AKjDz4KOG4u3CshYzfmfjxBD3PfIsu9Si5XZTR5+4MDRG/6Ne80ubn0i6/SIugWkSsCkOVLnbPq2NBay8RZBLM2K4mN4N8cDuq0TQo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=schKhCH4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="schKhCH4"
Received: from [192.168.1.192] (unknown [IPv6:2001:861:3a80:3300:7c3b:c7bf:b733:fa1b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C4998BE;
	Sat, 10 May 2025 10:49:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746866947;
	bh=q/6kjsQl8uKq9Wxv4d5NoqfXaQibiCuO98lH0DMSwKg=;
	h=From:Date:Subject:To:Cc:From;
	b=schKhCH4BhD7cBov6CrVJMMtTPNDslcANcECxmMn/AGdQD72+XXZVs27fjQNmL8Gz
	 jsmEE2wHcTGPw0D4lZdfzsAJkuMbXHLIZC518mBmVjcEnHzTl7O1noLqvj3LBYZjXs
	 IzwRxWg5LvFgVfDA/I9W2a2GvypUuG50HTwKOUZ0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 10 May 2025 10:48:52 +0200
Subject: [PATCH] media: amlogic: c3-mipi-csi2: Handle 64-bits division
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-amlogic-div64-div-v1-1-e475d4de721f@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAPMSH2gC/x2MQQqAIBAAvxJ7TtDIPfSV6CC62UJpKEgg/j3rM
 jCHmQqZElOGZaiQqHDmGLqocQB7mOBJsOsOk5y01EoKc53RsxWOC84fBTrptEGyGhF6dyfa+fm
 f69baC0jhFchjAAAA
X-Change-ID: 20250510-amlogic-div64-div-6d0d5a6ec566
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=q/6kjsQl8uKq9Wxv4d5NoqfXaQibiCuO98lH0DMSwKg=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBoHxMQni3gctpxjnJp7HRE1q9UclpkdGWgMCuMv
 t3130s/096JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaB8TEAAKCRByNAaPFqFW
 PHhyEACR6wdeKnDVSiCu8+jYJFfMjhCWyNm/d1GBLwaHmjxAndaZZqzRRGT8ZhCml75tl822Yv1
 PKzyKHBlnLeQ3voqyzvffQSmximA8PeFplezYPnSadE3hiw5XK6Y/ffQfFq9YJGUo/cHZdj3A6P
 IVqnUOOC8GU1fkoOVvqF5OgYDBR90N58Xc+4azjhIhMwCFs9TB9W+gHtBAvvEDnvJrG9crkRUin
 25HCuUknJXanDwWxunaNeY6XMuIpa21xEtjUiPdGawvjnvWDp4rtUxgWxlroWb2843TUNhiBJrC
 yadkobl0fTLk7FLYHUysbv49FYxyDNZm6uSTWyPq5DOohMqi2klGQ4cNsrg9slvTxbFJFKpcuKQ
 LoDwhs6xAO5g1NE0Nm3qZ02eIQP7FKmyeOP53p+pkJBtgGkW3QIMkHf22Tw19e8/liEgSaDOYll
 4dNWJ/+2rvbsratDM5sb/nYP+//ELTp9APjiRdGPRUO5E+K8OOYbYA2EYiAkcoyuWxloJhfrSYd
 T+V3y/qdoxJxzgHiAqWT2dHGu7P178D3uLzdG5fE9vNxFWLAgy3zpdpZZN2nAdNF4Tup8Jixt2h
 4SSRWCYx0QK+vH4UWJuz7e+T6+U/Ed4fZZ268VS/llB7DRux4SHmb7b8T+P1nKo3DvnXELHZJqv
 1jXZ8hHZAV5NZdw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The kernel test robot reports the following error when building on
Hexagon with hexagon-allmodconfig.

ERROR: modpost: "__hexagon_divdi3"
[drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.ko] undefined!

The error is caused by using DIV_ROUND_UP() with a 64 bits divisor with
a 32-bit dividend, which on Hexagon and clang-17 is resolved with a call
to the __hexagon_divdi3() helper function, part of the compiler support
library and not available when building Linux.

Use DIV_ROUND_UP_ULL() to fix the build error and avoid calling the
__hexagon_divdi3() helper function.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505101334.UHxNcUUO-lkp@intel.com/
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Hi Hans,
   this should likely be fast-tracked to land in v6.16 with the Amlogic
C3 ISP support.

Thanks
---
 drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
index f92815ffa4ae..1011ab3ebac7 100644
--- a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
+++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -321,7 +322,7 @@ static void c3_mipi_csi_cfg_dphy(struct c3_csi_device *csi, s64 rate)
 	u32 settle;
 
 	/* Calculate the high speed settle */
-	val = DIV_ROUND_UP(1000000000, rate);
+	val = DIV_ROUND_UP_ULL(1000000000, rate);
 	settle = (16 * val + 230) / 10;
 
 	c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL,

---
base-commit: 3328eb4dfec23cb3055cda24087cd1cdee925676
change-id: 20250510-amlogic-div64-div-6d0d5a6ec566

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>

