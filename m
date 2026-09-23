Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504844ACC8F
	for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176295; cv=none; b=QH5SaDKsJlVXBfbl/LM2C16XMEi2bvZCfqVJngyPXRe/aQIXz3qfkVtfFqeZ7MQvStvM68M0sFc8V4kpgPIL7m2xAp2e0//wZyFv7TOFPjvhP0zcESoMiWmJ1QC+Wqj9bUZxYjRl+LDirmId8kxM20Wx35e0xdaMOEi1W6iWsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176295; c=relaxed/simple;
	bh=C9qn60KBUlNxQRCS8x3xK66DGDOtLcw0xXbt5/UHVvg=;
	h=From:Date:Subject:To:Cc:Message-ID:MIME-Version:Content-Type; b=URWyFHKbQ8JQYEebjgULNaAjrrPmpWEaBl3JdEIM+cbg38ASygJnZjWw2vrm5oZZCh4f06FGosPq+8xo2Jy0UmVYCVDLNSN8uOcFOJqIwpQ/ZJbJ3Rh48Wo9GAxTlcQfS22b0Mla5KuzVNA63LNaGTUeTsBFlY4y+l4ibmK4Gc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKY2Ku9R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKY2Ku9R"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso656208a91.1
        for <llvm@lists.linux.dev>; Wed, 23 Sep 2026 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176292; x=1790781092; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEtPIsJ5V/EJrCtn9VfRrKZ0RKdts5k/dzxQR2ZKwFU=;
        b=AKY2Ku9RKqQ49QJjIsongVDEM+tAvSMn/vJHyLeMhYw7EaOJ/q2TvW001tya8J49lS
         iUSyHbzhNNimG76Lv0xWkA/DQpWZNd+Ai0/la7EIoGUtSTIvLHJCq786aS9bqbRLn03V
         +jOzXLBTmztoD9yiOR4vY4/o/Cyj1fMZANQL+3QEoM4d1TawDAKNvDV1AOVcGeR+0eE5
         77PzcvPI8qPQn0NADogUC3JCj3cniGrHFHuI7M9OnGhrOl3WTxYAQOD4omIegbNK3mfN
         9tCuVaOgctZSKVtjd4FLGhriJdUljxASpS3YpLobMRn8YQ3DX0kLM/mVYXwB734ORaqL
         6toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176292; x=1790781092;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEtPIsJ5V/EJrCtn9VfRrKZ0RKdts5k/dzxQR2ZKwFU=;
        b=dTY10hgqNHl0WC0+FmVgKE/6+kQL4ZCEN3Lpv8+WtRa8GFf/JB0HAAfJfjel16eygV
         d/A43oqeMoX68sLLUJKXOm+w5TkCqQsOuMRokgKPNvVekQATIIIu8jPi0GhFpgMYasrZ
         79JmpyFmBbUDKAz2Soy0K5u1XlPlovFYtuZkIgF7NTWBSQG5oUe/E4KhSjhCGIoUHouY
         UB07cXnY/NjOYUa9wA5UHFSe/+WRiBhVCC8aYauAikL6Ao7xyrlAF22Q1zQNswDyKwm3
         5OT/PK45IDZBA6fPnQ9i/SPablQVElNtIXYAhWRikuzr4WeaXN4TEtinnZqoD/4aaeZ2
         5osA==
X-Gm-Message-State: AFuF++k4pJQulvHaKTBlfOZ82VUNeYAgSjoB6qR7KB6dRCFXXJWYsNqZ
	BH7Kcp2TW8FAP1oohSua57jWqwGv6HekBuwBNDccSWTKvEvUOl15BgDz
X-Gm-Gg: AYBFou367uAZTdpL/u22wzAt+g4tJSRuVW09IxfXJeuWF99WhP0ruxVDqEZ6tyuv/Uw
	bDS5ZCjIjHtcAvii+MqrSEyyUWb+mswB2b0B6bsMWlSNk+CMVs/0DfZlbDureu60nMYtp04mRhy
	oNLJAG3weAffggIIG130E76bQE6mDU3M1nZN8/bFUohb67feFbEqKF3KFs2iSyKqxLllIiT8Ewd
	501aKwFsw6y2RPBjlrBtNoJ9dvj3UF8almTKvGEkPIo+9ArQXsosYQ4spQnIM6lEP5CnWydeY7D
	C6mNVOGhT7tRK92IURwbBbk2/ocHgS0mtAeqZ0jmAvUnM2zk9FuTi8BXjNzxILMlCm0MpvsPmoo
	uy31+B5o/59SXI9J0W3DSUi7WPn7/FliI9EFiBeX0qXi2Xqkw0h5DSf2/aukBQ9hTRl99wV3bEZ
	MNl+L+DXcBdeqfz4clrz11Ik9rveSGt2pplvrEmdZD1ufp8vcQjT9PMi3QfAAqF2jZ1VRnimEQY
	fAW6FebLG/tNBfr7Ry/TjQlxx5XvGm2jcYf9niuBTf9a5gfXn40WnnoiqFiJXjlNzV2EVBhj5os
	sO7OKuwsuF7UomzCD/9K0UyM+HdSg/TC2U4=
X-Received: by 2002:a17:90b:4d0f:b0:39e:6a81:c922 with SMTP id 98e67ed59e1d1-3a07e641099mr2688756a91.21.1790176292422;
        Wed, 23 Sep 2026 08:11:32 -0700 (PDT)
Received: from [172.16.0.2] ([2a09:bac5:d58e:323::50:1d4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3d6954sm1280260a12.16.2026.09.23.08.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:11:32 -0700 (PDT)
From: houtinghang <ue081723@gmail.com>
Date: Wed, 23 Sep 2026 23:10:55 +0800
Subject: [PATCH] clang-tools: Decode dollar escaping in compile commands
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Message-ID: <179017625539.54044.4066773916071097354@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Kbuild doubles dollar signs when saving commands in .cmd files, but
process_line() only decodes $(pound). Consequently, the compilation
database retains doubled dollar signs in compiler arguments. It also
corrupts a literal $(pound), saved as $$(pound), into $#.

Decode $$ and $(pound) in a single pass, matching how Make reads the
saved command. A single pass avoids interpreting a decoded dollar sign
as the start of another escape.

Add CLI regression coverage for ordinary text, dollar signs, hash signs
and adjacent escapes. Four of the six cases fail before this change;
all six pass after it. The expected values were also checked against
GNU Make using scripts/Kbuild.include.

Fixes: b30204640192 ("scripts: add a tool to produce a compile_commands.json file")
Assisted-by: LLM
Signed-off-by: houtinghang <ue081723@gmail.com>
---
Testing on Ubuntu with GCC 13.3.0, Clang/clangd 18.1.3 and Make 4.3:
- x86-64 GCC, x86-64 Clang and ARM64 Clang defconfig builds of the kernel
  image and configured modules passed without compiler warnings.
- All three native make compile_commands.json targets passed.
- 17,084 ordinary compilation database entries match the original tool.
- 432 Kbuild/CLI/shell/compiler cases produced identical objects.
- 259 mixed escape cases agree with Make for each compiler test run.
- 22 clangd macro checks and real x86/ARM64 kernel checks passed.
- The original tool fails the integration and clangd negative controls.
- Six CLI cases pass on Linux/Python 3.12.3 and Windows/Python 3.13.

AI disclosure: Codex identified the issue, wrote the fix and regression
test, verified CLI output and Make semantics, reviewed the diff, and
drafted this patch after a request to find another Linux kernel bug.

 scripts/clang-tools/gen_compile_commands.py   | 10 ++--
 .../clang-tools/gen_compile_commands_test.py  | 47 +++++++++++++++++++
 2 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 scripts/clang-tools/gen_compile_commands_test.py

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 8d14b81..d11d15b 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -166,11 +166,11 @@ def process_line(root_directory, command_prefix, file_path):
         ValueError: Could not find the extracted file based on file_path and
             root_directory or file_directory.
     """
-    # The .cmd files are intended to be included directly by Make, so they
-    # escape the pound sign '#' as '$(pound)'. The compile_commands.json file
-    # is not interepreted by Make, so this code replaces the escaped version
-    # with '#'.
-    prefix = command_prefix.replace('$(pound)', '#')
+    # Undo the escaping performed by make-cmd in scripts/Kbuild.include.
+    # Decode both escapes in one pass to preserve a literal '$(pound)'.
+    prefix = re.sub(r'\$\$|\$\(pound\)',
+                    lambda match: '$' if match.group() == '$$' else '#',
+                    command_prefix)
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
diff --git a/scripts/clang-tools/gen_compile_commands_test.py b/scripts/clang-tools/gen_compile_commands_test.py
new file mode 100644
index 0000000..fe259af
--- /dev/null
+++ b/scripts/clang-tools/gen_compile_commands_test.py
@@ -0,0 +1,47 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""Command-line regression tests for gen_compile_commands.py."""
+
+import json
+from pathlib import Path
+import subprocess
+import sys
+import tempfile
+import unittest
+
+
+SCRIPT = Path(__file__).with_name("gen_compile_commands.py")
+
+
+class TestCompileCommands(unittest.TestCase):
+    def test_make_escaping(self):
+        cases = [
+            ("plain", "plain"),
+            ("$$value", "$value"),
+            ("$$$$", "$$"),
+            ("$(pound)value", "#value"),
+            ("$$(pound)", "$(pound)"),
+            ("$$$(pound)", "$#"),
+        ]
+        with tempfile.TemporaryDirectory() as directory:
+            root = Path(directory)
+            (root / "test.c").write_text("int test;\n", encoding="utf-8")
+            for escaped, original in cases:
+                with self.subTest(escaped=escaped):
+                    prefix = "gcc -DVALUE='\"{}\"' -c -o test.o "
+                    (root / ".test.o.cmd").write_text(
+                        "savedcmd_test.o := " + prefix.format(escaped)
+                        + "test.c\n", encoding="utf-8")
+                    output = root / "compile_commands.json"
+                    subprocess.run(
+                        [sys.executable, str(SCRIPT), "-d", str(root),
+                         "-o", str(output)], check=True, capture_output=True)
+                    entries = json.loads(output.read_text(encoding="utf-8"))
+                    self.assertEqual(len(entries), 1)
+                    self.assertEqual(entries[0]["command"],
+                                     prefix.format(original) + "test.c")
+
+
+if __name__ == "__main__":
+    unittest.main()

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1

