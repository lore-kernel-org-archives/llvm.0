Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909810EF
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647348117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L8qSvNcazquKGgqZpfRwZOK5T4G+V/7nPQSKEnK7vHo=;
	b=jBOS4yiS+3DulS7vM34DduuIdCDVE0i/lNhh2sWJIlcZ/wI897UY0gsWyy4Rj/Dim6bg/M
	aE4Y0opK4IpBU81w3i3d8RfoG4AQVqo4BK9EplGH9jvn7x1Jfp8IBONI/FQwIWU6AVUvxz
	wNV4IavazvTpbyZ2BoHOnAVnjnmuVvA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-Lg7bhVmPOmOxrxPzmszjrg-1; Tue, 15 Mar 2022 08:41:55 -0400
X-MC-Unique: Lg7bhVmPOmOxrxPzmszjrg-1
Received: by mail-ot1-f71.google.com with SMTP id t16-20020a9d7290000000b005b24005289dso13810291otj.11
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 05:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8qSvNcazquKGgqZpfRwZOK5T4G+V/7nPQSKEnK7vHo=;
        b=6cyynjh6EYOGtrJ6Wqam576rKo1XH51zuEedXnfy3/uXjMKiDCHB1ez/oKE1dALlIZ
         8Ia2nGndu3jGbefpUSOcx/oMn8J5Ua93BZinWLqDRY7dwdR5z4PqIbxsqA19tLxGGhoa
         xcc/cCX38RHebKsgfhzQvyBGt+nnfhsHiJ2Blkme+mCOXa2grSXfIfaDkrkzKAXwTnlg
         y4yxvFriIpxt01hZzpHf9aeXK1iJKo5ForxQbIPoUPxV24RyKyrCPRrd9l6hklNblM+0
         +liP4ZXlY/6QQ+V4hf+6qhfshAY0cfaCiIrnRpXp6jh9YLhdPLZLYYit+E/gbiKCW1fS
         D2BA==
X-Gm-Message-State: AOAM532xztcPzwlv5V3SyqVZf0Hw01pPBsauuY5P4Nfxql44xZXffhXO
	Xuymk+p9cpd4TBnxRe12i9lCf8UU9JFEHNZ5T1ayvafu9l2dCYQvjFtxWxI0cI21ylmz8TpYwbQ
	Lkv5CJ0xl4QixZQ==
X-Received: by 2002:a05:6830:2a13:b0:5b2:4818:9e47 with SMTP id y19-20020a0568302a1300b005b248189e47mr12799099otu.246.1647348115064;
        Tue, 15 Mar 2022 05:41:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcpL+Gz6iIXjMEkxLwJ/eu0PZYTQsZg4Pa8CgHWGB+zJNMcXTr1+Z1m4WKMcLCOWc4CCmSkw==
X-Received: by 2002:a05:6830:2a13:b0:5b2:4818:9e47 with SMTP id y19-20020a0568302a1300b005b248189e47mr12799084otu.246.1647348114840;
        Tue, 15 Mar 2022 05:41:54 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id y15-20020a056870b00f00b000d75f1d9b81sm7762654oae.46.2022.03.15.05.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:41:54 -0700 (PDT)
From: trix@redhat.com
To: mst@redhat.com,
	jasowang@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	lingshan.zhu@intel.com,
	sgarzare@redhat.com,
	xieyongji@bytedance.com
Cc: virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] vDPA/ifcvf: match pointer check to use
Date: Tue, 15 Mar 2022 05:41:30 -0700
Message-Id: <20220315124130.1710030-1-trix@redhat.com>
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
ifcvf_main.c:49:4: warning: Called function
  pointer is null (null dereference)
  vf->vring->cb.callback(vring->cb.private);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The check
  vring = &vf->vring[i];
  if (vring->cb.callback)

Does not match the use.  Change dereference so they match.

Fixes: 79333575b8bd ("vDPA/ifcvf: implement shared IRQ feature")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 3b48e717e89f7..4366320fb68d3 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -46,7 +46,7 @@ static irqreturn_t ifcvf_vqs_reused_intr_handler(int irq, void *arg)
 	for (i = 0; i < vf->nr_vring; i++) {
 		vring = &vf->vring[i];
 		if (vring->cb.callback)
-			vf->vring->cb.callback(vring->cb.private);
+			vring->cb.callback(vring->cb.private);
 	}
 
 	return IRQ_HANDLED;
-- 
2.26.3

