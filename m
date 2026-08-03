Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F638AC7E
	for <llvm@lists.linux.dev>; Mon,  3 Aug 2026 17:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776926; cv=none; b=j8xaf5ye/gMQkx94iJxLSRGqMnRR0FKR1tcRM2urj9pRV1+WY8FnXtRhCC3lX6FsGmKo1YHsVltNyYpdRQFPolxy4ymC5xEksobVDGWy11ubeV+GGErzI4i/jBdi/M9gZZ/ti901TaucILzWaJGpQbRZlTDVYe77FUsof+UD7bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776926; c=relaxed/simple;
	bh=81MWPbgRttoR+0d8yfKjqdwgj8cHpLV4Tc5BStoCbiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eROES5F/qR4RUmnyvhI1q5CBvplDBjYKaP9la4gjK3TItu3oJxbqdQWxfvANMnE3vJTAWvx8bcS6JkRzYaHDj5Eh3TWxzUgcsN60nLpdfXrC4hAl66FQDVGh+PidVJ/+jyczU4zOPFC5xEZrK281QDptkdO50KGm4RuFVasP2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o28Rn1xB; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o28Rn1xB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ecf499af9so49307847b3.1
        for <llvm@lists.linux.dev>; Mon, 03 Aug 2026 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785776923; x=1786381723; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BQnuzNS1+o7a+6CuCUFIVOHjsICFrcaawp1nbYkmgiU=;
        b=o28Rn1xB3v71kLtVmNVvCT1ZnOGKpNryfLst46tFiZQBW7Tz9K6g1My1JnItCmaobR
         rxjylD0Tuuxep/FtkijH0pi/yNGIHYFXQcRe0penh3bKi76/thAM/laTa0Shd81zGAmC
         /E2AXdrX1g2Jnrb9a3pBPSZ4fN9KifIm0pa50z+1fYtuAe0us+3PQcRE+TATH0XfjafD
         Du26dhVNA9UwvGtkkhhN9P8hIucRwseV+DM3oOilh7i3Izo8mfkrSFhC9vftppfJFGLc
         /jcGgmjfVyW5EH7ED4IST/fbMFIzZmv9bQ9MgnfV4XwycehS2p16YI1s2Zu6W+/5OIbP
         i6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785776923; x=1786381723;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQnuzNS1+o7a+6CuCUFIVOHjsICFrcaawp1nbYkmgiU=;
        b=T6rs+QyBbHDkBbVmjQEEEwTbGwGtRWjyv8LUsP8XgU+NjtsB1OGYa437qR09AfEGKz
         cXQSZ5cBNdXGZUGsd6DgXEXtk23sbKHuDmcwX4pIfGZ6rdkSbTNd70Zt3I1B4qtlIr4a
         r1XbsCkQVIqcWHoI8VBXo2ju6TQ7bhfSU+ww96eXFpcAQAdEFhsnBL0P47MLnBySilOP
         ifX/ydeWMppNuOqiPBKBRn/OoSEHxnTsg0+tY4K3F/qlRlxRRKen+nwjTIqYUYRt7+J1
         wK/AnKqT54Dzk0FRgEHA8tjvwLHh4s+t2JGsOOnl/cEz+kJiyrgAX0He0m39+6SOA6sW
         p4gA==
X-Forwarded-Encrypted: i=1; AHgh+RoaIEwppAlpfES7slm0fXZt2iV/vfDsOHeZutaKHtf3XgO+T8R0XMd0yz8jGlPKw/yUF17i@lists.linux.dev
X-Gm-Message-State: AOJu0YwBnVJKJ0dHQ18Hu2+uOFAoPcYIE0t8o6ic71RktWnE5ZyFNC01
	QKsoaFqpCG82s4njy7f5i8F0jvnVDjABsXp7qh8nnNzOYYdFLTQ9VbyP
X-Gm-Gg: AR+sD13oHOFoQLaaRdrK7J7U9+QcZ8efRjN+SqJ5QJI65qxHfMEahTkoLtypPtASXRn
	6nwvwMe3UYI+Enpdz9C3wEtjddpK+rOpuzS5TVm05OvgbsocnogFfzP92otfTOcC12Z/GrJ8WD4
	wR7GEK9eBSSIavdgCdQnrSKQzrNqdnrTGxXazhuUzjgMxijAZJBO9LsjRWoX6aUX9wUJTYfsKyI
	GyfbDva0CKVKnMWPYcX8jCFWWk4MrGSzCNL6wtcBbopGMqClr530BCFRK2RbTu01ACWUFCqljMO
	GpXWt6+zSZrxDQ5gZvsL/WCP3zl8pmYAM3Te/RlQpDmmhvKfvKzJwPuylNlgcT1ck1Q5vuRjlIN
	wzy0S37N0eazY75ySnDguu9C84jSfup0chH7OpT+kXSwkZZr2Jzcfig38hktO6j+Llkve07TydK
	bRpdXBkRpF2SpT0XMa+M/GUXxImaoRRWWUqoQ7U4AML5Ralg+ez5a7v3FzJ7SD
X-Received: by 2002:a05:690c:6087:b0:81f:889c:2078 with SMTP id 00721157ae682-81fd49f2be7mr126767587b3.7.1785776923447;
        Mon, 03 Aug 2026 10:08:43 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd14658csm58796907b3.45.2026.08.03.10.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:08:42 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/2] alpha: enable building with clang
Date: Mon, 03 Aug 2026 13:08:40 -0400
Message-Id: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TlATkb4SHUy3XBAThQjEvycdh
 2GmQcVCWGGdGhR8qNKdBoh5AhdsupCRHwySS80NX5iNOVjm4nBMW+eFUngY7WAUueBJ73/b9t4
 /5aH0Ql0AAAA=
X-Change-ID: 20260803-alpha-clang-6acd144eb86c
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=81MWPbgRttoR+0d8yfKjqdwgj8cHpLV4Tc5BStoCbiU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIKTkv2xB08G3BGNvB3wKKIV5UPJmpLhfCV3otRE3QTO
 /pu7vZPHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHPNEQtGhtNqv7yftT
 8TMuCZfPHp2r5rauVq4f7za//zm+mnLs5QqmNk+MnzNqy4YuHGD85HvB8IBl1boij6tvr1C+7/C
 StebAwJ4wQA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Two small patches to let the alpha kernel build with clang.

The first registers the clang target triple and stops passing -Wa,-mev6
when the compiler is not gcc.  That flag exists to keep gas from emulating
instructions it believes the target lacks; it is a gas-only option and
clang's integrated assembler does not emulate instructions, so it is not
needed there.

The second fixes two uses of local register-asm variables that clang does
not honor.  clang treats `register unsigned long x __asm__("$N")` as the
named register only where the variable appears as an inline-asm operand,
so reading one to get the live $gp or $sp yields an undefined value.
trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
PCB for swpctx, either of which wedges an early boot.

Note that the alpha backend is not in upstream LLVM.  It lives in

  https://github.com/alphalinux-org/llvm-project

and is a work in progress, so the scripts/Makefile.clang entry has no
effect with an upstream clang today.  I am sending this now because the
second patch is a real bug in its own right -- the register-asm reads are
only guaranteed to work by gcc's implementation, not by anything either
compiler documents -- but I understand if the kbuild side would rather
wait for the backend to land upstream.

---
Matt Turner (2):
      alpha: enable building with clang
      alpha: read $gp and $sp explicitly for clang

 arch/alpha/Makefile       | 8 +++++++-
 arch/alpha/kernel/traps.c | 4 +++-
 arch/alpha/mm/init.c      | 3 +--
 scripts/Makefile.clang    | 1 +
 4 files changed, 12 insertions(+), 4 deletions(-)
---
base-commit: 0e6be1d34ae92e2b0dbc1b7410d422b22464389a
change-id: 20260803-alpha-clang-6acd144eb86c

Best regards,
-- 
Matt Turner <mattst88@gmail.com>

