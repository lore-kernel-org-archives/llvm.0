Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645565;
	b=ZZEGwWTFPNtULe8Lf1dbiWJitwSwGyxT5XjdR+sQSKXQ0LwpMKnMKk7jcjsqdrXINN0G
	 n3XfDPvbSlylrN0PlfRtWJdbZ6ccmIk8i7WpiIf6SfUVmgfonIMzrRdKsP18OT/0jvRk4
	 CkQk8Nj3sZZ1efdCw2L1s9IOXGWI4QoUgVBHD9NVntAlhBrQ1kqKgqTo1E3etSb9e/rXF
	 GRV8EawLVad6IQqRplsXjPPNgyflhvicIt6ycMrlUYWNInH31xBgI91uQVT+T15N7p3YW
	 51EN7xSNSC8c/ylWmqFjJkXQru5X401zd0pKpJf7DYMhX6kdsmadbzaVDulIaZAqhIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
	b=KMIj7uZ476GIcQm7kBZFCNCHCkGBIIC8Qc4OECIR5qAZQ+LgrW6g2HzgyW2LYUCNMqho
	 OrBcpqlF6TMhjG77ARH/jDzzSaZ/LgRRxvi5oKWKlgufb+yGwko8FVeYpeXwMOykHXEBF
	 x9v+T9ptCQj7plm+pbgERiCqs50FDe+WvErXT/2OTDTwxaHASQeKgTGuQCodQYTukDB2d
	 CQUoD/wK+sr+SO1UTdSoHe1nvICNvIKWM5UAN2c2wJX+GNwlk8zuEu7W0WQzXSZdill+Q
	 0zipU4jbhzqB1zBwlbuuY1yOvL7A/mg4SvnXss8jbTjy8vGZDW0odSmT30Qurzz9mvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SQjxm9+y;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E99E606A332
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E99E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SQjxm9+y
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8025667eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645563; x=1796250363; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=SQjxm9+y+6q1WVnpy9pxyhSD7f/ri2T83C591c1KvjKj9pr1+PXYmjLel+JYm4ZQfD
         QqFjdWNWBNjsVEJASGyyvOKCEocPVF8umutsZsBJXROWucgqYFkm8521YJ1/sGEvPU8T
         b7uqMGctGzHPFGdRzGZOM/vx8ShC9H5GWaTR9g5ckpefCjI4ZaMSNV55zfMHCJ84CKh0
         8bkINWs+EOAs7TC1uZ0xeu+KQLAZvSG7rVHHBpVQmJQGscZn6G1i223FopTOhD/UnWao
         fUS6s2LbVIOk1/HmzLkVllM5FeSDQLNlMA1DU6EJbUTIkl3xDFcRkjazGRSP4UPJ6ucs
         Bdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645563; x=1796250363;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgtJXU8YQHzy+kU/OTfUuCnnBinrSODUP5wPqMLOjgs=;
        b=lyR3FoBMQnySVScnj7efTdrNj4zYxlWbR6r4E+u2sK6ySpJXv0YYXwzOKrIiroNAto
         mnco1qVeOPciBJBu9MSjmEmvG6iMMSpz5enMGeI7GZm+Z+nfwEO0vhL5ambXdaZphiE5
         W04nJELS4Vez8G7qJvRfRPk1tVfiNGS3uCUcMehrJQWzDi+6eF4Pi9RM1AAIDP0665c3
         F+fI1hn68+0/+iU09I2MDQaIR98XK3OXIqLlscZqdcnO+NtYHz/o3fE8yvBztFaZZBkV
         XvNT6E3mvHsu2fXbDoh+FNX+mmywvJhDEagI4DNNvsMyu46ffsmaeGatKFUSqN6g70sa
         xmxA==
X-Forwarded-Encrypted: i=1; AL+hErGJwCIBvVBIMruSEgi/YmOfynjHEXdBCR68NuJ6wBNwoi+w50c79m40+BU/0rRNwoMZmQxq@lists.linux.dev
X-Gm-Message-State: APuU4Z+YRxlneDypoBfzakK773xic2uGSZPb9CvLR11QGYK+0Eaf0XoH
	9P0rZk/DWsfjaZbTxs3KmJk5qTnxJRR2OxZ2n4kd0/D/2zZBCwgxUWxxUMH3WJ8mCXitgApzgVZ
	mXg==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:1b5:58b9:e078])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3a83:b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b55693aaabmr25999920c88.38.1795645563065; Wed, 25
 Nov 2026 14:26:03 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:47 +0000
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
Message-ID: <20261125222549.1447825-1-elkin@google.com>
Subject: [PATCH 0/2] pinctrl: tegra: fix Tegra186 AON bank index and add bank
 bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (2):
  pinctrl: tegra186: Fix register bank for AON drive pin groups
  pinctrl: tegra: Add register bank bounds checks

 drivers/pinctrl/tegra/pinctrl-tegra.c    |   8 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c | 102 +++++++++++------------
 2 files changed, 58 insertions(+), 52 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

