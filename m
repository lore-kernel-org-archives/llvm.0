Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645425;
	b=zS4dKWhUhU2ILjo6C7r7g2MFXznxCn5f2pHXyH1GL4JpEIJSKGDdfKQkBPmAyeBbGNg/
	 CGNZJLH/e86+6FgYL84lWZ4wS2GMCc53/ck1Ah1xHwgsQFudAXzG4vUGR/ibfNjeJKKBO
	 2H0Uhm+qrTdpodomFy/l5WwlBKO5F+PSkf7dKZ8V75fVzKZR6D0WC0B3oURqp35Eziedm
	 Kij0kHMwxC3RTVr7/IDbB4oKbRjPLqQ78vBvoMnDXa+1hknrYXocJ6ZRMSliBl7/kSeC4
	 8Dyi/UFISytEega/R4HabG3Dv4DhS7ONhYr9aYKzHsslS5RdtI+gkI1+6NOkxBfcNpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
	b=KEN2ssMH8bgqWCZOd9z+tM54Je+NpYN1lZw1Vgp2PHlXraDXjIqs87DwPw7RIZZvUB7X
	 0an3T7ZWW9DEyY5FtrhXzEjIdwZg0Y881JB6Ob+J5RtRYcGfFRwiH/9ksX7WKzv4cAXwF
	 BrEGHbketJJgI/YCjshEdtZJ7AwVhoWnqrfAIfbWDYNMh0omgTZnmUuIlqTg9ZqwzUaLT
	 wUAgj1E0DLOXPjmZVH7NqBtSQ0GX6ssc1e0segrGNlPTyD9zJTtWedeTxctQIWm4KwCgs
	 J7ca1xsywuqXYI+M/ChFN7B1l/wgDO6Kyte9k7knXERjEWmybvM272djr5wxYqbLKDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3DtiZSf;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48B606A32A
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E48B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3DtiZSf
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so5976089eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645424; x=1796250224; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=o3DtiZSf+eDYNix1Ztij2OJVDQQ/grr2tqxTxhP7KMe2nFiuHF7MhrUQBVxUcaQK+C
         3W2Ri6lwlSfHMCwQLzUYWnpkRKM+tLYnnNGB7nobDMKI/9dk/dtDKMNu/PhZbgIcOnTW
         Uflk8HaYa0yOSpDX7TRabeymUxLkn1jqfUWMXaJVksrFacf0IHY06Z3sBlqRLKduHxvX
         Ltzr4bZQgZ3XAeyly6v5iHF872qN0wP8w7A7iScPDAOC3kyDDw7tXyw4yehYD3bip//D
         9xQZnI4DOL7cTCEL90w5UGQLwxPlm9Szqt9Oc8+nNm7nNjBjw9gkqc/Kbfl0ZhROjCI7
         LYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645424; x=1796250224;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3b33X25rJkg/st5uBmBh5JOgmQ+U8JpPJF9za8o/02E=;
        b=yl/3CpoQWvP9ROJqtGEFhdx/nAlalXD0ueWZ8rc+jh8fTgPDKloLTBvEhAnLd6R7kz
         d6ndSkDJ/6QBskuufGP8u6lUqmvibCiByWayR34s/5zkXqXnYTRrIaoGww4jNdTCS8zi
         7UhUoiirCwWZJ/JjW/uIOpkKhOdCnwGrp7jpKi4VpUFlFqgErcQvKp5aDNWlLNozR7jN
         rhIm1l6Ti2DhWTxO2LO5NpogdxU+sUzYNqs9sHwU90/F+d9DtbL0qxKsrbcS61gar4aH
         dvGHhxCvnWCQ8MaZG4P7I99awdtPwoLReuyEVwcA+EnofGiyEZBzVNR9Aw+5zQ+ay+rR
         3OLQ==
X-Forwarded-Encrypted: i=1; AL+hErHXO9bzl/uchuHPdgzoC2eCid7SriE3TSqWdFV0EW+A4wm0KALOF1JthdrdjFoKRPwVEFZe@lists.linux.dev
X-Gm-Message-State: APuU4Z8U2deVAEe+vQHaZgV7gEW/wKi8pgHPOQwOeE0NJP/KhlqwCE47
	+4K1j87kAKWIbEHnsr9W8P0NeovHP5CCH3hA9fSpWb1yvWFOZw3YxCZCDI80eph9cBPrY5d8nm9
	xlQ==
X-Received: from dyx17.prod.google.com ([2002:a05:693c:8211:b0:378:1191:3e95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d587:b0:381:d92e:ecab
 with SMTP id 5a478bee46e88-3856f25884emr17872862eec.11.1795645423958; Wed, 25
 Nov 2026 14:23:43 -0800 (PST)
Date: Wed, 25 Nov 2026 22:22:55 +0000
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
Message-ID: <20261125222300.1438398-1-elkin@google.com>
Subject: [PATCH net 0/4] nfc: st95hf: fix SPI receive bounds, DMA safety, and
 teardown UAF
From: Elkin Cruz <elkin@google.com>
To: David Heidelberg <david@ixit.cz>, Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, oe-linux-nfc@lists.linux.dev, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

Elkin Cruz (4):
  nfc: st95hf: bound SPI receive length in st95hf_spi_recv_response()
  nfc: st95hf: use DMA-safe buffers for SPI transfers
  nfc: st95hf: validate async tag response frame lengths
  nfc: st95hf: fix probe init order and remove teardown UAF

 drivers/nfc/st95hf/core.c | 151 +++++++++++++++++++++-----------------
 drivers/nfc/st95hf/spi.c  |  75 +++++++++++--------
 drivers/nfc/st95hf/spi.h  |  13 +++-
 3 files changed, 140 insertions(+), 99 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

