Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76FB6AAE
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 19:07:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id ay12so5685783wmb.1
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc;
        bh=J75QslZdPFTaFlZ1NTOPDbRXSwySxcDSSEVqt++3Sno=;
        b=bk5+ukW7ctXsr5c6nis1mKSElLqaJ3M2dkUinBK3hHCV2dtTLrWy4PXuIuCtK8Igm4
         7RH7Xjim0d+7l5bUCUF/fYo//7wlxQ80qwERtoicqXDvzRBmXL0LPhEaT+ZckMq1U/iY
         VI2cW/ew4f2XlMbQhik2giv24HeomSvAIqoHpKEuuPVMIIlddIUN9ppbd3SqNhRmrng1
         CjaSwDCaSH4DFhTyG92KnpnRIb5krHt3k471/hup5rjXUToOgWWQDD6hQmENBt3RKJDW
         lUg5Vu/iUAj1MQgtXHy+RqemdLXxIOo97vXHCwXIlazWABctWS3Hyn2IF7oxSdq8cPKB
         PTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc;
        bh=J75QslZdPFTaFlZ1NTOPDbRXSwySxcDSSEVqt++3Sno=;
        b=fVDfbGfBUFXxniBE9fmqS97dasLUK6Qf5+bOJFfGPDHolTNLGQKKvTJw89NgczheVp
         u8WhfHoetuQfHGBjo90pdeY8VqChtikAtYIfcESnzxQphB5G0zfIbyIx3sTd2/h3MCIz
         mb+kJkXATjcUNnUnQKyhCDygxEkQXLgXIwHdWTZdelLpOErm9/p2AchUR5M4Js2z22/T
         xJCDtd7Rp+IMI3BOxJ96eEFavJUs3iwxjeY+FDiNvKIratr0/jAqiwre7KuHtBEA6qEp
         OUQpgWcIdqF6MzMjN7azOSLfXLbuXD8BNoH0eQjYJrNxxC7oIIT3dJ0dvBTt2oW9UwOJ
         GnQA==
X-Gm-Message-State: ACgBeo1ZRudBAdA3iG6iptSBXzFWPJ7s0zR+qAq7MheznI+4NwzEBA9M
	LXUjSqRb3VdPh7Yg+MK6ZvQXYw==
X-Google-Smtp-Source: AA6agR6Ssyji1Z4Wm4d9KansBtI/D4+4o/5XsdtjKNqf60OvIxtLblvcCkIMdiNAvlkJElMNsBMvEg==
X-Received: by 2002:a1c:ed0e:0:b0:3a2:d7d0:c607 with SMTP id l14-20020a1ced0e000000b003a2d7d0c607mr19308851wmh.147.1660676875112;
        Tue, 16 Aug 2022 12:07:55 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id by6-20020a056000098600b0021e571a99d5sm11145502wrb.17.2022.08.16.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 12:07:54 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 16 Aug 2022 19:07:54 +0000 (UTC)
To: Shawn Zhong <github@shawnzhong.com>
Cc: llvm@lists.linux.dev
Message-ID: <587965879.6777.1660676874505@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: Fix
 -Wbitfield-constant-conversion on 1-bit signed bitfield
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6776_1825487553.1660676874159"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_6776_1825487553.1660676874159
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: Fix -Wbitfield-constant-conversion on 1-bit signed bitfield:
commit 82afc9b169a67e8b8a1862fb9c41a2cd974d6691
Author: Shawn Zhong <github@shawnzhong.com>

    Fix -Wbitfield-constant-conversion on 1-bit signed bitfield

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21250
# First few build errors in logs:
# 00:07:12 sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
# 00:07:12 make[3]: *** [scripts/Makefile.build:249: sound/soc/atmel/mchp-spdiftx.o] Error 1
# 00:07:32 make[2]: *** [scripts/Makefile.build:465: sound/soc/atmel] Error 2
# 00:12:27 make[1]: *** [scripts/Makefile.build:465: sound/soc] Error 2
# 00:12:27 make: *** [Makefile:1855: sound] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21326
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/build-82afc9b169a67e8b8a1862fb9c41a2cd974d6691/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/build-e486e48c3d9e99e4c17d365bbc4b429c8e5b5999/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-82afc9b169a67e8b8a1862fb9c41a2cd974d6691
cd investigate-llvm-82afc9b169a67e8b8a1862fb9c41a2cd974d6691

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/build-baseline artifacts/build-parameters
curl -o artifacts/build-baseline/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/build-baseline/manifest.sh --fail
curl -o artifacts/build-parameters/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/build-parameters/manifest.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/23/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts/build-baseline

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 82afc9b169a67e8b8a1862fb9c41a2cd974d6691
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach e486e48c3d9e99e4c17d365bbc4b429c8e5b5999
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 82afc9b169a67e8b8a1862fb9c41a2cd974d6691
Author: Shawn Zhong <github@shawnzhong.com>
Date:   Tue Aug 9 11:42:39 2022 -0400

    Fix -Wbitfield-constant-conversion on 1-bit signed bitfield
    
    A one-bit signed bit-field can only hold the values 0 and -1; this
    corrects the diagnostic behavior accordingly.
    
    Fixes #53253
    Differential Revision: https://reviews.llvm.org/D131255
---
 clang/docs/ReleaseNotes.rst                         |  3 +++
 clang/lib/Sema/SemaChecking.cpp                     |  5 -----
 clang/test/CXX/class/class.bit/p1.cpp               | 10 +++++-----
 clang/test/CXX/drs/dr6xx.cpp                        |  6 +++---
 clang/test/CodeGen/bitfield.c                       | 16 ++++++++++++++++
 clang/test/CodeGenCXX/bitfield-layout.cpp           |  9 +++++++++
 clang/test/Rewriter/rewrite-modern-struct-ivar-1.mm |  2 +-
 clang/test/Rewriter/rewrite-modern-struct-ivar.mm   |  4 ++--
 clang/test/Sema/constant-conversion.c               | 12 ++++++++++--
 clang/test/SemaCXX/constant-expression-cxx11.cpp    |  1 +
 clang/test/SemaCXX/cxx1z-decomposition.cpp          |  2 +-
 clang/test/SemaCXX/decomposition-blocks.cpp         |  2 +-
 12 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/clang/docs/ReleaseNotes.rst b/clang/docs/ReleaseNotes.rst
index d830928a13d4..4b01f018005e 100644
--- a/clang/docs/ReleaseNotes.rst
+++ b/clang/docs/ReleaseNotes.rst
@@ -82,6 +82,9 @@ Improvements to Clang's diagnostics
 - ``-Wformat`` now recognizes ``%b`` for the ``printf``/``scanf`` family of
   functions and ``%B`` for the ``printf`` family of functions. Fixes
   `Issue 56885: <https://github.com/llvm/llvm-project/issues/56885>`_.
+- ``-Wbitfield-constant-conversion`` now diagnoses implicit truncation when 1 is
+  assigned to a 1-bit signed integer bitfield. This fixes
+  `Issue 53253 <https://github.com/llvm/llvm-project/issues/53253>`_.
 
 Non-comprehensive list of changes in this release
 -------------------------------------------------
diff --git a/clang/lib/Sema/SemaChecking.cpp b/clang/lib/Sema/SemaChecking.cpp
index 5a1c21d3a367..a0ea35e1234f 100644
--- a/clang/lib/Sema/SemaChecking.cpp
+++ b/clang/lib/Sema/SemaChecking.cpp
@@ -13064,11 +13064,6 @@ static bool AnalyzeBitFieldAssignment(Sema &S, FieldDecl *Bitfield, Expr *Init,
   if (llvm::APSInt::isSameValue(Value, TruncatedValue))
     return false;
 
-  // Special-case bitfields of width 1: booleans are naturally 0/1, and
-  // therefore don't strictly fit into a signed bitfield of width 1.
-  if (FieldWidth == 1 && Value == 1)
-    return false;
-
   std::string PrettyValue = toString(Value, 10);
   std::string PrettyTrunc = toString(TruncatedValue, 10);
 
diff --git a/clang/test/CXX/class/class.bit/p1.cpp b/clang/test/CXX/class/class.bit/p1.cpp
index ab15e3a356cf..5df1ab52cdd8 100644
--- a/clang/test/CXX/class/class.bit/p1.cpp
+++ b/clang/test/CXX/class/class.bit/p1.cpp
@@ -9,11 +9,11 @@ struct A {
   int [[]] c : 1; // OK, attribute applies to the type.
   int : 2 = 1; // expected-error {{anonymous bit-field cannot have a default member initializer}}
   int : 0 { 1 }; // expected-error {{anonymous bit-field cannot have a default member initializer}}
-  int : 0, d : 1 = 1;
+  unsigned int : 0, d : 1 = 1;
   int : 1 = 12, e : 1; // expected-error {{anonymous bit-field cannot have a default member initializer}}
-  int : 0, f : 1 = 1;
-  int g [[]] : 1 = 1;
-  int h [[]] : 1 {1};
-  int i : foo() = foo();
+  unsigned int : 0, f : 1 = 1;
+  unsigned int g [[]] : 1 = 1;
+  unsigned int h [[]] : 1 {1};
+  unsigned int i : foo() = foo();
   int j, [[]] k; // expected-error {{an attribute list cannot appear here}}
 };
diff --git a/clang/test/CXX/drs/dr6xx.cpp b/clang/test/CXX/drs/dr6xx.cpp
index ad87c7295cfe..432fd6e6c5ef 100644
--- a/clang/test/CXX/drs/dr6xx.cpp
+++ b/clang/test/CXX/drs/dr6xx.cpp
@@ -911,9 +911,9 @@ namespace dr674 { // dr674: 8
 namespace dr675 { // dr675: dup 739
   template<typename T> struct A { T n : 1; };
 #if __cplusplus >= 201103L
-  static_assert(A<char>{1}.n < 0, "");
-  static_assert(A<int>{1}.n < 0, "");
-  static_assert(A<long long>{1}.n < 0, "");
+  static_assert(A<char>{1}.n < 0, ""); // expected-warning {{implicit truncation from 'int' to bit-field changes value from 1 to -1}}
+  static_assert(A<int>{1}.n < 0, ""); // expected-warning {{implicit truncation from 'int' to bit-field changes value from 1 to -1}}
+  static_assert(A<long long>{1}.n < 0, ""); // expected-warning {{implicit truncation from 'int' to bit-field changes value from 1 to -1}}
 #endif
 }
 
diff --git a/clang/test/CodeGen/bitfield.c b/clang/test/CodeGen/bitfield.c
index c624d0045d33..4845d7c47842 100644
--- a/clang/test/CodeGen/bitfield.c
+++ b/clang/test/CodeGen/bitfield.c
@@ -87,3 +87,19 @@ int g3(void) {
 // PATH: ret i32 1
   return f3(20) + 130725747;
 }
+
+static int f4(void) {
+  struct s5 {
+    int b:1;
+  } x;
+  x.b = 1;
+  return x.b;
+}
+
+int g4(void) {
+// CHECK-LABEL: @g4()
+// CHECK: ret i32 1
+// PATH-LABEL: @g4()
+// PATH: ret i32 1
+  return f4() + 2;
+}
diff --git a/clang/test/CodeGenCXX/bitfield-layout.cpp b/clang/test/CodeGenCXX/bitfield-layout.cpp
index d570b8f33e34..0e0d712fd8aa 100644
--- a/clang/test/CodeGenCXX/bitfield-layout.cpp
+++ b/clang/test/CodeGenCXX/bitfield-layout.cpp
@@ -105,6 +105,15 @@ int test_trunc_three_bits() {
 // CHECK: define{{.*}} i32 @test_trunc_three_bits()
 // CHECK: ret i32 -1
 
+int test_trunc_one_bit() {
+  union {
+    int i : 1; // truncated to 0b1 == -1
+  } const U = {1};  // 0b00000001
+  return U.i;
+}
+// CHECK: define{{.*}} i32 @test_trunc_one_bit()
+// CHECK: ret i32 -1
+
 int test_trunc_1() {
   union {
     int i : 1; // truncated to 0b1 == -1
diff --git a/clang/test/Rewriter/rewrite-modern-struct-ivar-1.mm b/clang/test/Rewriter/rewrite-modern-struct-ivar-1.mm
index a17fe3f85675..e54b1cdaab3a 100644
--- a/clang/test/Rewriter/rewrite-modern-struct-ivar-1.mm
+++ b/clang/test/Rewriter/rewrite-modern-struct-ivar-1.mm
@@ -34,7 +34,7 @@ typedef struct {
 @implementation Foo
 - (void)x:(Foo *)other {
   bar.x = 0;
-  bar.y = 1;
+  bar.y = -1;
   self->_internal._singleRange._range = (( other ->bar.x) ? &( other ->_internal._singleRange._range) : ((NSRange *)(&(((_NSRangeInfo *)( other ->_internal._multipleRanges._data))->_ranges))))[0];
 }
 @end
diff --git a/clang/test/Rewriter/rewrite-modern-struct-ivar.mm b/clang/test/Rewriter/rewrite-modern-struct-ivar.mm
index 9f56cd8b1b83..f98bdbc460d3 100644
--- a/clang/test/Rewriter/rewrite-modern-struct-ivar.mm
+++ b/clang/test/Rewriter/rewrite-modern-struct-ivar.mm
@@ -41,10 +41,10 @@ struct S {
 @implementation Foo
 - (void)x {
   bar.x = 0;
-  bar.y = 1;
+  bar.y = -1;
 
   s.x = 0;
-  s.y = 1;
+  s.y = -1;
 }
 @end
 
diff --git a/clang/test/Sema/constant-conversion.c b/clang/test/Sema/constant-conversion.c
index 025f4709a7d5..d386d21f24aa 100644
--- a/clang/test/Sema/constant-conversion.c
+++ b/clang/test/Sema/constant-conversion.c
@@ -15,8 +15,16 @@ void test_7809123(void) {
 }
 
 void test(void) {
-  struct { int bit : 1; } a;
-  a.bit = 1; // shouldn't warn
+  struct S {
+    int b : 1;  // The only valid values are 0 and -1.
+  } s;
+
+  s.b = -3; // expected-warning {{implicit truncation from 'int' to bit-field changes value from -3 to -1}}
+  s.b = -2; // expected-warning {{implicit truncation from 'int' to bit-field changes value from -2 to 0}}
+  s.b = -1; // no-warning
+  s.b = 0;  // no-warning
+  s.b = 1;  // expected-warning {{implicit truncation from 'int' to bit-field changes value from 1 to -1}}
+  s.b = 2;  // expected-warning {{implicit truncation from 'int' to bit-field changes value from 2 to 0}}
 }
 
 enum Test2 { K_zero, K_one };
diff --git a/clang/test/SemaCXX/constant-expression-cxx11.cpp b/clang/test/SemaCXX/constant-expression-cxx11.cpp
index e145ca982cdd..c5742ad8c2cb 100644
--- a/clang/test/SemaCXX/constant-expression-cxx11.cpp
+++ b/clang/test/SemaCXX/constant-expression-cxx11.cpp
@@ -2035,6 +2035,7 @@ namespace Bitfields {
       }
     };
     static_assert(X::f(3) == -1, "3 should truncate to -1");
+    static_assert(X::f(1) == -1, "1 should truncate to -1");
   }
 
   struct HasUnnamedBitfield {
diff --git a/clang/test/SemaCXX/cxx1z-decomposition.cpp b/clang/test/SemaCXX/cxx1z-decomposition.cpp
index 13fe826759a3..305a9ac2ebc2 100644
--- a/clang/test/SemaCXX/cxx1z-decomposition.cpp
+++ b/clang/test/SemaCXX/cxx1z-decomposition.cpp
@@ -84,7 +84,7 @@ void enclosing() {
 
   (void)[outerbit1]{}; // expected-error {{'outerbit1' cannot be captured because it does not have automatic storage duration}}
 
-  auto [bit, var] = S2{1, 1}; // expected-note 2{{'bit' declared here}}
+  auto [bit, var] = S2{-1, 1}; // expected-note 2{{'bit' declared here}}
 
   (void)[&bit] { // expected-error {{non-const reference cannot bind to bit-field 'a'}} \
                     // expected-warning {{C++20}}
diff --git a/clang/test/SemaCXX/decomposition-blocks.cpp b/clang/test/SemaCXX/decomposition-blocks.cpp
index 21f66f8c7c1b..0676463d12c7 100644
--- a/clang/test/SemaCXX/decomposition-blocks.cpp
+++ b/clang/test/SemaCXX/decomposition-blocks.cpp
@@ -7,7 +7,7 @@ struct S {
 
 void run(void (^)());
 void test() {
-  auto [i, j] = S{1, 42}; // expected-note {{'i' declared here}}
+  auto [i, j] = S{-1, 42}; // expected-note {{'i' declared here}}
   run(^{
     (void)i; // expected-error {{reference to local binding 'i' declared in enclosing function 'test'}}
   });
</cut>
------=_Part_6776_1825487553.1660676874159--
