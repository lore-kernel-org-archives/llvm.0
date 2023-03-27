Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A26EA3
	for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679918909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f6OgJqgpSNTTFYSUSudYbvVLpng6GaBH202qHK3zoFk=;
	b=dEui0Z7fZftarzISaK7sgjln8LR7ZIZ1XLzPW85MHG8kWBpubOF0m/v1znag3rvgn+0uQu
	wAwjMVSTu2zCFVCbymiPflpk8HobWKFhfrYeBzHQAEXQxuJS+2rNv4X72b7F24m3ZPpOAk
	rm6E/G1TX9OyhCpy4jsvH7uEBcqcGI0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-yzQU1Hz8PJCpio6CCZ62ww-1; Mon, 27 Mar 2023 08:08:28 -0400
X-MC-Unique: yzQU1Hz8PJCpio6CCZ62ww-1
Received: by mail-qv1-f71.google.com with SMTP id y19-20020ad445b3000000b005a5123cb627so3370044qvu.20
        for <llvm@lists.linux.dev>; Mon, 27 Mar 2023 05:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679918907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6OgJqgpSNTTFYSUSudYbvVLpng6GaBH202qHK3zoFk=;
        b=7b+Tk/n5YbxzlN3x7VbBnfvpnvVLtKBzLJ5dfyvB1oC85RCAb/ITpnPuRTa41r39vc
         wqpK0zjDnSXG2GXwPwDps7kZiFYr51lkhpUABYHVVo1zY4EKB+SR8h+26YMs6MrG3asq
         n6ZfAUBrNcPrqXEe7fwrSUsy4CDzirmva8w150Ttl9ZX0uyRjlQoHaQRItysw09Yb99f
         dTE2czj6nO+mNZG5ZBlktUuG3KPfUTlrce54vzVc815i7ruESolsMRGNkOB46uCA/r7q
         2QbkYb8Dzc0hrld0pr4IQRD1FPAlAAe6oFGb159ngOfRsws76KVDibZy/JyO4dgNEnzo
         1ACw==
X-Gm-Message-State: AO0yUKXnbbw16jSL32m9Jkw6rfxQvYiin+4OKc8PRVK6d0ImlCW0RtiZ
	RV8fG77uYCYh+wxzMVJPpjOINmsTijdpQsKzqAGDq2taDwLV+2y/VDNe7MrfvahO0Ctwg+t1pOj
	8kqY7rGhAdHVuWw==
X-Received: by 2002:ac8:574e:0:b0:3d6:d1d3:eeb8 with SMTP id 14-20020ac8574e000000b003d6d1d3eeb8mr20398693qtx.11.1679918907442;
        Mon, 27 Mar 2023 05:08:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350YyfOhpAFIIn4S3oaK+SRWKemSRvTcR5bSBOqlG0NAjA410/ztoUYY6RVRQVXHBhcaeImdxww==
X-Received: by 2002:ac8:574e:0:b0:3d6:d1d3:eeb8 with SMTP id 14-20020ac8574e000000b003d6d1d3eeb8mr20398655qtx.11.1679918907195;
        Mon, 27 Mar 2023 05:08:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bn29-20020a05620a2add00b007486052d731sm1396515qkb.10.2023.03.27.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:08:26 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@pengutronix.de
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] iio: tsl2772: remove unused prox_diode_mask variable
Date: Mon, 27 Mar 2023 08:08:23 -0400
Message-Id: <20230327120823.1369700-1-trix@redhat.com>
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
drivers/iio/light/tsl2772.c:576:24: error: variable
  'prox_diode_mask' set but not used [-Werror,-Wunused-but-set-variable]
        int i, ret, num_leds, prox_diode_mask;
                              ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/light/tsl2772.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/light/tsl2772.c b/drivers/iio/light/tsl2772.c
index ad50baa0202c..c090405c2358 100644
--- a/drivers/iio/light/tsl2772.c
+++ b/drivers/iio/light/tsl2772.c
@@ -573,7 +573,7 @@ static int tsl2772_read_prox_led_current(struct tsl2772_chip *chip)
 static int tsl2772_read_prox_diodes(struct tsl2772_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
-	int i, ret, num_leds, prox_diode_mask;
+	int i, ret, num_leds;
 	u32 leds[TSL2772_MAX_PROX_LEDS];
 
 	ret = device_property_count_u32(dev, "amstaos,proximity-diodes");
@@ -590,13 +590,8 @@ static int tsl2772_read_prox_diodes(struct tsl2772_chip *chip)
 		return ret;
 	}
 
-	prox_diode_mask = 0;
 	for (i = 0; i < num_leds; i++) {
-		if (leds[i] == 0)
-			prox_diode_mask |= TSL2772_DIODE0;
-		else if (leds[i] == 1)
-			prox_diode_mask |= TSL2772_DIODE1;
-		else {
+		if (leds[i] > 1) {
 			dev_err(dev, "Invalid value %d in amstaos,proximity-diodes.\n", leds[i]);
 			return -EINVAL;
 		}
-- 
2.27.0

