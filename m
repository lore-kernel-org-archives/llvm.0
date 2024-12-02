Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206AE134AC
	for <llvm@lists.linux.dev>; Mon,  2 Dec 2024 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155346; cv=none; b=hrd4CYGL4icUvAKUHJKm6DX48z0ssDSEZsL1b42GIcu5BsZ08hPZmgQlo7FjyjI2xS0JmtUfF+G1B0Pr4uzuUJxP2c0rKMEc9oPcsPEdo408rvJyTPH9L9KyqW43l5r6aD5EDKxTzaOF7BgytVp2bx2LmmnMDYAsMCXtFZnGDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155346; c=relaxed/simple;
	bh=fEMBj/cO5ZohaVdxPPTn3z/8EFB0HnPgOIUHdPDPIqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uzb8D0ksZ86k0LmVPWRf69xsMF/QQ1t0w/EG1P04aSCCd0Xyczo1CF9DmjtHTngGKRpV5bloEPEPaNvT+nlqHH1MluEg1QvH+fozXzUUVZsowBl5zwh/BabwCZgBfOcAPiNL789v33Nf7Ds7ezyIyhmeAvOx0GMbP8myQk+7/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XKjWfvL/; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XKjWfvL/"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1d1fdb328so1519550eaf.3
        for <llvm@lists.linux.dev>; Mon, 02 Dec 2024 08:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733155344; x=1733760144; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwkq9B7tlCVoWp4VRCgQok6o7Mt1wW8UkSSb7Sc/dM0=;
        b=XKjWfvL/mRNIMoQ2TJJr6gkJi7faG8dYTlWisu5M8RXXO9I6vQgrr4B6OiPcuDxbMC
         Y8Zcad6LWUxJm0dQT9j1hmpT8MOGgUf1Fmfy8yX0b2kuMZBnEAbgQvnfjDzH3RA7I1jW
         97p2G6OSpydh9V6t/JCetE+oJXvAWQp2MVL6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155344; x=1733760144;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rwkq9B7tlCVoWp4VRCgQok6o7Mt1wW8UkSSb7Sc/dM0=;
        b=Hfe7EDtCPCQbYGXCmrxZwUyjjrAv2/qvVJhVPPUCM5YVVEkpEcllfdz1pmiObyznzW
         JRKuj2rKzfIBcn6+uPwAKDgT6aF2EYo+co9T+aB2EjZNnl7lvXzSSQRLpMNNBGbMFsns
         6SYgsI/hoOPT6QNpRpVNWEIs75vngFBL+jGrqs4vzHrjza/AsepKmF5OIwpEDIzsrV04
         tF2YQbUziGNhMBq2vthf40h4ZO4U/iGnMhlA6FkcmJkSTv7bAgscWOnqsGF2nWavzoDk
         TPGHAUX801IKjQewZIzKjBG1wfz5l1GXnQ7A2F/h1Y2KM9wCrXFW0UtSIg4O3WkMeSu4
         WUYg==
X-Forwarded-Encrypted: i=1; AJvYcCVV2qGS2+ZxL31tQaFwdmApjRBavnUuZT0sp27IOliqTNDcCqc6jbnVwR3OdewqWz3d3e78@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe/+ArrqjCLVDzBx9RvznSAsMvBf54DJBDQUKNqNIesiwiv+HE
	nGyocQtcjY7cqmbHAW9XCJyn8BbH2ST2jcwjU7YF39feS9k/x4Ay3kHUQhGxkkTQqgALSfkrYzA
	=
X-Gm-Gg: ASbGnctNHXeJ/Ho8RfPpGFYqwprLzQjbxyZUxNvR2XHWqYp/UaAWP2K71iSxEtsFHl6
	nOrKJbyQzq4DXcnH/xNdkPk5SDIUnzXaMXkW253KpnGIr262avewzDja9GL5hL2yMr3cbW2+rxe
	kOsIq6o6bo3SJi8Mi9XtMn7spu/xp7UBvoFj++wYvsFNP8rkxfF08r1sYxPf3o4WE2dYQ0ba7qz
	9dMiwY9n5J81E4scSF0qi8DVNAIWyNBs1iTqnOkTI+XN3UKnEkY4GIdXyxq4QnhKqAk0/6KESA5
	04HMfEPJEuDFA4jKlU/hHv3J
X-Google-Smtp-Source: AGHT+IFm9HDoaNmpX+KjTHl/oULOaZ2lR8+mNRWY1LpNbTFFxdF+4LSVSE8HYxT+AguPmFsJYFchyw==
X-Received: by 2002:a05:6359:7609:b0:1c6:1d01:9ffe with SMTP id e5c5f4694b2df-1cab15b6233mr895938155d.10.1733155343603;
        Mon, 02 Dec 2024 08:02:23 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af59164f4fsm1728306137.17.2024.12.02.08.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 08:02:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 16:02:19 +0000
Subject: [PATCH] mm: vmstat.h: Annotate operations between enums
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-vmstat-v1-1-c995585b7df5@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAvaTWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbllmhW5ZbXJJYomthYWlmkZScmGhpaqoE1FBQlAqUBRsWHVtbCwB
 fEgrXXAAAAA==
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Compiler is confused when we do arithmetic operations between two
different enum types.
In this case NR_VM_STAT_ITEMS and NR_LRU_BASE are not actual
enumerators, they are used to find the first and the count of the
enumerator.

Add a casting to int, to avoid the following llvm 9 warning:
./include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  505 |                            item];
      |                            ~~~~
./include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  512 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~
./include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
  518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
      |                               ~~~~~~~~~~~ ^ ~~~
./include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
  524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~ ^
  525 |                            NR_VM_NUMA_EVENT_ITEMS +
      |                            ~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/vmstat.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index d2761bf8ff32..32c641d25bea 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -501,27 +501,26 @@ static inline const char *zone_stat_name(enum zone_stat_item item)
 #ifdef CONFIG_NUMA
 static inline const char *numa_stat_name(enum numa_stat_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
-			   item];
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS + item];
 }
 #endif /* CONFIG_NUMA */
 
 static inline const char *node_stat_name(enum node_stat_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
 			   NR_VM_NUMA_EVENT_ITEMS +
 			   item];
 }
 
 static inline const char *lru_list_name(enum lru_list lru)
 {
-	return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
+	return node_stat_name((int)NR_LRU_BASE + lru) + 3; // skip "nr_"
 }
 
 #if defined(CONFIG_VM_EVENT_COUNTERS) || defined(CONFIG_MEMCG)
 static inline const char *vm_event_name(enum vm_event_item item)
 {
-	return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
+	return vmstat_text[(int)NR_VM_ZONE_STAT_ITEMS +
 			   NR_VM_NUMA_EVENT_ITEMS +
 			   NR_VM_NODE_STAT_ITEMS +
 			   NR_VM_STAT_ITEMS +

---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241202-fix-vmstat-88968bcaa955

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

