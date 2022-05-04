Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A657F
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 13:58:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso3292772wma.0
        for <llvm@lists.linux.dev>; Wed, 04 May 2022 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjx7gNEvj9OasAKbfNVg4zchWMg/Q6EBH67Oa2e8OLQ=;
        b=OdUGB1XVP71W0cC4X4Q6lqf1SU6b0l6Ls2EWYZWP4GK4EvVZiA0ptOKnxIgnuJuJkm
         eWcEB9UH13dZVCJtOPIw0kIqIR/JOuC6pj7rO8nA2fxr3ejgN7FUwh5nNKOy+77flgY7
         qLCWKnd9Jv3Tsg4ARKNL2te0UvHpQ4kxC2SeLcE18/y5d3jiDoqgoqu43QITjXR3M7zT
         4ub1lWe+D+tLpqCEuRdBTbjhPX+IkcYkVbEmRThUFgCmfHxnW+qGH3zfOEEsGz2rTfS6
         TKtcdThjM5FmEsO7/A9mSaoNZ0wlZfXSGgonTVhfoYf1IVpYjwJ2HEkLlxYlkPSbEszC
         oO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjx7gNEvj9OasAKbfNVg4zchWMg/Q6EBH67Oa2e8OLQ=;
        b=dkzSUCKxz+gnUSq+Bl3FGPlUgDiKzXmAWTnAHSmHyJhz+1l2q6qZt0HmjLxTcgOKID
         TT1/BR1I1iIYpYUZfUGZF4bWVZ0i6QsVXp+ZGYY9NNXcni3crqL5pNfxlawJLoymAqeT
         wMTSgu8qI9G89YDDM5VkhdOVVlZObhS+vtKO0hex0+PQzafCV1wf59J4+fyMjapa7mfV
         lT/3txeIqRIdy6b+wQSGRHVGC7qw3nW9djWheYY4JR4Q10glo7idJh97imyxrYt2ULsA
         HJuT7LX7mAyZOUKIT+tk6+fTwk9Ta69Sk5OrEpTEqJhvcgGbqnCEhcbO6sHPHUlqMGJw
         4G9w==
X-Gm-Message-State: AOAM532kiA8ncqQLjwor/Ym/ogQjva8hK4QRlp2gPMpRjHggz7FL5Dyh
	3qmuc2YfIAPa3k51boz41zxCpCpIdByguA==
X-Google-Smtp-Source: ABdhPJxucinJz7AG3WirWMPy2Bpa+F0RiANyvK6kdoFCDRcm9ss19mURFInD1kiisZ60NlfKF6DOIw==
X-Received: by 2002:a05:600c:3584:b0:394:5870:2c44 with SMTP id p4-20020a05600c358400b0039458702c44mr3173325wmq.4.1651672721856;
        Wed, 04 May 2022 06:58:41 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j30-20020adfb31e000000b0020c5253d8bfsm11431814wrd.11.2022.05.04.06.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 06:58:41 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felipe Balbi <balbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH][next] USB: gadget: Fix return of -EBUSY
Date: Wed,  4 May 2022 14:58:40 +0100
Message-Id: <20220504135840.232209-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Currently when driver->match_existing_only is true, the error return is
set to -EBUSY however ret is then set to 0 at the end of the if/else
statement. I believe the ret = 0 statement should be set in the else
part of the if statement and not at the end to ensure -EBUSY is being
returned correctly.

Detected by clang scan:
drivers/usb/gadget/udc/core.c:1558:4: warning: Value stored to 'ret' is
never read [deadcode.DeadStores]

Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/usb/gadget/udc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 61790592b2c8..3281d8a3dae7 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1559,8 +1559,8 @@ int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
 		} else {
 			pr_info("%s: couldn't find an available UDC\n",
 					driver->function);
+			ret = 0;
 		}
-		ret = 0;
 	}
 	mutex_unlock(&udc_lock);
 
-- 
2.35.1

