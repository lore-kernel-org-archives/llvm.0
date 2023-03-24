Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127D85662
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 13:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679665835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FMTjZQ/T7fVsB9p23mpEDbCQHzwssIrPeWULDPJBsw4=;
	b=BFIbtyQx88GiNdnUEKEBM4On3FAeE4FRVTg2w+h8L5QGO1OoxELhDFx+5OUVxC5a0ngWEd
	KUajk0mBUgcod3QS/ffp9E+Yi1YZeO+y9GKz9GRqoi9EiiXPbKC0NhfIt6Invg2FaY5kH/
	gg9Ysz7Ha5asYvFy9zjYh/exs+KgGqw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113--grQzjloNBKG-E99Hl_y5Q-1; Fri, 24 Mar 2023 09:50:34 -0400
X-MC-Unique: -grQzjloNBKG-E99Hl_y5Q-1
Received: by mail-qv1-f70.google.com with SMTP id dl18-20020ad44e12000000b005a4d5420bc6so1033138qvb.11
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 06:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679665834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMTjZQ/T7fVsB9p23mpEDbCQHzwssIrPeWULDPJBsw4=;
        b=fRVk/u4oDHhck9ooyly/U9Qtu+5oJqlDLaD5x/B9RiB+4xkxyfgCeRu3o6wKi0oJRQ
         8xcNpcb3gWbg9j6y4CWUFxhY43ZiGYbe0uui03iqyPpJwone4DveCUW9FGLC+wdNDlz+
         UQldcfp4M2WYZ8MxuYCiHTr5e7P+g1mk3LP3IcUJC6u9ikTX6ZWb+loQUKiidqyEzlGJ
         1g0Sm+bSJTGZ8KJ4aCyGCHKQIYTfVS/beSjl6P3o7MuYWJTpCCNxzVqhfkgYBVBxgZap
         f7E+Ut8H+7EmyVIzYCEAY0uCPe5KZLANe5cXJvdKDF40orvI2u5BXZGgiPy3RjBa+pDS
         b4PQ==
X-Gm-Message-State: AAQBX9c7xhK2rEzQBEqIOWCmINxO8dIGGojDC+mF/Qu92AC/ETmTQuc3
	ljhYfAizz93EvOSYCr4CmtHvO9RmD11KMgLJcK6WtPiYlber/+sFVtmcV/DMTf1hRwaCvvHuqik
	Yu4BQqVESYwNGKQ==
X-Received: by 2002:a05:6214:1c81:b0:5cc:97fa:eec9 with SMTP id ib1-20020a0562141c8100b005cc97faeec9mr4261661qvb.25.1679665834191;
        Fri, 24 Mar 2023 06:50:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350ahlHZPmdC3xd97ab7RGu9groXWTX+2fdJ9Ht5qCwv4vBumlH8C1WLa0jD3fUCrLsQs2svgVg==
X-Received: by 2002:a05:6214:1c81:b0:5cc:97fa:eec9 with SMTP id ib1-20020a0562141c8100b005cc97faeec9mr4261627qvb.25.1679665833983;
        Fri, 24 Mar 2023 06:50:33 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id ks10-20020a056214310a00b005dd8b934573sm697466qvb.11.2023.03.24.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 06:50:33 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Larry.Finger@lwfinger.net,
	kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-wireless@vger.kernel.org,
	b43-dev@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] b43legacy: remove unused freq_r3A_value function
Date: Fri, 24 Mar 2023 09:50:22 -0400
Message-Id: <20230324135022.2649735-1-trix@redhat.com>
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
drivers/net/wireless/broadcom/b43legacy/radio.c:1713:5: error:
  unused function 'freq_r3A_value' [-Werror,-Wunused-function]
u16 freq_r3A_value(u16 frequency)
    ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/broadcom/b43legacy/radio.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43legacy/radio.c b/drivers/net/wireless/broadcom/b43legacy/radio.c
index fdf78c10a05c..8d7eb89c1628 100644
--- a/drivers/net/wireless/broadcom/b43legacy/radio.c
+++ b/drivers/net/wireless/broadcom/b43legacy/radio.c
@@ -1709,23 +1709,6 @@ u16 b43legacy_radio_init2050(struct b43legacy_wldev *dev)
 	return ret;
 }
 
-static inline
-u16 freq_r3A_value(u16 frequency)
-{
-	u16 value;
-
-	if (frequency < 5091)
-		value = 0x0040;
-	else if (frequency < 5321)
-		value = 0x0000;
-	else if (frequency < 5806)
-		value = 0x0080;
-	else
-		value = 0x0040;
-
-	return value;
-}
-
 int b43legacy_radio_selectchannel(struct b43legacy_wldev *dev,
 				  u8 channel,
 				  int synthetic_pu_workaround)
-- 
2.27.0

