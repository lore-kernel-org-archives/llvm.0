Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC246AD
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 02:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: bizesmtp73t1701742630tlxdw301
Received: from localhost.localdomain ( [219.147.26.62])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 05 Dec 2023 10:16:14 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: k0mQ4ihyJQPgishzlGfWTZNfXN6f40onPWxHaDYCN1gveOrb8wvY1GV2C3fmO
	FdH3zNbGQFzov4jkdI7bl6fKtjXLTUgRvFuqAF19DnkDRognDl8nDtWCOKTpVIBr+wwjjG5
	O5uDuPeg3o06KxzZVC32mDakfdjDlgQGZxl872ouxCGWwtcOMhj8bFYuuj6HFzDFCi5b/su
	h0MxxWowiAaQS90XnSTU82rAatqMTungJQZqkAqAkZTioB3G6ERlTnE+kxNB6D4kwsu1y/e
	+Vaj2TKVgh6hPvzWefYS0AHJQBNvxxP7hTk0of5R3MveTvaupHOCrbjhirjBiF3zbqyH7A7
	CbFwtfrI0buvUCt22sGPhyDGIoyvOJuU1HpFPphhUIwVLJQj6RhkiYG8DDWpg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16628219759286156628
From: Jialu Xu <xujialu@vimux.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jialu Xu <xujialu@vimux.org>
Subject: [PATCH v2] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Tue,  5 Dec 2023 10:15:26 +0800
Message-Id: <20231205021523.4152128-2-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204165920.GA16980@dev-arch.thelio-3990X>
References: <20231204165920.GA16980@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:vimux.org:qybglogicsvrgz:qybglogicsvrgz5a-1

When symbolic links are involved in the path, os.path.abspath might not
resolve the symlinks and instead return the absolute path with the
symlinks intact.

Use pathlib.Path resolve() instead of os.path.abspath()

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 scripts/clang-tools/gen_compile_commands.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 180952fb91c1b..99e28b7152c19 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -11,6 +11,7 @@ import argparse
 import json
 import logging
 import os
+from pathlib import Path
 import re
 import subprocess
 import sys
@@ -172,8 +173,9 @@ def process_line(root_directory, command_prefix, file_path):
     # by Make, so this code replaces the escaped version with '#'.
     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
 
-    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
-    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
+    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
+    # Convert Path object to a string because 'PosixPath' is not JSON serializable.
+    abs_path = str(Path(root_directory, file_path).resolve())
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
     return {
-- 
2.39.2

