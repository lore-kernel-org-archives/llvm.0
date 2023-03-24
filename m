Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9AD2F7
	for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 17:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679679062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yS3LsgviE014HnSKQD34+joeCRTUmhUGUupA/8MRjOw=;
	b=URTHvHiEavAQBBtJ84ia1h1+hJnIWZevzV9dSxzFC0CHjeNVML6wVoTcV4mWokTMx8plKk
	GC6BIV8+wvJbf2mqlNWZ4hKpi5J3GFqpBv+WLutlnO+DHfR4KhWzxz4X/s0ALMyPtSGWPs
	1IscFCCH+owUF9pRShiVLa7Mv/4EKGE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-x42C_Qz5MH6wOWBE3PPVkA-1; Fri, 24 Mar 2023 13:31:00 -0400
X-MC-Unique: x42C_Qz5MH6wOWBE3PPVkA-1
Received: by mail-qt1-f199.google.com with SMTP id t15-20020a05622a180f00b003e37dd114e3so1435310qtc.10
        for <llvm@lists.linux.dev>; Fri, 24 Mar 2023 10:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679679060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yS3LsgviE014HnSKQD34+joeCRTUmhUGUupA/8MRjOw=;
        b=yEh3ufFFn3SgZbMW0GH83hCmwm6Jl20TsF4q0D8glch/ocnAy9vc1opPbllCISI+/n
         VU+bS4ykpIG+X9YZPSys2GbDBnI5M9fHGGMxnVA56/X7Lql8UTP+TBrqTLMmlaWh1MD0
         LKgSgf0fM1b7b3cgsmErjJZ2OpjIDbPm+d0SFuRu/sd4B8veGbcfcTxl+kV9/oozs9pg
         xJyYeovGbE3aBFSjVp3DtjKQ+UlnrGOeqrWD4Y6ZjUJE0jWOXE2f9/IiXPmH5uWdGFeN
         53ZsuJzdlQRYL/4BhTHO3o8AtoyyGHGWvqL2f+Nq3Tnt9WlqBTfRlG2qiREh/nmEkqKH
         beRw==
X-Gm-Message-State: AAQBX9exXM0nx0xHu7f2TqhlFOqHL2uRtwJLd8cP5G5Xnv9ITqtNzrtu
	xrvzJX98dRmjM1tOWPn/l65O1Fu6KjaJyBh61fbIQ57sr/u8qfI2cX6ZbnTkpWfqrBetYYw0/In
	Sc4/2FH97iv14xA==
X-Received: by 2002:ad4:5ce4:0:b0:5cd:3326:792 with SMTP id iv4-20020ad45ce4000000b005cd33260792mr6578287qvb.38.1679679059814;
        Fri, 24 Mar 2023 10:30:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bL4q0XGxOQvO9LMmJSyYvbSuls1/y5BcXjsOOA+UHzr4CWRhukcoArhUedrPOnlcO+cjsmPw==
X-Received: by 2002:ad4:5ce4:0:b0:5cd:3326:792 with SMTP id iv4-20020ad45ce4000000b005cd33260792mr6578253qvb.38.1679679059593;
        Fri, 24 Mar 2023 10:30:59 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id cw2-20020ad44dc2000000b005dd8b9345aesm829312qvb.70.2023.03.24.10.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 10:30:59 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: linkinjeon@kernel.org,
	sfrench@samba.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ksmbd: remove unused is_char_allowed function
Date: Fri, 24 Mar 2023 13:30:56 -0400
Message-Id: <20230324173056.2652725-1-trix@redhat.com>
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
fs/ksmbd/unicode.c:122:19: error: unused function
  'is_char_allowed' [-Werror,-Wunused-function]
static inline int is_char_allowed(char *ch)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/ksmbd/unicode.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/fs/ksmbd/unicode.c b/fs/ksmbd/unicode.c
index a0db699ddafd..9ae676906ed3 100644
--- a/fs/ksmbd/unicode.c
+++ b/fs/ksmbd/unicode.c
@@ -113,24 +113,6 @@ cifs_mapchar(char *target, const __u16 src_char, const struct nls_table *cp,
 	goto out;
 }
 
-/*
- * is_char_allowed() - check for valid character
- * @ch:		input character to be checked
- *
- * Return:	1 if char is allowed, otherwise 0
- */
-static inline int is_char_allowed(char *ch)
-{
-	/* check for control chars, wildcards etc. */
-	if (!(*ch & 0x80) &&
-	    (*ch <= 0x1f ||
-	     *ch == '?' || *ch == '"' || *ch == '<' ||
-	     *ch == '>' || *ch == '|'))
-		return 0;
-
-	return 1;
-}
-
 /*
  * smb_from_utf16() - convert utf16le string to local charset
  * @to:		destination buffer
-- 
2.27.0

