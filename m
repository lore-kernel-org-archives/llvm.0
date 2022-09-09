Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE09622
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 06:06:09 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP55H1MQtznVFf;
	Fri,  9 Sep 2022 14:03:15 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 14:05:50 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <quentin@isovalent.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<haoluo@google.com>, <jolsa@kernel.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <hawk@kernel.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [bpf-next v3 2/2] bpftool: Update doc (add auto_attach to prog load)
Date: Fri, 9 Sep 2022 14:17:13 +0800
Message-ID: <1662704233-8805-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
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

Add auto_attach optional to prog load|loadall for supporting
one-step load-attach-pin_link.

Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 tools/bpf/bpftool/Documentation/bpftool-prog.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
index eb1b2a2..c640ad3 100644
--- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
+++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
@@ -31,7 +31,8 @@ PROG COMMANDS
 |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual** | **linum**}]
 |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes** | **linum**}]
 |	**bpftool** **prog pin** *PROG* *FILE*
-|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
+|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] \
+|               [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**auto_attach**]
 |	**bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
 |	**bpftool** **prog tracelog**
@@ -131,7 +132,7 @@ DESCRIPTION
 		  contain a dot character ('.'), which is reserved for future
 		  extensions of *bpffs*.
 
-	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
+	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**auto_attach**]
 		  Load bpf program(s) from binary *OBJ* and pin as *PATH*.
 		  **bpftool prog load** pins only the first program from the
 		  *OBJ* as *PATH*. **bpftool prog loadall** pins all programs
@@ -149,6 +150,8 @@ DESCRIPTION
 		  given networking device (offload).
 		  Optional **pinmaps** argument can be provided to pin all
 		  maps under *MAP_DIR* directory.
+		  If **auto_attach** is specified program will be attached
+		  before pin.
 
 		  Note: *PATH* must be located in *bpffs* mount. It must not
 		  contain a dot character ('.'), which is reserved for future
-- 
1.8.3.1

