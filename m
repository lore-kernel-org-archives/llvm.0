Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9C515747D
	for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737010205; cv=none; b=ElvZb5HB5r6slgRQK6e8xkU1A0+O55Td/1b+HtkHtcf/c0M/eA6LBx7wjxPPCvgDmEWeQSfzVr0pnp4TXEsDg+FG7S8wyPIwng7Uki3VQcwY9DBGGzxn+OTKdoQQ77ZNMDM3EK46HpqHdks0a6u213zG+IL0cdPxAQLccOIYk8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737010205; c=relaxed/simple;
	bh=bGXXsq3om2FPnUB/yes4mpM8o08wLtNDeAykI+xcj44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvcOmg5AWDgqNIRItgXDHOvkm8p1yTO9EbmY5lOl78prfpLyKhe5646tgJqhpVeb2SUCP3pgYRMLbYSjA3B3wM39W2yervvxF6qx/mF7mtK6RWUTRv/V8G+mg2YgsiyuKPvzWcu15zwCHrBku88UsIOKj5Pbv539CBwTESsEa+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YYXtB4PM7z9sST;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvu0bE32cUqa; Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YYXtB3VX0z9sSS;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6497E8B77A;
	Thu, 16 Jan 2025 07:25:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KeEUKWueXOwO; Thu, 16 Jan 2025 07:25:38 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C4B78B774;
	Thu, 16 Jan 2025 07:25:37 +0100 (CET)
Message-ID: <92e889d2-b883-41fe-b75f-1909ac23f5e2@csgroup.eu>
Date: Thu, 16 Jan 2025 07:25:35 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] powerpc/objtool: uaccess validation for PPC32
 (v5)
To: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Julien Thierry <jthierry@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Raphael Gault <raphael.gault@arm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev
References: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1736955567.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 15/01/2025 à 23:42, Christophe Leroy a écrit :
> This series adds UACCESS validation for PPC32. It includes
> a dozen of changes to objtool core.
> 
> It applies on top of series "Cleanup/Optimise KUAP (v3)"
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=363368&state=*

I forgot to remove that sentence. That was merged long time ago so the 
series doesn't have any dependency anymore, it applies as standalone on 
top of git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git branch 
tip/objtool/core (HEAD 41a1e976623e ("x86/mm: Convert unreachable() to 
BUG()"))

> 
> It is almost mature, performs code analysis for all PPC32.
> 
> In this version objtool switch table lookup has been enhanced to
> handle nested switch tables.
> 
> Most object files are correctly decoded, only a few
> 'unreachable instruction' warnings remain due to more complex
> fonctions which include back and forth jumps or branches. Two types
> of switch tables are missed at the time being:
> - When switch table address is temporarily saved in the stack before
> being used.
> - When there are backwards jumps in the path.
> 
> It allowed to detect some UACCESS mess in a few files. They've been
> fixed through other patches.
> 
> Changes in v5:
> - Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git branch tip/objtool/core
> - Use generic annotation infrastructure to annotate uaccess begin and end instructions
> 
