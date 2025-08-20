Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B74414
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 11:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687817; cv=none; b=PTREO1D5Z8pd9EoKnMNZmGYcBNI0ZefSPZeQLEiN0dlcl/mEeWVDnsJwb4InfCkc5xese/eYmf+nsI4HGWin1fyfC24OksUqFyiEDZT9QLzoNGsAe3vwZAcf1LmvwP0HtePm9BfgsEZ9TsTPxnojL84HxDtrs45f2jVFE/+Rvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687817; c=relaxed/simple;
	bh=0OTH9Xt3vhe5QIAIUKFu9N3Odja7l1+J/H50NiQ1S98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4SQCsUt1zXGAJ6xJLhTwedaMGz5nRc5gu2ag48Viv8YtDg3jFj70O+i/LzNJGRaJJLGufVPP0VLP2pqp2qmrs28nW2RoC4yKSIsGJIQIEn+n5tlLYbRpf5ctXuzCW69A5jjwgtK1oQROuAFi2X1IqemMurBirD4mfKMjhzjNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ecXwQxiy; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ecXwQxiy"
Message-ID: <df3b5c81-eb26-41ec-a27b-28c273a74859@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755687802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahfDDflpdzQ8/uA6MgnjOXMXSU4HqqXX/CS0VshQj8Q=;
	b=ecXwQxiyrEPuNlT9g4k47z/DdQB5eI1OERolpmZUu5ph04yCWrGvSa+YRVVnfgvSRhOUCa
	SsPJaDUuhqnd/OIznPyx1+8DZ29YUUNt/tTb8ICrXa9CX8LhdW/2qXFbqUL9B7W42/AErs
	+pMmxGvnDzvqOZPTRB6ltrhhDn/RUHg=
Date: Wed, 20 Aug 2025 19:03:13 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] panic: Clean up message about deprecated 'panic_print'
 parameter
Content-Language: en-US
To: Petr Mladek <pmladek@suse.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, paulmck@kernel.org, john.ogness@linutronix.de,
 kernel test robot <lkp@intel.com>, Feng Tang <feng.tang@linux.alibaba.com>
References: <aKRJKZHgcxyNF3y7@pathway.suse.cz>
 <202508200907.PsZ3geub-lkp@intel.com>
 <ae9bb2ea-c6e5-4a4b-ae25-aea1d6fe084d@linux.dev>
 <33a897b4-7d9a-4641-9c7a-07c19bb9cb6f@linux.dev>
 <7a34da58-874d-4271-9dbb-7991468d58ff@linux.dev>
 <aKWWcPOf9qPIoCe4@pathway.suse.cz> <aKWYELPjbhC7R8NO@pathway.suse.cz>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <aKWYELPjbhC7R8NO@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/8/20 17:40, Petr Mladek wrote:
> Remove duplication of the message about deprecated 'panic_print'
> parameter.
> 
> Also make the wording more direct. Make it clear that the new
> parameters already exist and should be used instead.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Confirmed that it fixes the build error when CONFIG_SYSCTL is
disabled.

Tested-by: Lance Yang <lance.yang@linux.dev>
