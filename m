Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B602B1C9B9B
	for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366860; cv=none; b=kXN5JXyfsf6QQyc4Md2B/GxQB8NUaHGwQaD61IOv/7ovMc1HsZUcGGo9L5if0uJfhjPEOUfQb3i0PLgcsox4hfv6e9tK9vmXT4lHoWHJWJKo090VlxD8f2aqwLYRbNLzezQeeN83BcVXFRHrBMDDuqXd2TOmbwqDV/p+HRHNOvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366860; c=relaxed/simple;
	bh=J4P8Yn+HmBStOiyf7871d8RgqIDPsmAX5U/1I64nh6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n4CBQ/+8mUPc5CsIKFzRf8Uqe3GRAjXobJ1+xf7TFrZmpwR7j6M68BbI4F0hIvIOFzemT/8NBKdV4FcmTN5MZtkjGGM5r0J9ooe+HNlx45vnpCagG4+1dxxdpA4Zkj09my2JGuUvnEbgvA1FeVm9WWrg95Q2bVOinA3QgZEItzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZcNpFABj; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZcNpFABj"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so1085728e0c.2
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734366856; x=1734971656; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=voYB97BSoIttk6TNFpCBTpCkCub3HvTPki1P0fPd0XM=;
        b=ZcNpFABj6LnPIUSUI27fEhdMmoRTlvg7wO5pcH8kSvUhR6RV+/Bf+KPxoZOpKOIm9i
         Zox2nw5gtsDEPzPNQUAI1fwBj9AEEdRqbZxbGrsNaFWYWkM+3sheqcHyUuexLFyUDdiC
         /SRZTRk7qDnnBzn+0JgHnxA9LbmemPqUIkX2/xZRSyr9kzaaZBXVK5vXkDWc9TUro2wX
         dgNr5HVFHLC64POW5HCYs703QeHz7qAPOHe4uRUvxb3ATmI7sCP0UT+6ZOWPCG3ZqUOM
         S/Z1hOrhaC02Ql5RTgmz8pmznQxcWX7CdjxHmKhLLkqZ5jF6HThbUALejVHu0elJG8Qa
         1Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366856; x=1734971656;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voYB97BSoIttk6TNFpCBTpCkCub3HvTPki1P0fPd0XM=;
        b=scTdaxeT0mNKDknj57YZXMqwJO96NhQO+KMkwbDKsta0kKZiUlYrCeybSlLekagL7y
         6y4qmYjnfwmRxL0n0vGA/82TaPLygdvCSk6hfaMdXHlvRAWJlp7TLYEvoQ+TOV6QMiyh
         fbYxzBRAvourCQ7KH/fBk8SigsVvPM8dbq4a4DCrK/w+8AqReISp2DHFrf4dxuK1FGRp
         E/9r9GnLMHk/qDc91P13t+NTEPcHcGQ7NBuf7K32VfM55V+oUsluVEwGCGGSBA6N8vxS
         cGZdfJTSdnRu+eRcZPt8vdhnm0UyZmTEdf1+4NPNNAYI9119iOJe2au7U4TKsctcXS9k
         Im/g==
X-Forwarded-Encrypted: i=1; AJvYcCUV0aIjBGkggNG3r+8FKcWWETV4jUr/nLY9XZ9XoJzWdaZdV6emQ1i7AW7oVEyC5P7njXZX@lists.linux.dev
X-Gm-Message-State: AOJu0YxntgymgAUtBpit0VssAiqmRGD3LZwBkoYRpyK/3Zyr2hI9jWdH
	gYw1FaMQHCdSwDj2nFgdNZhwrsV0xnx3Se1iu6cnBtKNRXHo+Iyhd0TdoXDKPDl4dmyZkybUtdU
	TwhvcvGU0oSdwhSbydYkK/qrgYoAR8iny3c8+WA==
X-Gm-Gg: ASbGncvN9xNic6pKzKkyIJhn//UEtQBsz4DnFNktFoaeaEMTSDnyAJ3ercMUpbKKpcC
	4ye/RAArT3Tb2JGCazszEPIw0/rLx2SoArc7JA6hSV+TBUaJUMjHu6Yd59Q5t1iGCd+sg85Q=
X-Google-Smtp-Source: AGHT+IHwcIqoyILkP+1sx25KZjFSaAGwKZBXcw1KXTOsA6DOwlBCczCOTJUK1dfVqLl4hiOpY/+Ngz4hZael7fpPyHY=
X-Received: by 2002:a05:6122:1e01:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-518ca30617amr12733009e0c.8.1734366856629; Mon, 16 Dec 2024
 08:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Dec 2024 22:04:05 +0530
Message-ID: <CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com>
Subject: next-20241216: drivers/crypto/qce/sha.c:365:3: error: cannot jump
 from this goto statement to its label
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: thara gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The arm and arm64 builds failed on Linux next-20241216 due to following
build warnings / errors with clang-19 and clang-nightly toolchain.
Whereas the gcc-13 builds pass.

arm, arm64:
  * build/clang-19-defconfig
  * build/clang-nightly-defconfig

First seen on Linux next-20241216.
  Good: next-20241216
  Bad:  next-20241213

Build log:
-----------
fs/netfs/read_retry.c:235:20: warning: variable 'subreq' is
uninitialized when used here [-Wuninitialized]
  235 |         if (list_is_last(&subreq->rreq_link, &stream->subrequests))
      |                           ^~~~~~
fs/netfs/read_retry.c:28:36: note: initialize the variable 'subreq' to
silence this warning
   28 |         struct netfs_io_subrequest *subreq;
      |                                           ^
      |                                            = NULL
1 warning generated.
drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto
statement to its label
  365 |                 goto err_free_ahash;
      |                 ^
drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of
variable with __attribute__((cleanup))
  373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
      |             ^
1 error generated.

Links:
-------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26350650/suite/build/test/clang-19-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26350650/suite/build/test/clang-19-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26351207/suite/build/test/clang-19-defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa6j5c1HY3GRZFGrxu2ELo3f/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch arm64 --toolchain clang-19
--kconfig defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241216
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: e25c8d66f6786300b680866c0e0139981273feba
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa8wFmfrlj0VdDqAG408o3l2/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa8wFmfrlj0VdDqAG408o3l2/
  toolchain: clang-19
  config: clang-19-defconfig
  arch: arm64, arm

 --
Linaro LKFT
https://lkft.linaro.org
