Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C7D33089
	for <llvm@lists.linux.dev>; Thu,  7 Dec 2023 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YFpg2Mub"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso9877675e9.0
        for <llvm@lists.linux.dev>; Thu, 07 Dec 2023 00:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701938114; x=1702542914; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3iWeWB/mBuBm6/U8a08QVjCJLxiEQB+3v21Lk3/MtY=;
        b=YFpg2MubHfvO0NUuVap5bibhnEZdrHenANmbhrQeXMF6N+9z/JDWfzQfpLF3xSXge1
         STsVsCi3Gp6RifZo73ZXVW8ZhvqXtmof1hEOVaaMIToC78ErrVVitOfz0beki1Kgybj1
         JQ36XYhMOyW0dI8/rMVvWAT370FqXUzOH/8/dpX5ocCxQWqf/FU0kymDc69vt6VjtMG2
         6WmBmKKWhCJaN+TuyFxJI/oiKdHarvAe/Zym+/Oz7xOioa8vH+/3oxVMeglOUkdry6A3
         IOQTKLlx2sCAw+k5ni61IY9sIF4H8+ve1zy0SzMnmkcKzfp2bd89oRzYUMKBrR0lnnkI
         xmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701938114; x=1702542914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3iWeWB/mBuBm6/U8a08QVjCJLxiEQB+3v21Lk3/MtY=;
        b=Hlx3Q4Kmr19AC3wzkfkzpAtgj6WCWLoU9MrqrBbx7jS1i3QsE8E3g9IqtFi842RbdF
         XXDGoEZ8Lidp7gFoiEBi8hefxCsgRqTUmfdlpWDNSeFKdMOZdnUKVe1RwL4nmeYcbua5
         x+FbMBurU7Ir+hdNG0IdZGNRBl9EEGI3/r01Y0PDcuSKJ7fTRj29rYCTC8D7D8ENsPZQ
         4n4mac5cdMyOeZy35Pa/zsvNDDiG+C38mWWW0zjNrGZFfHBjqphwXe85LzqQFDatbLCb
         XIg6VMg07z0ScSA8aJnuuv7fnlIDVRl3SA4LWdjku3qhm+0YoVKGurXoLpK1rbh7KXW5
         koXQ==
X-Gm-Message-State: AOJu0YyM7S0fXUqYF1ksTOPqB7c3MDz4nH/Xtl1LjwawRQ9DjmekfpsN
	tdKL3Y4PlanDtye41GNjWP/EeQ==
X-Google-Smtp-Source: AGHT+IEaswcjzcSyX1BwyZBLdJdW1iILqzt5qzHgKeJ6f6tHRBd37xpxD4elOzZFWryup4RnCj9XsQ==
X-Received: by 2002:a05:600c:1ca6:b0:40b:5e21:dd2a with SMTP id k38-20020a05600c1ca600b0040b5e21dd2amr1284898wms.88.1701938114170;
        Thu, 07 Dec 2023 00:35:14 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id k19-20020adfb353000000b003335c061a2asm821969wrd.33.2023.12.07.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:35:13 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: lkp@intel.com,
	linux-mm@kvack.org,
	linux@weissschuh.net,
	llvm@lists.linux.dev,
	mcgrof@kernel.org,
	oe-kbuild-all@lists.linux.dev
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -next] drivers: perf: Fix build error by adding const to ctl_table argument of handler
Date: Thu,  7 Dec 2023 09:35:12 +0100
Message-Id: <20231207083512.51792-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202312062242.RFPPozG9-lkp@intel.com>
References: <202312062242.RFPPozG9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ctl_table argument of the proc_handler field was constified treewide
but somehow missed the occurrence in the riscv pmu sbi driver, so add the
const to fix the build error.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312062242.RFPPozG9-lkp@intel.com/
Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handlers")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..97e345f7d25d 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -986,7 +986,7 @@ static void riscv_pmu_update_counter_access(void *info)
 		csr_write(CSR_SCOUNTEREN, 0x2);
 }
 
-static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
+static int riscv_pmu_proc_user_access_handler(const struct ctl_table *table,
 					      int write, void *buffer,
 					      size_t *lenp, loff_t *ppos)
 {
-- 
2.39.2

