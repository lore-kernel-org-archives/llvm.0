Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9152F17C7C
	for <llvm@lists.linux.dev>; Wed, 24 Apr 2024 02:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713925701; cv=none; b=c6D2H6mhGUVUtEV1RwdOhDzLgZFlosYmMKhuIhRSff18h1faMdbPUrf9t6y7X14wlJ3VYidhaxPxTNP3I10yQ2FBAeFWMvJmnWQBgA1DYtawwv+j6axYuuLBCxIgXOE2hhvm5vb/Jw/cb4Voy8xuZgG17fS7guF0Z7i1rpanEr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713925701; c=relaxed/simple;
	bh=53lcTeRvvpcYAQU46xMUesg77FmlT96Wq1XtqskvJ8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aqF0T/W/rsC3j8bLrpJeDD+RKYKak1YpYevMh62r1Q/11NjlyMrQApZMmeZSDZ1208qxPzEtnfl9qKpI4n2hI3lh0HNO/v9kmexhKrqO96AdvGqcHYuA/HoBln9Z09b1jzU5VepR80OaVUsA5Ez/nOcwdCZY6iML8aPwyiX0mcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id A58BD6019C09D;
	Wed, 24 Apr 2024 10:28:12 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	jerinj@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	sumang@marvell.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] octeontx2-af: fix the double free in rvu_npc_freemem()
Date: Wed, 24 Apr 2024 10:27:25 +0800
Message-Id: <20240424022724.144587-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang static checker(scan-build) warning：
drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c:line 2184, column 2
Attempt to free released memory.

npc_mcam_rsrcs_deinit() has released 'mcam->counters.bmap'. Deleted this
redundant kfree() to fix this double free problem.

Fixes: dd7842878633 ("octeontx2-af: Add new devlink param to configure maximum usable NIX block LFs")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
index be709f83f331..e8b73b9d75e3 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c
@@ -2181,7 +2181,6 @@ void rvu_npc_freemem(struct rvu *rvu)
 
 	kfree(pkind->rsrc.bmap);
 	npc_mcam_rsrcs_deinit(rvu);
-	kfree(mcam->counters.bmap);
 	if (rvu->kpu_prfl_addr)
 		iounmap(rvu->kpu_prfl_addr);
 	else
-- 
2.30.2

