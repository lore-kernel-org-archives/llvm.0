Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCC2CAB
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 11:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680348877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J5VnVhbHSvcA014php78QLEnB2oArEoTP1K4/6SYEVc=;
	b=gx//TVuFumWTJhEcPzeHRMZJff+MVvQPbi7Tf8Z8dopFOl5Ln2dbASo768KKY0ZtnpFBK2
	C16/PYgpoq/c/1K4Hjb9JwfkH5GSShaxIik+Nym9KAICy6cju/l+QVduUg56xlZASMnZBE
	0xP/rYC7A25/L6z/4uCWpqj8OD1GPt8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-l4BJdMqVP666mV3sN_G7-Q-1; Sat, 01 Apr 2023 07:34:36 -0400
X-MC-Unique: l4BJdMqVP666mV3sN_G7-Q-1
Received: by mail-qv1-f69.google.com with SMTP id j15-20020a0cc34f000000b005c824064b10so11002132qvi.17
        for <llvm@lists.linux.dev>; Sat, 01 Apr 2023 04:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680348876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5VnVhbHSvcA014php78QLEnB2oArEoTP1K4/6SYEVc=;
        b=jqUYEzOARwhBNwB/OuNwB2wfSzH1C+Z52HKbz+3vL0A1XDCAAEA6JVwdW7m3ACjR/4
         1HglVayiqwrIZ30g/13OEpt0DUh8GIo3dqxQi/ahwn1Zbsmq8efvKdXhS5RnVs4/5TyR
         j5gDS3Rsx+wwRbihTKdX1cnSre4pxYVXktMt3YZun7Yj4j+JRc9wTtWBfdrFVEl8W76Z
         iyfLKjTukLmyyW99vcdDkItE7FJyBGb1aTGy3cnO37ACueWlMq21CT5W3OUvdeCQuiNV
         jZlHwASe+9pzynm2q6uRFMDTNvLJGGiIuV/Gq02OBsqd8SO2e0FhCjhIIq3lMW8l1rXQ
         +ZpQ==
X-Gm-Message-State: AAQBX9f+i+zZD4PEBkGAB4PJMPfya+QLJwNAnEHL2izFpGLVuA2e+FqO
	7GWD3dWk+iiRCtXrVR7OZgc47R0IXGHXd6q+oKZntTSKSZYlErDj0zk08VafUoy/3oWAN1eFsag
	SZwDXGssYvBgCuw==
X-Received: by 2002:a05:6214:501e:b0:584:8c13:3041 with SMTP id jo30-20020a056214501e00b005848c133041mr18549533qvb.24.1680348875817;
        Sat, 01 Apr 2023 04:34:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZH/PIz9aT1vkMeJPCy77zunA2Q4o1S573i0+gKG+HwMtgD6hdQufuIhPWM0rPxuQRAce5LcQ==
X-Received: by 2002:a05:6214:501e:b0:584:8c13:3041 with SMTP id jo30-20020a056214501e00b005848c133041mr18549509qvb.24.1680348875582;
        Sat, 01 Apr 2023 04:34:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s11-20020ad4524b000000b005dd8b9345d8sm1230100qvq.112.2023.04.01.04.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 04:34:35 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: sre@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] power: supply: twl4030-charger: remove unused cur_reg variable
Date: Sat,  1 Apr 2023 07:34:32 -0400
Message-Id: <20230401113432.1873847-1-trix@redhat.com>
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
drivers/power/supply/twl4030_charger.c:242:16: error: variable
  'cur_reg' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned reg, cur_reg;
                      ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/power/supply/twl4030_charger.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/power/supply/twl4030_charger.c b/drivers/power/supply/twl4030_charger.c
index 7adfd69fe649..5fa5b2311330 100644
--- a/drivers/power/supply/twl4030_charger.c
+++ b/drivers/power/supply/twl4030_charger.c
@@ -239,7 +239,7 @@ static int twl4030_charger_update_current(struct twl4030_bci *bci)
 {
 	int status;
 	int cur;
-	unsigned reg, cur_reg;
+	unsigned reg;
 	u8 bcictl1, oldreg, fullreg;
 	bool cgain = false;
 	u8 boot_bci;
@@ -357,11 +357,9 @@ static int twl4030_charger_update_current(struct twl4030_bci *bci)
 	status = twl4030_bci_read(TWL4030_BCIIREF1, &oldreg);
 	if (status < 0)
 		return status;
-	cur_reg = oldreg;
 	status = twl4030_bci_read(TWL4030_BCIIREF2, &oldreg);
 	if (status < 0)
 		return status;
-	cur_reg |= oldreg << 8;
 	if (reg != oldreg) {
 		/* disable write protection for one write access for
 		 * BCIIREF */
-- 
2.27.0

