Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3890E2C9D
	for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679094385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i4/4tOgwP/X+xCG5XArCzD3rKZ+G/aYQCWfq3NKAVk0=;
	b=VW2KEVEif8KhzwN7G5iPj0uiaDlnk2rXCi6pyjbHbh18cNmrkKtivKxzRKNs1c6HFyB7D5
	L7ifGki3UOa4HqqwXs/mMteVVF48W89CzEuKD+N6u7PxU7Fo+/ZZB59VM/mJHYiQ68ID5F
	dvIFVQrcPVEWXCfqo4ZWJe1TKpfzgzk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-f-HnR1LtN-ymSOv9s4oaEA-1; Fri, 17 Mar 2023 19:06:23 -0400
X-MC-Unique: f-HnR1LtN-ymSOv9s4oaEA-1
Received: by mail-qk1-f198.google.com with SMTP id e14-20020a05620a208e00b0074270b9960dso3346874qka.22
        for <llvm@lists.linux.dev>; Fri, 17 Mar 2023 16:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679094383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4/4tOgwP/X+xCG5XArCzD3rKZ+G/aYQCWfq3NKAVk0=;
        b=VFTEcl+8bzA8XUHPYL08NyOHyy9/bZFS3xGFhhLmtXE4uVUMT7jcB/TMEKllDHvEwc
         2uFJ+Gz+BEQvz2CKMcDywyswXLQXZBytY39xQmLNzZjjFwovDhKBRLtdr84A7OhJEPk0
         jTazB1BKdlft9D73gj9w21jDorEgxElU3EufTO5Y62is4RoK8Tl4l6Z07m5OOL5crP6f
         2LMY/lfA4lWHI61nM5Ar44E/9Shwr0F2OPzt8+3Ct3J25BGXVCsoJQOHnR/WMJ3jVNtN
         7FoGKoPUyRBPoIGMLEAsp2nlzu8oqONHmhl1CH/pD54VgpRXZ/PM1HZOThxh2hwwXhsF
         TqEw==
X-Gm-Message-State: AO0yUKVyWIJY1IUBryufGY8bZ7ZiPhfV51EWadl9AWeVz1RdYi+pS2tY
	0rwLVSjPESeWcmgwjAQfTtp3+jbiH7yrVeIUykSg/HOI28ExZ2+CBp5EERhQuDw1YQ5/C2eDO1C
	jkws9huN8fyi7bg==
X-Received: by 2002:a05:6214:1250:b0:56e:a0fb:18ab with SMTP id r16-20020a056214125000b0056ea0fb18abmr43535297qvv.19.1679094383193;
        Fri, 17 Mar 2023 16:06:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set+CvCK7xfA2z4a8rn/h8YoqqpGCDL9n+rxJp8+V5zj/8rhXm9CC2WiHcUfi72KYNIoH5Wu+QQ==
X-Received: by 2002:a05:6214:1250:b0:56e:a0fb:18ab with SMTP id r16-20020a056214125000b0056ea0fb18abmr43535257qvv.19.1679094382804;
        Fri, 17 Mar 2023 16:06:22 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 13-20020a37080d000000b007456efa7f73sm2518474qki.85.2023.03.17.16.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 16:06:22 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: mdf@kernel.org,
	hao.wu@intel.com,
	yilun.xu@intel.com,
	michal.simek@xilinx.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-fpga@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] fpga: xilinx-pr-decoupler: remove unused xlnx_pr_decouple_read function
Date: Fri, 17 Mar 2023 19:06:17 -0400
Message-Id: <20230317230617.1673923-1-trix@redhat.com>
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
drivers/fpga/xilinx-pr-decoupler.c:37:19: error: unused function 'xlnx_pr_decouple_read' [-Werror,-Wunused-function]
static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
                  ^
This static function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/fpga/xilinx-pr-decoupler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/fpga/xilinx-pr-decoupler.c b/drivers/fpga/xilinx-pr-decoupler.c
index 2d9c491f7be9..b6f18c07c752 100644
--- a/drivers/fpga/xilinx-pr-decoupler.c
+++ b/drivers/fpga/xilinx-pr-decoupler.c
@@ -34,12 +34,6 @@ static inline void xlnx_pr_decoupler_write(struct xlnx_pr_decoupler_data *d,
 	writel(val, d->io_base + offset);
 }
 
-static inline u32 xlnx_pr_decouple_read(const struct xlnx_pr_decoupler_data *d,
-					u32 offset)
-{
-	return readl(d->io_base + offset);
-}
-
 static int xlnx_pr_decoupler_enable_set(struct fpga_bridge *bridge, bool enable)
 {
 	int err;
-- 
2.27.0

