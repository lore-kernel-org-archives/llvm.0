Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8321856
	for <llvm@lists.linux.dev>; Sat,  2 Apr 2022 13:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648905368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/bNqj01PYPYrfBUFqkn6y8gBVFdLyZ2mPT7ZyJEILzc=;
	b=gMy3x+5czcZ9qnnDZ1s66S/mTQeLliKhSeti02tMpdHMeZ5xKXaaBqRV1YTMZpo1CJfHOi
	xaq0EuwVlJ9KEG+Gl+CnseFnbevXwz7IG5SJCO7UijOYfs+S2jjuDyrd9Voej8NHwZHMUA
	Qi3gcEmcqdAxTFlF6rzLMLzhz3IwZLE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-Z2nCsuLOMXi-9D39rj7YQQ-1; Sat, 02 Apr 2022 09:16:07 -0400
X-MC-Unique: Z2nCsuLOMXi-9D39rj7YQQ-1
Received: by mail-qk1-f198.google.com with SMTP id i2-20020a05620a248200b0067b51fa1269so3433954qkn.19
        for <llvm@lists.linux.dev>; Sat, 02 Apr 2022 06:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/bNqj01PYPYrfBUFqkn6y8gBVFdLyZ2mPT7ZyJEILzc=;
        b=wqpMAUTk2HCxfej54AfFXa6181zEbCT6wuieTGgJNLxglq2nyYAhisoIqFIrqp71vo
         hzIZ5iKxFTHSthBVEyC1foSQzYo2gQ1Fa20Ku9j/V6SjtGy1hhrmVPQzazuddudQUnhS
         sLHzTqMpgov/XUndcDwxP7DtqYGcRc98WLKWbxx+5GwzR8jnhwccWpC/6X8wonW9bFPh
         /fuZEA+yxbfZS9s5c0GetWL8Jmzd59U1CB845MG9a3oeHj6vxDrtLRQzH0YhqzVaq58r
         s7Dy5e+Ul7wgs+uSo7bONJjkJzMPhUiIOkCyWCLHVb5LAA7v+42cBNWETccfvfFzBaOh
         7pAA==
X-Gm-Message-State: AOAM530OOq6r151JtuWKleqGNx81pfz4uhQRpxOQg26QJ3Qa6RoRnJxu
	noG4bK3UgcTD+gMUnWGWvFfCiGtGUD6IyfFk25pjhHFSX0TlMFLtsop6x4x2RAxBOMPqMbmSv5j
	mQ+R2CXp1bRRliQ==
X-Received: by 2002:a05:6214:1d0e:b0:441:4e6c:c7f with SMTP id e14-20020a0562141d0e00b004414e6c0c7fmr11653651qvd.78.1648905367413;
        Sat, 02 Apr 2022 06:16:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVznE0k9l0iCCjXjdbHfE/d0rsDri4V+m2CaMGJLMVMv82dD8YSmDIuzB8BIhgb57cTu/NTA==
X-Received: by 2002:a05:6214:1d0e:b0:441:4e6c:c7f with SMTP id e14-20020a0562141d0e00b004414e6c0c7fmr11653631qvd.78.1648905367164;
        Sat, 02 Apr 2022 06:16:07 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j28-20020a05620a147c00b0067e765e6c0asm2880735qkl.21.2022.04.02.06.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 06:16:06 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] lib: remove back_str initialization
Date: Sat,  2 Apr 2022 09:15:46 -0400
Message-Id: <20220402131546.3383578-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang static analysis reports this false positive
glob.c:48:32: warning: Assigned value is garbage
  or undefined
  char const *back_pat = NULL, *back_str = back_str;
                                ^~~~~~~~   ~~~~~~~~

back_str is set after back_pat and it's use is
protected by the !back_pat check.  It is not
necessary to initialize back_str, so remove
the initialization.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 lib/glob.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/glob.c b/lib/glob.c
index 85ecbda45cd8..15b73f490720 100644
--- a/lib/glob.c
+++ b/lib/glob.c
@@ -45,7 +45,7 @@ bool __pure glob_match(char const *pat, char const *str)
 	 * (no exception for /), it can be easily proved that there's
 	 * never a need to backtrack multiple levels.
 	 */
-	char const *back_pat = NULL, *back_str = back_str;
+	char const *back_pat = NULL, *back_str;
 
 	/*
 	 * Loop over each token (character or class) in pat, matching
-- 
2.27.0

