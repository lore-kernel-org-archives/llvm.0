Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0C7230BE9;
	Mon,  5 Jan 2026 19:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640637; cv=none; b=RhONbA+mmAQx/bKZzHhlhkiTlaeqUGJLLhzX4bXH9RU2olAm+1/mco1KLKMMqb+yXinOO3qcdloWVPh0eey7jgbxNuWmqiYNZdfxLP4b/Bc5Dmxq/gnXEwA4ayW0OG7rxOH7sW8WQ3Y9SG6c9r5BFeB/bffcTNXg8gngef+Ej6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640637; c=relaxed/simple;
	bh=tja02UDzBs7wICK3Voj6Ot/znyUDcV2n437uw4TqOgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D9SuOTLDv4um2TJOmkY9gBD1ax40LQSdIRLDKn7X66MQfrwi7Q7E2jUL+UwnBbQihpIJUiGIo+EWgJlxwGr5WoMvexZR9QqKOwm/PiTaDBSxysSeCWSrSjQmyRSDiNhLBVYS0j5NHSnAxRHzLgqu3OZjAfREpp8q1tDf/qGLNzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BsC/zPsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BsC/zPsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D2AC116D0;
	Mon,  5 Jan 2026 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640637;
	bh=tja02UDzBs7wICK3Voj6Ot/znyUDcV2n437uw4TqOgo=;
	h=From:Date:Subject:To:Cc:From;
	b=BsC/zPsFahMr0nL2HRpqZQRNz+sfUcLnA1ZzzZYLKO+hrdFzvq42QbFYhFvNSU83K
	 gN/QmHqqRB8RexqhxwYbKKYMl7SgZysb0wm8d4kjBtHl6Ztlrh7sCDrd8qUjyIxGMI
	 ZcIQ8NZuKAkBqEX/ZXg5iCvvunh8wjrvZeMG161q3g8wop7GulT4HBKFSdCgd+Rg9k
	 +vQ6k/eWJwp5IjJW/EHvLVVCV2/63KqVz3Tsx3/pZ4gLwq70ntTPF9/41J7cF1nLIV
	 noJuxtr+UaV7tgl6bmE9xT6s9a7OyqVGekfI4PXMIXcYcQU/qNrgWqKcP/W8VMmfEn
	 3xhb0+UG0z5bA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Jan 2026 12:17:10 -0700
Subject: [PATCH] ntfs3: Restore NULL folio initialization in
 ntfs_writepages()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-ntfs3-restore-null-folio-init-v1-1-432093703dfd@kernel.org>
X-B4-Tracking: v=1; b=H4sIADUOXGkC/yXMwQrCMAwA0F8ZORtoN9zAXxEPc0k1UlJJOhHG/
 t2qx3d5GzibsMOp28D4JS5FG+Khg+U+641RqBn60I8hhiNqTT6gsddijLrmjKlkKSgqFXmgaZ5
 oJAoR2vE0TvL+/efL375eH7zUbwr7/gF/gjjLgQAAAA==
X-Change-ID: 20260105-ntfs3-restore-null-folio-init-e3d7a7d6dd01
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695; i=nathan@kernel.org;
 h=from:subject:message-id; bh=tja02UDzBs7wICK3Voj6Ot/znyUDcV2n437uw4TqOgo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkxfNbPI/K3mDHsn/Lixs+4K/9vtKlH7Dq46+GFQ4GFN
 itudvks7ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATUb/N8M9EM4Z1zf1CoSPH
 W+8nHlmqYhEYmVDSqh491fXf7N3bt/gxMhx02fGj9qnz7EUXxcMn/Uwt/RC43uc44/6KPs3NXL+
 sX7ADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y):

  fs/ntfs3/inode.c:1021:6: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
   1021 |         if (is_resident(ni)) {
        |             ^~~~~~~~~~~~~~~
  fs/ntfs3/inode.c:1024:48: note: uninitialized use occurs here
   1024 |                 while ((folio = writeback_iter(mapping, wbc, folio, &err)))
        |                                                              ^~~~~

folio should be initialized to NULL for the first iteration of
writeback_iter() to start the loop properly. Restore the NULL
initialization of folio that was lost in the recent iomap conversion to
clear up the warning.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601010644.FIhOXy6Y-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index b969ad7c3258..438d468f28ba 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1019,7 +1019,7 @@ static int ntfs_writepages(struct address_space *mapping,
 		return -EIO;
 
 	if (is_resident(ni)) {
-		struct folio *folio;
+		struct folio *folio = NULL;
 
 		while ((folio = writeback_iter(mapping, wbc, folio, &err)))
 			err = ntfs_resident_writepage(folio, wbc);

---
base-commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13
change-id: 20260105-ntfs3-restore-null-folio-init-e3d7a7d6dd01

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

