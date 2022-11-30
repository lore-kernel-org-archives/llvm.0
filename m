Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05257C
	for <llvm@lists.linux.dev>; Wed, 30 Nov 2022 02:36:43 +0000 (UTC)
Received: from fraeml743-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NMNcd5XrBz67Q9H;
	Wed, 30 Nov 2022 10:36:17 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml743-chm.china.huawei.com (10.206.15.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 03:36:40 +0100
Received: from mscphis00759.huawei.com (10.123.66.134) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 30 Nov 2022 02:36:39 +0000
From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
To: <jpoimboe@kernel.org>
CC: <peterz@infradead.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
	<trix@redhat.com>, <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<yusongping@huawei.com>, <hukeping@huawei.com>, <artem.kuzin@huawei.com>
Subject: [PATCH] objtool: Fix memory leakage
Date: Wed, 30 Nov 2022 10:36:35 +0800
Message-ID: <20221130023635.2665668-1-konstantin.meskhidze@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.134]
X-ClientProxiedBy: mscpeml100001.china.huawei.com (7.188.26.227) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected

This commit fixes memory leakage in handle_group_alt() function.

Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 43ec14c29a60..2689098e9bad 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1569,6 +1569,7 @@ static int handle_group_alt(struct objtool_file *file,
 				     sizeof(struct cfi_state *));
 	if (!orig_alt_group->cfi) {
 		WARN("calloc failed");
+		free(orig_alt_group);
 		return -1;
 	}
 
@@ -1603,6 +1604,7 @@ static int handle_group_alt(struct objtool_file *file,
 		nop = malloc(sizeof(*nop));
 		if (!nop) {
 			WARN("malloc failed");
+			free(new_alt_group);
 			return -1;
 		}
 		memset(nop, 0, sizeof(*nop));
-- 
2.25.1

