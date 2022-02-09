Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3B42F26
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644418384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j/VJVwJcabH5SXTn4ZvXEnmPqcRm07U+dAsv8ELCv4A=;
	b=ZUnUbGvowMVxiMUCtLP03qoHy6wxoZ6IRx0YRR+xyr6NIeQpVmtBtPFpKoTsynWVV0vJTA
	9e9RXqe3CQSeU/mCBx5aeNQfD0A3/Xxmtvu++orFB/63qZSNxQN1w+0FAyzHDXncRyROa/
	X8Z7M31HL3DsQeFNupNW4PNTO0Yp0rw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-tXjnPEvsOhyIvb74lnuOiQ-1; Wed, 09 Feb 2022 09:53:03 -0500
X-MC-Unique: tXjnPEvsOhyIvb74lnuOiQ-1
Received: by mail-qk1-f197.google.com with SMTP id u12-20020a05620a0c4c00b00475a9324977so1548784qki.13
        for <llvm@lists.linux.dev>; Wed, 09 Feb 2022 06:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/VJVwJcabH5SXTn4ZvXEnmPqcRm07U+dAsv8ELCv4A=;
        b=IQZq+QhrL1vdPmIcfYpAyN2UnzKY3ukSxOges4WdS6TQDQJ3VrgnWl2bS0zHi6AeAq
         dAA9fLDYpbS0zs9vqxKsE+UPTAOJ7fjRX2j2J8oPRxtdLPBESDrathOvKu89QzGUrTTJ
         w67ws+NpZGj1hVHna0gfnf/TtPouP2kZmD/D7EiFVRBq+xaRzAO7NIhnXLwaLC1jrM/J
         rqB1U994SwCtwLbG0I8q26Zy7SFf/tplgl5Xa4Vl6E93fpe8Ygd6D40GzOPxiRO09s5n
         5s4rqJdg0ZTsjNntrdwODM3VFB8CDrR+aryewseBaUR8YeBZmuows9YbwYFMgQ29z9gT
         edNQ==
X-Gm-Message-State: AOAM532kozro2vk9JFyNTdZqTCmi3NdOuUHpRX5AfVXqXG+aQkHbInFX
	UM27ewENGHWczaIzTkE0o2S23pcoBnmH4t1xeDCiXlXnt9Lzbv1esNUn4/yZy2QZhcWzJPqre8P
	BdIFuISvSgnZdSg==
X-Received: by 2002:a05:622a:87:: with SMTP id o7mr1562246qtw.38.1644418382984;
        Wed, 09 Feb 2022 06:53:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5wcZMgzdbV24kPRKWlIzraNFqysXb9opnZC+c5gQEfuzVCDVwwO+VOEAL5ibZQMRfOE0JJw==
X-Received: by 2002:a05:622a:87:: with SMTP id o7mr1562236qtw.38.1644418382803;
        Wed, 09 Feb 2022 06:53:02 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id bk19sm8421478qkb.125.2022.02.09.06.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 06:53:02 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	david.yatsin@amd.com,
	rajneesh.bhardwaj@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: fix freeing an unset pointer
Date: Wed,  9 Feb 2022 06:52:54 -0800
Message-Id: <20220209145254.2291158-1-trix@redhat.com>
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

clang static analysis reports this problem
kfd_chardev.c:2092:2: warning: 1st function call argument
  is an uninitialized value
        kvfree(bo_privs);
        ^~~~~~~~~~~~~~~~

When bo_buckets alloc fails, it jumps to an error handler
that frees the yet to be allocated bo_privs.  Because
bo_buckets is the first error, return directly.

Fixes: 5ccbb057c0a1 ("drm/amdkfd: CRIU Implement KFD checkpoint ioctl")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 64e3b4e3a7126..636391c61cafb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1982,10 +1982,8 @@ static int criu_checkpoint_bos(struct kfd_process *p,
 	void *mem;
 
 	bo_buckets = kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
-	if (!bo_buckets) {
-		ret = -ENOMEM;
-		goto exit;
-	}
+	if (!bo_buckets)
+		return -ENOMEM;
 
 	bo_privs = kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
 	if (!bo_privs) {
-- 
2.26.3

