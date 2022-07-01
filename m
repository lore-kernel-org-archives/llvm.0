Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3471850
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 11:27:27 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id fd6so2558986edb.5
        for <llvm@lists.linux.dev>; Fri, 01 Jul 2022 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=kPJJjylIpBkQ8W7Ml6hHpSSjjYliXppQHMQmyiUop9Q=;
        b=L1IPD8ninOruMAbXZlKHku59T3sS5xXk+D9sBBiOg/rk1J6jDylYkWEK/coJsiGpB9
         /4sjWjEaryt0I3Is97qYC5cqLSxIonGDXwChh47Mz5LKZbjz+Iw4moJxMCQhbxjGW+pX
         ihNGXvBG6j0giHRLnYrOm9/QxgDrUvTbOU2Dsier3V+MuxvZqXbCXFOxA3YjKyRxATYm
         yT8RhhHKAOiRXpvyWAvjZlkTBoXsHftq4IqpedCo9dIQN1QWzivBcIjkuIm8jkEi3k+A
         F6k7xaRNMKW0QS9vNOI9Ye6/c9i8j1udo8US4ftQqAX+KBEMz/0wNEnxFIuVAEDLGh1V
         DXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kPJJjylIpBkQ8W7Ml6hHpSSjjYliXppQHMQmyiUop9Q=;
        b=bF9N9UtdH+qwtS1bh+krigFp3b4A5D1X6bXHKsX+5Np2p8QQogaKJzIJBUJK2MQ0yZ
         /gv35YEKmFJ4tVDYy2SqrP7MBsvYRHdSt8TOPqpi316x5lNOr+Io4jDAoIAgADXla6yD
         0xX5VMNwZhaFtL3A9AjxedrsiAkkCExLDxhjJHKqV9CRQTSmun2rPisHulIm3qkc+9+f
         w5Bn5tw8zoy/Os6mVsTEsh4gowpoeZBVv80qzys4gc4zSIW9GOsP0p6ri07+xX7YPP5J
         ueZI2L71/FGYeUYP7wLhqNlngX/wsCFmoFdlEKSlCl43cE2AJE5W2EiNkwhz7Jj/fk6I
         EPTw==
X-Gm-Message-State: AJIora+B1a1oOZQgSZlMK/lsZgBO47fPmbF0OHEp0YxBgsh8tlgQ98Gm
	kIzxwnY7Y6S7seWjNDarB+0=
X-Google-Smtp-Source: AGRyM1susy/qfIZI1T1yxmxSf7281014snIkVQO+0mLyOdyCK9p25FB2sMMTP+WEOQ99BhQIt+uCNw==
X-Received: by 2002:a50:fc15:0:b0:435:7897:e8ab with SMTP id i21-20020a50fc15000000b004357897e8abmr18287719edr.17.1656674846155;
        Fri, 01 Jul 2022 04:27:26 -0700 (PDT)
Received: from felia.fritz.box (200116b826fa4e0041b3c167ba41e809.dip.versatel-1u1.de. [2001:16b8:26fa:4e00:41b3:c167:ba41:e809])
        by smtp.gmail.com with ESMTPSA id ds12-20020a0564021ccc00b00437d3e6c4c7sm4764548edb.53.2022.07.01.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:27:25 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] HID: core: remove unneeded assignment in hid_process_report()
Date: Fri,  1 Jul 2022 13:27:20 +0200
Message-Id: <20220701112720.13452-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Commit bebcc522fbee ("HID: core: for input reports, process the usages by
priority list") split the iteration into two distinct loops in
hid_process_report().

After this change, the variable field is only used while iterating in the
second loop and the assignment of values to this variable in the first loop
is simply not needed.

Remove the unneeded assignment during retrieval. No functional change and
no change in the resulting object code.

This was discovered as a dead store with clang-analyzer.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Benjamin, Jiri, please pick this minor non-urgent clean-up patch.

 drivers/hid/hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 00154a1cd2d8..b7f5566e338d 100644
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
2.17.1

