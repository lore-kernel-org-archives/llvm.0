Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED117EC
	for <llvm@lists.linux.dev>; Mon, 22 Aug 2022 09:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D73C433C1;
	Mon, 22 Aug 2022 09:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661159806;
	bh=bzquj3qt1EtQk+OChulRIFKTfQUr9RSZAGXRtx/8tCI=;
	h=Subject:To:Cc:From:Date:From;
	b=BIgGa/hyKWniZwYLx4Bfylc8piDZyxltOo9vQOG+ETPHZ1JTyXII5S+J2u36oFVco
	 t10Qttj5iDdQKeUCKb3IsWC8vFLI0X5EPmBSmdXA9RombBTtzo1D5qjLNjiA6ZOA0s
	 NT/uB81O0gBCYf5+uLOkPXjzEgJLl3NQd+vzLNvU=
Subject: Patch "tools build: Switch to new openssl API for test-libcrypto" has been added to the 5.19-stable tree
To: acme@redhat.com,andrii@kernel.org,ast@kernel.org,daniel@iogearbox.net,gregkh@linuxfoundation.org,john.fastabend@gmail.com,kpsingh@kernel.org,llvm@lists.linux.dev,martin.lau@linux.dev,mingo@redhat.com,nathan@kernel.org,ndesaulniers@google.com,peterz@infradead.org,quentin@isovalent.com,roberto.sassu@huawei.com,sdf@google.com,song@kernel.org,terrelln@fb.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 22 Aug 2022 11:16:05 +0200
Message-ID: <16611597657271@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    tools build: Switch to new openssl API for test-libcrypto

to the 5.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     tools-build-switch-to-new-openssl-api-for-test-libcrypto.patch
and it can be found in the queue-5.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 5b245985a6de5ac18b5088c37068816d413fb8ed Mon Sep 17 00:00:00 2001
From: Roberto Sassu <roberto.sassu@huawei.com>
Date: Tue, 19 Jul 2022 19:05:55 +0200
Subject: tools build: Switch to new openssl API for test-libcrypto

From: Roberto Sassu <roberto.sassu@huawei.com>

commit 5b245985a6de5ac18b5088c37068816d413fb8ed upstream.

Switch to new EVP API for detecting libcrypto, as Fedora 36 returns an
error when it encounters the deprecated function MD5_Init() and the others.

The error would be interpreted as missing libcrypto, while in reality it is
not.

Fixes: 6e8ccb4f624a73c5 ("tools/bpf: properly account for libbfd variations")
Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: llvm@lists.linux.dev
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nick Terrell <terrelln@fb.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Quentin Monnet <quentin@isovalent.com>
Cc: Song Liu <song@kernel.org>
Cc: Stanislav Fomichev <sdf@google.com>
Link: https://lore.kernel.org/r/20220719170555.2576993-4-roberto.sassu@huawei.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/build/feature/test-libcrypto.c |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

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
 


Patches currently in stable-queue which might be from roberto.sassu@huawei.com are

queue-5.19/tools-build-switch-to-new-openssl-api-for-test-libcrypto.patch
