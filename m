Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C42256F
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680264211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wx3vtf0mWAsv14OEzo/oiyKAqTl2ZYLXwnoN7IpbtAc=;
	b=jPtFV/eZ0Cqc9uqmfrKdosLWsRoVDVc0YrhtDwTo6HqRHlsj8LZY0UvZ/XFS+Qk6G5tbpL
	Cyy9Yf/ZqOiaNAbumd2hr4fWsoXqfoy5vP6dwHklxgDsjuzq1mjy4jpimJ3q+OxF1jhJRZ
	EvvnqGDv1M7g1A+dFFUrviz8WyR6rKY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-iV2goxZSPJGJKfnstdcOVg-1; Fri, 31 Mar 2023 08:03:30 -0400
X-MC-Unique: iV2goxZSPJGJKfnstdcOVg-1
Received: by mail-qt1-f199.google.com with SMTP id r4-20020ac867c4000000b003bfefb6dd58so14593887qtp.2
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 05:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx3vtf0mWAsv14OEzo/oiyKAqTl2ZYLXwnoN7IpbtAc=;
        b=MQlkqJGPxeE4MESXYLSw9Q2iQnrbYWYfBEt4BQS7fWchXI+9pB905fnH3wxhfNi/Ja
         K0XKA9ig5+pdBatelc5O2UYoVxU1BTyqcyeMnASeS3+0+afqL+aVU+4b7ftDxCD8qUZC
         aqHPR9znFCLnQlXGNOd5AgGpSXLeaM304ne7iYBox41/+hMejZllYDqbJeYkZBCTF553
         l7a/2OIWVDrAyILSQE/RnUJCvdlOH2oV1jUBa3P4pC0ZtH5kjXgbG4gDLiu4LeXX3jv5
         3pkCWOelKpSfGEWzPE+v1jNkYDbjMV/dm7NUO9pzhvWODHEMdgMUsWwap6cPz7J+rYRf
         LwfA==
X-Gm-Message-State: AO0yUKXqkEh+qnRlU0zavm2V6+OKxvXeCArcyhG2zxnuArbZ+Bcs8//h
	pKUPuJqYPIC79mM8oAnJ70jTP/q3KJzEx1FjTLgEbCIHeq4bbQjeryBQDiL2vr+cjU8ivOeM9T5
	fgM7ppMIn2/QBYw==
X-Received: by 2002:a05:622a:b:b0:3d7:960e:5387 with SMTP id x11-20020a05622a000b00b003d7960e5387mr43506117qtw.35.1680264208201;
        Fri, 31 Mar 2023 05:03:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ZpMzqAp6V4PuHglmLJBY+O32MWZXvMJwJo0y3JPh1yW5xOStZL/VMELHuwC+qx1W8VX1z1A==
X-Received: by 2002:a05:622a:b:b0:3d7:960e:5387 with SMTP id x11-20020a05622a000b00b003d7960e5387mr43506086qtw.35.1680264207923;
        Fri, 31 Mar 2023 05:03:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x20-20020ac84a14000000b003e635f80e72sm575569qtq.48.2023.03.31.05.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:03:27 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	axboe@kernel.dk,
	akpm@linux-foundation.org,
	bvanassche@acm.org,
	jack@suse.cz,
	yi.zhang@huawei.com
Cc: reiserfs-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs: remove unused iter variable
Date: Fri, 31 Mar 2023 08:03:25 -0400
Message-Id: <20230331120325.1855111-1-trix@redhat.com>
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
fs/reiserfs/stree.c:1265:6: error: variable
  'iter' set but not used [-Werror,-Wunused-but-set-variable]
        int iter = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/stree.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 84c12a1947b2..ce5003986789 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1262,7 +1262,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 
 #ifdef CONFIG_REISERFS_CHECK
 	char mode;
-	int iter = 0;
 #endif
 
 	BUG_ON(!th->t_trans_id);
@@ -1274,7 +1273,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 		removed = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
-		iter++;
 		mode =
 #endif
 		    prepare_for_delete_or_cut(th, inode, path,
-- 
2.27.0

