Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847E53A4513;
	Wed, 18 Mar 2026 12:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836483; cv=none; b=rcudMR/uAqs1UIb4iFLC8XehCZbhH8eu3NxNxvksyeZYn0WASAW4hrE7BNi6QR+k+xiMTVFL5a6nHq9z1wxWYM7Wmr0Ij6aLQcuWWqxyMvHg/U1HC/TVOWlbRy6rry7tqPcqecr4J5c48G0KKuUpBRfAqjvHkxNumpgO29lCpd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836483; c=relaxed/simple;
	bh=VETUb0Ok7/wSEHFBIMBMVSrMOraqztpcjMZcYixugyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G87UeVdzCWemB0rO6/9RR35MaDBJyaP79jROOOo4Cckf2E4O6hSyInIumxuyq5KS7ed3TuWO7cNLLGmMFqtjr3MQQ+5qElgRS+EHXKjwnpE2txV9JT9ios9gBdzHgP7s08Oah6FM1dKxvTJ2p5U2njhBDhOPCDtUP8amJqJu9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNJqUE7q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNJqUE7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB77C19421;
	Wed, 18 Mar 2026 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773836483;
	bh=VETUb0Ok7/wSEHFBIMBMVSrMOraqztpcjMZcYixugyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oNJqUE7qC0JMEzUfSQhebxrMLRrF2cE4BV510qU7Bnu6OrVlvo6N2kLXxm4yacwVe
	 QkZcq6aAydkvefXCM6OFDT3RaDFeuRHErYMtNTRAO+LurstvZiOa6E4zKZB+hOgecN
	 Y8rIokqTAId1h63piwFI7OnTLFigYcZnS6qplYtfZwiEptKeaQgodUS67+LJtJUTLj
	 QZ2CFn8EubdMgNXw1vjK3AeaC30OcmZ+ChuuMsKpY5zjip0BmrexeNrpWluZ3s2XRG
	 aRSAAwPK8OBPIi1imVJyYq1UHPpY0s5hOgsE4EGrLdODoRjzQ0rxcfypkn3RUl8YSA
	 PiL4W7C6bdYyA==
Message-ID: <9434f836-aa96-44e7-8f34-243d6c94f6dc@kernel.org>
Date: Wed, 18 Mar 2026 13:21:17 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] powerpc/ps3: Drop redundant result assignment
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Geoff Levand <geoff@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260317130823.240279-3-krzysztof.kozlowski@oss.qualcomm.com>
 <abqRvDiAI85w2bCe@gate>
 <dfb53d65-ee34-47bf-b305-5694c7224ec7@oss.qualcomm.com>
 <abqTSG-wg-9ahRTe@gate>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <abqTSG-wg-9ahRTe@gate>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/03/2026 à 12:58, Segher Boessenkool a écrit :
> On Wed, Mar 18, 2026 at 12:54:30PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2026 12:51, Segher Boessenkool wrote:
>>> On Tue, Mar 17, 2026 at 02:08:24PM +0100, Krzysztof Kozlowski wrote:
>>>> Return value of ps3_start_probe_thread() is not used, so code can be
>>>> simplified to fix W=1 clang warnings:
>>>>
>>>>    arch/powerpc/platforms/ps3/device-init.c:953:6: error: variable 'result' set but not used [-Werror,-Wunused-but-set-variable]
>>>
>>> And this is exactly why -Werror is harmful.  A boring harmless warning
>>> turned into a build break :-(
>>
>> -Werror does not matter here. We do not want warnings either, assuming
>> of course they are correct.
>>
>> So if this warning is correct, then patch should be applied and WERROR
>> is irrelevant.
> 
> The build is broken.  -Werror is positively harmful.
> 
> Yes, you want the warnings fixed, but maybe something else has priority
> right now?

But if I understand correctly this is a build performed with W=1

Without W=1 there is no build breakage.

Someone who forces W=1 on its build can be expected to unselect 
CONFIG_PPC_WERROR if it is needed for him, no ?

Christophe
