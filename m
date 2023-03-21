Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504633F0
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679423686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sPS9ll6drXSpZudk7wgwyOxcgefAuYnobo/FFgs8jpQ=;
	b=BhgWoKR+UR2uy1emAQ57VdAPYI7m4sZ9GJHpxky15trPAztTmkBFfoXDeOhtUepeznPEu5
	NHf0T7smFSkUrDj/Q9NW06wN7XngiInzre1KZ6F7NSoTPjh1lfJ+WGm4wYNahBmsFVSYiZ
	9m0G6Wn6rhnSAYrxA4t+3/v6bpykIlA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-HO602YR1PWms-YxEzSkX9w-1; Tue, 21 Mar 2023 14:34:43 -0400
X-MC-Unique: HO602YR1PWms-YxEzSkX9w-1
Received: by mail-qt1-f200.google.com with SMTP id s4-20020a05622a1a8400b003dbc6fc558aso7052641qtc.3
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679423683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPS9ll6drXSpZudk7wgwyOxcgefAuYnobo/FFgs8jpQ=;
        b=QARwSmrFe0tvU0uXCjaWxUAlxcmB3e3j+HRyd09Mqaf0Mu1ifbwxLMZ7Q7jsfl8URu
         DPaNJ8WumRB+qdYpoWvsdAVEccPcmgBqayBa7X0lgA189r8dg4uuGSn+gQz11+4bg5Xn
         dsVYpfBNPMLBlacRGpoE3bm4hMBi7ZQVhsOZkgAFU0Ae1n3AE4wfBCsOI3/gzQ6cjPzL
         Dy6Qkzgk0ZXkdktUTlVmJV74p2yzTG3cIrcqfTyaC/81lBVhghSuKskK0yUnmQwMRUbd
         SxQYepF91GwcHwkznYzzak/+sV8AeYTIa83xAOdHXEs4RIDsov43q+fYPo7k6fAiR/Ey
         wB1w==
X-Gm-Message-State: AO0yUKUwWJ5KH4Yk/sMkI1wM0gcOpOSGaWqm0QKjM8A1jL+/1vGUFGdE
	EblFCgOYh75YjOviDAK4CUTia88koY6UlLF1G78uM26xWzvqvfyXPQg4TAVhsWh2CfvBE23kKhV
	O5J1SZqBlKr3X9BnIPsVFBw==
X-Received: by 2002:a05:622a:c:b0:3b9:bc8c:c212 with SMTP id x12-20020a05622a000c00b003b9bc8cc212mr1130920qtw.29.1679423683057;
        Tue, 21 Mar 2023 11:34:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Nu0137AV03cS5KH42Ha1QHglBsq3KR/srTrXB0d2sDKNVBqq1BOANC35xWCA7cmroLW7GGw==
X-Received: by 2002:a05:622a:c:b0:3b9:bc8c:c212 with SMTP id x12-20020a05622a000c00b003b9bc8cc212mr1130898qtw.29.1679423682803;
        Tue, 21 Mar 2023 11:34:42 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i16-20020ac871d0000000b003d9a69b4876sm8778906qtp.11.2023.03.21.11.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:34:42 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] watchdog: s3c2410: remove unused freq_to_wdt and s3c2410wdt_is_running functions
Date: Tue, 21 Mar 2023 14:34:39 -0400
Message-Id: <20230321183439.1826823-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/watchdog/s3c2410_wdt.c:311:35: error: unused function
  'freq_to_wdt' [-Werror,-Wunused-function]
static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
                                  ^
drivers/watchdog/s3c2410_wdt.c:446:19: error: unused function
  's3c2410wdt_is_running' [-Werror,-Wunused-function]
static inline int s3c2410wdt_is_running(struct s3c2410_wdt *wdt)
                  ^
These functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/watchdog/s3c2410_wdt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 200ba236a72e..6394dda7a5dc 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -308,11 +308,6 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 				       / S3C2410_WTCON_MAXDIV);
 }
 
-static inline struct s3c2410_wdt *freq_to_wdt(struct notifier_block *nb)
-{
-	return container_of(nb, struct s3c2410_wdt, freq_transition);
-}
-
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
@@ -443,11 +438,6 @@ static int s3c2410wdt_start(struct watchdog_device *wdd)
 	return 0;
 }
 
-static inline int s3c2410wdt_is_running(struct s3c2410_wdt *wdt)
-{
-	return readl(wdt->reg_base + S3C2410_WTCON) & S3C2410_WTCON_ENABLE;
-}
-
 static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 				    unsigned int timeout)
 {
-- 
2.27.0

