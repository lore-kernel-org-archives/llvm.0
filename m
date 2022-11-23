Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693991C26
	for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 08:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669193974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nznTvXnBCa/8GStBK6Y61dElxd8Nw2xcab+uDMFbqOc=;
	b=IjPDuilblABdJ7/cf5nEPyrhW8OCgvvgi5yfsZsRX4Un07Ny0lqFdJ19OD3Gi/vtIcUNHV
	yvf8HQ5jmOkQI6apyMwoCaSoXRalr17G+ljoHzwn+Ov8nDHcwPviQ7o53RC+ckHPWkIxM1
	Hvi9F78DJPaVhfXVxbvpQnCBHzDrolM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-UiZJB-tYMyu_XPsndSRuzg-1; Wed, 23 Nov 2022 03:59:33 -0500
X-MC-Unique: UiZJB-tYMyu_XPsndSRuzg-1
Received: by mail-ej1-f72.google.com with SMTP id ne36-20020a1709077ba400b007aeaf3dcbcaso9440774ejc.6
        for <llvm@lists.linux.dev>; Wed, 23 Nov 2022 00:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nznTvXnBCa/8GStBK6Y61dElxd8Nw2xcab+uDMFbqOc=;
        b=bV+iyw58Sd0nrdyl3dY2iw923w3A/Rsp/V8Qm9+OwPhq+pZl9b6vKtBpNe1yQdAlKy
         OXp1vNWGL7oXL54fJxR+8TPXEb4M6T+dtuZmVbwEmDVzA8ac2TWs7cxhrV2C6qKOkDki
         RPl/V6EnEEpmSzIPr6hV3Ol/30khVQkk0b5NZ0AFMm8NitdEratq08X4BVNfVRwwop47
         MnSuRTYdHqJ9Sy8xobotze+FbJEKYv0VA6I4MCHRMNMbzrn4kcFHZw9sqe1frn46sr8c
         NCvAWpQ1tr7Cfk7rfZgqcc7wEeagkOEJh8yw1GY8XjMVeN1bE/NgxGXwsZy4eV4tkxPA
         q96A==
X-Gm-Message-State: ANoB5plZj+2DVCVXL84pE56ZUaIf8Afd3x3YVwWZi1nyzIZ/Zn8ilbwT
	ak9uOMPpsZD4BR++2QjaNDZPODSy79Wu8uLEe22CybEsOu+/2+ytuQoLVf1WppTb6Ukne9n/vUx
	A2wLtlkDivSk6
X-Received: by 2002:a17:906:b51:b0:7ad:da22:c396 with SMTP id v17-20020a1709060b5100b007adda22c396mr23388635ejg.653.1669193971822;
        Wed, 23 Nov 2022 00:59:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ia+G3JvvCbAumvBqpqg0vXs/kl2nlvc/5g5m90/84qOBW+zgHRnBrnqrkcTcAw5f3viDf7g==
X-Received: by 2002:a17:906:b51:b0:7ad:da22:c396 with SMTP id v17-20020a1709060b5100b007adda22c396mr23388621ejg.653.1669193971521;
        Wed, 23 Nov 2022 00:59:31 -0800 (PST)
Received: from klayman.station (net-2-34-28-144.cust.vodafonedsl.it. [2.34.28.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a17090632d500b007ae32daf4b9sm6951686ejk.106.2022.11.23.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 00:59:31 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] habanalabs/gaudi2: added memset for the cq_size register
Date: Wed, 23 Nov 2022 09:56:39 +0100
Message-Id: <20221123085640.103084-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
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

The clang-analyzer reported a warning: "Value stored to
'cq_size_addr' is never read".

The cq_size register of dcore0 is not being zeroed using
gaudi2_memset_device_lbw(), along with the other cq_* registers,
even though the corresponding cq_size_addr variable is set.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/misc/habanalabs/gaudi2/gaudi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/habanalabs/gaudi2/gaudi2.c b/drivers/misc/habanalabs/gaudi2/gaudi2.c
index 65e6cae6100a..05f30adefb32 100644
--- a/drivers/misc/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/misc/habanalabs/gaudi2/gaudi2.c
@@ -9165,6 +9165,7 @@ static void gaudi2_restore_user_sm_registers(struct hl_device *hdev)
 	gaudi2_memset_device_lbw(hdev, cq_lbw_data_addr, size, 0);
 	gaudi2_memset_device_lbw(hdev, cq_base_l_addr, size, 0);
 	gaudi2_memset_device_lbw(hdev, cq_base_h_addr, size, 0);
+	gaudi2_memset_device_lbw(hdev, cq_size_addr, size, 0);
 
 	cq_lbw_l_addr = mmDCORE0_SYNC_MNGR_GLBL_LBW_ADDR_L_0 + DCORE_OFFSET;
 	cq_lbw_h_addr = mmDCORE0_SYNC_MNGR_GLBL_LBW_ADDR_H_0 + DCORE_OFFSET;
-- 
2.38.1

