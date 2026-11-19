Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107843;
	b=HD8NDIuYduxq3XYeBQcu5BoliT+QBesHGT6RbXL73ympAecRCU2mgTxksbZ5g8clTon3
	 nX2TWYT2bwukGWmmZ6GXqse7CUlwoq39FgPAEEyMoa19rBLaNSwCmwCf49+0RRwGuEjl3
	 obqE0P4jwHeLykOsV3S56eFRyCXBWIGY5/6zMb2BXdrmcMyPo4sOWhxl7LIeXs+3VoL7F
	 3kBOvRHPD0pRvYEoEnVvfFl7nmkGevIv9dhW3vk8O5tk4+d5hUT08ENkN3I0fx5aXyUOL
	 JcWpXAWxAhr1XW4Labw1h5/FgtXM4lBYGlOMdWeZRytEZOcXnsTpm0trGu0jgVJYQSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
	b=JIaYIeFU9v4Jd26LA2epBIgPSmB0tKMLNwFLSdIDKUxw31ClUoC84W11AFnwh+heCacE
	 weNqBHJzXf/ttzv32fnVFqEh60bv+fxKPuskaWYmiHQnCQ7kP7rgDaIoecnhnoWxMm2Mn
	 xumIZphjg04chjE2uYa6h61gR6capBVwthmTbw+13lgjaRNbdV7ZZyVpNf/QWw/bB7XN+
	 y67n7u72d35awY39n09vXuQfEQJ1+YwmqLh0Cd4dlvsrI1eD0c9hJLcLnmzE+N8vsozNC
	 NaP9/7yMAR9AerbVYHZiQkkgB2cPSmZ7GlPEh1JzTBQIOulfKF2qutuGGE18/fjLK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=njL1ggDw;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BDB606A32F
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BDB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=njL1ggDw
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3837afac185so4818048eec.1
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107843; x=1795712643; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=njL1ggDwJzQR77OVPSEJ+QEMXOweDrmkTuoG8yBg6KPc9V3dbrKEqBTUd4xJzmR5j4
         69T+0iKkbBWmox9gnFISJpFBzK5+hFKD6gvOZkJ3wvQisGDoqH+ko7K169kLDMbod47e
         kKlb4wf7u900NITCR1lKZeYWtQbwiTLPoKCYP8ZNeUHn7PWdGuNHPRmtpwZ9BnSLoXhd
         an2AQt5O3pxCWYtwIm4pWxHL9d8de6B7SGl0Be88IUabIj++Mpq5jTyraBIq8St+EAEn
         g6Pkt4WTpLr1xGxIf0C6evRVCLa7yQOK+yx7tuOnh+RSoL20/T5FDPkNRMaPiMLTIQuO
         iG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107843; x=1795712643;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpOydH3EiuVYC0JIFAKpgbAxwR7+WpJ/TuK8OmPVRpk=;
        b=x7paK9zqBvPBgy5b+A639sR6N0ugr1CpJ2A+hCW+1BoTwjgM4hLkYdAGDMJO7+eTyv
         AIoCqNGa1G0OStZU2CRBfGWTmwtrO1alD0n/4udggfJL/C1ukjnCPBwb60AAlfWFRmX9
         AuXXJ0tZ2EfCmWI6SBgUrj/yrPEUpN6lNZFt+qtra89oELiBHGwhB9dWQIR0lZNe/fir
         iYCPwZRhqZLr96ImHR7jCZhhTuVSp2w3wI6f6WcnYJBN2watM9I13T0onyobyLn48d8K
         rG8MUQ1lHjWSIvtgxj5IrGh2Pys4FlESYaEnVffpN38EDoIdxVxuJyw85zeipcDWOq6A
         Ol2A==
X-Forwarded-Encrypted: i=1; AL+hErGgWFbM62vxbIN24B7AZKuW+Pi7PNqlEmFe7eMW7r5gYa9ygm3HMuEwmalHeLvDC6FkQkSt@lists.linux.dev
X-Gm-Message-State: APuU4Z/ckOKAtEefdGzaEyBvF/QeZDZWIIzMVvPRC0pCxoApxhsMHPZ1
	RNPVPIRmfvI89Cqo21U/qYpFynNGjpaax1DAxdNH4ruMAGhnzSY1U89OIT/FPeXHShdEICP7NPP
	cjRXxUt4TKw==
X-Received: from dybml48.prod.google.com ([2002:a05:7301:1530:b0:376:328a:f96a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2113:b0:37a:a9db:6bd2
 with SMTP id 5a478bee46e88-3828026960bmr6552673eec.11.1795107842263; Thu, 19
 Nov 2026 09:04:02 -0800 (PST)
Date: Thu, 19 Nov 2026 09:03:56 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106937.git.irogers@google.com>
Subject: [PATCH 0/2] drm/nouveau: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two independent fixes in drm/nouveau found while auditing Clang
warnings (-Wswitch-enum and -Wconditional-uninitialized) on an
x86_64 allyesconfig build:

1. Handle NVIF_CONN_TV and release nv_connector on error in
   nouveau_connector_create().
2. Initialize primary_crc before switching on src in
   crcca7d_get_crc() for GB20x RG CRC capture.

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Nouveau hardware.

Ian Rogers (2):
  drm/nouveau: Handle NVIF_CONN_TV and fix error cleanup in
    nouveau_connector_create()
  drm/nouveau/kms: Initialize primary_crc for RG CRC capture on GB20x

 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c  | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.56.1.708.g77570a6a1d-goog

