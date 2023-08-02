Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0CC1553A6
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 08:08:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id A65DE606AC671;
	Wed,  2 Aug 2023 16:06:10 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: chuck.lever@oracle.com,
	jlayton@kernel.org,
	neilb@suse.de,
	kolga@netapp.com,
	Dai.Ngo@oracle.com,
	tom@talpey.com,
	trond.myklebust@hammerspace.com,
	anna@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: bfields@fieldses.org,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH] fs: lockd: avoid possible wrong NULL parameter
Date: Wed,  2 Aug 2023 16:05:45 +0800
Message-Id: <20230802080544.3239967-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang's static analysis warning: fs/lockd/mon.c: line 293, column 2:
Null pointer passed as 2nd argument to memory copy function.

Assuming 'hostname' is NULL and calling 'nsm_create_handle()', this will
pass NULL as 2nd argument to memory copy function 'memcpy()'. So return
NULL if 'hostname' is invalid.

Fixes: 77a3ef33e2de ("NSM: More clean up of nsm_get_handle()")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/lockd/mon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/lockd/mon.c b/fs/lockd/mon.c
index 1d9488cf0534..eebab013e063 100644
--- a/fs/lockd/mon.c
+++ b/fs/lockd/mon.c
@@ -358,6 +358,9 @@ struct nsm_handle *nsm_get_handle(const struct net *net,
 
 	spin_unlock(&nsm_lock);
 
+	if (!hostname)
+		return NULL;
+
 	new = nsm_create_handle(sap, salen, hostname, hostname_len);
 	if (unlikely(new == NULL))
 		return NULL;
-- 
2.30.2

