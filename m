Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF330F52B
	for <llvm@lists.linux.dev>; Sun, 11 Oct 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735320; cv=none; b=POb9kV0HELpHW64aSuJp8LUYN6KXjWfRaeQ0uWLaP6mW0+/3doUc1TAU9H06/uQienb+cVUa5DjfXS3VW6rn78iQ4F0YFFRcZv52q4K+0thy/BQ3wjL84JTY+UB4GDKSg8Tze8YXLKJSYD9s4CrJePHqxlAT4VyQThwUlB5+c6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735320; c=relaxed/simple;
	bh=xGkv+QyRtzfFa8DOkQXBFjFB4C9QaDE5uM6fgtyToPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gc7TL18Pd4fz0KyQXNrLqMJsem4rqhC5NSRNP/dAUJtCiRlqzrsmT2jiaKTzDy+guuHAUUWwFKDmyXm9bMgToRYNxuACndYpYaf1uCz9XQ1PSxZzb5q2EME6zqUPMV7EijOUzF1EipXo7gli5n7lyjmEKbb14fXaq+aoZRt6UN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=nb1kM73q; arc=none smtp.client-ip=45.157.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="nb1kM73q"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j2lrd44RBzHP;
	Sun, 11 Oct 2026 18:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1791734913;
	bh=Aj9Wy4UKfp9ppxpb4/jueoPyJ0lzJkxrA4oPAEY9ADA=;
	h=From:To:Cc:Subject:Date:From;
	b=nb1kM73q48ZKU5oLMD08CuGF4XqQhjsnQW2LZKel9qqrbpuVwS/wgyE+Zkv1rHuR1
	 9oZiOtYq83DOyo3YbCrQQy8StEiD61rOxXUNDvHUEd3heFvOPyNQx4BmlRPmBbVGOQ
	 nxaqbsadAd8Hq7+L+pC8a4XTiLQlBhvqePuRSkJo=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j2lrc0LrTzpdc;
	Sun, 11 Oct 2026 18:08:31 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Mike Bommarito <michael.bommarito@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tingmao Wang <m@maowtm.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [GIT PULL] Landlock fix for v7.3-rc7
Date: Sun, 11 Oct 2026 18:08:19 +0200
Message-ID: <20261011160819.1376118-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

This fixes a Clang bug by removing an annotation, which was introduced
mostly for documentation.

Because this is a trivial patch, feel free to merge it with v7.3-rc7 if
it's ok with you, otherwise with the v7.3 release.

Regards,
 Mickaël

--
The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git tags/landlock-7.3-rc7

for you to fetch changes up to 3d8cc52db2f86b624308321c58513019f6b21eec:

  landlock: Drop __counted_by from landlock_domain.handled_masks (2026-10-11 17:54:21 +0200)

----------------------------------------------------------------
Landlock fix for v7.3-rc7

----------------------------------------------------------------
Nguyen Ngoc Thang (1):
      landlock: Drop __counted_by from landlock_domain.handled_masks

 security/landlock/domain.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
