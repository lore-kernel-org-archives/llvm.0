Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4017F1FBD
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 10:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596D7C340E7;
	Fri, 25 Feb 2022 10:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645786690;
	bh=xocndT1mAxQLbcxB/eiA1gVQtSVPbtpokyhIdpq3Z98=;
	h=Subject:To:Cc:From:Date:From;
	b=ItLLbiVcnOG+95oZEkDoPCzQ+8FsP7Clay8OKdfglgGWH6KsbUTZRxFHrDXJ9Xjfs
	 cqdtUW3JgU1A4cYcXEHpmVreguZiY+054HK7aNu/P7ESuL7ZXOCBpqNncR5c7ufIef
	 is9qP9Shkn4obaSEooO3mTquOdmodqHtg4kxN+MY=
Subject: Patch "slab: remove __alloc_size attribute from __kmalloc_track_caller" has been added to the 5.16-stable tree
To: akpm@linux-foundation.org,cl@linux.com,danielmicay@gmail.com,gregkh@linuxfoundation.org,iamjoonsoo.kim@lge.com,keescook@chromium.org,linux-mm@kvack.org,llvm@lists.linux.dev,nathan@kernel.org,ndesaulniers@google.com,penberg@kernel.org,rientjes@google.com,vbabka@suse.cz
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 25 Feb 2022 11:58:08 +0100
Message-ID: <164578668720614@kroah.com>
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

    slab: remove __alloc_size attribute from __kmalloc_track_caller

to the 5.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     slab-remove-__alloc_size-attribute-from-__kmalloc_track_caller.patch
and it can be found in the queue-5.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 93dd04ab0b2b32ae6e70284afc764c577156658e Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 18 Feb 2022 14:13:58 +0100
Subject: slab: remove __alloc_size attribute from __kmalloc_track_caller

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit 93dd04ab0b2b32ae6e70284afc764c577156658e upstream.

Commit c37495d6254c ("slab: add __alloc_size attributes for better
bounds checking") added __alloc_size attributes to a bunch of kmalloc
function prototypes.  Unfortunately the change to __kmalloc_track_caller
seems to cause clang to generate broken code and the first time this is
called when booting, the box will crash.

While the compiler problems are being reworked and attempted to be
solved [1], let's just drop the attribute to solve the issue now.  Once
it is resolved it can be added back.

[1] https://github.com/ClangBuiltLinux/linux/issues/1599

Fixes: c37495d6254c ("slab: add __alloc_size attributes for better bounds checking")
Cc: stable <stable@vger.kernel.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Daniel Micay <danielmicay@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: David Rientjes <rientjes@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
Link: https://lore.kernel.org/r/20220218131358.3032912-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/slab.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -669,8 +669,7 @@ static inline __alloc_size(1, 2) void *k
  * allocator where we care about the real place the memory allocation
  * request comes from.
  */
-extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller)
-				   __alloc_size(1);
+extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
 #define kmalloc_track_caller(size, flags) \
 	__kmalloc_track_caller(size, flags, _RET_IP_)
 


Patches currently in stable-queue which might be from gregkh@linuxfoundation.org are

queue-5.16/mm-filemap-fix-handling-of-thps-in-generic_file_buffered_read.patch
queue-5.16/btrfs-tree-checker-check-item_size-for-inode_item.patch
queue-5.16/cgroup-cpuset-fix-a-race-between-cpuset_attach-and-cpu-hotplug.patch
queue-5.16/btrfs-tree-checker-check-item_size-for-dev_item.patch
queue-5.16/slab-remove-__alloc_size-attribute-from-__kmalloc_track_caller.patch
queue-5.16/cgroup-v1-correct-privileges-check-in-release_agent-writes.patch
