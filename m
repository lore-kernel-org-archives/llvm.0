Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F7EE4C9
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679236605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XWzHgiL2NSowgeGQA1tqAXRb6Sm60VFytFuHZjvfdfI=;
	b=he5pGrG98aZU2TwVYxzyw8yHnJrCJAVJnJ/qP0M8L9St/T5fYv+CCUVoZap9qk3ro0KOuU
	BcIQF9SiGPGDq9vHQzorss6bHcIioRcF7s0LO/FH8v6bsSlHOgA+twokdp80k74Qs2Vhk1
	BbY+qnaGxa2A4rgpnoEkWIlH6XRLBxM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-muCV1Y-kOO6aKYU286jahA-1; Sun, 19 Mar 2023 10:36:44 -0400
X-MC-Unique: muCV1Y-kOO6aKYU286jahA-1
Received: by mail-qv1-f72.google.com with SMTP id q1-20020ad44341000000b005a676b725a2so4891560qvs.18
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 07:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679236604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWzHgiL2NSowgeGQA1tqAXRb6Sm60VFytFuHZjvfdfI=;
        b=41e6hvtpZGqqjnSqzrcLVk3F0Domdk6hPRhoCyl8fr9TP+287CpZg6T4EqiQTMmeku
         m1Dzy5yhvuYmsBBaX4GAYlszbGexRpITpUl7engwAbzRfXLE7H4aiQDVPu0/I6CLuLCB
         CJhxQlYgnXi3vRSINCzsS27onbtR8i5MzoB9dKsq0RTNNXEjKw8A3MjVSnTQFIpggfg+
         Y1j6xs9hnl7i4WGiloAf3J/y5sVLQ0ahE5T8S20dMaiiOa8EBJvIWTJOdcAMI3D/I2p/
         m+Og4Q/scsk0c1/1WZCyaiEc/Dq+cv5pLYzxUcBPMAgGdxu8SsywB5PbZakydNdIXujh
         +Y7g==
X-Gm-Message-State: AO0yUKXwELeWem5BrerNwnLJpw9MKlXP606iu7Q3mtq3xC8hMVuHPVJD
	7f5URPif9uSQ1N72cM7IYhj/ISSzYrT//IAGK7wPFEBu4ubN2qiV8ouAVI+H51Yk/wKGhFa9hFj
	fzvJH/JhxxOLDZw==
X-Received: by 2002:a05:622a:1214:b0:3e0:98f3:6cec with SMTP id y20-20020a05622a121400b003e098f36cecmr1856192qtx.44.1679236603785;
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set+97Dibvhqhg/Ulk6oZwTmlmWDnkiUm3S+2qMc0ntf5rUqQTbBuvGEsBgE3pdJyCZ+fZ2xf9g==
X-Received: by 2002:a05:622a:1214:b0:3e0:98f3:6cec with SMTP id y20-20020a05622a121400b003e098f36cecmr1856174qtx.44.1679236603549;
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l16-20020ac84a90000000b003d4ee7879d0sm2756qtq.56.2023.03.19.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 07:36:43 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: robert.jarzmik@free.fr,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] gpio: pxa: remove unused gpio_is_pxa_type function
Date: Sun, 19 Mar 2023 10:36:40 -0400
Message-Id: <20230319143640.1704735-1-trix@redhat.com>
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
drivers/gpio/gpio-pxa.c:174:19: error: unused function
  'gpio_is_pxa_type' [-Werror,-Wunused-function]
static inline int gpio_is_pxa_type(int type)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpio-pxa.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 1198ab0305d0..a1630ed4b741 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -171,11 +171,6 @@ static inline struct pxa_gpio_bank *gpio_to_pxabank(struct gpio_chip *c,
 	return chip_to_pxachip(c)->banks + gpio / 32;
 }
 
-static inline int gpio_is_pxa_type(int type)
-{
-	return (type & MMP_GPIO) == 0;
-}
-
 static inline int gpio_is_mmp_type(int type)
 {
 	return (type & MMP_GPIO) != 0;
-- 
2.27.0

