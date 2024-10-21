Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CD73D6D
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 02:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729478788; cv=none; b=PCXY0Tvppz56MwB3ipBSo+uqYjN8x7Z0FroxBnCQbL4rdDUUvg3Sgi6CEgSvXuipBEW0GPZh2YTDG3AlR19GvNQjm2cztf77UqWTDVOf1yf7pNNm5oO186NccCwtXJMmka5kijfVBUnyVr9y6/6g2+SyI9OKm5mzE8yLYj96PIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729478788; c=relaxed/simple;
	bh=nEkfqEZKi297Ya3FYZc6Z/v+FBbo4n8DiTeirv6PAdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WXix24zzvxVt0Dj8LyVEwFIcJfN/M+7QOe4zhmBg/1z3HaRvzRDSdO40c5gf2NJTND78g4W9jDOxQQCICzxFVEJOB3H8m7kkRVDUBGrnduVIBQd/YS3OoSvIKfjD6BuTCPbciOmZKarbdDmLgR/EEz42s242KX25ICNvM8Op2bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R2ofiCCc; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R2ofiCCc"
Message-ID: <794f6563-019d-48f5-b96b-461f45ca7227@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729478783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hkLg3x86bnIDP1yW61gKyXCpkFf7Q3x/lzYYXvaKmzc=;
	b=R2ofiCCcOBkCfSUpQnanHFl2jPi+7bMYymVv5kySPyUtZjm4veyHgjmizLHRWSTtnH8eEi
	kY+7PxZmG2j/hmY8mKKhUGxVjc7SvuV+r4YzN52tTrFceV9Pe7ESlYcM5bPPyk35xl4mSR
	mIyh/XzIkjYRopuhxUPX143kgK405UQ=
Date: Mon, 21 Oct 2024 10:46:06 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Add the translation of documents in kbuild
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <seakeel@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: hust-os-kernel-patches@googlegroups.com, llvm@lists.linux.dev
References: <cover.1729259177.git.dzm91@hust.edu.cn>
 <8a882bc0-7125-4036-b939-fbd9e821c041@hust.edu.cn>
 <2bf8ba2e-9c5f-4f89-9399-f6320aa32a16@gmail.com>
 <f38f12cd-2ea3-444c-8fbb-15ee0471a3cb@hust.edu.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <f38f12cd-2ea3-444c-8fbb-15ee0471a3cb@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




在 2024/10/21 10:13, Dongliang Mu 写道:
> On 2024/10/21 09:29, Alex Shi wrote:
>>
>> On 10/19/24 14:19, Dongliang Mu wrote:
>>> +to Jon and Alex.
>>>
>>> It seems that tocmd and cccmd does not work with cover letter. Any 
>>> suggestions?
>>>
>>>      tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats 
>>> --nol"
>>>      cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats 
>>> --nom"
>>>
>> Do you mean that to or cc cmd should give a name list for cover-letter?
>> I don't know if it's common needs, since some of people don't like to 
>> get every patches, maybe only the related patch is enough for them. 
>> But in another side, full name list is may wanted for others.
>>
>> Another interfere like this, is the 'git am 00*.patch', it failed on 
>> 0000-cover-letter as cover-letter is empty patch. I'm also not sure 
>> it's common needs...
>
> Yes. I realized it yesterday. And cover letter is not a patch. It 
> seems there is no need to handle cover letter specially. 
Hmm, By using git format-patch --to --cc, we can conveniently bundle a 
series
of related patches into email format and directly specify the reviewers, 
which
helps to keep communication clear and streamline the review process.

As for the cover letter, b4 does a great job, and we can use git am 
*.mbx instead
of git am 00*/*.patch.

Thanks,
Yanteng
