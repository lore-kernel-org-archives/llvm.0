Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C72560
	for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679145230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jgoarmppOveCAhzhSS+yukRVNHlYy4ELLTt4seUigM0=;
	b=V5B6P0pcAQu+lzBNarv3tUQ+xlnWqXN+GzHXCR3VSdyL8rIU+9+FpPv6xEScjAG1oJ1url
	Lp21Wutxw3bINMBmS5msGokhanXMJM70j/BBAKGWUkofET4UELKalPDIvgxjTsSBkjHsSa
	JjzXA4R+MMWgrlAFCShyAt9M8CuJo/w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-cpTxNCX6MLapLfJcCEF9kw-1; Sat, 18 Mar 2023 09:13:48 -0400
X-MC-Unique: cpTxNCX6MLapLfJcCEF9kw-1
Received: by mail-qv1-f69.google.com with SMTP id q1-20020ad44341000000b005a676b725a2so4158723qvs.18
        for <llvm@lists.linux.dev>; Sat, 18 Mar 2023 06:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679145227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgoarmppOveCAhzhSS+yukRVNHlYy4ELLTt4seUigM0=;
        b=Ttac42GyXYfB3KnhiBKkGXo55AcveUmbFG7k+jKS8pasvvJUPmUISzmJV1jtHD+rAt
         0+Y8P3ezUPjA/Hsj9tJjyYlEYjFdSCHKQJS1ckglbFQvK0HxHXzTcZ0TuDS2cDQ6tQnI
         0r9NediwZkPfL2cDq6PZD5DE5qB59OoMrEKyPoZq4jWd5CaLIatedPwk77UiRFhIrPlf
         9/JZAj71Tkl8ORcg/u6RR45vqZv5VHnWJpI6BXucgyKMHyWkQxg20Q8aPQ8YeU+9Dcxv
         dNArypG4Rr+K8YCkBnno7fmvDV7Mx15al2/cGaxJUQUgnLgg7Ks0bzRZjV2PpzAS0y2w
         q/QA==
X-Gm-Message-State: AO0yUKWGWusrhZCCSeWMz3x4bey269cMXvfnogcsulQJsyltXGAnpagP
	qQQ2gLX+2Qyvej0S1iSmwXw1kEOjJthHP8+V1cmkgIk7T8fzzbysqG1whYdwi0tsFeBYigWFFZF
	WxELb54Oa/LiHmw==
X-Received: by 2002:a05:622a:1116:b0:3d3:6285:a63 with SMTP id e22-20020a05622a111600b003d362850a63mr10899541qty.10.1679145227299;
        Sat, 18 Mar 2023 06:13:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set+Sm2ecyLp2qn8isjtzfX8KwHzTIP8qxzV+utPo3ZIhQHxrfPrkzvAXLPrT24ch0L/LOoDWJQ==
X-Received: by 2002:a05:622a:1116:b0:3d3:6285:a63 with SMTP id e22-20020a05622a111600b003d362850a63mr10899504qty.10.1679145226993;
        Sat, 18 Mar 2023 06:13:46 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bl28-20020a05620a1a9c00b007339c5114a9sm3575523qkb.103.2023.03.18.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 06:13:46 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	stern@rowland.harvard.edu,
	studentxswpy@163.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: plusb: remove unused pl_clear_QuickLink_features function
Date: Sat, 18 Mar 2023 09:13:42 -0400
Message-Id: <20230318131342.1684103-1-trix@redhat.com>
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
drivers/net/usb/plusb.c:65:1: error:
  unused function 'pl_clear_QuickLink_features' [-Werror,-Wunused-function]
pl_clear_QuickLink_features(struct usbnet *dev, int val)
^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/usb/plusb.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/usb/plusb.c b/drivers/net/usb/plusb.c
index 7a2b0094de51..2894114858a2 100644
--- a/drivers/net/usb/plusb.c
+++ b/drivers/net/usb/plusb.c
@@ -61,12 +61,6 @@ pl_vendor_req(struct usbnet *dev, u8 req, u8 val, u8 index)
 				val, index, NULL, 0);
 }
 
-static inline int
-pl_clear_QuickLink_features(struct usbnet *dev, int val)
-{
-	return pl_vendor_req(dev, 1, (u8) val, 0);
-}
-
 static inline int
 pl_set_QuickLink_features(struct usbnet *dev, int val)
 {
-- 
2.27.0

