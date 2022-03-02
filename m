Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1165CAB
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 18:13:26 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d3so4123275wrf.1
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 10:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L8Hwj3FIl0Xgnzes+JlfSkI7X/LRJVH+HAy2sV4IVM=;
        b=d5/4UL6UMw316oSWqEZCJq6fg77tBeU8ISJBAxeIFcSC3BBv2nxqdU3g/z4BTYns9l
         GA3zbNzD/ILhdQimnFxGx7pwdKeZ0ONMAyv5RsoFU6FKgAycB0VA8N6wVJHZhCBFvzR4
         fck4wJ6i3ALJGQfS4n858fp8cq2sKf26c4iki1R85ABS6N3VsPMYJUm0oGphl5Qk2HNA
         emxtYBzW2ZG378Svaajz0q5MT4u/pywP8S8XZF3gnCkFQHTPYQmq4OuLPM0nXqtGugvD
         qqPmQ0ERFoPbjtuURk2T4q9TeoPKFyJ9b9Lis8vR13B3Lz/eSYHThwm89hunzUzBp26M
         PWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5L8Hwj3FIl0Xgnzes+JlfSkI7X/LRJVH+HAy2sV4IVM=;
        b=emkt8sPX97g8KvFxUFPfft+FWvbwFgvmo+gX4y6DTvPdu137bFELx774wh5ExPu48a
         ZFnATwzq6AZk20Kk+3yei/Q0hTV5Ny6kscIQAd3TBjEns8Y+UM1EfYEeiaA5awBPwPQC
         sU7dkwss2S/2HfkeSvhhVcF1Vv/20HjqD7LDzGbckDsikE5NBUGrWviRT0km2tDnqZK9
         qaZkWHUTWv943fuUQ2rFxs9ABztF3J+zUxidzV1um207z2ZteO3mvqtqME7lOU/jpeIR
         dGHhs341PSdYKSpuUfyDPFJ1xJbe2bbuc8UnV3O2adhvSs87Nlo7eMCB3RppFUNOqq2V
         j1rg==
X-Gm-Message-State: AOAM530/W24zBN5hn+Ogxir+mEkH0TN96vGbxsGLzLsPtxobmGOhfPPw
	wPKLUxGfdyoOGIoVFQE2B0w=
X-Google-Smtp-Source: ABdhPJylJfs5FBTbZvwKyYefm3ujs/kNK9gAIiH6yzqV5F+X+vOMfFby1thaHMNqsJuWpe9CoEzDJw==
X-Received: by 2002:adf:80a4:0:b0:1e6:db9f:a8c4 with SMTP id 33-20020adf80a4000000b001e6db9fa8c4mr23857226wrl.345.1646244805070;
        Wed, 02 Mar 2022 10:13:25 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c020700b003862bfb550fsm1225138wmi.46.2022.03.02.10.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:13:24 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] HID: core: Remove redundant assignment to pointer field
Date: Wed,  2 Mar 2022 18:13:23 +0000
Message-Id: <20220302181323.1100490-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The pointer fields is being assigned a value that is never read, the
pointer is re-assigned a new value in for-loops that occur later on.
The assignment is redundant and can be removed.

Clean up clang scan build warning:
drivers/hid/hid-core.c:1665:30: warning: Although the value stored
to 'field' is used in the enclosing expression, the value is never
actually read from 'field' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/hid/hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index db925794fbe6..6579f4724bbb 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1662,7 +1662,7 @@ static void hid_process_report(struct hid_device *hid,
 
 	/* first retrieve all incoming values in data */
 	for (a = 0; a < report->maxfield; a++)
-		hid_input_fetch_field(hid, field = report->field[a], data);
+		hid_input_fetch_field(hid, report->field[a], data);
 
 	if (!list_empty(&report->field_entry_list)) {
 		/* INPUT_REPORT, we have a priority list of fields */
-- 
2.34.1

