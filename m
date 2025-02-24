Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208822676CD
	for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 18:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740421206; cv=none; b=USdn9pd7wb8QoeyDXJj9cmnRuN7rMLxD0+uy9W+fJPAp7GxEO7oBbHTXTw47gbcKYE9AxJCbkVGnPIIG3t5UN/7sABLYlQISF6JuvkcrqmaPGB4x33Wfb84YYagTb9+scX5xgbZn/qpsXH0zrVKojV5AW5OXRuuOnMYqMiqKKZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740421206; c=relaxed/simple;
	bh=qX6i8P+Lvx2UxBOov0jLP9vRTlNl0FMv1d14HJk1/i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atZg00DHBktA95WRhxVg0a+FrXq85KGbgd7WF94+a5pFjWh99QINV6+0FVq5ApIQShAyVAqklCD1B1NMHTbyd+tE74QjhHF6DHnrc8SiNPg2tZPilQhNhuSMXsZ1mWSBdvOgyWZQpOl8Ax6X+Cof1r87x0TLKZqbIg64a+vk5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1pKK5Fkrz9sSH;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0MKA8qxQct2; Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1pKK4Vknz9sSC;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 887038B780;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xx2jkbRBAbLX; Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F34B8B77C;
	Mon, 24 Feb 2025 18:54:45 +0100 (CET)
Message-ID: <9435789c-cd05-4ec1-bcef-42d81fd87053@csgroup.eu>
Date: Mon, 24 Feb 2025 18:54:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call warning
 for bl+mflr pattern
To: Peter Zijlstra <peterz@infradead.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, npiggin@gmail.com,
 maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
 <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
 <20250224162542.GE11590@noisy.programming.kicks-ass.net>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250224162542.GE11590@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 24/02/2025 à 17:25, Peter Zijlstra a écrit :
> On Fri, Feb 21, 2025 at 02:20:41PM +0530, Sathvika Vasireddy wrote:
> 
>>>> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct objtool_file *file)
>>>>    		reloc = insn_reloc(file, insn);
>>>>    		if (!reloc) {
>>>>    			dest_off = arch_jump_destination(insn);
>>>> +
>>>> +			next_insn = next_insn_same_func(file, insn);
>>>> +			if (next_insn && dest_off == next_insn->offset)
>>>> +				continue;
>>>> +
>>> This won't work on x86, where an intra-function call is converted to a
>>> stack-modifying JUMP.  So this should probably be checked in an
>>> arch-specific function.
>>
>> Thanks for letting me know, I'll introduce arch_skip_call_warning() to
>> handle architecture specific cases in the next patch I send.
> 
> Can't you detect this pattern in decode and simpy not emit the call
> instruction?
> 

Yes we can, simply do:

diff --git a/tools/objtool/arch/powerpc/decode.c 
b/tools/objtool/arch/powerpc/decode.c
index 53b55690f320..4f9b1715caf1 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -55,7 +55,7 @@ int arch_decode_instruction(struct objtool_file *file, 
const struct section *sec

  	switch (opcode) {
  	case 18: /* b[l][a] */
-		if ((ins & 3) == 1) /* bl */
+		if ((ins & 3) == 1 && ins != 0x48000005) /* bl but not bl .+4*/
  			typ = INSN_CALL;

  		imm = ins & 0x3fffffc;

