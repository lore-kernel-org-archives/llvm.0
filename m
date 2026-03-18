Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826753D523B;
	Wed, 18 Mar 2026 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837621; cv=none; b=CUPG4DPsJ3cJY2KVOFqfZhn4s/djL7mrI0XKx4kUOXxblojgKdsLJzEkBcCR59kkQfV8O1wFi4za6zt7sRxlYX6VDd5T2lvhD2YUBCyEsSVUWa1uDyGrJf6jbY8/04XTXXqohLRSzizeUJX4sH3OFVHAUz74vQETH0eG2rRxkYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837621; c=relaxed/simple;
	bh=8MKub+7Cy+KMSF/PUM44fqLCqP2yziT4FVEouazdk4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tuM0j7j1XjzH+6iOgjD1c7jQ1YaF1v2UO6A0FEqUHhcDqaStXKfnUr5mMjv+4f9a3/RQh+SZPzNFcmPTGfYB3Q3e/5CCI8cgeIRD6taj5KRUL3WPqcgyBtEJSpCRoAufc5xg16APMOtTMMxkE1AgoDza92cuX7EgkxUi1DVOTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9T0AzEz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9T0AzEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECF4C19421;
	Wed, 18 Mar 2026 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773837621;
	bh=8MKub+7Cy+KMSF/PUM44fqLCqP2yziT4FVEouazdk4U=;
	h=From:To:Cc:Subject:Date:From;
	b=A9T0AzEzFV63iWXzlP2nno0uzHHKuFKHctf4NqxDkLc/rtzTZgf9mMUFcvtMpbw0I
	 NOrwYEqGhRrO9236CjQ5lsDO7cxIi7WxKu4mZk5xsCq/HZSjRIQXLGVJnuB9bK82nx
	 5Oix9GpJWhDUP7bbXhkgGnVg9SuLhvk20YgG1b1stGzwyJD9LRp0usomRFic5r6+tZ
	 1weWozcKJNDq63YGcXCl93qccOt9GC+DgCMHECwcC/+j36JSJTRkBgHkqmQR4w847s
	 X9krxswIZ4+W/lBNBxXXnlMGOybiMMzHAwn9PGNmBQFMkEQo7HdQbSVu+j1Ql0Zome
	 vfu7eK9B1iCiw==
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
Subject: [PATCH] [v2] ALSA: asihpi: avoid write overflow check warning
Date: Wed, 18 Mar 2026 13:40:07 +0100
Message-Id: <20260318124016.3488566-1-arnd@kernel.org>
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

v2: use correct union member
---
 sound/pci/asihpi/hpimsgx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/asihpi/hpimsgx.c b/sound/pci/asihpi/hpimsgx.c
index b68e6bfbbfba..ed1c7b774436 100644
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
+	memcpy(&rESP_HPI_ADAPTER_OPEN[adapter].a, &hr.u.ax.info,
+		sizeof(rESP_HPI_ADAPTER_OPEN[adapter].a));
 	if (hr.error)
 		return hr.error;
 
-- 
2.39.5

