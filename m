Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9C2D8793;
	Tue, 24 Mar 2026 19:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380086; cv=none; b=WoSpCfWSIV9X5Hdnf2np2w4IeLfOcPZKL62SVxudY/Wa/76fNIwIrYKnB4H2XzaVDzD06pSShxCiNylTytv4atvIYNIrOsMau25tdKV1IKsLljpa4OFdzT5h5fBLi8kDY3seL4LutIejwSn0fWoAdeENutYaY4xQ6PNEh2WtN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380086; c=relaxed/simple;
	bh=LkVASFfCf3ATBdOe3sx0A83ERlebruwDar/b1NTj974=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=il9U+K/o1dpqrZRV40SVL4uIxU1pWMZkGxj9BnDKvqDmsusBVOqOQdkWgtTvYm7OQe9bmbcFwD0AtOWutYi3XpLPHA4MnkGVUwvf55OTBcomGllmjWpbvSVGJ2g6ziLcAFiKEczjyYXbX+2GG4r5aarSqXS+TXCU4YHNiwzFfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8bPnfBq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8bPnfBq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DB2C19424;
	Tue, 24 Mar 2026 19:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774380085;
	bh=LkVASFfCf3ATBdOe3sx0A83ERlebruwDar/b1NTj974=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8bPnfBq9VTFFDhki9TexzbB01kz8x4c5fusIc4O51BP3nWQvYQSj/I66505ND0M4
	 WMXKDcfR+L/VJLusElCgjf4b2wlv0vm8B1KSKdk0w/1cQFCf7OiDgisjqzitre7hZI
	 kMrKb2rEJ1S7B/wunfktWFBpNRyexcVEghOEHJsR1sBAMCy14AiKN+NzCxtd80ip8d
	 i8rbsk4sm/k5jhZdgTrwgqduKeeDxyv02f01gMhLMaBqJ8zoM00y0qPxJU5fcpRN72
	 fcjfV+Av+eJ2VZ3bTaSs/ctY11OcD0XfXVspwCfka7vEG3MpuP1yhHO+kKXYu4sZgq
	 NBUfpoOo/NUjw==
From: Arnd Bergmann <arnd@kernel.org>
To: Sebastian Reichel <sre@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] HSI: omap_ssi_port: skip useless NULL pointer check
Date: Tue, 24 Mar 2026 20:21:15 +0100
Message-Id: <20260324192120.2959891-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

ssi->port is no longer dynamically allocated, so there is now a warning
from clang about the check being always true:

drivers/hsi/controllers/omap_ssi_port.c:1121:12: error: address of array 'ssi->port' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
 1121 |         if (!ssi->port || !omap_ssi->port) {

Remove it, as was done in the hsi core code.

Fixes: e61af3ca8933 ("hsi: hsi_core: use kzalloc_flex")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hsi/controllers/omap_ssi_port.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/controllers/omap_ssi_port.c
index 50dde968febe..73932d7257d3 100644
--- a/drivers/hsi/controllers/omap_ssi_port.c
+++ b/drivers/hsi/controllers/omap_ssi_port.c
@@ -1118,7 +1118,7 @@ static int ssi_port_probe(struct platform_device *pd)
 
 	dev_dbg(&pd->dev, "init ssi port...\n");
 
-	if (!ssi->port || !omap_ssi->port) {
+	if (!omap_ssi->port) {
 		dev_err(&pd->dev, "ssi controller not initialized!\n");
 		err = -ENODEV;
 		goto error;
-- 
2.39.5

