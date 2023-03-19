Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705DE4E4
	for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679245494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5hGGrSeYkeZSTlJKXjJeoxK62+EdXw5xS8spAiPT4N8=;
	b=ccrXDtc/0sFmaNBrQ0qd6Ule0uH4eN6o3n/KkP+zBJAoca11bsOsz+ooLXN4r/ATNRsQhY
	Eb1CLOaO9XFDQrYhkCdRQfDlQ8F7OrPD/zuLzkAxVV4qJfjMtkfZexzrkGrrPAI8vn+pUf
	yPbfy2Ufht6LLdJD93PPrwhrYlQ/z7c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-aBWKai5aOC-W9m3F6PYVAA-1; Sun, 19 Mar 2023 13:04:53 -0400
X-MC-Unique: aBWKai5aOC-W9m3F6PYVAA-1
Received: by mail-qv1-f72.google.com with SMTP id f3-20020a0cc303000000b005c9966620daso417065qvi.4
        for <llvm@lists.linux.dev>; Sun, 19 Mar 2023 10:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679245493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hGGrSeYkeZSTlJKXjJeoxK62+EdXw5xS8spAiPT4N8=;
        b=JbSrdzwvYccKrkHb5AlLrF1zOlNvmXmw6TUgPoAYnPk5bLtQ0/de9C0h8VFBFR+zl8
         Zwr+Sutv4BPRotgnpWpYR7kRJ/EGgocX3sVouY8e8y+gmpOKqwLfwsoNyKh4UH3WuXw9
         tMb5ig4v6HJu5e/pDMjw3Kjz40PGSzxRFpTs2t8dJdvAaVdKk9ibw37la5XUfzgVbYOq
         JSVf1HoFAMtyMHPpzHj+tleSDmRLMOufhZ/eRyMU/8yBD0rfEx6kUJwyVd7gxqfmCsk3
         DTsnWvbRW7mVzNpfgd+MrCCp73c403GzAuJVwXVjuJtCRcOYxlMMjWC2w/ZG2cWkmCtM
         tk6w==
X-Gm-Message-State: AO0yUKX6yR3VdCYe6KLMpkAsVwoz6DpLD145auN8V2pkWoc0Ifpr3tcW
	DgJd1IZ9Xk85icdJekFFDYwD7Besj2qLTnnv/LgD6ZnK7raKNNO891sc4pj79mBb5AGYxLk8zWP
	A0IsznNUzxco9xw==
X-Received: by 2002:ac8:5841:0:b0:3bf:bbd3:1f11 with SMTP id h1-20020ac85841000000b003bfbbd31f11mr24021868qth.21.1679245492837;
        Sun, 19 Mar 2023 10:04:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set/H4vADgftD8rf5YWTGqtn/mKRl2Y1/a6dCKsWGV9D8uNc3r11rwxbJZBxO/iJ8/yMZTeNSog==
X-Received: by 2002:ac8:5841:0:b0:3bf:bbd3:1f11 with SMTP id h1-20020ac85841000000b003bfbbd31f11mr24021833qth.21.1679245492452;
        Sun, 19 Mar 2023 10:04:52 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t197-20020a3746ce000000b0074280fc7bd8sm5735681qka.60.2023.03.19.10.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 10:04:52 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: matt.hsiao@hpe.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] misc: hpilo: remove unused is_device_reset function
Date: Sun, 19 Mar 2023 13:04:47 -0400
Message-Id: <20230319170447.1707655-1-trix@redhat.com>
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
drivers/misc/hpilo.c:395:19: error: unused function
  'is_device_reset' [-Werror,-Wunused-function]
static inline int is_device_reset(struct ilo_hwinfo *hw)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/misc/hpilo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/misc/hpilo.c b/drivers/misc/hpilo.c
index 8d00df9243c4..ba4b00b8bea1 100644
--- a/drivers/misc/hpilo.c
+++ b/drivers/misc/hpilo.c
@@ -392,12 +392,6 @@ static inline int is_db_reset(int db_out)
 	return db_out & (1 << DB_RESET);
 }
 
-static inline int is_device_reset(struct ilo_hwinfo *hw)
-{
-	/* check for global reset condition */
-	return is_db_reset(get_device_outbound(hw));
-}
-
 static inline void clear_pending_db(struct ilo_hwinfo *hw, int clr)
 {
 	iowrite32(clr, &hw->mmio_vaddr[DB_OUT]);
-- 
2.27.0

