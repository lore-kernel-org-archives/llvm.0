Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105093D95
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648472587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/u9IbKTaxd7JfWbYIumOYCvcuDGJC1EVRBB8DOZNjec=;
	b=YQkJ2FyFG74ohtl/7NGCvPx+eIyWBSfssGd9IJSSeR4yInudoXo75+R/NJRCN5lH6YNA0o
	8ftwh0TA0cu8xhPNR9lBoo6lzfV0+PgY0S9Qvgc8AJkn/rvC2IJLwFoQvH1wJCuj8wge89
	uEPtSoEM4A26aoJreY8kXW1l35uShYI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461--AO3SOLaNG6i9Nciw0eoQg-1; Mon, 28 Mar 2022 09:03:06 -0400
X-MC-Unique: -AO3SOLaNG6i9Nciw0eoQg-1
Received: by mail-qk1-f199.google.com with SMTP id 207-20020a3706d8000000b0067b322bef9eso8346028qkg.3
        for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 06:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/u9IbKTaxd7JfWbYIumOYCvcuDGJC1EVRBB8DOZNjec=;
        b=e2UKNeO1OCNamxkVRBiqxOVETBAcBOLlJjOeCYnmz6hi76uyowvC1HMAz10+MPWdCr
         f7PViUaBNnFcKHNR7eAFl048ELu4cyq9SkOO84MqOTbTePaQ/bY1Vns/ho4x3m3UcGTe
         dOWdiee7rRg4likkd215PwBNgyOpHOBvaT7RejwxDjN535nbYqBuNxPyfQKa3bgoGnPn
         bn9r1HoX5Vrcf6j6em2vnA2h0n6b1i10z99J/2MZC53ohj0K3YtMxvBI+6cRub02nyEC
         sFeHwtjhYPH92GRBQliTF8bqgU/NA72fP+HRYdNGpvTDG8RASBlibss2hNj45ZrX3YG4
         43Bw==
X-Gm-Message-State: AOAM532xs2tCCzfQTNFzUE00IamQ87aBXfDMdHHdTScB24NGQCyKZWSD
	DQoV5dbHAKITDEyIMOAr0efy0e49h9fFJh1of9Fm17GhKrnOfDYZMhFkuXgNBMCNyhkaFASJFsW
	sSTz0WmbxZXPDpQ==
X-Received: by 2002:a05:6214:c4a:b0:441:2c0e:1cb4 with SMTP id r10-20020a0562140c4a00b004412c0e1cb4mr20295999qvj.98.1648472585599;
        Mon, 28 Mar 2022 06:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwc0BWvMkauz8RL1WHra/Cyzf5posV9J1/75Ci8EjT4n+fT/8/G2vr6453bVFQNKYlS5HK8A==
X-Received: by 2002:a05:6214:c4a:b0:441:2c0e:1cb4 with SMTP id r10-20020a0562140c4a00b004412c0e1cb4mr20295947qvj.98.1648472585197;
        Mon, 28 Mar 2022 06:03:05 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id m16-20020a05620a24d000b0067ecf605ef5sm8576234qkn.105.2022.03.28.06.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 06:03:04 -0700 (PDT)
From: trix@redhat.com
To: sfrench@samba.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] cifs: fix enum usage
Date: Mon, 28 Mar 2022 06:03:00 -0700
Message-Id: <20220328130300.3090213-1-trix@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Tom Rix <trix@redhat.com>

Clang build fails with
cifsfs.c:709:18: error: implicit conversion from enumeration
  type 'enum statusEnum' to different enumeration
  type 'enum tid_status_enum'
  tcon->status = CifsExiting;
               ~ ^~~~~~~~~~~

The type of the element status changed, so enum needed to change.
Replace CifsExiting with TID_EXITING.

Fixes: 7e5c8c02911b ("smb3: cleanup and clarify status of tree connections")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/cifs/cifsfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index 0789bf1496c74..a47fa44b6d52b 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -706,7 +706,7 @@ static void cifs_umount_begin(struct super_block *sb)
 		spin_unlock(&cifs_tcp_ses_lock);
 		return;
 	} else if (tcon->tc_count == 1)
-		tcon->status = CifsExiting;
+		tcon->status = TID_EXITING;
 	spin_unlock(&cifs_tcp_ses_lock);
 
 	/* cancel_brl_requests(tcon); */ /* BB mark all brl mids as exiting */
-- 
2.26.3

