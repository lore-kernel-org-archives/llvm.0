Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1C31BBBF4
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731675227; cv=none; b=KUXh3VCTaZNf9hr6ilDAm4I+MXytQN31drUMI20s99aFVDqWirXqULfu1f7O0dHlT0majZXSebHuX2JwNxgQJP3sKgDi0PkRV3VnZCx81SFS8IuJnGgTOmGspVDRq9EPweV83jjCfmVurNZVz8iYM0VME3J4uGVJaUYyLgqAP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731675227; c=relaxed/simple;
	bh=kC5b4Nc50fbhWMMi5vOolJEMARSuns1Kxgz8mfrxf0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IHxavAAV/L0NzjVpCbqRm/v9vlNiRBDYy6CYLhfViQs/+jeW04Xnxl3mP/sGgIjk/TNCTa1k56JxaZK6SNoan/RZYFIgG5YM6lVyT2qUlqoxcDdSS4HlKDoMd+LmToyUtQUw0YWoXdb+I5CDPKtM1ATQgqPowsuyOh3evBeWMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hmgIjsSP; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hmgIjsSP"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-50d3998923dso851419e0c.2
        for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 04:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731675225; x=1732280025; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NEbeDGIYvAwvzpGJm9/Bl8sSZPwTY7aHupGksBQNqK0=;
        b=hmgIjsSPOTdUQLBVwihzecNUPbO0vpNM+iCpHkC9tlKWwcxsZCuc5JRBJ+AJ+gKrP1
         D/HouSVYup1l5nWOfOtK8LZgXMaOENlMNxW+E+MTTTJDLuewWawevntnG39UiCkeFCXr
         igc5Tb9iGBKpOy0x+cIvCV0IrvWvzuwQgGtsKwbqtjMyNnKDlg40xcDrlkFwaqJddL5L
         ILU4WDdP2p1j7gm+Iq8i35YkbG9OJjFwaGqA03hdS0Zcnv7PK3TME0O0u8RBxC/UmRfy
         10YA8TiJGrQ8/N7xH0fBf8bpW1ZtUL/71Gvo+mylg2Hjcj/FoXKJilSlm6JFnrYG/MsX
         kM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731675225; x=1732280025;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEbeDGIYvAwvzpGJm9/Bl8sSZPwTY7aHupGksBQNqK0=;
        b=AolrFidX/TxbsRMT+Zq4eZibDof0Hy9EUiApG5+yf/SDy/CBHZljkzwF0UsBh8bYTi
         xCpLAT17MXs9ulkcyKZ4bZuiZjw/OqEusPAq+iFKSj70Yaa4nmi1hf6ItGICsz+/y0kz
         knfnC88TstSFJtfZaRtDlq8sWYpLz0p8O6SqCs8KNMI90T0KYlWDkEPnOEyZdhM0J39+
         soLKZ9LkMv/dfo2p3JmF2KFNmm0t+nAl7efpoqdIRq7Q4ubct5wa8d2nLggcvBj13rt3
         6OiVLZWO8pUhZNuckJU8RzGCp2rZTeGYmWU0Yrz4y8sanVTkI6Hu+Q9Psjyq8c6XKqKi
         W7wA==
X-Forwarded-Encrypted: i=1; AJvYcCWs8XZ4kBBLBNCJFG2NViZhdwVpqeVbYKMkc7pa87dUXWSW1tYlK7PFs8rXZpstSngvc6Th@lists.linux.dev
X-Gm-Message-State: AOJu0YxxQuVPh8jJiXymFOG7SWWec+dOPLdH1TMNWng+1VLUXUu0YZIT
	eoex7fX6tv568zeq6gC4m1WaCDsQVBybkFrYegPuheg6FOMB3vS+THaAxnGtalFVyHkqiLceC6/
	c2Afwk8rZRl3KOIxKdhIyV+Nz/Spd9Ov1R1teYA==
X-Google-Smtp-Source: AGHT+IEtDEtXKpcCidRqx6bebqrisPTC0Px9Xm1sUVNWuLsQVQUre+hBcxnbLyeeXGplNKk47hIC4CRTO6saY/xxXGY=
X-Received: by 2002:a05:6122:8c22:b0:50c:79a4:c25 with SMTP id
 71dfb90a1353d-51477f7c9f3mr3308737e0c.8.1731675224854; Fri, 15 Nov 2024
 04:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 15 Nov 2024 18:23:33 +0530
Message-ID: <CA+G9fYtThFpgHJvVwmvp274QJ0QBbrsr+qnYi0b5fWJ5oJL2uw@mail.gmail.com>
Subject: next-20241114: clang: fs/netfs/read_retry.c:235:20: error: variable
 'subreq' is uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, clang-built-linux <llvm@lists.linux.dev>, linux-cachefs@redhat.com, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, David Howells <dhowells@redhat.com>, 
	Jeff Layton <jlayton@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The following builds failed with clang-19 and clang-nightly on the
Linux next-20241114 and next-20241115 tags on x86 architecture.
But the build passed with gcc-13.

First seen on Linux next-20241114 tag.
  Good: next-20241113
  Bad:  next-20241114

build:
  * clang-19-lkftconfig
  * clang-nightly-lkftconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
fs/netfs/read_retry.c:235:20: error: variable 'subreq' is
uninitialized when used here [-Werror,-Wuninitialized]
  235 |         if (list_is_last(&subreq->rreq_link, &stream->subrequests))
      |                           ^~~~~~
fs/netfs/read_retry.c:28:36: note: initialize the variable 'subreq' to
silence this warning
   28 |         struct netfs_io_subrequest *subreq;
      |                                           ^
      |                                            = NULL
1 error generated.
make[5]: *** [scripts/Makefile.build:229: fs/netfs/read_retry.o] Error 1

Build image:
-----------
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241114/testrun/25811023/suite/build/test/clang-19-lkftconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241114/testrun/25811023/suite/build/test/clang-19-lkftconfig/log
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2opUctayqtTsKWUeLDYKbGaUqa9/

Steps to reproduce:
------------
- tuxmake --runtime podman --target-arch x86_64 --toolchain clang-19
--kconfig https://storage.tuxsuite.com/public/linaro/lkft/builds/2opUctayqtTsKWUeLDYKbGaUqa9/config
LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241114
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: 37c5695cb37a20403947062be8cb7e00f6bed353
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2opUctayqtTsKWUeLDYKbGaUqa9/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2opUctayqtTsKWUeLDYKbGaUqa9/
  toolchain: clang-19
  config: lkftconfig
  arch: x86_64

--
Linaro LKFT
https://lkft.linaro.org
