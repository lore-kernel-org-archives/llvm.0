Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC233D3
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647784813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HqtBnaidAKh4bnH8X6OIwDCPKflO5zN16a0ESKUGgsY=;
	b=AIwB7YLIgCapeGK09QrWWwNcDxRr6Jrh8qkfGlu6R8gJtB4aBcHog9VXvHjWbm8+2aNscm
	XcUS5kbamnJrive/csGr2vUlzlgfaErj/41YWWbC0vtLtMNpu6poeHFNPNJGvsF6KPSNC4
	grRWF3gukbrmPI/A1RauZYFbYlqdfZ4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-GQOW4BoGPrm5rwVHj1l5sg-1; Sun, 20 Mar 2022 10:00:12 -0400
X-MC-Unique: GQOW4BoGPrm5rwVHj1l5sg-1
Received: by mail-qk1-f199.google.com with SMTP id d12-20020a379b0c000000b0067d8cda1aaaso8506767qke.8
        for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 07:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqtBnaidAKh4bnH8X6OIwDCPKflO5zN16a0ESKUGgsY=;
        b=SSdLUn/PiDaJkozD3qB8VMBmt0jtgoMqf7MYClys1uUfHaOx+1v55nJiQFoO00e5Um
         l8egK1lfW9mEMHBNZeDB1tTtea5QLD0H8J1gLDs6TNvRgwGJvUaMkv1NVSkNrM5XAXnb
         eZ+4ETNtE1zmzqqSpScEd9KQVekSZmF2ZLoMr2M23v5OmbqcjX3iy7JNLNSz5n3+55zo
         H0px2DhvA5zQeSg4dBEENkCTjr3ZesHTuNTrbVA5zTak/0ZtyJtJ52WWAl4tf3IqjsSz
         A28cGlx/5OlLu5y7BbMC2SngnSmVzhRFvurcg6K5d4NuCnFiSYz/pq+cIAa2JsUhjf5L
         BhdQ==
X-Gm-Message-State: AOAM531Jf6z+k1E2C6v1wRhwKwkfbs0g04MEQntHo6+KFaa1zbDyIV5k
	0vmJ1rdyUhbcZComFNsckuYqQEyy343FQZZ2NY2ft2wpaH84BELF70pqL7dXevJLP3gxhcYV3rK
	+xAXIBbkaACqZAg==
X-Received: by 2002:a05:622a:1009:b0:2e1:a2e8:4e63 with SMTP id d9-20020a05622a100900b002e1a2e84e63mr13276893qte.668.1647784811818;
        Sun, 20 Mar 2022 07:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlqaEeWCI8SmnIB2oKIVuA19Yctu0B6K5Ke0aAHbQCy5tIqe6tYsJr/bBcM2Tr/0lC3rE78g==
X-Received: by 2002:a05:622a:1009:b0:2e1:a2e8:4e63 with SMTP id d9-20020a05622a100900b002e1a2e84e63mr13276879qte.668.1647784811591;
        Sun, 20 Mar 2022 07:00:11 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h22-20020a05620a245600b0067d6dae634csm7202133qkn.9.2022.03.20.07.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 07:00:11 -0700 (PDT)
From: trix@redhat.com
To: minyard@acm.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ipmi: initialize len variable
Date: Sun, 20 Mar 2022 06:59:54 -0700
Message-Id: <20220320135954.2258545-1-trix@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this issue
ipmi_ssif.c:1731:3: warning: 4th function call
  argument is an uninitialized value
  dev_info(&ssif_info->client->dev,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The 4th parameter is the 'len' variable.
len is only set by a successful call to do_cmd().
Initialize to len 0.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/char/ipmi/ipmi_ssif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
index ba779f1abb5b2..f199cc1948446 100644
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@ -1625,7 +1625,7 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	unsigned char     *resp;
 	struct ssif_info   *ssif_info;
 	int               rv = 0;
-	int               len;
+	int               len = 0;
 	int               i;
 	u8		  slave_addr = 0;
 	struct ssif_addr_info *addr_info = NULL;
-- 
2.26.3

