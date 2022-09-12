Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn [202.108.3.21])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A26D7F
	for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 03:42:23 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.225.67])
	by sina.com (172.16.97.32) with ESMTP
	id 631EAA2A00014FE5; Mon, 12 Sep 2022 11:40:27 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 543438628826
From: eadavis@sina.com
To: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
Cc: almaz.alexandrovich@paragon-software.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ntfs3@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com,
	Edward Adam Davis <eadvis@sina.com>
Subject: [PATCH] fs/netfs3: add a boundary check for EA_FULL
Date: Mon, 12 Sep 2022 11:41:43 +0800
Message-Id: <20220912034143.3022590-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <0000000000005af92105e80510f2@google.com>
References: <0000000000005af92105e80510f2@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Adam Davis <eadvis@sina.com>

the root case is: 
The remaining space after the offset is less than the space needed to 
accommodate the next EA_FULL struct.

Link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
Reported-by: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadvis@sina.com>
---
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
+		      le16_to_cpu(ea->elength) >= bytes))
+			return false;
 	}
 }
 
-- 
2.37.2

