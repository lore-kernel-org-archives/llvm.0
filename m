Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9A9440
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679400093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZUORpevlKQiU73IYOa4/Bo2bFBpxSB0mQvJe2zWG4uk=;
	b=Qq5khr2T9PbisJkVCPGjw3FJVO7kT61JuyIK1h6nbqZJqwATS8YCtcFxutOCd6oZc2xUC9
	V9tVAg4L/TJFjd4HG91jjzjsKzHhqHGFhoT6MiG45fdRNO8rypHZjWyCOJPJFJU6pzdvl/
	Cjqr9Mu79hCOmWVN0BzUlKXNNv65/U4=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-lyNvdQoeM6G-WMVOsN6JKg-1; Tue, 21 Mar 2023 08:01:31 -0400
X-MC-Unique: lyNvdQoeM6G-WMVOsN6JKg-1
Received: by mail-oo1-f69.google.com with SMTP id z20-20020a4ad594000000b00531ac1a175dso4478674oos.20
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 05:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679400091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUORpevlKQiU73IYOa4/Bo2bFBpxSB0mQvJe2zWG4uk=;
        b=OfediQjEqHKYzFYLPiRfYVP7Cdtn5IRIZ3i12Gz/bXpVU9ZBC2ttlgsA/m56sUYg0L
         JLI2UouTN2ADjRH3fbji9dQ77+QuFpk3g0ETR4sCxsnYCkhpCrM/2XPyX4+utGVAirGA
         AQ8oPsSkYZDYK4+xrgCbVPdRGPDhzo6f1fG9622Zj/+n45y6DzlPWGJkqiG1iwfydgj6
         7veh8IbYuJtMnn4dACq5dbayFDdzifJl1ymBjeZRxUf2co4ZSrKv/SFt9z+LnUTfWUnO
         Yxk7CM8Yr/yTmViSJiguI0mHtcGr2eATHw01tFS6FA3TUGCNSxh8yT6dcNURlKVic2T5
         xgUQ==
X-Gm-Message-State: AO0yUKXOsd8mRWQbVh1kUdKcan78WUXSI3JxSzeOUUpT0MyqbxRd2gmw
	ZXPd6EnKwxDpjS5wWoXcVh2sdjyYdYBWi7AlxCkxu+Voj48EWGPUPO1MB8V5aBPbRSuVkLFVwRs
	1HFFY74UXQ46gWg==
X-Received: by 2002:a05:6870:8289:b0:176:263e:9965 with SMTP id q9-20020a056870828900b00176263e9965mr871703oae.44.1679400091077;
        Tue, 21 Mar 2023 05:01:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set899kmqLmAPg7MyUnAjH/WqMmEGz8KcW68wrb4VDOu+woQ52tQV+an0Qn8sOt6JqzR5VPkhdw==
X-Received: by 2002:a05:6870:8289:b0:176:263e:9965 with SMTP id q9-20020a056870828900b00176263e9965mr871660oae.44.1679400090393;
        Tue, 21 Mar 2023 05:01:30 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t72-20020a37464b000000b00725d8d6983asm9163201qka.61.2023.03.21.05.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 05:01:30 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: isdn@linux-pingi.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	kuba@kernel.org,
	alexanderduyck@fb.com,
	yangyingliang@huawei.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] mISDN: remove unused vpm_read_address function
Date: Tue, 21 Mar 2023 08:01:27 -0400
Message-Id: <20230321120127.1782548-1-trix@redhat.com>
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
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index e840609c50eb..ac665cf64f8c 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -663,20 +663,6 @@ vpm_write_address(struct hfc_multi *hc, unsigned short addr)
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

