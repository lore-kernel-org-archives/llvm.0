Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880836A02F;
	Wed, 18 Mar 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831023; cv=none; b=nsByKq1TYAS94APXd+/31IFa5R7PWBQ54NghvM6aG84cvcXnVo98xyxr9E2oa5njCmdO3fiTeyuBoWLAz1JofpKAJg/k72qIfqUJ7NOcJpmV06p4LPaV8UA0Bj/JmQrGf3tqoN/8MAlSQXtVSKKTsIi0P8qnK0uAJu4dzPDuncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831023; c=relaxed/simple;
	bh=R3RQWmpJ9Ts8d1/ewmXBwW/9WUiOtoneWY0/2ZA6W/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U4YYR3Xkklvtkl0i87KetrcLSMQ5cEFq+JnaVly84DFF6KR7yJ1ctU5CSG+lGmKaegLOpgp1tnz8icPAmvFkznt98LbtJjFUBXpyny9M5oAIuLKiw+KRJQinO1lTRC6CwdBilpE4htnZ7AuQJyHBrzUvMsMducKSp/nU2V4FJPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taYe4bPp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taYe4bPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C3CC19421;
	Wed, 18 Mar 2026 10:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831023;
	bh=R3RQWmpJ9Ts8d1/ewmXBwW/9WUiOtoneWY0/2ZA6W/o=;
	h=From:To:Cc:Subject:Date:From;
	b=taYe4bPpMqc8j+7xaU2yUz/ERh8dnQOnYIomLv7Alll6PKfhvQShu5Ui3cVzKX0/g
	 S44MggbbtMuxwJ2vYjJSBkGrTCYwrgF0gcmjG/080koy05yN1rLliEDuK0sZg16euu
	 kfrTNb9THytLZvyGPSdVXUqovgUSH6DFir57gKz4sjGWErpT80PYg89+xu/5+KqjRT
	 EkIgJ+1DPexpDPFYxnle+1KmztoaQc62zHbX2jeROrZU+V5oCIiVuMJiVatuSZ1x/r
	 Z2nBV27QLLaqCR2L4cvXvBjl/9imDrIeJcjFTIh5AU8c6YHjLV8qUumpOz07fvYxVJ
	 5TkhS91PIOiaA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ALSA: asihpi: avoid write overflow check warning
Date: Wed, 18 Mar 2026 11:50:08 +0100
Message-Id: <20260318105017.1934798-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-22 rightfully warns that the memcpy() in adapter_prepare() copies
between different structures, crossing the boundary of nested
structures inside it:

In file included from sound/pci/asihpi/hpimsgx.c:13:
In file included from include/linux/string.h:386:
include/linux/fortify-string.h:569:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
  569 |                         __write_overflow_field(p_size_field, size);

The two structures seem to refer to the same layout, despite the
separate definitions, so the code is in fact correct.

Avoid the warning by copying the two inner structures separately.
I see the same pattern happens in other functions in the same file,
so there is a chance that this may come back in the future, but
this instance is the only one that I saw in practice, hitting it
multiple times per day in randconfig build.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/asihpi/hpimsgx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
index b68e6bfbbfba..432a5b787a2a 100644
--- a/sound/pci/asihpi/hpimsgx.c
+++ b/sound/pci/asihpi/hpimsgx.c
@@ -581,8 +581,10 @@ static u16 adapter_prepare(u16 adapter)
 		HPI_ADAPTER_OPEN);
 	hm.adapter_index = adapter;
 	hw_entry_point(&hm, &hr);
-	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter], &hr,
-		sizeof(rESP_HPI_ADAPTER_OPEN[0]));
+	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].h, &hr,
+		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].h));
+	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.s,
+		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));
 	if (hr.error)
 		return hr.error;
 
-- 
2.39.5

