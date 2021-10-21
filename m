Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE17E2C81
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 12:52:48 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZn1n73CVzbglW;
	Thu, 21 Oct 2021 20:32:45 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 20:37:20 +0800
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 20:37:20 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<kafai@fb.com>, <songliubraving@fb.com>, <yhs@fb.com>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <nathan@kernel.org>,
	<ndesaulniers@google.com>
CC: <netdev@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, <pulehui@huawei.com>
Subject: [PATCH bpf-next] samples: bpf: Suppress readelf stderr when probing for BTF support
Date: Thu, 21 Oct 2021 20:39:13 +0800
Message-ID: <20211021123913.48833-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected

When compiling bpf samples, the following warning appears:

readelf: Error: Missing knowledge of 32-bit reloc types used in DWARF
sections of machine number 247
readelf: Warning: unable to apply unsupported reloc type 10 to section
.debug_info
readelf: Warning: unable to apply unsupported reloc type 1 to section
.debug_info
readelf: Warning: unable to apply unsupported reloc type 10 to section
.debug_info

Same problem was mentioned in commit 2f0921262ba9 ("selftests/bpf:
suppress readelf stderr when probing for BTF support"), let's use
readelf that supports btf.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 samples/bpf/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 2366242edb7c..a886dff1ba89 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -229,6 +229,7 @@ CLANG ?= clang
 OPT ?= opt
 LLVM_DIS ?= llvm-dis
 LLVM_OBJCOPY ?= llvm-objcopy
+LLVM_READELF ?= llvm-readelf
 BTF_PAHOLE ?= pahole
 
 # Detect that we're cross compiling and use the cross compiler
@@ -252,7 +253,7 @@ BTF_PAHOLE_PROBE := $(shell $(BTF_PAHOLE) --help 2>&1 | grep BTF)
 BTF_OBJCOPY_PROBE := $(shell $(LLVM_OBJCOPY) --help 2>&1 | grep -i 'usage.*llvm')
 BTF_LLVM_PROBE := $(shell echo "int main() { return 0; }" | \
 			  $(CLANG) -target bpf -O2 -g -c -x c - -o ./llvm_btf_verify.o; \
-			  readelf -S ./llvm_btf_verify.o | grep BTF; \
+			  $(LLVM_READELF) -S ./llvm_btf_verify.o | grep BTF; \
 			  /bin/rm -f ./llvm_btf_verify.o)
 
 BPF_EXTRA_CFLAGS += -fno-stack-protector
-- 
2.17.1

