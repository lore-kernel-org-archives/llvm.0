Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE58F33CC2
	for <llvm@lists.linux.dev>; Wed, 17 Apr 2024 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713340509; cv=none; b=t/JObA+lFjIUceqkx9I530dZZ2Uo4dsNKplfEZhi4Fxt+5hV5izvhdzzJ6HTP1AqOJbSJQY4HsQbXBGrQui3BZoTKfWz80K2U1cwhuc4XlAgWJ8v3xNPMZe5a3zhdwrOD2Zvsxed8n/M+f3Ds0beIDH/Vbr5rAJgwxQzOROojZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713340509; c=relaxed/simple;
	bh=eyDrtd8fUNME9ytWdgxZfVi8GNq/KoV62xE9EnUFfHE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GnIp6yBpXAwz1Z3z+0VgZLRn8fVvZc8e4iDGv2J8g9hHChVAR8kTZOY9KnqIRATd2sB1vOg7j49pIMqEK8C1Wc5oBeJvF9Fx684Ie/GURLnqyqih7qlmU4flBdNbKeWnjHxh8nKesSGipUGmR12KRtorO8KwhSPyyOahH0AaMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=3yTtksiP; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="3yTtksiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713340504;
	bh=eyDrtd8fUNME9ytWdgxZfVi8GNq/KoV62xE9EnUFfHE=;
	h=From:To:Cc:Subject:Date:From;
	b=3yTtksiPCVFoeSAS+27BkLyLucN3NoGrPOyo4ISVg1IdQID/8bNhxbfqx0Y76DQxC
	 zOyFT+u4zHXHXsMsYGTC7gi4LfLyxIirfsTyO4iRNYUgZOpgJxIJHkHIm7/Nxnj1gR
	 kaTL/ceRYWj4T/2XbMCEdUM2jRdMk/ryPlvefbjqix96ZHI2PX4Mm2xgKi/d8EsdTD
	 3YDdrN2zv/PHEOUtr4eA9Z8nOKdagCyhL/OCQD2kgHBPw5UZ5s//T672VUPwtdy4Ot
	 3W1JKgwBX0ne2uj0e3VMipN7HhNnaDlpkTN5Dq7t+SPyBggeDyiSIRZTnoVE4HEKc1
	 r4uf+1xqjCH2A==
Received: from localhost.localdomain (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1EEFE3780629;
	Wed, 17 Apr 2024 07:55:00 +0000 (UTC)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] selftests: mm: Fix undeclared function error
Date: Wed, 17 Apr 2024 12:55:30 +0500
Message-Id: <20240417075530.3807625-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the error reported by clang:

In file included from mdwe_test.c:17:
./../kselftest_harness.h:1169:2: error: call to undeclared function
'asprintf'; ISO C99 and later do not support implicit function
declarations [-Wimplicit-function-declaration]
 1169 |         asprintf(&test_name, "%s%s%s.%s", f->name,
      |         ^
1 warning generated.

The gcc reports it as warning:

In file included from mdwe_test.c:17:
../kselftest_harness.h: In function ‘__run_test’:
../kselftest_harness.h:1169:9: warning: implicit declaration of function
‘asprintf’; did you mean ‘vsprintf’? [-Wimplicit-function-declaration]
 1169 |         asprintf(&test_name, "%s%s%s.%s", f->name,
      |         ^~~~~~~~
      |         vsprintf

Fix this by setting _GNU_SOURCE macro needed to get exposure to the
asprintf().

Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/mm/mdwe_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
index 200bedcdc32e9..1e01d3ddc11c5 100644
--- a/tools/testing/selftests/mm/mdwe_test.c
+++ b/tools/testing/selftests/mm/mdwe_test.c
@@ -7,6 +7,7 @@
 #include <linux/mman.h>
 #include <linux/prctl.h>
 
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <sys/auxv.h>
-- 
2.39.2

