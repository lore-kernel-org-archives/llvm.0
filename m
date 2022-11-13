Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn [202.108.3.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777FED1
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 05:13:23 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.231.232])
	by sina.com (172.16.97.27) with ESMTP
	id 63707B680001F634; Sun, 13 Nov 2022 13:06:49 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 42848049286471
From: eadavis@sina.com
To: eadavis@sina.com
Cc: almaz.alexandrovich@paragon-software.com,
	dan.carpenter@oracle.com,
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
	eadaivs <eadaivs@sina.com>
Subject: [PATCH v5] fs/ntfs3: Validate parameter bytes and valid size
Date: Sun, 13 Nov 2022 13:07:53 +0800
Message-Id: <20221113050753.270164-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919133202.308766-1-eadavis@sina.com>
References: <20220919133202.308766-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: eadaivs <eadaivs@sina.com>

Syzbot reports a slab out of bounds read in ntfs_get_ea,
According to splat, the final problem is in the function find_ea,

1) If parameter "bytes" less than the structure EA_ FULL Pointer Object Size,
then the unpacked_ea_size() is an out of bounds read.

2) The *off + unpacked_ea_size() can have an integer overflow.

Change the type of the parameter bytes to size_t,
add sanity check for ensuring that the parameter bytes within reason.
And instead of calculating the offset, use the function size add.

Link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
Reported-and-tested-by: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
Fixes: (be71b5cba2e6) fs/ntfs3: Add attrib operations
Signed-off-by: eadaivs <eadaivs@sina.com>
---
Changes in v5:
  Refactor the code and pass syzbot test.

 fs/ntfs3/xattr.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index afd0ddad826f..188a76c28233 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -41,17 +41,23 @@ static inline size_t packed_ea_size(const struct EA_FULL *ea)
  *
  * Assume there is at least one xattr in the list.
  */
-static inline bool find_ea(const struct EA_FULL *ea_all, u32 bytes,
+static inline bool find_ea(const struct EA_FULL *ea_all, size_t bytes,
 			   const char *name, u8 name_len, u32 *off)
 {
+	const struct EA_FULL *eb;
+	u32 next_off;
 	*off = 0;
 
-	if (!ea_all || !bytes)
+	if (!ea_all || bytes < sizeof(*eb))
 		return false;
 
 	for (;;) {
 		const struct EA_FULL *ea = Add2Ptr(ea_all, *off);
-		u32 next_off = *off + unpacked_ea_size(ea);
+
+		if (sizeof(*ea) + *off > bytes)
+			return false;
+
+		next_off = size_add(*off, unpacked_ea_size(ea));
 
 		if (next_off > bytes)
 			return false;
@@ -61,8 +67,6 @@ static inline bool find_ea(const struct EA_FULL *ea_all, u32 bytes,
 			return true;
 
 		*off = next_off;
-		if (next_off >= bytes)
-			return false;
 	}
 }
 
-- 
2.37.2

