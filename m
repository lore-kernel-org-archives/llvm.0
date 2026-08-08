Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8524886A
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786191665; cv=none; b=GU8iUmsf2NYGAKDBL/iH+umyGQ3f393FLHWpzflo6rPRSBCgh44Shdq4toCVdOCuprVQ73dkoyPvTkek8p8f1JCWMfHg/Azm5M8oQUudesgePoUi9uGrj/Whj2XMNwWtUn8ojIKMHVbWONk9kzUHK2YoL6n9N/OGa8AcHRh2qzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786191665; c=relaxed/simple;
	bh=WcSZxId+S34IwFArlRF3UDh/7T6p4oXgwuErWrRWT8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pbNVTkiDA1VUOMcz84ZHIT246NrnNl8GN76UOVMQ8ui6opedq9Nba3Ec/lumQLqtXD3g2KMAFuHqyLaQgJTsHUERqZmqEeEjCaB4VrK6bg35wpCJ/ydOE4cfTN+VaHGzymifMjc1WqWK+5CTUZCMFR8ZtF5P0mlo4T80cN959Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvOXuqiP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvOXuqiP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49802c418b5so3872935e9.1
        for <llvm@lists.linux.dev>; Sat, 08 Aug 2026 05:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191662; x=1786796462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le9aTN9I4Hkl8j6KgLggOKWGuXynZHIQztDuT7nEfQs=;
        b=SvOXuqiPmOFQzydyoANJtiQcJpBVw30qhQkh28p8cEaGy+SnvjDIj3Idc3hyKiNDVS
         dJu//waWdCL06wpHsnY7ioPTGc/zcDFuWMUMoXQ8MatbEwShdWDyj8cQykddsAzA6C5W
         AlJC2qk4jjH6wFntF9knBHcjqi3F/iZUvaykRMobQHs09RkQ97UAHZkUHs2HljrLAM21
         6CATRLwSEjusMcFCeIe1RgXRWYuqpJui3EhloeqNCQmggPLP5P0xtdKrCNN/a9+GfVaP
         GjpWHE1mHyl6lCK8taoGzUlv8RfL79cVXUdUX/I7PAbF+zuz7/Q+xG0Eo800q/eO5/Ee
         iR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191662; x=1786796462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le9aTN9I4Hkl8j6KgLggOKWGuXynZHIQztDuT7nEfQs=;
        b=FF9HkwVIAsimTz1KOalZMmPLQ+WaevLHD6H0VeqnI1gPy3PIlBru94BIUBiWDc5kd5
         Txt4Nsfw2WRwOWWRRYYq5U4rEer3Nf7g0CmmmbHJg5ch98Pc1PlwqKwVdwoJVhaNOMEf
         BA9XXb8Eqwv/yi9Cc0zmoUViygYFm4/IHDEzoM4Hw853TrgHLPPgSR0aI2bc/BOJRfVD
         3rbu1MNW/0AFhCj5L3mXNLR8h6ekJ6lvPyxUdcJivg3cqc6bNhDCWlgIwTWlN1imN6CP
         GT/sekLuqRE8GjL66zWM/L6R+2sdJE0bjgJmUIHgXyZnLMzhKTcUPQREfg2NP3hiswz/
         zyOA==
X-Forwarded-Encrypted: i=1; AHgh+RrXG9Obd/BQCIoQpB6N5zidoOiWPg66p5ShgO8058+MTBUyK3rbOqngIMEtBeNpGYtwwJZV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9RucfEZ2NUNVA5o5mIu0zauWTALUZcAoFgHmGNqcbqRjYccWa
	hBVMvoVpwmfphb3R3K6bz5U0oCBAQ4hZDkWz+idalqeES/NLir6dTUnU
X-Gm-Gg: AR+sD137UpmMK2pmq00BU78JDgLQPbXdi7ZzCw9RC+dxAk7efHE09D0NfjZhI5QeRWi
	ET/qZKJjx3aJLYErKWw2w3FjXQ2m4/ag4ISe0dr2wtlrCJ3Reb6AEilhamMdQI3KdDpTyzZjlUd
	qfogxOKRwA1WqUZaN1P8onYgh2+BshvDlmHlsoFos3qLlU+LyTPYOjCff+SQ6iHzbbSvnxYP+7N
	YLWQWplrq7dUgScsZc73pp7fQFOEZnM7AMW6gcscGMZU1xnO92hdIwwg3zic0a2GlLojPLHKpJT
	500JorRgtHt27LcnAsYOLmnyrKtlPEBDS8FA4DHXPckYIqOaTLJn4h7LdYJsSMn1pRFfjQ64sKp
	ZCATCD6OcZmCbCesy6W10MrsfrTtt7eFGWqrK3VtVOnogRkDH7p7ER1D8ktXjVxMxp9nM3AM8y9
	rv/O4HbwjXFDV5qbUAd3Jrd89Koguh4vj0i8+O9DWQDTIY/gW7WoKpBRF+13foHMSk/BeHsy2yO
	vnoCBcW57sf30iip9/sE9kJJGoVUrryRwrvQxIdZXWoDw5GpmH8oRSSV3f2sYZJ1soKRNIPUTtM
	EhM5kajx32NNiiW50JHl
X-Received: by 2002:a05:600c:c8a:b0:493:eed4:7210 with SMTP id 5b1f17b1804b1-49961992a4amr87924775e9.11.1786191661566;
        Sat, 08 Aug 2026 05:21:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-004-134.77.7.pool.telefonica.de. [77.7.4.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542851d6sm249365395e9.12.2026.08.08.05.21.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Aug 2026 05:21:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Dan Williams <djbw@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] memregion: fix cache invalidation warning message
Date: Sat,  8 Aug 2026 14:19:43 +0200
Message-Id: <20260808121943.72939-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WARN_ON_ONCE() takes a condition, not a message. The string literal is
always true, so the warning still triggers but the message is never
printed.

Use WARN_ONCE(1, ...) instead to print the message and keep the
once-only behavior.

Found with a Coccinelle script. Clang's -Wstring-conversion also flags
such calls but is not enabled in kernel builds.

Fixes: 1156b4418db0 ("memregion: Add cpu_cache_invalidate_memregion() interface")
Assisted-by: Claude:claude-fable-5 coccinelle
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/memregion.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/memregion.h b/include/linux/memregion.h
index a55f62cc5266..50a6d2ed432e 100644
--- a/include/linux/memregion.h
+++ b/include/linux/memregion.h
@@ -58,7 +58,7 @@ static inline bool cpu_cache_has_invalidate_memregion(void)
 
 static inline int cpu_cache_invalidate_memregion(phys_addr_t start, size_t len)
 {
-	WARN_ON_ONCE("CPU cache invalidation required");
+	WARN_ONCE(1, "CPU cache invalidation required");
 	return -ENXIO;
 }
 #endif
-- 
2.39.5 (Apple Git-154)

