Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD971161
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 16:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647708729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=saWneBVb3Kut4BG7sQxMXnQsPh0IPbc8oGB5dOPI5bM=;
	b=bR3hCRhxp6/3SI8tY+7hTEkrehJe7bG2dNYv3OtqK7Lk+NZIMFxz2zEphQVxVxDbqUIs27
	JAM4dXHV6p7caR2/Px/65dy3C5uo0OG24FXt2fAx5NjqmhLMG20Vuo7X+rkaCgq3ijftbe
	zeXQFMVTO/oGjSIF8bWSnRIf4WbNkQo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-C8ResmatMuOwMjccjddHtA-1; Sat, 19 Mar 2022 12:52:08 -0400
X-MC-Unique: C8ResmatMuOwMjccjddHtA-1
Received: by mail-qt1-f198.google.com with SMTP id y23-20020ac85257000000b002e06697f2ebso7453307qtn.16
        for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 09:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=saWneBVb3Kut4BG7sQxMXnQsPh0IPbc8oGB5dOPI5bM=;
        b=xp9787QO6kcAa6K9eePvh7OY5bjZwqoZGSQXgeygAvQ2IuU4pzDnkfqxIZpfC02RrS
         H8bz4a5Dg1XIys8f2shk0C5lhkhZkH76fr8j6ASIXlQOS6zKuUew9YhjvtBoBl3Uapmc
         ytc1E81KumaJr0E1Uop41z9ZETvcurexpi7iggWb+krTs9PvkxmcZ6qGM3xGSOIcChEf
         bpcM7T6REFd+ctFIuCkTo2OOsFJVgBBVdS2RclUAAIfNkymKcNqc3ZrA9wgsSWrXxtX4
         dytFjm3maszDlARqirA+om9UbKX4b3mCcUdA61W811HEO22NFFDQ0QWaBFKakYfUQi6W
         uVcA==
X-Gm-Message-State: AOAM531iiTePA3UPEPbXsP2Kd5CZm4YzYKrHtTghJORtu0n+tKMtRZVT
	sGqyyjR8m6QG4yyZuHiwGBrog7Gh19omKg29LVZMhDcsbWJZ0XSpyc+8H6F6Ga0ASn9oVJahA3u
	jJlPqzFs7L0cFRg==
X-Received: by 2002:a05:6214:4103:b0:440:e4d1:a2a0 with SMTP id kc3-20020a056214410300b00440e4d1a2a0mr9740314qvb.42.1647708727835;
        Sat, 19 Mar 2022 09:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6jHqOfsabhjqcfSHg8Xl46akmD6Zgg5f+CqiERLbL97pJUpKF0JjaYcTkKZUJbiUaFmv2Ow==
X-Received: by 2002:a05:6214:4103:b0:440:e4d1:a2a0 with SMTP id kc3-20020a056214410300b00440e4d1a2a0mr9740296qvb.42.1647708727655;
        Sat, 19 Mar 2022 09:52:07 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id t66-20020ae9df45000000b0064915aff85fsm5399938qkf.45.2022.03.19.09.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 09:52:07 -0700 (PDT)
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
Subject: [PATCH] livepatch: Reorder to use before freeing a pointer
Date: Sat, 19 Mar 2022 09:51:59 -0700
Message-Id: <20220319165159.2170650-1-trix@redhat.com>
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

Signed-off-by: Tom Rix <trix@redhat.com>
---
 samples/livepatch/livepatch-shadow-fix1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.26.3

