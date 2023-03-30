Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD6279C6
	for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 15:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680189668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PzFkckvDWfLP+fS3N43jVyaoo/K7ZKGXS7ytUztG/V8=;
	b=TAFDuZBiGZY/bnAYnq6+tguYCX3PWyuRngh5bamM0mGnWGVx/GRXgO2NQygaJDnv0z9g8n
	Lcr2CPapNMdgWGLnWUsdNmVH7OSaJEqCsh7SqEzNiJmdmMX8d1aK9orkoesCqCBX12Oq/F
	zy1YhtYqnScpz7x/ej3leWnmiNYYTPU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-cxA-8vCaMBGQjPf7OwnUwQ-1; Thu, 30 Mar 2023 11:21:02 -0400
X-MC-Unique: cxA-8vCaMBGQjPf7OwnUwQ-1
Received: by mail-qv1-f69.google.com with SMTP id g14-20020ad457ae000000b005aab630eb8eso8420144qvx.13
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 08:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680189662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PzFkckvDWfLP+fS3N43jVyaoo/K7ZKGXS7ytUztG/V8=;
        b=o3FtdiJNjNklE+98XlV87DIbvfXjEQD+DJ5laCmu3XsX/R6rEw3xXHl/Rp0W36Hct9
         6OX/WdJ+iKNvstMBigKF4C/Pwdd10SetmYm6Tg+Ruw5mp783uz4rlvNokFHcXpmBZkPR
         iNp9v3KmpFWb3yUy1u1fgyeF+als+ucavcV1zduKaHLf6Uuz7r4tfWUVvxfFiL8q0FSN
         9qbz8jGmV8/cLq9xIYBAmv+z/t82dQsmt2N1kMYo3PwKmf4ukRlMNFLgySMJmNn7JMfa
         J7kNEP9WUoOOwk8E7GEJGv+YK+L4ODftxEwq/OSAW/K8zLppaH9HKwZ/de9kYvI2jgjQ
         X5Xg==
X-Gm-Message-State: AAQBX9f/qTBdZX7bBLYYi2sVRxvOMQna17Do2HuupHMm4KoPMltqhafB
	QMuBxKWOFd0Z1ixbTRM9CLBuoKnIYbCNUrUs7bkrq/kHqERy8bXrQZkrm9dcM9CgCZ/iq2FOFLI
	lkXaZaYAlMOwagg==
X-Received: by 2002:a05:6214:1243:b0:56e:b1c8:381b with SMTP id r3-20020a056214124300b0056eb1c8381bmr43628861qvv.31.1680189662022;
        Thu, 30 Mar 2023 08:21:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnlSDboIbJVBw8O6nujKKyr0Y08gCZuIWQYE9jVjpUWoFJ1aWyINmV1swnxyoxwYXTAvU/Jw==
X-Received: by 2002:a05:6214:1243:b0:56e:b1c8:381b with SMTP id r3-20020a056214124300b0056eb1c8381bmr43628820qvv.31.1680189661785;
        Thu, 30 Mar 2023 08:21:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d17-20020a0cc691000000b005dd8b9345absm2264239qvj.67.2023.03.30.08.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:21:00 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: remove unused sq_int_priv variable
Date: Thu, 30 Mar 2023 11:20:40 -0400
Message-Id: <20230330152040.1838353-1-trix@redhat.com>
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
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_int_process_v11.c:282:38: error: variable
  'sq_int_priv' set but not used [-Werror,-Wunused-but-set-variable]
        uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
                                            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
index 0d53f6067422..bbd646c0dee7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
@@ -279,7 +279,7 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
 {
 	uint16_t source_id, client_id, ring_id, pasid, vmid;
 	uint32_t context_id0, context_id1;
-	uint8_t sq_int_enc, sq_int_errtype, sq_int_priv;
+	uint8_t sq_int_enc, sq_int_errtype;
 	struct kfd_vm_fault_info info = {0};
 	struct kfd_hsa_memory_exception_data exception_data;
 
@@ -348,13 +348,6 @@ static void event_interrupt_wq_v11(struct kfd_dev *dev,
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_INST:
 				print_sq_intr_info_inst(context_id0, context_id1);
-				sq_int_priv = REG_GET_FIELD(context_id0,
-						SQ_INTERRUPT_WORD_WAVE_CTXID0, PRIV);
-				/*if (sq_int_priv && (kfd_set_dbg_ev_from_interrupt(dev, pasid,
-						KFD_CTXID0_DOORBELL_ID(context_id0),
-						KFD_CTXID0_TRAP_CODE(context_id0),
-						NULL, 0)))
-					return;*/
 				break;
 			case SQ_INTERRUPT_WORD_ENCODING_ERROR:
 				print_sq_intr_info_error(context_id0, context_id1);
-- 
2.27.0

