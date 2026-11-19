Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107857;
	b=gYCBS2SPdPgHzsp3LMMuUlDjekZlwDk4mVhEOaJW9SmqlsQZgzFb5Ug+Vvm7/xltkXkE
	 YMXtFXpH4swXwFQXGt+41mHZdB3xEZ37r37sctlk/ifSd/m34y4ugNV6VdsPJqBMqBOni
	 X9hBnjkz60ZbrZco5n/R/m18Sistim9ntX7vesGlqtk7CjYJupj7P/h95jLQMEnDOgW92
	 HmIm2vRo0Mm54+coQBkD26e1ND5UT1DoDWQxE9kr98mbfAlwosI/aa2eo+v7WQ/uPp8Sg
	 iefk1gxAyLrOVxQ2ChjO7jHzAoFJD6bv5YT/fE673T633MSEmG0Nr/P18Ha+q4QWF2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
	b=1HrxPzirzDFRDkqGGKU8GIFNIo0ZZV9iR+pi8pf5NGyF7m0a25iM2khSqsgbJSKzDTvR
	 azl12X8bHu//BwaRdNcNGtARVdnra8TFzoGZS1AhMUifIgd1SeIyUifX0OviQsaKbAQDI
	 SJDVO/WmcDeiopeUg7/uAAacLncpEI/6q4QXvvTguim8S5zETj5lsDhnwQt4LUYUqGaY+
	 Ku7DEMFd4CkYWIiq/SB4bUhYiiYuVKKZyBjhjCOPUGOHaKJr04TgqbyY9FqHtXNJUTM25
	 +sOmQEdxBYJRqZhrNGETD89zx02bBfC42mjNsCvRafanj5VeL7bvvS7i/3IGIiO3rgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QKL1rAkL;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1EA606A325
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QKL1rAkL
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso2951847c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107856; x=1795712656; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
        b=QKL1rAkLMJuU8QQcOmSXfdV3QCd0SCB/8bshfIOm5RMxPjs00Fi5B50UOTMsN0oBcI
         uy+ZHvfFXtWqQKd3lN7D8edlJp+qXyLWY3ub1muWnXrMrVa9g1H7xam7QT771zAyPfbu
         KtJLSWWW2biLHCemaG2s3AsP2tkqZCvFKFZQ2zaM7f//VGyBtZA+dQ3+dfb7zixJ+uug
         W3YU5A6Zqh8JaqR1usd+OJWCtmp+twWc8041y50c9Ictug56mGePBH/U93V84xESURpk
         lfJpXwjLu84aPhdcFFalX0q3IanIKwCq7Hkf1Cxo6jqNi9xE71YGSWEF9d3HyEQpSbDd
         2lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107856; x=1795712656;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOTTaMiFKsMjsQWe0kVsqaO6Sbtr1FRrysMCgSH4psE=;
        b=iJNYD3J99XWTQCu9R25fe/JN6tMSVcudeLXhu5UFOZsUkEimRHjZYJ6riax3H2rFW7
         oJAEFnQw0NEeW2429Wq4h+42BohbAf0FM+KgZlT8nzyqytnlXNOhAwwJhJ7PnToOTijQ
         WGmbStLMrJcpE3ZOwW5yEvnrQ1s+peBl5/rK7MxiUl/tAUee3xzrv18Ol6XCRd6Tyex6
         TOK6iYd4fYU4SlPjK/QCERAYiNaZoIStqUUci88Bw9FpgCnReNJPfFmJ7LhQbQL/J4lE
         4+/ZkF0YVLK08N2M372wptWnt+FERfvHf+JtdzL/G+CgoCnI3nF2sFjNHVXPqrab6rre
         Nv/w==
X-Forwarded-Encrypted: i=1; AL+hErEF8Cd/MBwCty6HqMhbV7a9HC6iMcMJKyvmCt39T3gE7Y8yw0b5xV0QexY2RIERh/3IaP5b@lists.linux.dev
X-Gm-Message-State: APuU4Z9VneQesNn2Ql+kioRjabP/O81ZswAHxpW9lPAui4xS9CbByG6A
	Em8L8ZDxo+NIeaDmDHk8PC8ns3l+av1j838ydOipwjF93mb85rWEB9lKTSGca65y/C4jAl5m7zi
	Qt1KBkLEw5A==
X-Received: from dlbsw11.prod.google.com ([2002:a05:7022:3a8b:b0:19a:1425:bb9c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2522:b0:1aa:47e7:97e3
 with SMTP id a92af1059eb24-1b5568bc56emr304733c88.15.1795107855617; Thu, 19
 Nov 2026 09:04:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:12 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170412.1511344-1-irogers@google.com>
Subject: [PATCH net] qed: Fix missing bar_id comparison in qed_hw_bar_size()
From: Ian Rogers <irogers@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When PGLUE_B_REG_PF_BAR{0,1}_SIZE reads back as 0 on older management
firmware with multi-hwfn devices, qed_hw_bar_size() logs that it assumes
256 KiB for GRC (BAR_ID_0) and 512 KiB for DB (BAR_ID_1), but evaluates:

  return BAR_ID_0 ? 256 * 1024 : 512 * 1024;

Because BAR_ID_0 is enum constant 0, the ternary condition is always
false and qed_hw_bar_size() unconditionally returns 512 KiB even for
BAR_ID_0, doubling the computed GRC BAR offset for the second hardware
function.

Compare bar_id == BAR_ID_0 as intended (matching the bar_reg selection
at the top of qed_hw_bar_size()).

Found by enabling Clang's -Wunreachable-code on an x86_64 allyesconfig
build, with AI coding assistant help to audit the warning and prepare
the fix. Build-tested with Clang; not runtime-tested on QLogic hardware.

Fixes: c2035eea3e9e ("qed: Correct BAR sizes for older MFW")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index dd75c47758e1..3e84f53dfb50 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -1264,11 +1264,11 @@ static u32 qed_hw_bar_size(struct qed_hwfn *p_hwfn,
 	if (p_hwfn->cdev->num_hwfns > 1) {
 		DP_INFO(p_hwfn,
 			"BAR size not configured. Assuming BAR size of 256kB for GRC and 512kB for DB\n");
-			return BAR_ID_0 ? 256 * 1024 : 512 * 1024;
+		return bar_id == BAR_ID_0 ? 256 * 1024 : 512 * 1024;
 	} else {
 		DP_INFO(p_hwfn,
 			"BAR size not configured. Assuming BAR size of 512kB for GRC and 512kB for DB\n");
-			return 512 * 1024;
+		return 512 * 1024;
 	}
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

