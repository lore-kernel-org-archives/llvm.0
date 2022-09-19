Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1A85C92
	for <llvm@lists.linux.dev>; Mon, 19 Sep 2022 13:32:42 +0000 (UTC)
Received: from unknown (HELO pek-lxu-l1.corp.ad.wrs.com)([111.198.225.67])
	by sina.com (172.16.97.32) with ESMTP
	id 63286EFB00002595; Mon, 19 Sep 2022 21:30:37 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
X-SMAIL-MID: 175931628972
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
	eadaivs <eadaivs@sina.com>
Subject: [PATCH v4] fs/ntfs3: Fix buffer overflow and integer overflow
Date: Mon, 19 Sep 2022 21:32:02 +0800
Message-Id: <20220919133202.308766-1-eadavis@sina.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <Yyhaw8iBPulIO0Pp@kadam>
References: <Yyhaw8iBPulIO0Pp@kadam>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: eadaivs <eadaivs@sina.com>

1) If we call find_ea() if "bytes" less than 8 then the
unpacked_ea_size() is an out of bounds read.
2) The *off + unpacked_ea_size() can have an integer overflow.

Link: https://syzkaller.appspot.com/bug?extid=c4d950787fd5553287b7
Reported-by: syzbot+c4d950787fd5553287b7@syzkaller.appspotmail.com
Signed-off-by: eadaivs <eadaivs@sina.com>
---
Changes in v4:
  Separate out the issue with the buffer overflow and the integer
  overflow.

 fs/ntfs3/xattr.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index afd0ddad826f..3cd1a24c7bcc 100644
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
+	const struct EA_FULL *ea;
+	u32 next_off;
 	*off = 0;
 
-	if (!ea_all || !bytes)
+	if (!ea_all || bytes < sizeof(*ea))
 		return false;
 
 	for (;;) {
-		const struct EA_FULL *ea = Add2Ptr(ea_all, *off);
-		u32 next_off = *off + unpacked_ea_size(ea);
+		*ea = Add2Ptr(ea_all, *off);
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

