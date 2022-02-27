Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B72F25
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645979418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UEEZb2DOh5vylG1x1VMy8AuvAs8IP8CoCmlX2Vt9jDU=;
	b=DZdmQIPKvh+eJwmJx13G2EubxRe91sYgE35gLPCX9Glca1d2kBQfu4kYt4p5hS8MnZGvi4
	hOa2VxNqpxaEBIDeo+1iaPtBDhZcUWrT7LSmPzOiCMrYQtccmJL9APFiy4RndNSEu6BYMD
	AqtTxzThTi0xcnafFpUjTpaDuu8RLFU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-2X8JtJWaPEGa2JnTPVgUKQ-1; Sun, 27 Feb 2022 11:17:55 -0500
X-MC-Unique: 2X8JtJWaPEGa2JnTPVgUKQ-1
Received: by mail-qv1-f72.google.com with SMTP id z3-20020a0cf003000000b004328f6a7131so9702851qvk.19
        for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 08:17:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UEEZb2DOh5vylG1x1VMy8AuvAs8IP8CoCmlX2Vt9jDU=;
        b=rYh47fMJbru51Lt1ycSzeWPk0dAIod7s16xgE7gc4YcbDqo5iFLErwTJtN5iO68uku
         17/pHJalmS17Br897MfujuKz6bi5jnu4tj8dstCgS6Nxssp2fEjwL/FXYN2ygYrRc8aw
         67XH2U+epVAvjoJP4OJs0lOdJgBsQPeZx8bPXWm1D9Ilrqv4OfH1PDwJhVhk2udn2CkS
         HZtXCncDCNfwubr4XBRpQavIyRCoREx6kE+YBTKQPrXw5feJ1vPk7ureMx+oBvNvy0Ox
         a9pVhMZijWYUNducNj6PEv0NWfAmeQlQ+FllYID2JiMk6znGXoisZOswEsS0bbgQxiCv
         aqZA==
X-Gm-Message-State: AOAM531gAOjDHgcb0fSxL79AM1iPJ36GN6vcHvIaH8j69VtDUrN9PYIz
	aXXv73tNeh0a1pzv8xTPh1ePSENM9tIRWMeBDU9SaB6z43bXkGE0NVQQJcOQoRKurtUP6UpaaKd
	3Zdm0KPA6fqpfMA==
X-Received: by 2002:a05:620a:576:b0:649:243f:752d with SMTP id p22-20020a05620a057600b00649243f752dmr9320430qkp.699.1645978671552;
        Sun, 27 Feb 2022 08:17:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsYFLTwjcspUwtB5uDZ6VD5JILqh8bnjJ0uyOIdm4mEt5/kyzeqiapVtIaaLGd4DnYIn9tgw==
X-Received: by 2002:a05:620a:576:b0:649:243f:752d with SMTP id p22-20020a05620a057600b00649243f752dmr9320418qkp.699.1645978671320;
        Sun, 27 Feb 2022 08:17:51 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id v26-20020a05620a0a9a00b00605c6dbe40asm3823172qkg.87.2022.02.27.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 08:17:50 -0800 (PST)
From: trix@redhat.com
To: vilhelm.gray@gmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	Jonathan.Cameron@huawei.com
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] counter: add defaults to switch-statements
Date: Sun, 27 Feb 2022 08:17:46 -0800
Message-Id: <20220227161746.82776-1-trix@redhat.com>
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

Clang static analysis reports this representative problem
counter-chrdev.c:482:3: warning: Undefined or garbage value
  returned to caller
  return ret;
  ^~~~~~~~~~

counter_get_data() has a multilevel switches, some without
defaults, so ret is sometimes not set.
Add returning -EINVAL similar to other defaults.

Fixes: b6c50affda59 ("counter: Add character device interface")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/counter/counter-chrdev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
index b7c62f957a6a8..69d340be9c93f 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -477,6 +477,8 @@ static int counter_get_data(struct counter_device *const counter,
 		case COUNTER_SCOPE_COUNT:
 			ret = comp->count_u8_read(counter, parent, &value_u8);
 			break;
+		default:
+			return -EINVAL;
 		}
 		*value = value_u8;
 		return ret;
@@ -496,6 +498,8 @@ static int counter_get_data(struct counter_device *const counter,
 		case COUNTER_SCOPE_COUNT:
 			ret = comp->count_u32_read(counter, parent, &value_u32);
 			break;
+		default:
+			return -EINVAL;
 		}
 		*value = value_u32;
 		return ret;
-- 
2.26.3

