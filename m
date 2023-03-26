Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD8020F8
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679835404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47SSw0FAIC6XRUpZxGWJ69o8W+2IBdufTOfNiRZChbc=;
	b=Q24d3WBPLqqhmxuvvgBboZSgEZE4QqG+E2WcwVLNASn/Mor2hS3QzFXoHvc1f8urqjJ1xZ
	YfcohbtVDhNFTSgjo1eOIPGEyFE0+A8TjChEKOGa87yp0YqiEcGhmow/PeekNcs9izjqxe
	kz3pDruX0BKM+Psrj9BIg6Ym6T7Xzx4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-cy-nrGqHMGO7Oga86vT95A-1; Sun, 26 Mar 2023 08:56:41 -0400
X-MC-Unique: cy-nrGqHMGO7Oga86vT95A-1
Received: by mail-qt1-f199.google.com with SMTP id y10-20020a05622a164a00b003e38e0a3cc3so4184430qtj.14
        for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 05:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679835400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47SSw0FAIC6XRUpZxGWJ69o8W+2IBdufTOfNiRZChbc=;
        b=HYTuN9E4duLluAwJwqovdz05/PFFm8qnW9JNSbjKXyzEEeVJazpq+zk4RRqplC84+9
         B6bo9UrI1FzOvpF9BrXeFA6wGx3bkRREGIZzuD32edzaUo68e/hDIBb7t4pYb9mLg0BF
         cFBXW1OVlDpgyfeGKR4980j010IqtiTpUorcV7GndL4IuB0qEXsGRKuBMweSqhbrYAcK
         o+N8qsn7qITooj/g1axZKGy+iZNAIK7iEAVumj14BxkCthcBUz5jUQmkW2jDTuAGxBhz
         ntOxaDjzKPYMcXA4gzUXT435l8bdPv8K/O7W5R9q2u41LohqYAzXHXimgtStO1TeZ0ID
         1EGg==
X-Gm-Message-State: AAQBX9cqAqFFHpSxNW8gZUAX/WFRWna7BkfR74D27PpEZpyf66k1XACn
	Kt8Jsg1xzBHVkqUOpiVeDdeRmYDTMmv/K1a1Ku4y3QQ+i+Ox7uwCN3R0Zw1ZjlHG+91mbfJULIp
	ca9R7elGd6LXT6w==
X-Received: by 2002:a05:6214:1250:b0:5bd:74a7:e6f0 with SMTP id r16-20020a056214125000b005bd74a7e6f0mr14502204qvv.20.1679835400646;
        Sun, 26 Mar 2023 05:56:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350bhx11T/RNLAJdDBA6Mssd67CsVxPgrDHm9hYyEZVFHfIDz4wjUNY5I3aS4EEt4hazRV+cDfA==
X-Received: by 2002:a05:6214:1250:b0:5bd:74a7:e6f0 with SMTP id r16-20020a056214125000b005bd74a7e6f0mr14502188qvv.20.1679835400391;
        Sun, 26 Mar 2023 05:56:40 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r80-20020a374453000000b007465ee178a3sm14628954qka.96.2023.03.26.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:56:40 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: song@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] md/raid5: remove unused working_disks variable
Date: Sun, 26 Mar 2023 08:56:37 -0400
Message-Id: <20230326125637.1352895-1-trix@redhat.com>
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
drivers/md/raid5.c:7719:6: error: variable 'working_disks'
  set but not used [-Werror,-Wunused-but-set-variable]
        int working_disks = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/md/raid5.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 7b820b81d8c2..2b1e78c46817 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7716,7 +7716,6 @@ static void raid5_set_io_opt(struct r5conf *conf)
 static int raid5_run(struct mddev *mddev)
 {
 	struct r5conf *conf;
-	int working_disks = 0;
 	int dirty_parity_disks = 0;
 	struct md_rdev *rdev;
 	struct md_rdev *journal_dev = NULL;
@@ -7913,7 +7912,6 @@ static int raid5_run(struct mddev *mddev)
 			goto abort;
 		}
 		if (test_bit(In_sync, &rdev->flags)) {
-			working_disks++;
 			continue;
 		}
 		/* This disc is not fully in-sync.  However if it
-- 
2.27.0

