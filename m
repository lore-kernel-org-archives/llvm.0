Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8F1B7DB
	for <llvm@lists.linux.dev>; Tue,  8 Aug 2023 17:31:49 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d0d27cd9db9so186427276.0
        for <llvm@lists.linux.dev>; Tue, 08 Aug 2023 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691515908; x=1692120708;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JK8CUncptgcyNF0cGkjEA8kKWV78TabfUcMXlDPGaN4=;
        b=a6Ag7VXjAsl8cBU4aYzrmGp+LGdAmWWFvill0aLl/BfUEGAMo9Fps6frvQLeqjIuhD
         XlN66q+gi938xPlgkBioE+6G5T8Ol4cL8eHouqLBmXJDKJ4ofNgNbEyzFQgfwJN5wX5h
         FYDm9fsDAdaSMZe+FiluFtG/hjeKkEawL1za/6eCiRJN35Mc4LW12k1s0m1xOYJ896S1
         ajizwbTiIXVwvKayvFjResg+QbJFi5sSjCD3RDXK0Aed9+bvab3RpQkJ1elmdhgv05Su
         a8qNKNMfPEzvEjf8JDTmpmBChnLwWPeqN8Nh96D4P3CNaUchJtCcdF9/W/qDduK8As2c
         UF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515908; x=1692120708;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK8CUncptgcyNF0cGkjEA8kKWV78TabfUcMXlDPGaN4=;
        b=HjdZa7rGtXd43R5RTPOBujuJpdO7VJHg909tRZpdFPY6xq98Wk/xtTat8ekKtsi5IM
         qok6uxyhMv2cRGezdjhRmXJ2h4U84cU3UxpQ0G/UCszssoFGqFG5dlOLnkwXY1wBONRf
         /rduD8Cb2QvS07JmINRMyaIvIz3cvOrlvgIMJKHFQeOKcVjXaouBNyrt7+GK8kTz2N75
         IhE8HxWMzRM9lUtV34kk7A09sjblfhgC3uKR0z7mpXJB78hGQN5QQgmWyHq3UhEdxHZr
         0i1dKp9rMHyCPBj5q0X0qGjHqHelYg+MWNQuJl1KarZNRxKNH2T4FeU63hY+SGeaPDTD
         6JoQ==
X-Gm-Message-State: AOJu0YxXPOSGiQFbFbhre2bgyIVD7+i5CWRBlY4rz7ZUA0wcJ4fbVqSE
	YzttK15GFr2DBxuACGLHBAsROq70Zanv8polAzA=
X-Google-Smtp-Source: AGHT+IFuIZZ9U+HFkMO58uj8HDjeBgI0ZQAsk0P/vzaZPrJxYj2UOeQKD8aOt/SMEl5gPv9zleDrc3PVPpUJ3i0n+p8=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:cc03:38d0:9718:e90b])
 (user=ndesaulniers job=sendgmr) by 2002:a25:590:0:b0:ceb:324c:ba8e with SMTP
 id 138-20020a250590000000b00ceb324cba8emr7568ybf.4.1691515908064; Tue, 08 Aug
 2023 10:31:48 -0700 (PDT)
Date: Tue, 08 Aug 2023 10:31:45 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAB80mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDCwML3dLc+IL8opL47NSiPF2zNMNUc2Nz47TUJFMloJaCotS0zAqwcdG xtbUAp63nSF4AAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691515906; l=1516;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=wd2IgnzJebaakuklw0wfvUJX4iZiu7mdNDFHD+AAxrI=; b=nwemPY1tE0AdQPYAgJzWaeXtnN2spPLRAwSR5RGznOobwW8wki4Ug95D04bQMIQZ3m3VbdjLh
 iHtBufNW+DbALPRP0+Qd07XoJ9pW2Z1jMIj5ZXyXQVKXAMHML1aY8z8
X-Mailer: b4 0.12.3
Message-ID: <20230808-um_port_kern-v1-1-867351f32af9@google.com>
Subject: [PATCH] um: port_kern: fix -Wmissing-variable-declarations
From: Nick Desaulniers <ndesaulniers@google.com>
To: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

I'm looking to enable -Wmissing-variable-declarations behind W=1. 0day
bot spotted the following instance:

  arch/um/drivers/port_kern.c:147:14: warning: no previous extern
  declaration for non-static variable 'port_work'
  [-Wmissing-variable-declarations]
  DECLARE_WORK(port_work, port_work_proc);
               ^
  arch/um/drivers/port_kern.c:147:1: note: declare 'static' if the
  variable is not intended to be used outside of this translation unit
  DECLARE_WORK(port_work, port_work_proc);
  ^

This symbol is not referenced by more than one translation unit, so give
it static storage.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/llvm/202308081050.sZEw4cQ5-lkp@intel.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/um/drivers/port_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/drivers/port_kern.c b/arch/um/drivers/port_kern.c
index efa8b7304090..c52b3ff3c092 100644
--- a/arch/um/drivers/port_kern.c
+++ b/arch/um/drivers/port_kern.c
@@ -144,7 +144,7 @@ static void port_work_proc(struct work_struct *unused)
 	local_irq_restore(flags);
 }
 
-DECLARE_WORK(port_work, port_work_proc);
+static DECLARE_WORK(port_work, port_work_proc);
 
 static irqreturn_t port_interrupt(int irq, void *data)
 {

---
base-commit: 14f9643dc90adea074a0ffb7a17d337eafc6a5cc
change-id: 20230808-um_port_kern-6f1e7373feb5

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

