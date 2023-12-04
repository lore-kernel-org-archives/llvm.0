Received: from bg2.exmail.qq.com (bg2.exmail.qq.com [114.132.63.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB02101EE
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vimux.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=vimux.org
X-QQ-mid: bizesmtp90t1701686533t9w18dy6
Received: from localhost.localdomain ( [112.6.196.165])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 04 Dec 2023 18:42:10 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: ZdHcY4j9T+I4a9YN8Gv8XPmWt4O1cvJndJZZex7Xb7xsJrCqjKY4egbNCxmRi
	D96ArEymkCRQjw6F64Nbn5aVHKh4RDRQYSo68gXBQow0mmylNPEGaFP0ngOh5JbocUGQBzS
	5RjS4vS66FL7R9Qa7l9O/U5Ad1YI23Nzp6Wrq+wupOg5Lg6uFyO0JCq7SshpgwILAXdxmj2
	GsNDkCpQRnTr0V4l/pjeMVCOKyA3NoesngcY7+oebuOaVC+p/kpVzKKB640LD6BSf3ZGWXt
	eJQv9Zelnt554Ope6Ynn81h2AQ/KzctOJorfg6gZXmTPGmyHm9s+ejA8JTpXziUBmAsdw28
	OQ+B2ngRHObnR14Md0=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 72683575249682803
From: Jialu Xu <xujialu@vimux.org>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jialu Xu <xujialu@vimux.org>
Subject: [PATCH] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Mon,  4 Dec 2023 18:41:42 +0800
Message-Id: <20231204104141.3618547-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
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

use pathlib.Path resolve() instead of os.path.abspath()

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 scripts/clang-tools/gen_compile_commands.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 180952fb91c1b..0a6c0996b4a8f 100755
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
@@ -172,8 +173,8 @@ def process_line(root_directory, command_prefix, file_path):
     # by Make, so this code replaces the escaped version with '#'.
     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
 
-    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
-    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
+    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
+    abs_path = str(Path(os.path.join(root_directory, file_path)).resolve())
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
     return {
-- 
2.39.2

