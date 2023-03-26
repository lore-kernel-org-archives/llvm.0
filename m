Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B9920E4
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679863511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7IOcXTh9I7uiQA9WNwWCeWSt6lyYLrODB3Q4jVF7TuE=;
	b=BRJX81BTx84NVOVU45aftQmVO9anRd2KHiuDAwZRnwkdFR+pxGvwD6NS4MV7r8JhorOmXJ
	uGyHs7lp4PGPaLoS2Xxn3yLgGftGB1hs684i/0wHM/NHuwzpgGP6ps1F7Ue0+cKOwJX124
	jir6AzGrl7PyGcTxlr8TlGLdx3+qJ74=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-20qZC9dgPt-G742-NWLnfQ-1; Sun, 26 Mar 2023 16:45:07 -0400
X-MC-Unique: 20qZC9dgPt-G742-NWLnfQ-1
Received: by mail-qk1-f199.google.com with SMTP id 66-20020a370345000000b00746886b1593so3094565qkd.14
        for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 13:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679863507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IOcXTh9I7uiQA9WNwWCeWSt6lyYLrODB3Q4jVF7TuE=;
        b=3iFNPDagg7kKyoZ+vosjuNI0F148VpWKb7kciqWqV4D0t7+KRENvuu0dmqtntUrDGt
         s5bMzGDtHjODUkaWPMWyjS0bJ/0ZDQZDQw23ShdhZLh086vEpZ9nnN10kMZswUEhR1v9
         utx7WPM93NLK57h2miDhqo66h4W9HM/LwwvFgdWF279oY0rmA+0IYWv3nwGiezpn0vZz
         JBsaKfWoxFt+b1Vu2O6pC75ELpCAcQyKyYAW/uQBPhL+PrH57EUhyUwOTLgDTVZtNlWd
         SJeCV0+K5++APhMsfFAV45lTO0TXIA/lQriECnl/kz3aChfIgQTc/2Teu05DDGD66Ui/
         rcIg==
X-Gm-Message-State: AAQBX9c5jB3ObEhYbNSHru1j6Aud+lW9LX7pPidBW4L8kDxMEjV9Ni2a
	xCYhenaPW6YaiWvcBYYTiLs5f2N14oWpTW4Yss+nUXR4DlzgmLqSHIRH7RMoSmjRnNXxdaEHRNi
	yisox3ChH/bOAVg==
X-Received: by 2002:ad4:5c61:0:b0:5c9:422e:c7b9 with SMTP id i1-20020ad45c61000000b005c9422ec7b9mr17854423qvh.19.1679863507219;
        Sun, 26 Mar 2023 13:45:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZjsPhfI22krBSpVeD7ukHBFaXleij2uEqfBoP4AArai+Rx/kYQO2keYf2S6wktYrRJ1jJg/g==
X-Received: by 2002:ad4:5c61:0:b0:5c9:422e:c7b9 with SMTP id i1-20020ad45c61000000b005c9422ec7b9mr17854402qvh.19.1679863507008;
        Sun, 26 Mar 2023 13:45:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id z83-20020a376556000000b007468ed0160csm9877770qkb.128.2023.03.26.13.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 13:45:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nathan@kernel.org,
	ndesaulniers@google.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	jack@suse.cz,
	jlayton@kernel.org,
	song@kernel.org,
	yi.zhang@huawei.com,
	bvanassche@acm.org
Cc: reiserfs-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs: remove unused sched_count variable
Date: Sun, 26 Mar 2023 16:44:59 -0400
Message-Id: <20230326204459.1358553-1-trix@redhat.com>
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
fs/reiserfs/journal.c:3034:6: error: variable
  'sched_count' set but not used [-Werror,-Wunused-but-set-variable]
        int sched_count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/journal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9ce4ec296b74..4d11d60f493c 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3031,7 +3031,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
 	unsigned int old_trans_id;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
 	struct reiserfs_transaction_handle myth;
-	int sched_count = 0;
 	int retval;
 	int depth;
 
@@ -3088,7 +3087,6 @@ static int do_journal_begin_r(struct reiserfs_transaction_handle *th,
 		    ((journal->j_len + nblocks + 2) * 100) <
 		    (journal->j_len_alloc * 75)) {
 			if (atomic_read(&journal->j_wcount) > 10) {
-				sched_count++;
 				queue_log_writer(sb);
 				goto relock;
 			}
-- 
2.27.0

