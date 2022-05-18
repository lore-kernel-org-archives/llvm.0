Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63F27A
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652881675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u2KtS7a0V1qX4x/uzAxmwYggLko6jxdiXgkpP8ZKnHE=;
	b=J6I2MNQVqR2baFNI9lLY1K6QHayBMVwRzUtK0R1830XMjAbiBgg4sOWi1OcxBtc1WFi0G1
	S0alRU6FOgE0uI+UaJq3JTy41q42f2yMhcK8aYAVtJ8brUyvQhavr7j/QXxhw82LOSkP6w
	JLoe+Q6sUweAI+/JcVmu979K/UmiE9g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-M1tITkRSPNCAgiPewxxbiA-1; Wed, 18 May 2022 09:47:54 -0400
X-MC-Unique: M1tITkRSPNCAgiPewxxbiA-1
Received: by mail-qv1-f70.google.com with SMTP id kj4-20020a056214528400b0044399a9bb4cso1616787qvb.15
        for <llvm@lists.linux.dev>; Wed, 18 May 2022 06:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u2KtS7a0V1qX4x/uzAxmwYggLko6jxdiXgkpP8ZKnHE=;
        b=DtIHr6f4xlVaAns8+s889PNSxSnqjVyFe/BBpNnWMLAihjhjsh1CJYWQq6jOaYdAWT
         mnBlcn0OBU57AAIXlFjWkqNtnFErXZqgFJg13yirY3OVTDK9DpYwTR4HZbYA7VbptHW/
         aDbdKnOPFemD6rtjqJ4Ght2yGHPKnmPzwbw9OAqUtmeY3W4bKdYvxeMDvNSVOPa60Tlt
         W9K95WP8egsgBvIFPBn48nkacMAfIZq3XprvyM3fNb8iRh21wwDULMvIGIIbh9jQexJr
         2Vx+zmIWfBACNNeayE4zM93wjmXnA7oY7qzx5AnTH2xz1AHspnNarJYYWGWrqMzTczkS
         I8aw==
X-Gm-Message-State: AOAM531rLscRGaY834oPboU/9iPMyM06/XQtixgMLeExt83rFOVzuKwX
	2g5/LloK959eldddvsgy/HWnn58iwdm2Ot1k7q4WZf2Tgwv5mcuSMHt8tncLHzHuqmrhU0BhkUr
	WQfUPGiiAoZlnfw==
X-Received: by 2002:a05:6214:f29:b0:461:cf47:63eb with SMTP id iw9-20020a0562140f2900b00461cf4763ebmr12894736qvb.70.1652881673952;
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtgXvKlLmGN2occDj9JylwKZjwpVnZVseYzumo/m3mhT0POXGLcciAWfqMEDj6vc6Lg/6L8g==
X-Received: by 2002:a05:6214:f29:b0:461:cf47:63eb with SMTP id iw9-20020a0562140f2900b00461cf4763ebmr12894720qvb.70.1652881673798;
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id he30-20020a05622a601e00b002f39b99f678sm1207547qtb.18.2022.05.18.06.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:47:53 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: miquel.raynal@bootlin.com,
	a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: rzn1: initialize val in rzn1_rtc_set_offset
Date: Wed, 18 May 2022 09:47:47 -0400
Message-Id: <20220518134747.3215597-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clang build fails with
rtc-rzn1.c:291:3: error: variable 'val' is uninitialized when used here [-Werror,-Wuninitialized]
  val |= RZN1_RTC_SUBU_DEV;
  ^~~

The val variable in rzn1_rtc_set_offset() is never initialized so
the series of |= operations in the function will start with a
garbage value.  So initialize val to 0.

Fixes: be4a11cf98af ("rtc: rzn1: Add oscillator offset support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 980ade8c9601..0b4bf6e43464 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -272,7 +272,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	struct rzn1_rtc *rtc = dev_get_drvdata(dev);
 	unsigned int steps;
 	int stepsh, stepsl;
-	u32 val;
+	u32 val = 0;
 	int ret;
 
 	/*
-- 
2.27.0

