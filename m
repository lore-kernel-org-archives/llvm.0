Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669A3D61
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648322699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ykDXlOPk2TFsdn08fWycm9GIyujKbG9G/UkGWmpaTzI=;
	b=O3XKspTKq8CKcwGRhuydvwYNCiXNxPmTTP6GxmTdH4EtheCcP+QJtNuc6CtMBhM2O9DBkk
	ISupVAscrcq4D4JF+e29UV4mHQYHKTpr16/ole/Vvx+ySFycDUuoXzSTnQG2Ne0/4gIzG+
	jqRYqkujGRdIpY8AaIT2NYACFu2YV4s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-hOb7k2IFPpqdEzjx4mKNHA-1; Sat, 26 Mar 2022 15:24:58 -0400
X-MC-Unique: hOb7k2IFPpqdEzjx4mKNHA-1
Received: by mail-qv1-f70.google.com with SMTP id s14-20020ad4446e000000b00440d3810126so8353717qvt.5
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ykDXlOPk2TFsdn08fWycm9GIyujKbG9G/UkGWmpaTzI=;
        b=V0k/hmsz1JaB/9tYjjMz31ANeILT07kCjS2ZVOVslcBB6c07h+vpVvbVSUL3DwOKXc
         Yt6o6ftuEKoOxynwp5Xd3feP4aGNLBINgEerWv97CzG4rUqCGMlMMKaIAgjnQp5FfdXC
         0hA7QmbbeA1OFyTnTUC0CT6RHxSK1LjbT96lS+lOvRJEVJJxnsQDzKQ81X/YW/svxvuF
         rFxV8SwQSqQDbSgm4tynYQyb0I+sTwEDsFHTc3VzHBIjZKLe6ohmSTpAh7t8GLzyhz3J
         /UfPPartSTdzIUQwtcVY4A+qVW1NG0CScXTT0qmVGv59XG/Dtc03BqI0paH/ld/2n7/C
         +WcA==
X-Gm-Message-State: AOAM532B81pfFh7057hkAMVEobfSDBnU/OP0q+Brc9kauildaMXSH4mq
	e5hBfhBqEMO9P0YK2VRwYyMbkpXHLpODvoqEQdt6RNnRIGI+xXI0eAHw+8CZuVswEhXsub1BKj/
	FGFEEm+hyxfxTpg==
X-Received: by 2002:a05:620a:1539:b0:67d:45f2:f5bd with SMTP id n25-20020a05620a153900b0067d45f2f5bdmr11127662qkk.313.1648322697791;
        Sat, 26 Mar 2022 12:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Bbhbe4fNmCCiw0bHclSMqD4b5ogUJimIEaOAuMXEpuJ39XeDHBrgaI1Pk8q6ZmT7kZe2ug==
X-Received: by 2002:a05:620a:1539:b0:67d:45f2:f5bd with SMTP id n25-20020a05620a153900b0067d45f2f5bdmr11127653qkk.313.1648322697470;
        Sat, 26 Mar 2022 12:24:57 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id b17-20020a05622a021100b002e1f86db385sm8064691qtx.68.2022.03.26.12.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 12:24:56 -0700 (PDT)
From: trix@redhat.com
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	hverkuil-cisco@xs4all.nl,
	vrzh@vrzh.net,
	tomi.valkeinen@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] media: staging: atomisp: rework reading the id and revision values
Date: Sat, 26 Mar 2022 12:18:53 -0700
Message-Id: <20220326191853.2914552-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this representative issue
atomisp-ov2722.c:920:3: warning: 3rd function call
  argument is an uninitialized value
  dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

high and low are only set when ov2722_read_reg() is successful.
Reporting the high value when there is an error is not
meaningful.  The later read for low is not checked.  high
and low are or-ed together and checked against a non zero
value.

Remove the unneeded error reporting for high.  Initialize
high and low to 0 and use the id check to determine if
the reads were successful

The later read for revision is not checked.  If it
fails the old high value will be used and the revision
will be misreported.

Since the revision is only reported and not checked or
stored it is not necessary to return if the read with
successful.  This makes the ret variable unnecessary
so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../media/atomisp/i2c/atomisp-ov2722.c        | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index da98094d7094a..d5d099ac1b707 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -906,22 +906,17 @@ static int ov2722_get_fmt(struct v4l2_subdev *sd,
 static int ov2722_detect(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u16 high, low;
-	int ret;
+	u16 high = 0, low = 0;
 	u16 id;
 	u8 revision;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
-		return -ENODEV;
-	}
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_CHIP_ID_L, &low);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_H, &high);
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_CHIP_ID_L, &low);
 	id = (high << 8) | low;
 
 	if ((id != OV2722_ID) && (id != OV2720_ID)) {
@@ -929,8 +924,9 @@ static int ov2722_detect(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = ov2722_read_reg(client, OV2722_8BIT,
-			      OV2722_SC_CMMN_SUB_ID, &high);
+	high = 0;
+	ov2722_read_reg(client, OV2722_8BIT,
+			OV2722_SC_CMMN_SUB_ID, &high);
 	revision = (u8)high & 0x0f;
 
 	dev_dbg(&client->dev, "sensor_revision = 0x%x\n", revision);
-- 
2.26.3

