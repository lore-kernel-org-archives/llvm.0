Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE310EB
	for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681773005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9KwBP9Man5SYvHcbBmo3b28W9QLZLArX7nGl4kEM31Y=;
	b=TdM0rMj0UCSvSAI+/UAOTvovt8HkYvaQPITqDLOb1w//MqmfdMYmXxcvBzrk7dvbJa1agT
	XY417lUaovYyxdCDHsYy7etd+3zGDG/g97RCRIlXUBj4XNi10ZJC8Z04UEIOE/swNX+zt6
	f4f7rhj00BPifVJt/pyExmRHM8ga4VY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-3aFzfWGIM_qdpRyyz_yYZg-1; Mon, 17 Apr 2023 19:10:03 -0400
X-MC-Unique: 3aFzfWGIM_qdpRyyz_yYZg-1
Received: by mail-qk1-f200.google.com with SMTP id 194-20020a370acb000000b00746b7fae197so1963087qkk.12
        for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 16:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681773003; x=1684365003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KwBP9Man5SYvHcbBmo3b28W9QLZLArX7nGl4kEM31Y=;
        b=EgUOQOJbvlQ+/a2av5v3qpEKzz/+NCu7XOzxzHFYNoDr1iy78NCBFP+lAafbeLP7GV
         W6BmwhPyFZNH1GVprIVbwimVI1DTAjUtN/1FnYbO9GRhbdWaL4IhegCYPvWvcSgPwpJ0
         SnQo601FnShILCANB0fkmgZ9bIsnljp9+lswmS3jJ/ifUf4XYtl05tpVpr37z1bo/z1D
         mhMwpVlB321+VcRe63ny1Dam+Fe2aSb2NoP8aNSOKMK482ZmDrhfkssZjVBrVezDzr/j
         LwUoCR62YfKjDMjX9R2uo2LRkQgBvHlHjkOZsnN8qCV46j/BNv3XO7qz+u0B5or4JXms
         tyhQ==
X-Gm-Message-State: AAQBX9eQbfuu/PCy7Jt51xW06q7pTfVQxAHVMDU7bj0DmmO/XbQJqG93
	3l69yw++QTL8Eks+/d2cMRh+1ccz/922wqkZfr4qPw9UNwE0EnCB2+2xJyfNhhGpHZEW0AFls2f
	Os3sS79pvJK+tzg==
X-Received: by 2002:a05:6214:202d:b0:5c8:403a:22f8 with SMTP id 13-20020a056214202d00b005c8403a22f8mr20199716qvf.5.1681773003527;
        Mon, 17 Apr 2023 16:10:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bd/2/c5QbKCswcHJPCu2Ivyl4odfLfeqheGCnBG0dmlgXXCyJCkdUwofowvXv/jLIeXWkPpw==
X-Received: by 2002:a05:6214:202d:b0:5c8:403a:22f8 with SMTP id 13-20020a056214202d00b005c8403a22f8mr20199697qvf.5.1681773003276;
        Mon, 17 Apr 2023 16:10:03 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id b6-20020a0cbf46000000b005ef465ad69bsm3337943qvj.23.2023.04.17.16.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 16:10:02 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: mcgrof@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] module: remove use of uninitialized variable len
Date: Mon, 17 Apr 2023 19:09:57 -0400
Message-Id: <20230417230957.3221615-1-trix@redhat.com>
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

clang build reports
kernel/module/stats.c:307:34: error: variable
  'len' is uninitialized when used here [-Werror,-Wuninitialized]
        len = scnprintf(buf + 0, size - len,
                                        ^~~
At the start of this sequence, neither the '+ 0', nor the '- len' are needed.
So remove them and fix using 'len' uninitalized.

Fixes: 0d4ab68ce983 ("module: add debug stats to help identify memory pressure")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 kernel/module/stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/stats.c b/kernel/module/stats.c
index d9b9bccf4256..f0619170bd3d 100644
--- a/kernel/module/stats.c
+++ b/kernel/module/stats.c
@@ -304,7 +304,7 @@ static ssize_t read_file_mod_stats(struct file *file, char __user *user_buf,
 		return -ENOMEM;
 
 	/* The beginning of our debug preamble */
-	len = scnprintf(buf + 0, size - len, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
+	len = scnprintf(buf, size, "%25s\t%u\n", "Mods ever loaded", live_mod_count);
 
 	len += scnprintf(buf + len, size - len, "%25s\t%u\n", "Mods failed on kread", fkreads);
 
-- 
2.27.0

