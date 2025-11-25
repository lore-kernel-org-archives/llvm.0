Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902142D7DD9;
	Tue, 25 Nov 2025 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764056328; cv=none; b=mJxIAym0J3CfdbrUCNlMNdC3Nr/I0GVAwywreFZJylwnwaNsUdGKuzTSO+DINA8ueYUVvcGBnqAMgfewdqytC7Rw3FTBlZC/S/cVZJ3eeh4MwQ81DDcWrBGA9br9TiLviWu+w2anoDJFe4iVYDSQdyFpkoC0JHW4pvuAgv82U6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764056328; c=relaxed/simple;
	bh=V446la7lPJcpR4QJvyHjkwF5F2AFxzrJ0W2j6ahgRHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xm/W19cyPbp9rlmcz4KTTzsJ3Te0+9T6QJZjOsNho6SjWJFC4m6emki02I6hcT8OinO6TPKU+ns4w12uY0LJ3vWSWlwMohHMNA2XMG9XQPBGCI3pHg2bthYdIrKIGFpPSm1pQptomyIJ5bwruCqC0rmoeKpzc3d5G9b9Hpp8OBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gy3jEZ6G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gy3jEZ6G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312EAC4CEF1;
	Tue, 25 Nov 2025 07:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764056328;
	bh=V446la7lPJcpR4QJvyHjkwF5F2AFxzrJ0W2j6ahgRHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gy3jEZ6GGZG2+oYYBtMo5H8l2Cm8oY0NhDnhxHYpLnqN/GwaE2MZUDoHOFFlkhWzC
	 Vjb/u/SwMq51pdfaE6nrYFGlNXMVRKyLIZkaG9N4xR7G/bewrsB1G5rxfJcYwSH8Lg
	 ei7pT19+gv400Y1myjfV1y+rkZ9oQyiVa1NbeAUcu8EJqLOoAD7JyVg3eVc3oVHG7Q
	 KqzHDTVAGWkHHMxYgeeUKABly272YQr3dcIb9uUjenxZSx1rlvVzMLe1TkJhnmUYSs
	 OU2BD1ETmngg6y2Msqlg42+5bNNSmqkPVR0jhOr3rNWhRYg60S7TF1/vrjFUJMO10K
	 /qJGrmrPhYCvQ==
Message-ID: <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>
Date: Tue, 25 Nov 2025 08:38:40 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
To: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>
References: <202511250134.i0Jm8d7I-lkp@intel.com> <874iqji6n1.ffs@tglx>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <874iqji6n1.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 24/11/2025 à 20:15, Thomas Gleixner a écrit :
> On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
>> head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
>> commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
>> config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
>> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from kernel/rseq.c:75:
>>>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
>>                     unsafe_get_user(start_ip, &ucs->start_ip, efault);
>>                     ^
>>     include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
>>             arch_unsafe_get_user(x, ptr, local_label);      \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
>>             __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
>>             __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>>             ^
>>     arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
>>             case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>>                     ^
>>     arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
>>                     "       li %1+1,0\n"                    \
>>                      ^
>>     <inline asm>:7:5: note: instantiated into assembly here
>>             li 31+1,0
> 
> Definitely not a problem of tip core/rseq. It just ends up in
> __get_user_asm2() and then the compiler gets unhappy about the PowerPC
> inline assembly for whatever reason.

I see it is a CLANG build.

CLANG might be less flexible, can you test with following change ?

diff --git a/arch/powerpc/include/asm/uaccess.h 
b/arch/powerpc/include/asm/uaccess.h
index 4f5a46a77fa2..33d5f7ade254 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -253,7 +253,7 @@ __gus_failed:								\
  		".section .fixup,\"ax\"\n"		\
  		"4:	li %0,%3\n"			\
  		"	li %1,0\n"			\
-		"	li %1+1,0\n"			\
+		"	li %L1,0\n"			\
  		"	b 3b\n"				\
  		".previous\n"				\
  		EX_TABLE(1b, 4b)			\


Thanks
Christophe
