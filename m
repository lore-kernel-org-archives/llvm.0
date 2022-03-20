Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241BF7A
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 01:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647741113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7+g4lBbR9wGQEz+SJAnS0Y/H4dktfXz+TnU3wixu7kw=;
	b=M3p8VwtR19tibmsXmFVuGDnPOYQf8iOdSebghJQe2UFEdn+kWkGKSPCl0US+nTt39GJ7lI
	9FStEXHecHIF34fqonczs2836JqK5Vlm27/z83pOeW50GQhSpyjh7eHNOPhM4ZZBHegXUe
	SHCwE6g+NbbfMXmIB2GzK3gnXEWN89E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-8G0ITGNTO5a-xIxdYRsWNg-1; Sat, 19 Mar 2022 21:51:50 -0400
X-MC-Unique: 8G0ITGNTO5a-xIxdYRsWNg-1
Received: by mail-qk1-f199.google.com with SMTP id z10-20020a05620a08ca00b0067d341e82edso7702581qkz.17
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 18:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7+g4lBbR9wGQEz+SJAnS0Y/H4dktfXz+TnU3wixu7kw=;
        b=xmm568JKjblOvMpnTLtSewv0fYP6lKkN4rIn/CB1h+CGV+N2+pQOs/qMzdrf5w46ro
         DkYIqe2QiEF7YwlArcJViVJFsVDZd3IDIh4yVXq7uyX3vhiI5tCuidjZWbgZ3p/65jAK
         OefVj+voIIr+8QgAovODwxGveDa5q/ovEplFfETPnyz7Ry+dO34iwjEF5Kw9++gOMmyp
         sHEIamYY3E0P9AuVqIjRoOQXuixPlmGCMXJpNi0H1Cp9med8Mq9zjVZjvIffjY9mRDM3
         8sTXVunZvq9bBn3PtcotUXej1J38yDtjNdFAyknWHbmxMn5zdrVsih+aSDM/WlJfisGF
         5zkQ==
X-Gm-Message-State: AOAM533wvMhaoZ9r6EG69Dqb/vl5SWSy6wGJr100laNtv7MbxyTHiCez
	Gf1gMICqGaGVS7cvm6uuduywvlk2XYp8aI5N9W8Ef3aJWcAskwl/UUOC8NYxN7APtDrLt5SRuEb
	/gOxU+gCwwKHZMA==
X-Received: by 2002:a05:620a:c55:b0:67e:125b:38ea with SMTP id u21-20020a05620a0c5500b0067e125b38eamr9466527qki.396.1647741110118;
        Sat, 19 Mar 2022 18:51:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPyxoS2+EPm6TLHGvV+PXYG2sNsQSCkRQCFPHHcE/rizQ+uCKCH6QvrePSyI3ldbboUgS8bQ==
X-Received: by 2002:a05:620a:c55:b0:67e:125b:38ea with SMTP id u21-20020a05620a0c5500b0067e125b38eamr9466513qki.396.1647741109877;
        Sat, 19 Mar 2022 18:51:49 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id z15-20020a05622a060f00b002e2070bf899sm3079882qta.90.2022.03.19.18.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 18:51:49 -0700 (PDT)
From: trix@redhat.com
To: jpoimboe@redhat.com,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH v2] livepatch: Reorder to use before freeing a pointer
Date: Sat, 19 Mar 2022 18:51:43 -0700
Message-Id: <20220320015143.2208591-1-trix@redhat.com>
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

Clang static analysis reports this issue
livepatch-shadow-fix1.c:113:2: warning: Use of
  memory after it is freed
  pr_info("%s: dummy @ %p, prevented leak @ %p\n",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The pointer is freed in the previous statement.
Reorder the pr_info to report before the free.

Similar issue in livepatch-shadow-fix2.c

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: Fix similar issue in livepatch-shadow-fix2.c

 samples/livepatch/livepatch-shadow-fix1.c | 2 +-
 samples/livepatch/livepatch-shadow-fix2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
index 918ce17b43fda..6701641bf12d4 100644
--- a/samples/livepatch/livepatch-shadow-fix1.c
+++ b/samples/livepatch/livepatch-shadow-fix1.c
@@ -109,9 +109,9 @@ static void livepatch_fix1_dummy_leak_dtor(void *obj, void *shadow_data)
 	void *d = obj;
 	int **shadow_leak = shadow_data;
 
-	kfree(*shadow_leak);
 	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
 			 __func__, d, *shadow_leak);
+	kfree(*shadow_leak);
 }
 
 static void livepatch_fix1_dummy_free(struct dummy *d)
diff --git a/samples/livepatch/livepatch-shadow-fix2.c b/samples/livepatch/livepatch-shadow-fix2.c
index 29fe5cd420472..361046a4f10cf 100644
--- a/samples/livepatch/livepatch-shadow-fix2.c
+++ b/samples/livepatch/livepatch-shadow-fix2.c
@@ -61,9 +61,9 @@ static void livepatch_fix2_dummy_leak_dtor(void *obj, void *shadow_data)
 	void *d = obj;
 	int **shadow_leak = shadow_data;
 
-	kfree(*shadow_leak);
 	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
 			 __func__, d, *shadow_leak);
+	kfree(*shadow_leak);
 }
 
 static void livepatch_fix2_dummy_free(struct dummy *d)
-- 
2.26.3

