Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E72C80
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642772741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17q/M65gYgBO/SPoZzHGwbDSkKeNitT4nImp6fFN+Jg=;
	b=Q/vkBAnXGEevucxZzohFCiJVUCHw6vqpSmY0pP3Cwptz/hBYEV6Rrgcxb4n6ZIQVnE8ESt
	1sP0Lgk21QAXg0qp3wmeWRklbJ5k2JNbSYafM2ppnpWS4KnwqC06J1CGUkX8BhNVlGWIZz
	Muaqzt5VU7flPV6iWeMbfa5TYUB26RQ=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-QET4UNFONYehsbAZrIvFXQ-1; Fri, 21 Jan 2022 08:45:40 -0500
X-MC-Unique: QET4UNFONYehsbAZrIvFXQ-1
Received: by mail-ot1-f71.google.com with SMTP id v22-20020a0568301bd600b00590a8d65e0fso5516297ota.4
        for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 05:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=17q/M65gYgBO/SPoZzHGwbDSkKeNitT4nImp6fFN+Jg=;
        b=H6Qx4RL8YMr6DBzqkFd1wokiLH/ezRpZs7ES4NCFP5Jn/Mw5/aGlhgVF9eCoLmbpQb
         Z16vFW5lxf0YbwVJAuvnq5UyRxZvxfQ4kExAhuFvQy5YqBGQE7sy1sYcMxizxBUXl17N
         b9uw/j2uZbh0JByfBpDL63m/GdKk3zz7InNkIKgzzzuXmO2UXeH+Rf52Z2dj5h3Vk23c
         legeXJm3oBN9L8rEivsDdWTo7Elyvyr0LbWL9nDvz1EqBbY2pPi0CJT7PLhh0eEa4LKt
         MaAKW2YKZEe2/3+YUi1xCQvltl1UEFI+hle3I/FDGKxdf6IhgmAu9O695RbWzeu2ikRO
         UkVg==
X-Gm-Message-State: AOAM530yYGoekwA4TJPsb64l3StMfIgG4ISJh7B47oTO1N9yTYnK8k70
	uqatMff0amc+hQYhvAlcapX8gnwCHIF4YjCDrvQZSvSdX1mnBctE+1SUHMWkJ8Z+SxCwdgnm/+M
	HvcpFTu1FJUZvbw==
X-Received: by 2002:aca:741:: with SMTP id 62mr570974oih.87.1642772739433;
        Fri, 21 Jan 2022 05:45:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9SguOPBXUy11/Do9O3kCGX1ZokLcCXVsUAdxGjD9Ol9xJN2frusYOCbndlnUNmcESN2jJZw==
X-Received: by 2002:aca:741:: with SMTP id 62mr570954oih.87.1642772739225;
        Fri, 21 Jan 2022 05:45:39 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m5sm1349202oiw.30.2022.01.21.05.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 05:45:38 -0800 (PST)
From: trix@redhat.com
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	anand.jain@oracle.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] btrfs: initialize variable cancel
Date: Fri, 21 Jan 2022 05:45:22 -0800
Message-Id: <20220121134522.832207-1-trix@redhat.com>
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

Clang static analysis reports this problem
ioctl.c:3333:8: warning: 3rd function call argument is an
  uninitialized value
    ret = exclop_start_or_cancel_reloc(fs_info,

cancel is only set in one branch of an if-check and is
always used.  So initialize to false.

Fixes: 1a15eb724aae ("btrfs: use btrfs_get_dev_args_from_path in dev removal ioctls")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/btrfs/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
index 190ad8af4f45a..26e82379747f8 100644
--- a/fs/btrfs/ioctl.c
+++ b/fs/btrfs/ioctl.c
@@ -3308,7 +3308,7 @@ static long btrfs_ioctl_rm_dev(struct file *file, void __user *arg)
 	struct block_device *bdev = NULL;
 	fmode_t mode;
 	int ret;
-	bool cancel;
+	bool cancel = false;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
-- 
2.26.3

