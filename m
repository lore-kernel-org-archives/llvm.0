Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08412F31
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647539454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CWUmn/QvK/L7nVX8kGPV5onMGWPPEQZ85b495jUko/o=;
	b=XpRovnA0wr/m5rOsALzH5dogQVNe5dikn1qPTwrLwL4tgcn8KQoQDGrr4wbzXljn7NY0Aq
	noJbnZ3j3a/ZVWStKe22o8LfsR9Cv96f9wSsXMu/DZ02OgrWbdMBCpp7JKXIgDcvAqp75o
	aceVGkJMCRKnrquHXpbM5CxAhneTijk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-I1tua6p1N_Cm7OUXeFFW_A-1; Thu, 17 Mar 2022 13:50:53 -0400
X-MC-Unique: I1tua6p1N_Cm7OUXeFFW_A-1
Received: by mail-oo1-f69.google.com with SMTP id f196-20020a4a58cd000000b00320d961e391so3686603oob.7
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 10:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CWUmn/QvK/L7nVX8kGPV5onMGWPPEQZ85b495jUko/o=;
        b=my6yd0iaPv47koPPpdEvMfBt6JwBMohzoL5X6wd0nlmXKpQ9EPumTGQKEAia1F6SIm
         yFjG/KZNmYwaTTKNYS6HBIeOthmJOe3P0gwHyE1F2i6IuVlya58uN4YTkR7AwVCj+Fnr
         CMCrDGhuEDnbSMYW08c4+xIr9h6nMtOjNMXMi2DDYzaBeJaI8vY3u3UJOm5Bft0y6E/a
         KECStVD8UD+wcEnIxjJ0maGmLO1FYCjeG6vEZH9kPLb07GZl882T7GB/085G70FEUDev
         IsLcXZHsA+PtxZNBXTClxqVj1b/5xIlB2AHsZbPSkenHzyaXuzAZdD3Vj7cCrc1GXR9N
         OXIQ==
X-Gm-Message-State: AOAM532XwohQsrJN+oO8vz4vy9vwtMma27x7y93PM57VSqaBZAkLLVQM
	wb3xpbcZIonLjgaD8PMr/yQErxsoSWBy0WC2bYomiTt8WUWo6bfa9n0mJuqrGRs6wliBZzC+6H9
	gCCfn6lKsd4KU7g==
X-Received: by 2002:a05:6808:118d:b0:2d4:be7e:6748 with SMTP id j13-20020a056808118d00b002d4be7e6748mr2506871oil.123.1647539452749;
        Thu, 17 Mar 2022 10:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztjwuwCNgzs0OEH5TeCj4r7xDj/r/kSgu0Xko2rMEd3ZIk4tDT4v84Ij+AlVx37u4LbZxI4g==
X-Received: by 2002:a05:6808:118d:b0:2d4:be7e:6748 with SMTP id j13-20020a056808118d00b002d4be7e6748mr2506857oil.123.1647539452543;
        Thu, 17 Mar 2022 10:50:52 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id e9-20020aca3709000000b002ed1930b253sm2770239oia.30.2022.03.17.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 10:50:52 -0700 (PDT)
From: trix@redhat.com
To: konishi.ryusuke@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] nilfs2: move initialization of nr_dirty to decl
Date: Thu, 17 Mar 2022 10:50:43 -0700
Message-Id: <20220317175043.1972081-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

On clang build there is this error
inode.c:227:13: error: variable 'nr_dirty' is
  used uninitialized whenever 'if' condition is false
        } else if (ret) {
                   ^~~

In nilfs_dirty_folio(), if the call to
filemap_dirty_folio() fails and there
are no buffers, nr_dirty will be uninitialized.
Move the initialization out of the buffer
block and to the decl.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/nilfs2/inode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index c1219c0678a57..01e58b65c9384 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -204,7 +204,7 @@ static bool nilfs_dirty_folio(struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 	struct buffer_head *head;
-	unsigned int nr_dirty;
+	unsigned int nr_dirty = 0;
 	bool ret = filemap_dirty_folio(mapping, folio);
 
 	/*
@@ -214,8 +214,6 @@ static bool nilfs_dirty_folio(struct address_space *mapping,
 	head = folio_buffers(folio);
 	if (head) {
 		struct buffer_head *bh = head;
-
-		nr_dirty = 0;
 		do {
 			/* Do not mark hole blocks dirty */
 			if (buffer_dirty(bh) || !buffer_mapped(bh))
-- 
2.26.3

