Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3892580
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 16:50:11 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w17so15463427wrg.7
        for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=kKpjALclMXnLqT2X23HyXwdYijA/ZLi6JzjDkTTAhwo=;
        b=IJYy3wg3AvZBvdyJOP3p1EBxIBQ9GNwvR6TONtnqO/ZalaWRQtFEyuvKtl8nOYXjQh
         yYyIxx2d4NpX79rkZHI7xSPlEK/ZgBGSPgVTGT6nWwIuIBp3bnjXtxAfZy2WrxmrWxVN
         4fFDc7JECvUfZY8wFUIStaSwuEuvv9cZwhQFPEHEITdGJz/WSKioWQqUoKvsbuAHot3f
         aEnr9O7djc4sWqyYdNnAhlkdpR09TzDK7RZMIUAar1CQHAa5aHlhQqx3ZBmiErfd0Q6Z
         /THN1zokJWjvprdXKdcKxYvqjrvMnUlOshFg1O2sS4rbyBnchPTxcDVfPCbzJUXIxIe+
         8R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=kKpjALclMXnLqT2X23HyXwdYijA/ZLi6JzjDkTTAhwo=;
        b=3zCY2M3F7UpLiuDResfz6MkEYYcYOV+i7diYtlwiQzxRCRcxQRj2AosMXo0rqUWXFa
         DXi7Pl1Oh54ELerywfm5nolGchqsYac3PWnq+K8zZZ1fjTU+Rqe53jW3Nf+f1J1gtwXT
         jwDgol/1F2G/01um2YnjF5CBvJIQyeZDd4hprUfD2xFqVE33rAJzmdC5j4LLQjjsGoK/
         k3SP2/K6uw6bjntOP2Sp+8zjc/Bo67YtYZ1LqgkMVzMYDu/mdZrmBvUF8Gt8ySvqsM5M
         JREWx0koOx9pNmJ/9tTPxWp11GlaEDnjEXE0UPgPZzEPbG+PMGyinPJVwyj223nQxQ8/
         2SEA==
X-Gm-Message-State: AJIora/RwCf9LHeZBkKIcWrA16FJx6B/m3uqcOlyG8dmfDbFWhv3EyGX
	GW7Zqa8/kNccBWMPUEqMW45IGQ==
X-Google-Smtp-Source: AGRyM1vJSXpFnutrXM6IXz2bFLqyB+T34ldI46QLf153/vDNA5mfPkwUWb4r690w8Qz30PhmsqPP1Q==
X-Received: by 2002:adf:ed41:0:b0:210:20a5:26c2 with SMTP id u1-20020adfed41000000b0021020a526c2mr23711790wro.603.1655743809824;
        Mon, 20 Jun 2022 09:50:09 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6184000000b0020e5b4ebaecsm11828671wru.4.2022.06.20.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 09:50:09 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 20 Jun 2022 16:50:08 +0000 (UTC)
To: Arthur Eubanks <aeubanks@google.com>
Cc: llvm@lists.linux.dev
Message-ID: <786830855.4416.1655743809453@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [GlobalOpt] Perform
 store->dominated load forwarding for stored once globals
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4415_2036129062.1655743808792"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_4415_2036129062.1655743808792
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [GlobalOpt] Perform store->dominated load forwarding for stored once globals:
commit 6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4
Author: Arthur Eubanks <aeubanks@google.com>

    [GlobalOpt] Perform store->dominated load forwarding for stored once globals

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
37
# First few build errors in logs:
# 00:00:51 error: include/uapi/linux/acct.h: leak CONFIG_M68K to user-space
# 00:00:51 make[1]: *** [scripts/Makefile.headersinst:63: usr/include/linux/acct.h] Error 1
# 00:00:51 make: *** [Makefile:1381: headers] Error 2

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
20742

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/build-6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/build-0fe13b5f84abe1716f5991da057c801dc548a9ab/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4
cd investigate-llvm-6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/21/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 0fe13b5f84abe1716f5991da057c801dc548a9ab
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 6f348b146b69a50d5fb1b9fbfd14bc1d204e45c4
Author: Arthur Eubanks <aeubanks@google.com>
Date:   Sat Jun 18 14:14:04 2022 -0700

    [GlobalOpt] Perform store->dominated load forwarding for stored once globals
    
    Compile time tracker:
    https://llvm-compile-time-tracker.com/compare.php?from=1e556f459b44dd0ca4073e932f66ecb6f40fe31a&to=6d7bed4e1e72c6a8592748626091274209740a40&stat=instructions
    
    Reviewed By: nikic
    
    Differential Revision: https://reviews.llvm.org/D128128
---
 llvm/lib/Transforms/IPO/GlobalOpt.cpp              | 35 ++++++++++++++++++++++
 .../GlobalOpt/malloc-promote-1-no-null-opt.ll      |  3 +-
 .../GlobalOpt/malloc-promote-2-no-null-opt.ll      |  3 +-
 llvm/test/Transforms/GlobalOpt/malloc-promote-3.ll |  3 +-
 .../GlobalOpt/shrink-global-to-bool-check-debug.ll | 13 ++++----
 .../Transforms/GlobalOpt/shrink-global-to-bool.ll  |  8 +++--
 .../GlobalOpt/stored-once-forward-value.ll         | 11 ++-----
 .../PhaseOrdering/recompute-globalsaa.ll           |  1 -
 8 files changed, 55 insertions(+), 22 deletions(-)

diff --git a/llvm/lib/Transforms/IPO/GlobalOpt.cpp b/llvm/lib/Transforms/IPO/GlobalOpt.cpp
index a2b47166cdfc..6ea2242a88cb 100644
--- a/llvm/lib/Transforms/IPO/GlobalOpt.cpp
+++ b/llvm/lib/Transforms/IPO/GlobalOpt.cpp
@@ -1438,6 +1438,37 @@ static void makeAllConstantUsesInstructions(Constant *C) {
   }
 }
 
+// For a global variable with one store, if the store dominates any loads,
+// those loads will always load the stored value (as opposed to the
+// initializer), even in the presence of recursion.
+static bool forwardStoredOnceStore(
+    GlobalVariable *GV, const StoreInst *StoredOnceStore,
+    function_ref<DominatorTree &(Function &)> LookupDomTree) {
+  const Value *StoredOnceValue = StoredOnceStore->getValueOperand();
+  SmallVector<LoadInst *> Loads;
+  const Function *F = StoredOnceStore->getFunction();
+  for (User *U : GV->users()) {
+    if (auto *LI = dyn_cast<LoadInst>(U)) {
+      if (LI->getFunction() == F &&
+          LI->getType() == StoredOnceValue->getType() && LI->isSimple())
+        Loads.push_back(LI);
+    }
+  }
+  // Only compute DT if we have any loads to examine.
+  bool MadeChange = false;
+  if (!Loads.empty()) {
+    auto &DT = LookupDomTree(*const_cast<Function *>(F));
+    for (auto *LI : Loads) {
+      if (DT.dominates(StoredOnceStore, LI)) {
+        LI->replaceAllUsesWith(const_cast<Value *>(StoredOnceValue));
+        LI->eraseFromParent();
+        MadeChange = true;
+      }
+    }
+  }
+  return MadeChange;
+}
+
 /// Analyze the specified global variable and optimize
 /// it if possible.  If we make a change, return true.
 static bool
@@ -1597,6 +1628,10 @@ processInternalGlobal(GlobalVariable *GV, const GlobalStatus &GS,
     if (optimizeOnceStoredGlobal(GV, StoredOnceValue, DL, GetTLI))
       return true;
 
+    // Try to forward the store to any loads.
+    if (forwardStoredOnceStore(GV, GS.StoredOnceStore, LookupDomTree))
+      return true;
+
     // Otherwise, if the global was not a boolean, we can shrink it to be a
     // boolean. Skip this optimization for AS that doesn't allow an initializer.
     if (SOVConstant && GS.Ordering == AtomicOrdering::NotAtomic &&
diff --git a/llvm/test/Transforms/GlobalOpt/malloc-promote-1-no-null-opt.ll b/llvm/test/Transforms/GlobalOpt/malloc-promote-1-no-null-opt.ll
index 4cbe83766990..ccda0b8144d8 100644
--- a/llvm/test/Transforms/GlobalOpt/malloc-promote-1-no-null-opt.ll
+++ b/llvm/test/Transforms/GlobalOpt/malloc-promote-1-no-null-opt.ll
@@ -12,8 +12,7 @@ define void @init() #0 {
 ; CHECK-NEXT:    [[MALLOCCALL:%.*]] = tail call i8* @malloc(i64 4)
 ; CHECK-NEXT:    [[P:%.*]] = bitcast i8* [[MALLOCCALL]] to i32*
 ; CHECK-NEXT:    store i32* [[P]], i32** @G, align 8
-; CHECK-NEXT:    [[GV:%.*]] = load i32*, i32** @G, align 8
-; CHECK-NEXT:    store i32 0, i32* [[GV]], align 4
+; CHECK-NEXT:    store i32 0, i32* [[P]], align 4
 ; CHECK-NEXT:    ret void
 ;
   %malloccall = tail call i8* @malloc(i64 4)
diff --git a/llvm/test/Transforms/GlobalOpt/malloc-promote-2-no-null-opt.ll b/llvm/test/Transforms/GlobalOpt/malloc-promote-2-no-null-opt.ll
index 0b31aaf6a282..9c17c833a809 100644
--- a/llvm/test/Transforms/GlobalOpt/malloc-promote-2-no-null-opt.ll
+++ b/llvm/test/Transforms/GlobalOpt/malloc-promote-2-no-null-opt.ll
@@ -12,8 +12,7 @@ define void @t() #0 {
 ; CHECK-NEXT:    [[MALLOCCALL:%.*]] = tail call i8* @malloc(i64 400)
 ; CHECK-NEXT:    [[P:%.*]] = bitcast i8* [[MALLOCCALL]] to i32*
 ; CHECK-NEXT:    store i32* [[P]], i32** @G, align 8
-; CHECK-NEXT:    [[GV:%.*]] = load i32*, i32** @G, align 8
-; CHECK-NEXT:    [[GVE:%.*]] = getelementptr i32, i32* [[GV]], i32 40
+; CHECK-NEXT:    [[GVE:%.*]] = getelementptr i32, i32* [[P]], i32 40
 ; CHECK-NEXT:    store i32 20, i32* [[GVE]], align 4
 ; CHECK-NEXT:    ret void
 ;
diff --git a/llvm/test/Transforms/GlobalOpt/malloc-promote-3.ll b/llvm/test/Transforms/GlobalOpt/malloc-promote-3.ll
index fe7b4753dd5c..2a9940296c1c 100644
--- a/llvm/test/Transforms/GlobalOpt/malloc-promote-3.ll
+++ b/llvm/test/Transforms/GlobalOpt/malloc-promote-3.ll
@@ -12,8 +12,7 @@ define void @t() {
 ; CHECK-NEXT:    [[MALLOCCALL:%.*]] = tail call i8* @malloc(i64 400) #[[ATTR0:[0-9]+]]
 ; CHECK-NEXT:    [[P:%.*]] = bitcast i8* [[MALLOCCALL]] to i32*
 ; CHECK-NEXT:    store i32* [[P]], i32** @G, align 8
-; CHECK-NEXT:    [[GV:%.*]] = load i32*, i32** @G, align 8
-; CHECK-NEXT:    [[GVE:%.*]] = getelementptr i32, i32* [[GV]], i32 40
+; CHECK-NEXT:    [[GVE:%.*]] = getelementptr i32, i32* [[P]], i32 40
 ; CHECK-NEXT:    store i32 20, i32* [[GVE]], align 4
 ; CHECK-NEXT:    ret void
 ;
diff --git a/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool-check-debug.ll b/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool-check-debug.ll
index da396363547f..1c917413c6f0 100644
--- a/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool-check-debug.ll
+++ b/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool-check-debug.ll
@@ -2,21 +2,24 @@
 
 @foo = internal global i32 0, align 4
 
-define dso_local i32 @bar() {
+define void @store() {
 entry:
   store i32 5, i32* @foo, align 4
+  ret void
+}
+
+define i32 @bar() {
+entry:
   %0 = load i32, i32* @foo, align 4
   ret i32 %0
 }
 
 ;CHECK:      @bar
 ;CHECK-NEXT: entry:
-;CHECK-NEXT:   store i1 true, i1* @foo, align 1, !dbg ![[DbgLocStore:[0-9]+]]
 ;CHECK-NEXT:   %.b = load i1, i1* @foo, align 1, !dbg ![[DbgLocLoadSel:[0-9]+]]
 ;CHECK-NEXT:   %0 = select i1 %.b, i32 5, i32 0, !dbg ![[DbgLocLoadSel]]
 ;CHECK-NEXT:   call void @llvm.dbg.value({{.*}}), !dbg ![[DbgLocLoadSel]]
 ;CHECK-NEXT:   ret i32 %0, !dbg ![[DbgLocRet:[0-9]+]]
 
-;CHECK: ![[DbgLocStore]] = !DILocation(line: 1,
-;CHECK: ![[DbgLocLoadSel]] = !DILocation(line: 2,
-;CHECK: ![[DbgLocRet]] = !DILocation(line: 3,
+;CHECK: ![[DbgLocLoadSel]] = !DILocation(line: 3,
+;CHECK: ![[DbgLocRet]] = !DILocation(line: 4,
diff --git a/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool.ll b/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool.ll
index 74c35466992b..bdd515bf2e55 100644
--- a/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool.ll
+++ b/llvm/test/Transforms/GlobalOpt/shrink-global-to-bool.ll
@@ -10,11 +10,13 @@
 ; Negative test for AS(3). Skip shrink global to bool optimization.
 ; CHECK: @lvar = internal unnamed_addr addrspace(3) global i32 undef
 
-define void @test_global_var() {
+define void @test_global_var(i1 %i) {
 ; CHECK-LABEL: @test_global_var(
 ; CHECK:    store volatile i32 10, i32* undef, align 4
 ;
 entry:
+  br i1 %i, label %bb1, label %exit
+bb1:
   store i32 10, i32* @gvar
   br label %exit
 exit:
@@ -23,13 +25,15 @@ exit:
   ret void
 }
 
-define void @test_lds_var() {
+define void @test_lds_var(i1 %i) {
 ; CHECK-LABEL: @test_lds_var(
 ; CHECK:    store i32 10, i32 addrspace(3)* @lvar, align 4
 ; CHECK:    [[LD:%.*]] = load i32, i32 addrspace(3)* @lvar, align 4
 ; CHECK:    store volatile i32 [[LD]], i32* undef, align 4
 ;
 entry:
+  br i1 %i, label %bb1, label %exit
+bb1:
   store i32 10, i32 addrspace(3)* @lvar
   br label %exit
 exit:
diff --git a/llvm/test/Transforms/GlobalOpt/stored-once-forward-value.ll b/llvm/test/Transforms/GlobalOpt/stored-once-forward-value.ll
index b043a03608a7..33a389176d15 100644
--- a/llvm/test/Transforms/GlobalOpt/stored-once-forward-value.ll
+++ b/llvm/test/Transforms/GlobalOpt/stored-once-forward-value.ll
@@ -12,10 +12,8 @@ declare void @b()
 
 define i1 @dom_const() {
 ; CHECK-LABEL: @dom_const(
-; CHECK-NEXT:    store i1 true, ptr @g1, align 1
 ; CHECK-NEXT:    call void @b()
-; CHECK-NEXT:    [[R:%.*]] = load i1, ptr @g1, align 1
-; CHECK-NEXT:    ret i1 [[R]]
+; CHECK-NEXT:    ret i1 true
 ;
   store i1 true, ptr @g1
   call void @b()
@@ -25,10 +23,8 @@ define i1 @dom_const() {
 
 define i32 @dom_arg(i32 %a) {
 ; CHECK-LABEL: @dom_arg(
-; CHECK-NEXT:    store i32 [[A:%.*]], ptr @g2, align 4
 ; CHECK-NEXT:    call void @b()
-; CHECK-NEXT:    [[R:%.*]] = load i32, ptr @g2, align 4
-; CHECK-NEXT:    ret i32 [[R]]
+; CHECK-NEXT:    ret i32 [[A:%.*]]
 ;
   store i32 %a, ptr @g2
   call void @b()
@@ -74,8 +70,7 @@ define i1 @dom_multiple_function_loads() {
 ; CHECK-LABEL: @dom_multiple_function_loads(
 ; CHECK-NEXT:    store i1 true, ptr @g5, align 1
 ; CHECK-NEXT:    call void @b()
-; CHECK-NEXT:    [[R:%.*]] = load i1, ptr @g5, align 1
-; CHECK-NEXT:    ret i1 [[R]]
+; CHECK-NEXT:    ret i1 true
 ;
   store i1 true, ptr @g5
   call void @b()
diff --git a/llvm/test/Transforms/PhaseOrdering/recompute-globalsaa.ll b/llvm/test/Transforms/PhaseOrdering/recompute-globalsaa.ll
index 3dbddbdb96fa..f4290c64a773 100644
--- a/llvm/test/Transforms/PhaseOrdering/recompute-globalsaa.ll
+++ b/llvm/test/Transforms/PhaseOrdering/recompute-globalsaa.ll
@@ -9,7 +9,6 @@
 define i32 @main() {
 ; CHECK-LABEL: @main(
 ; CHECK-NEXT:  entry:
-; CHECK-NEXT:    store i1 true, i1* @a, align 4
 ; CHECK-NEXT:    [[TMP0:%.*]] = load i32*, i32** @e, align 8
 ; CHECK-NEXT:    store i32 0, i32* [[TMP0]], align 4
 ; CHECK-NEXT:    store i32* null, i32** @e, align 8
</cut>
------=_Part_4415_2036129062.1655743808792--
