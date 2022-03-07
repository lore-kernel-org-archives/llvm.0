Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E968B7C
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 18:31:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t11so24767130wrm.5
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 10:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m72AqO39IssFZDp6OQ50uBNhRiFL6qd5FMbmNqInMYY=;
        b=HG61rhPPl9ijRh/DZjgsmR3XRCPX1iN+yDTPO4PeEJ0JpRqVmDcfGpwFqmwcSp6+6d
         cgebmSecr2IZzjfmNSNVux931ao5vRa6VgGAO/I6H8rv5tfNjHw04WBUabXBhdbpB8RN
         blalDdsFWmw5RVfjNfZMRrh4ebsmXAnZL9kUCrraKLoBHvZZ1X3Npz4kxI5QeXHgfFq5
         wRf0Q1kt+cti0BPtl1h8Y8KkYtAfKEZPWqusx+0ADysc50rydtVt97Buo4HWBwDWTCx9
         w+FaTbI3/fmy3/AlmN8mQEEulymHvFKwFes2F76kBnOKoCm/YqB2c3ddSQSweQt9u+ev
         VF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m72AqO39IssFZDp6OQ50uBNhRiFL6qd5FMbmNqInMYY=;
        b=IKh0VLfkJAJayw0IUsxKNAtWhH11wMTMnulf/VyouSYe9QS6rmsYoty50mz0op/2AE
         oq3f4q6FacmFLudu9gHJMCDSPjZBuGr7SKkYstBb4metTH+CwO2ixk5K2SndEBvyOwas
         hX7XqOOuYLf7iLEk46MGzzE1CP6EEYdEkaPuXNQFiBDSusgnJd/ghgqk6g6nWR/rVp5D
         407Xa3BO1D7/B84nhxW59BBI0lySKjDkGigJRVPqDN6D9JEQW5kIp567wEwNslKqn7mU
         qYA+8hhitnrm31hFm0ELsAdCTsBbrHDzbJdhNHfZLVegAy3C3m0ccCH/hpqSjPlXJfRD
         QcZw==
X-Gm-Message-State: AOAM533kss8kUGP/OvU2rtEnS0/i64fXefnwVeU7x5rzRThnBU3niYoL
	P5mmEfbrcUvpCOY0yP0B6IE=
X-Google-Smtp-Source: ABdhPJxY7q8nq1BsndaRkG27EN2+/8HLVeSIn5ggzQYJgfOt/hH8PMDTLAG/+sdpy1hRcaUn75eAtQ==
X-Received: by 2002:a5d:6852:0:b0:1f0:98e7:a963 with SMTP id o18-20020a5d6852000000b001f098e7a963mr9303209wrw.646.1646677861176;
        Mon, 07 Mar 2022 10:31:01 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id h13-20020adff18d000000b001f1de9f930esm13371560wro.81.2022.03.07.10.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 10:31:00 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] USB: serial: usb_wwan: remove redundant assignment to variable i
Date: Mon,  7 Mar 2022 18:31:00 +0000
Message-Id: <20220307183100.150082-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable i is being assigned a value that is never read, it is being
re-assigned two statements later in a for-loop. The assignment is
redundant and can be removed.

Cleans up clang scan build warning:
drivers/usb/serial/usb_wwan.c:151:2: warning: Value stored to 'i'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/usb/serial/usb_wwan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
index cb01283d4d15..dab38b63eaf7 100644
--- a/drivers/usb/serial/usb_wwan.c
+++ b/drivers/usb/serial/usb_wwan.c
@@ -148,7 +148,6 @@ int usb_wwan_write(struct tty_struct *tty, struct usb_serial_port *port,
 
 	dev_dbg(&port->dev, "%s: write (%d chars)\n", __func__, count);
 
-	i = 0;
 	left = count;
 	for (i = 0; left > 0 && i < N_OUT_URB; i++) {
 		todo = left;
-- 
2.35.1

