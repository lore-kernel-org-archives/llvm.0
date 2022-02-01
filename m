Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176672F25
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643737394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3/onK8AnDtL53ai739ibWRR8ijRtGmfoRrTuaxLarqk=;
	b=eU/uHJPcL8l079aH9g6zP0a77eKmYpYWFma41idZEgwAccg8VY3ivjkjl8RWCn3IlxIL0m
	0SySgy/xHt5dbqx5FzoZAWic0XaKVZ57WBzKDXmYM4k369fG5zWvEsf9g8bfx0TYgkm4UB
	SZbEtg7YkaKMl6YJMDgA8T0M7Q9yAO0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-fuDYpLWTM6qwxcBJlBEVOA-1; Tue, 01 Feb 2022 12:43:08 -0500
X-MC-Unique: fuDYpLWTM6qwxcBJlBEVOA-1
Received: by mail-qk1-f199.google.com with SMTP id a134-20020ae9e88c000000b0047ebe47102dso12647954qkg.18
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 09:43:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3/onK8AnDtL53ai739ibWRR8ijRtGmfoRrTuaxLarqk=;
        b=rUOr+nx1Vr4Gxj+/Aj4HBim86uusTM7ApUl1lEUoPyrGyJGfZDQQYrBQ7JKGIPtRF8
         Xn35YMEIqCKW+t8gIzA8ew3z5IqRjUy2RM7g6LB3Vsi5ivJlkDqVI+cdP3ABXU39H3Pm
         mbsjPnXB5kImFQ36Q6+ncukraat9SK9IX05rCxyeyHvKF8QusqV9dhwp9UeK3gIBLKLd
         sDg+HKIwlzuzhYnK+FOgi/RiHbDydYRAbMGkGI0rynYlK+75srkNWyrK2zUN4MH0qEEj
         2YajzYqnpJMMOlFu+Zpo0Zv4EFlEuH6dTMmcNEtlHO/PyjE69OYtM7zp/JzJwdk46jOJ
         3Jrw==
X-Gm-Message-State: AOAM530WL73BQTq0f7VQPyrtxBmp0tdXM7xUPWl+yp28cvCzRCHkXRaT
	LKapkYfQro+p/UaoGcqwYPxPFbQSGhfXU8JlL7K7F1cvj+Ij89uRxmP3bexWzS2m2rz0bWxwD02
	lpf6/ZJoeeAtTBw==
X-Received: by 2002:a05:622a:44b:: with SMTP id o11mr10694444qtx.507.1643737387526;
        Tue, 01 Feb 2022 09:43:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyADtOcufdtCgzPuWfrUXmKa/HFQ+qhMTdmjjxzdXxSj8ZJqSx+dyiOnLYrEWaALkPWKiqX+g==
X-Received: by 2002:a05:622a:44b:: with SMTP id o11mr10694429qtx.507.1643737387313;
        Tue, 01 Feb 2022 09:43:07 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id d17sm11962845qkn.84.2022.02.01.09.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 09:43:06 -0800 (PST)
From: trix@redhat.com
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] Bluetooth: hci_sync: fix undefined return of hci_disconnect_all_sync()
Date: Tue,  1 Feb 2022 09:42:56 -0800
Message-Id: <20220201174256.1690515-1-trix@redhat.com>
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

clang static analysis reports this problem
hci_sync.c:4428:2: warning: Undefined or garbage value
  returned to caller
        return err;
        ^~~~~~~~~~

If there are no connections this function is a noop but
err is never set and a false error could be reported.
Return 0 as other hci_* functions do.

Fixes: 182ee45da083 ("Bluetooth: hci_sync: Rework hci_suspend_notifier")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 net/bluetooth/hci_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index 6e71aa6b6feae..9327737da6003 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -4425,7 +4425,7 @@ static int hci_disconnect_all_sync(struct hci_dev *hdev, u8 reason)
 			return err;
 	}
 
-	return err;
+	return 0;
 }
 
 /* This function perform power off HCI command sequence as follows:
-- 
2.26.3

