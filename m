Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E53A3B
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 05:22:11 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.225.67])
	by sina.com (172.16.97.23) with ESMTP
	id 6327FBA90002490D; Mon, 19 Sep 2022 13:18:34 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 89834354920471
From: eadavis@sina.com
To: lkp@intel.com
Cc: almaz.alexandrovich@paragon-software.com,
	eadavis@sina.com,
	eadvis@sina.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ntfs3@lists.linux.dev,
	syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com
Subject: [PATCH] fs/ntfs3: "add a boundary check for EA_FULL" lose right parenthesis
Date: Mon, 19 Sep 2022 13:19:43 +0800
Message-Id: <20220919051943.184810-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <202209121421.hVaJ6pLd-lkp@intel.com>
References: <202209121421.hVaJ6pLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@sina.com>

I have provided a new patch:
https://lore.kernel.org/all/20220912065431.3043731-1-eadavis@sina.com
It is a collection of the current patch and the previous one.

Signed-off-by: Edward Adam Davis <eadavis@sina.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
---
 fs/ntfs3/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index c90cc453390d..4ec8f7e41b6d 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -69,7 +69,7 @@ static inline bool find_ea(const struct EA_FULL *ea_all, u32 bytes,
 		if (next_len >= bytes ||
 		    ((!ea->size) &&
 		     (next_len + ea->name_len + 
-		      le16_to_cpu(ea->elength) >= bytes))
+		      le16_to_cpu(ea->elength) >= bytes)))
 			return false;
 	}
 }
-- 
2.37.2

