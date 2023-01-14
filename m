Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635E7C
	for <llvm@lists.linux.dev>; Sat, 14 Jan 2023 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673715678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UL5uNX54JKFtg06F7nCs9+yy2MAYTYW/oHNsNWT8Z7o=;
	b=ZhrFuhQkzllrna0V9p3bBMjNzT1DMngJk7Sys03fFmi4HtX+P/D4ETvVlZ6G1+g2ifg1qO
	ZLHN2QiSqb8pLXbDTJC2GnzN9OYCFDmJDTdFkNMDENXkcQCCwyQUWv0AnPnxgN1PpVUw7S
	Uo62YcV0MbIewsrGEtju1J3ZIFQHSs8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-dCjqnDrpMpqDOoacGuQ1wA-1; Sat, 14 Jan 2023 12:01:17 -0500
X-MC-Unique: dCjqnDrpMpqDOoacGuQ1wA-1
Received: by mail-yb1-f199.google.com with SMTP id h66-20020a252145000000b0071a7340eea9so26078340ybh.6
        for <llvm@lists.linux.dev>; Sat, 14 Jan 2023 09:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UL5uNX54JKFtg06F7nCs9+yy2MAYTYW/oHNsNWT8Z7o=;
        b=MfJ6GLbhoxHK35i/mLsHnR50roCizzoE84Ntb4bZUnmN1Zyme3Oc5euJNuA9WkyzWm
         87EbyhGx8ZLdV55mHU4IzP1tLjjdvkwZOwyCN2O8LZoW9VItCsMcdyVO7YSd6GrJ06Vw
         9KQWdTdHtab+l2vYSrsZ9I0Sgqj7itRtmMvasb/7t57l7Vuv15PTaIAE1CNOXeXtzPEw
         10/m382TnTKUGhyNE/pnCG8itJxRwmcrapFglMKRmIx8BFvLnUEab1lcPrDBNwt9CC0/
         MWysXJW3mUPCM2r3ht6UiI5jumxYw5wEtbfDfY67tZobjl135JbS4inTXcFpthnfRxdN
         QN/Q==
X-Gm-Message-State: AFqh2krRqBLMSAbANPuDWQLAzx59BXO7hOni1SbHLbW10lYICZCW1rm4
	CeJ3+SqqaY44m/JjBT+1UAD7+CPVGZO253JPnpWPS6tsSeDcg23YU6YVRGTOEcL4itbwcm1uOj7
	2uvn7eCudiRYK3w==
X-Received: by 2002:a25:e792:0:b0:7d1:d26b:7eaa with SMTP id e140-20020a25e792000000b007d1d26b7eaamr3683923ybh.39.1673715676744;
        Sat, 14 Jan 2023 09:01:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtr8avWN03TzTzhlRuzCN6sYiu2T5Bek5rUhuA0So+cSWahDMdGma5psLhGPToohX8uBWTwcg==
X-Received: by 2002:a25:e792:0:b0:7d1:d26b:7eaa with SMTP id e140-20020a25e792000000b007d1d26b7eaamr3683890ybh.39.1673715676289;
        Sat, 14 Jan 2023 09:01:16 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id bl41-20020a05620a1aa900b007059c5929b8sm14637969qkb.21.2023.01.14.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 09:01:15 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: tim@cyberelk.net,
	axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] paride/pcd: return earlier when an error happens in pcd_atapi()
Date: Sat, 14 Jan 2023 12:01:13 -0500
Message-Id: <20230114170113.3985630-1-trix@redhat.com>
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

clang static analysis reports
drivers/block/paride/pcd.c:856:36: warning: The left operand of '&'
  is a garbage value [core.UndefinedBinaryOperatorResult]
  tocentry->cdte_ctrl = buffer[5] & 0xf;
                        ~~~~~~~~~ ^

When the call to pcd_atapi() fails, buffer[] is in an unknown state,
so return early.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/block/paride/pcd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index a5ab40784119..4524d8880463 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -827,12 +827,13 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
 			char buffer[32];
 			int r;
 
-			r = pcd_atapi(cd, cmd, 12, buffer, "read toc header");
+			if (pcd_atapi(cd, cmd, 12, buffer, "read toc header"))
+				return -EIO;
 
 			tochdr->cdth_trk0 = buffer[2];
 			tochdr->cdth_trk1 = buffer[3];
 
-			return r ? -EIO : 0;
+			return 0;
 		}
 
 	case CDROMREADTOCENTRY:
@@ -845,13 +846,13 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
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
@@ -866,7 +867,7 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi, unsigned int cmd, void
 				    (((((buffer[8] << 8) + buffer[9]) << 8)
 				      + buffer[10]) << 8) + buffer[11];
 
-			return r ? -EIO : 0;
+			return 0;
 		}
 
 	default:
-- 
2.27.0

