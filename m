Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA09440
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679400855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MeqgjoxuzuKVfvN4kKyBkqoYwC4zvCCK7OH75FGIWlU=;
	b=H/Xykl++N4yHiiTc/DTrYEp6V8gvm45QNaiweWrlLqGXKH6UQ4iXXGMTYIVQG908ru6YPh
	HC8lKAl4JSYB3MRDdQx33M4Mt3bS/31ZDbPUMf2+gK5NiQiZdgjfAkYGGakUCijXik767C
	3RPc5EDDyjDS1lFwKxlm8RRIYeLuCN0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-EuUmTjDJPWaDJ8RKAVo7bQ-1; Tue, 21 Mar 2023 08:14:14 -0400
X-MC-Unique: EuUmTjDJPWaDJ8RKAVo7bQ-1
Received: by mail-qt1-f198.google.com with SMTP id l2-20020ac87242000000b003bfecc6d046so8665325qtp.17
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 05:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679400854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeqgjoxuzuKVfvN4kKyBkqoYwC4zvCCK7OH75FGIWlU=;
        b=YCE1qz8yxFxi/TyRh9zvQGvLHBHSs5lEbbYrZqrdKuX2XHXP9rhOLUmRB4G6/FXIh6
         lnRS6p8MPPvr/rECVUv6wgPB0ArqeS+o7NPU8f+pMvyaF/kGm20lPSp7/hKZJxstJNA5
         7NT8a+lS7+l7oTv4doKtLVo64okxYDW5Jc3uJ4q21eI+V0gX6yccb4xFisZqs3guyGHU
         a6kpogX14qjFSZSvJ2WYoSCeAL4r4e++8l5nolH8efaCNVvQ3C1Q1npZcbJqvVY2SNgf
         DW8mAnayAnGrhVx2k0xGuXAKxAibrXzmiSUwihVc0biCq5PcOxJF7hGqqaHOH4OBG/R0
         a7Nw==
X-Gm-Message-State: AO0yUKUC96QPH2KYT4ui/2xAu9SBnwnv8wFcPrq5ysVY4Zo7xiJpnIxi
	d7d2igCcL1wNBJrG1MGkLS4vacsPellhs/WhfrI/eO9CpPR387ZG+SudvfTQVY11Yg8GcBt1YMY
	2eEMLgqVFGtixnQ==
X-Received: by 2002:a05:6214:194f:b0:571:428:73dc with SMTP id q15-20020a056214194f00b00571042873dcmr3855045qvk.34.1679400853995;
        Tue, 21 Mar 2023 05:14:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/d3J0U6kitajYIEj3ZmtdOs+/3zJa8HNAgthEmb+l3c5O1ncy7hAlyyZwyTIOqyZbkV1OzhA==
X-Received: by 2002:a05:6214:194f:b0:571:428:73dc with SMTP id q15-20020a056214194f00b00571042873dcmr3855016qvk.34.1679400853756;
        Tue, 21 Mar 2023 05:14:13 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bk12-20020a05620a1a0c00b0074357a6529asm9225502qkb.105.2023.03.21.05.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 05:14:13 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: abbotti@mev.co.uk,
	hsweeten@visionengravers.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] comedi: remove unused dma_chain_flag_bits function
Date: Tue, 21 Mar 2023 08:14:10 -0400
Message-Id: <20230321121410.1782901-1-trix@redhat.com>
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
drivers/comedi/drivers/cb_pcidas64.c:377:28: error: unused function
  'dma_chain_flag_bits' [-Werror,-Wunused-function]
static inline unsigned int dma_chain_flag_bits(u16 prepost_bits)
                           ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/comedi/drivers/cb_pcidas64.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/comedi/drivers/cb_pcidas64.c b/drivers/comedi/drivers/cb_pcidas64.c
index ca6038a25f26..59390b23fa81 100644
--- a/drivers/comedi/drivers/cb_pcidas64.c
+++ b/drivers/comedi/drivers/cb_pcidas64.c
@@ -374,11 +374,6 @@ static inline u16 pipe_full_bits(u16 hw_status_bits)
 	return (hw_status_bits >> 10) & 0x3;
 };
 
-static inline unsigned int dma_chain_flag_bits(u16 prepost_bits)
-{
-	return (prepost_bits >> 6) & 0x3;
-}
-
 static inline unsigned int adc_upper_read_ptr_code(u16 prepost_bits)
 {
 	return (prepost_bits >> 12) & 0x3;
-- 
2.27.0

