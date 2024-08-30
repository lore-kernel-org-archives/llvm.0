Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E3717D358
	for <llvm@lists.linux.dev>; Fri, 30 Aug 2024 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012914; cv=none; b=PgbPMB53jfXVSTWQoqZ9Bn5cf/W3v3RV86isZ40ymjcrdpAMi+g+HzGF02JBUSfrFoG7nwUTNyE+QxUfk62hiI43YYLP0XE5NtVl0wGg1HAS1hBiaW8h317XmcbRsnHwfNYXGVjIkkZcn5wgob7HiDshsA07jb8/0rd2dWoXI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012914; c=relaxed/simple;
	bh=ZR+3QqzT/pKEtLj8xun3aa5haR+iOhO+Azte1KQgwqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2RPf4lYuU6BCPSmEpfLJYdCprP6IZ31GczsnMSjC3/Xfg54VKbIf3KueA1VRt3qHRX8tYy5kVD26T9lGwOH3HCW58xinfJ7w0T76OAVMiND5sCIwN9lHeBhCtpeZNeVPsbMeqkxS9D6NQIuKzdKiEwLG3LOnjqQqVF/B9ckMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aBFJJW+r; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aBFJJW+r"
Message-ID: <5f4990d1-1734-41f6-b54f-5e44c370410e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725012909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR+3QqzT/pKEtLj8xun3aa5haR+iOhO+Azte1KQgwqM=;
	b=aBFJJW+rGylYQv56Yqwe/cCk8clZLd/IQ77nLAo26VOGn0PidhGsCe7YZ24aAZzztQYlzx
	KqractwJnuI/JIyrX5Wa5wlR7YrknMjP9Su/sovSNUJ2h0qNzI4uPQMFKIf99d5iaBhsAH
	ZWcyZGiKHcaRHbw+iochG2819DjnlJI=
Date: Fri, 30 Aug 2024 18:15:00 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/gcc-plugins.rst
To: Dongliang Mu <mudongliangabcd@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240828074305.314666-1-dzm91@hust.edu.cn>
 <04184aa1-475e-4e1f-9e05-21f59a0787d3@linux.dev>
 <2e6e368f-0f2a-4724-892e-06cfe3fba97e@linux.dev>
 <CAD-N9QUBwM-Y1pwEiu5sLGaVVxL_taj-EBYnjUuc4k2hyJ2xbw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: YanTeng Si <si.yanteng@linux.dev>
In-Reply-To: <CAD-N9QUBwM-Y1pwEiu5sLGaVVxL_taj-EBYnjUuc4k2hyJ2xbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/8/30 16:17, Dongliang Mu 写道:
>>>> +一旦它们的实用性得到验证，目标就是将这些功能添加到 GCC（和
>>>> Clang）的上游，然后在
>>>> +所有支持的 GCC 版本都支持这些功能后，再将它们从内核中移除。
>> 目标是 进上游后 把 功能 移除。
>> Can we re-polish it here?
> 一旦它们的实用性得到验证，这些功能将被添加到 GCC（和 Clang）的上游。
> 随后，在所有支持的 GCC 版本都支持这些功能后，它们会被从内核中移除。
> How about this?
Great!

Thanks,
Yanteng
