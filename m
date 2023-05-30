Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190D21076
	for <llvm@lists.linux.dev>; Tue, 30 May 2023 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685456525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IaNRJCmDjWU8/6DXmsxqc7rHWPn8lAenVzUVcNnxOjU=;
	b=Sva+4y1B8HzZN1+lFooKT10XRE1u4wYxG7tXwmescDVh+dPKmkj/9FuNlTA6l9AvkTW6ZS
	NTNDEZbB9vcLPDfoQgnhtZ7/2SQvQMvIZG6d1n59sE7WqgoqZa/jpkqSLhKLJ9/BtPmfD6
	OWV1J36hAEia9gz02r8scVwGGmVadxk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-cnXh-6gcNkKKBkjOnMJkHg-1; Tue, 30 May 2023 10:22:01 -0400
X-MC-Unique: cnXh-6gcNkKKBkjOnMJkHg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3f392b106b8so67555501cf.1
        for <llvm@lists.linux.dev>; Tue, 30 May 2023 07:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685456517; x=1688048517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaNRJCmDjWU8/6DXmsxqc7rHWPn8lAenVzUVcNnxOjU=;
        b=XAWR2s2Gmw5Ml5JEkipcIbXzalk0zkxja12PYeWaWsWzzgAnJBPufDkhmm3GNUSrUI
         ZtpoFajo63fTb4MD6aLBYaphxJ2TRmWze5TqKISbd5JfrXtOi/mpdlFxUHXEK5bSDfo+
         5MULlNURNF5cy3dab4L15iPyJ4kbxXk78forvIdr1zSMmw88G3dXwOGwwy16jnjO9zJv
         ADapstlVwpgnKl1UMFTc2tTr+fRFM+GqRLGXtqq6TgcaWj00SKRpVCuKgoHxef/jSwLj
         8zun/41PbQyal+g3nc/MaH6+dfRYkgCpkDfu64sSEQ8V/LTRnDaNtDtbVJSO9LSvNO/0
         /h+g==
X-Gm-Message-State: AC+VfDzj2gGmmRXUywUmRjsDz1RaUq0gctZQCXG4RT4a83IaEoRoJZns
	mV60Zi72o+wWxRLau1e2IZFSUC4Fjz+g/o/6ks2vo8m4ZaeqcMlG7qqL2wZcmHcWT3xiz4Tzw3n
	zf6wUerMHJ45RQw==
X-Received: by 2002:a05:622a:1787:b0:3f8:20a:1c6a with SMTP id s7-20020a05622a178700b003f8020a1c6amr1912804qtk.40.1685456517403;
        Tue, 30 May 2023 07:21:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yvPRFJ6QfVfk1/1OEdvl2Lu3bQMAfd0qtXiTSv1WBwMYtf1F4J8MySyj03BE8wXZx/eMRPw==
X-Received: by 2002:a05:622a:1787:b0:3f8:20a:1c6a with SMTP id s7-20020a05622a178700b003f8020a1c6amr1912788qtk.40.1685456517195;
        Tue, 30 May 2023 07:21:57 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i26-20020ac871da000000b003f394decd08sm4652992qtp.62.2023.05.30.07.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:21:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] btrfs: remove unused variable pages_processed
Date: Tue, 30 May 2023 10:21:54 -0400
Message-Id: <20230530142154.3341677-1-trix@redhat.com>
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
fs/btrfs/extent_io.c:230:16: error: variable
  'pages_processed' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned long pages_processed = 0;
                      ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/btrfs/extent_io.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 89e093ae1c33..6919409c1183 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -227,7 +227,6 @@ static void __process_pages_contig(struct address_space *mapping,
 	pgoff_t start_index = start >> PAGE_SHIFT;
 	pgoff_t end_index = end >> PAGE_SHIFT;
 	pgoff_t index = start_index;
-	unsigned long pages_processed = 0;
 	struct folio_batch fbatch;
 	int i;
 
@@ -242,7 +241,6 @@ static void __process_pages_contig(struct address_space *mapping,
 
 			process_one_page(fs_info, &folio->page, locked_page,
 					 page_ops, start, end);
-			pages_processed += folio_nr_pages(folio);
 		}
 		folio_batch_release(&fbatch);
 		cond_resched();
-- 
2.27.0

