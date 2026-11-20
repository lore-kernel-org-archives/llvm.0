Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201258;
	b=njNO8OSS8vEcCJg77M7bMYkeag3mlGjw2tXPJ7TqOJXi+9gyCwfU5s1nOjAr6nA7MF6a
	 1/QwB1DS2BkAiNzcHI9StpvI+jXSN+ZHcF03J62pyUqJW3sJEEPGXcCWUvLHLtfAhgrUJ
	 MI1NVguVmknHvFifQGuAcRaBpXsThUL0ukvA8sNwRibw3L/sWWmkeUeY1uvGU9wAJXfEs
	 7kgeI96m9PeB5hy5urufEM2UUQBBeVNF+OmmmqZfAksXU6icCMLnOY06+8rTEtsUiu57+
	 ytskQixYRLOXyLsjVl5kBGda3U2z1nigN16ibEYS/uJR0iKMOfFgFAyco0nCVPQvmbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mviMX423LKxXWIxiYJZwCl9XcD+q+XXpipqa/Ow8DSE=;
	b=JSr4HO+m+z/SqNOPl57TMOltxqpZ2n3NTDXxnmh4vl3dLHOhoUangrQ4zmugjFiLmrfZ
	 TuuoJTZHW6I4FgkjVafGjaRfdEyF5BW0z52fCgeVnnqTFojsadc8v8Z6N8EmVWb+K09pC
	 yfc+SwaTBe6gtn0FWEHzsdDyBVVZz4iy027Y33M6JZyDRsSNFmuRDBZnqxu6P9KUi6Yov
	 x8WKEdAA0ZGaAN3UkDswFymRvkcbB7lt0vV2h8u6WqBOtyS4Kg6ptHCZexkz5xiZughqV
	 BMxrm7QOSHVbMI5edFiWhYwjAsiY7E1WcFg1p3zwQwYPoqLmiSHJyocPqGec+BJggQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JPKutHA+;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E83260A382C
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E83260A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JPKutHA+
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1537025eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201253; x=1795806053; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mviMX423LKxXWIxiYJZwCl9XcD+q+XXpipqa/Ow8DSE=;
        b=JPKutHA+TFYDiGipmodNPi3epJXb4aoG6b0sBOHXtPXeaS75R51rYfj36GPBf5RYwg
         NYcPHqivSWBD95NN+I5I3oc8xXCWkygaoZaeTclYTb7wGDQE83lh80iqVN/0/WuQk2Py
         6Q4cH9ad4fiLdXNkgO4slajoncO/tShygrU/w5xnL3/AARHXz6AO8kI2j5XZmUArJ/fx
         28xpQaBG3b49+0ktUP9z5Hz27n/uXt1g9wR6cP4T86PJ1tGr78RCIg5YMaXEefjQQjGh
         m44hnqbHnjyZD+hibL3+yY5ag0KxJp0gf3KR59BpEU0UKgzwAceC7MfTts0xdR9tWhJM
         XM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201253; x=1795806053;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mviMX423LKxXWIxiYJZwCl9XcD+q+XXpipqa/Ow8DSE=;
        b=vL1vJc7fiE4ZpFTRYEM0TkhTiplqUMRMlC7VYd36C4dBBA41K/P71zMDP4G2GZp+fn
         /Wx3Piu3mV2Y3+jdsa/x1YiZrUbyopgDAGTinGwx8h8Io0FeY2Y1B8HUiLJhx5ekguhN
         Hi91WH6EHNxDe/exVDJfEqDEDpYw32oKLrzrk9n7s/Rt/AXJU/4Z+u02icjiZU97PUSa
         v56D+82SLikVT4miXjYSs8+8N4joG+4E1oU3jgIW7RFYc30RWNdxh4DArqA2Cl42Z4Yz
         MvPomzwSuOIAG0EDnl2xzgqvo18xVuCk+l1C02W/aKHWuy01JzKc0foYE/5fgzLd5Tsw
         XM+g==
X-Forwarded-Encrypted: i=1; AL+hErGYK1oSSvRkYD/9PftIG5CDyOWhDCtyRc7D4GmwVgf+hWO/bc0O+oZP9vPT2ob8UESzjLAG@lists.linux.dev
X-Gm-Message-State: APuU4Z9xVwDgc25qk1GopCiB2/K8ef1olaEMDfXPkbXFdar0TrmhT58Y
	9vXvwlQqECJyV02Axq2JiJN4skd0FtzWjFSldYuIGvckWH7osJbeV/aJvKWfQOJTPOogrd8LvTi
	h3N2LvtknLg==
X-Received: from dybmx4.prod.google.com ([2002:a05:7300:d404:b0:368:2c6d:de10])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6408:b0:383:1bfc:f1c0
 with SMTP id 5a478bee46e88-38570f27a56mr3664460eec.32.1795201252952; Fri, 20
 Nov 2026 11:00:52 -0800 (PST)
Date: Fri, 20 Nov 2026 11:00:30 -0800
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
Message-ID: <20261120190031.1587531-3-irogers@google.com>
Subject: [PATCH v2 2/3] scsi: mpi3mr: Initialize start_time on all paths in mpi3mr_bring_ioc_ready()
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

In mpi3mr_bring_ioc_ready(), start_time is only assigned after writing
MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC when retry == 0, which sits after three
earlier 'goto out_failed' error paths (soft reset failure, failure to
reach MRIOC_STATE_RESET, and admin queue setup failure).

If any of those pre-enable steps fails on the first attempt, out_failed
computes elapsed_time_sec from an uninitialized start_time. Furthermore,
if out_failed decides to retry (retry == 1) and the second attempt
reaches the ready-polling loop, 'if (retry == 0)' skips assigning
start_time, leaving the ready-polling loop comparing against
uninitialized stack memory as well.

Initialize start_time = jiffies at function entry to cover pre-enable
failure exits, and replace 'if (retry == 0)' with a boolean
enable_started check so start_time is reset the first time IOC enable is
written without pre-enable waits draining ready_timeout.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build with AI coding assistant help. Verified with a standalone C
reproducer under ASan/UBSan and by building
drivers/scsi/mpi3mr/mpi3mr_fw.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on MPI3 hardware.

Fixes: 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller retry logic")
Cc: stable@vger.kernel.org
Reviewed-by: Laurence Oberman <loberman@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/mpi3mr/mpi3mr_fw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index 416f27c37535..1aeae8a55b1b 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -1582,8 +1582,9 @@ static int mpi3mr_bring_ioc_ready(struct mpi3mr_ioc *mrioc)
 	int retval = 0;
 	enum mpi3mr_iocstate ioc_state;
 	u64 base_info;
+	bool enable_started = false;
 	u8 retry = 0;
-	u64 start_time, elapsed_time_sec;
+	u64 start_time = jiffies, elapsed_time_sec;
 
 retry_bring_ioc_ready:
 
@@ -1690,8 +1691,10 @@ retry_bring_ioc_ready:
 	ioc_config |= MPI3_SYSIF_IOC_CONFIG_ENABLE_IOC;
 	writel(ioc_config, &mrioc->sysif_regs->ioc_configuration);
 
-	if (retry == 0)
+	if (!enable_started) {
 		start_time = jiffies;
+		enable_started = true;
+	}
 
 	timeout = mrioc->ready_timeout * 10;
 	do {
-- 
2.56.1.750.gf70dc682cf-goog

