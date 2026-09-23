Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5004A2A72
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 14:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173389; cv=none; b=C7hjV/jP64oPIjScK+WK0GvbaAmaVSAFzlOQ6L7DGcOxYpDtyWQ//oSzL6ic+MYKEhg4k04e2DXw6eYCbfxVlqsCB9cutFkbcjGBeZworWwFsuL6iHS9qo2HwTYC5XsBboTsD1yd9IDn45LAl4hhrKfjaqb1rk5U2db1DDLfC5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173389; c=relaxed/simple;
	bh=vHF/4Rebpf1RbmlVp0v2ZLMX/ypaFMtdvlrlz1+PRak=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=WFNj8g/iUf4WgM3IpGwDU8XzmtkYTVz+fJMAy6bm/EE41tEAHVD6opoN7dhz5WLtiU/pvuh3cv4d3m6czNJ0BAvsxottcPLMruPRyIv/NxlPpW1p5eDSeLhMbaRPvfxZHTV2YGbHsEwOnRFFUDvpeh4W+noRJWUQ3TAltPMA53U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1RAt6UB; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1RAt6UB"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so424759b3a.2
        for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 07:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790173387; x=1790778187; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOAfnEJCG2dfje1lhj2D/yy4s3DfFqXgRx5oeJiylnY=;
        b=b1RAt6UBi0Lar/Bmprsq6wVXrSXFHDHx2jQ3X5Hwt3rMO8qjVQjwqbFgI0Her00fBw
         u1lIv3e0BenmQjyKOwS4DFxS+e/UMQRNZUNeACTNDfc5xuw5SylfhAEMZp8tJMEVr3xq
         UESBhNz1m9x7eXuFy0cUu2MkWsUW3dbB6i+Mdu3n+6MTFUUvrAas+8uVliwwKGv4SfSP
         EJyhF7Pr0tsy1dR02kQUH5a3HfF6Jtds20AHOQLeVGRFuAy3s6HnE6geVaMfiUz8K0im
         FhopezTJsGco6mlQqityTQySWrfkPQyQcuG8UM2ar2jVv93fjp3y6dmgkGTFCnUCnyDk
         0nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173387; x=1790778187;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hOAfnEJCG2dfje1lhj2D/yy4s3DfFqXgRx5oeJiylnY=;
        b=Iwvk7btK2PeMW8ZaXhO/ZJJ+cKbIqVwSfoLFSFtPKud4IdefSLc8O4dURaUhPqP7A2
         ZFJ1pNuhTlrfB4ks94wdBD/b8NuV40dAcNiDcEL+6/yYqt7eA9GDCeZAYfU54wYn+2bu
         Yc7+g1N9Ha9Nj+OJ0+7E/OJmAd17K8Mba+JG00REt5QfixWD+f/ukFQDUmFP6wbofWZK
         wDCWBUYkgj6Vc6y58DLm0ZTQQg42kMcAjdZxnFV3XqkwuwlKY6lbAW+Kb27U4FHnYdY3
         gVBWYqDKLlhTYjplFPiKFBALrOuafiPDkTqGWwe5ALp3KScxLI+K9g84aa5UujshBKel
         O9jQ==
X-Gm-Message-State: AFuF++mWmSadfnFJ3UFzUxM9NBqH56x6OJcPYJdOCQDkVL1D5I7aGFmO
	MSh0Qp0SFjvkp8m7agy7oFkp7Wu360jtXnKd5VyZ1cfA8B7qiwmebXdi
X-Gm-Gg: AYBFou134UpiwWulstNMaRV9B7s2MrbdZtd/KC3fnYP1criCq1PKjUPo7vv9e+TjHoV
	xMjwqiJNXfoz9Zx9nTA6bgczog8w/x+ZdpEIVBG67qNeDTum/x5jLk8SZtK49KoVfdCXaKkVFhx
	C10RAExN4UJvSwJ8swaafnzj2vfogYCA3PrQ+zn+FO/xZLDE88rC0KMtWChn2me9laItAgVCVQz
	uKBy3oe+oHLNKbT3dpFAxb6kD8zAlZdUk7EKRfHX7uVH3zyobned1YggGPPenqbnbefC4X8Yhw6
	13E93ouevJMptdFfizKaxqLOFsf2pSyx/5iAlZjcFH76+Qkz6nqq9ZtqFxQxFzNQ60bOnqya3+w
	aGX5WZAeHOxag2hBY51jciowmYknbjVmogQmxPPZKJnz7rTkUr953uryzYy0psRq92qAcULzDyn
	VpqSSXQgVQOLtYBok2OIhd6/APLxshz11LmFL01qQlQY0zzX2gkhKwXqT2KSFzFP1OfYk3pZDjt
	X7P0httTh8hb0trF//0KE9rwc1IwnA9bEFSIjHaJqr1y+qfw8hjxzql9J4G8HlpogIxzpCHCvoR
	lZN7CkiCnigyGDMibJJ1oaQ9leU5GOarFOaELHG5Cj45zw==
X-Received: by 2002:a05:6a00:3912:b0:874:705d:f63b with SMTP id d2e1a72fcca58-87d1c1c833dmr2392179b3a.29.1790173387247;
        Wed, 23 Sep 2026 07:23:07 -0700 (PDT)
Received: from [172.16.0.2] ([2a09:bac5:d58e:323::50:1d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fbbsm1403313b3a.52.2026.09.23.07.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:23:06 -0700 (PDT)
From: houtinghang <ue081723@gmail.com>
Date: Wed, 23 Sep 2026 22:22:59 +0800
Subject: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <179017337986.52388.7943687183785012868@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. When the analysis pool raises this
exception, the handler raises NameError instead of redirecting stdout
and exiting with status 1.

Import os and add a regression test that injects BrokenPipeError from
Pool.map(), then checks the redirection and exit status.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: houtinghang <ue081723@gmail.com>
---
Testing: python scripts/clang-tools/run-clang-tools_test.py -v
The test fails before the import with NameError and passes after it.
Tested with Python 3.13 on Windows using exception injection; no complete
kernel build or real clang-tidy pipeline test was performed.

AI disclosure: Codex found the missing import, wrote the fix and test,
ran the test, reviewed the diff, and drafted this message in response to
a request to find, fix, review and submit a Linux kernel bug.

 scripts/clang-tools/run-clang-tools.py      |  1 +
 scripts/clang-tools/run-clang-tools_test.py | 41 +++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 scripts/clang-tools/run-clang-tools_test.py

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys
 
diff --git a/scripts/clang-tools/run-clang-tools_test.py b/scripts/clang-tools/run-clang-tools_test.py
new file mode 100644
index 0000000..207b866
--- /dev/null
+++ b/scripts/clang-tools/run-clang-tools_test.py
@@ -0,0 +1,41 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Tests for run-clang-tools.py."""
+
+import importlib.util
+import os
+from pathlib import Path
+import unittest
+from unittest import mock
+
+
+spec = importlib.util.spec_from_file_location(
+    "run_clang_tools", Path(__file__).with_name("run-clang-tools.py"))
+run_clang_tools = importlib.util.module_from_spec(spec)
+spec.loader.exec_module(run_clang_tools)
+
+
+class TestRunClangTools(unittest.TestCase):
+    def test_broken_pipe_redirects_stdout_and_exits(self):
+        args = mock.Mock(path="compile_commands.json")
+        with mock.patch.object(run_clang_tools, "parse_arguments", return_value=args), \
+             mock.patch("builtins.open", mock.mock_open(read_data="[]")), \
+             mock.patch.object(run_clang_tools.multiprocessing, "Lock"), \
+             mock.patch.object(run_clang_tools.multiprocessing, "Pool") as pool, \
+             mock.patch("os.open", return_value=42) as open_devnull, \
+             mock.patch("os.dup2") as dup2, \
+             mock.patch.object(run_clang_tools.sys, "stdout") as stdout:
+            pool.return_value.__enter__.return_value.map.side_effect = BrokenPipeError
+            stdout.fileno.return_value = 1
+
+            with self.assertRaises(SystemExit) as raised:
+                run_clang_tools.main()
+
+            self.assertEqual(raised.exception.code, 1)
+            open_devnull.assert_called_once_with(os.devnull, os.O_WRONLY)
+            dup2.assert_called_once_with(42, 1)
+
+
+if __name__ == "__main__":
+    unittest.main()

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1

