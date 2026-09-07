Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E594657F2
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777486; cv=none; b=UhWH9XsCc5hjYH+eGcElfSLFME/C6o9JpeILZcSa7AVCxx1l8bVYHnHwruxsuDV5W/IZo54QfHnXpV6VJMifUA2SR3deQRqNN/2kke14Gh1J8C0xWw7MZeD6kGB44GCjBLVbYTAAiKPIT5RVJ12NsowOU4piSOUQ77Ti0v/0WkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777486; c=relaxed/simple;
	bh=ZP0v0FbC59/0C24ZWn/MoBhMdBld/zG+x2hSIlkc6M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcVl0gG8Ie2GQog6n7WnvslQf60w+xv8GYmG/pqUmbKE7k5pqNApkKduoKG+MUrProBfDbVbPwvclblEOvXCukTFPGf8Bqj9nE76hVrvqWL7bikfaZ3sask8ydD07ax7f9Ix5INv9sVREUYTORY44kJqXplhVlt3FDT/CS6iJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBchzLF6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBchzLF6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so10551445e9.1
        for <llvm@lists.linux.dev>; Mon, 07 Sep 2026 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777483; x=1789382283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LfFVHzcpV0I36UPxeD3SH8L9Tgicjr0WOI5DBup3i1c=;
        b=TBchzLF6kkfelwiL/W7COxk0OxikEs8LqsSQBxpby18v0PJTJy39SL+l8J6WfFGgj8
         Fx9Ympggxy5o/9D6faUl9wx1qKWCdx1MlSV9kFdkaxonoiAvh+3gTZt/P2cAzner7NjI
         VIsjsBpxBw1CSuzbeD1L3zptGr6Yq24cBNYwT3hLHmytvGPnGlJmUdpENg6wBlKlRhNF
         U1nQfb555iJlD9yDzGommpV5bbqPhN5dCF1wQPyBbyaasIgUErRBK3PyaAXiRgCTDnJ0
         yVjghM2YSB5SN68RDZm0aJQt/zxLK7oiTkKvEW8P0QXI1kM9HZyYH6hy6tKo8cRjbenn
         xV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777483; x=1789382283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfFVHzcpV0I36UPxeD3SH8L9Tgicjr0WOI5DBup3i1c=;
        b=aJdS5pX6PA2T7voujQ9NzykVZ4vb93YOLTUGt1/MvBEjRC33kT3WwLRS0m4P5wWXx+
         oclrjE6rqKDIHzDxHOtdxw+lusxZMoB0zV8gtiiVbVqg2FY59Bvj0baCrHn7sfUhk9kq
         iI/694AZl8Oei7l2RUII/+Ka29/TCRshiTfi6iNXnxHOf7I1ujYQCHwm2TpCpXjDrHST
         vJl/LSZFJBLFk7PVj8Y6FA1M29WFYsmFS4cAggWas/LA9di8wuitmjwjp8DMrMGlA76k
         G9U3BP2IDHUTBURuyAJpEWfq3LUwND0OGynRZEx+Ka+tSRJr+S3cD28OfqX2ADXwc1VM
         Ze1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5b9oajDw05scJfafVANkgF5SsdtxCEmnE8NEe3LfOJ75zr+sLRzMukVEGCekDk1EHXqAK@lists.linux.dev
X-Gm-Message-State: AFuF++m43qdglM/hMIegIR8uUhEIF42DMfzYSTo8/LPMop7XuGNC3vNP
	BIQ25h4yUEBE1DABcemK8vc/brNdEbzCMrl2iQ6i9coV7VLZZ7D99/Tu
X-Gm-Gg: AYBFou2x6kP2gvUJF7IF9NwMMY+EvjVOnUpFZamXEX2zAnTU5Xkrb090b3hFmju2nfw
	pvVvY+uPxV8nz+Jc8Dgz9fjG3PZdIcEHSAL+SoYngoWt/C7vthoeVvVXDe9qV6yUJ8w97k+hLcd
	IOyFkGmMZFjICJpLFVrByFbwc/Sktdu5yDuCyC/P/utoT+mddNOuD9qFcIq9casdoAR9BVxMeY1
	+2A0qwSU92dzSriOPwAp+vMUI9MF3glENtsdrAKYPTFlYMwOoQwS2w+OH3tv57hz3aiycws9cid
	KdiX40ZU4yfNBY4emIHGXFdkVISABl0ehnFbfp/hiYKeA1mbWpmobOn1zPO2A1akYYxPci5JtII
	CJqg/3H35znuNs2Ips6k4QDdKSIdYgNNUvT3zZWXrAJpmNk4ZQY0/OjcFaFW61X5R9Tx6yq1LHr
	Ui0PDQivxGUxQYZL7ui5Iwz1mUxh3GLbIowcvYHclmvaI7kCfjQV2a/RJ1vdaiQ71AthU/fukUv
	agI53Hu9Wx1H9KUj1E8/MGel8SgcF+BtRTvYD1hMcgozfazwQn3coym56w2dQ==
X-Received: by 2002:a05:600c:3e1a:b0:49c:fc6c:bdff with SMTP id 5b1f17b1804b1-49cfc6cc078mr168749475e9.22.1788777482725;
        Mon, 07 Sep 2026 03:38:02 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm311944285e9.3.2026.09.07.03.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 03:38:02 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: [PATCH v2] kconfig: preserve the final answer when input has no newline
Date: Mon,  7 Sep 2026 13:37:38 +0300
Message-ID: <20260907103739.23212-2-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

conf_string() unconditionally removes the last character returned by
fgets(), assuming that it is a newline. When redirected input ends
without a newline, the last character is part of the answer instead.
For example, feeding 42 to an integer prompt stores 4, and feeding
0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
silently changing the supplied value.

Strip the newline with strcspn() so that a complete answer at EOF is
preserved. Keep the existing handling of newline-terminated and empty
answers unchanged.

Add regression tests for string, int and hex answers, with and without
a final newline, in oldaskconfig and oldconfig.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

Changes in v2, addressing Julian Braha's review:
- Add an in-tree regression test under scripts/kconfig/tests for string,
  int and hex answers, with and without a final newline, in oldconfig
  and oldaskconfig. The shared test harness is unchanged.
- Submit this fix independently of the checkkconfigsymbols.py change.
- Refresh Cc from scripts/get_maintainer.pl, including the LLVM contacts.

v1: https://lore.kernel.org/all/20260905123237.40670-1-hexvalid@gmail.com/

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the original verification. The assistant also prepared the new
regression test and this v2 revision.

Validation:
- Built original and fixed conf with Clang on macOS and GCC in an
  x86_64 Linux container, using -Wall -Wmissing-prototypes
  -Wstrict-prototypes -Werror.
- On both platforms, the original conf fails all six unterminated-input
  cases and passes all six newline-terminated controls.
- The fixed conf passes the complete 33-test Kconfig suite on both
  platforms, including all 12 new cases.
- This tests the host configuration tool; a complete kernel was not built.

 scripts/kconfig/conf.c                        |  2 +-
 .../kconfig/tests/conf_no_newline/__init__.py | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/conf_no_newline/__init__.py

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b0..46c9ca646 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
 			}
 			/* fall through */
 		default:
-			line[strlen(line)-1] = 0;
+			line[strcspn(line, "\n")] = 0;
 			def = line;
 		}
 		if (def && sym_set_string_value(sym, def))
diff --git a/scripts/kconfig/tests/conf_no_newline/__init__.py b/scripts/kconfig/tests/conf_no_newline/__init__.py
new file mode 100644
index 000000000..0fca696d2
--- /dev/null
+++ b/scripts/kconfig/tests/conf_no_newline/__init__.py
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Preserve complete string, int and hex answers at end of input.
+"""
+
+import subprocess
+
+import pytest
+
+from conftest import CONF_PATH
+
+
+@pytest.mark.parametrize('mode', ['--oldaskconfig', '--oldconfig'])
+@pytest.mark.parametrize('newline', ['', '\n'], ids=['eof', 'newline'])
+@pytest.mark.parametrize('symbol_type, value, expected', [
+    ('string', 'abcdef', '"abcdef"'),
+    ('int', '42', '42'),
+    ('hex', '0xff', '0xff'),
+])
+def test(mode, newline, symbol_type, value, expected, tmp_path, monkeypatch):
+    (tmp_path / 'Kconfig').write_text(
+        'config TEST\n\t{} "Test value"\n'.format(symbol_type))
+    monkeypatch.setenv('srctree', str(tmp_path))
+    monkeypatch.setenv('KCONFIG_DEFCONFIG_LIST', '')
+
+    result = subprocess.run([CONF_PATH, mode, 'Kconfig'],
+                            input=value + newline, text=True,
+                            stdout=subprocess.PIPE, stderr=subprocess.PIPE,
+                            cwd=tmp_path, timeout=10)
+
+    assert result.returncode == 0, result.stderr
+    assert 'CONFIG_TEST={}\n'.format(expected) in (tmp_path / '.config').read_text()

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)

