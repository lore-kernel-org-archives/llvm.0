Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2762CA0
	for <llvm@lists.linux.dev>; Fri, 24 Dec 2021 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640358520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VANKkwXTML/2/9ot1sh770YbPivcKWxATAmwzqHleQQ=;
	b=Lgm1naDCMat7MRaNP/85kZwgewcJk4nssGCoeaiS0Zk5FZHdqsA49KvNO21ddRk5iIviJY
	edb7YLLWv06ulBPsPAMs0J9rn3W6enuWoONqgyUOczYwM4KoFTPPHhXbwuoMkmu1z2B266
	/ZBKUnkKMfOfYJUtP+vhfWlmXR5j4QE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-nQXMVLejMr2uB_97DxdGWg-1; Fri, 24 Dec 2021 10:08:39 -0500
X-MC-Unique: nQXMVLejMr2uB_97DxdGWg-1
Received: by mail-qv1-f69.google.com with SMTP id iw6-20020a0562140f2600b004118fe44fa1so4096668qvb.13
        for <llvm@lists.linux.dev>; Fri, 24 Dec 2021 07:08:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VANKkwXTML/2/9ot1sh770YbPivcKWxATAmwzqHleQQ=;
        b=rARLFtzMS41dMO1ruRlovDXR7oBgYEjZRS8OL6z3rp5aoMFhpKrg14h47tlhxF0113
         svPO/nY9aewI8Krk9ExxhORMfBb9JRh94s25OOI4g833PWWcsFXaGUW7byc0T9hdUyXC
         UHA3uofNLW444uDe1Vi/4FCmTzpzbohBrQpu0GcOYzJ+4OQcgc6CtyV+Rb1/SPy3FDDY
         lPf4ky/9zECOhYMzhZEdedYUqWRn5fJoRD9ydNeBRsh2OQENwU04n3CUxeP5AfBtfFXX
         wYUdzn5ciDADOa626ArqDdLfO1WSJ81/7RbC5MZBp4ohOCVAoKxEYPCCqKibyJa9v97j
         /TLg==
X-Gm-Message-State: AOAM531BMWLrfT9wRajmjT5MkuqHEU1vUqEeBj4NPecAxO0dJIfLKH9L
	29uWffG1ZKU22yaZE5KqZVf7CCsjcue9EDlF/5frhyge0VtiPVsfqWJL3XJyJc5jE8ypfdpFux/
	b5cDNn76ndiJ04w==
X-Received: by 2002:ac8:4a87:: with SMTP id l7mr5860368qtq.310.1640358518573;
        Fri, 24 Dec 2021 07:08:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKkj/oUpZ8SgPSGh8spTXveLPNfIswgd7mJJYvqRjSeHCVzNFqxnzEZiIsSaW0BbAzrBkQHA==
X-Received: by 2002:ac8:4a87:: with SMTP id l7mr5860343qtq.310.1640358518355;
        Fri, 24 Dec 2021 07:08:38 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b11sm6512248qtx.85.2021.12.24.07.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 07:08:38 -0800 (PST)
From: trix@redhat.com
To: jacopo@jmondi.org,
	jic23@kernel.org,
	lars@metafoo.de,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] iio: chemical: set val parameter only on success
Date: Fri, 24 Dec 2021 07:08:33 -0800
Message-Id: <20211224150833.3278236-1-trix@redhat.com>
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

Clang static analysis reports this representative warning

sunrise_co2.c:410:9: warning: Assigned value is garbage or undefined
  *val = value;
       ^ ~~~~~

The ealier call to sunrise_read_word can fail without setting
value.  So defer setting val until we know the read was successful.

Fixes: c397894e24f1 ("iio: chemical: Add Senseair Sunrise 006-0-007 driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/iio/chemical/sunrise_co2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/sunrise_co2.c b/drivers/iio/chemical/sunrise_co2.c
index 233bd0f379c93..8440dc0c77cfe 100644
--- a/drivers/iio/chemical/sunrise_co2.c
+++ b/drivers/iio/chemical/sunrise_co2.c
@@ -407,24 +407,24 @@ static int sunrise_read_raw(struct iio_dev *iio_dev,
 			mutex_lock(&sunrise->lock);
 			ret = sunrise_read_word(sunrise, SUNRISE_CO2_FILTERED_COMP_REG,
 						&value);
-			*val = value;
 			mutex_unlock(&sunrise->lock);
 
 			if (ret)
 				return ret;
 
+			*val = value;
 			return IIO_VAL_INT;
 
 		case IIO_TEMP:
 			mutex_lock(&sunrise->lock);
 			ret = sunrise_read_word(sunrise, SUNRISE_CHIP_TEMPERATURE_REG,
 						&value);
-			*val = value;
 			mutex_unlock(&sunrise->lock);
 
 			if (ret)
 				return ret;
 
+			*val = value;
 			return IIO_VAL_INT;
 
 		default:
-- 
2.26.3

