Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581E52C80
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 16:19:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="224599481"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="224599481"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 08:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="579417337"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
  by fmsmga004.fm.intel.com with ESMTP; 06 Dec 2021 08:18:20 -0800
Received: from newjersey.igk.intel.com (newjersey.igk.intel.com [10.102.20.203])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id 1B6GIJ0W021925;
	Mon, 6 Dec 2021 16:18:19 GMT
From: Alexander Lobakin <alexandr.lobakin@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
        Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Zhen Lei <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH] numa: mark __next_node() as __always_inline to fix section mismatch
Date: Mon,  6 Dec 2021 17:17:45 +0100
Message-Id: <20211206161745.39028-1-alexandr.lobakin@intel.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang (13) uninlines __next_node() which emits the following warning
due to that this function is used in init code (amd_numa_init(),
sched_init_numa() etc.):

WARNING: modpost: vmlinux.o(.text+0x927ee): Section mismatch
in reference from the function __next_node() to the variable
.init.data:numa_nodes_parsed
The function __next_node() references
the variable __initdata numa_nodes_parsed.
This is often because __next_node lacks a __initdata
annotation or the annotation of numa_nodes_parsed is wrong.

Mark __next_node() as __always_inline() so it won't get uninlined.
bloat-o-meter over x86_64 binaries says this:

scripts/bloat-o-meter -c vmlinux.baseline vmlinux
add/remove: 1/1 grow/shrink: 2/7 up/down: 446/-2166 (-1720)
Function                                     old     new   delta
apply_wqattrs_cleanup                          -     410    +410
amd_numa_init                                814     842     +28
sched_init_numa                             1338    1346      +8
find_next_bit                                 38      19     -19
__next_node                                   45       -     -45
apply_wqattrs_prepare                       1069     799    -270
wq_nice_store                                688     414    -274
wq_numa_store                                805     433    -372
wq_cpumask_store                             789     402    -387
apply_workqueue_attrs                        538     147    -391
workqueue_set_unbound_cpumask                947     539    -408
Total: Before=14422603, After=14420883, chg -0.01%

So it's both win-win in terms of resolving section mismatch and
saving some text size (-1.7 Kb is quite nice).

Signed-off-by: Alexander Lobakin <alexandr.lobakin@intel.com>
---
 include/linux/nodemask.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..55ba2c56f39b 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -266,7 +266,7 @@ static inline int __first_node(const nodemask_t *srcp)
 }
 
 #define next_node(n, src) __next_node((n), &(src))
-static inline int __next_node(int n, const nodemask_t *srcp)
+static __always_inline int __next_node(int n, const nodemask_t *srcp)
 {
 	return min_t(int,MAX_NUMNODES,find_next_bit(srcp->bits, MAX_NUMNODES, n+1));
 }
-- 
2.33.1

