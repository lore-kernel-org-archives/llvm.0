Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D3F4A83
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645976619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smOWqrVZ4eE9JROh4nQ4evf5L+Z1zd/JgqN0UrYlquk=;
	b=aJ4tYEkJ8q2E15m/kPsCWo0zSQqXF6pIAeVlpfsC/Unyc4k1FDwGdO739N0yq4XXlpRkl1
	HCq5ZxyCJS5LTr6dFzPHM//MjHE7dpDcRvr3O5HZaN6vylytKul3wzT9lVOkzC2a4vpUpg
	cFDP6Bz9k33K8aQSH623gJXKud80CoQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-uCpCudfINsue-PbJthiKLw-1; Sun, 27 Feb 2022 10:43:38 -0500
X-MC-Unique: uCpCudfINsue-PbJthiKLw-1
Received: by mail-qk1-f197.google.com with SMTP id i10-20020a05620a144a00b00648d4fa059dso9545776qkl.0
        for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 07:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=smOWqrVZ4eE9JROh4nQ4evf5L+Z1zd/JgqN0UrYlquk=;
        b=odfGpsXlsQxpINdE01ccREDQs5CD/8W2mXJ3us7DjLg0Aa0E/BlmVK+BxcyDExCldl
         /RXr9YRuwmG5MXhwLHWrIk1QucD3MYYQEnLVOC3nx5JxTlbBoLUS5hybHksPaC6ZLxWy
         IIBXkAtkPMR1A+OszDXUL13diEMjvF96CdlebTjIP9D6/x5oPxBT9RWYV/z+VSHzBOt2
         ov/au9+QFXzp6d1hkee6siAyXzD1K27fBNKYyF97otbSThpKpzIk7+6iRJjtCKXB8P2V
         BjRDpz85NGL9hDoarmULIqIqTf1pqlEMgte4isIUWNDN1wtLi+0mXDwsG3PX2uI7DKIH
         Kq/w==
X-Gm-Message-State: AOAM5308+3xe5479Zk0rx1H6sRnkVGBsmy39rN5qe39WU6QglLDJuOGF
	e4tVI1Ze5fahhtMW2OM87Lvr0+3NEhxmEV28ERPSpZAztdwpptG975pbuHfxVSM1zqxmAoYlgzJ
	8kIOMo6kDgM1hcQ==
X-Received: by 2002:a05:6214:23c8:b0:432:e64e:969a with SMTP id hr8-20020a05621423c800b00432e64e969amr5260656qvb.109.1645976617587;
        Sun, 27 Feb 2022 07:43:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWzeFRSiG3cOIAwp97dJ6GYhZ7NMFr89QVxs3UHGNUewDKGBxEIr1Lw8iFumUGLWe3rqDY1g==
X-Received: by 2002:a05:6214:23c8:b0:432:e64e:969a with SMTP id hr8-20020a05621423c800b00432e64e969amr5260645qvb.109.1645976617352;
        Sun, 27 Feb 2022 07:43:37 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g19-20020ac87f53000000b002dd45d67a8esm5104596qtk.59.2022.02.27.07.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 07:43:36 -0800 (PST)
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
Subject: [PATCH] iio: scd4x: check return of scd4x_write_and_fetch
Date: Sun, 27 Feb 2022 07:43:31 -0800
Message-Id: <20220227154331.80338-1-trix@redhat.com>
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
 drivers/iio/chemical/scd4x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 20d4e7584e923..b978330fb761c 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -471,7 +471,7 @@ static ssize_t calibration_forced_value_store(struct device *dev,
 	ret = scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(val));
 	mutex_unlock(&state->lock);
 
-	if (val == 0xff) {
+	if (!ret && val == 0xff) {
 		dev_err(dev, "forced calibration has failed");
 		return -EINVAL;
 	}
-- 
2.26.3

