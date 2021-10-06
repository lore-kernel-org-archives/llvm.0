Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825D2C88
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 00:46:41 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id r19so3008548lfe.10
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FLFj9UyDLKbgcyUKZD4Pmy2Y9xaPvyjnimwTL7IFpUE=;
        b=C6nxsNxNxqUS3OVq0N66OsyujRWkcvsbUPAh4BlOYkWsPrJk9w4CfpY3ArqoaIAy/f
         uU6yBXvE5td+zVb3rSvlCQDNdzK4T6IsoycnotecTkydDKmI2sXyn3dHh8QEW9y0AVkC
         egCTYPPJJLN2KOK8qe3hVHazWhK9Qoj9UlliA8iwzOFpwt1OElyfXZyEwPG+0UajfUqP
         zncQvgsp2Un1YIPdKn1qGSgZjF8HRepuIKjd6x7/mKjyUDJn5Lf6IQ0N9/5F1lRRDuu4
         GCETNUtSeDQ9Xh/d4PoCeuBweh30KIaZe/musQtq1YMTJWa+eoazrZ+cVu6JWkplrexC
         ZE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FLFj9UyDLKbgcyUKZD4Pmy2Y9xaPvyjnimwTL7IFpUE=;
        b=VoEONSQsFG8Ei3rY0CVUGQYGk01nXww+d3JATILsKyxnPxw1ps/IHk8o1dQzIDovxy
         LUlSEwsQmHQ0FjCnkmLBtP1Mk0i0HgzLBf8rjsZU8EzYV4Ye77zhOuuQuAS6/L4LNISz
         z+FS5PG3K5JTHltjXnmOCZlVn12qgtHsCsZS/B6vMKCvJI8JPcf3Oe4qWisiQ453ACpf
         jQof8GrOdBnhexqQ3bjAmc6cKxjviG/BTbSQEQjJw+XSagYK0i2v3tgIX+rQj50XL+u2
         ksSIgwLx1sNdNu8Xd+B1elc6fUekO6j8FEiKmO2gFLZ4rIrFhBFVRRFrldjYomgAB/TW
         b3tA==
X-Gm-Message-State: AOAM533Gp6kdZULLK0aX00o/VrZt7Ar+/Cy5CnYug003B8bqoofejxW8
	duAWtPLDMrE9/VbVkDFdA/DUfiH/LBmMNfJNtMM05g==
X-Google-Smtp-Source: ABdhPJy0RbMEjEyUkS7DinsjuooAciuyOe9HpruKHzQpqEGyTleEUBTaRTaqzfGBVBTFw3XMJGd/kRvkg0VqkGdAhFM=
X-Received: by 2002:a2e:9b98:: with SMTP id z24mr24870205lji.339.1633481199632;
 Tue, 05 Oct 2021 17:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <114622188.9317.1633476717934@localhost>
In-Reply-To: <114622188.9317.1633476717934@localhost>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 5 Oct 2021 17:46:27 -0700
Message-ID: <CAKwvOd=HkUhQSOQMQ2wvBZqGLWR+EsStKfjm-wtSnSjQ9n3AEg@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by llvm: Reland "[Clang] Extend
 -Wbool-operation to warn about bitwise and of bools with side effects"
To: =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
Cc: llvm@lists.linux.dev, ci_notify@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ignore this, re-landing warning support for that warning didn't
trigger these different warnings.

On Tue, Oct 5, 2021 at 4:32 PM <ci_notify@linaro.org> wrote:
>
> [TCWG CI] Regression caused by llvm: Reland "[Clang] Extend -Wbool-operat=
ion to warn about bitwise and of bools with side effects":
> commit f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
> Author: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
>
>     Reland "[Clang] Extend -Wbool-operation to warn about bitwise and of =
bools with side effects"
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19948
> # First few build errors in logs:
> # 00:02:06 kernel/locking/test-ww_mutex.c:138:7: error: variable 'ret' is=
 used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-un=
initialized]
> # 00:02:07 make[2]: *** [scripts/Makefile.build:288: kernel/locking/test-=
ww_mutex.o] Error 1
> # 00:02:13 make[1]: *** [scripts/Makefile.build:571: kernel/locking] Erro=
r 2
> # 00:03:49 kernel/trace/trace_events_hist.c:4723:13: error: stack frame s=
ize (1400) exceeds limit (1024) in function 'hist_trigger_print_key' [-Werr=
or,-Wframe-larger-than]
> # 00:03:52 make[2]: *** [scripts/Makefile.build:288: kernel/trace/trace_e=
vents_hist.o] Error 1
> # 00:04:04 arch/arm/lib/xor-neon.c:30:2: error: This code requires at lea=
st version 4.6 of GCC [-Werror,-W#warnings]
> # 00:04:04 make[1]: *** [scripts/Makefile.build:288: arch/arm/lib/xor-neo=
n.o] Error 1
> # 00:04:04 make: *** [Makefile:2034: arch/arm/lib] Error 2
> # 00:04:05 crypto/wp512.c:782:13: error: stack frame size (1176) exceeds =
limit (1024) in function 'wp512_process_buffer' [-Werror,-Wframe-larger-tha=
n]
> # 00:04:05 make[1]: *** [scripts/Makefile.build:288: crypto/wp512.o] Erro=
r 1
>
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19952
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODU=
CTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-master-arm-next-allyesconfig
>
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-m=
aster-arm-next-allyesconfig/13/artifact/artifacts/build-f59cc9542bfb461d16a=
d12b2cc4be4abbfd9d96e/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-m=
aster-arm-next-allyesconfig/13/artifact/artifacts/build-b1fcca38844138d1950=
e1b34eb2be65b3bfc7352/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-ma=
ster-arm-next-allyesconfig/13/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm=
-master-arm-next-allyesconfig/13/artifact/artifacts/
>
> Reproduce builds:
> <cut>
> mkdir investigate-llvm-f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
> cd investigate-llvm-f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/t=
cwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/13/artifact/artifa=
cts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job=
/tcwg_kernel-llvm-bisect-llvm-master-arm-next-allyesconfig/13/artifact/arti=
facts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bise=
ct-llvm-master-arm-next-allyesconfig/13/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-basel=
ine.sh
>
> # Save baseline build state (which is then restored in artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/=
 --exclude /llvm/ ./ ./bisect/baseline/
>
> cd llvm
>
> # Reproduce first_bad build
> git checkout --detach f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach b1fcca38844138d1950e1b34eb2be65b3bfc7352
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit f59cc9542bfb461d16ad12b2cc4be4abbfd9d96e
> Author: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
> Date:   Sun Oct 3 13:05:09 2021 +0200
>
>     Reland "[Clang] Extend -Wbool-operation to warn about bitwise and of =
bools with side effects"
>
>     This reverts commit a4933f57f3f0a45e1db1075f7285f0761a80fc06. New war=
nings were fixed.
> ---
>  clang/include/clang/Basic/DiagnosticGroups.td    |  3 +-
>  clang/include/clang/Basic/DiagnosticSemaKinds.td |  4 ++
>  clang/lib/Sema/SemaChecking.cpp                  | 14 ++++++
>  clang/test/Misc/warning-wall.c                   |  1 +
>  clang/test/Sema/warn-bitwise-and-bool.c          | 63 ++++++++++++++++++=
++++++
>  clang/test/Sema/warn-bitwise-or-bool.c           | 63 ++++++++++++++++++=
++++++
>  6 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/clang/include/clang/Basic/DiagnosticGroups.td b/clang/includ=
e/clang/Basic/DiagnosticGroups.td
> index 761b323d0616..d9db3482dbda 100644
> --- a/clang/include/clang/Basic/DiagnosticGroups.td
> +++ b/clang/include/clang/Basic/DiagnosticGroups.td
> @@ -64,7 +64,8 @@ def StringConversion : DiagGroup<"string-conversion">;
>  def SignConversion : DiagGroup<"sign-conversion">;
>  def PointerBoolConversion : DiagGroup<"pointer-bool-conversion">;
>  def UndefinedBoolConversion : DiagGroup<"undefined-bool-conversion">;
> -def BoolOperation : DiagGroup<"bool-operation">;
> +def BitwiseInsteadOfLogical : DiagGroup<"bitwise-instead-of-logical">;
> +def BoolOperation : DiagGroup<"bool-operation", [BitwiseInsteadOfLogical=
]>;
>  def BoolConversion : DiagGroup<"bool-conversion", [PointerBoolConversion=
,
>                                                     UndefinedBoolConversi=
on]>;
>  def IntConversion : DiagGroup<"int-conversion">;
> diff --git a/clang/include/clang/Basic/DiagnosticSemaKinds.td b/clang/inc=
lude/clang/Basic/DiagnosticSemaKinds.td
> index 1d4ea92c6520..c71a00b18432 100644
> --- a/clang/include/clang/Basic/DiagnosticSemaKinds.td
> +++ b/clang/include/clang/Basic/DiagnosticSemaKinds.td
> @@ -66,6 +66,7 @@ def warn_infinite_recursive_function : Warning<
>  def warn_comma_operator : Warning<"possible misuse of comma operator her=
e">,
>    InGroup<DiagGroup<"comma">>, DefaultIgnore;
>  def note_cast_to_void : Note<"cast expression to void to silence warning=
">;
> +def note_cast_operand_to_int : Note<"cast one or both operands to int to=
 silence this warning">;
>
>  // Constant expressions
>  def err_expr_not_ice : Error<
> @@ -7423,6 +7424,9 @@ def note_member_declared_here : Note<
>    "member %0 declared here">;
>  def note_member_first_declared_here : Note<
>    "member %0 first declared here">;
> +def warn_bitwise_instead_of_logical : Warning<
> +  "use of bitwise '%0' with boolean operands">,
> +  InGroup<BitwiseInsteadOfLogical>, DefaultIgnore;
>  def warn_bitwise_negation_bool : Warning<
>    "bitwise negation of a boolean expression%select{;| always evaluates t=
o 'true';}0 "
>    "did you mean logical negation?">,
> diff --git a/clang/lib/Sema/SemaChecking.cpp b/clang/lib/Sema/SemaCheckin=
g.cpp
> index 615ba1aef8e6..bdd9fb495da2 100644
> --- a/clang/lib/Sema/SemaChecking.cpp
> +++ b/clang/lib/Sema/SemaChecking.cpp
> @@ -13249,6 +13249,20 @@ static void AnalyzeImplicitConversions(
>            << OrigE->getSourceRange() << T->isBooleanType()
>            << FixItHint::CreateReplacement(UO->getBeginLoc(), "!");
>
> +  if (const auto *BO =3D dyn_cast<BinaryOperator>(SourceExpr))
> +    if ((BO->getOpcode() =3D=3D BO_And || BO->getOpcode() =3D=3D BO_Or) =
&&
> +        BO->getLHS()->isKnownToHaveBooleanValue() &&
> +        BO->getRHS()->isKnownToHaveBooleanValue() &&
> +        BO->getLHS()->HasSideEffects(S.Context) &&
> +        BO->getRHS()->HasSideEffects(S.Context)) {
> +      S.Diag(BO->getBeginLoc(), diag::warn_bitwise_instead_of_logical)
> +          << (BO->getOpcode() =3D=3D BO_And ? "&" : "|") << OrigE->getSo=
urceRange()
> +          << FixItHint::CreateReplacement(
> +                 BO->getOperatorLoc(),
> +                 (BO->getOpcode() =3D=3D BO_And ? "&&" : "||"));
> +      S.Diag(BO->getBeginLoc(), diag::note_cast_operand_to_int);
> +    }
> +
>    // For conditional operators, we analyze the arguments as if they
>    // were being fed directly into the output.
>    if (auto *CO =3D dyn_cast<AbstractConditionalOperator>(SourceExpr)) {
> diff --git a/clang/test/Misc/warning-wall.c b/clang/test/Misc/warning-wal=
l.c
> index a3686fb96a4c..a4a79bec934a 100644
> --- a/clang/test/Misc/warning-wall.c
> +++ b/clang/test/Misc/warning-wall.c
> @@ -4,6 +4,7 @@ RUN: FileCheck --input-file=3D%t %s
>       CHECK:-Wall
>  CHECK-NEXT:  -Wmost
>  CHECK-NEXT:    -Wbool-operation
> +CHECK-NEXT:    -Wbitwise-instead-of-logical
>  CHECK-NEXT:    -Wchar-subscripts
>  CHECK-NEXT:    -Wcomment
>  CHECK-NEXT:    -Wdelete-non-virtual-dtor
> diff --git a/clang/test/Sema/warn-bitwise-and-bool.c b/clang/test/Sema/wa=
rn-bitwise-and-bool.c
> new file mode 100644
> index 000000000000..6bec1be1abde
> --- /dev/null
> +++ b/clang/test/Sema/warn-bitwise-and-bool.c
> @@ -0,0 +1,63 @@
> +// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wbool-operation %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wall %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -Wbitwise-instead-of-logical -fdia=
gnostics-parseable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -Wbool-operation -fdiagnostics-par=
seable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wbool-operation %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wall %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbitwise-instead-of-logical -fd=
iagnostics-parseable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbool-operation -fdiagnostics-p=
arseable-fixits %s 2>&1 | FileCheck %s
> +
> +#ifdef __cplusplus
> +typedef bool boolean;
> +#else
> +typedef _Bool boolean;
> +#endif
> +
> +boolean foo(void);
> +boolean bar(void);
> +boolean baz(void) __attribute__((const));
> +void sink(boolean);
> +
> +#define FOO foo()
> +
> +void test(boolean a, boolean b, int *p, volatile int *q, int i) {
> +  b =3D a & b;
> +  b =3D foo() & a;
> +  b =3D (p !=3D 0) & (*p =3D=3D 42);   // FIXME: also warn for a non-vol=
atile pointer dereference
> +  b =3D foo() & (*q =3D=3D 42);      // expected-warning {{use of bitwis=
e '&' with boolean operands}}
> +                               // expected-note@-1 {{cast one or both op=
erands to int to silence this warning}}
> +  b =3D foo() & (int)(*q =3D=3D 42); // OK, no warning expected
> +  b =3D a & foo();
> +  b =3D (int)a & foo();     // OK, no warning expected
> +  b =3D foo() & bar();      // expected-warning {{use of bitwise '&' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"&&"
> +  b =3D foo() & (int)bar(); // OK, no warning expected
> +  b =3D foo() & !bar();     // expected-warning {{use of bitwise '&' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"&&"
> +  b =3D a & baz();
> +  b =3D bar() & FOO;        // expected-warning {{use of bitwise '&' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"&&"
> +  b =3D foo() & (int)FOO;   // OK, no warning expected
> +  b =3D b & foo();
> +  b =3D bar() & (i > 4);
> +  b =3D (i =3D=3D 7) & foo();
> +#ifdef __cplusplus
> +  b =3D foo() bitand bar(); // expected-warning {{use of bitwise '&' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +#endif
> +
> +  if (foo() & bar())      // expected-warning {{use of bitwise '&' with =
boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +    ;
> +
> +  sink(a & b);
> +  sink(a & foo());
> +  sink(foo() & bar());    // expected-warning {{use of bitwise '&' with =
boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +
> +  int n =3D i + 10;
> +  b =3D (n & (n - 1));
> +}
> diff --git a/clang/test/Sema/warn-bitwise-or-bool.c b/clang/test/Sema/war=
n-bitwise-or-bool.c
> new file mode 100644
> index 000000000000..ae86790901aa
> --- /dev/null
> +++ b/clang/test/Sema/warn-bitwise-or-bool.c
> @@ -0,0 +1,63 @@
> +// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wbool-operation %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -verify -Wall %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -Wbitwise-instead-of-logical -fdia=
gnostics-parseable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c -fsyntax-only -Wbool-operation -fdiagnostics-par=
seable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wbool-operation %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -verify -Wall %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbitwise-instead-of-logical -fd=
iagnostics-parseable-fixits %s 2>&1 | FileCheck %s
> +// RUN: %clang_cc1 -x c++ -fsyntax-only -Wbool-operation -fdiagnostics-p=
arseable-fixits %s 2>&1 | FileCheck %s
> +
> +#ifdef __cplusplus
> +typedef bool boolean;
> +#else
> +typedef _Bool boolean;
> +#endif
> +
> +boolean foo(void);
> +boolean bar(void);
> +boolean baz(void) __attribute__((const));
> +void sink(boolean);
> +
> +#define FOO foo()
> +
> +void test(boolean a, boolean b, int *p, volatile int *q, int i) {
> +  b =3D a | b;
> +  b =3D foo() | a;
> +  b =3D (p !=3D 0) | (*p =3D=3D 42);   // FIXME: also warn for a non-vol=
atile pointer dereference
> +  b =3D foo() | (*q =3D=3D 42);      // expected-warning {{use of bitwis=
e '|' with boolean operands}}
> +                               // expected-note@-1 {{cast one or both op=
erands to int to silence this warning}}
> +  b =3D foo() | (int)(*q =3D=3D 42); // OK, no warning expected
> +  b =3D a | foo();
> +  b =3D (int)a | foo();     // OK, no warning expected
> +  b =3D foo() | bar();      // expected-warning {{use of bitwise '|' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"||"
> +  b =3D foo() | !bar();     // expected-warning {{use of bitwise '|' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"||"
> +  b =3D foo() | (int)bar(); // OK, no warning expected
> +  b =3D a | baz();
> +  b =3D bar() | FOO;        // expected-warning {{use of bitwise '|' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +                          // CHECK: fix-it:"{{.*}}":{[[@LINE-2]]:13-[[@L=
INE-2]]:14}:"||"
> +  b =3D foo() | (int)FOO;   // OK, no warning expected
> +  b =3D b | foo();
> +  b =3D bar() | (i > 4);
> +  b =3D (i =3D=3D 7) | foo();
> +#ifdef __cplusplus
> +  b =3D foo() bitor bar();  // expected-warning {{use of bitwise '|' wit=
h boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +#endif
> +
> +  if (foo() | bar())      // expected-warning {{use of bitwise '|' with =
boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +    ;
> +
> +  sink(a | b);
> +  sink(a | foo());
> +  sink(foo() | bar());    // expected-warning {{use of bitwise '|' with =
boolean operands}}
> +                          // expected-note@-1 {{cast one or both operand=
s to int to silence this warning}}
> +
> +  int n =3D i + 10;
> +  b =3D (n | (n - 1));
> +}
> </cut>



--=20
Thanks,
~Nick Desaulniers
