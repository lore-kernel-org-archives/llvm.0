Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D622C89
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 23:32:00 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t8so2851804wri.1
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 16:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:date:to:cc:message-id:subject:mime-version;
        bh=kWHwBV0mZH3gMWQkGZG3BQi/9fnrrXlBzH09cCVAIfE=;
        b=kvGh73FdIaehLVr+mFjva/F5LVDMM0AfHOQyy1bZ5bosVm78rNlF/lOy7H1xodC2+L
         lFJxO6bauRn5mCt+yMQBJC2iqVoeXXf6lAZRHW6uXx/37PqF0sCU2aho/1RS2297whyj
         P9S+xxtIvssA+BiLTllqe06Ja2nLJUkEepXNtBP53E8GYeXtc+i3y/dRmxerd7GoTY5Y
         eHYJw2ff9X4k3SR+0yHMFDNi6OvD37dUFiSH0zANzIfpztEZHXTtbexHWzSyY34y6a+J
         O8Fp6ty0H5W3vGNwJtG19hODsrvKul48/lMNLmApUbweXABHUl/HPLHxstQ0UR5a/lbO
         E2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:message-id:subject:mime-version;
        bh=kWHwBV0mZH3gMWQkGZG3BQi/9fnrrXlBzH09cCVAIfE=;
        b=u3g5B3lhy+YR+WZuEmbmYGmE9/kqlxWgsMpUBsMtI2MpSeyBbQcfZ9xrtLZQllbzxU
         Qi2VHDDPyH7To8pfckOtXkbuBFe7kPPIkRM6fkJJAUqlGo6SFqMxZCmPd6WUHZWrSfid
         q6rpjzHuRBH8SzkbAEUWsnTB08WNXJesoFADXboqrfYtMJyasMTGR3AVJMafqtQAXc5b
         LT8/F+MptbzVZHNRD1DIvZoSVbsUYyaDx4zKfBMcrGhwno2i6DgdeFQcKs+XjdHDopE6
         9IR1Y3tNaj+mVrnkHthuEx0BjDDMaJ7DwYy9cNEf4vwvUL0AfNvpJEV4H5nPfZHRGs/9
         Ws/A==
X-Gm-Message-State: AOAM531KdeoQIMh7mJPPPGmw8jBgEs4SsnVPYaEshDiOXmNAGTVEtYTy
	fJpTn9VKHWWbfG+Kjko+aJyIRg==
X-Google-Smtp-Source: ABdhPJx19YFrRYoVpdMV7cSISc03Q1GdkSCPfYJiNTVJznj8zkSr3WIMb6w07M76qObTjVY1WotSPw==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr6696200wmj.194.1633476718277;
        Tue, 05 Oct 2021 16:31:58 -0700 (PDT)
Received: from 172.17.0.5 (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id f123sm3394424wmf.30.2021.10.05.16.31.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Oct 2021 16:31:57 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Tue, 5 Oct 2021 23:31:56 +0000 (UTC)
To: =?UTF-8?Q?D=C3=A1vid_Bolvansk=C3=BD?= <david.bolvansky@gmail.com>
Cc: llvm@lists.linux.dev
Message-ID: <114622188.9317.1633476717934@localhost>
Subject: [TCWG CI] Regression caused by llvm: Reland "[Clang] Extend
 -Wbool-operation to warn about bitwise and of bools with side effects"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9316_443449933.1633476717022"
X-Jenkins-Job: TCWG Bisect tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS

------=_Part_9316_443449933.1633476717022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[TCWG CI] Regression caused by llvm: Reland "[Clang] Extend -Wbool-operatio=
n to warn about bitwise and of bools with side effects":
commit f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
Author: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>

    Reland "[Clang] Extend -Wbool-operation to warn about bitwise and of bo=
ols with side effects"

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
19948
# First few build errors in logs:
# 00:02:06 kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is u=
sed uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-unin=
itialized]
# 00:02:07 make[2]: *** [scripts/Makefile.build:288: kernel/locking/test-ww=
_mutex.o] Error 1
# 00:02:13 make[1]: *** [scripts/Makefile.build:571: kernel/locking] Error =
2
# 00:03:49 kernel/trace/trace_events_hist.c:4723:13: error: stack frame siz=
e (1400) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werror=
,-Wframe-larger-than]
# 00:03:52 make[2]: *** [scripts/Makefile.build:288: kernel/trace/trace_eve=
nts_hist.o] Error 1
# 00:04:04 arch/arm/lib/xor-neon.c:30:2: error: This code requires at least=
 version 4.6 of GCC [-Werror,-W#warnings]
# 00:04:04 make[1]: *** [scripts/Makefile.build:288: arch/arm/lib/xor-neon.=
o] Error 1
# 00:04:04 make: *** [Makefile:2034: arch/arm/lib] Error 2
# 00:04:05 crypto/wp512.c:782:13: error: stack frame size (1176) exceeds li=
mit (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
# 00:04:05 make[1]: *** [scripts/Makefile.build:288: crypto/wp512.o] Error =
1

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
19952

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCT=
ION INSTRUCTIONS, AND THE RAW COMMIT.

This commit has regressed these CI configurations:
 - tcwg_kernel/llvm-master-arm-next-allyesconfig

First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-mas=
ter-arm-next-allyesconfig/13/artifact/artifacts/build-f59cc9542bfb461d16ad1=
2b2cc4be4abbfd9d96e/
Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-mas=
ter-arm-next-allyesconfig/13/artifact/artifacts/build-b1fcca38844138d1950e1=
b34eb2be65b3bfc7352/
Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-mast=
er-arm-next-allyesconfig/13/artifact/artifacts/build-baseline/
Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-m=
aster-arm-next-allyesconfig/13/artifact/artifacts/

Reproduce builds:
<cut>
mkdir investigate-llvm-f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
cd investigate-llvm-f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests and test.sh script
mkdir -p artifacts/manifests
curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcw=
g_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/13/artifact/artifact=
s/manifests/build-baseline.sh --fail
curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/t=
cwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/13/artifact/artifa=
cts/manifests/build-parameters.sh --fail
curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect=
-llvm-master-arm-next-allyesconfig/13/artifact/artifacts/test.sh --fail
chmod +x artifacts/test.sh

# Reproduce the baseline build (build all pre-requisites)
./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baselin=
e.sh

# Save baseline build state (which is then restored in artifacts/test.sh)
mkdir -p ./bisect
rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ -=
-exclude /llvm/ ./ ./bisect/baseline/

cd llvm

# Reproduce first_bad build
git checkout --detach f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
../artifacts/test.sh

# Reproduce last_good build
git checkout --detach b1fcca38844138d1950e1b34eb2be65b3bfc7352
../artifacts/test.sh

cd ..
</cut>

Full commit (up to 1000 lines):
<cut>
commit f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
Author: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
Date:   Sun Oct 3 13:05:09 2021 +0200

    Reland "[Clang] Extend -Wbool-operation to warn about bitwise and of bo=
ols with side effects"
   =20
    This reverts commit a4933f57f3f0a45e1db1075f7285f0761a80fc06. New warni=
ngs were fixed.
---
 clang/include/clang/Basic/DiagnosticGroups.td    |  3 +-
 clang/include/clang/Basic/DiagnosticSemaKinds.td |  4 ++
 clang/lib/Sema/SemaChecking.cpp                  | 14 ++++++
 clang/test/Misc/warning-wall.c                   |  1 +
 clang/test/Sema/warn-bitwise-and-bool.c          | 63 ++++++++++++++++++++=
++++
 clang/test/Sema/warn-bitwise-or-bool.c           | 63 ++++++++++++++++++++=
++++
 6 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/clang/include/clang/Basic/DiagnosticGroups.td b/clang/include/=
clang/Basic/DiagnosticGroups.td
index 761b323d0616..d9db3482dbda 100644
--- a/clang/include/clang/Basic/DiagnosticGroups.td
+++ b/clang/include/clang/Basic/DiagnosticGroups.td
@@ -64,7 +64,8 @@ def StringConversion : DiagGroup<"string-conversion">;
 def SignConversion : DiagGroup<"sign-conversion">;
 def PointerBoolConversion : DiagGroup<"pointer-bool-conversion">;
 def UndefinedBoolConversion : DiagGroup<"undefined-bool-conversion">;
-def BoolOperation : DiagGroup<"bool-operation">;
+def BitwiseInsteadOfLogical : DiagGroup<"bitwise-instead-of-logical">;
+def BoolOperation : DiagGroup<"bool-operation", [BitwiseInsteadOfLogical]>=
;
 def BoolConversion : DiagGroup<"bool-conversion", [PointerBoolConversion,
                                                    UndefinedBoolConversion=
]>;
 def IntConversion : DiagGroup<"int-conversion">;
diff --git a/clang/include/clang/Basic/DiagnosticSemaKinds.td b/clang/inclu=
de/clang/Basic/DiagnosticSemaKinds.td
index 1d4ea92c6520..c71a00b18432 100644
--- a/clang/include/clang/Basic/DiagnosticSemaKinds.td
+++ b/clang/include/clang/Basic/DiagnosticSemaKinds.td
@@ -66,6 +66,7 @@ def warn_infinite_recursive_function : Warning<
 def warn_comma_operator : Warning<"possible misuse of comma operator here"=
>,
   InGroup<DiagGroup<"comma">>, DefaultIgnore;
 def note_cast_to_void : Note<"cast expression to void to silence warning">=
;
+def note_cast_operand_to_int : Note<"cast one or both operands to int to s=
ilence this warning">;
=20
 // Constant expressions
 def err_expr_not_ice : Error<
@@ -7423,6 +7424,9 @@ def note_member_declared_here : Note<
   "member %0 declared here">;
 def note_member_first_declared_here : Note<
   "member %0 first declared here">;
+def warn_bitwise_instead_of_logical : Warning<
+  "use of bitwise '%0' with boolean operands">,
+  InGroup<BitwiseInsteadOfLogical>, DefaultIgnore;
 def warn_bitwise_negation_bool : Warning<
   "bitwise negation of a boolean expression%select{;| always evaluates to =
'true';}0 "
   "did you mean logical negation?">,
diff --git a/clang/lib/Sema/SemaChecking.cpp b/clang/lib/Sema/SemaChecking.=
cpp
index 615ba1aef8e6..bdd9fb495da2 100644
--- a/clang/lib/Sema/SemaChecking.cpp
+++ b/clang/lib/Sema/SemaChecking.cpp
@@ -13249,6 +13249,20 @@ static void AnalyzeImplicitConversions(
           << OrigE->getSourceRange() << T->isBooleanType()
           << FixItHint::CreateReplacement(UO->getBeginLoc(), "!");
=20
+  if (const auto *BO =3D dyn_cast<BinaryOperator>(SourceExpr))
+    if ((BO->getOpcode() =3D=3D BO_And || BO->getOpcode() =3D=3D BO_Or) &&
+        BO->getLHS()->isKnownToHaveBooleanValue() &&
+        BO->getRHS()->isKnownToHaveBooleanValue() &&
+        BO->getLHS()->HasSideEffects(S.Context) &&
+        BO->getRHS()->HasSideEffects(S.Context)) {
+      S.Diag(BO->getBeginLoc(), diag::warn_bitwise_instead_of_logical)
+          << (BO->getOpcode() =3D=3D BO_And ? "&" : "|") << OrigE->getSour=
ceRange()
+          << FixItHint::CreateReplacement(
+                 BO->getOperatorLoc(),
+                 (BO->getOpcode() =3D=3D BO_And ? "&&" : "||"));
+      S.Diag(BO->getBeginLoc(), diag::note_cast_operand_to_int);
+    }
+
   // For conditional operators, we analyze the arguments as if they
   // were being fed directly into the output.
   if (auto *CO =3D dyn_cast<AbstractConditionalOperator>(SourceExpr)) {
diff --git a/clang/test/Misc/warning-wall.c b/clang/test/Misc/warning-wall.=
c
index a3686fb96a4c..a4a79bec934a 100644
--- a/clang/test/Misc/warning-wall.c
+++ b/clang/test/Misc/warning-wall.c
@@ -4,6 +4,7 @@ RUN: FileCheck --input-file=3D%t %s
      CHECK:-Wall
 CHECK-NEXT:  -Wmost
 CHECK-NEXT:    -Wbool-operation
+CHECK-NEXT:    -Wbitwise-instead-of-logical
 CHECK-NEXT:    -Wchar-subscripts
 CHECK-NEXT:    -Wcomment
 CHECK-NEXT:    -Wdelete-non-virtual-dtor
diff --git a/clang/test/Sema/warn-bitwise-and-bool.c b/clang/test/Sema/warn=
-bitwise-and-bool.c
new file mode 100644
index 000000000000..6bec1be1abde
--- /dev/null
+++ b/clang/test/Sema/warn-bitwise-and-bool.c
@@ -0,0 +1,63 @@
+// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wbool-operation %s
+// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wall %s
+// RUN: %clang_cc1 -x c -fsyntax-only -Wbitwise-instead-of-logical -fdiagn=
ostics-parseable-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c -fsyntax-only -Wbool-operation -fdiagnostics-parse=
able-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wbool-operation %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wall %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbitwise-instead-of-logical -fdia=
gnostics-parseable-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbool-operation -fdiagnostics-par=
seable-fixits %s 2>&1 | FileCheck %s
+
+#ifdef __cplusplus
+typedef bool boolean;
+#else
+typedef _Bool boolean;
+#endif
+
+boolean foo(void);
+boolean bar(void);
+boolean baz(void) __attribute__((const));
+void sink(boolean);
+
+#define FOO foo()
+
+void test(boolean a, boolean b, int *p, volatile int *q, int i) {
+  b =3D a & b;
+  b =3D foo() & a;
+  b =3D (p !=3D 0) & (*p =3D=3D 42);   // FIXME: also warn for a non-volat=
ile pointer dereference
+  b =3D foo() & (*q =3D=3D 42);      // expected-warning {{use of bitwise =
'&' with boolean operands}}
+                               // expected-note@-1 {{cast one or both oper=
ands to int to silence this warning}}
+  b =3D foo() & (int)(*q =3D=3D 42); // OK, no warning expected
+  b =3D a & foo();
+  b =3D (int)a & foo();     // OK, no warning expected
+  b =3D foo() & bar();      // expected-warning {{use of bitwise '&' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"&&"
+  b =3D foo() & (int)bar(); // OK, no warning expected
+  b =3D foo() & !bar();     // expected-warning {{use of bitwise '&' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"&&"
+  b =3D a & baz();
+  b =3D bar() & FOO;        // expected-warning {{use of bitwise '&' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"&&"
+  b =3D foo() & (int)FOO;   // OK, no warning expected
+  b =3D b & foo();
+  b =3D bar() & (i > 4);
+  b =3D (i =3D=3D 7) & foo();
+#ifdef __cplusplus
+  b =3D foo() bitand bar(); // expected-warning {{use of bitwise '&' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+#endif
+
+  if (foo() & bar())      // expected-warning {{use of bitwise '&' with bo=
olean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+    ;
+
+  sink(a & b);
+  sink(a & foo());
+  sink(foo() & bar());    // expected-warning {{use of bitwise '&' with bo=
olean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+
+  int n =3D i + 10;
+  b =3D (n & (n - 1));
+}
diff --git a/clang/test/Sema/warn-bitwise-or-bool.c b/clang/test/Sema/warn-=
bitwise-or-bool.c
new file mode 100644
index 000000000000..ae86790901aa
--- /dev/null
+++ b/clang/test/Sema/warn-bitwise-or-bool.c
@@ -0,0 +1,63 @@
+// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wbool-operation %s
+// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wall %s
+// RUN: %clang_cc1 -x c -fsyntax-only -Wbitwise-instead-of-logical -fdiagn=
ostics-parseable-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c -fsyntax-only -Wbool-operation -fdiagnostics-parse=
able-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wbool-operation %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wall %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbitwise-instead-of-logical -fdia=
gnostics-parseable-fixits %s 2>&1 | FileCheck %s
+// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbool-operation -fdiagnostics-par=
seable-fixits %s 2>&1 | FileCheck %s
+
+#ifdef __cplusplus
+typedef bool boolean;
+#else
+typedef _Bool boolean;
+#endif
+
+boolean foo(void);
+boolean bar(void);
+boolean baz(void) __attribute__((const));
+void sink(boolean);
+
+#define FOO foo()
+
+void test(boolean a, boolean b, int *p, volatile int *q, int i) {
+  b =3D a | b;
+  b =3D foo() | a;
+  b =3D (p !=3D 0) | (*p =3D=3D 42);   // FIXME: also warn for a non-volat=
ile pointer dereference
+  b =3D foo() | (*q =3D=3D 42);      // expected-warning {{use of bitwise =
'|' with boolean operands}}
+                               // expected-note@-1 {{cast one or both oper=
ands to int to silence this warning}}
+  b =3D foo() | (int)(*q =3D=3D 42); // OK, no warning expected
+  b =3D a | foo();
+  b =3D (int)a | foo();     // OK, no warning expected
+  b =3D foo() | bar();      // expected-warning {{use of bitwise '|' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"||"
+  b =3D foo() | !bar();     // expected-warning {{use of bitwise '|' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"||"
+  b =3D foo() | (int)bar(); // OK, no warning expected
+  b =3D a | baz();
+  b =3D bar() | FOO;        // expected-warning {{use of bitwise '|' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@LIN=
E-2]]:14}:"||"
+  b =3D foo() | (int)FOO;   // OK, no warning expected
+  b =3D b | foo();
+  b =3D bar() | (i > 4);
+  b =3D (i =3D=3D 7) | foo();
+#ifdef __cplusplus
+  b =3D foo() bitor bar();  // expected-warning {{use of bitwise '|' with =
boolean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+#endif
+
+  if (foo() | bar())      // expected-warning {{use of bitwise '|' with bo=
olean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+    ;
+
+  sink(a | b);
+  sink(a | foo());
+  sink(foo() | bar());    // expected-warning {{use of bitwise '|' with bo=
olean operands}}
+                          // expected-note@-1 {{cast one or both operands =
to int to silence this warning}}
+
+  int n =3D i + 10;
+  b =3D (n | (n - 1));
+}
</cut>
------=_Part_9316_443449933.1633476717022--
