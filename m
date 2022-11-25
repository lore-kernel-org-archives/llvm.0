Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD92F46
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669375882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o0whn50hBaBPJSQq4RKgv9QraGn/cvKe5x1wVFmyAmE=;
	b=VzRg4h02QnFaPPgln/zXxQc6Q5Tj//CcpRjBv3N2mGgH5UOJsDCIU1WjSI9mImSS6QFQmz
	nxJ9qW4J20amszpiKaNOkISrIqQPFHPdX+KgIvYr/TOHTdigMDc6tAJmSqO2tG1czlXUyR
	sAclPSVlYj3i2q2f0AY/yJaryfKyk9E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-cryId-CFMbu40t_vHjbNyg-1; Fri, 25 Nov 2022 06:31:21 -0500
X-MC-Unique: cryId-CFMbu40t_vHjbNyg-1
Received: by mail-qv1-f70.google.com with SMTP id lp18-20020a056214591200b004c6d42e23aeso3482064qvb.1
        for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 03:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0whn50hBaBPJSQq4RKgv9QraGn/cvKe5x1wVFmyAmE=;
        b=tcu8xVH3kCD7o3h4TC8itP94phWM093Zc6BmqLgXGE8wNtW3PXt24ge8SepxgRGe82
         G5looZeKtWOTj0rBotedYv88WmTStA7hXT2IA+IHnUtvWl8WOGgDO5p4MGDRoNrk7qMc
         Qc0FrdrQkEUJ+UHkzrE0Zwio94i/GcK/FYtqnzTBISeFU+r0LrsmI5/fFS61f6cfJDZt
         0iu4JGuxVo6cnlfi7VRO4Mqof1oadX2YQ/QwTmoO3V/1sXnI8F3G+KuGfFfdyHMbtVIn
         1kjytMWc6WEtEueuauBPFfnLGx9FY7P7lCvn6pzzeap7HTQgA+x5pAxaOy7BIoolnfX7
         ctig==
X-Gm-Message-State: ANoB5pkbDIvs3X88EbRCaIYVCPpu3cM+AfNQJGMYS2m0QLZo0Vmdrx7a
	XN+qrrpIb0UdrwzlOM9QOKdqxmra1FvTNpu5v0Vlj93UYAd04cMky23DyR7gK3P0KtxYKobBGza
	sKACaqO2qEy9t
X-Received: by 2002:ac8:734d:0:b0:3a5:2784:f462 with SMTP id q13-20020ac8734d000000b003a52784f462mr18738802qtp.590.1669375880843;
        Fri, 25 Nov 2022 03:31:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5MrrxAhGW+JX7yXKj/nNSxGBgtw9E8v2y+gdjXK61hr+gPJZuL1eilM+sjR/92x2KZrbXqiw==
X-Received: by 2002:ac8:734d:0:b0:3a5:2784:f462 with SMTP id q13-20020ac8734d000000b003a52784f462mr18738776qtp.590.1669375880599;
        Fri, 25 Nov 2022 03:31:20 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-144.cust.vodafonedsl.it. [2.34.28.144])
        by smtp.gmail.com with ESMTPSA id q1-20020a05620a0d8100b006fc2f74ad12sm2581080qkl.92.2022.11.25.03.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:31:20 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michal Simek <michal.simek@xilinx.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Manish Narani <manish.narani@xilinx.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] iio: adc: xilinx-ams: fix devm_krealloc() return value check
Date: Fri, 25 Nov 2022 12:31:12 +0100
Message-Id: <20221125113112.219290-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
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

The clang-analyzer reported a warning: "Value stored to 'ret'
is never read".

Fix the return value check if devm_krealloc() fails to resize
ams_channels.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/iio/adc/xilinx-ams.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 5b4bdf3a26bb..a507d2e17079 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -1329,7 +1329,7 @@ static int ams_parse_firmware(struct iio_dev *indio_dev)
 
 	dev_channels = devm_krealloc(dev, ams_channels, dev_size, GFP_KERNEL);
 	if (!dev_channels)
-		ret = -ENOMEM;
+		return -ENOMEM;
 
 	indio_dev->channels = dev_channels;
 	indio_dev->num_channels = num_channels;
-- 
2.38.1

