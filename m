Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB98E3B53
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 15:21:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c192so9384135wma.4
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3zVdZIdUp2SndvqCDVv0wLLG00x7X2w4FcjL+gKARY=;
        b=nh76nqjdSWUzPHfeHac1Cemx0gt6iOLqZ7gUAYB9njkbJ5uIed+uFdnUtCgcEzkY2m
         kk1f+n1i8/SDWaZ9GivaveBtcP92ZZ+moPcualmBFLCIbjjBUDN1lrYuKuzeZBdXIooj
         dX39oEEXCFKREaU/e53HJK5Q8N1UNc4eZBIhq+cV2wEbIpejXycZ0spDbr1tGpowvwCr
         CWwDB44Sd6+nOEY7gWsKNT7dRFWs65mJNWfbApoklXkDmtNDiGk2kgfh5QeXm7EaDyzV
         /V+O6fE/c6JxjZKyNwI2OqRLyxymuLNljvcd1AFyoHiP8/Mz12C7gbfO1KIj998nsxxX
         6gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N3zVdZIdUp2SndvqCDVv0wLLG00x7X2w4FcjL+gKARY=;
        b=AvN/L3gtgclHnw2h+FTpKndeU2iMMxkvFw2mnrJufIleWsRczIKwPwUZFBubUXeuS6
         cHKpNDbOkaiytHT8zJvhxcS4h6AN1nvExa+8N2VW4SG5xeE77pEaXv7Kaoo3kHQeNpnz
         rrbL5dV5MxrMvwS8zkvGHI8xCZEVsSf1NHCpaBzTaRZzHyWCuoqXDIw92WpjQwjVuPex
         ebRcsFEWL6O9CVDmJaSZtKN/jqH01XP4NYDuS9bF/SqKlFlHrjyAQTit6cedW0HrpCWm
         PhWcYuZoVmkLRm6zU2V3IBSxdvSdU4fGvsMRfsBB8LJ3faNanxHdGHaLA/xDP29J0Hiw
         fx5Q==
X-Gm-Message-State: AOAM53357AglouguPESBC6cVatxL2EP2egAG62MjXChrwzvTghONRwlw
	odLAnBFOYNnDNtHbRqA1noM=
X-Google-Smtp-Source: ABdhPJzoVbtWjie8oUL0KyAGWJ2UJtdQdOZdXjz6HbfRjjX7p2bvz5+ddajXPvHa+Ia+Gl7C0n4jag==
X-Received: by 2002:a05:600c:2056:b0:389:736a:5631 with SMTP id p22-20020a05600c205600b00389736a5631mr15342323wmg.120.1646666511084;
        Mon, 07 Mar 2022 07:21:51 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id p12-20020a056000018c00b001f079518150sm8403134wrx.93.2022.03.07.07.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 07:21:50 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jan Kara <jack@suse.com>,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] udf: remove redundant assignment of variable etype
Date: Mon,  7 Mar 2022 15:21:49 +0000
Message-Id: <20220307152149.139045-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable etype is being assigned a value that is never read. The
variable and assignment are redundant and can be removed.

Cleans up clang scan build warning:
fs/udf/super.c:2485:10: warning: Although the value stored to 'etype'
is used in the enclosing expression, the value is never actually read
from 'etype' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/udf/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/udf/super.c b/fs/udf/super.c
index 48871615e489..4042d9739fb7 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -2474,7 +2474,6 @@ static unsigned int udf_count_free_table(struct super_block *sb,
 	unsigned int accum = 0;
 	uint32_t elen;
 	struct kernel_lb_addr eloc;
-	int8_t etype;
 	struct extent_position epos;
 
 	mutex_lock(&UDF_SB(sb)->s_alloc_mutex);
@@ -2482,7 +2481,7 @@ static unsigned int udf_count_free_table(struct super_block *sb,
 	epos.offset = sizeof(struct unallocSpaceEntry);
 	epos.bh = NULL;
 
-	while ((etype = udf_next_aext(table, &epos, &eloc, &elen, 1)) != -1)
+	while (udf_next_aext(table, &epos, &eloc, &elen, 1) != -1)
 		accum += (elen >> table->i_sb->s_blocksize_bits);
 
 	brelse(epos.bh);
-- 
2.35.1

