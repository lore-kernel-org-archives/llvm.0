Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B8E1B9B29
	for <llvm@lists.linux.dev>; Fri, 30 Aug 2024 18:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725043962; cv=none; b=i7B4nEtw89bIXlo9c6HzYBQ94XHi9Wv+l8exQfTrhNVhmh5EAcvR45BHjj5s+VDhRZieIcBwGroe8swSE66p0G9FGDx68CerNfxOv9CDBpHNZAWY+vQshl+ctiX2EPwy0Dn9UHySduavqGfRZ5/OneSD9KfhvaF5jua+NyXRTGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725043962; c=relaxed/simple;
	bh=kPiLDQ8HQsZ7OY2s7jtUVwKAWbrRXvStaSUX+5VHXqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fsG59Mimv6WqV8omCNn/vvoCApqPJkK6n1FBjEkEF312FlnNoJF4dTtMoBDTmRVE6KL0rV/ezTJ5nfE4exIZ5i9aJKrvQn6hKewNVSfx+H+TyYm24o3O8avIgHoQkVp3iJwLYqsqcIQC10frkYvNy9bk6ic+d0Ry7+KnpnReHwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WwS2H2zdLz9sSN;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3f9-XC2A1YeT; Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WwS2H1wnjz9sSK;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28C2A8B794;
	Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id h0_TT9jQfciA; Fri, 30 Aug 2024 20:52:39 +0200 (CEST)
Received: from [192.168.234.133] (unknown [192.168.234.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 428938B764;
	Fri, 30 Aug 2024 20:52:38 +0200 (CEST)
Message-ID: <ef38cd36-3e15-4608-8b72-87cf7621cce6@csgroup.eu>
Date: Fri, 30 Aug 2024 20:52:37 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC32
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
 <e7e4c6d36cf98229850c333f113bcea909564501.1725031952.git.christophe.leroy@csgroup.eu>
 <ZtHwnc4AZuRULkom@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtHwnc4AZuRULkom@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 30/08/2024 à 18:17, Jason A. Donenfeld a écrit :
> On Fri, Aug 30, 2024 at 05:57:08PM +0200, Christophe Leroy wrote:
>> @@ -14,6 +14,10 @@ ifeq ($(uname_M),x86_64)
>>   TEST_GEN_PROGS += vdso_test_getrandom
>>   TEST_GEN_PROGS += vdso_test_chacha
>>   endif
>> +ifeq ($(ARCH),powerpc)
>> +TEST_GEN_PROGS += vdso_test_getrandom
>> +TEST_GEN_PROGS += vdso_test_chacha
>> +endif
> 
> FYI, as of [1], you should now be able to add powerpc to the filter list
> instead of having to duplicate a new stanza:
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fcrng%2Frandom.git%2Fcommit%2F%3Fid%3Dbbaae98172ed284fc0d5d39cc0d68f5d06164f06&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C4f51736c027a44cc7df908dcc90f46d6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638606314665557021%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=UtLdKTuEaZVhsguKa7kX1TBJ%2BvvQtl7DmU9hSBeThWo%3D&reserved=0

I'm a bit sceptic with that commit. IIUC you are changing the meaning of 
$ARCH. How does that fit with the $ARCH we give when we cross-build or 
with the ARCH which is set by the top-level Makefile in 
tools/testing/selftests ?

Also, wouldn't there be a way to use scripts/subarch.include instead of 
opencoding ?

Afterall, would it be a problem to build it even for i386 ? It should 
now be ignored anyway with your new commit f78280b1a3ce ("selftests: 
vDSO: skip getrandom test if architecture is unsupported")

Christophe
