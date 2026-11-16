Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850240;
	b=3gxiQbvmjfQ74zPnK0uiDJF2zICAVgG56spjInbovGnM+EQIQqbZRQ069jKgy4RMVBm4
	 pRbCY00IVVsbW/r5JPjaWCpHadK6qCljJc0D3dlldSbvfHq68rXVrSYkNpQccecmqS2jh
	 D8nXmSFrCXilLrTOsleBHZaRnbh9mBEpqgHoyU/wzGiI5rvHMc7zB2bMgDRV0eLkRFx5V
	 j0dGkSbbFddUy1kOsYwC37npjNXjstIGLw79u5dS0FGgaLE9SxnxaMFoGf9lIlfbb6F9R
	 H66ITamHm9wi13zZEPbtvdkK1bbUCPrfvMH49i8j2yArNPH4QYVTr5JfKiHzTyCd4Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
	b=KkGZA01bP7VDtXBq/xU04XHNT2yN6KGuQ+qt4m/ylAZOnsyesVNuGo9pAQnBTMwO+XRR
	 qtOakombv1H+DPG2WlkXMKPNOG0rDj+dXypFHsXUPiKBGeBgNN3jGNwywJt+G2cNA1Cqf
	 JL4B9pRshJsRYWU8E5HVSWHkvcljswLT4nWR3Sq8iN0imkwP1EZ9xyOhEsEzBz3GDFG/o
	 ClijC+7aaO+DHBf48B7wJylA4QjIq6a8T5bGABwGfh6mDi++O9xpGfpjunYR5kQo64RlB
	 75ZozjbAyBWzHE2Ga0GALI4Go1tdzlK35U2rCAb2ykuNFnb/tNCJRsEJxUEtZskkqPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kvnb+sZm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CBF606A322
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 17:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CBF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kvnb+sZm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so23128535e9.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 09:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850238; x=1795455038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
        b=Kvnb+sZmogVwyUX8dAReSSdVNeXWmglpQ1rK1oGcQG9ZOfmMx1gTnklr1e5nDPAA0m
         Zki/6MdL4bSnaokLwgh8ZI7KwDd6Nf8vbBxWmYsBZXZeSAKVceRv1CX0pAKGDV3dyvia
         t3k6fdTAuAGrQ/UTZUXheVMI3F/Z75+ioKfZwpE+tKqchOdMQG1qvelghLA9IhJBdF24
         S91Jo6/gIbPSNODJ1urvf1IUIk2jhJPWfVlgpc1FGZEgYVS0hfBb0sPf0Hd3J6ALuiO+
         qCNZGosxyLdPWryj2T0vQsOOzh6T+jzB+WhvOp/TDIDLUMWRKwPLL1j7e1MJHZ+rj0gB
         H8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850238; x=1795455038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjTwaJizgiBveUNOMThYkvCK46NgUoB/gNeNnCa30Qk=;
        b=moqFHJ9le1d2UJDwIM7qU2ok5ePjJa5GGpWbDxYwsJEwLusSm94H7DV0LwD24TZTTE
         +QqknptsTwZtzcep7OwFDQCZ7KZ+L4z4LKbGNK4C0HECZTmJayQ6+QZER828Q0mIflo7
         ZaHqgSsqKx2eHNosTXNXjW7vmmsSKoj6aopdlKXxVUxxMnqGwoAarHmZ1JXnIIviXRt3
         ZBfjD32WvHeybKLmN9PQKXgnOTv3b+4lscKMM3yBmyX4zgLJUrJAmeK1pCZXtfzmYR34
         aZgukFk8njpgtsd2HNIW4jpHUU3NjJ8buUvOR12VrUAexdA8006OufObPM5DNAOOGzfG
         ld6A==
X-Forwarded-Encrypted: i=1; AL+hErHQxa3Mh94Bm+ucaY5v3Wj4RCwBQjsHbjK5147P54ix6taEe9n4AN1h0eZ6Y3EvXWr90c0a@lists.linux.dev
X-Gm-Message-State: APuU4Z9+EEn5rLJlMrG88EAfu8QCEg03NGW884wf7aGp6ZbBRgryqZQj
	92WjnYjKPTrpRq1uuvvJwd08qpE62zVEbG35immcKC8nwh3kUVSTkWXR
X-Gm-Gg: AYBFou0gx8jWVq6/3NaIfI45Xvhj8A1hCvRVM08tJx/c74gzwBzujMySAdS6pHAg9I+
	eQDIknDpK5v4ATxLqpQBozBsdM17/BKEwyiGgCqB33Ry7cPtvQ1UJdyssyCwnoRLUAPXm8+FmHi
	Ir3ggmU3hm7ZAIq6V+DcMFyeMwuC/610aDge/sF5cyIAbo/MUGSRxvC/ks7XIYgAAHS92WkN3Zq
	xzIfeCXvFFAuv2vqlbiJvxP7R30zvlcKc4IbvZRrVwjktK4OwhiUV57Rj4f6k7BnGlYKEzaYQO5
	AWezMTQLcko9/R2hzXQ0ML4FnCAk9Vqt977VcQ/ymF+jh0kdKQG5mk+prXnMR6ATUk5hST4fLoP
	qmWP4pYc5iJ24akPNUKq8t8YdakqQ+UtgudHLL2Wycf7cGQOY6p+xtp4yHRw8Uce0sHq2Pv/Zt3
	TmkPoYBj7Ynu/xg9ZYPgaH++IXJGcYmmS/a0+lAmiKZ8H8mz9qYb6wdfjkTwKYLWdkd219yF+2K
	8TnfLbaXELvS3vlkEABL5flKlweEgNdngGPBPsYC7wHMUdJ0qpWukuL8ob5NBiuzGBLyiQ/a87U
	rcclGXZrYk7Yht/efM9NVJkQ+wRTqLI3UwqonSati5xsF5K9lA98e14NbEHC
X-Received: by 2002:a05:600c:6096:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb5de1f26dmr180594805e9.4.1794850237851;
        Mon, 16 Nov 2026 09:30:37 -0800 (PST)
Received: from zephyr ([77.237.184.197])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm17892298f8f.51.2026.11.16.09.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:30:37 -0800 (PST)
From: Ali Nasrollahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kees@kernel.org,
	peterz@infradead.org,
	nathan@kernel.org,
	Ali Nasrollahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Date: Mon, 16 Nov 2026 21:00:27 +0330
Message-ID: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
    alternative_instructions() still resets it after calling
    __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
    with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
    as __maybe_unused to account for configurations without FineIBT.

Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>
---
 arch/x86/kernel/alternative.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index efbc11f8c336..cc2bdca06f81 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1195,7 +1195,7 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 #endif
 
 enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
-static bool cfi_debug __ro_after_init;
+static bool cfi_debug __ro_after_init __maybe_unused;
 
 #ifdef CONFIG_FINEIBT_BHI
 bool cfi_bhi __ro_after_init = false;
-- 
2.56.1

