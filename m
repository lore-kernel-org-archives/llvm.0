Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201252;
	b=VIvz04ar8bbEfV7/YIKBgRwNqwiil840AVT9Ih0DNkbgPRr1aiGeAKWVb6iP9oydDkYT
	 OoI6N9L/9Sl5M8UaUmqlxK09tlRgF+mH6hUyzkOjPUgZb/H59Wah29y3pjZcNCcw0wC7p
	 Vw+nhJ3O570PXYu5DH2oDgguUvRuiHTSPX1X4GRjvf+Xhz6Jh+l0Trd6jZrCsgofizUXV
	 dsNLZUn4IzutQYjEJz/zW2zbaJtwpxTKwwo8xuCOTuQl5hG4uPcey6CdcRAT9Bvz2bpp0
	 iv/ko4rDO+INOPNLfhlh3CKtMrxZeJQ7JUqf9AOXdGZVu6WKRd9p1bHq8Y3zY3d2koA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2IUJ4prZfGsGzb0Qck/GAuOjhnwEHRfiPDhs17Z4SoU=;
	b=vrKG7x5WXJTg9Eof2u8lzySikgwcY81PhuEjaKD/vqlQt+T/QhJBo98/niT+/jd8dsCY
	 IXqbAT5Urh4QcHiKpDUHvy1tni9f5RTBvZUZWVSuBrVoW+bUb+5srH6ogka7W2B06dtAp
	 uM7Suu0+WSRcICz6oeKkOiEbkknXiYGgplI7zQQuoVKNFTIAITMPD3LLr9v5WmiS3GKDJ
	 0+qv7lkdnC7SInSQrm5S46+dEoB0AQPFDIwkHsO37D0r0G1mADsCeYvotD+hS/kV1bgyU
	 j98d/jhAdlewGHDtvoknfg+vUtZ/Ui81PA9hC1MRNsk9PCmZzNVUbHgtCwYQCyZUSQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LACulPPD;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FEF60A3808
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FEF60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LACulPPD
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1064281a12.2
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201248; x=1795806048; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IUJ4prZfGsGzb0Qck/GAuOjhnwEHRfiPDhs17Z4SoU=;
        b=LACulPPDeqOddTvVyk6MXGsQN0Sita9UlhuV7TcpUh50kh4UvZ/jyQ7Bme67UHhcp2
         Ic4qtDZiPKE9/LFI9lqx8ilSigpIELYfqQLLgcdqpbCBUtoD02uXJNUSiKzR5LjYY2jt
         CAZz4QGjFqsQY3QyHpu7D01BiieWdAv5Lfr6kzQMy6V6PlFM6WeJMHw1uMw7j0vLj5CG
         csvGHqvefuFAgGrfZTBGciSYalJzb+Q7o94h9t29RNd0yxW7M7zuhWBETCB5Bu8K5RSX
         yiuqD/wOI8W7+f/VtDWgF97u9RrZCiQOhfNpcF25Wc+FkQt6iJqs8hErU0Sq6ICnAtB3
         TaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201248; x=1795806048;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IUJ4prZfGsGzb0Qck/GAuOjhnwEHRfiPDhs17Z4SoU=;
        b=nSWDRJgFufLx/uI4ipSEbGEpfSKFXBxjpY3rqvso0xvfrH2B5uO/3Cr4YT+F2/ylkL
         ymGaN8nd7Jrlo1Ymaqc/Q9bVgdmo6gWCwOjhWd9tTRpJXNey9s1q7hTArmSdhs8PzKaM
         3A3Bgg6C3uO0p+JVxEwa9BzI7ufCbnDFEjHcpCkpUMpO8Xt/XtOt6jOSHzwsTXQPPExM
         y8su3un5y/gT+wxhJ364UMAZ0uVraKyMJduf1+fRaGoM2nJiKKBQ0fDCFQRJDt54rrkb
         1WEdq3XaJAv0xNbDH8shr8mycqw+n6eMqHtzMtTFVEn5if71Ap0oLnluYivAUP5BlQ4b
         W7/A==
X-Forwarded-Encrypted: i=1; AL+hErEDt6Y3N05fDnrt7W3IHYEGO83r95ua3bLgNeSqBWDNuxGqItxcQA9o8Epqad+w90PDlkgf@lists.linux.dev
X-Gm-Message-State: APuU4Z/yunsDl4S7hye58F904lzzGqhom1aeqwMx371fga5SnMPQ4m8r
	Dk2SIaA6X3pQ4K2f2PaFqYojQxCf56oKeTaeWQpNKj6R4NzmROj2hTw/D/8K/eYPO9JE1K5fJuc
	dholkN8zalQ==
X-Received: from pgiy3.prod.google.com ([2002:a63:de43:0:b0:cca:d82:9104])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:db97:b0:3dd:a006:ed90
 with SMTP id adf61e73a8af0-4014bc4e776mr3903412637.38.1795201247965; Fri, 20
 Nov 2026 11:00:47 -0800 (PST)
Date: Fri, 20 Nov 2026 11:00:29 -0800
In-Reply-To: <20261120190031.1587531-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261120190031.1587531-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120190031.1587531-2-irogers@google.com>
Subject: [PATCH v2 1/3] scsi: mpi3mr: Return error on all failure exits in mpi3mr_bring_ioc_ready()
From: Ian Rogers <irogers@google.com>
To: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>, Kashyap Desai <kashyap.desai@broadcom.com>, 
	Sumit Saxena <sumit.saxena@broadcom.com>, Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: Laurence Oberman <loberman@redhat.com>, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In mpi3mr_bring_ioc_ready(), all success paths return 0 directly, while
all failure paths either fall through out_failed or jump to
out_device_not_present and return retval.

However, retval is initialized to 0 at function entry and overwritten
with 0 once mpi3mr_setup_admin_qpair() succeeds. As a result, failure
paths that do not set retval themselves - including unrecoverable fault
checks, PCI device removal during reset or diagnostic-save waits,
failure to reach MRIOC_STATE_RESET, and ready-loop fault/reset-history
exits or timeouts - return 0 (success) to mpi3mr_init_ioc() and
mpi3mr_reinit_ioc(), causing initialization to proceed against a failed
or absent controller.

Set retval = -1 at out_device_not_present whenever retval is 0 so every
failure exit returns a non-zero error while preserving specific error
codes from helper calls.

Found during an x86_64 LLVM=1 allyesconfig warning audit with AI coding
assistant help. Verified with a standalone C logic reproducer and by
building drivers/scsi/mpi3mr/mpi3mr_fw.o with LLVM=1 W=1 (-Werror); not
runtime-tested on MPI3 hardware.

Fixes: 59bd9cfe3fa0 ("scsi: mpi3mr: Code refactor of IOC init - part2")
Cc: stable@vger.kernel.org
Reviewed-by: Laurence Oberman <loberman@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/mpi3mr/mpi3mr_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index f0d3cd398dd0..416f27c37535 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -1744,6 +1744,8 @@ out_failed:
 	    "failed to bring to ready state,  current state: %s\n",
 	    mpi3mr_iocstate_name(ioc_state));
 out_device_not_present:
+	if (!retval)
+		retval = -1;
 	return retval;
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

