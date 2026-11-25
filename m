Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645329;
	b=OZFZqA7EZ7Cr9jjmgDVRCILt4czB/VNvliGBptoYT/HJs5ybyRbs/e2V6Rz23iUJs34w
	 nydfg+JKy94f/olc+JON0OZIe7koU3BlzbgB7Q4FXe+c80QVsCkxo/j0dM3Ywr/KvMs78
	 Hj9+CuKhmRa69vyeFN7GM8sZo1/+Wn3Injn/5sfIsqkQzYMnPX3Lg/OqI9yqG6WDZiesx
	 Pg/FGf9B5Nrh4tyCFdlVkq1/GEx71NBbsWdXihVav8F7c1aHOLuDkaGVtIeJ7AfjO5HUw
	 AwyEtdGIsyBcFcB8s4peJ7AQPKDvOggcJnKZAcH+Di576aavO+8wVqQF2t5OqE201QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
	b=FqwD5LOwmWAtyXUT+2jpGCsUNOoyXJowrxKGYI1tbXzGg2EhOsfKF4un+TC3ubHEOcKs
	 edTrOVlw+owGhscS04NApf6mKQOL4nnHDFAKvc+aNs0dt1xFBX6v09T2nUdlKAJ95dH2F
	 HMUFNKgREABlR3OsP2SfawqMrLkqVCHBGNH++GDq3otv1ck99iupOhzNGK6WrnLeNP1xM
	 BsD7dRayQRdk+ao/1sfg8HAEznbGH882izIq9DscaBVEKFMcIjZKuZ5cBWV0vqzT5nmoZ
	 6v67xMv/OJR4zi6GpxcQdGPUZUsDqb2PJ8oo0qFgwuJcYZV7TML82uFi/xVeaz9JVJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tg3opAMj;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFC606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFFC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tg3opAMj
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8367480eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645328; x=1796250128; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=Tg3opAMjURa/WNmwRb2nkcT6PmB9WLkyFDAZ5ZJEn/bKVNKSpmvVWKxAN7t2ChpjLY
         oD1tx47ZAswJXAW7BYN/ebybYadsGolorTXfx7llE2aF8Nj9QHW2JrI7o6GVpyohkONb
         u6l0Sv1bn+pnMp/0O2ldBsNfwNfdimSCaG9SP1JEO8Emx4ErM/XARSlCJ0j4pYOzKjiY
         YcKJsw9rUXLsGg9JSH0xTMey42rihdsnZ84KILRGpW8iRnWZXY0G1Zl3AH1PGhC1DZea
         q5TxMjccW+f34Qd6oMkmcq7q9a8XHiB9LFwN47s5LAsJFlgpjY4O5RIPYqFgUep41qgH
         qmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645328; x=1796250128;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C69/ffAPx0j1QcJUb+dT0EdjmFvbp1KocswjzV+VV1k=;
        b=bo62TjdhOVYahxjWmwl2Q83MyPxuZyMhu1EWoqTjEPMudxhRm3GTl5/aullVi5/f0V
         8F9UTXL9CEeoFQNJq9qGK/qKxmJP+XDNjqmX/3K5qTSUeHbQUVIXf/vPHpMy4duN30vL
         JnfyrehnkXqv83NZZ1XUQD42i9tTgZOx8z2APe4CmlnWpRolgrVgamgmpTL4+6pvIFiX
         ZlwMjbpyeqUd9lGtc8jJZr8/TylU81S6rQ21iuhxHhrjroEhcDcPBQVHvUfrLGc+Tgtp
         hv7lPpAKxpneSBDRmjmbMnxk3wIJE6oIvEBv3d+cflCcQoMLfJQjm7ypN94BKe60abUg
         w4MQ==
X-Forwarded-Encrypted: i=1; AL+hErErcsUXBvljFOnTFcJJYUuKyLkFaLvsC2wiIK1ECBgMnpPAjwfgt30Zp3U2HYABoNvV6K/A@lists.linux.dev
X-Gm-Message-State: APuU4Z8iixwsBDogmkY6gbIT28VCqhPy3oey8RtOS+BzbliYdMrc3E1N
	qNgMMwke+RXFl06gtYS24vMjamKNhy0/plBSDu1EO79E0nJDGbBNRBaSf+vggQHNlDBXnMHk1bG
	OIQ==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18950057eec.40.1795645328132; Wed, 25
 Nov 2026 14:22:08 -0800 (PST)
Date: Wed, 25 Nov 2026 22:21:00 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222102.1430675-1-elkin@google.com>
Subject: [PATCH 0/2] media: s2255: fix marker scan and bounds checks in save_frame
From: Elkin Cruz <elkin@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  media: s2255: validate transfer size, payload, and offset in
    save_frame
  media: s2255: advance marker pointer and use unaligned reads in
    save_frame

 drivers/media/usb/s2255/s2255drv.c | 79 +++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 29 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

