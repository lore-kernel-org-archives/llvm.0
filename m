Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201272;
	b=rwzNpTVzrCkJO9ZhXhXiG4YleHQgEgQ52++rpnquRykVgbGJNGBm/Apowkrg7fBekqY1
	 5K3U8AJC6U4zln9CkfVNigPXTnbhK/TpxBJnNMniKAI/uqu0OUYkJtm3oeq9WNVTeiYmz
	 ++KFSVl7ZFrGo+EaOJIL/ZETVuBiiFuSB4VPo0KTiwi3+oNA2puHnINdWbvUEFPqdnJTJ
	 vdIZZXoRpHhhE4/DCvbYhzrri6Q4xcqSp9Cy0huhd6M+qJxCSWvgXWFxrVo1PQZeTnAh3
	 6hXFJFT32E/g/Xp1qwQ5jJDgbvAkzHOr/Jy+7g3eino/Ru0EYZTD/Qej0/j2EYov0Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=x/cJrK5hJQJmQXtcIXag07pJ6jf6c/C/z5CdzDpNgrk=;
	b=OQg88Gp1bWzwRSeG3BUHTUxcymGoKTmXPujQc2t8ATqaQCMVmKVot841TH9huSrq5E10
	 pu3FTBY33UHYWK+n9/BrNU4yJoeuvj08cYXcZmscea/GbkR2708OnxCwHMm7cpyWE3Mt/
	 jtCfESpP9woJKhx6MBv/8ZSFgpnBKS/BuK/bwD2Wpf5YVLMLxjm8rBC02lZWUQGE0s9Y2
	 fyDW42ZFDZ/M41si4S/TOPEtOdvfURsDqfox9n8QSlTejuIl/5ysT2f50mOFr1irB3dRr
	 fbgaopdC8wjYT9f9vXd8usHifUktxh3CaoN64oGBv9R7qiny0MBqYIhcrCnfOI6Dssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YUss6vzP;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D17360A3828
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D17360A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YUss6vzP
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b29df78132so1275741c88.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201261; x=1795806061; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/cJrK5hJQJmQXtcIXag07pJ6jf6c/C/z5CdzDpNgrk=;
        b=YUss6vzPrP9T9lBckYca6xWoJpuVkz8pVzAbaSHe4XtLMeqjxLH8bXaQkMoVZrwEtB
         mj1f5/8K5H0drIwT9aXv5DTo7ChvR6w1hQbDfAokiCEIJmP7nJ8IKPXZDBXMJh7MQBjp
         oTsH2jT+t67TPTrG57fSwXYn2KgKQbHa2JNc27hmBn8QQajT1Lzi6/Rn942OpaCxjz2k
         1vt6nfUx0TXdPLw21721QfYq538of27weviw+tQi+cJbozIVCs6P8sAP8tNdYm71LqNK
         Tcz/LFmOYEdEwTUEOS7LOc7P34lc+EznZLcqX0YoYobm9xX4o1f5otYAL2W6LVMCXE72
         /qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201261; x=1795806061;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x/cJrK5hJQJmQXtcIXag07pJ6jf6c/C/z5CdzDpNgrk=;
        b=Gaf7ZINMBGj9rrfYkr6l7pdwiUUVbKUqkeyp5avkvEOVu8pKL08KI6rzkbpVodUyzu
         6nFEleFh19t4auFpssHK8V999Jkn8OKfyPb31gzVpnMindGhwDhh+Ifvu0WS4rlyKQIx
         LJzrVoxxv8pthz9+dXndXZPO40zXlofbZ7EUTNW7ITePnqyjY6epkcmBHFPd3rD69s1B
         +lO7HcxvcjJehMMMBqXDwxIW+d15CrurxIMGQpT29h9E0qTqFITrM5puPmDMvTiD8vbz
         yak/Qq2UkJlZCO65vGO0yn0cHoIQXEIB9fGQcgEUrF7uKEy2vUe9WKlsMeuRFUezMldn
         TqKg==
X-Forwarded-Encrypted: i=1; AL+hErEQASQaf6qiohZ6vtzL8v+c6KPtgWILuUXw7/e7fDvFlgWI2mAaj50u1nq3U4UVmBoTYUoO@lists.linux.dev
X-Gm-Message-State: APuU4Z+YduoXNPoMuV0fHiWdEgdt1tipuDFn6PSr2L7viUdXaNt8a+4L
	ZBSStOKhG9nnxWDpdcfaFGtmzEP+MLn97mnl0gNWTpIoNQvXJ4Fz3438PstSsnCdU8jY9gizM0F
	wxeEi8qEfZQ==
X-Received: from dlbtu1.prod.google.com ([2002:a05:7022:3c01:b0:197:f679:f62d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e882:b0:1b5:481:ff0f
 with SMTP id a92af1059eb24-1b55692fd20mr3946544c88.32.1795201259386; Fri, 20
 Nov 2026 11:00:59 -0800 (PST)
Date: Fri, 20 Nov 2026 11:00:31 -0800
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
Message-ID: <20261120190031.1587531-4-irogers@google.com>
Subject: [PATCH v2 3/3] scsi: mpi3mr: Avoid ready_timeout underflow in mpi3mr_bring_ioc_ready()
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

Commit 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller retry
logic") caps cumulative enable retries at 'mrioc->ready_timeout - 60'
(510 seconds on firmware advertising a 570-second ready timeout) so a
retry is not started with less than 60 seconds remaining.

Because mrioc->ready_timeout is a u32 read from the controller's
ioc_information register, any value below 60 (for example 0 from a
broken or disconnected controller) wraps around in 32-bit unsigned
arithmetic (e.g. 0xffffffc4) before zero-extending to u64 for the
comparison with elapsed_time_sec, spuriously retrying instead of
aborting.

Rewrite the check as 'elapsed_time_sec + 60 < mrioc->ready_timeout' to
avoid unsigned underflow while preserving the 60-second margin when
ready_timeout >= 60. (Note that if any firmware legitimately advertises
ready_timeout < 60, no retries will be attempted.)

Found during code inspection alongside a Clang warning audit with AI
coding assistant help. Verified with a standalone C reproducer under
UBSan and by building drivers/scsi/mpi3mr/mpi3mr_fw.o with LLVM=1 W=1
(-Werror); not runtime-tested on MPI3 hardware.

Fixes: 9634bb07083c ("scsi: mpi3mr: Enhance the Enable Controller retry logic")
Cc: stable@vger.kernel.org
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/mpi3mr/mpi3mr_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
index 1aeae8a55b1b..45544ad21a6e 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
@@ -1734,7 +1734,7 @@ retry_bring_ioc_ready:
 
 out_failed:
 	elapsed_time_sec = jiffies_to_msecs(jiffies - start_time)/1000;
-	if ((retry < 2) && (elapsed_time_sec < (mrioc->ready_timeout - 60))) {
+	if (retry < 2 && elapsed_time_sec + 60 < mrioc->ready_timeout) {
 		retry++;
 
 		ioc_warn(mrioc, "retrying to bring IOC ready, retry_count:%d\n"
-- 
2.56.1.750.gf70dc682cf-goog

