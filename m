Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F0372
	for <llvm@lists.linux.dev>; Sun, 26 Mar 2023 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679790748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vvl/Cszr83QpVo2zLAzWMSGgk3m+9bIrTI3yG08ent8=;
	b=M3CtB/GnzZryshAPhVz6qOqJ2EbMFTQgYyaWgmTQ7QmFGFWf9RpoRmwdW3Sq4fUVoX2nBZ
	YdgbsXxDFZ8V0O0TojcSvNHLG4snGJ2fUC2+wejsjukh2mFtpTkCS+t3szpkTsBTwp/hwy
	x/9iatsFRpV8DJkioLWFbeDHsxq1ji0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-HZzZJh4LMrK4WumhXOoXkA-1; Sat, 25 Mar 2023 20:32:26 -0400
X-MC-Unique: HZzZJh4LMrK4WumhXOoXkA-1
Received: by mail-qk1-f197.google.com with SMTP id s12-20020a37a90c000000b007468eaf866aso2336935qke.17
        for <llvm@lists.linux.dev>; Sat, 25 Mar 2023 17:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679790746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vvl/Cszr83QpVo2zLAzWMSGgk3m+9bIrTI3yG08ent8=;
        b=nofO42++M9Vu6jGty8gOEmaO315In2o+h0lixORpxbck1B8Z2iNESqLVlKG8BLiEN2
         RtaqQY+AqHKbtgck7DwIZoJIstAecpM7GpJIvoa/3GGgD2IQLg8NnHdzwimF7MsWQ+7t
         PUt2lEJsuoA8PFkLHjf0V/DD7Smip+StfZjkcVem6l8gXhuXJ6COnTKKsXQC0I6D7wEV
         +EnUCVj7qJzBZvmhULBt2Mxjjgh3vOgLvb7sjv/3ibcfcsF2sws+Pd3avAqCt3k5rx4k
         17mC7efzWR9JwYjo6I0QgH9mYhi62LLc3XIzAMOqM6/yWt9H+yZD4dQXRsJw2/OUbaeU
         v09g==
X-Gm-Message-State: AO0yUKV88p0OIrN8FKhVuNNyXoCS6i+bS/hoTDUvHv8i0d+tDJEPlvvQ
	tl7NCZM3mgiZIiUGwWgcuwDoGc0zW/FX9Yy/y+icsDpcNGzr1eeP9f1pm4j6kEWrYb6BO3kc4Js
	f8sClgkCM0IlsUA==
X-Received: by 2002:a05:6214:2aa5:b0:5dd:b12c:7536 with SMTP id js5-20020a0562142aa500b005ddb12c7536mr11178018qvb.15.1679790746265;
        Sat, 25 Mar 2023 17:32:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+Pa/uA21H+Zv/sD23H6AYDuKi2PaRBJzNHIHJxF75572oevVIi5sKRN9bea14HCN3kO7fDw==
X-Received: by 2002:a05:6214:2aa5:b0:5dd:b12c:7536 with SMTP id js5-20020a0562142aa500b005ddb12c7536mr11178000qvb.15.1679790745992;
        Sat, 25 Mar 2023 17:32:25 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g1-20020a37b601000000b00743592b4745sm15389120qkf.109.2023.03.25.17.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 17:32:25 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] scsi: scsi_transport_fc: remove unused desc_cnt variable
Date: Sat, 25 Mar 2023 20:32:22 -0400
Message-Id: <20230326003222.1343671-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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

clang with W=1 reports
drivers/scsi/scsi_transport_fc.c:908:6: error: variable
  'desc_cnt' set but not used [-Werror,-Wunused-but-set-variable]
        u32 desc_cnt = 0, bytes_remain;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/scsi/scsi_transport_fc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index f12e9467ebb4..64ff2629eaf9 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -905,7 +905,7 @@ fc_host_fpin_rcv(struct Scsi_Host *shost, u32 fpin_len, char *fpin_buf,
 {
 	struct fc_els_fpin *fpin = (struct fc_els_fpin *)fpin_buf;
 	struct fc_tlv_desc *tlv;
-	u32 desc_cnt = 0, bytes_remain;
+	u32 bytes_remain;
 	u32 dtag;
 	enum fc_host_event_code event_code =
 		event_acknowledge ? FCH_EVT_LINK_FPIN_ACK : FCH_EVT_LINK_FPIN;
@@ -932,7 +932,6 @@ fc_host_fpin_rcv(struct Scsi_Host *shost, u32 fpin_len, char *fpin_buf,
 			fc_fpin_congn_stats_update(shost, tlv);
 		}
 
-		desc_cnt++;
 		bytes_remain -= FC_TLV_DESC_SZ_FROM_LENGTH(tlv);
 		tlv = fc_tlv_next_desc(tlv);
 	}
-- 
2.27.0

