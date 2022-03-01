Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EF17E4
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 02:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646103154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wtwD31/3vxlTAO3x0e3WlhDgfN73zgYlAP/xJTtBWTk=;
	b=TiMss91Sc6Kv4OJeTz6DWJx3DjKlJtj54RuuXXCBvZ0i9J1P3WKBelFQOikJ8z6nxwrurc
	Puy+Fk0DS1SUedNk+tx7F60YThqa7zbzBxlU6mJJOQ0W1faKr/0OjUTGkEYOMaLpu+Ou6G
	BEzyUJy/XYX1hzBFkLqim4JiRBJacNI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-O0TrNYk9PwSBq4nniZ_i8g-1; Mon, 28 Feb 2022 21:52:33 -0500
X-MC-Unique: O0TrNYk9PwSBq4nniZ_i8g-1
Received: by mail-qk1-f200.google.com with SMTP id t10-20020a37aa0a000000b00605b9764f71so12982081qke.22
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 18:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wtwD31/3vxlTAO3x0e3WlhDgfN73zgYlAP/xJTtBWTk=;
        b=XquPMkDHmSeD8czejJXDAm6xh0htkonN8nrIdHEeNrWh3dhZWim/RUeFzq7tA4hkfh
         FAGdN0T9ZDta1dKfuyQ0BbmAEZXmAFxLH8k2KFOF3dOw/1tKoVJ/5vFPFTBsjTlMGoJc
         zPVCfE1ObxIyIxHgtLWffcSCqyspY3ZkaWV4bQQLNZPALxF8GwCCk4nezEupjHUH5rwH
         W954rfW6RmrN2rXX+GgNM/uxSBzuJbPO13oqz4N7cCMVsZ+zAyLth/2krN0O/JlUFkSL
         m59FKdw+aX/2Tl/D2FmpkEH84YJ194lBn3TC6Za76py0Ucm1ZAXi4FdmXybrNyjG9xhD
         e87Q==
X-Gm-Message-State: AOAM530z+CfZd/ZJ9YvY5nVD8h9M85MSKQhYFx40Dbvia7KoVqqLT18W
	IZ42/OjpCHcafhqvCqVNnrl3aawnPqOWnmYPRZWLkvQQHYd8E4Vyt2nw8Wc6cvgluP3oD4S3xiG
	Syr7G1tBmEVpZAg==
X-Received: by 2002:ae9:d842:0:b0:547:b883:932d with SMTP id u63-20020ae9d842000000b00547b883932dmr12459347qkf.646.1646103152646;
        Mon, 28 Feb 2022 18:52:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3IyXCmmpTR5dLhhN0LNYcofK/4TPhGco8CWp5Hk9TKdbj8OZ9i5OKyRghyBv/atBgK0FT8w==
X-Received: by 2002:ae9:d842:0:b0:547:b883:932d with SMTP id u63-20020ae9d842000000b00547b883932dmr12459338qkf.646.1646103152413;
        Mon, 28 Feb 2022 18:52:32 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id j10-20020ac85f8a000000b002dde6288fa7sm8383230qta.83.2022.02.28.18.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 18:52:31 -0800 (PST)
From: trix@redhat.com
To: roan@protonic.nl,
	jic23@kernel.org,
	lars@metafoo.de,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] iio: scd4x: check return of scd4x_write_and_fetch
Date: Mon, 28 Feb 2022 18:52:23 -0800
Message-Id: <20220301025223.223223-1-trix@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this problem
scd4x.c:474:10: warning: The left operand of '==' is a
  garbage value
  if (val == 0xff) {
      ~~~ ^
val is only set from a successful call to scd4x_write_and_fetch()
So check it's return.

Fixes: 49d22b695cbb ("drivers: iio: chemical: Add support for Sensirion SCD4x CO2 sensor")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: rework return on error logic to be similar to existing code

 drivers/iio/chemical/scd4x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 20d4e7584e923..37143b5526ee6 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -471,12 +471,15 @@ static ssize_t calibration_forced_value_store(struct device *dev,
 	ret = scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(val));
 	mutex_unlock(&state->lock);
 
+	if (ret)
+		return ret;
+
 	if (val == 0xff) {
 		dev_err(dev, "forced calibration has failed");
 		return -EINVAL;
 	}
 
-	return ret ?: len;
+	return len;
 }
 
 static IIO_DEVICE_ATTR_RW(calibration_auto_enable, 0);
-- 
2.26.3

