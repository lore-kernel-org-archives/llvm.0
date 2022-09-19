Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD114A1F
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 11:20:03 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.225.67])
	by sina.com (172.16.97.35) with ESMTP
	id 6328500B00020EDA; Mon, 19 Sep 2022 19:18:36 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 63424315074641
From: eadavis@sina.com
To: dan.carpenter@oracle.com
Cc: almaz.alexandrovich@paragon-software.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ntfs3@lists.linux.dev,
	syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com,
	Edward Adam Davis <eadavis@sina.com>
Subject: [PATCH v3] fs/ntfs3: add a boundary check for EA_FULL
Date: Mon, 19 Sep 2022 19:19:54 +0800
Message-Id: <20220919111954.283125-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <YyhHowvgEarPqONR@kadam>
References: <YyhHowvgEarPqONR@kadam>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadavis@sina.com>

the root cause is: 
The remaining space after the offset is less than the space needed to 
accommodate the next EA_FULL struct.

Link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
Reported-by: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
Changes in v3:
  Add Suggested-by: and fix the syntax err.

 fs/ntfs3/xattr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index 7de8718c68a9..c90cc453390d 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -52,6 +52,7 @@ static inline bool find_ea(const struct EA_FULL *ea_all, u32 bytes,
 	for (;;) {
 		const struct EA_FULL *ea = Add2Ptr(ea_all, *off);
 		u32 next_off = *off + unpacked_ea_size(ea);
+		u32 next_len = 0;
 
 		if (next_off > bytes)
 			return false;
@@ -63,6 +64,13 @@ static inline bool find_ea(const struct EA_FULL *ea_all, u32 bytes,
 		*off = next_off;
 		if (next_off >= bytes)
 			return false;
+
+		next_len = next_off + 8;
+		if (next_len >= bytes ||
+		    ((!ea->size) &&
+		     (next_len + ea->name_len + 
+		      le16_to_cpu(ea->elength) >= bytes)))
+			return false;
 	}
 }
 
-- 
2.37.2

