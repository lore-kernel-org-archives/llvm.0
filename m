Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ED67B
	for <llvm@lists.linux.dev>; Sat,  3 Dec 2022 13:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D881DC433C1;
	Sat,  3 Dec 2022 13:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1670075712;
	bh=w9suPqgmnaFDB3lHT9y0pxVHFqlpMMxqYQc5gUAnUsc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=2SkcJccaJIj5NLoDLczTVudTX/dt9xzh/enRz835jbv0Oa7nQkkwEWttxo8DVUP2t
	 4z9Ec2YuqGJMfDD9snaL4+PR1bEJ1ZPAKT1TpUtjb9tT7g1dsAeH50E8MSKgZJ6vJK
	 Ncoya/17oW0b/AwoTx6dqxCPz23h+v4xWwnO9QtU=
Subject: Patch "mm: Fix '.data.once' orphan section warning" has been added to the 4.14-stable tree
To: gregkh@linuxfoundation.org,hughd@google.com,llvm@lists.linux.dev,nathan@kernel.org,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 03 Dec 2022 14:54:56 +0100
In-Reply-To: <20221128225345.9383-1-nathan@kernel.org>
Message-ID: <16700756961148@kroah.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    mm: Fix '.data.once' orphan section warning

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-fix-.data.once-orphan-section-warning.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Sat Dec  3 14:33:17 2022
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 28 Nov 2022 15:53:46 -0700
Subject: mm: Fix '.data.once' orphan section warning
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Hugh Dickins <hughd@google.com>, llvm@lists.linux.dev, stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Message-ID: <20221128225345.9383-1-nathan@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

Portions of upstream commit a4055888629b ("mm/memcg: warning on !memcg
after readahead page charged") were backported as commit cfe575954ddd
("mm: add VM_WARN_ON_ONCE_PAGE() macro"). Unfortunately, the backport
did not account for the lack of commit 33def8498fdd ("treewide: Convert
macro and uses of __section(foo) to __section("foo")") in kernels prior
to 5.10, resulting in the following orphan section warnings on PowerPC
clang builds with CONFIG_DEBUG_VM=y:

  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'
  powerpc64le-linux-gnu-ld: warning: orphan section `".data.once"' from `mm/huge_memory.o' being placed in section `".data.once"'

This is a difference between how clang and gcc handle macro
stringification, which was resolved for the kernel by not stringifying
the argument to the __section() macro. Since that change was deemed not
suitable for the stable kernels by commit 59f89518f510 ("once: fix
section mismatch on clang builds"), do that same thing as that change
and remove the quotes from the argument to __section().

Fixes: cfe575954ddd ("mm: add VM_WARN_ON_ONCE_PAGE() macro")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Hugh Dickins <hughd@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/mmdebug.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/include/linux/mmdebug.h
+++ b/include/linux/mmdebug.h
@@ -38,7 +38,7 @@ void dump_mm(const struct mm_struct *mm)
 		}							\
 	} while (0)
 #define VM_WARN_ON_ONCE_PAGE(cond, page)	({			\
-	static bool __section(".data.once") __warned;			\
+	static bool __section(.data.once) __warned;			\
 	int __ret_warn_once = !!(cond);					\
 									\
 	if (unlikely(__ret_warn_once && !__warned)) {			\


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-4.14/mm-fix-.data.once-orphan-section-warning.patch
