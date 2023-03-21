Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE27D505
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 18:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679424498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m16LG5qfJ+bTUG6Spw+RzSoYpGmgfuoZ6sJRsgb/iNs=;
	b=g2OjsOpkHV4PtfQ1K45KRMH40txc1+2RQm/oyRz/tlOcz6jM3HGUAgQJPl0PcrE2TatCQl
	KdrykfTc5GSostQ0lHuEp8FTk5KmEiBB9DWaDr7wqY3r6cR+cVeBafwHkQJAGJAmE9SGmc
	t/dkaXqFPFaoAVHS4mpa3omxcY3sGo4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-jzxa_KRuN4WbKalZI82zKg-1; Tue, 21 Mar 2023 14:48:17 -0400
X-MC-Unique: jzxa_KRuN4WbKalZI82zKg-1
Received: by mail-qk1-f198.google.com with SMTP id 187-20020a3707c4000000b007468d9a30faso2897488qkh.23
        for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679424497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m16LG5qfJ+bTUG6Spw+RzSoYpGmgfuoZ6sJRsgb/iNs=;
        b=G2sDJ0RBIU+xGvyhHBNiMtpbUMwYf98o5zNRi2xl6aUbK/Uw08ZLmaz1Gc8iRDKo1T
         55jP4zOdnweDraXL8WrP8rdlQX73+5vrwRyqUXnMJjhxSXWuUcEXWLQTZg0x1g9U5nMl
         je+1sqFQjo/GCyGsR7Wx9ZEXQx/lC82p3G2tTIzi47x8kF3fCEywJpbHDDw53Z9IoBzJ
         iiJkg766VqlkAXxG9k1qvt9SULnYGlgEZKEXboYfTHGdG0dGDEZaCJU+9VpHt0gPsEAD
         Q2mgvQ0bY5kEwoZo20bgDCcmbRsE8uO+snKXW66nfn6hf2mx8hQyX492FMB1dBV1WyNh
         J/Cg==
X-Gm-Message-State: AO0yUKU/4xsIHf9qiOACS2JvP7/NIWA3zKwk+W8Q95R/p7dbR56LjRS0
	GNGsKhh/hqBmxwcmUJ/LV8LRbrUOpQGxhCAiYcU6X1vrNOUtGrcoLXyqK0sRv0YqvIXIY1qglS6
	jlY9xGZTzTjFekw==
X-Received: by 2002:a05:6214:e4c:b0:5a3:44a1:788d with SMTP id o12-20020a0562140e4c00b005a344a1788dmr1318811qvc.29.1679424496997;
        Tue, 21 Mar 2023 11:48:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/uiKZ9Rf3XmfwDfIlgK1+2Ku5dlt08hCszlwq6yiw64bq4vrpan11278XtwOhJWytpr/YkPw==
X-Received: by 2002:a05:6214:e4c:b0:5a3:44a1:788d with SMTP id o12-20020a0562140e4c00b005a344a1788dmr1318782qvc.29.1679424496733;
        Tue, 21 Mar 2023 11:48:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 66-20020a370b45000000b0071eddd3bebbsm1525699qkl.81.2023.03.21.11.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:48:16 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: dchickles@marvell.com,
	sburla@marvell.com,
	fmanlunas@marvell.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] liquidio: remove unused IQ_INSTR_MODE_64B function
Date: Tue, 21 Mar 2023 14:48:11 -0400
Message-Id: <20230321184811.1827306-1-trix@redhat.com>
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
drivers/net/ethernet/cavium/liquidio/request_manager.c:43:19: error:
  unused function 'IQ_INSTR_MODE_64B' [-Werror,-Wunused-function]
static inline int IQ_INSTR_MODE_64B(struct octeon_device *oct, int iq_no)
                  ^
This function and its macro wrapper are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/cavium/liquidio/request_manager.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index 8e59c2825533..32f854c0cd79 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -40,15 +40,6 @@ static void  __check_db_timeout(struct octeon_device *oct, u64 iq_no);
 
 static void (*reqtype_free_fn[MAX_OCTEON_DEVICES][REQTYPE_LAST + 1]) (void *);
 
-static inline int IQ_INSTR_MODE_64B(struct octeon_device *oct, int iq_no)
-{
-	struct octeon_instr_queue *iq =
-	    (struct octeon_instr_queue *)oct->instr_queue[iq_no];
-	return iq->iqcmd_64B;
-}
-
-#define IQ_INSTR_MODE_32B(oct, iq_no)  (!IQ_INSTR_MODE_64B(oct, iq_no))
-
 /* Define this to return the request status comaptible to old code */
 /*#define OCTEON_USE_OLD_REQ_STATUS*/
 
-- 
2.27.0

