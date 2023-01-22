Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB532590
	for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674402548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DFbyoejAIdnfrNzW5cK4QSeXywphc6GIMI0C0e0eVJM=;
	b=RnTBqvzmoRb6IqwEXjIKJP9sRiP26AVz0VHWkqi9ddC9lpJ6A3kmTNr8c40MlED3YDXgX3
	f+rgcbSSqmE2FuZC0vUyw9iI4bYzRvDMCmDBKjS5mZNO/rSQ3MVOkcxrGliCSrVc/0oYOl
	WqAinO7SR7YEr7VNG6f5jUTqIeGsjf4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-4XS2M8lyNmCg_Wcy0c5_LQ-1; Sun, 22 Jan 2023 10:49:07 -0500
X-MC-Unique: 4XS2M8lyNmCg_Wcy0c5_LQ-1
Received: by mail-qk1-f200.google.com with SMTP id u10-20020a05620a0c4a00b00705e77d6207so7159797qki.5
        for <llvm@lists.linux.dev>; Sun, 22 Jan 2023 07:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFbyoejAIdnfrNzW5cK4QSeXywphc6GIMI0C0e0eVJM=;
        b=kmCfWR5dhAPTDEPzuWFuPq0Tlem6Ht1Ps9NFcJoOB0IX6i6uN8D29Wiw/FZtmB0Fuj
         AqPuK7KvSjjjZLQ54yjWtq4Kkgbj8yaC+tYd7nhH2AIhMEcc/mxvDvX1+ucAAC75XRSV
         idiYlr+bR0v/FYbecpyTd9SpqMSNv9e0QCq8ZPyBCLTJTBOMsS+Hzy2OFJfE6vum/BQz
         +2pT29yln2EEMl++B0pwQAJ9S3FRRzbn7NUGrQ7tuBc+HIiTdIs8jfBYZ+wd9ffw0Qty
         wxUZWINL1DVhbYSvevqojQ92s8TWHCNb5UwY6rTQGxyFsmE3gBKhILFxu6laMOTDqKMm
         t61w==
X-Gm-Message-State: AFqh2krJqeG6YrvsMG07s3QfdqjhLiep3BQ7+KygGFT+sc1tcQb4k3S+
	NqAkdEEMUj43bVb8uxCObG2Oqp69SM84b3wDCr2mpwXKzfnSaZmGSnDI2MBfRvzpHeOuQhIyvlp
	RXppRhY2V9T0rnA==
X-Received: by 2002:a05:622a:5d86:b0:3b6:301f:7b3d with SMTP id fu6-20020a05622a5d8600b003b6301f7b3dmr30207699qtb.65.1674402546790;
        Sun, 22 Jan 2023 07:49:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNrJUlEZmoEfpchm9hSMxWlPveAw9LrPSEM9CMrsFLIBcI3fydh1ltFEimuIOjLGnPmhMnKg==
X-Received: by 2002:a05:622a:5d86:b0:3b6:301f:7b3d with SMTP id fu6-20020a05622a5d8600b003b6301f7b3dmr30207677qtb.65.1674402546486;
        Sun, 22 Jan 2023 07:49:06 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h8-20020a05620a284800b006fa7b5ea2d1sm29932207qkp.125.2023.01.22.07.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:49:06 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: tim@cyberelk.net,
	axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] paride/pcd: return earlier when an error happens in pcd_atapi()
Date: Sun, 22 Jan 2023 07:49:01 -0800
Message-Id: <20230122154901.505142-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

clang static analysis reports
drivers/block/paride/pcd.c:856:36: warning: The left operand of '&'
  is a garbage value [core.UndefinedBinaryOperatorResult]
  tocentry->cdte_ctrl = buffer[5] & 0xf;
                        ~~~~~~~~~ ^

When the call to pcd_atapi() fails, buffer[] is in an unknown state,
so return early.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: remove unused 'r' variable
---
 drivers/block/paride/pcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index a5ab40784119..47757ba1a09f 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -825,14 +825,14 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
 			struct cdrom_tochdr *tochdr =
 			    (struct cdrom_tochdr *) arg;
 			char buffer[32];
-			int r;
 
-			r = pcd_atapi(cd, cmd, 12, buffer, "read toc header");
+			if (pcd_atapi(cd, cmd, 12, buffer, "read toc header"))
+				return -EIO;
 
 			tochdr->cdth_trk0 = buffer[2];
 			tochdr->cdth_trk1 = buffer[3];
 
-			return r ? -EIO : 0;
+			return 0;
 		}
 
 	case CDROMREADTOCENTRY:
@@ -845,13 +845,13 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
 			struct cdrom_tocentry *tocentry =
 			    (struct cdrom_tocentry *) arg;
 			unsigned char buffer[32];
-			int r;
 
 			cmd[1] =
 			    (tocentry->cdte_format == CDROM_MSF ? 0x02 : 0);
 			cmd[6] = tocentry->cdte_track;
 
-			r = pcd_atapi(cd, cmd, 12, buffer, "read toc entry");
+			if (pcd_atapi(cd, cmd, 12, buffer, "read toc entry"))
+				return -EIO;
 
 			tocentry->cdte_ctrl = buffer[5] & 0xf;
 			tocentry->cdte_adr = buffer[5] >> 4;
@@ -866,7 +866,7 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
 				    (((((buffer[8] << 8) + buffer[9]) << 8)
 				      + buffer[10]) << 8) + buffer[11];
 
-			return r ? -EIO : 0;
+			return 0;
 		}
 
 	default:
-- 
2.26.3

