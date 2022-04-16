Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18547E
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 06:55:43 +0000 (UTC)
Received: from kwepemi100019.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KgNmp6FmVz1HC0n;
	Sat, 16 Apr 2022 14:38:02 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 kwepemi100019.china.huawei.com (7.221.188.189) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 14:38:42 +0800
Received: from ubuntu1804.huawei.com (10.67.174.61) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 14:38:41 +0800
From: Yang Jihong <yangjihong1@huawei.com>
To: <nathan@kernel.org>, <ndesaulniers@google.com>, <trix@redhat.com>,
	<acme@redhat.com>, <irogers@google.com>, <f.fainelli@gmail.com>,
	<mpetlan@redhat.com>, <leo.yan@linaro.org>, <john@metanate.com>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
CC: <yangjihong1@huawei.com>
Subject: [PATCH] perf llvm: fix check feature libclang faled to cope with latest llvm
Date: Sat, 16 Apr 2022 14:37:43 +0800
Message-ID: <20220416063743.254755-1-yangjihong1@huawei.com>
X-Mailer: git-send-email 2.30.GIT
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.61]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected

For llvm13, perf build check libclang failed even if llmv libraries have been
installed in the system. The output file is as follows:

  # cat ./build/feature/test-clang.make.output
  /usr/local/lib/libLLVMSupport.a(Path.cpp.o): In function `llvm::sys::fs::expandTildeExpr(llvm::SmallVectorImpl<char>&)':
  Path.cpp:(.text._ZN4llvm3sys2fsL15expandTildeExprERNS_15SmallVectorImplIcEE+0x13b): warning: Using 'getpwnam' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
  /usr/local/lib/libLLVMSupport.a(Path.cpp.o): In function `llvm::sys::path::home_directory(llvm::SmallVectorImpl<char>&) [clone .localalias.6]':
  Path.cpp:(.text._ZN4llvm3sys4path14home_directoryERNS_15SmallVectorImplIcEE+0x88): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
  /usr/local/lib/libclangDriver.a(Darwin.cpp.o): In function `clang::driver::toolchains::Darwin::addProfileRTLibs(llvm::opt::ArgList const&, llvm::SmallVector<char const*, 16u>&) const':
  Darwin.cpp:(.text._ZNK5clang6driver10toolchains6Darwin16addProfileRTLibsERKN4llvm3opt7ArgListERNS3_11SmallVectorIPKcLj16EEE+0x217): undefined reference to `llvm::getInstrProfSectionName[abi:cxx11](llvm::InstrProfSectKind, llvm::Triple::ObjectFormatType, bool)'
  collect2: error: ld returned 1 exit status

Because relevant link library is missing. For llvm13, getInstrProfSectionName
interface is in libLLVMInstrumentation, which is part of BPF component library.

The solution has been verified in the llvm13 environment, as following:

  # make OUTPUT= CC=gcc CXX=g++ CFLAGS=  CXXFLAGS=  \
    LDFLAGS="-static -Wl,-z,noexecstack"  \
    -C /home/aa/linux/tools/build/feature test-clang.bin V=1
  make: Entering directory '/home/aa/linux/tools/build/feature'
  g++  -MD -Wall -Werror -o test-clang.bin test-clang.cpp -static -Wl,-z,noexecstack > test-clang.make.output 2>&1 -std=gnu++14                                   \
          -I/usr/local/include            \
          -L/usr/local/lib                \
          -Wl,--start-group -lclangBasic -lclangDriver    \
            -lclangFrontend -lclangEdit -lclangLex        \
            -lclangAST -Wl,--end-group                    \
          -lLLVMBPFDisassembler -lLLVMMCDisassembler -lLLVMBPFAsmParser -lLLVMBPFCodeGen -lLLVMSelectionDAG -lLLVMipo -lLLVMInstrumentation -lLLVMVectorize -lLLVMLinker -lLLVMIRReader -lLLVMAsmParser -lLLVMFrontendOpenMP -lLLVMBPFDesc -lLLVMBPFInfo -lLLVMAsmPrinter -lLLVMDebugInfoMSF -lLLVMDebugInfoDWARF -lLLVMCodeGen -lLLVMTarget -lLLVMScalarOpts -lLLVMInstCombine -lLLVMAggressiveInstCombine -lLLVMTransformUtils -lLLVMBitWriter -lLLVMAnalysis -lLLVMProfileData -lLLVMObject -lLLVMTextAPI -lLLVMMCParser -lLLVMMC -lLLVMDebugInfoCodeView -lLLVMBitReader -lLLVMOption -lLLVMCore -lLLVMRemarks -lLLVMBitstreamReader -lLLVMBinaryFormat -lLLVMSupport -lLLVMDemangle    \
          -lrt -ldl -lpthread -lm -lz -ltinfo -lxml2              \
          > test-clang.make.output 2>&1
  make: Leaving directory '/home/aa/linux/tools/build/feature'

Signed-off-by: Yang Jihong <yangjihong1@huawei.com>
---
 tools/build/feature/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index de66e1cc0734..af667972cb88 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -322,7 +322,7 @@ $(OUTPUT)test-clang.bin:
 		-Wl,--start-group -lclangBasic -lclangDriver	\
 		  -lclangFrontend -lclangEdit -lclangLex	\
 		  -lclangAST -Wl,--end-group 			\
-		$(shell $(LLVM_CONFIG) --libs Core option)	\
+		$(shell $(LLVM_CONFIG) --libs Core option BPF)	\
 		$(shell $(LLVM_CONFIG) --system-libs)		\
 		> $(@:.bin=.make.output) 2>&1
 
-- 
2.30.GIT

