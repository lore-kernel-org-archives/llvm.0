Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6A543B6EA
	for <llvm@lists.linux.dev>; Tue,  4 Aug 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850853; cv=none; b=jYei98HwfvcQOyFYOV0DGmlwwS/Yd3hRH+Kum3n15tJiaJoNjdRZdpKQpMF+6TH2++UOMiYCMHPTxz98CctbybhZiMuDmshjzfshSh1zoCfY7x8ohyPrKDNv0D4Wszrm8IXeM8FoOrM8vyu6sAsBnlG5vkoDjnCNeORtexnBEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850853; c=relaxed/simple;
	bh=Ei0nC6o3VFk5Hi+P363oPEanjTU1vQlPyAM5kCKHQKk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QoqJheHFmKxiC2gpQ2Va3THtQ2BfEDEkply9EXwZNY8u5e1ikoNWLyCDgyvLyCtxmRZTpbs/su83xyUkF56/1TuzN0lKv2VlAUp0L2T0K333dKItjmpBwyrJ4q9tT3RKfypdSUzbcVWmn4160PNcEsaaRC7KFHamdY+uFeHqCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LYHS1ghz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YPq5TFZj; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LYHS1ghz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YPq5TFZj"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 61EAD130019F;
	Tue,  4 Aug 2026 09:40:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 09:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785850849;
	 x=1785854449; bh=NIbc0K2StO7BcCgQ5CKrDLLWWeUMON+1oM/RNYmggp8=; b=
	LYHS1ghzBp8q3k0NzkeFLfi77/qqwwkZ7C4ZezdZomIolet9puj/xEnPW9MZHQzi
	+RpcuXqy+2xzNH8uAEAkywgDQzo2BFlAwtHGf5ZnNEe+h7XTon0gKu4A8bTCRzXG
	CU0/Gq++TB03tfS+FR7HJSJ8TzlNgLfIT5gOzcCVLDWkLUD4p54BH3fxtw0i/IE5
	JPY5f2SuKQ5KlAtCEe4VAhpTBmKv9K0dCrHwZHIFbedbo3SBAIdC/L0BSYKyq1Hd
	YbAdlBUH88oEFLWhr7SMwByAZF+Pi7EviuvIB9vqq69hSWNgUH4Yvo/ZXj9qrFFz
	AQnbY53s3Kq7jgldvUzUfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785850849; x=
	1785854449; bh=NIbc0K2StO7BcCgQ5CKrDLLWWeUMON+1oM/RNYmggp8=; b=Y
	Pq5TFZj399J+/fLTUjxUcneICGMajyBW0R7N8h24FScGXVNRIJBdQL/lzuAitDTN
	yu587S8eZYRUpGFu0eXzyG2quYRPEpUVt7aGSMLJ3Kk+qxuSebmXOlXI6l8Aw3pf
	Hl5We2Wd1BqKT0zRCNWL79WRKCqPnNCCh8EEosuPZvrA7PtK6DreZ9Wjfepo6OcX
	y/KtPXWvYjLqd5nUmeXYZD5+aQgL49xMvw/SkhokAJAsyMFAy6pASlONl42aqWUy
	0GAxAaPjoudGRlzNktqHx+5LYKTqTiSrMO6FdCiDQmrmwExQec2U3tjaEp1gl8q3
	1zBWgrXIB1rQ87IbzgKnA==
X-ME-Sender: <xms:3-txaojAtWWjriFj4-SxDhzATZ62i6BasVkL1NsTSbmG-2k5kJQ6Ew>
    <xme:3-txasKSMEtqzXXiy8JOPG4QlNriudVQqBRM5m0jBHWz96QB6uTNpBff1f2rMf19E
    hYCfx-L12qHlbBt8LUw7g_78I6q9QXX4Kl4njP98WiwMFeYFX6hkAVa>
X-ME-Received: <xmr:3-txamdvDsEeM0hTOjDjsiUO6GcM3mVgrBjXU2bJd26bQRjFd7YcSlhenDB0kEYG-DxQXs7E1ePse1Llz2nNBiDi>
X-ME-Proxy-Cause: dmFkZTGtXecbawDpvriCKcFN9iS+RrBAxu/yPKAHhyfKjKEgzYVc5Wk4JyGyKuPVxauwbe
    ybv/17EzmXYiLoMh+Z6pE86f9SJQ1Ro4F5EBeuMbK98dOy36dVepIBMUsp2fuDCYWYciVz
    9jLhxokDTufHUzIbkLxz1pO1o2/rYqNr5muHUDAfo1Gz6Gp4barEZW9/RBlpwGwIU4KfAb
    0hJW5nDGhYyfTQYuh4PSXfZMll7AV1kFHYcKEBYhGVLZISyRfKFRVQB5qtLWlcnPnu0jEs
    Lkl/OpxOX5cUR+ZXHMNAbj9dfo8YdZBqdnw0YFDQAJ5xB6ZjJN9dmb7X77ARCnjTtdiJnm
    tU4sGrCBtsikDbGbMgMv9u7M+5VEdJY9gEUyK5st9U69y66U5NDWbksVtLQ7q7Z+CcHuJY
    pM3Jp49maRpeOLVyKfj8DVj25bv+pi2aWFlmF6le+LtUlVv0IqYNxKE2k7opuqhVmmwPKj
    PYsQyrVGVaKM6o/1RN7d34mruJcOGLN0sedia9uyrDWnNA3/wTcVFkqx6FEXQcVs3fu+sn
    GC+WVbFFM8GR9KzongTjMCQXqh9EEDnXH+T9wG0DBcMgvmvj1Y+mMRqjC/Wl/03lqyuytP
    PFKwqkkeOelgPqNi/JXkm5fW4EjqzbDAnGf+XadvyfseMVetIJBYmfMGhogA
X-ME-Proxy: <xmx:3-txakPpwnI2Dp4yleLxd7JH4RfHtO6VLo6aan9lWl3ZODT2KefR7g>
    <xmx:3-txaoK4A_KvEEEPF8QnVnMfSw6orurPTp7P37bO5C-XSZBLNj8jaw>
    <xmx:3-txaj2pNcz568qAv2-nqk7gpGSd83qwOMt5leao2dluheMqoCg60Q>
    <xmx:3-txasV6Xc0c4DlwWD_csKRnmDNzGwc3cCZqEgOXJj7Cx0yNl2SfrQ>
    <xmx:4OtxanWAlXJ8KrV4c0xAHFPr0IQYul3sAd7ZEJgUCB2Qdy-ZspDz_mQw>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 09:40:39 -0400 (EDT)
Date: Tue, 04 Aug 2026 22:40:35 +0900 (JST)
Message-Id: <20260804.224035.269658578200153488.tomo@flapping.org>
To: linkmauve@linkmauve.fr
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, fujita.tomonori@gmail.com, joelagnelf@nvidia.com,
 gregkh@linuxfoundation.org, prafulrai522@gmail.com, nsc@kernel.org,
 japo@linux.ibm.com, lina+kernel@asahilina.net, j@jannau.net,
 airlied@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, mkchauras@gmail.com
Subject: Re: [PATCH V17 0/7] Rust Support for powerpc
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <anG67Q6Y59kDqh-c@desktop>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
	<178574013457.29744.6211258618175255546.b4-ty@linux.ibm.com>
	<anG67Q6Y59kDqh-c@desktop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 4 Aug 2026 12:11:57 +0200
Link Mauve <linkmauve@linkmauve.fr> wrote:

> Hi,
> 
> On Mon, Aug 03, 2026 at 12:27:13PM +0530, Madhavan Srinivasan wrote:
>> On Wed, 08 Jul 2026 13:54:47 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
>> > Enable experimental rust support for ppc64le and ppc32be. The patch for
>> > ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
>> > merged over it. ppc32 needs some toolchain fixes mentioned in the patch
>> > `rust: Add PowerPC support` and the discussion for that is done here[1].
>> > 
>> > This has been tested on
>> > - powernv9 hardware
>> > - pseries P11 hardware
>> > - pseries(9, 10) qemu
>> > - powernv(9, 10) qemu
>> > - rustdoc on x86 and powerpc64le
>> > - rusttest on x86 and powerpc64le
>> > 
>> > [...]
>> 
>> Applied to powerpc/next.
>> 
>> [1/7] rust: Fix "multiple candidates for rmeta dependency core" error
>>       https://git.kernel.org/powerpc/c/00cdfd072c709c608606461d7d44d4613119bfa9
>> [2/7] dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is disabled
>>       https://git.kernel.org/powerpc/c/be809b60cbb61aab96179f44ac3670242ae72996
>> [3/7] powerpc/jump_label: adjust inline asm to be consistent
>>       https://git.kernel.org/powerpc/c/13244c0a40139fe66c4c5c5655f4d732a6002957
>> [4/7] rust/powerpc: Set min rustc version for powerpc
>>       https://git.kernel.org/powerpc/c/e299147cdc8e19c6421a6b7863dc82a35b09d967
>> [5/7] rust: Make __udivdi3() and __umoddi3() panic
>>       https://git.kernel.org/powerpc/c/c93c194e4ee71a734986fd99a8b1ec9fbb7a9b8b
>> [6/7] rust: Add PowerPC support
>>       https://git.kernel.org/powerpc/c/73b741adb264967093ef4eb59905618a7e0d0de0
>> [7/7] powerpc: Enable Rust for ppc64le
>>       https://git.kernel.org/powerpc/c/bc87cbdb952e9223616b839d64bdb4723aa2ed1d
>> 
>> cheers
>> 
> 
> I just tested those again in linux-next, with the Wii support series on
> top, but now the kernel fails to build due to ARCH_WARN_ASM and
> ARCH_WARN_REACHABLE not being defined on PowerPC:
> ```
> error: no rules expected `ARCH_WARN_ASM`
>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
>     |
>   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
>     |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
>     |
>    ::: ../rust/kernel/lib.rs:279:1
>     |
> 279 | macro_rules! concat_literals {
>     | ---------------------------- when calling this macro
>     |
>     = note: while trying to match sequence start
> 
> error: no rules expected `ARCH_WARN_REACHABLE`
>    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
>     |
>   1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
>     |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
>     |
>    ::: ../rust/kernel/lib.rs:279:1
>     |
> 279 | macro_rules! concat_literals {
>     | ---------------------------- when calling this macro
>     |
>     = note: while trying to match sequence start
> 
> error: aborting due to 2 previous errors
> ```
> 
> This is in addition to the bindings::kvfree_call_rcu() call, but that
> one is already being handled in a different thread.

Looks like powerpc needs something like the followings:

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..8aba39e0cf26 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.4byte " file " - .\n"		\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(file, line, flags)	\
+		".org 2b+" size "\n"			\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
