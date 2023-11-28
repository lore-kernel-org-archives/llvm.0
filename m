Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D206C10EE
	for <llvm@lists.linux.dev>; Tue, 28 Nov 2023 01:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 946E9604B3FD4;
	Tue, 28 Nov 2023 09:45:36 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: alexander.usyskin@intel.com,
	tomas.winkler@intel.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3] misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
Date: Tue, 28 Nov 2023 09:45:08 +0800
Message-Id: <20231128014507.418254-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static analyzer complains that value stored to 'rets' is never
read.Using 'goto err' to go to the error path and fix this problem.

Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
v3: 
 - using 'goto err' rather than 'buf_len=-EOVERFLOW'.(Thanks to Sasha)

v2:
 - split v1 patch to different patches
https://lore.kernel.org/all/20231120095523.178385-2-suhui@nfschina.com/

v1:
https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/

 drivers/misc/mei/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
index 7ea80779a0e2..0489bec4fded 100644
--- a/drivers/misc/mei/client.c
+++ b/drivers/misc/mei/client.c
@@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
 	hbuf_slots = mei_hbuf_empty_slots(dev);
 	if (hbuf_slots < 0) {
 		rets = -EOVERFLOW;
-		goto out;
+		goto err;
 	}
 
 	hbuf_len = mei_slots2data(hbuf_slots) & MEI_MSG_MAX_LEN_MASK;
-- 
2.30.2

