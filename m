Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17311389
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653573753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t/NjQKnGqjNPpF942YZJrFLnAbWe3CnyInwbwktGydg=;
	b=H3211nNizxLfk6JNJoh+qcOUWIa13zHk8K/cwDfRe93XXekmN5womTfNUwc0ieYgJcp1af
	tLchoaUVaZdjcKEmN4PneXhJvxW1b42aPSd7SDr+5pTHwsar7CxQ2cke7Ran7uHSzoRsL4
	NUGUn390fdfKX4otxSS7UKxv6/HCx5c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-LPVSayWvNcWuwhoWMOGuGw-1; Thu, 26 May 2022 10:02:33 -0400
X-MC-Unique: LPVSayWvNcWuwhoWMOGuGw-1
Received: by mail-qv1-f72.google.com with SMTP id dy10-20020ad44e8a000000b004625c7238edso1699649qvb.0
        for <llvm@lists.linux.dev>; Thu, 26 May 2022 07:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t/NjQKnGqjNPpF942YZJrFLnAbWe3CnyInwbwktGydg=;
        b=0lSsrWBOS75wy3E+uP4q1jrrOH7+kWScxP797kC96Eh6B27xAQekBfc9lWrPJB/NEj
         WaDFdT2nYZXhftRQozsRHfDRx9gE97JOpqtKEw9oK2T9LcfLdSvs9tXeQqfRmzr4O0uD
         88Jp6IlXlWv5//nLz04XiJf7QSTa/qMgT/2k+tYeJLy5hse5oUzRh/yw7T1Pq6EyiIHX
         DdUv32hXO9AWakxLWLb8VIpR2Ws7scaTd3NfC9Rf5ueeTYhfDELYJV4e5OOS3tp0NgFO
         +TQro/EymtmeMy0aNM92BQLFjFmRKKPduHK7wmmF8SrLomVmh4azRG7TvxfhZfaCvEXg
         5qhw==
X-Gm-Message-State: AOAM533cIeS2xMa1B+IjT4glRpE1G76T4n6iNbx5/UgTv06xnw2+joWR
	+AGI00zlwo1nP0FF86IuCybodkUALCYrGypuuGiX0O5K+lY1iyy/ZaM4XnjoQuqK79krG89/aZ+
	nnuwReyHkujvBsg==
X-Received: by 2002:a05:620a:199d:b0:6a3:a2d2:abee with SMTP id bm29-20020a05620a199d00b006a3a2d2abeemr12128635qkb.549.1653573751835;
        Thu, 26 May 2022 07:02:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx32tHOhTv7CHF4lQP4Z7dwEs3OmKH8agO67I1d5hvC5IwQ4wIyFmYszbKurImtJrG3LOJmcw==
X-Received: by 2002:a05:620a:199d:b0:6a3:a2d2:abee with SMTP id bm29-20020a05620a199d00b006a3a2d2abeemr12128604qkb.549.1653573751507;
        Thu, 26 May 2022 07:02:31 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id u6-20020a05622a17c600b002f3dc9ebb4bsm950014qtk.65.2022.05.26.07.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 07:02:31 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: sfrench@samba.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	dhowells@redhat.com
Cc: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] cifs: set length when cifs_copy_pages_to_iter is successful
Date: Thu, 26 May 2022 10:02:26 -0400
Message-Id: <20220526140226.2648689-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

clang build fails with
fs/cifs/smb2ops.c:4984:7: error: variable 'length' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
  if (rdata->result != 0) {
      ^~~~~~~~~~~~~~~~~~

handle_read_data() returns the number of bytes handled by setting the length variable.
This only happens in the copy_to_iter() branch, it needs to also happen in the
cifs_copy_pages_to_iter() branch.  When cifs_copy_pages_to_iter() is successful,
its parameter data_len is how many bytes were handled, so set length to data_len.

Fixes: 67fd8cff2b0f ("cifs: Change the I/O paths to use an iterator rather than a page list")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/cifs/smb2ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 3630e132781f..bfad482ec186 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4988,7 +4988,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
 				dequeue_mid(mid, rdata->result);
 			return 0;
 		}
-		rdata->got_bytes = pages_len;
+		length = rdata->got_bytes = pages_len;
 
 	} else if (buf_len >= data_offset + data_len) {
 		/* read response payload is in buf */
-- 
2.27.0

