Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D61C171A0
	for <llvm@lists.linux.dev>; Mon,  5 Jun 2023 11:20:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q68GL-0003m5-19; Mon, 05 Jun 2023 13:20:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q68GK-005G7Q-4P; Mon, 05 Jun 2023 13:20:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q68GJ-00BNMZ-7a; Mon, 05 Jun 2023 13:20:35 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Li Yang <leoyang.li@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel@pengutronix.de,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] bus: fsl-mc: fsl-mc-allocator: Initialize mc_bus_dev before use
Date: Mon,  5 Jun 2023 13:20:24 +0200
Message-Id: <20230605112025.80061-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=c6bJ2ay5Rd48NgkuUkmtQ3ctU95uZds+wP3O7QXgqjE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkfcT3WoV9/4ClH+99osCsQZT1sNqjx+MC9tL5m S3TFV3l0ZGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH3E9wAKCRCPgPtYfRL+ TiP4B/9JfNY9jYUBzOzHl1+OEEEBUVuuH7CN/1WXNljG4uV9//brOqKUpidsC4v/eBl5t/1b5+f VbFJhu9yabAvap7+4dzjNv+/vAlacjCOd0bzvLUq2ZDHbppDDcjJAJi6YRC8Tj4S5S8Wy8Vrfpi PsPLi2Mndl8vVdOsyl3KoibnDSM3kUi0aB9ntMElteQhDLiiXcqtszvfdtWcYkpeExi6qepHAmK bBLuTztJGFH1m/9+U35ohRkdaLHq9dla+/O8s3rOB/fn3XSPFSgjlo05lV+p1vD0oWnXmudz7mQ dN9TPx6og3FfrGApIQEbBAgdNi28azHOB1O/rO7nNd+Rb49c
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev

Fixes a clang compiler warning:

>> drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus_dev' is uninitialized when used here [-Wuninitialized]
                   dev_err(&mc_bus_dev->dev, "resource mismatch\n");

Fixes: b3134039c5b3 ("bus: fsl-mc: fsl-mc-allocator: Improve error reporting")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306021936.OktTcMAT-lkp@intel.com/
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/bus/fsl-mc/fsl-mc-allocator.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
index 0ad68099684e..991273f956ce 100644
--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -103,14 +103,15 @@ static int __must_check fsl_mc_resource_pool_remove_device(struct fsl_mc_device
 	struct fsl_mc_resource *resource;
 	int error = -EINVAL;
 
+	mc_bus_dev = to_fsl_mc_device(mc_dev->dev.parent);
+	mc_bus = to_fsl_mc_bus(mc_bus_dev);
+
 	resource = mc_dev->resource;
 	if (!resource || resource->data != mc_dev) {
 		dev_err(&mc_bus_dev->dev, "resource mismatch\n");
 		goto out;
 	}
 
-	mc_bus_dev = to_fsl_mc_device(mc_dev->dev.parent);
-	mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	res_pool = resource->parent_pool;
 	if (res_pool != &mc_bus->resource_pools[resource->type]) {
 		dev_err(&mc_bus_dev->dev, "pool mismatch\n");

base-commit: 59272ad8d9e8ea6398a96f8c6d62da284bf2ae6e
-- 
2.39.2

