Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107910;
	b=3WjXMy+CKmzgTZ2mz7mI4q3Asc3KTRfsGfWEGzTRY7HbWDB28DP2+IrhOMDnb0Qk/f5t
	 o3Rvj5fmYAwoHu+Z9Lg8bFIKIW8GTeA11qL/eyWof/GXOi2TTY+VvJ8xwCzNQIzCJzHGB
	 axrZFFuecyd++KjwjN546PWX/lmQx1xJYzlj6OLSkR6CBy3WO6TgoMdayBx+YInH7XLCw
	 aXy9bNq74Q7jnRzRZqY2Wx0T3ZVNo8JeiAwzCvWPWcNlJC9fzXOXKFH77Ll72XmqqPmrM
	 rGEfV3ibJ6oqHCmUsOzO6Y/51589ZcqnhnAqikFR59EMxjHiPjSGlbEMRkZuPFth4Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
	b=3ok9xG31c8RZ4ruUb6eVlUaT/g1IToAKO1jxi0OoAfgWJdj6m+DivvVk44sLW0Z3qDGx
	 ceI6V/GVOQ/gG/UcU094iYFEsd1mccxuTNSOciyjIy4FwDOjzLsMJ4B2Y6jhTzsxblFA+
	 FqlLMBILq+qnccrFn4xDJa7npebb6yjy2SWqiJDUoFq0ssGB7B+wGbOmo+nOoin6vupoc
	 NMvsYg+8sjwpcRHGYW/ZGpqajBJAyv5I6o3/ksDrKcUUmnBh+hwxskfxArbYC5VH++rAA
	 D/WoVoSFqT2DCYsV8AynhwjMa0Tbcqxq1JHbE5jxSDYVl2gJQx7YCuImIqtZG06yHEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXedeUDX;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB3606A333
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FB3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VXedeUDX
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso1967273c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107909; x=1795712709; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
        b=VXedeUDXD6dzdJ0PKHZAGiIZ5+ARIju+udY5/h0wKtCpZZUxUzvINAGwjvJTOH0N6M
         ov+uKyVjOPhBJ6RLwcRJ94HKMn8EndL5HG2UlLAfRdaYtn4nIDcAQrPJnPAZeXh6EP4c
         AboMCrJl973XYtdyLW1ebpF5YEzarWNJ7SPmWkiWlSTZxWImXrsb24aE4fppD2H4X7OT
         IzKb8eurz2tJ82/XWu2pn4lVEoIclTZWrRxS07KDJMM3bKzgydwLWLex+oxvMMKTCVPy
         vs/iKtXAApLWJZUQ2M75DXTXvcGwrQI/u2yHyUO+WMLq9lLTD83qOAD06PR00hmWMM18
         TFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107909; x=1795712709;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx1BIBm+pFF9M2IDaKvF8w7SnrBT54mjfoNt8Z1QDIY=;
        b=Dmhoy/Vo2zj+NHvbmQXB5TW5597xuI3+kpgPoVo6ZSxsk3wcHMc2N5TDQSp4nlRiyp
         T0LjYzUDvsWuBPle7Ynt5W+kYftymQBDqyWRI9xWji8vNkM37FYWNwQIEMJkoQ3EsCBU
         CS6i8bK8XP32aF/SxLriwJNDCXiLCBtR5Jz4x/ksSYP5hbmpMC0LuofVEnZEY/fj6RHb
         O1Gvmjn3UPAfsmsMybSKzs17ZWAyJAGIlq8byH6zc76XwAhPxRfDAmNEJd5OirBIuasg
         jrlgmtwTBqcRgrGF9SrvuncAAhKMOQjmRWDWPYgCUol3jMnnAXq4vfj/pT2dPOmef0/5
         GGcA==
X-Forwarded-Encrypted: i=1; AL+hErGsJKbU/F+jJrvqvhLlIYFTVwEGEe53U3GOs2SXMN2RGMr7dJF0ub9R2NgkP/IfeKj4BeTN@lists.linux.dev
X-Gm-Message-State: APuU4Z/h2PdAZT7ChrOAE6lANwaaueB+qWXX1FcRgiFvU8L7YfQ7g8pe
	1+AF+xWQvJPMwkRsux/CwIqyWoCAyvD5/ND7mrNX7iudXa6nSwkGeo5yjGBIjNW7NIeJ2/fBm1k
	WT4kOWXEsWw==
X-Received: from dlbts7-n2.prod.google.com ([2002:a05:7022:b047:20b0:1b5:4b48:ba2f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b056:20b0:1b3:ac53:da84
 with SMTP id a92af1059eb24-1b5568e371bmr272053c88.32.1795107908743; Thu, 19
 Nov 2026 09:05:08 -0800 (PST)
Date: Thu, 19 Nov 2026 09:05:05 -0800
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
Message-ID: <20261119170505.1515029-1-irogers@google.com>
Subject: [PATCH] remoteproc: core: Format firmware carveout rsc->name with %.*s
From: Ian Rogers <irogers@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rproc_handle_carveout(), rsc->name is a 32-byte u8 array inside the
firmware resource table. It is passed directly as the printf format string
to both rproc_find_carveout_by_name() and rproc_mem_entry_init() (which
call vsnprintf() with zero varargs), and printed via "%s" in dev_dbg()
without verifying NUL termination within sizeof(rsc->name). A malformed or
corrupt firmware resource table containing '%' specifiers or lacking a NUL
byte in rsc->name can trigger out-of-bounds reads or invalid vararg stack
accesses.

Pass "%.*s" bounded by (int)sizeof(rsc->name) at all three sites in
rproc_handle_carveout().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wformat-security enabled; fix and changelog drafted with an AI coding
assistant. Verified with an ASan/UBSan C test and build-tested under
LLVM=1 W=1 and -Wformat-security; not runtime-tested with remoteproc
firmware images.

Fixes: 72029c901a02 ("remoteproc: add helper function to allocate and init rproc_mem_entry struct")
Fixes: ffa5f9c84810 ("remoteproc: modify rproc_handle_carveout to support pre-registered region")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 23f8539a99bd..1b1743093edc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -837,14 +837,17 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
-		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
+	dev_dbg(dev, "carveout rsc: name: %.*s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
+		(int)sizeof(rsc->name), rsc->name, rsc->da, rsc->pa, rsc->len,
+		rsc->flags);
 
 	/*
 	 * Check carveout rsc already part of a registered carveout,
 	 * Search by name, then check the da and length
 	 */
-	carveout = rproc_find_carveout_by_name(rproc, rsc->name);
+	carveout = rproc_find_carveout_by_name(rproc, "%.*s",
+					       (int)sizeof(rsc->name),
+					       rsc->name);
 
 	if (carveout) {
 		if (carveout->rsc_offset != FW_RSC_ADDR_ANY) {
@@ -866,7 +869,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 	/* Register carveout in list */
 	carveout = rproc_mem_entry_init(dev, NULL, 0, rsc->len, rsc->da,
 					rproc_alloc_carveout,
-					rproc_release_carveout, rsc->name);
+					rproc_release_carveout, "%.*s",
+					(int)sizeof(rsc->name), rsc->name);
 	if (!carveout) {
 		dev_err(dev, "Can't allocate memory entry structure\n");
 		return -ENOMEM;
-- 
2.56.1.708.g77570a6a1d-goog

