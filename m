Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDF7F
	for <llvm@lists.linux.dev>; Mon, 26 Sep 2022 00:57:20 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so2920518wmb.0
        for <llvm@lists.linux.dev>; Sun, 25 Sep 2022 17:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date;
        bh=sN7cVd/7q7XYh0ebP4b1n2DIh6Za890ugLCNOuWzzbc=;
        b=DkGtcjacHXYTivHUiJMlhQ65hcezNbG6/wLzHr8BCw0c/g20uLQFRHWa3W+GfU569R
         vdRNP/ipjJi2AhJFcYyTLiUVjpIccldk3OHUtWDPYUHPtHeeBoIaBAqbBN6oC43fg+z4
         p+YdzozkkZtmeAYzKCD0ST7CXkL26Vr+9PP34Qo9rJkD1ddBTtNQ891gyNj2ZbXS++2A
         T8xrUUP3iiYxDr31qJ0wYZgV0yv9QsL5surHs0UkOsJfOMN/EOZuEcxjgsP8wkNsez2W
         VhbrqpYK5doZDU71x2bk7bpocT+Xg7dimuiq9pQ6Ao7/r8/CNKQs5vHnNDZPadTddmO0
         dTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sN7cVd/7q7XYh0ebP4b1n2DIh6Za890ugLCNOuWzzbc=;
        b=EfuUHRt71uF9eSirUb16CE3zmyU055aPIZ2Qxp9t4J/CQsGvdsiq5o4FDlivOq9W8m
         p4DnkOZI8gQdMQ8uen1w9KEUSoHOmw9aOxAzz6R6S7MYa0NCT/xY9ykEN2SIZeRqUXpV
         Q1Md/nU9CIAq5nTdwqWDQ0pCj/L708Wm+OI1nJ4SDVooeKfjFO1Y+v2Sc9YVsUN/Nf55
         52tTq5co5DFkOoApO5cTY1jYjzT8/NWGqg9TuzlBnzkk468Li3mxpFiqKJvEqKqGGFbP
         aE7P5r4SxeeWQ6aV9yhx5ZQd1HWtAHmTj48PjXc0bryCNn85yoOctOROGd8MLgYqKZXL
         Ihfg==
X-Gm-Message-State: ACrzQf1c1Nf4VrvCgHkwDGdMOdaNRCtRP5Wt2JI6bacCRoERgAJqntMy
	09zLnTV/s6fUl3yFb5FbWf1mjA==
X-Google-Smtp-Source: AMsMyM5eHArsHHDCJM+77lHmDyCB1K/SZFXLDffGyj7SPrdCeocTjv1OstTOaR/IxNerJU6zxmVWjA==
X-Received: by 2002:a7b:ce97:0:b0:3b3:4136:59fe with SMTP id q23-20020a7bce97000000b003b3413659femr13365697wmj.24.1664153838453;
        Sun, 25 Sep 2022 17:57:18 -0700 (PDT)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id h2-20020adffa82000000b0022584c82c80sm12720961wrr.19.2022.09.25.17.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 17:57:18 -0700 (PDT)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Mon, 26 Sep 2022 00:57:17 +0000 (UTC)
To: Jun Zhang <jun@junz.org>
Cc: llvm@lists.linux.dev
Message-ID: <209856189.2185.1664153838005@jenkins.jenkins>
Subject: [TCWG CI] Failure after llvmorg-16-init-5673-ge07ead85a368: [Clang]
 Warn when trying to dereference void pointers in C
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2184_258605986.1664153837410"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-stable-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_2184_258605986.1664153837410
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after llvmorg-16-init-5673-ge07ead85a368: [Clang] Warn when trying to dereference void pointers in C:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
36
# First few build errors in logs:
# 00:00:50 ./include/linux/fortify-string.h:159:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
# 00:00:50 ./include/linux/fortify-string.h:232:10: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
# 00:00:50 ./include/linux/fortify-string.h:470:9: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
# 00:00:50 ./include/linux/string.h:315:15: error: ISO C does not allow indirection on operand of type 'void *' [-Werror,-Wvoid-ptr-dereference]
# 00:00:50 make[1]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1
# 00:00:52 make: *** [Makefile:1203: prepare0] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
22763

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
Status of llvmorg-16-init-5673-ge07ead85a368 commit for tcwg_kernel:
commit e07ead85a368173a56e96a21d6841aa497ad80f8
Author: Jun Zhang <jun@junz.org>
Date:   Sat Sep 24 22:18:04 2022 +0800

    [Clang] Warn when trying to dereference void pointers in C
    
    Previously we only have an extension that warn void pointer deferencing
    in C++, but for C we did nothing.
    
    C2x 6.5.3.2p4 says The unary * operator denotes indirection. If it points
    to an object, the result is an lvalue designating the object. However, there
    is no way to form an lvalue designating an object of an incomplete type as
    6.3.2.1p1 says "an lvalue is an expression (with an object type other than
    void)", so the behavior is undefined.
    
    Fixes https://github.com/llvm/llvm-project/issues/53631
    
    Signed-off-by: Jun Zhang <jun@junz.org>
    
    Differential Revision: https://reviews.llvm.org/D134461
* llvm-master-arm-stable-allmodconfig
** Failure after llvmorg-16-init-5673-ge07ead85a368: [Clang] Warn when trying to dereference void pointers in C:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/498/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/498/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/497/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-llvm-e07ead85a368173a56e96a21d6841aa497ad80f8
cd investigate-llvm-e07ead85a368173a56e96a21d6841aa497ad80f8

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/498/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-stable-allmodconfig/497/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit e07ead85a368173a56e96a21d6841aa497ad80f8
Author: Jun Zhang <jun@junz.org>
Date:   Sat Sep 24 22:18:04 2022 +0800

    [Clang] Warn when trying to dereference void pointers in C
    
    Previously we only have an extension that warn void pointer deferencing
    in C++, but for C we did nothing.
    
    C2x 6.5.3.2p4 says The unary * operator denotes indirection. If it points
    to an object, the result is an lvalue designating the object. However, there
    is no way to form an lvalue designating an object of an incomplete type as
    6.3.2.1p1 says "an lvalue is an expression (with an object type other than
    void)", so the behavior is undefined.
    
    Fixes https://github.com/llvm/llvm-project/issues/53631
    
    Signed-off-by: Jun Zhang <jun@junz.org>
    
    Differential Revision: https://reviews.llvm.org/D134461
---
 clang/docs/ReleaseNotes.rst                      |  2 ++
 clang/include/clang/Basic/DiagnosticSemaKinds.td |  2 +-
 clang/include/clang/Sema/Sema.h                  | 10 +++---
 clang/lib/Parse/ParseExpr.cpp                    |  6 ++--
 clang/lib/Sema/SemaExpr.cpp                      | 43 ++++++++++++------------
 clang/test/Analysis/misc-ps.m                    |  2 +-
 clang/test/C/drs/dr0xx.c                         |  3 +-
 clang/test/C/drs/dr1xx.c                         | 24 +++++++++----
 clang/test/Sema/asm.c                            |  5 +--
 clang/test/Sema/builtins-arm.c                   |  7 ++--
 clang/test/Sema/conditional-expr.c               | 13 ++++---
 clang/test/Sema/deref.c                          |  3 +-
 clang/test/Sema/expr-address-of.c                |  2 +-
 clang/test/Sema/i-c-e.c                          |  3 +-
 14 files changed, 77 insertions(+), 48 deletions(-)

diff --git a/clang/docs/ReleaseNotes.rst b/clang/docs/ReleaseNotes.rst
index ed262823d004..a5e72fc917f3 100644
--- a/clang/docs/ReleaseNotes.rst
+++ b/clang/docs/ReleaseNotes.rst
@@ -210,6 +210,8 @@ Improvements to Clang's diagnostics
   ``LL`` suffix.
 - Clang now correctly diagnoses index that refers past the last possible element
   of FAM-like arrays.
+- Clang now correctly diagnoses a warning when defercencing a void pointer in C mode.
+  This fixes `Issue 53631 <https://github.com/llvm/llvm-project/issues/53631>`_
 
 Non-comprehensive list of changes in this release
 -------------------------------------------------
diff --git a/clang/include/clang/Basic/DiagnosticSemaKinds.td b/clang/include/clang/Basic/DiagnosticSemaKinds.td
index 7647aa929b75..834b60a2744d 100644
--- a/clang/include/clang/Basic/DiagnosticSemaKinds.td
+++ b/clang/include/clang/Basic/DiagnosticSemaKinds.td
@@ -6919,7 +6919,7 @@ def err_typecheck_unary_expr : Error<
 def err_typecheck_indirection_requires_pointer : Error<
   "indirection requires pointer operand (%0 invalid)">;
 def ext_typecheck_indirection_through_void_pointer : ExtWarn<
-  "ISO C++ does not allow indirection on operand of type %0">,
+  "ISO %select{C|C++}0 does not allow indirection on operand of type %1">,
   InGroup<DiagGroup<"void-ptr-dereference">>;
 def warn_indirection_through_null : Warning<
   "indirection of non-volatile null pointer will be deleted, not trap">,
diff --git a/clang/include/clang/Sema/Sema.h b/clang/include/clang/Sema/Sema.h
index 8628ed48481f..b6fd8174e1d8 100644
--- a/clang/include/clang/Sema/Sema.h
+++ b/clang/include/clang/Sema/Sema.h
@@ -5604,11 +5604,11 @@ public:
 
   // Binary/Unary Operators.  'Tok' is the token for the operator.
   ExprResult CreateBuiltinUnaryOp(SourceLocation OpLoc, UnaryOperatorKind Opc,
-                                  Expr *InputExpr);
-  ExprResult BuildUnaryOp(Scope *S, SourceLocation OpLoc,
-                          UnaryOperatorKind Opc, Expr *Input);
-  ExprResult ActOnUnaryOp(Scope *S, SourceLocation OpLoc,
-                          tok::TokenKind Op, Expr *Input);
+                                  Expr *InputExpr, bool IsAfterAmp = false);
+  ExprResult BuildUnaryOp(Scope *S, SourceLocation OpLoc, UnaryOperatorKind Opc,
+                          Expr *Input, bool IsAfterAmp = false);
+  ExprResult ActOnUnaryOp(Scope *S, SourceLocation OpLoc, tok::TokenKind Op,
+                          Expr *Input, bool IsAfterAmp = false);
 
   bool isQualifiedMemberAccess(Expr *E);
   QualType CheckAddressOfOperand(ExprResult &Operand, SourceLocation OpLoc);
diff --git a/clang/lib/Parse/ParseExpr.cpp b/clang/lib/Parse/ParseExpr.cpp
index 77e8b9488a8c..9b3c39e7b43f 100644
--- a/clang/lib/Parse/ParseExpr.cpp
+++ b/clang/lib/Parse/ParseExpr.cpp
@@ -1360,7 +1360,8 @@ ExprResult Parser::ParseCastExpression(CastParseKind ParseKind,
     // Special treatment because of member pointers
     SourceLocation SavedLoc = ConsumeToken();
     PreferredType.enterUnary(Actions, Tok.getLocation(), tok::amp, SavedLoc);
-    Res = ParseCastExpression(AnyCastExpr, true);
+
+    Res = ParseCastExpression(AnyCastExpr, /*isAddressOfOperand=*/true);
     if (!Res.isInvalid()) {
       Expr *Arg = Res.get();
       Res = Actions.ActOnUnaryOp(getCurScope(), SavedLoc, SavedKind, Arg);
@@ -1385,7 +1386,8 @@ ExprResult Parser::ParseCastExpression(CastParseKind ParseKind,
     Res = ParseCastExpression(AnyCastExpr);
     if (!Res.isInvalid()) {
       Expr *Arg = Res.get();
-      Res = Actions.ActOnUnaryOp(getCurScope(), SavedLoc, SavedKind, Arg);
+      Res = Actions.ActOnUnaryOp(getCurScope(), SavedLoc, SavedKind, Arg,
+                                 isAddressOfOperand);
       if (Res.isInvalid())
         Res = Actions.CreateRecoveryExpr(SavedLoc, Arg->getEndLoc(), Arg);
     }
diff --git a/clang/lib/Sema/SemaExpr.cpp b/clang/lib/Sema/SemaExpr.cpp
index 0f25801c9a2d..acbf7d534d49 100644
--- a/clang/lib/Sema/SemaExpr.cpp
+++ b/clang/lib/Sema/SemaExpr.cpp
@@ -14493,7 +14493,8 @@ static void RecordModifiableNonNullParam(Sema &S, const Expr *Exp) {
 
 /// CheckIndirectionOperand - Type check unary indirection (prefix '*').
 static QualType CheckIndirectionOperand(Sema &S, Expr *Op, ExprValueKind &VK,
-                                        SourceLocation OpLoc) {
+                                        SourceLocation OpLoc,
+                                        bool IsAfterAmp = false) {
   if (Op->isTypeDependent())
     return S.Context.DependentTy;
 
@@ -14530,18 +14531,15 @@ static QualType CheckIndirectionOperand(Sema &S, Expr *Op, ExprValueKind &VK,
     return QualType();
   }
 
-  // Note that per both C89 and C99, indirection is always legal, even if Result
-  // is an incomplete type or void.  It would be possible to warn about
-  // dereferencing a void pointer, but it's completely well-defined, and such a
-  // warning is unlikely to catch any mistakes. In C++, indirection is not valid
-  // for pointers to 'void' but is fine for any other pointer type:
-  //
-  // C++ [expr.unary.op]p1:
-  //   [...] the expression to which [the unary * operator] is applied shall
-  //   be a pointer to an object type, or a pointer to a function type
-  if (S.getLangOpts().CPlusPlus && Result->isVoidType())
-    S.Diag(OpLoc, diag::ext_typecheck_indirection_through_void_pointer)
-      << OpTy << Op->getSourceRange();
+  if (Result->isVoidType()) {
+    // C++ [expr.unary.op]p1:
+    //   [...] the expression to which [the unary * operator] is applied shall
+    //   be a pointer to an object type, or a pointer to a function type
+    LangOptions LO = S.getLangOpts();
+    if (LO.CPlusPlus || !(LO.C99 && IsAfterAmp))
+      S.Diag(OpLoc, diag::ext_typecheck_indirection_through_void_pointer)
+          << LO.CPlusPlus << OpTy << Op->getSourceRange();
+  }
 
   // Dereferences are usually l-values...
   VK = VK_LValue;
@@ -15530,8 +15528,8 @@ static bool isOverflowingIntegerType(ASTContext &Ctx, QualType T) {
 }
 
 ExprResult Sema::CreateBuiltinUnaryOp(SourceLocation OpLoc,
-                                      UnaryOperatorKind Opc,
-                                      Expr *InputExpr) {
+                                      UnaryOperatorKind Opc, Expr *InputExpr,
+                                      bool IsAfterAmp) {
   ExprResult Input = InputExpr;
   ExprValueKind VK = VK_PRValue;
   ExprObjectKind OK = OK_Ordinary;
@@ -15581,7 +15579,8 @@ ExprResult Sema::CreateBuiltinUnaryOp(SourceLocation OpLoc,
   case UO_Deref: {
     Input = DefaultFunctionArrayLvalueConversion(Input.get());
     if (Input.isInvalid()) return ExprError();
-    resultType = CheckIndirectionOperand(*this, Input.get(), VK, OpLoc);
+    resultType =
+        CheckIndirectionOperand(*this, Input.get(), VK, OpLoc, IsAfterAmp);
     break;
   }
   case UO_Plus:
@@ -15801,7 +15800,8 @@ bool Sema::isQualifiedMemberAccess(Expr *E) {
 }
 
 ExprResult Sema::BuildUnaryOp(Scope *S, SourceLocation OpLoc,
-                              UnaryOperatorKind Opc, Expr *Input) {
+                              UnaryOperatorKind Opc, Expr *Input,
+                              bool IsAfterAmp) {
   // First things first: handle placeholders so that the
   // overloaded-operator check considers the right type.
   if (const BuiltinType *pty = Input->getType()->getAsPlaceholderType()) {
@@ -15840,13 +15840,14 @@ ExprResult Sema::BuildUnaryOp(Scope *S, SourceLocation OpLoc,
     return CreateOverloadedUnaryOp(OpLoc, Opc, Functions, Input);
   }
 
-  return CreateBuiltinUnaryOp(OpLoc, Opc, Input);
+  return CreateBuiltinUnaryOp(OpLoc, Opc, Input, IsAfterAmp);
 }
 
 // Unary Operators.  'Tok' is the token for the operator.
-ExprResult Sema::ActOnUnaryOp(Scope *S, SourceLocation OpLoc,
-                              tok::TokenKind Op, Expr *Input) {
-  return BuildUnaryOp(S, OpLoc, ConvertTokenKindToUnaryOpcode(Op), Input);
+ExprResult Sema::ActOnUnaryOp(Scope *S, SourceLocation OpLoc, tok::TokenKind Op,
+                              Expr *Input, bool IsAfterAmp) {
+  return BuildUnaryOp(S, OpLoc, ConvertTokenKindToUnaryOpcode(Op), Input,
+                      IsAfterAmp);
 }
 
 /// ActOnAddrLabel - Parse the GNU address of label extension: "&&foo".
diff --git a/clang/test/Analysis/misc-ps.m b/clang/test/Analysis/misc-ps.m
index e9e56315eb26..4e3783dfc93a 100644
--- a/clang/test/Analysis/misc-ps.m
+++ b/clang/test/Analysis/misc-ps.m
@@ -133,7 +133,7 @@ void handle_sizeof_void(unsigned flag) {
   void* q;
   
   if (!flag) {
-    if (sizeof(*q) == 1)
+    if (sizeof(*q) == 1) // expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}
       return;
     // Infeasibe.
     *p = 1; // no-warning
diff --git a/clang/test/C/drs/dr0xx.c b/clang/test/C/drs/dr0xx.c
index 183382406475..942e83bef886 100644
--- a/clang/test/C/drs/dr0xx.c
+++ b/clang/test/C/drs/dr0xx.c
@@ -160,7 +160,8 @@ void dr011(void) {
  */
 void dr012(void *p) {
   /* The behavior changed between C89 and C99. */
-  (void)&*p; /* c89only-warning {{ISO C forbids taking the address of an expression of type 'void'}} */
+  (void)&*p; /* c89only-warning {{ISO C forbids taking the address of an expression of type 'void'}}
+                c89only-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
 }
 
 /* WG14 DR013: yes
diff --git a/clang/test/C/drs/dr1xx.c b/clang/test/C/drs/dr1xx.c
index 70435b523765..400807ed5da8 100644
--- a/clang/test/C/drs/dr1xx.c
+++ b/clang/test/C/drs/dr1xx.c
@@ -137,11 +137,21 @@ void dr105(void) {
  */
 void dr106(void *p, int i) {
   /* The behavior changed between C89 and C99. */
-  (void)&*p; /* c89only-warning {{ISO C forbids taking the address of an expression of type 'void'}} */
+  (void)&*p; /* c89only-warning {{ISO C forbids taking the address of an expression of type 'void'}}
+                c89only-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
+
   /* The behavior of all three of these is undefined. */
-  (void)*p;
-  (void)(i ? *p : *p);
-  (void)(*p, *p); /* expected-warning {{left operand of comma operator has no effect}} */
+  (void)*p; /* expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}*/
+
+  (void)&(*p); /* c89only-warning {{ISO C forbids taking the address of an expression of type 'void'}}
+                  expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}*/
+
+  (void)(i ? *p : *p); /* expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}
+                          expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}*/
+
+  (void)(*p, *p); /* expected-warning {{left operand of comma operator has no effect}}
+                     expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}
+		     expected-warning {{ISO C does not allow indirection on operand of type 'void *'}}*/
 }
 
 /* WG14 DR108: yes
@@ -178,10 +188,12 @@ void dr112(void *vp) {
  * Return expressions in functions declared to return qualified void
  */
 volatile void dr113_v(volatile void *vvp) { /* expected-warning {{function cannot return qualified void type 'volatile void'}} */
-  return *vvp; /* expected-warning {{void function 'dr113_v' should not return void expression}} */
+  return *vvp; /* expected-warning {{void function 'dr113_v' should not return void expression}}
+                  expected-warning{{ISO C does not allow indirection on operand of type 'volatile void *'}} */
 }
 const void dr113_c(const void *cvp) { /* expected-warning {{function cannot return qualified void type 'const void'}} */
-  return *cvp; /* expected-warning {{void function 'dr113_c' should not return void expression}} */
+  return *cvp; /* expected-warning {{void function 'dr113_c' should not return void expression}}
+                  expected-warning{{ISO C does not allow indirection on operand of type 'const void *'}} */
 }
 
 /* WG14 DR114: yes
diff --git a/clang/test/Sema/asm.c b/clang/test/Sema/asm.c
index 3c7952f410c6..9f3fb3176b4e 100644
--- a/clang/test/Sema/asm.c
+++ b/clang/test/Sema/asm.c
@@ -50,8 +50,9 @@ void test3(void) {
 // <rdar://problem/6156893>
 void test4(const volatile void *addr)
 {
-    asm ("nop" : : "r"(*addr)); // expected-error {{invalid type 'const volatile void' in asm input for constraint 'r'}}
-    asm ("nop" : : "m"(*addr));
+    asm ("nop" : : "r"(*addr)); /* expected-error {{invalid type 'const volatile void' in asm input for constraint 'r'}}
+                                   expected-warning {{ISO C does not allow indirection on operand of type 'const volatile void *'}} */
+    asm ("nop" : : "m"(*addr)); // expected-warning {{ISO C does not allow indirection on operand of type 'const volatile void *'}}
 
     asm ("nop" : : "r"(test4(addr))); // expected-error {{invalid type 'void' in asm input for constraint 'r'}}
     asm ("nop" : : "m"(test4(addr))); // expected-error {{invalid lvalue in asm input for constraint 'm'}}
diff --git a/clang/test/Sema/builtins-arm.c b/clang/test/Sema/builtins-arm.c
index 7c731204da09..0a59fd555bee 100644
--- a/clang/test/Sema/builtins-arm.c
+++ b/clang/test/Sema/builtins-arm.c
@@ -18,7 +18,8 @@ void __clear_cache(void*, void*);
 void test1(void) {
   __builtin_va_list ptr;
   ptr.__ap = "x";
-  *(ptr.__ap) = '0'; // expected-error {{incomplete type 'void' is not assignable}}
+  *(ptr.__ap) = '0'; /* expected-error {{incomplete type 'void' is not assignable}}
+                        expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
 }
 #else
 // va_list on ARM apcs-gnu is void*.
@@ -30,7 +31,9 @@ void test1(void) {
 
 void test2(void) {
   __builtin_va_list ptr = "x";
-  *ptr = '0'; // expected-error {{incomplete type 'void' is not assignable}}
+  *ptr = '0'; /* expected-error {{incomplete type 'void' is not assignable}}
+                 expected-warning {{ISO C does not allow indirection on operand of type '__builtin_va_list'}} */
+
 }
 #endif
 
diff --git a/clang/test/Sema/conditional-expr.c b/clang/test/Sema/conditional-expr.c
index ff4fd73f4c5c..81997459c1f2 100644
--- a/clang/test/Sema/conditional-expr.c
+++ b/clang/test/Sema/conditional-expr.c
@@ -2,11 +2,16 @@
 void foo(void) {
   *(0 ? (double *)0 : (void *)0) = 0;
   // FIXME: GCC doesn't consider the following two statements to be errors.
-  *(0 ? (double *)0 : (void *)(int *)0) = 0; // expected-error {{incomplete type 'void' is not assignable}}
-  *(0 ? (double *)0 : (void *)(double *)0) = 0; // expected-error {{incomplete type 'void' is not assignable}}
-  *(0 ? (double *)0 : (int *)(void *)0) = 0; // expected-error {{incomplete type 'void' is not assignable}} expected-warning {{pointer type mismatch ('double *' and 'int *')}}
+  *(0 ? (double *)0 : (void *)(int *)0) = 0; /* expected-error {{incomplete type 'void' is not assignable}}
+                                                expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
+  *(0 ? (double *)0 : (void *)(double *)0) = 0; /* expected-error {{incomplete type 'void' is not assignable}}
+                                                   expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
+  *(0 ? (double *)0 : (int *)(void *)0) = 0; /* expected-error {{incomplete type 'void' is not assignable}}
+                                                expected-warning {{pointer type mismatch ('double *' and 'int *')}}
+                                                expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
   *(0 ? (double *)0 : (double *)(void *)0) = 0;
-  *((void *) 0) = 0; // expected-error {{incomplete type 'void' is not assignable}}
+  *((void *) 0) = 0; /* expected-error {{incomplete type 'void' is not assignable}}
+                        expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
   double *dp;
   int *ip;
   void *vp;
diff --git a/clang/test/Sema/deref.c b/clang/test/Sema/deref.c
index 845b28645a48..45c921967bcc 100644
--- a/clang/test/Sema/deref.c
+++ b/clang/test/Sema/deref.c
@@ -18,7 +18,8 @@ void foo2 (void)
 void foo3 (void)
 {
  void* x = 0;
- void* y = &*x; /* expected-warning{{address of an expression of type 'void'}} */
+ void* y = &*x; /* expected-warning{{address of an expression of type 'void'}}
+                   expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
 }
 
 extern const void cv1;
diff --git a/clang/test/Sema/expr-address-of.c b/clang/test/Sema/expr-address-of.c
index 8881038b3241..057b7843ce6b 100644
--- a/clang/test/Sema/expr-address-of.c
+++ b/clang/test/Sema/expr-address-of.c
@@ -105,7 +105,7 @@ char* f7(void) {
   int* dummy2 = &(t2.a); // expected-error {{address of bit-field requested}}
   int* dummy3 = &(t2.b); // expected-error {{address of bit-field requested}}
 
-  void* t3 = &(*(void*)0);
+  void* t3 = &*(void*)0;
 }
 
 void f8(void) {
diff --git a/clang/test/Sema/i-c-e.c b/clang/test/Sema/i-c-e.c
index b348b4f3c43e..31dad5836549 100644
--- a/clang/test/Sema/i-c-e.c
+++ b/clang/test/Sema/i-c-e.c
@@ -3,7 +3,8 @@
 #include <stdint.h>
 #include <limits.h>
 
-int a(void) {int p; *(1 ? &p : (void*)(0 && (a(),1))) = 10;} // expected-error {{incomplete type 'void' is not assignable}}
+int a(void) {int p; *(1 ? &p : (void*)(0 && (a(),1))) = 10;} /* expected-error {{incomplete type 'void' is not assignable}}
+                                                                expected-warning {{ISO C does not allow indirection on operand of type 'void *'}} */
 
 // rdar://6091492 - ?: with __builtin_constant_p as the operand is an i-c-e.
 int expr;
</cut>
------=_Part_2184_258605986.1664153837410--
