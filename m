Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71B93B28
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645116078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NZLivYuLnXFIGdCejA7zd1S5U4NvNvoWvtuXURyH+rc=;
	b=ANwOpszvGgMH85e/RgQTJmSWnzxMIOhlJMt/oW1a4kJwXmQxR7jInZxaVd/rCe1Ql1hLxu
	TgCGZ94taC1j2+fKZR69+jAGdT5vsxk8qLxYL0jZbRwE0IidWBjUYTz2Pja+VTKvUzhqLg
	L+Dy9S66bzNPY0DJiQD+p5lQxb4Cssg=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-J-Ndfta3PiWMnrC97r9kqw-1; Thu, 17 Feb 2022 11:41:17 -0500
X-MC-Unique: J-Ndfta3PiWMnrC97r9kqw-1
Received: by mail-ot1-f70.google.com with SMTP id w9-20020a056830410900b005ad1bf1f0b9so91476ott.4
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 08:41:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZLivYuLnXFIGdCejA7zd1S5U4NvNvoWvtuXURyH+rc=;
        b=Uv5yXS6lcS/WVjmO77DxBQWBlMvqiSW8Do5VZ8aD/CSVMMIAhKlOWZBT4Mm2yS+tbr
         6DSl6maKUg9JsHLS/quQ16qq+ju67+ArjZvDeMsFCGygqb9l3D7L9GCbP/QMG8oYhaLi
         K7F85nCHpLsX6RDWareFn/HnRU1x4A0A4XnFzJb1o2yHRpINe+0yFdhhV7aaBKaDN7W9
         f4r4Hho0N03i8KMPN7ZpHz+Piut6ryIL/3gpWsEF418l/qNyGYlU3c7OVSGDkinAAVWn
         XrgON56+3Nl8dSs8tWsOS8okuyUlbiwKbTMZr2pcLVNImB0ulhW/ZNFqVPQY7eEQF+VS
         IyEg==
X-Gm-Message-State: AOAM5335OM7DR+aLWcT4ccB19Ef0dRTodJwpm3USOC/+bOp0/HESV6g1
	SJJopwfhAHLWFs8hionrLXp70jBldaL8NbMEVSPoF0vH79/7flHbxqDTrRIERTp8E1ijrWhWHs4
	1yyR5xhM7Erai6Q==
X-Received: by 2002:a05:6808:1808:b0:2d4:6241:4b68 with SMTP id bh8-20020a056808180800b002d462414b68mr1459848oib.144.1645116076648;
        Thu, 17 Feb 2022 08:41:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY81YLz3R+btUH+HwXzqO3VuFqto6H0t4DtW0M3Mj5JPgoD/uw4ueVsQaD+uGA6bBPpr4M4w==
X-Received: by 2002:a05:6808:1808:b0:2d4:6241:4b68 with SMTP id bh8-20020a056808180800b002d462414b68mr1459828oib.144.1645116076436;
        Thu, 17 Feb 2022 08:41:16 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id p23sm106844otk.17.2022.02.17.08.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:41:16 -0800 (PST)
From: trix@redhat.com
To: Felix.Kuehling@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	nathan@kernel.org,
	ndesaulniers@google.com,
	jonathan.kim@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] drm/amdkfd: fix typo in setting enum value
Date: Thu, 17 Feb 2022 08:41:10 -0800
Message-Id: <20220217164110.3258269-1-trix@redhat.com>
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

Clang build fails with
kfd_packet_manager_v9.c:267:3: error: implicit conversion
  from enumeration type 'enum mes_map_queues_extended_engine_sel_enum'
  to different enumeration type
  'enum mes_unmap_queues_extended_engine_sel_enum'
   extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This looks like a typo, the function is _unmap_, the enum
extended_engine_sel__mes_map_queues__sdma0_to_7_sel  is _map_.
To match the packet->bitfields2.extended_engine_set type
it should be extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel.

Fixes: 009e9a158505 ("drm/amdkfd: navi2x requires extended engines to map and unmap sdma queues")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
index 806a03566a24..18250845a989 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
@@ -264,7 +264,7 @@ static int pm_unmap_queues_v9(struct packet_manager *pm, uint32_t *buffer,
 					sizeof(struct pm4_mes_unmap_queues));
 
 	packet->bitfields2.extended_engine_sel = pm_use_ext_eng(pm->dqm->dev) ?
-		extended_engine_sel__mes_map_queues__sdma0_to_7_sel :
+		extended_engine_sel__mes_unmap_queues__sdma0_to_7_sel :
 		extended_engine_sel__mes_unmap_queues__legacy_engine_sel;
 
 	packet->bitfields2.engine_sel =
-- 
2.26.3

