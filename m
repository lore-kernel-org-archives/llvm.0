Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6C2C82
	for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 12:31:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id s18so4711504wrv.7
        for <llvm@lists.linux.dev>; Sat, 22 Jan 2022 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version:list-id;
        bh=frb20cNVN/x9NM9IuWQSc+rkeX6QSARyyC0lIRNpGs4=;
        b=rmtZLSfM3A55BM+LHI1aMZXueGxcmEWG0Jm7NcxX8To3DpErdvfs0ErvyNM85lRMwd
         JIYVfqB13JxfZKmWfalypP8uIfFbsk8bBIjPpVwXF/Q09dECs7O4ecDnHJAdlaS06L9N
         aJWC5OMSzDBkJHAALz6J+tQsiwWl6tBGZOBRNwX59AfnGskCQONrr4s+Q2CrMeQ5SiKE
         4MY2U/MyJOQEURoAvG5GF6al/B1Qs9gp+i9StE32f3BgcyO90O+SmTNLqQjTphOM3BaN
         9LxgydI3zxWp3WKgeZvn8pYnbwGW9o9+SnmmTSZCIa80XZ5dg+gVkOSrOIZiihcDn9rB
         JdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version
         :list-id;
        bh=frb20cNVN/x9NM9IuWQSc+rkeX6QSARyyC0lIRNpGs4=;
        b=aJ1a0vbH9KP7ztcST10bT7dRSO1tOcIunKofEdCWtYVTgDpwOZwAwOgkAhuWuF26Uo
         d+N6J3UsftI/n4FuRr8ZB7MA/BemVEVghM3H9xpUxv2BceiO3XN1GgAwcynnPF8VIdoY
         Oy8272EfXJrDb4+XHywl1luIelE1Y0b1OLlkZhDRhM9MdMWDhTrKbJxkzVk+LPRIo/cq
         OB6j+C0ZvOTFuP/8IWQsi3WqkXk0KS/RdNu+Uv7englXQW7/i6mCOQFI0TI9imHSDljM
         i7dGTGJ153FMa80iYpv0770yByFIjp3AmR8qVPLE+GgMUVOoys63S1m9fYXC3LV5NO6V
         +6pA==
X-Gm-Message-State: AOAM53387fDMtDUd2ZPNXRgEvzjoCz1EslGMdQQNIJM41VDJp1itQTr1
	klr5xziB9EfGfUuu8ze9Jf/xuw==
X-Google-Smtp-Source: ABdhPJyjH9lECLOSlUpK0ncZGhX1LVqmEDbQ2SRv3fvq0zh+5Nt0qqAcwOcct190ck8q2u4uOuVpCg==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr7313063wrr.403.1642854714461;
        Sat, 22 Jan 2022 04:31:54 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id l13sm11527208wry.87.2022.01.22.04.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 04:31:53 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Sat, 22 Jan 2022 12:31:52 +0000 (UTC)
To: Mubashar Ahmad <mubashar.ahmad@arm.com>
Cc: llvm@lists.linux.dev
Message-ID: <1454838115.14607.1642854713913@jenkins.jenkins>
Subject: [TCWG CI] Regression caused by llvm: [Clang][AArch64][ARM]
 Unaligned Access Warning Added
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14606_1851058197.1642854713092"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-stable-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_14606_1851058197.1642854713092
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[TCWG CI] Regression caused by llvm: [Clang][AArch64][ARM] Unaligned Access Warning Added:
commit 35737df4dcd28534bd3090157c224c19b501278a
Author: Mubashar Ahmad <mubashar.ahmad@arm.com>

    [Clang][AArch64][ARM] Unaligned Access Warning Added

Results regressed to
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
20623
# First few build errors in logs:
# 00:03:03 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
# 00:03:03 make[3]: *** [scripts/Makefile.build:277: security/keys/encrypted-keys/encrypted.o] Error 1
# 00:03:03 make[2]: *** [scripts/Makefile.build:540: security/keys/encrypted-keys] Error 2
# 00:03:05 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
# 00:03:05 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_core.o] Error 1
# 00:03:06 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
# 00:03:06 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_tpm1.o] Error 1
# 00:03:07 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
# 00:03:07 make[3]: *** [scripts/Makefile.build:277: security/keys/trusted-keys/trusted_tpm2.o] Error 1
# 00:03:08 ./include/linux/tpm.h:288:2: error: field  within 'struct tpm_header' is less aligned than 'union tpm_header::(anonymous at ./include/linux/tpm.h:288:2)' and is usually due to 'struct tpm_header' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]

from
# reset_artifacts:
-10
# build_abe binutils:
-9
# build_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21885

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-stable-allmodconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/build-35737df4dcd28534bd3090157c224c19b501278a/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/build-60147c6034e32f687ef82bafe3f0d7fdf451072a/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-35737df4dcd28534bd3090157c224c19b501278a
cd investigate-llvm-35737df4dcd28534bd3090157c224c19b501278a

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-allmodconfig/9/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach 35737df4dcd28534bd3090157c224c19b501278a
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach 60147c6034e32f687ef82bafe3f0d7fdf451072a
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit 35737df4dcd28534bd3090157c224c19b501278a
Author: Mubashar Ahmad <mubashar.ahmad@arm.com>
Date:   Thu Dec 23 16:37:44 2021 +0000

    [Clang][AArch64][ARM] Unaligned Access Warning Added
    
    Added warning for potential cases of
    unaligned access when option
    -mno-unaligned-access has been specified
    
    Differential Revision: https://reviews.llvm.org/D116221
---
 clang/include/clang/Basic/DiagnosticASTKinds.td |   5 +
 clang/include/clang/Basic/DiagnosticGroups.td   |   1 +
 clang/lib/AST/RecordLayoutBuilder.cpp           |  17 +
 clang/lib/Driver/ToolChains/Arch/AArch64.cpp    |  11 +-
 clang/lib/Driver/ToolChains/Arch/AArch64.h      |   1 +
 clang/lib/Driver/ToolChains/Arch/ARM.cpp        |  28 +-
 clang/lib/Driver/ToolChains/Clang.cpp           |   3 +-
 clang/test/Sema/test-wunaligned-access.c        | 516 ++++++++++++++++++++++++
 clang/test/Sema/test-wunaligned-access.cpp      | 274 +++++++++++++
 9 files changed, 846 insertions(+), 10 deletions(-)

diff --git a/clang/include/clang/Basic/DiagnosticASTKinds.td b/clang/include/clang/Basic/DiagnosticASTKinds.td
index d788c8517914..a89bdff1a10c 100644
--- a/clang/include/clang/Basic/DiagnosticASTKinds.td
+++ b/clang/include/clang/Basic/DiagnosticASTKinds.td
@@ -590,4 +590,9 @@ def warn_padded_struct_size : Warning<
   InGroup<Padded>, DefaultIgnore;
 def warn_unnecessary_packed : Warning<
   "packed attribute is unnecessary for %0">, InGroup<Packed>, DefaultIgnore;
+
+// -Wunaligned-access
+def warn_unaligned_access : Warning<
+  "field %1 within %0 is less aligned than %2 and is usually due to %0 being "
+  "packed, which can lead to unaligned accesses">, InGroup<UnalignedAccess>, DefaultIgnore;
 }
diff --git a/clang/include/clang/Basic/DiagnosticGroups.td b/clang/include/clang/Basic/DiagnosticGroups.td
index 1bc879a68a8c..608e16147b1c 100644
--- a/clang/include/clang/Basic/DiagnosticGroups.td
+++ b/clang/include/clang/Basic/DiagnosticGroups.td
@@ -543,6 +543,7 @@ def ExplicitInitializeCall : DiagGroup<"explicit-initialize-call">;
 def OrderedCompareFunctionPointers : DiagGroup<"ordered-compare-function-pointers">;
 def Packed : DiagGroup<"packed">;
 def Padded : DiagGroup<"padded">;
+def UnalignedAccess : DiagGroup<"unaligned-access">;
 
 def PessimizingMove : DiagGroup<"pessimizing-move">;
 def ReturnStdMove : DiagGroup<"return-std-move">;
diff --git a/clang/lib/AST/RecordLayoutBuilder.cpp b/clang/lib/AST/RecordLayoutBuilder.cpp
index 3e39ec1c718d..61a30ead165e 100644
--- a/clang/lib/AST/RecordLayoutBuilder.cpp
+++ b/clang/lib/AST/RecordLayoutBuilder.cpp
@@ -2021,6 +2021,7 @@ void ItaniumRecordLayoutBuilder::LayoutField(const FieldDecl *D,
   CharUnits UnpackedFieldAlign =
       !DefaultsToAIXPowerAlignment ? FieldAlign : PreferredAlign;
   CharUnits UnpackedFieldOffset = FieldOffset;
+  CharUnits OriginalFieldAlign = UnpackedFieldAlign;
 
   if (FieldPacked) {
     FieldAlign = CharUnits::One();
@@ -2105,6 +2106,22 @@ void ItaniumRecordLayoutBuilder::LayoutField(const FieldDecl *D,
   // Remember max struct/class ABI-specified alignment.
   UnadjustedAlignment = std::max(UnadjustedAlignment, FieldAlign);
   UpdateAlignment(FieldAlign, UnpackedFieldAlign, PreferredAlign);
+
+  // For checking the alignment of inner fields against
+  // the alignment of its parent record.
+  if (const RecordDecl *RD = D->getParent()) {
+    // Check if packed attribute or pragma pack is present.
+    if (RD->hasAttr<PackedAttr>() || !MaxFieldAlignment.isZero())
+      if (FieldAlign < OriginalFieldAlign)
+        if (D->getType()->isRecordType()) {
+          // If the offset is a multiple of the alignment of
+          // the type, raise the warning.
+          // TODO: Takes no account the alignment of the outer struct
+          if (FieldOffset % OriginalFieldAlign != 0)
+            Diag(D->getLocation(), diag::warn_unaligned_access)
+                << Context.getTypeDeclType(RD) << D->getName() << D->getType();
+        }
+  }
 }
 
 void ItaniumRecordLayoutBuilder::FinishLayout(const NamedDecl *D) {
diff --git a/clang/lib/Driver/ToolChains/Arch/AArch64.cpp b/clang/lib/Driver/ToolChains/Arch/AArch64.cpp
index 9ffb5d73b2aa..89a77a368ef0 100644
--- a/clang/lib/Driver/ToolChains/Arch/AArch64.cpp
+++ b/clang/lib/Driver/ToolChains/Arch/AArch64.cpp
@@ -221,6 +221,7 @@ getAArch64MicroArchFeaturesFromMcpu(const Driver &D, StringRef Mcpu,
 void aarch64::getAArch64TargetFeatures(const Driver &D,
                                        const llvm::Triple &Triple,
                                        const ArgList &Args,
+                                       llvm::opt::ArgStringList &CmdArgs,
                                        std::vector<StringRef> &Features,
                                        bool ForAS) {
   Arg *A;
@@ -464,10 +465,16 @@ fp16_fml_fallthrough:
 
   if (Arg *A = Args.getLastArg(options::OPT_mno_unaligned_access,
                                options::OPT_munaligned_access)) {
-    if (A->getOption().matches(options::OPT_mno_unaligned_access))
+    if (A->getOption().matches(options::OPT_mno_unaligned_access)) {
       Features.push_back("+strict-align");
-  } else if (Triple.isOSOpenBSD())
+      if (!ForAS)
+        CmdArgs.push_back("-Wunaligned-access");
+    }
+  } else if (Triple.isOSOpenBSD()) {
     Features.push_back("+strict-align");
+    if (!ForAS)
+      CmdArgs.push_back("-Wunaligned-access");
+  }
 
   if (Args.hasArg(options::OPT_ffixed_x1))
     Features.push_back("+reserve-x1");
diff --git a/clang/lib/Driver/ToolChains/Arch/AArch64.h b/clang/lib/Driver/ToolChains/Arch/AArch64.h
index d47c402d4a42..0cdc2ec725e0 100644
--- a/clang/lib/Driver/ToolChains/Arch/AArch64.h
+++ b/clang/lib/Driver/ToolChains/Arch/AArch64.h
@@ -22,6 +22,7 @@ namespace aarch64 {
 
 void getAArch64TargetFeatures(const Driver &D, const llvm::Triple &Triple,
                               const llvm::opt::ArgList &Args,
+                              llvm::opt::ArgStringList &CmdArgs,
                               std::vector<llvm::StringRef> &Features,
                               bool ForAS);
 
diff --git a/clang/lib/Driver/ToolChains/Arch/ARM.cpp b/clang/lib/Driver/ToolChains/Arch/ARM.cpp
index 4013cf230026..1055d7800b63 100644
--- a/clang/lib/Driver/ToolChains/Arch/ARM.cpp
+++ b/clang/lib/Driver/ToolChains/Arch/ARM.cpp
@@ -769,10 +769,12 @@ fp16_fml_fallthrough:
   }
 
   // Kernel code has more strict alignment requirements.
-  if (KernelOrKext)
+  if (KernelOrKext) {
     Features.push_back("+strict-align");
-  else if (Arg *A = Args.getLastArg(options::OPT_mno_unaligned_access,
-                                    options::OPT_munaligned_access)) {
+    if (!ForAS)
+      CmdArgs.push_back("-Wunaligned-access");
+  } else if (Arg *A = Args.getLastArg(options::OPT_mno_unaligned_access,
+                                      options::OPT_munaligned_access)) {
     if (A->getOption().matches(options::OPT_munaligned_access)) {
       // No v6M core supports unaligned memory access (v6M ARM ARM A3.2).
       if (Triple.getSubArch() == llvm::Triple::SubArchType::ARMSubArch_v6m)
@@ -781,8 +783,11 @@ fp16_fml_fallthrough:
       // access either.
       else if (Triple.getSubArch() == llvm::Triple::SubArchType::ARMSubArch_v8m_baseline)
         D.Diag(diag::err_target_unsupported_unaligned) << "v8m.base";
-    } else
+    } else {
       Features.push_back("+strict-align");
+      if (!ForAS)
+        CmdArgs.push_back("-Wunaligned-access");
+    }
   } else {
     // Assume pre-ARMv6 doesn't support unaligned accesses.
     //
@@ -801,14 +806,23 @@ fp16_fml_fallthrough:
     int VersionNum = getARMSubArchVersionNumber(Triple);
     if (Triple.isOSDarwin() || Triple.isOSNetBSD()) {
       if (VersionNum < 6 ||
-          Triple.getSubArch() == llvm::Triple::SubArchType::ARMSubArch_v6m)
+          Triple.getSubArch() == llvm::Triple::SubArchType::ARMSubArch_v6m) {
         Features.push_back("+strict-align");
+        if (!ForAS)
+          CmdArgs.push_back("-Wunaligned-access");
+      }
     } else if (Triple.isOSLinux() || Triple.isOSNaCl() ||
                Triple.isOSWindows()) {
-      if (VersionNum < 7)
+      if (VersionNum < 7) {
         Features.push_back("+strict-align");
-    } else
+        if (!ForAS)
+          CmdArgs.push_back("-Wunaligned-access");
+      }
+    } else {
       Features.push_back("+strict-align");
+      if (!ForAS)
+        CmdArgs.push_back("-Wunaligned-access");
+    }
   }
 
   // llvm does not support reserving registers in general. There is support
diff --git a/clang/lib/Driver/ToolChains/Clang.cpp b/clang/lib/Driver/ToolChains/Clang.cpp
index 253c52cf0ba8..96d949be17ee 100644
--- a/clang/lib/Driver/ToolChains/Clang.cpp
+++ b/clang/lib/Driver/ToolChains/Clang.cpp
@@ -346,7 +346,8 @@ static void getTargetFeatures(const Driver &D, const llvm::Triple &Triple,
   case llvm::Triple::aarch64:
   case llvm::Triple::aarch64_32:
   case llvm::Triple::aarch64_be:
-    aarch64::getAArch64TargetFeatures(D, Triple, Args, Features, ForAS);
+    aarch64::getAArch64TargetFeatures(D, Triple, Args, CmdArgs, Features,
+                                      ForAS);
     break;
   case llvm::Triple::x86:
   case llvm::Triple::x86_64:
diff --git a/clang/test/Sema/test-wunaligned-access.c b/clang/test/Sema/test-wunaligned-access.c
new file mode 100644
index 000000000000..55c2149634d1
--- /dev/null
+++ b/clang/test/Sema/test-wunaligned-access.c
@@ -0,0 +1,516 @@
+// RUN: %clang_cc1 %s -triple=armv7-none-none-eabi -verify -Wunaligned-access -S -emit-llvm
+// REQUIRES: arm-registered-target
+//
+// This test suite tests the warning triggered by the -Wunaligned-access option.
+// The warning occurs when a struct or other type of record contains a field
+// that is itself a record. The outer record must be a packed structure, while
+// while the inner record must be unpacked. This is the fundamental condition
+// for the warning to be triggered. Some of these tests may have three layers.
+//
+// The command line option -fsyntax-only is not used as Clang needs to be
+// forced to layout the structs used in this test.
+// The triple in the command line above is used for the assumptions about
+// size and alignment of types.
+
+// Set 1
+struct T1 {
+  char a;
+  int b;
+};
+
+struct __attribute__((packed)) U1 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U1' is less aligned than 'struct T1' and is usually due to 'struct U1' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U2 {
+  char a;
+  struct T1 b __attribute__((aligned(2))); // expected-warning {{field b within 'struct U2' is less aligned than 'struct T1' and is usually due to 'struct U2' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U3 {
+  char a;
+  struct T1 b __attribute__((aligned(4)));
+  int c;
+};
+
+struct __attribute__((aligned(2))) U4 {
+  char a;
+  struct T1 b;
+  int c;
+};
+
+struct U5 {
+  char a;
+  struct T1 b;
+  int c;
+};
+
+struct U6 {
+  char a;
+  int b;
+  struct T1 c __attribute__((aligned(2)));
+};
+
+struct __attribute__((packed)) U7 {
+  short a;
+  short b;
+  char c;
+  struct T1 d; // expected-warning {{field d within 'struct U7' is less aligned than 'struct T1' and is usually due to 'struct U7' being packed, which can lead to unaligned accesses}}
+};
+
+struct U8 {
+  short a;
+  short b;
+  char c;
+  struct T1 d;
+};
+
+struct __attribute__((packed)) U9 {
+  short a;
+  short b;
+  char c;
+  struct T1 d __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) U10 {
+  short a;
+  short b;
+  char c;
+  struct T1 d __attribute__((aligned(2))); // expected-warning {{field d within 'struct U10' is less aligned than 'struct T1' and is usually due to 'struct U10' being packed, which can lead to unaligned accesses}}
+};
+
+struct __attribute__((aligned(2))) U11 {
+  short a;
+  short b;
+  char c;
+  struct T1 d;
+};
+
+// Set 2
+#pragma pack(push, 1)
+
+struct U12 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U12' is less aligned than 'struct T1' and is usually due to 'struct U12' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U13 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U13' is less aligned than 'struct T1' and is usually due to 'struct U13' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U14 {
+  char a;
+  struct T1 b __attribute__((aligned(4))); // expected-warning {{field b within 'struct U14' is less aligned than 'struct T1' and is usually due to 'struct U14' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((aligned(2))) U15 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U15' is less aligned than 'struct T1' and is usually due to 'struct U15' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct U16 {
+  char a;
+  char b;
+  short c;
+  struct T1 d;
+};
+
+struct U17 {
+  char a;
+  char b;
+  short c;
+  struct T1 d __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) U18 {
+  char a;
+  short b;
+  struct T1 c __attribute__((aligned(4))); // expected-warning {{field c within 'struct U18' is less aligned than 'struct T1' and is usually due to 'struct U18' being packed, which can lead to unaligned accesses}}
+};
+
+struct __attribute__((aligned(4))) U19 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U19' is less aligned than 'struct T1' and is usually due to 'struct U19' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((aligned(4))) U20 {
+  char a[4];
+  struct T1 b;
+  int c;
+};
+
+struct U21 {
+  char a;
+  short c;
+  struct T1 d; // expected-warning {{field d within 'struct U21' is less aligned than 'struct T1' and is usually due to 'struct U21' being packed, which can lead to unaligned accesses}}
+};
+
+struct U22 {
+  char a;
+  short c;
+  struct T1 d __attribute__((aligned(4))); // expected-warning {{field d within 'struct U22' is less aligned than 'struct T1' and is usually due to 'struct U22' being packed, which can lead to unaligned accesses}}
+};
+
+#pragma pack(pop)
+
+// Set 3
+#pragma pack(push, 2)
+
+struct __attribute__((packed)) U23 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U23' is less aligned than 'struct T1' and is usually due to 'struct U23' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct U24 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct U24' is less aligned than 'struct T1' and is usually due to 'struct U24' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct U25 {
+  char a;
+  char b;
+  short c;
+  struct T1 d;
+};
+
+struct U26 {
+  char a;
+  char b;
+  short c;
+  struct T1 d;
+};
+
+#pragma pack(pop)
+
+// Set 4
+
+struct __attribute__((packed)) T2 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct T2' is less aligned than 'struct T1' and is usually due to 'struct T2' being packed, which can lead to unaligned accesses}}
+};
+
+struct T3 {
+  char a;
+  struct T1 b;
+};
+
+struct __attribute__((packed)) U27 {
+  char a;
+  struct T2 b;
+  int c;
+};
+
+struct U28 {
+  char a;
+  char _p[2];
+  struct T2 b;
+  int c;
+};
+
+struct U29 {
+  char a;
+  struct T3 b;
+  int c;
+};
+
+struct __attribute__((packed)) U30 {
+  char a;
+  struct T3 b; // expected-warning {{field b within 'struct U30' is less aligned than 'struct T3' and is usually due to 'struct U30' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U31 {
+  char a;
+  struct T2 b __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) U32 {
+  char a;
+  char b;
+  char c;
+  char d;
+  struct T3 e;
+};
+
+struct __attribute__((packed)) U33 {
+  char a;
+  char b;
+  char c;
+  char d;
+  struct T2 e __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) U34 {
+  char a;
+  struct T1 b __attribute__((packed)); // expected-warning {{field b within 'struct U34' is less aligned than 'struct T1' and is usually due to 'struct U34' being packed, which can lead to unaligned accesses}}
+  struct T2 c;
+};
+
+struct __attribute__((packed)) U35 {
+  char a;
+  struct T4 {
+    char b;
+    struct T1 c;
+  } d; // expected-warning {{field d within 'struct U35' is less aligned than 'struct T4' and is usually due to 'struct U35' being packed, which can lead to unaligned accesses}}
+};
+
+// Set 5
+
+#pragma pack(push, 1)
+struct T5 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct T5' is less aligned than 'struct T1' and is usually due to 'struct T5' being packed, which can lead to unaligned accesses}}
+};
+#pragma pack(pop)
+
+#pragma pack(push, 1)
+struct U36 {
+  char a;
+  struct T5 b;
+  int c;
+};
+
+struct U37 {
+  char a;
+  struct T3 b; // expected-warning {{field b within 'struct U37' is less aligned than 'struct T3' and is usually due to 'struct U37' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+#pragma pack(pop)
+struct U38 {
+  char a;
+  struct T5 b __attribute__((aligned(4)));
+  int c;
+};
+
+#pragma pack(push, 1)
+
+#pragma pack(push, 4)
+struct U39 {
+  char a;
+  struct T5 b;
+  int c;
+};
+#pragma pack(pop)
+
+#pragma pack(pop)
+
+// Set 6
+
+struct __attribute__((packed)) A1 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct A1' is less aligned than 'struct T1' and is usually due to 'struct A1' being packed, which can lead to unaligned accesses}}
+};
+
+struct A2 {
+  char a;
+  struct T1 b;
+};
+
+struct __attribute__((packed)) A3 {
+  char a;
+  struct T1 b __attribute__((aligned(4)));
+};
+
+#pragma pack(push, 1)
+struct A4 {
+  char a;
+  struct T1 b; // expected-warning {{field b within 'struct A4' is less aligned than 'struct T1' and is usually due to 'struct A4' being packed, which can lead to unaligned accesses}}
+};
+
+struct A5 {
+  char a;
+  struct T1 b __attribute__((aligned(4))); // expected-warning {{field b within 'struct A5' is less aligned than 'struct T1' and is usually due to 'struct A5' being packed, which can lead to unaligned accesses}}
+};
+#pragma pack(pop)
+
+struct __attribute__((packed)) A6 {
+  struct T1 a;
+};
+
+struct A7 {
+  char a;
+  struct T1 b __attribute__((packed));
+};
+
+struct A8 {
+  char a;
+  char b;
+  short c;
+  struct T1 d;
+};
+
+struct A9 {
+  char a;
+  struct T2 b;
+};
+
+struct A10 {
+  char a;
+  struct T2 b __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) A11 {
+  char a;
+  struct T2 b;
+};
+
+struct __attribute__((packed)) U40 {
+  char a;
+  struct A1 b;
+  int c;
+};
+
+struct __attribute__((packed)) U41 {
+  char a;
+  struct A3 b; // expected-warning {{field b within 'struct U41' is less aligned than 'struct A3' and is usually due to 'struct U41' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+#pragma pack(push, 1)
+struct U42 {
+  char a;
+  struct A1 b;
+  int c;
+};
+#pragma pack(pop)
+
+struct __attribute__((packed)) U43 {
+  char a;
+  struct A9 b;
+  int c;
+};
+
+struct __attribute__((packed)) U44 {
+  char a;
+  struct A10 b; // expected-warning {{field b within 'struct U44' is less aligned than 'struct A10' and is usually due to 'struct U44' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+#pragma pack(push, 1)
+
+struct U45 {
+  char a;
+  struct A10 b; // expected-warning {{field b within 'struct U45' is less aligned than 'struct A10' and is usually due to 'struct U45' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+#pragma pack(pop)
+
+struct __attribute__((packed)) U46 {
+  char a;
+  struct A2 b; // expected-warning {{field b within 'struct U46' is less aligned than 'struct A2' and is usually due to 'struct U46' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U47 {
+  char a;
+  struct A8 b; // expected-warning {{field b within 'struct U47' is less aligned than 'struct A8' and is usually due to 'struct U47' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+#pragma pack(push, 1)
+struct U48 {
+  char a;
+  struct A8 b; // expected-warning {{field b within 'struct U48' is less aligned than 'struct A8' and is usually due to 'struct U48' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+#pragma pack(pop)
+
+struct U49 {
+  char a;
+  struct A11 b;
+  int c;
+};
+
+struct U50 {
+  char a;
+  struct A1 b;
+  int c;
+};
+
+struct U51 {
+  char a;
+  struct A5 b;
+  int c;
+};
+
+struct __attribute__((packed)) U52 {
+  char a;
+  struct A6 b;
+};
+
+struct U53 {
+  char a;
+  struct A4 b;
+};
+
+struct U54 {
+  char b;
+  struct A7 c;
+};
+
+struct U1 s1;
+struct U2 s2;
+struct U3 s3;
+struct U4 s4;
+struct U5 s5;
+struct U6 s6;
+struct U7 s7;
+struct U8 s8;
+struct U9 s9;
+struct U10 s10;
+struct U11 s11;
+struct U12 s12;
+struct U13 s13;
+struct U14 s14;
+struct U15 s15;
+struct U16 s16;
+struct U17 s17;
+struct U18 s18;
+struct U19 s19;
+struct U20 s20;
+struct U21 s21;
+struct U22 s22;
+struct U23 s23;
+struct U24 s24;
+struct U25 s25;
+struct U26 s26;
+struct U27 s27;
+struct U28 s28;
+struct U29 s29;
+struct U30 s30;
+struct U31 s31;
+struct U32 s32;
+struct U33 s33;
+struct U34 s34;
+struct U35 s35;
+struct U36 s36;
+struct U37 s37;
+struct U38 s38;
+struct U39 s39;
+struct U40 s40;
+struct U41 s41;
+struct U42 s42;
+struct U43 s43;
+struct U44 s44;
+struct U45 s45;
+struct U46 s46;
+struct U47 s47;
+struct U48 s48;
+struct U49 s49;
+struct U50 s50;
+struct U51 s51;
+struct U52 s52;
+struct U53 s53;
+struct U54 s54;
diff --git a/clang/test/Sema/test-wunaligned-access.cpp b/clang/test/Sema/test-wunaligned-access.cpp
new file mode 100644
index 000000000000..33f518310b0b
--- /dev/null
+++ b/clang/test/Sema/test-wunaligned-access.cpp
@@ -0,0 +1,274 @@
+// RUN: %clang_cc1 %s -triple=armv7-none-none-eabi -verify -Wunaligned-access -S -emit-llvm -o %t
+// REQUIRES: arm-registered-target
+//
+// This test suite tests the warning triggered by the -Wunaligned-access option.
+// The warning occurs when a struct or other type of record contains a field
+// that is itself a record. The outer record must be a packed structure, while
+// while the inner record must be unpacked. This is the fundamental condition
+// for the warning to be triggered. Some of these tests may have three layers.
+//
+// The command line option -fsyntax-only is not used as Clang needs to be
+// forced to layout the structs used in this test.
+// The triple in the command line above is used for the assumptions about
+// size and alignment of types.
+
+// Packed-Unpacked Tests (No Pragma)
+
+struct T1 {
+  char a;
+  int b;
+};
+
+struct __attribute__((packed)) U1 {
+  char a;
+  T1 b; // expected-warning {{field b within 'U1' is less aligned than 'T1' and is usually due to 'U1' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U2 {
+  char a;
+  T1 b __attribute__((aligned(4)));
+  int c;
+};
+
+struct __attribute__((packed)) U3 {
+  char a;
+  char b;
+  short c;
+  T1 d;
+};
+
+struct __attribute__((packed)) U4 {
+  T1 a;
+  int b;
+};
+
+struct __attribute__((aligned(4), packed)) U5 {
+  char a;
+  T1 b; // expected-warning {{field b within 'U5' is less aligned than 'T1' and is usually due to 'U5' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((aligned(4), packed)) U6 {
+  char a;
+  char b;
+  short c;
+  T1 d;
+};
+
+// Packed-Unpacked Tests with Pragma
+
+#pragma pack(push, 1)
+
+struct __attribute__((packed)) U7 {
+  char a;
+  T1 b; // expected-warning {{field b within 'U7' is less aligned than 'T1' and is usually due to 'U7' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((packed)) U8 {
+  char a;
+  T1 b __attribute__((aligned(4))); // expected-warning {{field b within 'U8' is less aligned than 'T1' and is usually due to 'U8' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct __attribute__((aligned(4))) U9 {
+  char a;
+  T1 b; // expected-warning {{field b within 'U9' is less aligned than 'T1' and is usually due to 'U9' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct U10 {
+  char a;
+  T1 b; // expected-warning {{field b within 'U10' is less aligned than 'T1' and is usually due to 'U10' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+#pragma pack(pop)
+
+// Packed-Packed Tests
+
+struct __attribute__((packed)) T2 {
+  char a;
+  int b;
+};
+
+struct __attribute__((packed)) U11 {
+  char a;
+  T2 b;
+  int c;
+};
+
+#pragma pack(push, 1)
+struct U12 {
+  char a;
+  T2 b;
+  int c;
+};
+#pragma pack(pop)
+
+// Unpacked-Packed Tests
+
+struct U13 {
+  char a;
+  T2 b;
+  int c;
+};
+
+struct U14 {
+  char a;
+  T2 b __attribute__((aligned(4)));
+  int c;
+};
+
+// Unpacked-Unpacked Test
+
+struct T3 {
+  char a;
+  int b;
+};
+
+struct U15 {
+  char a;
+  T3 b;
+  int c;
+};
+
+// Packed-Packed-Unpacked Test (No pragma)
+
+struct __attribute__((packed)) A1 {
+  char a;
+  T1 b; // expected-warning {{field b within 'A1' is less aligned than 'T1' and is usually due to 'A1' being packed, which can lead to unaligned accesses}}
+};
+
+struct __attribute__((packed)) U16 {
+  char a;
+  A1 b;
+  int c;
+};
+
+struct __attribute__((packed)) A2 {
+  char a;
+  T1 b __attribute__((aligned(4)));
+};
+
+struct __attribute__((packed)) U17 {
+  char a;
+  A2 b; // expected-warning {{field b within 'U17' is less aligned than 'A2' and is usually due to 'U17' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+// Packed-Unpacked-Packed tests
+
+struct A3 {
+  char a;
+  T2 b;
+};
+
+struct __attribute__((packed)) U18 {
+  char a;
+  A3 b;
+  int c;
+};
+
+struct A4 {
+  char a;
+  T2 b;
+  int c;
+};
+
+#pragma pack(push, 1)
+struct U19 {
+  char a;
+  A4 b; // expected-warning {{field b within 'U19' is less aligned than 'A4' and is usually due to 'U19' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+#pragma pack(pop)
+
+// Packed-Unpacked-Unpacked tests
+
+struct A5 {
+  char a;
+  T1 b;
+};
+
+struct __attribute__((packed)) U20 {
+  char a;
+  A5 b; // expected-warning {{field b within 'U20' is less aligned than 'A5' and is usually due to 'U20' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+
+struct A6 {
+  char a;
+  T1 b;
+};
+
+#pragma pack(push, 1)
+struct U21 {
+  char a;
+  A6 b; // expected-warning {{field b within 'U21' is less aligned than 'A6' and is usually due to 'U21' being packed, which can lead to unaligned accesses}}
+  int c;
+};
+#pragma pack(pop)
+
+// Unpacked-Packed-Packed test
+
+struct __attribute__((packed)) A7 {
+  char a;
+  T2 b;
+};
+
+struct U22 {
+  char a;
+  A7 b;
+  int c;
+};
+
+// Unpacked-Packed-Unpacked tests
+
+struct __attribute__((packed)) A8 {
+  char a;
+  T1 b; // expected-warning {{field b within 'A8' is less aligned than 'T1' and is usually due to 'A8' being packed, which can lead to unaligned accesses}}
+};
+
+struct U23 {
+  char a;
+  A8 b;
+  int c;
+};
+
+struct __attribute__((packed)) A9 {
+  char a;
+  T1 b __attribute__((aligned(4)));
+};
+
+struct U24 {
+  char a;
+  A9 b;
+  int c;
+};
+
+struct U1 s1;
+struct U2 s2;
+struct U3 s3;
+struct U4 s4;
+struct U5 s5;
+struct U6 s6;
+struct U7 s7;
+struct U8 s8;
+struct U9 s9;
+struct U10 s10;
+struct U11 s11;
+struct U12 s12;
+struct U13 s13;
+struct U14 s14;
+struct U15 s15;
+struct U16 s16;
+struct U17 s17;
+struct U18 s18;
+struct U19 s19;
+struct U20 s20;
+struct U21 s21;
</cut>
------=_Part_14606_1851058197.1642854713092--
