Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645532;
	b=yzaKwB6C2js8/8ZMQlyZRpxd2JZl8k3j+t8IcwguniRawcaIwDxkC8rGKAi7EvBpKLUG
	 2qUcuKKwuGnIhVsK3WV8X4C8EGP1+Mk5kYmgehRL+NGjRYTCDKk0usXnwft0xVTGxcCXK
	 UmYy0m4UgEsutYOeYxUIKpG9a/4w5snoFh/sek/arTx/m0d+P2WzeVFLqVgholg8M3YrA
	 uajrPB6dCWt8CNDhWWwum96J5MiZbXlHVF5uIkKE6tmyuIhsJGIeFR1fOeKytViz/bTe0
	 giBJu2aCW8DTNWr6BOHzyHkW6a/UxMAvG3QC1pXH0wwEXB18g9PVtcDD4Y7lAM7gQaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
	b=AM+4w3yEDl+FTfrEkCpogDRnp/qv2gcLYrh2kVSLAoaK2mxw0UT9epnUECKDGlH5Movw
	 WBkVacdITUTan+tGbArQ7Mi6O0GIMm2/oazU+wceagw8X8j6AQjlgsomdQDn7yjQ0Hx6C
	 iqpxOAp9IwiBjggGN6ObaVB90mzhedan8OzjJYxntDplJHBCm2za5cB0bEfiSzMoDGWUQ
	 u8Ckjuf4yfHAuoKAkPzsK7MlQ/2fTevT8her2YFiQv4Bex9U4cQm35DQgHN+Ebm1o0KFL
	 i9FOnl/DHl/vZGLMdzUFk9pX099iB1qixH/uj0HRox3K/jH7isvriDrFl0ndhhnN+8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AEEkV7ri;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC00160A262A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC00160A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AEEkV7ri
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso6416104c88.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645531; x=1796250331; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
        b=AEEkV7rijsxf2sgRy9KARLoX5ZQTTnG5Fx6rtRu7NCu3RwPHnxC/ODZbrs5gz7CcEP
         iX/LAxQnIo5OBt9X1yAfewnFuW3YkSjjJBIw89RI5uhYk9U9Dq1BKV+Y9DHnFhTIY4a/
         RcmXok+ULrMyDjuXL4hcDaNoxqtxVM0p1kHEpzoSg6Hph6Wh2ZfD5ddtn7xNlypECnYw
         pEof28r5fbjFfWe9eWoMlUa4n1FfpEDLL5jXJzZ+7QFRaX76FjkLjnP6O/wSG8xbbYaN
         WcM8XKrfDvwbU4qYkKd5WCdE3DUiJUPhAgCK3L2s6BBKiNx1ndkI7xkJU023x22FWH6L
         gL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645531; x=1796250331;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2kzPKo/9bX3t4mDGI1xxNnDKhyKkNyEfJrqaFNBk7E8=;
        b=XMSQTobSQGd3siVs1Z6EVH3Lms+Ym/wqWh0wv7h3QPkmfIlTI357/XrEc65JZhG1Rt
         FGiS5HYteKOR98x6EX/QSt8CU78daRJnG2f2eUNKQjPavsXX3XVMRKk3IZ5VRLvXxVPp
         NRwYgnhBgxGvZrau3Wif/UR0EkaKvw7LfvJzroPl0VKXoDXHF9N748wzECb/f6FFgbnc
         DYf6fkB/Qm7PEZX9gYxBESsC8atUxrCR7zgGoZ82C+nCusR8Z/KGPCkYZ5Wei+cpAO3n
         aH67YpQj5C90wxlpTIykPrii1ABdkOqYQRwVkC0JQwsV4/Ua5GAfFohWWNehc/qtgMXq
         7eXw==
X-Forwarded-Encrypted: i=1; AL+hErH69rU0SjXCPSCOjAb+7aGvL2/BC4SWjCfmFk2APYvDN2wMIBsjRaQCk+esTKw/Nd/OdDb4@lists.linux.dev
X-Gm-Message-State: APuU4Z9e4kZtADeJsnJCqvxRf7rLLbUe1srpbhz2pUewvFCjBiba7Pz9
	8fK/r927Gvaz2HMhX2eiZ0g5IF7NYbBlFVm034/fmPBR4ZsOe3ry0xF39cUqwv/IRMcDp0duZ5e
	G6g==
X-Received: from dlfz25-n2.prod.google.com ([2002:a05:701a:8459:20b0:1b5:897d:6e5a])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1585:b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-1b5568f00a6mr18732225c88.24.1795645530462; Wed, 25
 Nov 2026 14:25:30 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:10 +0000
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
Message-ID: <20261125222513.1446099-1-elkin@google.com>
Subject: [PATCH 0/3] drm/sitronix: st7920: fix SPI DMA buffer, unplug guard,
 and row address
From: Elkin Cruz <elkin@google.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (3):
  drm/sitronix: st7920: Use DMA-safe serialized TX buffer for SPI writes
  drm/sitronix: st7920: Check drm_dev_enter() in crtc atomic disable
  drm/sitronix: st7920: Pass u8 row address when setting GDRAM address

 drivers/gpu/drm/sitronix/st7920.c | 48 ++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 14 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

