Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46467E
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 10:40:27 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MmFg13mttzHv8Z;
	Mon, 10 Oct 2022 18:35:25 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 18:40:22 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <quentin@isovalent.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<haoluo@google.com>, <jolsa@kernel.org>, <davem@davemloft.net>,
	<kuba@kernel.org>, <hawk@kernel.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>, <trix@redhat.com>
CC: <bpf@vger.kernel.org>, <netdev@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [bpf-next v8 0/3] bpftool: Add autoattach for bpf prog load|loadall
Date: Mon, 10 Oct 2022 18:59:58 +0800
Message-ID: <1665399601-29668-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected

This patchset add "autoattach" optional for "bpftool prog load(_all)" to support
one-step load-attach-pin_link.

v7 -> v8: for the programs not supporting autoattach, fall back to reguler pinning
	  instead of skipping
v6 -> v7: add info msg print and update doc for the skip program
v5 -> v6: skip the programs not supporting auto-attach,
	  and change optional name from "auto_attach" to "autoattach"
v4 -> v5: some formatting nits of doc
v3 -> v4: rename functions, update doc, bash and do_help()
v2 -> v3: switch to extend prog load command instead of extend perf
v2: https://patchwork.kernel.org/project/netdevbpf/patch/20220824033837.458197-1-weiyongjun1@huawei.com/
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20220816151725.153343-1-weiyongjun1@huawei.com/

Wang Yufen (3):
  bpftool: Add autoattach for bpf prog load|loadall
  bpftool: Update doc (add autoattach to prog load)
  bpftool: Update the bash completion(add autoattach to prog load)

 tools/bpf/bpftool/Documentation/bpftool-prog.rst | 15 ++++-
 tools/bpf/bpftool/bash-completion/bpftool        |  1 +
 tools/bpf/bpftool/prog.c                         | 78 +++++++++++++++++++++++-
 3 files changed, 90 insertions(+), 4 deletions(-)

-- 
1.8.3.1

