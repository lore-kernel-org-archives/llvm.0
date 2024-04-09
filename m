Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918B7CF37
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 06:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712643131; cv=none; b=ExDOlCJ4G3gUw1TZZXD27pakx/7B4yTavbrxDF0dF6MS2z2k4z3dVpoq+OjT496IAUYyV3akWdvnXpQytDiS2sKj6TBzvUlTS7aAEG4FF/IVSl3A9T+MLkoftvvvjEXTToOvcswvmcgFDVooz2JPPOLlMa0hHNXZLIrwwxCkbf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712643131; c=relaxed/simple;
	bh=VqVo0bzh6XJftKAe8XsJ+Ul+IauZxO02HTjKRZ5kZE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t1+hFLJcV33LFh1IxUrViP7uoWwNzycyc7SoB9WakAQ1V00jMyMcK9emA1aLV9IxSCbSXJCMpQzyEPlMyFVdqEFSQ/Uhl7SlK7QxCD2sKv2rFrVEZJi+g3yVujpojvYn335K0SmD6hdu7fLTPI8n4QUvHmhZHVVRHDATsefJ704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=OCBoga0z; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="OCBoga0z"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e411e339b8so13891105ad.3
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 23:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643129; x=1713247929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vK6fRyMYl1P58cmeO0LU6+3feTaUZnDC3wku/DDJlMg=;
        b=OCBoga0zY3GgCzD1GWgxiB1rxMMp4pljQiky5eCbAKRIUBHCItc0zRI+ryfmLkvi1m
         MLs0Pwm5ZC5pDleRK7bMhqDedBXzSOsihUqPsHQmEt+axtNzld8xa3qKWUu2BOI9KlIt
         YaBbzWJCW9Dc5DS519O/a40Wi14SAQNXFyCiVMVnB4tbWORyh5ZsQDTw6dTNjOwWhYnr
         l8zuUs3I8boBdYsZIqXBXnXrVIl22YtUf1ravcuw76raT2ip0Ld1Tqfok5mCFmiz81jn
         nWa8ylNYS0VXs5OKx69o1J3Q5enFnwyfsoKJlWchm3SL1J7tM6LzcXnvu7JdPsnD8i58
         9PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643129; x=1713247929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vK6fRyMYl1P58cmeO0LU6+3feTaUZnDC3wku/DDJlMg=;
        b=ZHSXTbAG08/Ua6vsRFkzM8hx18RU5i2RyNLjDXTiwNJAvUzDIer/y+42WTMcvEPVje
         y5WkJDVPGpvSJ7BhpwvA63eEp1ob5oS/pYg6TdFp/Ocwq0+g0F+bryIKdOHlMGye6vjz
         ZgJslyvL0DXdq0PQljc1cDAw4/KWPbrliFBhy27/rnv3IvgmsQ81jnvMkyXXs9eh0xba
         C/XBQUsIo47jXBaa0oEIaRGxnMtclrevAjJ0XmLKcutTEsnfcG3+PMju46ZWdJirnUwj
         o9UrpoDjOuHRGhBnG1OG4KJGIdBGe4BRLBGfd2ApRzTbs8f0MLrHPyrLSQJgy0sE+/yG
         7GWw==
X-Forwarded-Encrypted: i=1; AJvYcCX2maMdRPw8g1j5BkajvqXiiEZGZpSb0fsio05Wbk4rJ6XkGb+zU/VAUos6Xmqy85VcXl9dLdtvLQmV8tw1Y9a6NlmA7Q==
X-Gm-Message-State: AOJu0YwsIXyXjHEVlf8pL1X6IfHGoyp2F2ptKsVXgk0VGsuzcZOQBTmT
	l6ss9Ps0DWYIyqL6dlyz/4k7srLtjAvfgCE46VkheOqDou5ZWe9Z12tBtWV12Zg=
X-Google-Smtp-Source: AGHT+IHgZW6LjlIuQt5UvFz+14tJ+M4rswVyzT+uN214hG5uWWodDhWYY3GIvVhaCwgATxAIZVKVqw==
X-Received: by 2002:a17:902:c407:b0:1e2:96d3:1bc1 with SMTP id k7-20020a170902c40700b001e296d31bc1mr13068819plk.1.1712643129552;
        Mon, 08 Apr 2024 23:12:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 06/12] scs: place init shadow stack in .shadowstack section
Date: Mon,  8 Apr 2024 23:10:37 -0700
Message-Id: <20240409061043.3269676-7-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If compiled for riscv and dynamic scs is turned on, place shadow stack in
`.shadowstack` section. Arch specific linker script can place logic to
protect this section against regular stores.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/init_task.h |  5 +++++
 init/init_task.c          | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index bccb3f1f6262..f025022e1164 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,4 +40,9 @@ extern struct cred init_cred;
 /* Attach to the thread_info data structure for proper alignment */
 #define __init_thread_info __section(".data..init_thread_info")
 
+#if defined(CONFIG_RISCV) && defined(CONFIG_DYNAMIC_SCS)
+/* init shadow stack page */
+#define __init_shadow_stack __section(".shadowstack..init")
+#endif
+
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index 4daee6d761c8..3c0a01455978 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -52,10 +52,18 @@ static struct sighand_struct init_sighand = {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
-unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)] = {
+unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)]
+#if defined(CONFIG_RISCV) && defined(CONFIG_DYNAMIC_SCS)
+	/* RISC-V dynamic SCS implements shadow stack and must go in special section */
+	__init_shadow_stack = {
+	[0] = SCS_END_MAGIC
+};
+#else
+	= {
 	[(SCS_SIZE / sizeof(long)) - 1] = SCS_END_MAGIC
 };
-#endif
+#endif /* CONFIG_RISCV && CONFIG_DYNAMIC_SCS */
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * Set up the first task table, touch at your own risk!. Base=0,
-- 
2.43.2

