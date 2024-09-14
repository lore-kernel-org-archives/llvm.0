Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A64A3143723
	for <llvm@lists.linux.dev>; Sat, 14 Sep 2024 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726308713; cv=none; b=J6/sHn49yPxG7b5iilECITtAxHKnnVPCuIUNriT/+YJXrHaRVTj0mj3OEHU5L9TnZ1GidhwjVHAT57ndusJ6jzpXzoLlVUPGEhyMdcJMg4AF8jsoBYTinAzHugnFExjFhIezznnUDjVcZquIhm9uS6GvWYTbjXMCyI1Nnrqf2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726308713; c=relaxed/simple;
	bh=c6nfdzj7CU6giEaK6XJMqLAZY1iNMQLg+oRmY3n2GfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=TtXah3qPDghy1+qaMJrV/zCf5LbRvlfIuClH6qLR0LlrnleICcwSZmjon5qSz6e9Zpx/fZzRHQGh5CNicbppIyarfBwWrtu6Y7JNfrmd0T6YKBbCsOR+VTKDKl3cKZcMxzsYMxbXHLVolUG5YQBiY1jeYgVV9AVgJIyOszHiArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 9A11D602EB766;
	Sat, 14 Sep 2024 18:11:37 +0800 (CST)
Message-ID: <397e6113-9ccb-e8da-38ed-a6487dc01f8a@nfschina.com>
Date: Sat, 14 Sep 2024 18:11:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH net-next] net: tipc: avoid possible garbage value
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Simon Horman <horms@kernel.org>
Cc: jmaloy@redhat.com, ying.xue@windriver.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 tuong.t.lien@dektech.com.au, netdev@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <f1279370-a127-4946-8c46-cc89fd2a90a6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/9/14 18:05, Dan Carpenter wrote:

> On Sat, Sep 14, 2024 at 10:42:44AM +0100, Simon Horman wrote:
>> On Thu, Sep 12, 2024 at 07:01:20PM +0800, Su Hui wrote:
>>> Clang static checker (scan-build) warning:
>>> net/tipc/bcast.c:305:4:
>>> The expression is an uninitialized value. The computed value will also
>>> be garbage [core.uninitialized.Assign]
>>>    305 |                         (*cong_link_cnt)++;
>>>        |                         ^~~~~~~~~~~~~~~~~~
>>>
>>> tipc_rcast_xmit() will increase cong_link_cnt's value, but cong_link_cnt
>>> is uninitialized. Although it won't really cause a problem, it's better
>>> to fix it.
>>>
>>> Fixes: dca4a17d24ee ("tipc: fix potential hanging after b/rcast changing")
>>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> Hi Su Hui,
>>
>> This looks like a bug fix. If so it should be targeted at net rather than
>> net-next. If not, the Fixes tag should be dropped, and the commit can be
>> referenced in the patch description with some other text around:
>>
>
> It's one of those borderline things.  As the commit message says it doesn't
> really cause a problem because cong_link_cnt is never used.  I guess if you had
> UBSan turned on it would generate a runtime warning.  Still it also doesn't seem
> intentional so I would probably count it as a bugfix and target net like you
> suggest.
Got it. I will send a v2 patch to net and  keeping reverse xmas tree order.
Thanks for the suggestions:).

Su Hui

