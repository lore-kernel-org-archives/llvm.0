Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107989;
	b=Emrngk1GTHuxdN8DIUa5BCg46GiSg7LSues4IvhxhQGDh6j9E/H65woAvSrontPtSwVS
	 2w60AfUHRGGA3/OJHW0eBk/QcPTQWjaFuZlY3lDah0DvBqRHDOQUA5CWHZXIu2yzlLmRB
	 JpiA94QdZ4L6JBKLo2CT2zLNEnFvTedogmY8Knyhr1LX1ao5uyXF3YnhiboqHJ+E0jGee
	 C/hkoofKp+N2pMWn5vuHvtKSJBUIgV1uLrlW+2uUueKoHd0jpMH2MJ3Df1ASLLE92NDQK
	 65D85v+6kmO3i/AnlIyisam10DhNck2kiFIYs6kQpzB/TXXkpYKQZQifhprBfZo+X9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
	b=ZSQ70kjCNMidfu/9kHepB0Z3Mh5rBCTqT43djoFjXFwJYBF6aLEbYUnwOctHm28GV3lr
	 bn3NjePGS399IiQWgYj59vhsVzKhs1/ycKPL2LGMpIDGQ/PgE72KmBjUkrXZ8tGW3qe0u
	 qVqdRS4UDq+jDXFXVJsYTpicNo3wYVRWHL0++p17iCvdirnJMxbsfrYpk6wWnO6CEfZoA
	 BksQkgtE+M5rU6/eWBN7lmxV2InKo4X5IDptIkERijlApqBQomNB1Wrfp7SzCs2D/tFCT
	 xoZuBYWyazsa45ZIuQJ4irLLGjkJfWAzlmXuPU2wU3l8FKgVgE8dumWB4IMZUqSr4cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CppqZokA;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67CB606A32C
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67CB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CppqZokA
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dd1142710fso3594663eaf.3
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107988; x=1795712788; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=CppqZokAmVfa0h3iKyzk5zCo+6kvo5CUqI2ZdPn0H9X4QsULomc9Yu1QnAHZQwvKn5
         HG0Xdk3sFvPA632ZbfdSeVh6zW2mWQ0tWQtMk3uOxraSdL+gTGMpy5zkX4pglt+sburS
         UYlxSuNuiDx5lPecuKQ+Lv1WnQCIvVL4ZjIry2bl89Z3yb9qozvGIBEjvu8HQt5eU6jP
         Q0VjXygJ2izOF3wHX9mAhXT1tte/fK0zzNF+ZgzOVDlSN89ebs84UhxiK9kpdSssz0/L
         CST9T+jTNloOVX1EWLWD43PheeHols6duqm+AShfBs9Tgw0YDaelbP29nGaNAWy6TdlZ
         0hjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107988; x=1795712788;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8PlTFcb8Eocr/qY/XlUmZLVWtJfY9dhkEL8xcXjY+s=;
        b=ddiLpyGCE5n09xfwGM/+vIc+WEuAH5hnX3oDknD1Jf7Tcxq9ATzIS1mH6c6d4mDWZ6
         njKWY7lNoTQIFNJl/JG8dv7pkcdi9MRyZI612K9OaglP3IjL30DECjr/vAs5q8Ov2XHZ
         jq7jLqcIsEnYfJaFIG4fn4xmoleLvg7vjciFCcdslk2d04HLjvHUnDP4bWmeF8unxrqU
         eMt+6SM5Z8l2aM2EWBXagF1P6T0dH+2oVRLSOD8oJ3M8RvORZlfS4YBo+EqlN+oBumu3
         zRBPWj6nO8dQUqryCZUuBzrUK3ZCKbccpfd6VvyQQBeq75QbiN0iboUsAHTprD0dzJ4E
         rvgQ==
X-Forwarded-Encrypted: i=1; AL+hErFnX009OWExeFC2a1RdOCa2cgxFYnEmpYllmEs20p4IneMY/SlOc0y/q7kA5AQ5v24lbWWy@lists.linux.dev
X-Gm-Message-State: APuU4Z/VsLQjsAqNrkVMFeeb4zhdctCiqP4SaVnCjJsqKbONMcoGhdz/
	C/gYvtEYGyhS++xtMCW6LNWbesMnXjL7Zy0pXsGSVdlk6yjur05mdspquZy78p/fXLEcve1ZShf
	VTDJhcjuFlQ==
X-Received: from oacia7.prod.google.com ([2002:a05:6871:e307:b0:49d:e3f5:f8fa])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:3388:10b0:71a:eb23:a7d1
 with SMTP id 006d021491bc7-71b394fc7c6mr128920eaf.53.1795107987578; Thu, 19
 Nov 2026 09:06:27 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:23 -0800
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
Message-ID: <20261119170623.1519909-1-irogers@google.com>
Subject: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

niu_txc_set_imask() acquires the parent lock, reads TXC_INT_MASK into
'val', updates the port's interrupt mask bits in 'val', and unlocks
without writing 'val' back to TXC_INT_MASK, making the function a hardware
no-op and leaving per-port TXC error interrupts masked.

Write 'val' back with nw64(TXC_INT_MASK, val) before unlocking, matching
niu_txc_enable_port() immediately above it.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wunused-but-set-variable enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 and
-Wunused-but-set-variable; not tested on Sun Neptune 10GbE hardware.

Fixes: a3138df9f20e ("[NIU]: Add Sun Neptune ethernet driver.")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/ethernet/sun/niu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..b2da560edd82 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -4650,6 +4650,7 @@ static void niu_txc_set_imask(struct niu *np, u64 imask)
 	val = nr64(TXC_INT_MASK);
 	val &= ~TXC_INT_MASK_VAL(np->port);
 	val |= (imask << TXC_INT_MASK_VAL_SHIFT(np->port));
+	nw64(TXC_INT_MASK, val);
 	niu_unlock_parent(np, flags);
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

