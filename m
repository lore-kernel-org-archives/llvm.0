Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5BBD2C;
	Sat, 21 Jan 2023 10:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C1BC433EF;
	Sat, 21 Jan 2023 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674295924;
	bh=V8MuxpP8Pi4nAo/iKbDQz0IVxXMZzusqzi08ucS3huo=;
	h=From:To:Cc:Subject:Date:From;
	b=pCEiqGdMg7Kmyme9ku4G6/FgCLG24oj128JxZx9nt4ZpU3Bm+nJ/+6LSWdBEIiAR8
	 8oHoV3UtyoTETH6bsS88DBX/x+kqSN7Yc8a6leFJhD4sMkDiDdwPwnNYsE5qW1p4Qv
	 axJjjmL+VDnk4tqX9JyqvEwgO2RZeDToxQJp1JXe6P95/WMp0wQwqHqCv+qxagnvBP
	 CTgjmTOO0Q/u2Rinqbn3u0IGL03At9NFYFETimbwgOBSyiq3W7AxT2DQAs26d2lzxa
	 jleAuSZcJG1zk6ykCKoUcND936na5GSsdHjLvxb5RWUJBn0ACSbInX60d3gK4HfRt9
	 GdCqZZ6MpeSrQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miles Chen <miles.chen@mediatek.com>,
	kernel test robot <lkp@intel.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH] mm/sparse: fix "unused function 'pgdat_to_phys'" warning
Date: Sat, 21 Jan 2023 12:11:51 +0200
Message-Id: <20230121101151.1703292-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 build with clangs complains:

mm/sparse.c:347:27: warning: unused function 'pgdat_to_phys' [-Wunused-function]
static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
                             ^
1 warning generated.

pgdat_to_phys() is only used by functions defined when
CONFIG_MEMORY_HOTREMOVE=y.

Move pgdat_to_phys() under #ifdef CONFIG_MEMORY_HOTREMOVE
to make clang happy.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202301210155.1E5zABb5-lkp@intel.com
Signed-off-by: Mike Rapoport <rppt@kernel.org>
---
 mm/sparse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/sparse.c b/mm/sparse.c
index 2779b419ef2a..fb7aeb1899a4 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -318,6 +318,7 @@ size_t mem_section_usage_size(void)
 	return sizeof(struct mem_section_usage) + usemap_size();
 }
 
+#ifdef CONFIG_MEMORY_HOTREMOVE
 static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
 {
 #ifndef CONFIG_NUMA
@@ -328,7 +329,6 @@ static inline phys_addr_t pgdat_to_phys(struct pglist_data *pgdat)
 #endif
 }
 
-#ifdef CONFIG_MEMORY_HOTREMOVE
 static struct mem_section_usage * __init
 sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 					 unsigned long size)
-- 
2.35.1

