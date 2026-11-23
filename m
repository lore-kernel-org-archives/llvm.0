Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449550;
	b=IEiYm4CLyluWX/1q0ttsvE7aN+qoUMld4N73IJtFJrsx2A8GTLhVIdFN+2YfAr42qyBz
	 i33Afv8ObuuwuBD7x+et47ljPJ9NjinkGX+AanTJP4iH8A25+yzlEWN3dxdrLZDEECPbR
	 zJBOOzBSiiwDM/TppYPwTwilkcREA/7tF/gQhVEos/y8TcDcBt+PICq64UQJXUU9AhAC6
	 CbHXrO34+mnHj2cH3YQ7ZEoSOgJGAfWYHdpClpfWAEeo5hme8j+BxCj9AQINxm9RRkx9N
	 CNpa1hQibeifyluvMZfeV0WriHk8u+MuKWAprEHJNkQFm9Sv4QZUeOboAih+xXv6lww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449550;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5T3kLA/R/0xtFF9nFDh0Ria4cdzh2STsxbalTTV9D7U=;
	b=QR1GbrXKIiDKbKV30rb2lGVziinX433lKRmw8vrj2S2vxlInlE2dqpKSiHfjI2r8Stiu
	 VwrUFY516UFmLB0BrhdyokBjeKJpI56sNnLR7/NLcTns4KD1+7/b5Lh4VVHeo88ENM97b
	 XnLcry3oAfKzjLwBKqlv/g6OaRV3fz42J0WjCIm80fq96vBpS9nzTMx8cyO9oz8sEd3Ta
	 D5WCb1HeA8it39b4NKFBHYSJsS+39M4woblV3JzNRdWu4ALuuUay2SDTI3SbXj5mMlP1H
	 +jFb2M+nJKA6CA4TDYN+8ISWWIoSgQnv53CGa2ZZXVsG/QgxjAti6UvBbPpi4Lrjp6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UI43AN56;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1B7606A31A;
	Mon, 23 Nov 2026 15:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UI43AN56
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA261F000C6;
	Mon, 23 Nov 2026 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449549;
	bh=5T3kLA/R/0xtFF9nFDh0Ria4cdzh2STsxbalTTV9D7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UI43AN56Jrf+bRXL7nqszjrCRyxwb/xXhy/+ErQp6gKI8Z565GoghPhYsAwGsPG4F
	 ik8zT3hvYqUF6Cnn+PMZyM16ROyVqkrqVSVbL2D4dmPkikLDKhuz3DkUTCWY5/Sado
	 +TaIBoYEUHJ9CkhRkScAwxzeF/4eXlXQt4kA/cLMXitcheQHtjEbLMAamXuZ4Z+ZxH
	 X8QKQYiqhXRqVemqyanRIFnQM165yHI4LgzN+99MPGitbLc95+VBjmH9Sd9nehwkDS
	 ElCkgDWKkmN6jjFKsb66y+fbgRFtwj4jW/3rNQHF113lLsi1osBBmS8WUEIePjBj9B
	 gCmA7hyvt/GSQ==
Message-ID: <f513c601-ef8b-4524-9c56-d3d121c8df2a@kernel.org>
Date: Mon, 23 Nov 2026 16:59:01 +0100
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
 <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 16:54, Jeff Johnson wrote:
> On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
>> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>>> -  WLAN Serial Interface. It is used for the exchange of specific
>>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>>    control information across radios based on the doorbell mechanism.
>>>    This WSI connection is essential to exchange control information
>>>    among these devices.
>>> @@ -48,6 +48,7 @@ properties:
>>>    compatible:
>>>      enum:
>>>        - pci17cb,1109  # QCN9274
>>> +      - pci17cb,1113  # QCN9575
>>
>> I do not see any user of this (see submitting patches in DT directory
>> for explanation).
> 
> For this and the other patches you had comments on, the cover letter describes
> the approach being taken. What the cover letter is missing is the scope: The

No one reads cover letters :), but I skimmed it now and did not find the
explanation for bindings without user.



> QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
> patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
> is just the first patchset in the series.
> 
> This is similar to the approach taken when refactoring the original ath12k
> driver to create the wifi7 folder and wifi generation abstraction. That
> refactoring was also done as a series of small patchset due to the large
> number of code changes (102 patches, 20K+ LOC). This was requested by members
> of the community who wanted to digest the code at a reviewable rate.
> 
> One key difference in the wifi8 approach is that for the wifi7 refactor we
> used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
> ath-next. The reason the development team wanted to take this approach is to
> avoid the pain that was encountered where there was a "big bang" merge of the
> ath12k-ng feature branch with the ath-next branch at the very end of the
> development cycle which resulted in a large number of merge conflicts with
> parallel development and bug fixing. Some of those conflicts were
> unfortunately not initially resolved correctly, leading to instability in the
> driver. The hope is that introducing the feature directly into the ath-next
> branch in an ongoing manner will avoid those issues since each subject matter
> expert will need to resolve their individual conflicts as their pieces land.
> 
> As ath12k maintainer, this approach to incrementally introduce the pieces
> directly into ath-next, but only enabling them at the end, seems like a better
> approach than the ath12k-ng approach.
> 
> Specifically for the DT issue, the original version of this series vetted
> internally did have a patch to add the device in the PCI registration table,
> but it was decided to drop it from this patchset when posting to public. We
> can also drop the DT patch until the point the PCI registration comes.

Still does not explain why do we want bindings without users...

Best regards,
Krzysztof
