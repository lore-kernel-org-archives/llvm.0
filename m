Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3507DD2F7
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679680788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2SlfuA3seKVuPBc9pms+nyAsg+dbGKkRRSZsZ5fGf6M=;
	b=XiwJH+vTYLb6Ku8fvJDHnrwJM5m7nhl3bltbxwNDizxOkfVbEs+IoEEXyqE89fhWp5qpP4
	mh38wfhSwDmyO19H/eLC1vzUIuF8aVAIvy+caygMceQ1Ub+BB5rwrnnt4wGrIkymph4mbf
	p9nnnqfAxhK4ALyPabWX088CWenIN+0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-pE1RsG_dPPSTy8EEEJI2UA-1; Fri, 24 Mar 2023 13:59:45 -0400
X-MC-Unique: pE1RsG_dPPSTy8EEEJI2UA-1
Received: by mail-qk1-f198.google.com with SMTP id 195-20020a3705cc000000b00746a3ab9426so1149391qkf.20
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 10:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679680785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SlfuA3seKVuPBc9pms+nyAsg+dbGKkRRSZsZ5fGf6M=;
        b=MuWGOo+TfnLm6aKquaDw6idfNFR9NY8nPtomiBFXyWiYof3tJELc4ot1oHTqhLPzJo
         hoRgm3TtMH3DH0kbeM9XmNUiqLVjCCjqabqIwIxNFyx9/8QbcN4cv7HifDMFHd9GXiDj
         fIV5ZzG/GqiaKLWAWQS8Ed6b7qC+yudGrnjOlrFrd0j/fV+Ftk1qvjbe3y4iZhMxb56D
         /Zy42FW7m752PsllJqPIJCuFmx5FEib147uQDYcxHAyNjYsxGQTd/Dq+LDLMQuD7Br4v
         /CLTeW6x23xEnrUTPmGV8JF7HfroyGT/BKcjrNIurAmXAsDod9949RThpVOtkjxaXQ9J
         +3rg==
X-Gm-Message-State: AO0yUKUg4auDd87ZtqzavTbvDPXaJPUCGd2LWpW442NASQzJ/e/vlid1
	zh5/jSVpOCdskiqhK0wwt0Z1unwFmCwg0hr24VsT1TiGYvHuDfbWOApQ2KjdX2GexDg4JGDlZz3
	IIP0bjhwfpd+6WA==
X-Received: by 2002:ac8:7f0c:0:b0:3d9:cb72:3655 with SMTP id f12-20020ac87f0c000000b003d9cb723655mr6583285qtk.42.1679680785048;
        Fri, 24 Mar 2023 10:59:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set+EpvbTKS6UkAI9qC1M5oisPsBZrKldqHHaYLhOFZliJhezGwoJ4U58KvcHYh8O3HR+0W6PUQ==
X-Received: by 2002:ac8:7f0c:0:b0:3d9:cb72:3655 with SMTP id f12-20020ac87f0c000000b003d9cb723655mr6583271qtk.42.1679680784847;
        Fri, 24 Mar 2023 10:59:44 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id dm40-20020a05620a1d6800b0074411b03972sm1658551qkb.51.2023.03.24.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 10:59:44 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ccaulfie@redhat.com,
	teigland@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] fs: dlm: remove unused is_granted function
Date: Fri, 24 Mar 2023 13:59:42 -0400
Message-Id: <20230324175942.2653272-1-trix@redhat.com>
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
fs/dlm/lock.c:239:19: error: unused function
  'is_granted' [-Werror,-Wunused-function]
static inline int is_granted(struct dlm_lkb *lkb)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/dlm/lock.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1582c8b1404c..b9c124b88f15 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -236,11 +236,6 @@ static inline int is_altmode(struct dlm_lkb *lkb)
 	return test_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
 }
 
-static inline int is_granted(struct dlm_lkb *lkb)
-{
-	return (lkb->lkb_status == DLM_LKSTS_GRANTED);
-}
-
 static inline int is_remote(struct dlm_rsb *r)
 {
 	DLM_ASSERT(r->res_nodeid >= 0, dlm_print_rsb(r););
-- 
2.27.0

