Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F119D1846
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679232551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ANmcUKdeZ35HVLQbpIeLtv5km0l77GjCF1V3yivxd/c=;
	b=EMPh7oDosPVP1plU+4QrphvBS70Lnq75U8WI2DP14DnPA5CHOTCBHA8FYe1Q+A3qIhayok
	M3fl/cmEu+qcb5uJ3XpoDmPZQPwB0h9opIrkT9Dg0HZVbBUcXpDMVe9UNzyh5NpZDZXOG4
	sVqz0j6OKFErZWd4KhU0st3e7DGUF2c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-JLurGUGDOGqiEr0lqCoFdA-1; Sun, 19 Mar 2023 09:29:10 -0400
X-MC-Unique: JLurGUGDOGqiEr0lqCoFdA-1
Received: by mail-qv1-f72.google.com with SMTP id qf24-20020a0562144b9800b005bd49d98a78so3137134qvb.14
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 06:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679232550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANmcUKdeZ35HVLQbpIeLtv5km0l77GjCF1V3yivxd/c=;
        b=qiMbjM9TDj9V1rUFdRxabABAsOwj37kKaAIHcFZ12jM7I+GimTa0A6ZFMn9Ep0EX3s
         WObIjJbOb9BjaqLM3P56pP6dOI8h23/FQaPba0d+cKGhJdaYyiFYuRkIY1c0d5UvrrxD
         Bc43dEFPk6EvUysZhDpMcrmkW0QbJfjmBFjnHx6axebVFDNUAOq9IYk5P61ITQMy2SWr
         yD3aDSN0mwYkS7RIZmNOD/CNPEcgVB4vT940poLMM6B+SC/qpCP0bsXPPuYe1I9DhYoZ
         KntjKyUrp00rpFd9oUyles7rJ0cUb4JZ7wAdL53R09oR9lrHKVeV/02g0yTiF5NjAD4n
         SH4Q==
X-Gm-Message-State: AO0yUKUNS4wFxzIwzDytTksxcteZiQ16Dt2Sf6SAIZ/FPeUIf85oWFLN
	R/kbJiuXNgPtVkRqxUoXWfitfynBFexTv5gh+nea+a2snGTcq7dRe4/HstDOtbh8ss8eCjSJkls
	b/jXeFkJBkSYSUw==
X-Received: by 2002:ad4:5b82:0:b0:5c6:92e0:ba3 with SMTP id 2-20020ad45b82000000b005c692e00ba3mr4241348qvp.2.1679232549862;
        Sun, 19 Mar 2023 06:29:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set9gPmwGNLtM0v9nVCNI6C/T0bsibDS00yQE+EVnyhxbao46OynaehouvyMppAXl7cpBQG3Ljw==
X-Received: by 2002:ad4:5b82:0:b0:5c6:92e0:ba3 with SMTP id 2-20020ad45b82000000b005c692e00ba3mr4241321qvp.2.1679232549482;
        Sun, 19 Mar 2023 06:29:09 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 124-20020a370482000000b0073b929d0371sm5472111qke.4.2023.03.19.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:29:09 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Liam.Howlett@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] maple_tree: remove unused maple_tree functions
Date: Sun, 19 Mar 2023 09:29:03 -0400
Message-Id: <20230319132903.1702426-1-trix@redhat.com>
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
lib/maple_tree.c:331:21: error: unused function
  'mte_set_full' [-Werror,-Wunused-function]
static inline void *mte_set_full(const struct maple_enode *node)
                    ^
lib/maple_tree.c:336:21: error: unused function
  'mte_clear_full' [-Werror,-Wunused-function]
static inline void *mte_clear_full(const struct maple_enode *node)
                    ^
lib/maple_tree.c:341:20: error: unused function
  'mte_has_null' [-Werror,-Wunused-function]
static inline bool mte_has_null(const struct maple_enode *node)
                   ^
These static functions are not used, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 lib/maple_tree.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 556ca46a9b44..e407f29ef91a 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -328,21 +328,6 @@ static inline void *mte_safe_root(const struct maple_enode *node)
 	return (void *)((unsigned long)node & ~MAPLE_ROOT_NODE);
 }
 
-static inline void *mte_set_full(const struct maple_enode *node)
-{
-	return (void *)((unsigned long)node & ~MAPLE_ENODE_NULL);
-}
-
-static inline void *mte_clear_full(const struct maple_enode *node)
-{
-	return (void *)((unsigned long)node | MAPLE_ENODE_NULL);
-}
-
-static inline bool mte_has_null(const struct maple_enode *node)
-{
-	return (unsigned long)node & MAPLE_ENODE_NULL;
-}
-
 static inline bool ma_is_root(struct maple_node *node)
 {
 	return ((unsigned long)node->parent & MA_ROOT_PARENT);
-- 
2.27.0

