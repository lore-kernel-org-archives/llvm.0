Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD954A93A
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679588028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KbMR0xrX13/vpqXtbfb3ZQ/trhkNWEMduVf+oaF3Fe8=;
	b=f8Id94MdlWFdHMAcA11MRIvR5Y5B7v6l+bcGtimPJy3CDvf3dyytzf65hXI1lsG8vU/vso
	/7AuucKiWBw+htq76iuxEwbPg5ZI4m82F+Ypxp3KqMlllCMUGdaZlGguFrJ5TvsC1AAK+s
	uQvTwGIMA4DmzYUoxbIRhBzXVlYRxXc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-tCQ2T-k0Or2W98PzE4wiXg-1; Thu, 23 Mar 2023 12:13:47 -0400
X-MC-Unique: tCQ2T-k0Or2W98PzE4wiXg-1
Received: by mail-qv1-f72.google.com with SMTP id f3-20020a0cc303000000b005c9966620daso6438064qvi.4
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 09:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679588027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbMR0xrX13/vpqXtbfb3ZQ/trhkNWEMduVf+oaF3Fe8=;
        b=Xp2B/WyJff/QFrAKV/vsRznsvm9bC0K2fObsv5MHUbWtmLmxJ1KRRdzi09pRHhSyge
         brGXpUYpnZ+PuEGJn7WjwG1JUmW6nyOoBC1SmlmfYUQObVndyoNCLM2dsnyMwAIqNXNE
         y1QK/CfJdnWSBMCXcgSDvjoktb3Jsn5kKBHWiaZSnW0TqJn9+1rm39Y1yTW+s8sTKV9o
         OkdWFW8zZ05+UcaTYHnjEUEoVKX376LRhxjXSK+P/qE7XElm4HpcnmGWKk5MEjsdCe33
         n1JDzHG9IB7htLwxf4O7xDaiixlG95x5RXnPJbhvCHKtJYwlsWjTW8/hHuyhRz5HVjls
         k27Q==
X-Gm-Message-State: AO0yUKUd4WVURx1dzpK8NmWtS1xVqhGjT4E80swjkBCrFikskRWMKqTd
	5SRLLItqGjV0SbrpZIVwtf2C5HDDdTSf1wihdywNbBHne0eLcVlEKg0d4vpU8TUulycEpLTKFZL
	QoVpcFg7c0I0j4g==
X-Received: by 2002:ac8:7fc6:0:b0:3e3:8ed5:a46b with SMTP id b6-20020ac87fc6000000b003e38ed5a46bmr7580392qtk.34.1679588027004;
        Thu, 23 Mar 2023 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set8iOLbXObqxCv5YZqFAUuGys7Qtjn8a01N2100PrXD69Su2AVUSuvrVzwG1RwXwNk3swo0Zcg==
X-Received: by 2002:ac8:7fc6:0:b0:3e3:8ed5:a46b with SMTP id b6-20020ac87fc6000000b003e38ed5a46bmr7580361qtk.34.1679588026709;
        Thu, 23 Mar 2023 09:13:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c20-20020ac86614000000b003e1080e0f8csm7631543qtp.16.2023.03.23.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:13:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: isdn@linux-pingi.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	yangyingliang@huawei.com,
	alexanderduyck@fb.com,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: [PATCH] mISDN: remove unused vpm_read_address and cpld_read_reg functions
Date: Thu, 23 Mar 2023 12:13:43 -0400
Message-Id: <20230323161343.2633836-1-trix@redhat.com>
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
drivers/isdn/hardware/mISDN/hfcmulti.c:667:1: error: unused function
  'vpm_read_address' [-Werror,-Wunused-function]
vpm_read_address(struct hfc_multi *c)
^

drivers/isdn/hardware/mISDN/hfcmulti.c:643:1: error: unused function
  'cpld_read_reg' [-Werror,-Wunused-function]
cpld_read_reg(struct hfc_multi *hc, unsigned char reg)
^

These functions are not used, so remove them.

Reported-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c | 31 --------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index e840609c50eb..2e5cb9dde3ec 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -639,23 +639,6 @@ cpld_write_reg(struct hfc_multi *hc, unsigned char reg, unsigned char val)
 	return;
 }
 
-static inline unsigned char
-cpld_read_reg(struct hfc_multi *hc, unsigned char reg)
-{
-	unsigned char bytein;
-
-	cpld_set_reg(hc, reg);
-
-	/* Do data pin read low byte */
-	HFC_outb(hc, R_GPIO_OUT1, reg);
-
-	enablepcibridge(hc);
-	bytein = readpcibridge(hc, 1);
-	disablepcibridge(hc);
-
-	return bytein;
-}
-
 static inline void
 vpm_write_address(struct hfc_multi *hc, unsigned short addr)
 {
@@ -663,20 +646,6 @@ vpm_write_address(struct hfc_multi *hc, unsigned short addr)
 	cpld_write_reg(hc, 1, 0x01 & (addr >> 8));
 }
 
-static inline unsigned short
-vpm_read_address(struct hfc_multi *c)
-{
-	unsigned short addr;
-	unsigned short highbit;
-
-	addr = cpld_read_reg(c, 0);
-	highbit = cpld_read_reg(c, 1);
-
-	addr = addr | (highbit << 8);
-
-	return addr & 0x1ff;
-}
-
 static inline unsigned char
 vpm_in(struct hfc_multi *c, int which, unsigned short addr)
 {
-- 
2.27.0

