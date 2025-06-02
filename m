Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DAB21E0BC
	for <llvm@lists.linux.dev>; Mon,  2 Jun 2025 13:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869747; cv=none; b=VkHneTax0VK2L62ApIxxHKsk0ifeN/45gKhUKbd+uyIbHB6AYaqAYsM75cYouKsRrfKYVYhlKMMU18wuo3lmo1efl+N68m4LUQhOYjx41Gw8b+fSdZU4ihmcxPEMNe7XF5QhWC+7Bgyqdd/01x7aVS6HPRPjXis2R7Zy3jWANUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869747; c=relaxed/simple;
	bh=g2X269NOH6qQm6UPr//itVwo1Ytwjj8NCbBtRIeXRE0=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=u48qyqIQCQmG0xImh8lh2jKa7MQlNWZskKqT7WHrpgmFfNhb+eF1nc7ct/8D9yIYePxTB0+3xzrPKyEPtxcFlxuG8eu9le20R/V3oR7OkeoQsGKuOMfv7dbRqUPpEk697Nf4L5CSiotkT+4qlzm3y5bfauP0MuB36UQOiznUaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7426c4e3d57so678907b3a.2
        for <llvm@lists.linux.dev>; Mon, 02 Jun 2025 06:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869744; x=1749474544;
        h=content-transfer-encoding:in-reply-to:cc:to:organization:from
         :references:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI/woEM8Ka/DHBZF5OWy20wop+FRMnbHHaSOGWyd1l4=;
        b=KzBBmlPyyotEVGlyPvNLnN63IN4WzuBKEEDD2qGlGKLsViLS/nSIxnp98iKVH5o6Gv
         2G79YwBH5FZKn4TJxoBLukVKl/v/8q6v9eEH+CDtvTXIFiUpg3LYAD0cJQaS33k3E5Tt
         UiPvMjYeVky/ZcFGeouZ5BkqJk9vksDflyoW3Ki3aHrlqEYzewbwPhbs5vyiNa9sfqpw
         2iXHCTxOgpViKtOGtbj1QzufRl5Q1LR/NywyB8sXvbSYM+BUUAyZ18EiY8rfgTVDZI3R
         d8YgBT6za2OuipGLDsZGb79v+mp5REZipbVuTdge1yd0Kf+19xdj3KLhlNZIK8A0g699
         2Nug==
X-Forwarded-Encrypted: i=1; AJvYcCXLHDcieW6AmhDgTcoHXhpPIDHP1Vbh7u7EtCdPOJKk4Braw6p1z7AduPRLpEN21fp4tAzW@lists.linux.dev
X-Gm-Message-State: AOJu0YyMnAVGarXc6Cu/AvlOHTdUmoXRtp3J5DNVnko4fA2qc9vRbajr
	7DdikhYJpZ5/qa9nUWCB3M6bYdZ1fms0+6xiw+aTxWy1hvUZptbN+vcK
X-Gm-Gg: ASbGncvgsNr4Nv6w8T7ErQV6Y+Rf2PnlMiCJMYLEf8Jj8AXld5Ec/OuLkn14hyHB3Vd
	a9bom5qUfPofv/hZdvUZC5cHARTo1NjLD/hfdiYaIci9xFiH8+w594Fw7VldDlVyKHrjuZnx3Z1
	gHrgop31X9YzDy8pJJIyEpreeUlilO/FDfpoiW+grQeESqcOEDQdD0HXW04Z67IDFZXnCbQI7kA
	BGkwjqkwWYMXOxVqTJRU9qIhRHf/GKiUHD15Nqzo2hrXqp0GfaX7TK60ymsocoNwmLITNHrpEFj
	uNL2oz339T8eb/GMbYJgxCTkgn1RB0+/nX8FDmg5KBgPOgzqGe5EOGKECdoP+yqDWA==
X-Google-Smtp-Source: AGHT+IH8x7Te/yrt980NAkGgBiL8M8s73dEIOJ/jsrawkzvLFSz1A++Cg1OgTYOIUm9U74GaRgTdGQ==
X-Received: by 2002:a05:6a00:4fd0:b0:742:938a:3ece with SMTP id d2e1a72fcca58-747c0f1e4b7mr6423422b3a.6.1748869744367;
        Mon, 02 Jun 2025 06:09:04 -0700 (PDT)
Received: from [192.168.219.102] ([112.148.241.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeabc6asm7831875b3a.53.2025.06.02.06.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 06:09:03 -0700 (PDT)
Message-ID: <659d07c1-f415-432e-bb9e-5a2c0afcf195@kzalloc.com>
Date: Mon, 2 Jun 2025 22:08:58 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Clang compilation error in Arm64 Linux kernel with DEPT patch: cannot
 jump from this indirect goto statement to one of its possible targets
Content-Language: en-US
References: <693e0aa4-34cd-4cb8-88a2-2cbacbe99a42@kzalloc.com>
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
To: llvm@npopov.com, npopov@redhat.com, peter@pcc.me.uk,
 aaron@aaronballman.com, amara@apple.com, corentin.jabot@gmail.com,
 rnk@google.com
Cc: Kees Cook <keescook@chromium.org>, Byungchul Park <byungchul@sk.com>,
 ", max.byungchul.park@gmail.com" <max.byungchul.park@gmail.com>,
 Yeo Reum Yun <YeoReum.Yun@arm.com>, Yunseong Kim
 <yunseong.kim@ericsson.com>,
 "kernel_team@skhynix.com" <kernel_team@skhynix.com>, llvm@lists.linux.dev
In-Reply-To: <693e0aa4-34cd-4cb8-88a2-2cbacbe99a42@kzalloc.com>
X-Forwarded-Message-Id: <693e0aa4-34cd-4cb8-88a2-2cbacbe99a42@kzalloc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear LLVM/Clang Developers,

I'm encountering a compilation error when building the Arm64 Linux kernel with
Clang(clang version 20.1.3 (Fedora 20.1.3-1.fc42)) after applying a DEPT
(Dynamic Execution Path Tracing) patch.
Link: https://lore.kernel.org/all/20250519091826.19752-1-byungchul@sk.com/

The error occurs in “drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c” and is related to
an indirect ‘goto’ jumping into a statement expression. This issue does not
occur when compiling with GCC(gcc version 15.1.1 20250425
(Red Hat 15.1.1-1)).


Problem Description:

The core error message is:
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1372:3: error: cannot jump from this indirect goto statement to one of its possible targets
 1372 |                 drm_exec_retry_on_contention(&exec);
      |                 ^

Followed by notes showing the expansion:

./include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
  123 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: possible target of indirect goto statement
 1399 |         dma_fence_wait(fence, false);
      |         ^
./include/linux/dma-fence.h:679:2: note: expanded from macro 'dma_fence_wait'
  679 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:45:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
   45 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
      |                                                           ^
./include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
      |                                         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: jump enters a statement expression
./include/linux/dma-fence.h:679:2: note: expanded from macro 'dma_fence_wait'
  679 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:45:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
   45 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
      |                                                           ^
./include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
      |                    ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: jump enters a statement expression
./include/linux/dma-fence.h:675:38: note: expanded from macro 'dma_fence_wait'
  675 | #define dma_fence_wait(f, intr)                                         \
      |                                                                         ^
1 error generated.


Context and Analysis:

1. “ _THIS_IP_” Macro: This macro, defined in
   “include/linux/instruction_pointer.h”, uses a GNU C statement expression with
   an address-of-label (&&__here) to obtain the current instruction pointer.

2. Code Flow:
    The “drm_exec_retry_on_contention” macro (from include/drm/drm_exec.h)
    expands to an indirect ‘goto’ statement (goto *_drm_exec_retry_ptr;). This
    pointer is set within the “drm_exec_until_all_locked” macro. One of the
    possible targets of this indirect ‘goto’ (as identified by Clang) is a line
    within the “dma_fence_wait()” function call.
    “dma_fence_wait()” (from include/linux/dma-fence.h) calls
    “sdt_might_sleep_start_timeout” (from include/linux/dept_sdt.h).
    “sdt_might_sleep_start_timeout” then utilizes the “_THIS_IP_” macro.

3.  The Problem:
    Clang reports an error because the indirect ‘goto’  from
    “drm_exec_retry_on_contention” attempts to jump into the statement
    expression generated by “_THIS_IP_”. The diagnostic “note: jump enters
    a statement expression” is the key.


Comparison with GCC:

GCC compiles this code without errors. This highlights a difference in how GCC
and Clang handle GNU extensions like statement expressions and
address-of-labels, especially when combined with indirect ‘goto’ for control
flow. GCC appears more lenient or implements these features differently.


Relevant LLVM Issues/Patches:

1. LLVM Issue 138272 (Add builtin/intrinsic to get current instruction pointer):
   Link: https://github.com/llvm/llvm-project/issues/138272
   This issue discusses the problematic nature of _THIS_IP_'s usage in LLVM.
   It indicates that ‘blockaddress’ (LLVM's representation for ‘&&label’) has
   defined behavior only when used as an operand to “indirectbr” or for null
   comparisons. Using it merely to obtain the instruction pointer violates
   LLVM's requirements.


2. LLVM Patch D154696 ([Clang] Diagnose jumps into statement expressions):
   Link: https://reviews.llvm.org/D154696
   This patch directly addresses the issue of jumps into statement expressions.
   It was initially reverted due to breaking the Linux kernel build but was
   later relanded. This shows Clang's active effort to enforce stricter
   diagnostics for such constructs, which GCC's documentation also implicitly
   states as undefined behavior.


3. LLVM Issue 28019 (Wrong 'error: cannot jump from this indirect goto statement
   to one of its possible targets'):
   Link: https://github.com/llvm/llvm-project/issues/28019
   While not directly about statement expressions, this issue describes a
   similar error where Clang flags an indirect ‘goto’ bypassing VLA
   initialization. This reinforces Clang's conservative static analysis and its
   tendency to diagnose potential undefined behavior.


Conclusion and Request:

The compilation error seems to stem from Clang's stricter adherence to LLVM's
‘blockaddress’ usage rules and its diagnostics for jumps into statement
expressions, which Clang considers undefined behavior. The DEPT patch integrates
“sdt_might_sleep_start_timeout” into the “dma_fence_wait” call path, exposing
this problematic pattern when combined with “drm_exec_retry_on_contention”.


I haven't found any specific Clang compiler options that would allow us to
disable this diagnostic or work around the issue.

Could you please provide guidance on how to address this compilation error? Is
this a known limitation or an intended diagnostic behavior that kernel
developers need to adapt to? Are there any recommended patterns or compiler
flags that could mitigate this issue without fundamentally altering the kernel's
use of these GNU extensions?


Thank you for your time and assistance.

Sincerely,
Yunseong Kim
