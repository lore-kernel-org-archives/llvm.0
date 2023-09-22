Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366CF42BEE
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:00 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c453379020so21084825ad.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405059; x=1696009859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFyJJYhu61gLnPgJC1ya/mEghfp9ocdZMiaUuBpRzCI=;
        b=jJ086sCSlkRPA5pzxeeF2zsbdmr9BAdc9J6wi2PkxttiGKmJqw0AvVBnh0FZJhGMYP
         RmvIAKD25T8bdIr3HAHbSI9NDCEuw7l1/MLZKxE9B7Xi6m9qqPb/Ubw59iWmecc4bE0o
         zeg+HZDStHBdhV5nU30zeP6CPQMsJtSIJLdaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405059; x=1696009859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFyJJYhu61gLnPgJC1ya/mEghfp9ocdZMiaUuBpRzCI=;
        b=U5SC0r7tS0fzYlfYb6s5WC2Z3Fy3oFsC/dTwrrKvtXcwv5DoQ4ZLCPExQxtV3u7iET
         VBWnq0xn/+6m2ApRHqKNkxA7cShN7xIAaE2tyO5khrNJ0v3DLrio4bTTkXpLfl950Mxb
         EnhXf8/Of5CKxyj3PO0v/MQ5x0ljwfP5p4nWXSWSElJHJcIhkXZDzg6sYf5WyoUBRGAu
         IduYYYUn67OveZPf2uZqBVZAq0fv1hisNLzCJiU+uEl0bT8nfaIsIppX+sA2Zm6HDz/R
         gAC0yPLeWgFzVOBehW9X6yGmlXoQCs+YKNcOiuvlkGziQVTISsCbBmtrjbFVEeWLjHvV
         92fw==
X-Gm-Message-State: AOJu0Yy6VbCROH4Fcjh4EVMB/do64+c25NSwNM1xF2TxpEknHYPIKlIp
	tezGzf3n+NvtMHPqdo7SAwljmw==
X-Google-Smtp-Source: AGHT+IG1adrBAZ2+GtFScfWMTn8dsWjCCh+RfOJyr3A6ecvwwm0uIC035vv1JafJavULfeMVJ0iE6g==
X-Received: by 2002:a17:902:e844:b0:1c3:f4fa:b1a2 with SMTP id t4-20020a170902e84400b001c3f4fab1a2mr222048plg.8.1695405059632;
        Fri, 22 Sep 2023 10:50:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001c5de42c185sm2833729pll.253.2023.09.22.10.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Scott Branden <scott.branden@broadcom.com>
Cc: Kees Cook <keescook@chromium.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] misc: bcm-vk: Annotate struct bcm_vk_wkent with __counted_by
Date: Fri, 22 Sep 2023 10:50:58 -0700
Message-Id: <20230922175057.work.558-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215; i=keescook@chromium.org;
 h=from:subject:message-id; bh=GdZsD7KH5MvR1EoC8TSF7iyP/6ZcwlPVOaPWgy/qG/U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQC249SPfiphqcsPLrCDIDyXGQ5SRF673Br0
 hQuer+DlnaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UAgAKCRCJcvTf3G3A
 JrF+D/0Y6GwQ6UQX5zVVwMmJRnNwyqK4+dCUgc8y1tQGnK+kPTUOZBmyS+1SoMAx5k/0bYPJakH
 5qqklha3HDxhEORrhcj4OH7BsqtkbT/KKDbCg3rTiLmq3cBgVnA+270iTiPLJB2AvsFAxBN6CrR
 AEoNs+Ijz9ShuaXP33ZqMdypuIFYnQZ25ltNHfdmj4WSj9o3UfO6S9ldRt/f0XYni1+Sqywb5M7
 1oWcVWrFiW3heKM91hca6ad5zoU9+4RbrCxIBZ0qCbgvRNvk7Mc3NWWJ21sYsniyZ0grpKRQa/r
 /5eaiwomFzIUwebpM4QlMnHm1MT8ir+fLumHPOmcZl4180wQbLTXvjAmOlRdcnMlTPVHPFDU38g
 Ez6UoDvUI3Mhep1HRy3TAJwtKgpW0ZIi5Rb3XviAV+/3Y1zivKH+WJfS0+Nwom9WX23MKCN8UnY
 lFO3dSjJ59VvKdhfEQ5OLRiOvhjiwxbj+xlBeguiL63r7KE9WgxB/Pqsx/G97UIghEsgYBWgLbT
 uIVM4vqXFolYKK5jSDyG4HS4lgD0PxpSurGZkC+PE9RqYgOKsEDrvnOlmvJSGXbag85Wx58N+XA
 YWhZgVlWuubc88sBm8HoRH8JVs+iQ+gbRCGBtZCBmERMvujOh7zX5SCEAnOLj3TqagG9GgMZZ13
 +ayp/8S h4UOHkGw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct bcm_vk_wkent.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Scott Branden <scott.branden@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/bcm-vk/bcm_vk_msg.c | 2 +-
 drivers/misc/bcm-vk/bcm_vk_msg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_msg.c
index e17d81231ea6..1f42d1d5a630 100644
--- a/drivers/misc/bcm-vk/bcm_vk_msg.c
+++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
@@ -703,12 +703,12 @@ int bcm_vk_send_shutdown_msg(struct bcm_vk *vk, u32 shut_type,
 	entry = kzalloc(struct_size(entry, to_v_msg, 1), GFP_KERNEL);
 	if (!entry)
 		return -ENOMEM;
+	entry->to_v_blks = 1;	/* always 1 block */
 
 	/* fill up necessary data */
 	entry->to_v_msg[0].function_id = VK_FID_SHUTDOWN;
 	set_q_num(&entry->to_v_msg[0], q_num);
 	set_msg_id(&entry->to_v_msg[0], VK_SIMPLEX_MSG_ID);
-	entry->to_v_blks = 1; /* always 1 block */
 
 	entry->to_v_msg[0].cmd = shut_type;
 	entry->to_v_msg[0].arg = pid;
diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.h b/drivers/misc/bcm-vk/bcm_vk_msg.h
index 56784c8896d8..157495e48f15 100644
--- a/drivers/misc/bcm-vk/bcm_vk_msg.h
+++ b/drivers/misc/bcm-vk/bcm_vk_msg.h
@@ -116,7 +116,7 @@ struct bcm_vk_wkent {
 	u32 usr_msg_id;
 	u32 to_v_blks;
 	u32 seq_num;
-	struct vk_msg_blk to_v_msg[];
+	struct vk_msg_blk to_v_msg[] __counted_by(to_v_blks);
 };
 
 /* queue stats counters */
-- 
2.34.1

