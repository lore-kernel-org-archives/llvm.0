Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A6A29CA
	for <llvm@lists.linux.dev>; Fri, 24 Dec 2021 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640358466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BF/YCJv1AAKRhV+98m4TlzO0qSIWH7hI7+kRVcFAOVU=;
	b=eE6sLvtFo2IyAjSaGC0HX+JDOwYm4FJt5amiu5tOMbTjltLADzACQFh5t8PvhHrWiwrcBv
	L9cI6cXHfsP1yrvQQmkI0Y4TY7eoD6QVALXVzkqy7aEytm/mwTwPftqvAmnVx/sPaFTkMB
	4u0htpWV8LGJPUik4wTY1/dUUB3CKuI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-LTC_PrPWOKmxg0Fgefl8-g-1; Fri, 24 Dec 2021 10:07:45 -0500
X-MC-Unique: LTC_PrPWOKmxg0Fgefl8-g-1
Received: by mail-qt1-f197.google.com with SMTP id o12-20020a05622a008c00b002aff5552c89so5829959qtw.23
        for <llvm@lists.linux.dev>; Fri, 24 Dec 2021 07:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BF/YCJv1AAKRhV+98m4TlzO0qSIWH7hI7+kRVcFAOVU=;
        b=DoH2RZh0fS8s6nEUaUHxbtL/OxeWNKglQxwfenoAPwJi3W3zQYEyL4tNEyX94HQl62
         hqlv1jq9BlPxuZ/KuceAvCa9glGzsf9OJo5qU8dZTHH9qBiDTR12AzKJ9/BBuKzLARuO
         uDJyXSnqezGFX1KrFvaGhWTut8oMJijCAZCG8SlZD1wSO9KE8oZUng65FhQPEmzE9tEs
         BvcCwJPWnYvRNKVvzWz5usnW6RMt4IiO2WEwl5FhZgQGbVKTDwec6alyMdu+q5QXU3oe
         MN67jwlsDABpLRH7mVcKtkIL0qsrKTqf1WqnsS82QzaFRX6G3ty+dMAlz+ZtDisNl4i5
         FxPQ==
X-Gm-Message-State: AOAM5313SelYVxpBTv47kMsk5MDBxpo9QC9lTK6WfW7Em/lKkvBLxP3t
	5t0z8jYQy8Uy6IOvwqHNmOI8Lziy1+8PRS85AK2U3E/+66s/I02hneEyMokNmpVYVsvLhzNVPzn
	rlUoXzkRFbvrwPw==
X-Received: by 2002:a05:620a:809:: with SMTP id s9mr4863329qks.156.1640358464964;
        Fri, 24 Dec 2021 07:07:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1pKHrG4CVFHlqnEQE1caIilyx7SPxj7M2T/jSxcp1oBjfTGs3uB+F1wC/sUIYc89L4aGXzg==
X-Received: by 2002:a05:620a:809:: with SMTP id s9mr4863309qks.156.1640358464728;
        Fri, 24 Dec 2021 07:07:44 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id bl8sm7314148qkb.38.2021.12.24.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 07:07:44 -0800 (PST)
From: trix@redhat.com
To: paul@paul-moore.com,
	stephen.smalley.work@gmail.com,
	eparis@parisplace.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] selinux: initialize proto variable in selinux_ip_postroute_compat()
Date: Fri, 24 Dec 2021 07:07:39 -0800
Message-Id: <20211224150739.3278019-1-trix@redhat.com>
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

Clang static analysis reports this warning

hooks.c:5765:6: warning: 4th function call argument is an uninitialized value
        if (selinux_xfrm_postroute_last(sksec->sid, skb, &ad, proto))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

selinux_parse_skb() can return ok without setting proto.  The later call
to selinux_xfrm_postroute_last() does an early check of proto and can
return ok is the garbage proto value matches.  So initialize proto.

Fixes: eef9b41622f2 ("selinux: cleanup selinux_xfrm_sock_rcv_skb() and selinux_xfrm_postroute_last()")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 security/selinux/hooks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index e2a6d0f5c47af..fd7a0e9e26647 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -5742,7 +5742,7 @@ static unsigned int selinux_ip_postroute_compat(struct sk_buff *skb,
 	struct sk_security_struct *sksec;
 	struct common_audit_data ad;
 	struct lsm_network_audit net = {0,};
-	u8 proto;
+	u8 proto = 0;
 
 	sk = skb_to_full_sk(skb);
 	if (sk == NULL)
-- 
2.26.3

