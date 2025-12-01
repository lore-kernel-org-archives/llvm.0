Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0B13E02A;
	Mon,  1 Dec 2025 02:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764554787; cv=none; b=Gcvy2StNKDSs/JhUHz3Yvv1Yyfeu6wnY2nYNmL1iB1+2dpjIiNyCJuL2hLBdSMWYr3KsMAXTYmTDHHaPIND5gNQkftw6lNqs42GkKgvVsVTNSGA4UKP5hZrBvOmluJfObeOkdSrtHVMvzL5hGpsd3MtuiImNo7lvAu6Z48/jEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764554787; c=relaxed/simple;
	bh=2Dvg0cca3rYtjagbvcCc2vUhTWEJsQU4OeucLFYpxr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6jYDLwUyD1uQ/v82uJwZGWob982B9h0PeYFi72bBSz/bhNIOOY2SQrgWztJzBCMTEEUbZ6tSLOU1EqO5DQisrsuz38Egl+qGxP9jViMZ5ophJ8dfSfnzod12FJcg7mTffCNUfuiuJTwnfl3c7YC6v9i5onTBB3kBf+Xm4xyt00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=C+JgXGBh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="C+JgXGBh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7w89WMLpYdMl4z8GOso6jwxPqlxOE2sq9865xliq2WA=; b=C+JgXGBhsZ6n9qw4vbUQYIwzyw
	ZQtJuZFWmJA4IxdKDADICzxVFfETtDJ6LHc+QtErzYt7uilzMMc5qmznUC9OnoAGtra/+QWs4EFHb
	7a0UOzIckhQqSMDo1sY0CVqNbtNNuxMMhF1tSG2k47c1f9pzaE54iJXSfMFiNVhp5Ep+J3wlrVAZ5
	RxJO3H1ExKXPUgevIl8y17WKVnSzcBizfwPsj8GRs86QhvFS9afaaJRkR0/frxE0AfD1tTuQjdzvr
	qtUfr3kwPWUMP9A7Q9TCV6BrClmU8euFA5Ocfxj5fdVfQp9FGiBwvOLsEIqb0S2fEcHB9Ze2k3glS
	G1xo2QgA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPtJ1-00000002nm3-12H2;
	Mon, 01 Dec 2025 02:06:23 +0000
Message-ID: <66a48b09-b119-435c-b8d8-474773bdf8a9@infradead.org>
Date: Sun, 30 Nov 2025 18:06:22 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 64/66] Warning:
 sound/usb/usx2y/us144mkii_controls.c:8 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <202512010746.EPe9Xcp5-lkp@intel.com>
 <4d298cba-7e61-4933-a765-1f8a60b8f0f4@infradead.org>
 <aSzktTVhHy6EQUg1@rli9-mobl> <aSz2pyrJvGiVi1nv@rli9-mobl>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aSz2pyrJvGiVi1nv@rli9-mobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/30/25 6:00 PM, Philip Li wrote:
> On Mon, Dec 01, 2025 at 08:43:33AM +0800, Philip Li wrote:
>> On Sun, Nov 30, 2025 at 04:20:59PM -0800, Randy Dunlap wrote:
>>> Hi,
>>> Is the robot an AI?
>>> Maybe that could help explain why a commit that fixes spelling,
>>> grammar, punctuation, etc., causes all of these kernel-doc warnings--
>>
>> Sorry about this, the bisection is buggy and identified the wrong commit
>> in this case. I will further investigate and ix the issue asap.
> 
> Hi Randy, it is found the commit slightly change the warning output from "Refer Documentation"
> to "Refer to Documentation", which leads to wrong judgement that considers this
> commit as the first bad one.
> 
> I will think of how to avoid this kind of false positive. Sorry again for the
> confusion.
> 
> @@ -1179,7 +1179,7 @@ class KernelDoc:
>              #
>              else:
>                  self.emit_msg(ln,
> -                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
> +                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst\n{line}")
> 

Ah, I see. Thanks for the info.

>>
>>> all of which seem to be valid warning reports when I have a quick
>>> look at them.


-- 
~Randy

