Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936663A267;
	Thu, 18 Jul 2024 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721297206; cv=none; b=Wrq9NZ00jeQqMkxx99ujkj0BP3lfAfQe2XSlGD/GEwM23CIOzZIJ37IzaUAZyUbkZgEHBFtt/tPhuYl/kpsugRoHjiLxd4VPDx3tv9LgHfrVFT+jvksz9Ls2TM4RTcztHqbpm15YD/IPFiWfqQU9ksmsGOQ6xICqsYnzJy2B+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721297206; c=relaxed/simple;
	bh=lnmV7JL/s+KKycf99YstQbEHnKqa0bYEOKJfm2l+tdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pnj5gcsbHd6tWYDm3iM7rfDJRNNHooRce7sQWW6+MXlHB6wHDzGuUS2T1KeFA3810RwXdJi7TweInV4Up1hgJ7WJvcIXoNZ9hD2NMiuLVPAxon7hIyIpUD+BIkvXHPeWy7VjO5mvpECn+EXUXdri16qyCAZ7u2bL+lDr6GUaaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O18IGytj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O18IGytj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AB0C116B1;
	Thu, 18 Jul 2024 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721297206;
	bh=lnmV7JL/s+KKycf99YstQbEHnKqa0bYEOKJfm2l+tdA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O18IGytjxQsoRUwaw7MqYi0i6lKILqvxRJxmZF0+e99aVGZ1Vu1qR2CsM28yjy6o1
	 XNLj2EVAnCIvaqMX58UPEY8jq8DAXtG3RjKMBjJ34aNnHsOCA6Cvu2b/wDcvxsL7lB
	 VlaPtnWaPyJsZGcx8vYY+CM34TBwhN8dk5D43oLbAIQaMcQjBWSRi9Muv6ttpcL8vD
	 6KRHJgLar8kk923KdG/ENbTHFoMBBkmVzeHVwN4nOebo21idMRVDKxU765scVX1QzR
	 UyZNckMa5FMHOmwcxk2aQMuK0HSN40ms9aWEQ4vtspxb5ksnCqaC+fbCQC//2uZBD8
	 FEZQFXi8eiYGw==
Message-ID: <b2459009-71c6-406f-9760-13dd07277d6a@kernel.org>
Date: Thu, 18 Jul 2024 12:06:38 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7766/10451]
 drivers/clk/qcom/camcc-sm8650.c:3573:29: error: incompatible pointer types
 passing 'struct device *' to parameter of type 'struct platform_device *'
To: Jagadeesh Kona <quic_jkona@quicinc.com>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <202407072331.baglL4Sd-lkp@intel.com>
 <edfd90b7-b94b-4b1d-a625-a240a8446f1e@kernel.org>
 <ca6b403b-60ce-491f-8254-39e9d8e2eeba@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ca6b403b-60ce-491f-8254-39e9d8e2eeba@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2024 11:48, Jagadeesh Kona wrote:
> 
> 
> On 7/18/2024 12:18 PM, Krzysztof Kozlowski wrote:
>> On 07/07/2024 17:20, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   0b58e108042b0ed28a71cd7edf5175999955b233
>>> commit: 09ea421652a832083ea380a72addf383965f3682 [7766/10451] clk: qcom: camcc-sm8650: Add SM8650 camera clock controller driver
>>> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/config)
>>> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407072331.baglL4Sd-lkp@intel.com/reproduce)
>>
>> This and this:
>> https://lore.kernel.org/all/202407072212.WptVaUDt-lkp@intel.com/
>>
>> are reports on linux-next. They were addressed to you/
>>
>> Jagadeesh, how did you respond to public reports that your commit has
>> build failures in linux-next?
>>
>> It reached now Linus' tree causing huge rant, unfortunately not in the
>> direction we would like that rant to go.
>>
>> If you receive a report that your code does not even compile, it is YOUR
>> DAMN MOST IMPORTANT TASK to address it IMMEDIATELY.
>>
>> I don't think such code should be ever accepted if contributors do not
>> take responsibility for their commits.
>>
>> Krzysztof
>>
> 
> I initially submitted my change [1] by passing pdev to 
> qcom_cc_really_probe(). Seems like due to [2] which changed the 
> qcom_cc_really_probe() parameters from pdev to dev, my change was 
> updated from pdev to &pdev->dev while applying.
> 
> When this issue was reported by kernel bot, I checked out the linux-next 
> tree but I didn't see this failure since the common change [2] was 

So tree is not bisectable but that's fine? How about telling the
maintainer: listen, your tree is now broken?

> already merged into linux-next. I apologize for not reverting the same 
> over the email thread.
> 
> But change [2] was somehow missed and only my change [1] landed up in 
> Linus's tree, which led to this failure as Arnd described in [3].

Nothing was missed. That commit should have never been accepted to that
branch, but, since it happened, you claim that dependency in clk drivers
should as well go to DTS branch? No, that's just wrong.

Mistake was that particular commit going to that branch and kernel robot
told you that which you (and Bjorn, but Bjorn is busy so it is your job
as contributor) should investigate.

If that's how commits from quicinc look like I am afraid to take
anything. I will be on my own, stuck with such issues, because for
contributor "it is fine".

Best regards,
Krzysztof

