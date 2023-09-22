Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FD943AB8
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:51:49 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-692779f583fso1464322b3a.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405109; x=1696009909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsmMQ6krAwAnzPF3fdWBN7ZYXZOUHbuU3lEOUk2NaIQ=;
        b=c/Vz0YrGsNzTEiPBg67Tt92FcXcpEHPfSVxEJerYzRDxb8V9255mgMwCD0LHj8ID5T
         Cjil+EmZJ/kCmT6xnGJafIP3Rd3ilMBkxgBBOI/a1CFj+5VtzCE0I8aJ7wTatK2Dhlp9
         h18afP+Z35MWoazHX/v7UKRoky/4rArVphC8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405109; x=1696009909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsmMQ6krAwAnzPF3fdWBN7ZYXZOUHbuU3lEOUk2NaIQ=;
        b=looE4N0iqkXrVEuJO6wNpornRViJvObsdcOa1WIgAymGiEAkkA5R6mAV1F1JyMxSOx
         4OF9/WruosC8MOCZspKd8qNuG7JXBlb742qhdMuifa/w2IBttbYzMyPUjikXfwy1YNdA
         qMOrqlAJrH+HXbLaGjd+EqlItTpLqhlhjR88QwTsXedh1xwgg4oUxOqIpsgYAPdLaoF5
         f/bm7vuG8+ktOULwnWmnMGeF1a+koadMmdMlVH6kY59d25qLJf2VegMRpig3aYgF8OEv
         jwKM8/NMIlo3uu7AwkTzTdkDVyVoyVWuXYVuMCPPkrmnR0QQ+5+t6GTs1qg2oVZ3BTtO
         PqWg==
X-Gm-Message-State: AOJu0YzRSdTYiHTM8SFVRuF9hB9KX9rZMkeRZvNhyQOUT+lfcSD70mf2
	7KlmrvzP/p9G9IHSyefa0Baxrg==
X-Google-Smtp-Source: AGHT+IHbhoC9rDpc1qX1ly2mgTN/S/Ww+ZEC1lkxqLq0fJPJPh+dwlksi9VUQd4aEWshzXY00puTcQ==
X-Received: by 2002:a05:6a00:2d94:b0:68e:2478:d6c9 with SMTP id fb20-20020a056a002d9400b0068e2478d6c9mr164234pfb.2.1695405108883;
        Fri, 22 Sep 2023 10:51:48 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p10-20020a62ab0a000000b0068790c41ca2sm3472604pff.27.2023.09.22.10.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:51:48 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Benson Leung <bleung@chromium.org>
Cc: Kees Cook <keescook@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiang Jian <jiangjian@cdjrlc.com>,
	chrome-platform@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] platform/chrome: wilco_ec: Annotate struct ec_event_queue with __counted_by
Date: Fri, 22 Sep 2023 10:51:47 -0700
Message-Id: <20230922175146.work.219-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524; i=keescook@chromium.org;
 h=from:subject:message-id; bh=e1ZqynN9loVhS8+oR1i/+utvHCkGfpoIEpm/aYvNyDE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdQy9C+3oWrxbkRNSsFkLrCWSYDM2/sWuxmwC
 tMv/weV8pCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UMgAKCRCJcvTf3G3A
 JsSVEACFH2wrdHPw7AiB5kOrwR8BTwEXFdchI+hhWo9w6mWLv40k/1F5iqb4aU2VNjMok9NaFLT
 xH0oWaaak/HJFJQX6RNj6ki1evQPTfUSe3r3QKdLJO/66MAsEOwStztGz8gI5QiSXJk5hFha7me
 /HZFiMeQd1UD4i3TuVB9JBbaNzF5Uj5R8QII6Wg1NoC8CSY3joJVel1baQ6YM5mtdKqAONP00Nc
 gggO3cUde1R3eel5kJg7ZwJNNvWkk2yAyF8mx3h9E/iZcxQRM6274ADxvQFOayfLQkAV8TAEK1J
 8Hg6b3XRMOi0Qklntjcr/+lHcomhoohabMbzSGLGSMwdcovjnxk2xJq/pNnE+gK1hDqxgo3vtHL
 LmUOKZZwDV4e9Lt6vgXxURSCyYZBAhA5ERxALUfarPlYNtVSzfTVpvp1xNO+YZHckTsnkS4HOpL
 dA1+s1V5x7zj3ey5aZQBCry/zlGCIoH/OnoLzMt1kNAmYNPQ/e2CPICn9GoaA7qpxK9rLUPrw1A
 S5mWfprdS5o52qYqbXEm5aOR4v+j9XMnJIYGmi5UWCO4BUARVBd9Ai7pSWdQ8j9udJA5OATCN3U
 Q9qg6IzzfdFjmAjFiht+mZaQJ73CJObmFpsCn1VscsldTgpngcGnDm+Ft0y1lH6C/KIZyXRs42B
 Bo26BPB S0FiNjzg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct ec_event_queue.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Dawei Li <set_pte_at@outlook.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiang Jian <jiangjian@cdjrlc.com>
Cc: chrome-platform@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/platform/chrome/wilco_ec/event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/chrome/wilco_ec/event.c
index a40f60bcefb6..f80a7c83cfba 100644
--- a/drivers/platform/chrome/wilco_ec/event.c
+++ b/drivers/platform/chrome/wilco_ec/event.c
@@ -95,7 +95,7 @@ struct ec_event_queue {
 	int capacity;
 	int head;
 	int tail;
-	struct ec_event *entries[];
+	struct ec_event *entries[] __counted_by(capacity);
 };
 
 /* Maximum number of events to store in ec_event_queue */
-- 
2.34.1

