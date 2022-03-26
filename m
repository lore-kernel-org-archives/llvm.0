Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E73D61
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648323764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=azqELzyuB9oAQJF0V0iHBM8V3/Uqnp5/jPCm+apduZM=;
	b=Y8uMqxR6Ro5bWRymT8F0knAXUQmV3lOcQ9QECgaJa3N1O52GtOAx7kBlNjg08wegtBhIAZ
	dPaoI7rQYGVBDQXFO6YdUw0+Y31KW22+ynxrOxx0ZTj5wpMfXe6B+82VrHyYS2qQBlgNBU
	qlBPmnYNm5SHFWCHgGghtaa9x1XQ6ws=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-AVehnThONNyDhZzhYE0rqw-1; Sat, 26 Mar 2022 15:42:43 -0400
X-MC-Unique: AVehnThONNyDhZzhYE0rqw-1
Received: by mail-qt1-f199.google.com with SMTP id t19-20020ac86a13000000b002e1fd2c4ce5so8557408qtr.5
        for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=azqELzyuB9oAQJF0V0iHBM8V3/Uqnp5/jPCm+apduZM=;
        b=yrRgHAUPn9FLa1Q/a+vIO3jemAhJBvYHy0r7JgJcw39PC4uKJPvazgBFtF35L86sX+
         geQaYg7nVgGqADzaNd6+UHgX+xu1GFTje5TwTPMgCfcnyf9ybGcXT19IG4qARN9Naoeq
         5MLzjWp8u+mAubbvnV/D63sdfkcnuvZEYL3xh7V5P533MliplODZhNAqpWjH5wfMkcE3
         ghVJ8MhYWCOsB9Dyf/Qn1MzPflnQk79pj8bcBdZwX0njP1tMvWdJfmawXRKk1LH2d3Rm
         POloxu6FSVo/JBY4eJbx5WfL4lz//dXaEQu0YM0EPVm/NZHbpVP5Q8zLhsAmLMaC5ffl
         s3pA==
X-Gm-Message-State: AOAM530rHwqsNgAeT+PtKCcyqULrlzXt3Bq4yDHmuuOyPIa68rZDTOuN
	OrGqe/1FiK1XITUhuUKO3vDfxdoByZtkQAej4AbvKQ5wGR/XKgPtCXx9KUdVtgPEdr8TSpLzEXo
	TbB+QAMPUOz4Kig==
X-Received: by 2002:a05:622a:2d5:b0:2e1:ea60:231 with SMTP id a21-20020a05622a02d500b002e1ea600231mr14957961qtx.460.1648323762249;
        Sat, 26 Mar 2022 12:42:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiZjr3dpr/uR4Z7rNTTcx8g6KNr+3tArsL6c+HPu5J7FXrCb3tFzBBP0gPo+UTDziqlHWPdA==
X-Received: by 2002:a05:622a:2d5:b0:2e1:ea60:231 with SMTP id a21-20020a05622a02d500b002e1ea600231mr14957948qtx.460.1648323762064;
        Sat, 26 Mar 2022 12:42:42 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x19-20020a05622a001300b002e1e78062e3sm7741250qtw.84.2022.03.26.12.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 12:42:41 -0700 (PDT)
From: trix@redhat.com
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	colin.king@intel.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] rtc: check if __rtc_read_time was successful
Date: Sat, 26 Mar 2022 12:42:36 -0700
Message-Id: <20220326194236.2916310-1-trix@redhat.com>
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
Content-Type: application/octet-stream; x-default=true

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
interface.c:810:8: warning: Passed-by-value struct
  argument contains uninitialized data
  now = rtc_tm_to_ktime(tm);
      ^~~~~~~~~~~~~~~~~~~

tm is set by a successful call to __rtc_read_time()
but its return status is not checked.  Check if
it was successful before setting the enabled flag.
Move the decl of err to function scope.

Fixes: 2b2f5ff00f63 ("rtc: interface: ignore expired timers when enqueuing new timers")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/rtc/interface.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index d8e8357981537..9edd662c69ace 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -804,9 +804,13 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
 	struct timerqueue_node *next = timerqueue_getnext(&rtc->timerqueue);
 	struct rtc_time tm;
 	ktime_t now;
+	int err;
+
+	err = __rtc_read_time(rtc, &tm);
+	if (err)
+		return err;
 
 	timer->enabled = 1;
-	__rtc_read_time(rtc, &tm);
 	now = rtc_tm_to_ktime(tm);
 
 	/* Skip over expired timers */
@@ -820,7 +824,6 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
 	trace_rtc_timer_enqueue(timer);
 	if (!next || ktime_before(timer->node.expires, next->expires)) {
 		struct rtc_wkalrm alarm;
-		int err;
 
 		alarm.time = rtc_ktime_to_tm(timer->node.expires);
 		alarm.enabled = 1;
-- 
2.26.3

