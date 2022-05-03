Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89202F44
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 13:35:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id w1so30336182lfa.4
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TWGsMBVGvu/Fp5R0M3POyWDAk7vDI4eYhHqZY71K6kk=;
        b=aQHAM8uTJUkOsP+/hK1gpr5YXeePoNNTnVgDVOOyuLvPyZ4WNUZf+4ZJRQg/TSb97/
         o6rKC0UjZuzxu3gaz4ruP3547JLBV+domJGdYhw/QvzIUDu+/a6Vi9LxVNNJVI/utrgd
         0t+P42c361xEUNOv5d+VXYHvlmAtYoVBhw9iJbFn3Lj50StJ80xEKWawau9HJFqwc6vM
         PjqiqLWYbQwohYW+YJ7HtqZ5aUH+y/Zu2pkH4dnxlynnbGbR2jNEXUiU04XpklivyE/4
         wepjRXldZxphiKZPN7mKA0K7bC0ZwN/7OwDk/IMIsUO5zix8RzXYvy7NmzLqrsFSypTM
         x5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=TWGsMBVGvu/Fp5R0M3POyWDAk7vDI4eYhHqZY71K6kk=;
        b=I+A6bSJyj6LIDSrEn/hd7IlpEs+6VxApf3cKSE9sTIML4Vp3vvUHKx+3I7K75Oadm2
         s+BUC4wLEeH/0Vaor/VOjVFaJgMGTNzCCUQQcNllMivR8J6sRSdXJzxbf19B493T713a
         hRRzLL5IzS94cjsEExiIDuAqAUzCM9BjMV/znFCkED3ZylxfRQWAoi/Z88PPMcUUhYmr
         Kv6f+UHKU3HKLKKGgUmUOzcI52qNXGR4fd1yh82H2lDIH2NrXdqNdfAqOazVzK2smthu
         nXA/QpJMDubWsd3pORpXaqEJlDVoLzF0VZBKUfc20HE1hPngGNwd6NFv5Z0hrbJnFDwP
         VI5g==
X-Gm-Message-State: AOAM531rY1j27Og3UJmhJmKxxs0i0Pm/u9MYQr/6Wzdbig44zjmwzVwB
	ixG8b/qRsbl1X0kioucIbhSZ
X-Google-Smtp-Source: ABdhPJzPJMQvOkg7RWt+Wqk34tkICVJe1ptWtu/7JBXwp7VsGhvVR9X4PIystdelTeHqX7P6vWBprg==
X-Received: by 2002:a05:6512:3b26:b0:473:a671:eff2 with SMTP id f38-20020a0565123b2600b00473a671eff2mr3092557lfv.500.1651584906705;
        Tue, 03 May 2022 06:35:06 -0700 (PDT)
Received: from smtpclient.apple ([31.173.83.165])
        by smtp.gmail.com with ESMTPSA id w16-20020a05651c119000b0024f3d1daed1sm1367628ljo.89.2022.05.03.06.35.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 May 2022 06:35:06 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset
 representation
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
Date: Tue, 3 May 2022 16:35:04 +0300
Cc: Nikita Popov <npopov@redhat.com>,
 llvm@lists.linux.dev,
 ci_notify@linaro.org,
 Nathan Chancellor <nathan@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7230BF09-41E5-44C7-A3B4-C1FD017C277C@linaro.org>
References: <962475179.3377.1651244787786@jenkins.jenkins>
 <CAKwvOdkR3tVWo9iGLryoAzY4x7BfDMCLDSx9jnd+p7-hKXD5qg@mail.gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)

> On Apr 29, 2022, at 8:20 PM, Nick Desaulniers =
<ndesaulniers@google.com> wrote:
>=20
> On Fri, Apr 29, 2022 at 8:06 AM <ci_notify@linaro.org> wrote:
>>=20
>> [TCWG CI] Regression caused by llvm: [GVN] Encode GEPs in offset =
representation:
>> commit b9dc5651477b4c3c132662e763308b27963248a9
>> Author: Nikita Popov <npopov@redhat.com>
>>=20
>> [GVN] Encode GEPs in offset representation
>>=20
>> Results regressed to
>> # reset_artifacts:
>> -10
>> # build_abe binutils:
>> -9
>> # build_llvm:
>> -5
>> # build_abe qemu:
>> -2
>> # linux_n_obj:
>> 22258
>> # First few build errors in logs:
>> # 00:02:56 arch/arm/lib/xor-neon.c:30:2: error: This code requires at =
least version 4.6 of GCC [-Werror,-W#warnings]
>=20
> Hi Maxim, can you please confirm this is the correct result of the
> bisection? The above warning on the kernel is a known issue that has
> been fixed upstream. Are the kernel builds not against mainline?
>=20
> I believe the below are known issues as well.

Hi Nick,

See below ...

>=20
>> # 00:02:56 make[1]: *** [scripts/Makefile.build:288: =
arch/arm/lib/xor-neon.o] Error 1
>> # 00:02:56 make: *** [Makefile:1831: arch/arm/lib] Error 2
>> # 00:03:54 crypto/wp512.c:782:13: error: stack frame size (1168) =
exceeds limit (1024) in 'wp512_process_buffer' =
[-Werror,-Wframe-larger-than]
>> # 00:03:54 make[1]: *** [scripts/Makefile.build:288: crypto/wp512.o] =
Error 1
>> # 00:06:35 make: *** [Makefile:1831: crypto] Error 2
>> # 00:11:56 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: =
stack frame size (1040) exceeds limit (1024) in '__igt_reserve' =
[-Werror,-Wframe-larger-than]
>> # 00:11:56 make[4]: *** [scripts/Makefile.build:288: =
drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
>> # 00:12:06 make[3]: *** [scripts/Makefile.build:550: =
drivers/gpu/drm/selftests] Error 2
>> # 00:30:12 =
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: =
error: stack frame size (1432) exceeds limit (1024) in 'bw_calcs' =
[-Werror,-Wframe-larger-than]
>>=20
>> from
>> # reset_artifacts:
>> -10
>> # build_abe binutils:
>> -9
>> # build_llvm:
>> -5
>> # build_abe qemu:
>> -2
>> # linux_n_obj:
>> 22260
>>=20
>> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>>=20
>> This commit has regressed these CI configurations:
>> - tcwg_kernel/llvm-master-arm-stable-allmodconfig

This is reported against "stable" Linux tree, aka linux-rolling-stable =
branch [1].  So yeah, it's not a report about a new regression, but =
rather a report about regression reaching a stable branch.

Does this answer your question?  Or is the report still looks not right?

[1] =
https://git.linaro.org/ci/job/configs.git/tree/tcwg_kernel.yaml.in#n42

Regards,

--
Maxim Kuvyrkov
https://www.linaro.org



>>=20
>> First_bad build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/build-b9dc5651477b4c3c132662e763308b2796=
3248a9/
>> Last_good build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/build-942ec5c36d922b29d0e7200082b533018d=
42421a/
>> Baseline build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/build-baseline/
>> Even more details: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/
>>=20
>> Reproduce builds:
>> <cut>
>> mkdir investigate-llvm-b9dc5651477b4c3c132662e763308b27963248a9
>> cd investigate-llvm-b9dc5651477b4c3c132662e763308b27963248a9
>>=20
>> # Fetch scripts
>> git clone https://git.linaro.org/toolchain/jenkins-scripts
>>=20
>> # Fetch manifests and test.sh script
>> mkdir -p artifacts/manifests
>> curl -o artifacts/manifests/build-baseline.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/manifests/build-baseline.sh --fail
>> curl -o artifacts/manifests/build-parameters.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/manifests/build-parameters.sh --fail
>> curl -o artifacts/test.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-arm-stable-a=
llmodconfig/12/artifact/artifacts/test.sh --fail
>> chmod +x artifacts/test.sh
>>=20
>> # Reproduce the baseline build (build all pre-requisites)
>> ./jenkins-scripts/tcwg_kernel-build.sh @@ =
artifacts/manifests/build-baseline.sh
>>=20
>> # Save baseline build state (which is then restored in =
artifacts/test.sh)
>> mkdir -p ./bisect
>> rsync -a --del --delete-excluded --exclude /bisect/ --exclude =
/artifacts/ --exclude /llvm/ ./ ./bisect/baseline/
>>=20
>> cd llvm
>>=20
>> # Reproduce first_bad build
>> git checkout --detach b9dc5651477b4c3c132662e763308b27963248a9
>> ../artifacts/test.sh
>>=20
>> # Reproduce last_good build
>> git checkout --detach 942ec5c36d922b29d0e7200082b533018d42421a
>> ../artifacts/test.sh
>>=20
>> cd ..
>> </cut>
>>=20
>> Full commit (up to 1000 lines):
>> <cut>
>> commit b9dc5651477b4c3c132662e763308b27963248a9
>> Author: Nikita Popov <npopov@redhat.com>
>> Date:   Wed Apr 27 14:40:07 2022 +0200
>>=20
>>    [GVN] Encode GEPs in offset representation
>>=20
>>    When using opaque pointers, convert GEPs into offset =
representation
>>    of the form P + V1 * Scale1 + V2 * Scale2 + ... + ConstantOffset.
>>    This allows us to recognize equivalent address calculations even =
if
>>    the GEPs don't use the same source element type.
>>=20
>>    This fixes an opaque pointer codegen regression seen in rustc.
>>=20
>>    Differential Revision: https://reviews.llvm.org/D124527
>> ---
>> llvm/include/llvm/Transforms/Scalar/GVN.h |  2 ++
>> llvm/lib/Transforms/Scalar/GVN.cpp        | 45 =
+++++++++++++++++++++++++------
>> llvm/test/Transforms/GVN/opaque-ptr.ll    | 19 +++++--------
>> 3 files changed, 46 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/llvm/include/llvm/Transforms/Scalar/GVN.h =
b/llvm/include/llvm/Transforms/Scalar/GVN.h
>> index d6f4e7376065..16ab1a490162 100644
>> --- a/llvm/include/llvm/Transforms/Scalar/GVN.h
>> +++ b/llvm/include/llvm/Transforms/Scalar/GVN.h
>> @@ -40,6 +40,7 @@ class CallInst;
>> class ExtractValueInst;
>> class Function;
>> class FunctionPass;
>> +class GetElementPtrInst;
>> class ImplicitControlFlowTracking;
>> class LoadInst;
>> class LoopInfo;
>> @@ -177,6 +178,7 @@ public:
>>     Expression createCmpExpr(unsigned Opcode, CmpInst::Predicate =
Predicate,
>>                              Value *LHS, Value *RHS);
>>     Expression createExtractvalueExpr(ExtractValueInst *EI);
>> +    Expression createGEPExpr(GetElementPtrInst *GEP);
>>     uint32_t lookupOrAddCall(CallInst *C);
>>     uint32_t phiTranslateImpl(const BasicBlock *BB, const BasicBlock =
*PhiBlock,
>>                               uint32_t Num, GVNPass &Gvn);
>> diff --git a/llvm/lib/Transforms/Scalar/GVN.cpp =
b/llvm/lib/Transforms/Scalar/GVN.cpp
>> index e0d78c944edb..34c1483a37e0 100644
>> --- a/llvm/lib/Transforms/Scalar/GVN.cpp
>> +++ b/llvm/lib/Transforms/Scalar/GVN.cpp
>> @@ -307,13 +307,7 @@ struct llvm::gvn::AvailableValueInBlock {
>>=20
>> GVNPass::Expression GVNPass::ValueTable::createExpr(Instruction *I) {
>>   Expression e;
>> -  // For GEPs, disambiguate based on the source element type, which =
is not
>> -  // implied by the result type with opaque pointers. (Conversely, =
the source
>> -  // element type together with the operand types does imply the =
result type.)
>> -  if (const auto *GEP =3D dyn_cast<GetElementPtrInst>(I))
>> -    e.type =3D GEP->getSourceElementType();
>> -  else
>> -    e.type =3D I->getType();
>> +  e.type =3D I->getType();
>>   e.opcode =3D I->getOpcode();
>>   if (const GCRelocateInst *GCR =3D dyn_cast<GCRelocateInst>(I)) {
>>     // gc.relocate is 'special' call: its second and third operands =
are
>> @@ -404,6 +398,39 @@ =
GVNPass::ValueTable::createExtractvalueExpr(ExtractValueInst *EI) {
>>   return e;
>> }
>>=20
>> +GVNPass::Expression =
GVNPass::ValueTable::createGEPExpr(GetElementPtrInst *GEP) {
>> +  Expression E;
>> +  Type *PtrTy =3D GEP->getType()->getScalarType();
>> +  const DataLayout &DL =3D GEP->getModule()->getDataLayout();
>> +  unsigned BitWidth =3D DL.getIndexTypeSizeInBits(PtrTy);
>> +  MapVector<Value *, APInt> VariableOffsets;
>> +  APInt ConstantOffset(BitWidth, 0);
>> +  if (PtrTy->isOpaquePointerTy() &&
>> +      GEP->collectOffset(DL, BitWidth, VariableOffsets, =
ConstantOffset)) {
>> +    // For opaque pointers, convert into offset representation, to =
recognize
>> +    // equivalent address calculations that use different type =
encoding.
>> +    LLVMContext &Context =3D GEP->getContext();
>> +    E.opcode =3D GEP->getOpcode();
>> +    E.type =3D nullptr;
>> +    E.varargs.push_back(lookupOrAdd(GEP->getPointerOperand()));
>> +    for (const auto &Pair : VariableOffsets) {
>> +      E.varargs.push_back(lookupOrAdd(Pair.first));
>> +      E.varargs.push_back(lookupOrAdd(ConstantInt::get(Context, =
Pair.second)));
>> +    }
>> +    if (!ConstantOffset.isZero())
>> +      E.varargs.push_back(
>> +          lookupOrAdd(ConstantInt::get(Context, ConstantOffset)));
>> +  } else {
>> +    // If converting to offset representation fails (for typed =
pointers and
>> +    // scalable vectors), fall back to type-based implementation:
>> +    E.opcode =3D GEP->getOpcode();
>> +    E.type =3D GEP->getSourceElementType();
>> +    for (Use &Op : GEP->operands())
>> +      E.varargs.push_back(lookupOrAdd(Op));
>> +  }
>> +  return E;
>> +}
>> +
>> =
//=3D=3D=3D---------------------------------------------------------------=
-------=3D=3D=3D//
>> //                     ValueTable External Functions
>> =
//=3D=3D=3D---------------------------------------------------------------=
-------=3D=3D=3D//
>> @@ -587,9 +614,11 @@ uint32_t GVNPass::ValueTable::lookupOrAdd(Value =
*V) {
>>     case Instruction::InsertElement:
>>     case Instruction::ShuffleVector:
>>     case Instruction::InsertValue:
>> -    case Instruction::GetElementPtr:
>>       exp =3D createExpr(I);
>>       break;
>> +    case Instruction::GetElementPtr:
>> +      exp =3D createGEPExpr(cast<GetElementPtrInst>(I));
>> +      break;
>>     case Instruction::ExtractValue:
>>       exp =3D createExtractvalueExpr(cast<ExtractValueInst>(I));
>>       break;
>> diff --git a/llvm/test/Transforms/GVN/opaque-ptr.ll =
b/llvm/test/Transforms/GVN/opaque-ptr.ll
>> index fa203da28bb7..07e336a9e0b6 100644
>> --- a/llvm/test/Transforms/GVN/opaque-ptr.ll
>> +++ b/llvm/test/Transforms/GVN/opaque-ptr.ll
>> @@ -25,32 +25,26 @@ define void @gep_cse(ptr %p) {
>> define void @gep_cse_offset_canonicalization(ptr %p, i64 %idx, i64 =
%idx2) {
>> ; CHECK-LABEL: @gep_cse_offset_canonicalization(
>> ; CHECK-NEXT:    [[GEP1:%.*]] =3D getelementptr i64, ptr [[P:%.*]], =
i64 1
>> -; CHECK-NEXT:    [[GEP1_SAME1:%.*]] =3D getelementptr i32, ptr =
[[P]], i64 2
>> -; CHECK-NEXT:    [[GEP1_SAME2:%.*]] =3D getelementptr i8, ptr [[P]], =
i64 8
>> ; CHECK-NEXT:    [[GEP1_DIFFERENT:%.*]] =3D getelementptr i8, ptr =
[[P]], i64 12
>> ; CHECK-NEXT:    call void @use(ptr [[GEP1]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP1_SAME1]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP1_SAME2]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP1]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP1]])
>> ; CHECK-NEXT:    call void @use(ptr [[GEP1_DIFFERENT]])
>> ; CHECK-NEXT:    [[GEP2:%.*]] =3D getelementptr i64, ptr [[P]], i64 =
[[IDX:%.*]]
>> -; CHECK-NEXT:    [[GEP2_SAME:%.*]] =3D getelementptr { i32, i32 }, =
ptr [[P]], i64 [[IDX]]
>> ; CHECK-NEXT:    [[GEP2_DIFFERENT:%.*]] =3D getelementptr { i32, i32, =
i32 }, ptr [[P]], i64 [[IDX]]
>> ; CHECK-NEXT:    call void @use(ptr [[GEP2]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP2_SAME]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP2]])
>> ; CHECK-NEXT:    call void @use(ptr [[GEP2_DIFFERENT]])
>> ; CHECK-NEXT:    [[GEP3:%.*]] =3D getelementptr { [0 x i32], [0 x =
i32] }, ptr [[P]], i64 0, i32 0, i64 [[IDX]]
>> -; CHECK-NEXT:    [[GEP3_SAME1:%.*]] =3D getelementptr { [0 x i32], =
[0 x i32] }, ptr [[P]], i64 0, i32 1, i64 [[IDX]]
>> -; CHECK-NEXT:    [[GEP3_SAME2:%.*]] =3D getelementptr { [0 x i32], =
[0 x i32] }, ptr [[P]], i64 1, i32 0, i64 [[IDX]]
>> ; CHECK-NEXT:    [[GEP3_DIFFERENT:%.*]] =3D getelementptr { [0 x =
i32], [0 x i32] }, ptr [[P]], i64 0, i32 0, i64 [[IDX2:%.*]]
>> ; CHECK-NEXT:    call void @use(ptr [[GEP3]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP3_SAME1]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP3_SAME2]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP3]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP3]])
>> ; CHECK-NEXT:    call void @use(ptr [[GEP3_DIFFERENT]])
>> ; CHECK-NEXT:    [[GEP4:%.*]] =3D getelementptr [4 x i32], ptr [[P]], =
i64 [[IDX]], i64 [[IDX2]]
>> -; CHECK-NEXT:    [[GEP4_SAME:%.*]] =3D getelementptr [4 x float], =
ptr [[P]], i64 [[IDX]], i64 [[IDX2]]
>> ; CHECK-NEXT:    [[GEP4_DIFFERENT:%.*]] =3D getelementptr [4 x =
float], ptr [[P]], i64 [[IDX2]], i64 [[IDX]]
>> ; CHECK-NEXT:    call void @use(ptr [[GEP4]])
>> -; CHECK-NEXT:    call void @use(ptr [[GEP4_SAME]])
>> +; CHECK-NEXT:    call void @use(ptr [[GEP4]])
>> ; CHECK-NEXT:    call void @use(ptr [[GEP4_DIFFERENT]])
>> ; CHECK-NEXT:    [[GEP5:%.*]] =3D getelementptr <vscale x 2 x i32>, =
ptr [[P]], i64 1
>> ; CHECK-NEXT:    [[GEP5_SAME:%.*]] =3D getelementptr <vscale x 2 x =
float>, ptr [[P]], i64 1
>> @@ -88,6 +82,7 @@ define void @gep_cse_offset_canonicalization(ptr =
%p, i64 %idx, i64 %idx2) {
>>   call void @use(ptr %gep4)
>>   call void @use(ptr %gep4.same)
>>   call void @use(ptr %gep4.different)
>> +  ; TODO: %gep5 and %gep5.same are equivalent as well.
>>   %gep5 =3D getelementptr <vscale x 2 x i32>, ptr %p, i64 1
>>   %gep5.same =3D getelementptr <vscale x 2 x float>, ptr %p, i64 1
>>   %gep5.different =3D getelementptr <vscale x 2 x i64>, ptr %p, i64 1
>> </cut>
>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers

