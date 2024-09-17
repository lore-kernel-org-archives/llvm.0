Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F5380
	for <llvm@lists.linux.dev>; Tue, 17 Sep 2024 00:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726531866; cv=none; b=Z82qyUSNeOXyPzEDrnMGsWr/9q3ln6ZG7dnyXD/NuZPscci2SrTsD15ByjVYF2maFBRwGREeCjII3hzGPqkdT9rrWaxqbwehumz/70kG6vjMqXZWod+g1xjMIr01Ukcjwkv3nj/DQBo2bo0kPllMJoZlIyr2sMsLhIjA8/huydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726531866; c=relaxed/simple;
	bh=hU5iLxSH47Q+dO7j9wFD3aK57rS6msnzhfZQwB1PLck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=emxoz/0GfbO+Pz7QMh+Hk5oLHbNczU9B1DP0o9AWh031JZMBk5NElJ649hj00wdhrnVSfhFnQ+awQcpWkLnIwMaiVoFMaUwf3fmzArTh5s9PhHr0JT3f74GiIhPLvmsA/UCRPB6N2SSjRFqdihlUQQNcxOh/nZRzdimnWXIMSwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXLIsGlW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXLIsGlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726531863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
	b=RXLIsGlWCDYWG75S2f36Er9HdYrdUo/SlK6oBepvDrSyPvueeTKDSBl4Mj5qO//U1/b+NI
	azzHW+KC0B9hS5pUuoFxaFEbtOA4a8iB7v1PnCymyrBWZLDfgzvhxBDM27zZRRrA5ZC512
	0BKSYVPIITfQnpddgftViYmGInVuLUE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-yLX7tbbEOm2pEvmu31uODA-1; Mon, 16 Sep 2024 20:11:02 -0400
X-MC-Unique: yLX7tbbEOm2pEvmu31uODA-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4581efb73d3so98386711cf.1
        for <llvm@lists.linux.dev>; Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531862; x=1727136662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
        b=TTaCl3NjSLplCT3xD9IqLW0w4/l4Jgsm+eK2h13VTJHS6w1HP8XG8nMCW8CNut++KA
         yiaflweZDxb4Aj14n4yuAgrqAxqETBFCi0YQdHhGwORP7HyUdL4umrxdGYbnrbxYbzwj
         MlxtsRBQcs6xMaHu2FA2oQ6HVTS6qP99iyo+64Bya5XgH9ycEmQuW2sIp4/M3r9wTdEw
         LYWBWmqdxkD+XvSSnbQ0iALW8tY1VeJZ9wDDssvYrpicdSbpWM86UbRD7WWvRfN/HIqY
         zmxS8Sud2em7a99zD8an+3GxhfnRsshcjrvMteBKV4YWgDUCttW23mODAPokpQgHP90z
         uX5g==
X-Forwarded-Encrypted: i=1; AJvYcCUnQEOCSJZ0jiiVYr7PbtD7laDvStDnR2TIbfKdzkanBP8UZ8o48ARzIs8vsG8VHKgJuK2y@lists.linux.dev
X-Gm-Message-State: AOJu0YwtxL94sojowhFC+90pfjREk8dtkuXMbob3saAW4sKhfBenKZfD
	+5eH73TEgJ5lesYksYv7Rb5V6fXYfbxMsLAhF7NapBl1scBCbhYpnv2OqOMqh87WCaf0cAEua3j
	2SpVuNdHoBU+ZEBPwX6IyyhHll1PtfHYE+4XXHMRQCCyKjCn1zrA=
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205215021cf.23.1726531862047;
        Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPpDTLWSZw+zeRZnpq/bYJ/50ETGEyIM5xiGEn5/ULUALhOfBRgLa1LxUZ/Zwgxif9zNnwBA==
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205214611cf.23.1726531861627;
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
Received: from towerofpower.montleon.net (syn-066-026-073-226.res.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c62633bsm29221956d6.25.2024.09.16.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Jason Montleon <jmontleo@redhat.com>
Subject: [PATCH 0/1] RISC-V: Fix building rust when using GCC toolchain
Date: Mon, 16 Sep 2024 20:08:47 -0400
Message-ID: <20240917000848.720765-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.46.0
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

The following patch resolves errors encountered while building on RISC-V
using the gcc toolchain with RUST_CONFIG=y

Jason Montleon (1):
  RISC-V: Fix building rust when using GCC toolchain

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0

