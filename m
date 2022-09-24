Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9917D0
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 09:53:22 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MZPNt18QnzlXLK;
	Sat, 24 Sep 2022 17:49:02 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 17:53:12 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <quentin@isovalent.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<haoluo@google.com>, <jolsa@kernel.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <hawk@kernel.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [bpf-next v6 2/3] bpftool: Update doc (add autoattach to prog load)
Date: Sat, 24 Sep 2022 18:13:49 +0800
Message-ID: <1664014430-5286-2-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664014430-5286-1-git-send-email-wangyufen@huawei.com>
References: <1664014430-5286-1-git-send-email-wangyufen@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected

Add autoattach optional to prog load|loadall for supporting
one-step load-attach-pin_link.

Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 tools/bpf/bpftool/Documentation/bpftool-prog.rst | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index eb1b2a254eb1..2d9f27a0120f 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -31,7 +31,7 @@ PROG COMMANDS
 |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual** | **linum**}]
 |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes** | **linum**}]
 |	**bpftool** **prog pin** *PROG* *FILE*
-|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
+|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**autoattach**]
 |	**bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog tracelog**
@@ -131,7 +131,7 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
+	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**autoattach**]
 		  Load bpf program(s) from binary *OBJ* and pin as *PATH*.
 		  **bpftool prog load** pins only the first program from the
 		  *OBJ* as *PATH*. **bpftool prog loadall** pins all programs
@@ -150,6 +150,15 @@ DESCRIPTION
 		  Optional **pinmaps** argument can be provided to pin all
 		  maps under *MAP_DIR* directory.
 
+		  If **autoattach** is specified program will be attached
+		  before pin. In that case, only the link (representing the
+		  program attached to its hook) is pinned, not the program as
+		  such, so the path won't show in "**bpftool prog show -f**",
+		  only show in "**bpftool link show -f**". Also, this only works
+		  when bpftool (libbpf) is able to infer all necessary information
+		  from the objectfile, in particular, it's not supported for all
+		  program types.
+
 		  Note: *PATH* must be located in *bpffs* mount. It must not
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
-- 
2.25.1

