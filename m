Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799163;
	b=VxEGZTgzooHG49PDnzB7H4pFZ0CirZdoCZTK0XJU/j38zqf0myo8tyw0Ev6fk4C89hFx
	 +7nxAvmQD4Azk/AT9jbh5v/NrCfau9z+la2ImPoLOxYpGFe3zdkDBdpwnPAq1r0+Dkrvg
	 AAje05eT4qlsfGE5Udh1ERIxTe7+4YDRo/i/0d4xyi8QlCuT7SGMjEG5Dd4CyKH2YhyEH
	 BUqucb7xK8DZvz+mavBxDQ9UPc/qjg0v8RfMLeMTh0VSMV1kLZ+lGiwMwufH0g0Q7M5wZ
	 Xf4j1wo2hm3F7JFo7ZgvtYNEb3Ms7oSLb4PFiHjrmjhofaK5w8EWsc9B//NvNwfYKYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
	b=KW4N/fJjLDvb+x2Mdy3JDVauRNIujc5ZY8Xh/vy/p2eEEojZC3B/CHwIrK3fV8O7Z8QH
	 8eJDXPYvLT0SGCVzFr/rV5ToPSNkFI8s4jpz+FH1gaJntiSNzTvvIipOnHSqOfjAVIejX
	 ybHPZ6WTzxheqTHvv/eMkFWEL9WG4BgxKOjX1T3ZbKW4I0EYOc1pzUHp7iGdUDGgiDEK2
	 ja6Q6cmNxa3B/qj36ok1QatGJCikBkRemRt51wAH3K9lo3gIIMjs6NC3k2yyzWUjMApG/
	 qAq3cGRcOqxkAumrJl/YAxkWHfYJFmTrzbazWYVIn0RnERoF92koKr0gkj5GKXIKd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5cYHGNV;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A392606A326
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 13:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A392606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5cYHGNV
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso571194b3a.1
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 05:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799149; x=1794403949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
        b=x5cYHGNVA6rY23Nmz2EH4hZ8u9pBnNqhqRQXKY6On3AM7jlqfWTFM5L1H8rzcW/kGL
         mXxhJ90aOJiqXGoa2ZXstjz3joIjdlGzz/46Qyz+vOEXzXh0T2cdJcYwVFI8w+cu6Vak
         /hnQxmxyG/VoIdemUsRPNtD3Od1dbaAbD6MBmLEEy51biaqCabOQbVdhuKKgmu3kYRBs
         zw3FfQdTy5K+bPoOELuFyh4EqGyThL/RWO8UEtwaiD+oUeJOeXveTbjvSanJMFE3V8Uq
         NG7ruklEOQj3Wg+WwziOZK0JgsF5XdFVxBmuLxuDkW7u5Kr0abDeFOS7hs0b1N0N7/XB
         LTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799149; x=1794403949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hsId2+DpgTtxye1Yv6HPoaQDim7S8FopzLEymWWnRm0=;
        b=rbj4/HFB/fPZBo61+7NPbT/YL7zxIB4f5f/oq5+7sGScZ0EfoiGYyPaHL1e98leMR7
         3UX1q2og7EudaZrtLkzofehygPiscE9CRDvIzXEqKqCSLvUfn6aejOMmTZNIPZ1pNTtt
         yiF7eKhB7kpvNqpsE7ws1G46JZoze8NRLrG29lNQ4UZaKwOwtHzexQdrEQW/sRA2/9bj
         7/WgcpRbhrSFXJ6v/saVtmmgdIiAtDkv0augqANx/ADntSdoTY5HOunr0G5w6PTMafNb
         uKcccTNOpj3JVAg+eQWHraYZ8vJ7u0OBXvQlsHzLynO7JJAOYzqTIubzvLywGqroUqtG
         CBHg==
X-Forwarded-Encrypted: i=1; AKwUvBxMQXZZEyQ3qCYmSVwJnEGCwDSnttcd9JCiStn/Uijv6Af1vAp2R/kSbcVi5arFd5UCSMZF@lists.linux.dev
X-Gm-Message-State: APuU4Z+1SF/WB/rdOml+diZuiD1Qit+PJx532md1eDfmDFLdyclaJkhA
	J0W4+MAe3N1GRm6OZVRW39scEAIKtg/DrAODlBkKFWzH6eex5U0H2bSt
X-Gm-Gg: AYBFou3KNmQAHYG06YvMU+qVjSnrMss34QdK/sdHmkVnUdnx7yg1Jutr8V8+ixgz2St
	nhXf5OVJcMzjgOJvRefaxNJLC+lMQMT5hf7QnhNMmvbjuK9AEK1giVVH2X99kF+hYr0ap/GzCPo
	jdcC7/sDML9e0w2qMWVXvknQZ24o/pV30lYarMJecAiiQzNme3BYj8OWVMLbXGE/dDRVCh93QQ2
	tswgA2MQcmwu/ryCFCXcZAZ31Y7N9XUVCaghXfBEWFlqomwZksuHD7eq9nM3VrRZWsBD++P67qx
	LVASJBTxx05k8CBmkq4mibtqSQb/P/8cJKnaRRnangiOA8mvYUT4zLSWKcEl5qZ9Ij/Rhm35AUE
	Ftcae01EMZ4LQta0RuY1k7TZkfeyyU0PhAmTeYcyfD+Lo3RzU9hUlovBItLXg2s92GNtmwKTbor
	NUHJPxJ1lQ3PCEPys3VyhI9dINiPk2qPJwvlFkNUPn/8qMaAeHtAPcJzQHPwLBCU6VH1bG8FtDC
	O2WqKr/yERsqN7s5aFEljN8EBgyqBa0LCGyRhLYj8VHE840YNlfuBIMkeOGwA22/c6PqDzJNyS5
	YbL+etdNvTNgMCAFyDGJlyTBCp1dHVUO+P3JLOnovZqS5pZqKw==
X-Received: by 2002:a05:6a00:4694:b0:897:ffff:c18a with SMTP id d2e1a72fcca58-8b17e72e134mr369429b3a.7.1793799149518;
        Wed, 04 Nov 2026 05:32:29 -0800 (PST)
Received: from anatasluo-Precision-5560 ([139.226.166.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7ce84fsm911369b3a.13.2026.11.04.05.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:32:29 -0800 (PST)
From: Longjun Luo <luolongjuna@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	song@kernel.org,
	puranjay@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longjun Luo <luolongjuna@gmail.com>
Subject: [RFC PATCH v2 03/11] objtool/klp: Preserve identifier digits when stripping suffixes
Date: Wed,  4 Nov 2026 21:31:49 +0800
Message-ID: <20261104133158.3187525-4-luolongjuna@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104133158.3187525-1-luolongjuna@gmail.com>
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name tx.crc32 loses its trailing digits, while tx.crc32.llvm.<hash>
keeps them because of an early return. ThinLTO promotion can therefore
break correlation and copy existing static state into the patch.

Strip LLVM hashes and complete .<number> suffixes on the same path.
Keep the counter-stripping rule for __UNIQUE_ID names, including
Clang's function-prefixed names.

Add a ThinLTO test which checks that the existing crc32 state is reused.
The available objtool tests pass with GCC 16.2.1 and Clang 22.1.8.

Fixes: 0d83da43b1e1 ("objtool/klp: Add --checksum option to generate per-function checksums")
Fixes: 020b71dcafee ("objtool/klp: Remove .llvm suffix in demangle_name()")
Assisted-by: LLM
Signed-off-by: Longjun Luo <luolongjuna@gmail.com>
---
 tools/objtool/elf.c                           | 33 +++++++++++--------
 .../fixtures/identity/promotion_crc32.c       |  8 +++++
 .../fixtures/identity/promotion_crc32_user.c  | 15 +++++++++
 .../generic/test-identity-thinlto-crc32.sh    | 23 +++++++++++++
 4 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
 create mode 100644 tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
 create mode 100755 tools/objtool/tests/generic/test-identity-thinlto-crc32.sh

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 71f1a272e468..3ddbf5143260 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -448,32 +448,39 @@ static int read_sections(struct elf *elf)
  */
 static ssize_t demangled_name_len(const char *name)
 {
-	ssize_t idx;
+	ssize_t idx, len;
 	const char *p;
 
 	p = strstr(name, ".llvm.");
-	if (p)
-		return p - name;
+	len = p ? p - name : strlen(name);
 
-	if (!strstarts(name, "__UNIQUE_ID_") && !strchr(name, '.'))
-		return strlen(name);
+	if (strstarts(name, "__UNIQUE_ID_") || strstr(name, ".__UNIQUE_ID_")) {
+		for (idx = len - 1; idx >= 0; idx--) {
+			char c = name[idx];
 
-	for (idx = strlen(name) - 1; idx >= 0; idx--) {
-		char c = name[idx];
+			if (!isdigit(c) && c != '.' && c != '_')
+				break;
+		}
+		return idx + 1;
+	}
+
+	while (len && isdigit(name[len - 1])) {
+		p = name + len - 1;
+		while (p > name && isdigit(*p))
+			p--;
 
-		if (!isdigit(c) && c != '.' && c != '_')
+		if (p == name || *p != '.')
 			break;
+		len = p - name;
 	}
-	if (idx <= 0)
-		return strlen(name);
-	return idx + 1;
+	return len;
 }
 
 /*
  * Remove number suffix of a symbol.
  *
- * Specifically, remove trailing numbers for "__UNIQUE_ID_" symbols and
- * symbols with '.'.
+ * Remove complete .<number> suffixes and trailing numbers from
+ * "__UNIQUE_ID_" symbols.
  *
  * With CONFIG_LTO_CLANG_THIN, it is possible to have nested __UNIQUE_ID_,
  * such as
diff --git a/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
new file mode 100644
index 000000000000..d95914eacdc0
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+unsigned int tx(unsigned int value)
+{
+	static volatile unsigned int crc32;
+
+	return crc32 += value;
+}
diff --git a/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
new file mode 100644
index 000000000000..b44fa1d4a75e
--- /dev/null
+++ b/tools/objtool/tests/generic/fixtures/identity/promotion_crc32_user.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com> */
+#include "common.h"
+MODINFO;
+
+unsigned int tx(unsigned int value);
+
+unsigned int target(unsigned int value)
+{
+#ifdef PATCHED
+	return tx(value);
+#else
+	return value;
+#endif
+}
diff --git a/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh b/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh
new file mode 100755
index 000000000000..66988d0b7692
--- /dev/null
+++ b/tools/objtool/tests/generic/test-identity-thinlto-crc32.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026 Longjun Luo <luolongjuna@gmail.com>
+# ThinLTO promotion must retain the digits in a static variable's name.
+. "$(dirname "$0")/../identity-lib.sh"
+
+setup
+build_identity_pair thin "" identity/promotion_crc32.c identity/promotion_crc32_user.c
+in_symbols orig.o | awk '$4 == "OBJECT" && $5 == "LOCAL" && $8 == "tx.crc32"' |
+	grep -q . || probe_skip "CRC state was not local before importing"
+in_symbols patched.o | awk '$4 == "OBJECT" && $5 == "GLOBAL" && $8 ~ /^tx\.crc32\.llvm\.[0-9]+$/' |
+	grep -q . || probe_skip "ThinLTO did not promote the CRC state"
+
+assert_checksum_matches tx
+run_diff
+assert_patched target
+assert_not_patched tx
+out_symbols | awk '$4 == "OBJECT" && $7 != "UND" && $8 ~ /^tx\.crc32(\.|$)/' |
+	grep -q . && fail "promoted CRC state was allocated again"
+run_post_link
+assert_original_reference target tx.crc32
+
+pass "digits in static names survive ThinLTO promotion"
-- 
2.55.0

