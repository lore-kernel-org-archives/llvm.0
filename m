Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17627C
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680221534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fOkGCDSj8lCYrOV3T53RqMyXeDPosCHIFZ+HCuqViiM=;
	b=W3cP/HjJkGEghiBn2bxlTQ7SvtU44guWYxsY34q4timUu9hMvRPpF5Dtvak8R3KCh3eo+K
	iz3+14wE8ZWeRkVGaMlawAcHgcWQU9VDzdDT9Qx2S0ErwMaum06f48JTe6+2F4Tjawesot
	TKTqvVqTmmVfyxuAS9l1JiN2WoAuzVA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-E07fmiojPUW91VlN7YskRQ-1; Thu, 30 Mar 2023 20:12:12 -0400
X-MC-Unique: E07fmiojPUW91VlN7YskRQ-1
Received: by mail-qt1-f200.google.com with SMTP id h6-20020ac85846000000b003e3c23d562aso13542820qth.1
        for <llvm@lists.linux.dev>; Thu, 30 Mar 2023 17:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680221532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOkGCDSj8lCYrOV3T53RqMyXeDPosCHIFZ+HCuqViiM=;
        b=GQ4Lvjg1KaZi07k4tL1IoL07B14XjD04QFMBA+PQ83W4C1QE+6Mfe7qENURF5s4i8V
         WoTMi/LEoJmoS3+9OVMzd5DJor2C7/zkZI/n83n/H/hL97DWlw9lBEC5pnL/HrCgTz1D
         qzDX7DfO8H1FRQH3mnRBU9gOGH20D2G0cXJxLGNF9Atpgib6c4BMyi2qk4h2YbIcjN16
         wy7QK6+xC2/1xSIaPoBfjiNfZU3jb/exJOUP8kghCfD6T3Dqy7E1/BTqMfaGLMibYzf2
         5XdTJjYFxe1WjsyAnd5QG39YSWwnJQ1QH9S00rAIfoMaK9+x+JNhJ4kygw9nUjObYmkl
         vK7A==
X-Gm-Message-State: AAQBX9dnIqxQ9LTzHUEnBu7yN+eWMm+OcY28v01bJI49dhyy1Movis5E
	zDMOx8LeNinfRcRFkhvHlclPCToeOgLaX+cA8XnhfuIhjpHTRc6EHj+sDXAHXshm3uyMaNrLCVw
	iw81RN+wWc52rIQ==
X-Received: by 2002:ad4:5ccc:0:b0:5aa:fd43:1fcd with SMTP id iu12-20020ad45ccc000000b005aafd431fcdmr41762434qvb.42.1680221532170;
        Thu, 30 Mar 2023 17:12:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjRsivYicxZuXm5irkBw31aCOlUFuwEjWTIzCh6ugnPYhFkVi1a8AdrrculeonWtsS1vJHsQ==
X-Received: by 2002:ad4:5ccc:0:b0:5aa:fd43:1fcd with SMTP id iu12-20020ad45ccc000000b005aafd431fcdmr41762413qvb.42.1680221531952;
        Thu, 30 Mar 2023 17:12:11 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id ny8-20020a056214398800b005dd8b934584sm216973qvb.28.2023.03.30.17.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 17:12:11 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: stuyoder@gmail.com,
	laurentiu.tudor@nxp.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] bus: fsl-mc: remove unused free_count variable
Date: Thu, 30 Mar 2023 20:12:08 -0400
Message-Id: <20230331001208.1846731-1-trix@redhat.com>
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
drivers/bus/fsl-mc/fsl-mc-allocator.c:560:6: error: variable
  'free_count' set but not used [-Werror,-Wunused-but-set-variable]
        int free_count = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/bus/fsl-mc/fsl-mc-allocator.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
index dced427ca8ba..f1351237a9d5 100644
--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -557,12 +557,9 @@ static void fsl_mc_cleanup_resource_pool(struct fsl_mc_device *mc_bus_dev,
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_bus_dev);
 	struct fsl_mc_resource_pool *res_pool =
 					&mc_bus->resource_pools[pool_type];
-	int free_count = 0;
 
-	list_for_each_entry_safe(resource, next, &res_pool->free_list, node) {
-		free_count++;
+	list_for_each_entry_safe(resource, next, &res_pool->free_list, node)
 		devm_kfree(&mc_bus_dev->dev, resource);
-	}
 }
 
 void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev)
-- 
2.27.0

