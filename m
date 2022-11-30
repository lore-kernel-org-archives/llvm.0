Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C228EBE
	for <llvm@lists.linux.dev>; Wed, 30 Nov 2022 10:45:51 +0000 (UTC)
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4NMbT10wGfz67TN2;
	Wed, 30 Nov 2022 18:45:25 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 30 Nov 2022 11:45:48 +0100
Received: from mscphis00759.huawei.com (10.123.66.134) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 30 Nov 2022 10:45:47 +0000
From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
To: <jpoimboe@kernel.org>
CC: <peterz@infradead.org>, <nathan@kernel.org>, <ndesaulniers@google.com>,
	<trix@redhat.com>, <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<yusongping@huawei.com>, <hukeping@huawei.com>, <artem.kuzin@huawei.com>
Subject: [PATCH] objtool: Fix memory leakage
Date: Wed, 30 Nov 2022 18:45:44 +0800
Message-ID: <20221130104544.2789085-1-konstantin.meskhidze@huawei.com>
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
X-ClientProxiedBy: mscpeml100002.china.huawei.com (7.188.26.75) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected

This commit fixes potential memory leakage in
elf_create_section_symbol() function.

Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
---
 tools/objtool/elf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 7e24b09b1163..58f30840358f 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -776,6 +776,7 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
 
 		if (elf_update_symbol(elf, symtab, symtab_shndx, old)) {
 			WARN("elf_update_symbol move");
+			free(sym);
 			return NULL;
 		}
 
@@ -785,6 +786,7 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
 	sym->idx = new_idx;
 	if (elf_update_symbol(elf, symtab, symtab_shndx, sym)) {
 		WARN("elf_update_symbol");
+		free(sym);
 		return NULL;
 	}
 
-- 
2.25.1

