Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9702F34
	for <llvm@lists.linux.dev>; Wed, 18 Jan 2023 23:48:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n7so232621wrx.5
        for <llvm@lists.linux.dev>; Wed, 18 Jan 2023 15:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoEieb1oWXYVsoW9tTRx9zOt/EeG5vFCrOWIO9mAuJQ=;
        b=gf+i+VjzULdeXXjK3ZGkHlKQVOGxZcXrxWmRYJrxDgyaFldPnFLzGAWVZREi1E+jg4
         Fe1sXQhFs307VkuDC2kr0QGr+SfzHTBXN5IQ7FyYC7pyTzAbkTYN3Xovr9GBWcOWFo7q
         tkhKPNNc2/kg+sbR9yMYhhIXxTp0cJjYBFiCfbVIzQuuhGTXvBXraBrTSrGKgpOzOeZf
         2osOpPYvmYUi39bcGWlCRNsGkD0c+lxXRr32YTIbP+WswarTsF2IyCS6yINONS9jjbqj
         ZuA+M3lOTDL9aNA/0hdmOv0NeQk9JYkzGJ8wLfX4H0XJ5AG1CS9hkzHXYmklBTvs0uGi
         1sqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoEieb1oWXYVsoW9tTRx9zOt/EeG5vFCrOWIO9mAuJQ=;
        b=qMxPwHZTyJZ1bDIUzbCdF/OjNBrNviRC8l3ShK+Z1AgtbAN/HPv9ltIiV2k6OrBRvn
         rLfepBou6S2fvpmkr9GnorTaz5HClWbbshVu0XgqfpIFemIBW+Rz2e8kW4fwO/OUAWYw
         jYrkWawJWwB7LqAB8hpAs88pgXK5dfkkTablfelyiNXcTSlIkxqIHeNdi2V3LcowhfT3
         g7PekPzv74IjVLkrB3EInkZv8NcIOqmFleFSL1EAwdklcdY79va1qdWx7I2jNm1GVsa1
         W4JqrkmYRHnrpsoQrYijXgZERBnsjkHCwXJRFxaQLtj0ZPhtndBgh5POE6j7YJCJSGS4
         jWIg==
X-Gm-Message-State: AFqh2kpPvWAJpw6MRyekc5hUHQFSs3ITbXlVg9C9kc0zP/6ahkdma4VH
	lyO9wuD21iM0kq7Ne4/2tSjZhiQ5L0zjVmRT
X-Google-Smtp-Source: AMrXdXvfZ7F+JZfvjbLItuDvrTt67gdT65enpOa3e7SxlWwUNf/szypONlEi2fBWWI18TLPFyMhrhg==
X-Received: by 2002:adf:e703:0:b0:2bd:fa1d:4639 with SMTP id c3-20020adfe703000000b002bdfa1d4639mr7617307wrm.30.1674085683706;
        Wed, 18 Jan 2023 15:48:03 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b002bdfb97e029sm10360355wrq.19.2023.01.18.15.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 15:48:03 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 18 Jan 2023 23:48:02 +0000 (UTC)
To: Yingchi Long <i@lyc.dev>
Cc: llvm@lists.linux.dev
Message-ID: <1845462665.226.1674085683293@jenkins.jenkins>
Subject: [TCWG CI] Failure after working-10379-ge327b52766ed: [C2x] reject
 type definitions in offsetof
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_225_1231124315.1674085682692"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-lts-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_225_1231124315.1674085682692
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after working-10379-ge327b52766ed: [C2x] reject type definitions in offsetof:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21439
# First few build errors in logs:
# 00:11:10 ./include/trace/events/initcall.h:38:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:27:1)' cannot be defined in '__builtin_offsetof'
# 00:11:10 ./include/trace/events/initcall.h:38:3: error: initializer element is not a compile-time constant
# 00:11:10 ./include/trace/events/initcall.h:59:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:48:1)' cannot be defined in '__builtin_offsetof'
# 00:11:10 ./include/trace/events/initcall.h:60:3: error: 'struct (unnamed at ./include/trace/events/initcall.h:48:1)' cannot be defined in '__builtin_offsetof'
# 00:11:10 ./include/trace/events/initcall.h:59:3: error: initializer element is not a compile-time constant
# 00:11:10 ./include/trace/events/power_cpu_migrate.h:23:3: error: 'struct (unnamed at ./include/trace/events/power_cpu_migrate.h:17:1)' cannot be defined in '__builtin_offsetof'
# 00:11:10 ./include/trace/events/power_cpu_migrate.h:24:3: error: 'struct (unnamed at ./include/trace/events/power_cpu_migrate.h:17:1)' cannot be defined in '__builtin_offsetof'
# 00:11:10 ./include/trace/events/power_cpu_migrate.h:23:3: error: initializer element is not a compile-time constant
# 00:11:10 make[2]: *** [scripts/Makefile.build:289: arch/arm/common/bL_switcher.o] Error 1
# 00:11:10 make[1]: *** [scripts/Makefile.build:289: init/main.o] Error 1

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
29888
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-646 .
Status of working-10379-ge327b52766ed commit for tcwg_kernel:
commit e327b52766ed497e4779f4e652b9ad237dfda8e6
Author: Yingchi Long <i@lyc.dev>
Date:   Fri Sep 16 22:13:54 2022 +0800

    [C2x] reject type definitions in offsetof
    
    https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm made very
    clear that it is an UB having type definitions with in offsetof. After
    this patch clang will reject any type definitions in __builtin_offsetof.
    
    Fixes https://github.com/llvm/llvm-project/issues/57065
    
    ```
    local/offsetof.c:10:38: error: 'struct S' cannot be defined in '__builtin_offsetof'
        return __builtin_offsetof(struct S{ int a, b;}, a);
                                         ^
    ```
    
    Reviewed By: aaron.ballman, #clang-language-wg
    
    Differential Revision: https://reviews.llvm.org/D133574
* llvm-master-arm-lts-allmodconfig
** Failure after working-10379-ge327b52766ed: [C2x] reject type definitions in offsetof:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-lts-allmodconfig/535/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-lts-allmodconfig/535/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-lts-allmodconfig/534/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-llvm-e327b52766ed497e4779f4e652b9ad237dfda8e6
cd investigate-llvm-e327b52766ed497e4779f4e652b9ad237dfda8e6

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-lts-allmodconfig/535/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-lts-allmodconfig/534/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit e327b52766ed497e4779f4e652b9ad237dfda8e6
Author: Yingchi Long <i@lyc.dev>
Date:   Fri Sep 16 22:13:54 2022 +0800

    [C2x] reject type definitions in offsetof
    
    https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm made very
    clear that it is an UB having type definitions with in offsetof. After
    this patch clang will reject any type definitions in __builtin_offsetof.
    
    Fixes https://github.com/llvm/llvm-project/issues/57065
    
    ```
    local/offsetof.c:10:38: error: 'struct S' cannot be defined in '__builtin_offsetof'
        return __builtin_offsetof(struct S{ int a, b;}, a);
                                         ^
    ```
    
    Reviewed By: aaron.ballman, #clang-language-wg
    
    Differential Revision: https://reviews.llvm.org/D133574
---
 clang/docs/ReleaseNotes.rst                      |  3 ++
 clang/include/clang/Basic/DiagnosticSemaKinds.td |  2 +
 clang/include/clang/Parse/Parser.h               |  3 ++
 clang/include/clang/Parse/RAIIObjectsForParser.h | 13 +++++
 clang/include/clang/Sema/Sema.h                  | 12 ++++-
 clang/lib/Parse/ParseDecl.cpp                    |  2 +-
 clang/lib/Parse/ParseDeclCXX.cpp                 |  2 +-
 clang/lib/Parse/ParseExpr.cpp                    | 19 +++++--
 clang/lib/Sema/SemaDecl.cpp                      | 12 +++--
 clang/lib/Sema/SemaDeclCXX.cpp                   |  6 +--
 clang/lib/Sema/SemaTemplate.cpp                  | 13 +++--
 clang/test/C/C2x/n2350.c                         | 67 ++++++++++++++++++++++++
 clang/test/C/drs/dr4xx.c                         |  7 ++-
 clang/test/Parser/declarators.c                  |  4 --
 clang/test/SemaCXX/offsetof.cpp                  | 17 ++++++
 15 files changed, 154 insertions(+), 28 deletions(-)

diff --git a/clang/docs/ReleaseNotes.rst b/clang/docs/ReleaseNotes.rst
index 65a9d65715dd..c5626ac8fe27 100644
--- a/clang/docs/ReleaseNotes.rst
+++ b/clang/docs/ReleaseNotes.rst
@@ -668,6 +668,9 @@ C2x Feature Support
       va_start(list); // Invalid in C17 and earlier, valid in C2x and later.
       va_end(list);
     }
+    
+- Reject type definitions in the ``type`` argument of ``__builtin_offsetof`` 
+  according to `WG14 N2350 <https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm>`_.
 
 C++ Language Changes in Clang
 -----------------------------
diff --git a/clang/include/clang/Basic/DiagnosticSemaKinds.td b/clang/include/clang/Basic/DiagnosticSemaKinds.td
index 02afb098b239..862ac845bda4 100644
--- a/clang/include/clang/Basic/DiagnosticSemaKinds.td
+++ b/clang/include/clang/Basic/DiagnosticSemaKinds.td
@@ -1650,6 +1650,8 @@ def err_type_defined_in_condition : Error<
   "%0 cannot be defined in a condition">;
 def err_type_defined_in_enum : Error<
   "%0 cannot be defined in an enumeration">;
+def err_type_defined_in_offsetof : Error<
+  "%0 cannot be defined in '%select{__builtin_offsetof|offsetof}1'">;
 
 def note_pure_virtual_function : Note<
   "unimplemented pure virtual method %0 in %1">;
diff --git a/clang/include/clang/Parse/Parser.h b/clang/include/clang/Parse/Parser.h
index 67e163ca512d..8d934d59a580 100644
--- a/clang/include/clang/Parse/Parser.h
+++ b/clang/include/clang/Parse/Parser.h
@@ -61,6 +61,7 @@ class Parser : public CodeCompletionHandler {
   friend class ColonProtectionRAIIObject;
   friend class ParsingOpenMPDirectiveRAII;
   friend class InMessageExpressionRAIIObject;
+  friend class OffsetOfStateRAIIObject;
   friend class PoisonSEHIdentifiersRAIIObject;
   friend class ObjCDeclContextSwitch;
   friend class ParenBraceBracketBalancer;
@@ -247,6 +248,8 @@ class Parser : public CodeCompletionHandler {
   /// function call.
   bool CalledSignatureHelp = false;
 
+  Sema::OffsetOfKind OffsetOfState = Sema::OffsetOfKind::OOK_Outside;
+
   /// The "depth" of the template parameters currently being parsed.
   unsigned TemplateParameterDepth;
 
diff --git a/clang/include/clang/Parse/RAIIObjectsForParser.h b/clang/include/clang/Parse/RAIIObjectsForParser.h
index 5ae609e60073..cb525c9d0edd 100644
--- a/clang/include/clang/Parse/RAIIObjectsForParser.h
+++ b/clang/include/clang/Parse/RAIIObjectsForParser.h
@@ -341,6 +341,19 @@ namespace clang {
     }
   };
 
+  class OffsetOfStateRAIIObject {
+    Sema::OffsetOfKind &OffsetOfState;
+    Sema::OffsetOfKind OldValue;
+
+  public:
+    OffsetOfStateRAIIObject(Parser &P, Sema::OffsetOfKind Value)
+        : OffsetOfState(P.OffsetOfState), OldValue(P.OffsetOfState) {
+      OffsetOfState = Value;
+    }
+
+    ~OffsetOfStateRAIIObject() { OffsetOfState = OldValue; }
+  };
+
   /// RAII object that makes sure paren/bracket/brace count is correct
   /// after declaration/statement parsing, even when there's a parsing error.
   class ParenBraceBracketBalancer {
diff --git a/clang/include/clang/Sema/Sema.h b/clang/include/clang/Sema/Sema.h
index fd60a1f9ac43..be5265b7968b 100644
--- a/clang/include/clang/Sema/Sema.h
+++ b/clang/include/clang/Sema/Sema.h
@@ -3304,6 +3304,16 @@ public:
     TUK_Friend       // Friend declaration:  'friend struct foo;'
   };
 
+  enum OffsetOfKind {
+    // Not parsing a type within __builtin_offsetof.
+    OOK_Outside,
+    // Parsing a type within __builtin_offsetof.
+    OOK_Builtin,
+    // Parsing a type within macro "offsetof", defined in __buitin_offsetof
+    // To improve our diagnostic message.
+    OOK_Macro,
+  };
+
   Decl *ActOnTag(Scope *S, unsigned TagSpec, TagUseKind TUK,
                  SourceLocation KWLoc, CXXScopeSpec &SS, IdentifierInfo *Name,
                  SourceLocation NameLoc, const ParsedAttributesView &Attr,
@@ -3312,7 +3322,7 @@ public:
                  bool &IsDependent, SourceLocation ScopedEnumKWLoc,
                  bool ScopedEnumUsesClassTag, TypeResult UnderlyingType,
                  bool IsTypeSpecifier, bool IsTemplateParamOrArg,
-                 SkipBodyInfo *SkipBody = nullptr);
+                 OffsetOfKind OOK, SkipBodyInfo *SkipBody = nullptr);
 
   Decl *ActOnTemplatedFriendTag(Scope *S, SourceLocation FriendLoc,
                                 unsigned TagSpec, SourceLocation TagLoc,
diff --git a/clang/lib/Parse/ParseDecl.cpp b/clang/lib/Parse/ParseDecl.cpp
index 74893dee2123..241a46193d5f 100644
--- a/clang/lib/Parse/ParseDecl.cpp
+++ b/clang/lib/Parse/ParseDecl.cpp
@@ -4972,7 +4972,7 @@ void Parser::ParseEnumSpecifier(SourceLocation StartLoc, DeclSpec &DS,
       DSC == DeclSpecContext::DSC_type_specifier,
       DSC == DeclSpecContext::DSC_template_param ||
           DSC == DeclSpecContext::DSC_template_type_arg,
-      &SkipBody);
+      OffsetOfState, &SkipBody);
 
   if (SkipBody.ShouldSkip) {
     assert(TUK == Sema::TUK_Definition && "can only skip a definition");
diff --git a/clang/lib/Parse/ParseDeclCXX.cpp b/clang/lib/Parse/ParseDeclCXX.cpp
index ebc86c00870e..6fbf80436011 100644
--- a/clang/lib/Parse/ParseDeclCXX.cpp
+++ b/clang/lib/Parse/ParseDeclCXX.cpp
@@ -2073,7 +2073,7 @@ void Parser::ParseClassSpecifier(tok::TokenKind TagTokKind,
         DSC == DeclSpecContext::DSC_type_specifier,
         DSC == DeclSpecContext::DSC_template_param ||
             DSC == DeclSpecContext::DSC_template_type_arg,
-        &SkipBody);
+        OffsetOfState, &SkipBody);
 
     // If ActOnTag said the type was dependent, try again with the
     // less common call.
diff --git a/clang/lib/Parse/ParseExpr.cpp b/clang/lib/Parse/ParseExpr.cpp
index 95d8b649f19b..34fead347800 100644
--- a/clang/lib/Parse/ParseExpr.cpp
+++ b/clang/lib/Parse/ParseExpr.cpp
@@ -2591,10 +2591,21 @@ ExprResult Parser::ParseBuiltinPrimaryExpression() {
   }
   case tok::kw___builtin_offsetof: {
     SourceLocation TypeLoc = Tok.getLocation();
-    TypeResult Ty = ParseTypeName();
-    if (Ty.isInvalid()) {
-      SkipUntil(tok::r_paren, StopAtSemi);
-      return ExprError();
+    auto K = Sema::OffsetOfKind::OOK_Builtin;
+    if (Tok.getLocation().isMacroID()) {
+      StringRef MacroName = Lexer::getImmediateMacroNameForDiagnostics(
+          Tok.getLocation(), PP.getSourceManager(), getLangOpts());
+      if (MacroName == "offsetof")
+        K = Sema::OffsetOfKind::OOK_Macro;
+    }
+    TypeResult Ty;
+    {
+      OffsetOfStateRAIIObject InOffsetof(*this, K);
+      Ty = ParseTypeName();
+      if (Ty.isInvalid()) {
+        SkipUntil(tok::r_paren, StopAtSemi);
+        return ExprError();
+      }
     }
 
     if (ExpectAndConsume(tok::comma)) {
diff --git a/clang/lib/Sema/SemaDecl.cpp b/clang/lib/Sema/SemaDecl.cpp
index 3dbd61c2c711..9ab53f56d29c 100644
--- a/clang/lib/Sema/SemaDecl.cpp
+++ b/clang/lib/Sema/SemaDecl.cpp
@@ -16591,7 +16591,7 @@ Decl *Sema::ActOnTag(Scope *S, unsigned TagSpec, TagUseKind TUK,
                      SourceLocation ScopedEnumKWLoc,
                      bool ScopedEnumUsesClassTag, TypeResult UnderlyingType,
                      bool IsTypeSpecifier, bool IsTemplateParamOrArg,
-                     SkipBodyInfo *SkipBody) {
+                     OffsetOfKind OOK, SkipBodyInfo *SkipBody) {
   // If this is not a definition, it must have a name.
   IdentifierInfo *OrigName = Name;
   assert((Name != nullptr || TUK == TUK_Definition) &&
@@ -17364,10 +17364,16 @@ CreateNewDecl:
                                cast_or_null<RecordDecl>(PrevDecl));
   }
 
+  if (OOK != OOK_Outside && TUK == TUK_Definition) {
+    Diag(New->getLocation(), diag::err_type_defined_in_offsetof)
+        << Context.getTagDeclType(New) << static_cast<int>(OOK == OOK_Macro);
+    Invalid = true;
+  }
+
   // C++11 [dcl.type]p3:
   //   A type-specifier-seq shall not define a class or enumeration [...].
-  if (getLangOpts().CPlusPlus && (IsTypeSpecifier || IsTemplateParamOrArg) &&
-      TUK == TUK_Definition) {
+  if (!Invalid && getLangOpts().CPlusPlus &&
+      (IsTypeSpecifier || IsTemplateParamOrArg) && TUK == TUK_Definition) {
     Diag(New->getLocation(), diag::err_type_defined_in_type_specifier)
       << Context.getTagDeclType(New);
     Invalid = true;
diff --git a/clang/lib/Sema/SemaDeclCXX.cpp b/clang/lib/Sema/SemaDeclCXX.cpp
index 2ac3cdc04fdd..96d57f450681 100644
--- a/clang/lib/Sema/SemaDeclCXX.cpp
+++ b/clang/lib/Sema/SemaDeclCXX.cpp
@@ -16961,15 +16961,15 @@ Decl *Sema::ActOnTemplatedFriendTag(Scope *S, SourceLocation FriendLoc,
     if (SS.isEmpty()) {
       bool Owned = false;
       bool IsDependent = false;
-      return ActOnTag(S, TagSpec, TUK_Friend, TagLoc, SS, Name, NameLoc,
-                      Attr, AS_public,
+      return ActOnTag(S, TagSpec, TUK_Friend, TagLoc, SS, Name, NameLoc, Attr,
+                      AS_public,
                       /*ModulePrivateLoc=*/SourceLocation(),
                       MultiTemplateParamsArg(), Owned, IsDependent,
                       /*ScopedEnumKWLoc=*/SourceLocation(),
                       /*ScopedEnumUsesClassTag=*/false,
                       /*UnderlyingType=*/TypeResult(),
                       /*IsTypeSpecifier=*/false,
-                      /*IsTemplateParamOrArg=*/false);
+                      /*IsTemplateParamOrArg=*/false, /*OOK=*/OOK_Outside);
     }
 
     NestedNameSpecifierLoc QualifierLoc = SS.getWithLocInContext(Context);
diff --git a/clang/lib/Sema/SemaTemplate.cpp b/clang/lib/Sema/SemaTemplate.cpp
index 40335c8b507c..cfa28e433687 100644
--- a/clang/lib/Sema/SemaTemplate.cpp
+++ b/clang/lib/Sema/SemaTemplate.cpp
@@ -10180,13 +10180,12 @@ Sema::ActOnExplicitInstantiation(Scope *S, SourceLocation ExternLoc,
 
   bool Owned = false;
   bool IsDependent = false;
-  Decl *TagD = ActOnTag(S, TagSpec, Sema::TUK_Reference,
-                        KWLoc, SS, Name, NameLoc, Attr, AS_none,
-                        /*ModulePrivateLoc=*/SourceLocation(),
-                        MultiTemplateParamsArg(), Owned, IsDependent,
-                        SourceLocation(), false, TypeResult(),
-                        /*IsTypeSpecifier*/false,
-                        /*IsTemplateParamOrArg*/false);
+  Decl *TagD = ActOnTag(
+      S, TagSpec, Sema::TUK_Reference, KWLoc, SS, Name, NameLoc, Attr, AS_none,
+      /*ModulePrivateLoc=*/SourceLocation(), MultiTemplateParamsArg(), Owned,
+      IsDependent, SourceLocation(), false, TypeResult(),
+      /*IsTypeSpecifier*/ false,
+      /*IsTemplateParamOrArg=*/false, /*OOK=*/OOK_Outside);
   assert(!IsDependent && "explicit instantiation of dependent name not yet handled");
 
   if (!TagD)
diff --git a/clang/test/C/C2x/n2350.c b/clang/test/C/C2x/n2350.c
new file mode 100644
index 000000000000..3b4bdec26bf7
--- /dev/null
+++ b/clang/test/C/C2x/n2350.c
@@ -0,0 +1,67 @@
+// RUN: %clang_cc1 -fsyntax-only -verify %s
+// RUN: %clang_cc1 -fsyntax-only -std=c89 -verify %s
+// RUN: %clang_cc1 -fsyntax-only -std=c99 -verify %s
+// RUN: %clang_cc1 -fsyntax-only -std=c11 -verify %s
+// RUN: %clang_cc1 -fsyntax-only -std=c17 -verify %s
+// RUN: %clang_cc1 -fsyntax-only -std=c2x -verify %s
+
+// Reject definitions in __builtin_offsetof
+// https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+int simple(void) {
+  return __builtin_offsetof(struct A // expected-error{{'struct A' cannot be defined in '__builtin_offsetof'}} 
+  { 
+    int a;
+    struct B // expected-error{{'struct B' cannot be defined in '__builtin_offsetof'}} 
+    {
+      int c;
+      int d;
+    } x;
+  }, a);
+}
+
+int anonymous_struct() {
+  return __builtin_offsetof(struct // expected-error-re{{'struct (unnamed at {{.*}})' cannot be defined in '__builtin_offsetof'}}
+  { 
+    int a;
+    int b;
+  }, a);
+}
+
+int struct_in_second_param() {
+  struct A {
+    int a, b;
+    int x[20];
+  };
+  return __builtin_offsetof(struct A, x[sizeof(struct B{int a;})]); // no-error
+}
+
+
+#define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
+
+
+int macro(void) {
+  return offsetof(struct A // expected-error{{'struct A' cannot be defined in 'offsetof'}}
+                           // expected-error@-1{{'struct B' cannot be defined in 'offsetof'}}
+  { 
+    int a;
+    struct B // verifier seems to think the error is emitted by the macro
+             // In fact the location of the error is "B" on the line above
+    {
+      int c;
+      int d;
+    } x;
+  }, a);
+}
+
+#undef offsetof
+
+#define offsetof(TYPE, MEMBER) (&((TYPE *)0)->MEMBER)
+
+// no warning for traditional offsetof as a function-like macro
+int * macro_func(void) {
+  return offsetof(struct A // no-warning
+  { 
+    int a;
+    int b;
+  }, a);
+}
diff --git a/clang/test/C/drs/dr4xx.c b/clang/test/C/drs/dr4xx.c
index 768897cd4f2b..f5ad1b82bec4 100644
--- a/clang/test/C/drs/dr4xx.c
+++ b/clang/test/C/drs/dr4xx.c
@@ -352,11 +352,10 @@ void dr496(void) {
                                              */
 
   /* The DR asked a question about whether defining a new type within offsetof
-   * is allowed. C2x N2350 made this explicitly undefined behavior, but Clang
-   * has always supported defining a type in this location, and GCC also
-   * supports it.
+   * is allowed. C2x N2350 made this explicitly undefined behavior, but GCC
+   * supports it, Clang diagnoses this a UB and rejects it.
    */
-   (void)__builtin_offsetof(struct S { int a; }, a);
+   (void)__builtin_offsetof(struct S { int a; }, a); /* expected-error{{'struct S' cannot be defined in '__builtin_offsetof'}} */
 }
 
 /* WG14 DR499: yes
diff --git a/clang/test/Parser/declarators.c b/clang/test/Parser/declarators.c
index 464fafeaa0d2..3af09817e6b6 100644
--- a/clang/test/Parser/declarators.c
+++ b/clang/test/Parser/declarators.c
@@ -80,10 +80,6 @@ struct test9 {
 struct test10 { int a; } static test10x;
 struct test11 { int a; } const test11x;
 
-// PR6216
-void test12(void) {
-  (void)__builtin_offsetof(struct { char c; int i; }, i);
-}
 
 // rdar://7608537
 struct test13 { int a; } (test13x);
diff --git a/clang/test/SemaCXX/offsetof.cpp b/clang/test/SemaCXX/offsetof.cpp
index c4b288aa05d4..3eee6fb41d33 100644
--- a/clang/test/SemaCXX/offsetof.cpp
+++ b/clang/test/SemaCXX/offsetof.cpp
@@ -83,3 +83,20 @@ struct Derived : virtual Base {
                                                               expected-error {{invalid application of 'offsetof' to a field of a virtual base}}
 };
 }
+
+// Reject definitions in __builtin_offsetof
+// https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
+int test_definition(void) {
+  return __builtin_offsetof(struct A // expected-error{{'A' cannot be defined in '__builtin_offsetof'}} 
+  { 
+    int a;
+    struct B // FIXME: error diagnostic message for nested definitions 
+             // https://reviews.llvm.org/D133574 
+             // fixme-error{{'A' cannot be defined in '__builtin_offsetof'}} 
+    {
+      int c;
+      int d;
+    };
+    B x;
+  }, a);
+}
</cut>
------=_Part_225_1231124315.1674085682692--
