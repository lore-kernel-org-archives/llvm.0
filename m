Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201248;
	b=z73ifG493tYOlZkpHfqBwJepJ8H4WsSrfIFM+Z1j+yljjGURcx8hbylm1CKmv4bGQDKC
	 7R5v+InT9Hk5R3u/uDVjPRLBYmtt22HAFqrZnVUZvcxgVv96Pk1xc8RHbHcJFWdk3N1GY
	 Bjf6Cr79/2cKjcywfsUEIkWFubLapFpMeOUy/Xg00IftkeY9iXrupRCKCqEgHjHDcTig0
	 5GbTYSLALrMNbbgPBVGJsNF0D8ZFfnX1AEREztsodyx3ziAfjehGlSPCHvt7dsKERe/EA
	 c/LGJJpxpTUOQfzDWLSRHdMXRg2jcmfXvo62mujUsc+x255vlXsGPev0uLsbUI7xbGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
	b=LROBBpY4TODOHFf/3pRs+Xhr0D1qN4OZ/Qm72bfMnl1Naz+sxZMGGF6YHADq4tBeICG6
	 iVMbs5S0iin/U7XY9aNy5KL/aKApfsisv7bV3oFePUNeD9L7OeE0UtbJZa0hK7wmHYU8w
	 cWjRSI/A30Xivbgh6j7HlGPe2ksbBeRqzpW4Y65pVI2hQq4lsvj/iUT8fzjrjfqFG3IbC
	 I+eZaIb6V8u53sriIT01FJ1HTv1EDOmzztckMtRRzqJVI8BnyV1bnIHytRVKlYH2MMjm0
	 APXWhVF8QP4lzyuYNkUZ8wCvvVa2QOZcKIUR4acM4DXpFXJ4rsIIOL/lpsRLdq1NzdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pddp4FwS;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43960A380C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B43960A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pddp4FwS
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a5005fd0f8so2229421c88.0
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201240; x=1795806040; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
        b=pddp4FwS7OvDarSnRS000Pev+25nsf+c98iFWnrmTo9QW6hE6cPGiARjNiCWkWWF9p
         0dA6j01d+5KwhUi2cro5HsnlXSvtG6VZmnAegS0h95NEBW3+fy1OfoHZmfxN+kfav2UV
         RWFIqwfO+rH6zqcU3tFSrfJ+Jff66VMG/C4Jqesc72lvtI86CANqPlFjCoRnXqq/emRt
         ggY8QBZbo/Ykj0SKgh44Br9Cg7z2ab3AOdAR4zFajJlv/sjcuu7kHI6SogjeOqE3WNK0
         OB39FtBRvFZmlsOcjP06yCFfGhswA1LUV2LM2DPP4eEGmELR3YRGK3+7k05Xh6YLjTnh
         SLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201240; x=1795806040;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNLjbm4DATGnAXYQNaz3Ekm01BREm2qtWAOyb3LUDX8=;
        b=uQznrRqkG8ZVkvpBJYd0o5jrSRJI61p+pVxROthEliuGudlhB4XiQ1TsFjc3nlBhGo
         LoMVo+5SMjgCWmc7VeF/dguRxVh6aEC6rjvGfBbMNBiEIFTBs1p50CBJkfjC9eR8p19M
         Fwm9jJZ7PjZymokusGpBm8SCC+8BbtsFdUVMfTfgzZUIeoia36WVqcrZxfmnn8Ex2X1c
         rJ+FwaAi4CkHDG/0fZTmpATVMMFrsspVZ69HXb2UTfQFM9YhYxjVGF4q8StALC4+/Pqe
         coOwieKMoBOnzEn/xjJeeJuhrm7ItPuI3fuDTJuZ6RleMHfkkLb82rTL4DQ+SjJUjp4t
         /Nvw==
X-Forwarded-Encrypted: i=1; AL+hErEnGjrvowHDQZ99gitdo2zohEOrrdzNgB2m28vZSixUU6kb8GCqPmoxP20Av4SOTFjzBuph@lists.linux.dev
X-Gm-Message-State: APuU4Z+dLopmm7vjqQdiuif5DvrTiLcM1KXzyfFogTdbCm4emkxw2v40
	PVVb67lsN0pfw9TmmxmnFxOLMcAkWABBLPBv20iY8JgqC9nf8s4IbslIuQA9nl1IaVsbzyMI0FM
	PQ2efbjFVfw==
X-Received: from dlbuu1.prod.google.com ([2002:a05:7022:7e81:b0:1b3:ba1e:2c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4584:b0:1ac:9da7:e86e
 with SMTP id a92af1059eb24-1b556908c17mr3830341c88.30.1795201239052; Fri, 20
 Nov 2026 11:00:39 -0800 (PST)
Date: Fri, 20 Nov 2026 11:00:28 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120190031.1587531-1-irogers@google.com>
Subject: [PATCH v2 0/3] scsi: mpi3mr: Fix error return, start_time, and
 timeout check in mpi3mr_bring_ioc_ready()
From: Ian Rogers <irogers@google.com>
To: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Laurence Oberman <loberman@redhat.com>, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Split the mpi3mr_bring_ioc_ready() error-handling and retry fixes into
three independent patches with individual Fixes: tags as requested by
Laurence Oberman:

1. Return -1 instead of 0 on failure exits in mpi3mr_bring_ioc_ready()
   when retval is 0 (such as unrecoverable controller faults, hot-unplug
   during reset/diag-save waits, or ready-state faults and timeouts
   after mpi3mr_setup_admin_qpair() sets retval = 0).
2. Initialize start_time = jiffies on entry and guard the post-enable
   timestamp reset with a boolean flag so pre-enable failures and
   subsequent retries never read an uninitialized start_time.
3. Rewrite 'elapsed_time_sec < (mrioc->ready_timeout - 60)' as
   'elapsed_time_sec + 60 < mrioc->ready_timeout' to avoid 32-bit
   unsigned underflow if a controller reports ready_timeout < 60.

v2:
  - Split v1 into three patches, each with its own Fixes: tag (Laurence
    Oberman).
  - Move 'if (!retval) retval = -1;' to 'out_device_not_present:' in
    patch 1 so a single hunk covers both out_failed fallthroughs and
    early out_device_not_present jumps cleanly for stable backports.
  - Add Laurence's Reviewed-by tag on patches 1 and 2, and note the
    510s (570s - 60s) firmware timeout math from commit 9634bb07083c in
    patch 3.

v1: https://lore.kernel.org/r/20261119170900.1530138-1-irogers@google.com

Ian Rogers (3):
  scsi: mpi3mr: Return error on all failure exits in
    mpi3mr_bring_ioc_ready()
  scsi: mpi3mr: Initialize start_time on all paths in
    mpi3mr_bring_ioc_ready()
  scsi: mpi3mr: Avoid ready_timeout underflow in
    mpi3mr_bring_ioc_ready()

 drivers/scsi/mpi3mr/mpi3mr_fw.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

