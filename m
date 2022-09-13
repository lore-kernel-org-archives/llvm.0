Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B61FCC
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 04:08:00 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id c198so10538322pfc.13
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=uanTL/bnlnJQgtwLSfczwro/TOgawj0bo0VSuHyRExY=;
        b=JU55qWJrfeyP7wqdi4/cRVYzu3Wvwk7795MkaSzl3FdPBVd4tVxZYavpqgmwX8bhOy
         rmI1DHkRI4yVesK6KXj5mtNXZtJ7suOtXoRocMN6YxyyGvtM/WlwWHASMYiJiB4wcuI6
         kuGFw78+7Z//nn8A9PVciWPEdC2xAw3aogApfCGyMd2pEViwmreAfgQcOodbgMBEGnMd
         OmZ9dGg0s8LEtqSrzSnuaNmEgPucpv/2SoE5TA/VjP1ZUEPhQwsnUWKwyZxsEsyuFA75
         vu+zZM8pp8z4/1yv/USZ8qkskdJ35jM28/3Q4d2gYVPYszj7cOtHtA/l4vjZh6pSdCbq
         PScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uanTL/bnlnJQgtwLSfczwro/TOgawj0bo0VSuHyRExY=;
        b=G4XVTrvqezV2Wv3RgSGdUuDLmBDdScddwYLKmqUVp19VUy6zli0ACLx5alcVwewadD
         CAzkuZ5tCpVe6Ix/PaA0sBBpeX/7E20pVGal22z/qgers4D8mkFBmgEhVBgueYVm70Rw
         Z5ozKqg4h3Zp050du/g5But2/6pYm4HtlXeAegQBahlaCbseuq/qI0YTUkGCIY921Gks
         gSRtkpDLEO/Dk0RsV/hI8z3FUcP6sOXDMu496fX+0dPx7NES3x0xx8mp37Xyr9pFt/dc
         ZnfnNo8xFQh78mBld++hDQcKp5nAmRU5dLtA6gmhmk6i1zfpJGOkmcj5ORiCTz810PRa
         S50Q==
X-Gm-Message-State: ACgBeo2bq24/58M96gXwA2TZ/0orU8F8/3HkCp+yZBEm/Fo7HE0+e9P4
	HeTd3BcG/MmUdi7L5gWthGM=
X-Google-Smtp-Source: AA6agR4/xMwF86/vhkCVQNrVEoewuWVBH6r7FuJxQXObbFKVigvTNAX2ev/s3+msuPyfEP1b9dxdRA==
X-Received: by 2002:a63:9042:0:b0:438:8ef2:2476 with SMTP id a63-20020a639042000000b004388ef22476mr16382111pge.55.1663042080401;
        Mon, 12 Sep 2022 21:08:00 -0700 (PDT)
Received: from ubuntu-jammy.. ([61.16.102.77])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902654700b0017691eb7e17sm6877641pln.239.2022.09.12.21.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 21:07:59 -0700 (PDT)
From: yangxingwu <xingwu.yang@gmail.com>
To: nathan@kernel.org
Cc: ndesaulniers@google.com,
	trix@redhat.com,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yangxingwu <xingwu.yang@gmail.com>
Subject: [PATCH] scripts/clang-tools: remove unused module
Date: Tue, 13 Sep 2022 04:07:52 +0000
Message-Id: <20220913040753.2198-1-xingwu.yang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused imported 'os' module

Signed-off-by: yangxingwu <xingwu.yang@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 1337cedca..bb78c9bde 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,7 +12,6 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
-import os
 import subprocess
 import sys

--
2.37.2

