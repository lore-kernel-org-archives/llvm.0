Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E14C25D535
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052563; cv=none; b=aW5mfdmpp/frp3+kn9HwptO/oe5yAhEpwazeYvRpUgdlxL2TcV7y9nBGc6oqxQJ6hGRjp963dqdN70GZTs/cCtQY/E0ACR9yAMEC2eeOBSjJVpIWzZQet1ol0Sx0HGXu/zmMmlEOM9gblBaQES03HIImPwetrD4lGsOTQFL6YMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052563; c=relaxed/simple;
	bh=3w3CD5q6GRJnXHz6VCgaFnqsMOkdzmCYyco+Rqyxsb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVumXChBH3Q9/xlW+U9IQTLA0iBzoNFMwomN+mYleRPrtS/RXtZwfAOuFnK4j2eGzCJOSnGQ6zcoR6STDvTNY/Lzor2YbmKkqdtxrJD1WzAN7UP8/qFb+7CN1MsAQ78yZDHwI7JY3EstGdB2P0jPwBpwmpoRL06Y/WOPGaGoPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UPP7RpKW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UPP7RpKW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af54a4d9e9eso541023a12.0
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 12:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744052560; x=1744657360; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dffV1L61lSKvHP+naQW229RneaojE7BGB9VPXZP7TKc=;
        b=UPP7RpKWc9UxftllU/4JysZ6P0cUc6LDYlff4t/hercnxe8CpQ0ucz0BzkeWUlgjaZ
         VRWa6LDUJisFxVlKNRqDddTN0ODdcNxqkz9On9unv5j8vXlXmribZ5YuumMdpBab2ofU
         TH0oElFw41yHmLGm2akLIC6HXxmV2wscpS6sDVRPctV6hamHHv4R+jt+oRVVMH25z5pk
         pHLtUwl6aIqSaegVAe2+jtzmRhHMwj8wLcEe/dw0uHp33yKXvBX4wJ+PVQjPoI4GxLcT
         EjkavWAfAZvvBAJc+r4Bg7ANIwiW794zcL6gRD/Zc3PhkI1e3rctD6svkf4zFl8KQbvR
         3/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744052560; x=1744657360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dffV1L61lSKvHP+naQW229RneaojE7BGB9VPXZP7TKc=;
        b=XDjM8Pvxj8aKPrnfLizKDXhPXHyFepd9D12NwEv+Dy40vpxet7R+GBgUTMLKu83Pgf
         QLrwGIc/7iTFusLkMHsjo6cBhcyEWGY83w35o+X6eH0ukensl8kLhSJXUCx7VV31i2t1
         +smp+WoUwBsTT6WaD9r5xE8HulW/p1i0SBVAznywJa95nFIkfW28VijMj6qpkE1Dq6Wl
         4kWpFelODlVvpbOzdQPwS0+XntJvoxmmi4dqrpQ7iFr8UdFERFdhvmKUgA9+eXdEjJTr
         36omWmZGuc8/coLRnZWn8RGCzp+3YZXE0A7FfqlV/BDrdjr5azx4Qg5xFUUf4472CinU
         Elpg==
X-Forwarded-Encrypted: i=1; AJvYcCUNdrkJ8nzMXyKS9RhAdzMLrQMvmLYRS3JsRpcnstQVY1HDsi2UVBkawPaEYYLUtMSrCJMN@lists.linux.dev
X-Gm-Message-State: AOJu0YxKg8hGcyuQLHF/gHCjYyPwxQRblEIUIul1i5TCkV37BKoIffvP
	6zCjh36bYcJEBtMkqEUk0wAirUA47H1S7q9RxObCGoCkmOHEZNnTzI8Jnv0MGLTmWwMIEyGA1oI
	CKQj9lZJq88YAebX+OPFNGlUvxbv/BKRTYCiG1w==
X-Gm-Gg: ASbGnctvGDUGWSjoutKBbQ4qYptG5UYpABFtmheqMpjYP4WqovoIE5NB8xFqniail5v
	uLr7A7nVVkmAiNIg63kReopNShryHIbkJDqE0orTYI/cLSNnU3Jwn5ZadncJj28vSb5PQeuZ4ob
	ImS1BrKO9D8EF+3WspoX1Tfk3zHydL1biomXSB
X-Google-Smtp-Source: AGHT+IHxiMtBLuE7HFtmvkPpSsjkuRidn3zZS30dHJvwFFeUSCiUjfZOrL88kgkuADRqoBm6z6E9g2rmSll++4dbQAI=
X-Received: by 2002:a17:90b:4f89:b0:2ff:4b7a:f0a4 with SMTP id
 98e67ed59e1d1-306a4865251mr6629267a91.3.1744052560223; Mon, 07 Apr 2025
 12:02:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504080139.KuphZ8ZZ-lkp@intel.com>
In-Reply-To: <202504080139.KuphZ8ZZ-lkp@intel.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Mon, 7 Apr 2025 12:02:27 -0700
X-Gm-Features: ATxdqUH-84qMH5h1xUTAKjO-bNIGNmH02qZY_0CIgwd8upVXFURnSidMpvgLrhU
Message-ID: <CADUfDZpvMAGheJ-k7jTa3pfjuTXCCZPt-iprnfd_HHAfS5+ghA@mail.gmail.com>
Subject: Re: [linux-nvme:nvme-6.15 3/4] drivers/nvme/host/core.c:4302:5:
 warning: 'CONFIG_NVME_MULTIPATH' is not defined, evaluates to 0
To: kernel test robot <lkp@intel.com>
Cc: Hannes Reinecke <hare@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>, 
	Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   git://git.infradead.org/nvme.git nvme-6.15
> head:   9e270930d683ff0207fed7f303988a7ad63ddfcb
> commit: a98aa32696a1a19814a2f97853400b28622c6a8f [3/4] nvme: re-read ANA =
log page after ns scan completes
> config: riscv-randconfig-002-20250408 (https://download.01.org/0day-ci/ar=
chive/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 9=
2c93f5286b9ff33f27ff694d2dc33da1c07afdd)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250408/202504080139.KuphZ8ZZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504080139.KuphZ8ZZ-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/nvme/host/core.c:4302:5: warning: 'CONFIG_NVME_MULTIPATH' is n=
ot defined, evaluates to 0 [-Wundef]
>     4302 | #if CONFIG_NVME_MULTIPATH
>          |     ^
>    1 warning generated.

Looks like it should be #ifdef instead?

Best,
Caleb
