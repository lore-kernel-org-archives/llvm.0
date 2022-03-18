Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5505815A0
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 00:23:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r10so9686113wrp.3
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 17:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUZS5i1fz1kAVVM80Oyu7b+mX6O5QtCzcdOhcl/QHOU=;
        b=EqFWZ5eHPSolbx4tQvCZl+Q2JTRB/fXuFH9BjeWTK4jAKAVb6PTRAGug9WAbrk2UXe
         ciaWvoPFO23aVrZKDwXLh059VIvo8btA5iTGOsiW2bAW/1KEePA1VvheichxFgswdqRn
         ikJI2ZoE0tUa8rygZTxkWPLCQhcyf+26XSqsJke/Sd5WZ84as7rQl0MiS81U74hyLc55
         LIu9Gd7JCW3OFke8+RKm0NHtzkFYTyH7lUMNBc5GhizqB808+YBdr/V3oExqSr0E+0Hj
         r6WQ5xNiTg7voZQNAMuySEwlhQiYB/RG+ryBk3GwvUINdPgSgcKPZ50MpS755BveHCRB
         caSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EUZS5i1fz1kAVVM80Oyu7b+mX6O5QtCzcdOhcl/QHOU=;
        b=d6eA/JLItDBor2/QcAzUZgrcHthzJBlGf17p3uDb4mP23fhjI4mweL5NpFLyfON2/z
         cpGMYC3T1RAViXmlqK3r+7Epc9QhLBMk0fzLOOITxUifMaYtGwk3X9//sAEGnoacn7vM
         NOKG5ff29ADarQf5vvdW8aPmnRvce0A0tGqwRtDLAe9/Q6+AldELDVBIrYlVpSbL+Feu
         wmWNEw405+RM7ttCPAnFJqn16yDhwM+lzcVnpaGLygthYhSYc3HJBz5gXqlrDYPicc26
         /3sq2qA8ox3HQ2Gk7eVWitVBoHytR2N5AbcM03WyQNqOQChlSYDVZJG9mqLn3vdTI78e
         Jizg==
X-Gm-Message-State: AOAM532VSFuOmbr3pcRed+3RjeLMwsKB9FXAPqOW2+vt/yYLhBWnlIiG
	fO5BzAP40jtEsjTqmV4qNHlKXyuBh50=
X-Google-Smtp-Source: ABdhPJzDt190+x1gAiJfV2NyyJQ7Ohh8/brsXamRrkHlsLOW2WrvCVh6+ledfezGgCck7Y2vWfM3gw==
X-Received: by 2002:a5d:504d:0:b0:203:e60e:49ef with SMTP id h13-20020a5d504d000000b00203e60e49efmr5835724wrt.546.1647562999664;
        Thu, 17 Mar 2022 17:23:19 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b0038a0165f2fbsm6207260wmq.17.2022.03.17.17.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 17:23:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] Input: adi: remove redundant variable z
Date: Fri, 18 Mar 2022 00:23:18 +0000
Message-Id: <20220318002318.80519-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Variable z is being assigned a value that is never read, the
variable is redundant and can be removed.

Cleans up clang scan build warning:
drivers/input/joystick/adi.c:139:6: warning: Although the
value stored to 'z' is used in the enclosing expression,
the value is never actually read from 'z' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/input/joystick/adi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/adi.c b/drivers/input/joystick/adi.c
index 592c95b87f54..e10d57bf1180 100644
--- a/drivers/input/joystick/adi.c
+++ b/drivers/input/joystick/adi.c
@@ -123,7 +123,7 @@ static void adi_read_packet(struct adi_port *port)
 {
 	struct adi *adi = port->adi;
 	struct gameport *gameport = port->gameport;
-	unsigned char u, v, w, x, z;
+	unsigned char u, v, w, x;
 	int t[2], s[2], i;
 	unsigned long flags;
 
@@ -136,7 +136,7 @@ static void adi_read_packet(struct adi_port *port)
 	local_irq_save(flags);
 
 	gameport_trigger(gameport);
-	v = z = gameport_read(gameport);
+	v = gameport_read(gameport);
 
 	do {
 		u = v;
-- 
2.35.1

