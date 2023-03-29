Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFD21C2B
	for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680096291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rtS7QVAtuYQjDEY7nXHnoqbfop6chvBfZPGcSLcnwDU=;
	b=RrVPoJffelg0NamurChdQj7LP4Ob/0oRPe6BmCfzhQhflYifOU1lcnpB4rK6V7lMwpSKLq
	yL4DtKnjllh1K3ajfrbPsOCqpkXgHE3I2WFcWzgyI/VGPdipuBoold6wX1PACWRQw2AxIF
	lglRLPMuy/mIYh7+QxXKIob6OI/hVfI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-WMoAf33kNLaEQxz-Xhcb7w-1; Wed, 29 Mar 2023 09:24:50 -0400
X-MC-Unique: WMoAf33kNLaEQxz-Xhcb7w-1
Received: by mail-qt1-f197.google.com with SMTP id l2-20020ac87242000000b003bfecc6d046so10254590qtp.17
        for <llvm@lists.linux.dev>; Wed, 29 Mar 2023 06:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680096290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtS7QVAtuYQjDEY7nXHnoqbfop6chvBfZPGcSLcnwDU=;
        b=K6GCzlLmw11WsbMkK0pc6Nk4JOsoALiGHIy8IPC0BLUZ5jxe4NztK5pxcdMLln+yPa
         DWfVnPl9GaTi/Slesb5q0+8JsvR4Y6wAtL+eUi1fippkkEELdpeUl4+4WE78vhpOksCK
         QVHKXu4Oh/UWcchL2uxzXukNfd2G95sx25Lm1sE+Jh32SrzNY/3Um6ZgHLix9ytelSkH
         istN+s2P8uXCHHyfhYJ5aM+vDOgNhhigCes4S4Bgdf8Gy8eBW9BIt+6/4sRH6LwghH2/
         phCN5GtK+RDbO/j8z1foxDlutZX1muBcCDL0TBx2W6BT/kCWAuLEs4Ac3r4apmnm6ZFI
         CnsA==
X-Gm-Message-State: AO0yUKUdKg4CDdC5kN0R0hGuoK7mZG3lSCZID7hRlo5fDvOE3NJeayby
	6IaYkLclgWyv0fp88o3dCAYIjVayjEGgn/Jbz4JyxqcnN70mFYczbrJCqyW2EOpGia1xhTS4kfA
	3akHGY3QQatCokA==
X-Received: by 2002:a05:622a:1903:b0:3e3:982b:f535 with SMTP id w3-20020a05622a190300b003e3982bf535mr35038328qtc.33.1680096290103;
        Wed, 29 Mar 2023 06:24:50 -0700 (PDT)
X-Google-Smtp-Source: AK7set/pxHT+zYmnDLN7+oI3EGOeAUDzDtVHPAhTMokbOjOy3WQMS3mqH9rtro9CtstXRdGMpp050g==
X-Received: by 2002:a05:622a:1903:b0:3e3:982b:f535 with SMTP id w3-20020a05622a190300b003e3982bf535mr35038289qtc.33.1680096289729;
        Wed, 29 Mar 2023 06:24:49 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id l6-20020ac848c6000000b003bfb0ea8094sm9803279qtr.83.2023.03.29.06.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 06:24:49 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: target: core: remove unused prod_len variable
Date: Wed, 29 Mar 2023 09:24:21 -0400
Message-Id: <20230329132421.1809362-1-trix@redhat.com>
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
drivers/target/target_core_spc.c:229:6: error: variable
  'prod_len' set but not used [-Werror,-Wunused-but-set-variable]
        u32 prod_len;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/target/target_core_spc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/target/target_core_spc.c b/drivers/target/target_core_spc.c
index 5bae45c3fb65..89c0d56294cc 100644
--- a/drivers/target/target_core_spc.c
+++ b/drivers/target/target_core_spc.c
@@ -226,7 +226,6 @@ spc_emulate_evpd_83(struct se_cmd *cmd, unsigned char *buf)
 	struct t10_alua_lu_gp_member *lu_gp_mem;
 	struct t10_alua_tg_pt_gp *tg_pt_gp;
 	unsigned char *prod = &dev->t10_wwn.model[0];
-	u32 prod_len;
 	u32 off = 0;
 	u16 len = 0, id_len;
 
@@ -267,10 +266,6 @@ spc_emulate_evpd_83(struct se_cmd *cmd, unsigned char *buf)
 	 * T10 Vendor Identifier Page, see spc4r17 section 7.7.3.4
 	 */
 	id_len = 8; /* For Vendor field */
-	prod_len = 4; /* For VPD Header */
-	prod_len += 8; /* For Vendor field */
-	prod_len += strlen(prod);
-	prod_len++; /* For : */
 
 	if (dev->dev_flags & DF_EMULATED_VPD_UNIT_SERIAL)
 		id_len += sprintf(&buf[off+12], "%s:%s", prod,
-- 
2.27.0

