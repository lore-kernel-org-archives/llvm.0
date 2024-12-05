Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D54C96
	for <llvm@lists.linux.dev>; Thu,  5 Dec 2024 02:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733364524; cv=none; b=GmIgoppouT0MeY7UUe8H6rHodweEVvoNOMCGwXvr7SUc+ZiX0gIbG9Mr3RfElLwf8AxdKGPiXOs0bqSfxQOEay2huSwHf8mP5ofs0qwK7h1WCxLE8eVe0CZNjVfavSzL+Zh8WIFFFolWtA8RL9Jc+LtgU0NCvteZ/UfbFXQsQH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733364524; c=relaxed/simple;
	bh=nDG+8aYIZ9QraJqVa/t4IK73vfVfRB0gjgR7+D/q0ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fg8y0Y/cXATn/eD3z0o05jNUf4OjttQkorXVZPLQanKrAQz7GnmckyAnrQCFoMGm1kZ09uEw3SYuNHDxm49hI3ZL4KgXB1KBfYJjWQblOz5Z9R9FbVrWkjRZr3jmm7Dx5n9rklIoYDd7n1aBYxsGhTqOrl3KNSzqYQScpC3XkIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NSHH9TdY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSHH9TdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733364520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6Gw0AX39hZKgDHXxv9Qp3FDLeF0px+FhZ38A7wP9Z8=;
	b=NSHH9TdY57qgqkjT+Iw2NXZeL50/85hh8ULP/wGbtSFz/m83bmomFfWOYC98aqTFvAwkT9
	v8Bb4EHjN22BPu4YKOWw//UmYFRsBhZD/H40kiLiquM+bYDIP8YnNOS3MSINJxskBV2kak
	mfitjfjsQ4IcIIzH0yBYNY30ZwJopEo=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-3CGfhExXPvWyc_RIAFTKtA-1; Wed, 04 Dec 2024 21:08:39 -0500
X-MC-Unique: 3CGfhExXPvWyc_RIAFTKtA-1
X-Mimecast-MFC-AGG-ID: 3CGfhExXPvWyc_RIAFTKtA
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-7ee3c2a2188so374210a12.3
        for <llvm@lists.linux.dev>; Wed, 04 Dec 2024 18:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733364518; x=1733969318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6Gw0AX39hZKgDHXxv9Qp3FDLeF0px+FhZ38A7wP9Z8=;
        b=btl4FIj0vd/Iba2Q1LNlNyjKQ6pNM4ftaQTnmSYTwnIfbVPq8R9qg+l+Rc38zhpXvA
         dP/pQ3NY842bJUXoa35QaWkU9sNeLd7JGffEGCI7BkCUn2YZdMBwOi1vIWeYkHDgzevD
         lLAxZ1WyMyJtFsFE6/sb2UAA1Ap6m1zZAUXuyOn7ysGw1qE+vCwb4rtm4WNjAqoznJnq
         tCp+CpZLlxsKb1nfvBytunWYsG6HFJjDet9z8/0UpM7Xkn5SU18VEyLx6vaUAQdNHUmc
         e25YN4Ur+2FFOJ9scQlZSEwlM4YFFtAMb/vK2LZ+GglQ1pPhyuqIOC4a/kJcD5EWbtZr
         lRsQ==
X-Gm-Message-State: AOJu0YzWleXQ0nKfZTWTe/113CJjxtEq78NfM0++h34I0LUudkI0qZxe
	f36rrat5C147g7Fe3dnmSZdAZiEKW/zD8z6/7QSY4HCzZb9ax9SOEw1A39LXJZSA49jgl15g8wt
	c8kGXRYvFGGKQkoyq/e7FlUHQnfpn1I7wiFCnm0Jzv/33BmfHDRQfhwILhx2jxQ==
X-Gm-Gg: ASbGnctCjR6HW5Ps5ft5hF+durn2pcZpdBHaj4oCqaqzV2yVKQ613JRg5eqOyuno+LN
	SUuTFuJQwU/xoGcWYKbwMqjoVRJqq53oy8JTFtJ/sAEJXiotLl4uIPELT+Ue+c7CRKs9FZyUXx5
	imyRlQI9Mub0ww67pgdfedvdvDAWDWxbYYmLDEk7YWriYu/X0jv2o1/A7rqYPGmn82QJ8czsydA
	Mjhvy62nEMW8guqO63vQ6cYN0Yw6O45BP5iBy5KxKgo6Izgfd0=
X-Received: by 2002:a05:6a20:3d85:b0:1e0:ca95:2de8 with SMTP id adf61e73a8af0-1e16542f2b2mr12982087637.46.1733364518043;
        Wed, 04 Dec 2024 18:08:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhDcSGGSElTLYdqdAj3uX++CbDOTLqJIwBzBiZJs+d3G5x5Z329XdRGvzzx2G+x78WocvU2w==
X-Received: by 2002:a05:6a20:3d85:b0:1e0:ca95:2de8 with SMTP id adf61e73a8af0-1e16542f2b2mr12982041637.46.1733364517252;
        Wed, 04 Dec 2024 18:08:37 -0800 (PST)
Received: from [10.72.112.152] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29c5ccesm172907b3a.12.2024.12.04.18.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 18:08:36 -0800 (PST)
Message-ID: <60ab506d-5374-484d-906e-3561fc895a6d@redhat.com>
Date: Thu, 5 Dec 2024 12:08:29 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Jeremy Linton <jeremy.linton@arm.com>, kernel test robot <lkp@intel.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-2-jeremy.linton@arm.com>
 <202412031348.bp5i3ws2-lkp@intel.com>
 <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
 <a64a21cc-6d10-4e8f-9ab9-87aca44ca858@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <a64a21cc-6d10-4e8f-9ab9-87aca44ca858@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pFrJbydQwudA_nMK30qQaFgxQAXnASeXqW0t3Fwzy_M_1733364518
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/4/24 1:30 AM, Jeremy Linton wrote:
> On 12/3/24 2:56 AM, Gavin Shan wrote:
>> On 12/3/24 4:03 PM, kernel test robot wrote:
>>> Hi Jeremy,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> [auto build test WARNING on arm64/for-next/core]
>>> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
>>> [cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/ arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/ linux.git for-next/core
>>> patch link:    https://lore.kernel.org/r/20241203000156.72451-2- jeremy.linton%40arm.com
>>> patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
>>> config: arm64-randconfig-004-20241203 (https://download.01.org/0day- ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
>>> compiler: clang version 20.0.0git (https://github.com/llvm/llvm- project 592c0fe55f6d9a811028b5f3507be91458ab2713)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2- lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
>>>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>           |                     ^
>>>     include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
>>>       356 | #define __maybe_unused __attribute__((__unused__))
>>>           |                                                        ^
>>>     include/linux/mod_devicetable.h:607:8: note: previous definition is here
>>>       607 | struct platform_device_id {
>>>           |        ^
>>>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
>>>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>           | ^~~~~~~~~~~~~
>>>     2 warnings generated.
>>>
>>>
>>> vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>>>
>>>     222
>>>     223    /* modalias, so userspace can autoload this module when RSI is available */
>>>   > 224    static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>>>     225        { RSI_PDEV_NAME, 0},
>>>     226        { }
>>>     227    };
>>>     228
>>>
>>
>> The definition may have to be something like below, to avoid the compiling warning.
>>
>> static const struct platform_device_id __maybe_unused arm_cca_match[] = {
> 
> I should have tested this with clang rather than copy/pasting the utilization from somewhere else! It looks like a number of other kernel users are putting it before the '=', but its sorta annoying because it seems like the kind of warning that should be suppressed globally for this case (module device description in module that can be built in).
> 
> 

I think it also work by putting '__maybe_unused' before '='. It's also my personaly preferred style.
However, I don't see how the pattern 'struct __maybe_unused platform_device_id arm_cca_match[]' can
work because the affective scope of '__maybe_unused' is ambiguous to the compiler: 'struct platform_device_id'
or 'arm_cca_match[]'.

> 
>>         ...
>> };
>>

Thanks,
Gavin


