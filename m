Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DF3D92
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 17:06:24 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LnQDR1fGxz685PJ;
	Wed, 20 Jul 2022 01:04:39 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Jul 2022 19:06:21 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <quentin@isovalent.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <song@kernel.org>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<terrelln@fb.com>, <nathan@kernel.org>, <ndesaulniers@google.com>
CC: <bpf@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Roberto Sassu
	<roberto.sassu@huawei.com>
Subject: [PATCH 4/4] build: Switch to new openssl API for test-libcrypto
Date: Tue, 19 Jul 2022 19:05:55 +0200
Message-ID: <20220719170555.2576993-4-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719170555.2576993-1-roberto.sassu@huawei.com>
References: <20220719170555.2576993-1-roberto.sassu@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected

Switch to new EVP API for detecting libcrypto, as Fedora 36 returns an
error when it encounters the deprecated function MD5_Init() and the others.
The error would be interpreted as missing libcrypto, while in reality it is
not.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 tools/build/feature/test-libcrypto.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/build/feature/test-libcrypto.c b/tools/build/feature/test-libcrypto.c
index a98174e0569c..bc34a5bbb504 100644
--- a/tools/build/feature/test-libcrypto.c
+++ b/tools/build/feature/test-libcrypto.c
@@ -1,16 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <openssl/evp.h>
 #include <openssl/sha.h>
 #include <openssl/md5.h>
 
 int main(void)
 {
-	MD5_CTX context;
+	EVP_MD_CTX *mdctx;
 	unsigned char md[MD5_DIGEST_LENGTH + SHA_DIGEST_LENGTH];
 	unsigned char dat[] = "12345";
+	unsigned int digest_len;
 
-	MD5_Init(&context);
-	MD5_Update(&context, &dat[0], sizeof(dat));
-	MD5_Final(&md[0], &context);
+	mdctx = EVP_MD_CTX_new();
+	if (!mdctx)
+		return 0;
+
+	EVP_DigestInit_ex(mdctx, EVP_md5(), NULL);
+	EVP_DigestUpdate(mdctx, &dat[0], sizeof(dat));
+	EVP_DigestFinal_ex(mdctx, &md[0], &digest_len);
+	EVP_MD_CTX_free(mdctx);
 
 	SHA1(&dat[0], sizeof(dat), &md[0]);
 
-- 
2.25.1

