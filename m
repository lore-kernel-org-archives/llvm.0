Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112013F9D2
	for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740405006; cv=none; b=Zh8jLJZf7n8VhAQL4wvuV/ExUDYIFPNM25yE040PRkdy9PPYMnEe8PZt1YcTC7QzvJ3SdS7tZKCahQNQ0S9QY0X9DzxBuQMdAgKNFtAjLXeznUVBKjRSZF0mmNb0K9I4j8lwS9i7hPUBUFTOtK9PeBsRwX8IhRO9RiWLKEovAn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740405006; c=relaxed/simple;
	bh=+a35ztu5y7ALOkVFHnxnr5nOSLFjUWAO03woQ3A8Ydc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XrEk/s5W/2YLBX/r0VJh3+oJwkUEX9sqwipJJitlSxFy3ev/aTDluj4eLQgotuN5mFUz5yDlDJ9dOlZwkf86J4becK6yglDUmDuzZUdYTEiNXTw/IqDI9dI+Gb1ZZze7lkOPd5FLSoHRzXNvBc+Er3E+C1PEs5EozhP5FctVe50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1hCR2KX7z9sVs;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elqyD67td6jR; Mon, 24 Feb 2025 14:19:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1hCR1Gpgz9sVq;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 18CEC8B77C;
	Mon, 24 Feb 2025 14:19:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id PKWx441hCHAv; Mon, 24 Feb 2025 14:19:14 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBC498B765;
	Mon, 24 Feb 2025 14:19:14 +0100 (CET)
Message-ID: <8f4ec6d4-2646-4a87-b3a1-edfaecff2a01@csgroup.eu>
Date: Mon, 24 Feb 2025 14:19:14 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call warning
 for bl+mflr pattern
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, jpoimboe@kernel.org,
 peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
 Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <3223ec0e-c445-4bbf-ae72-276688e40908@csgroup.eu>
 <d5ada017-1ba2-4a89-8a58-4555f09f9d97@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d5ada017-1ba2-4a89-8a58-4555f09f9d97@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 24/02/2025 à 11:33, Christophe Leroy a écrit :
> 
> 
> Le 24/02/2025 à 08:15, Christophe Leroy a écrit :
>>
>>
>> Le 19/02/2025 à 17:20, Sathvika Vasireddy a écrit :
>>> Architectures like PowerPC use a pattern where the compiler generates a
>>> branch-and-link (bl) instruction that targets the very next instruction,
>>> followed by loading the link register (mflr) later. This pattern appears
>>> in the code like:
>>>
>>>   bl .+4
>>>   li r5,0
>>>   mflr r30
>>
>> What compiler do you use ? Is it a very old version of GCC ?
> 
> Oh, I see that this is a report on a projet version of clang ? compiler: 
> clang version 21.0.0git
> 
> Then I guess the bug needs to be fixed in Clang, not in the kernel.

Well, this problem already exists on clang 18 it seems:

00000004 <btext_map>:
    4:   7c 08 02 a6     mflr    r0
    8:   94 21 ff e0     stwu    r1,-32(r1)
    c:   93 c1 00 18     stw     r30,24(r1)
   10:   90 01 00 24     stw     r0,36(r1)
   14:   93 a1 00 14     stw     r29,20(r1)
   18:   48 00 00 05     bl      1c <btext_map+0x18>
   1c:   38 a0 00 00     li      r5,0
   20:   7f c8 02 a6     mflr    r30

While GCC generates:

00000418 <btext_map>:
  418:   94 21 ff e0     stwu    r1,-32(r1)
  41c:   7c 08 02 a6     mflr    r0
  420:   42 9f 00 05     bcl     20,4*cr7+so,424 <btext_map+0xc>
  424:   39 20 00 00     li      r9,0
  428:   93 c1 00 18     stw     r30,24(r1)
  42c:   7f c8 02 a6     mflr    r30

So lets make the kernel tolerate it allthough it should be fixed on 
clang at the end.

I can't find any related issue in the clang issues database 
(https://github.com/llvm/llvm-project/issues), should we open one ?

Christophe

> 
>>
>> That sequence is not correct and should never be used by modern 
>> compilers. It should be bcl 20,31,+4 instead.
>>
>> All such hand writen sequences have been removed from kernel assembly, 
>> see commit c974809a26a1 ("powerpc/vdso: Avoid link stack corruption in 
>> __get_datapage()") for details
>>
>>
>>>
>>> Objtool currently warns about this as an "unannotated intra-function
>>> call" because find_call_destination() fails to find any symbol at the
>>> target offset. Add a check to skip the warning when a branch targets
>>> the immediate next instruction in the same function.
>>
>> I think this should be done in arch_decode_instruction(), just set 
>> insn-  >type to INSN_OTHER when you see bl .+4
>>
>> Something like:
>>
>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/ 
>> powerpc/decode.c
>> index 53b55690f320..ca264c97ee8d 100644
>> --- a/tools/objtool/arch/powerpc/decode.c
>> +++ b/tools/objtool/arch/powerpc/decode.c
>> @@ -55,7 +55,9 @@ int arch_decode_instruction(struct objtool_file 
>> *file, const struct section *sec
>>
>>       switch (opcode) {
>>       case 18: /* b[l][a] */
>> -        if ((ins & 3) == 1) /* bl */
>> +        if (ins == 0x48000005)    /* bl .+4 */
>> +            typ = INSN_OTHER;
>> +        else if ((ins & 3) == 1) /* bl */
>>               typ = INSN_CALL;
>>
>>           imm = ins & 0x3fffffc;
>>
>>
>>
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202502180818.XnFdv8I8- 
>>> lkp@intel.com/
>>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>>> ---
>>>   tools/objtool/check.c | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
>>> index 753dbc4f8198..3f7cf2c917b5 100644
>>> --- a/tools/objtool/check.c
>>> +++ b/tools/objtool/check.c
>>> @@ -1613,6 +1613,7 @@ static struct symbol 
>>> *find_call_destination(struct section *sec, unsigned long o
>>>    */
>>>   static int add_call_destinations(struct objtool_file *file)
>>>   {
>>> +       struct instruction *next_insn;
>>>          struct instruction *insn;
>>>          unsigned long dest_off;
>>>          struct symbol *dest;
>>> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct 
>>> objtool_file *file)
>>>                  reloc = insn_reloc(file, insn);
>>>                  if (!reloc) {
>>>                          dest_off = arch_jump_destination(insn);
>>> +
>>> +                       next_insn = next_insn_same_func(file, insn);
>>> +                       if (next_insn && dest_off == next_insn->offset)
>>> +                               continue;
>>> +
>>>                          dest = find_call_destination(insn->sec, 
>>> dest_off);
>>>
>>>                          add_call_dest(file, insn, dest, false);
>>> -- 
>>> 2.39.3
>>>
>>
> 

