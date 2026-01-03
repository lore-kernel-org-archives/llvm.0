Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60712221726
	for <llvm@lists.linux.dev>; Sat,  3 Jan 2026 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767484681; cv=none; b=GaI/bZ9ANX6ddxuiFONDpqwA+rQFomSXfvodKE0BCjU3xwrt4Jt7/FwTcFTNcnGcR7eQX+MfyCnSyrqvAnepbqtjq1SPC8kJq2YNNegUcFvekHJBXvrO+PnLODxqO2hTo/8peGZ7KnOihwCKTY044/HGWQy2xNM8hVxL6jXyqJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767484681; c=relaxed/simple;
	bh=Nc0bv4pj2jQS1zXWwXvjiUVnCrXsy+PQZzamWQEOi/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osbTzp3lAeeGG1melGaaP9qs6AX10OZkxga29TO/rZ85hnvHz+kyYEP2HkIkIayDNgUcQVXdpbmJuP8LhcrqjYul662F0037GSQmywalwPnU2NOkaaQa4vbj0opX9GbQbxukKmCYrllM/eCn4OInHLUOTUOR6mSTM+gs6ha9SbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HGm+ylk3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HGm+ylk3"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5957a623c7fso1660837e87.0
        for <llvm@lists.linux.dev>; Sat, 03 Jan 2026 15:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767484677; x=1768089477; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=HGm+ylk3lniPq5sZpHteAeQiy0WNsfN5Y06sW20PmliQOOPWq5cfi9L9eEB3VbX0Mu
         KHW5aAPQva2uyfSo3w9Gslube+BDVmXK5NFsMOdVuzqGL0T4ww7mOJ99Y92PpxkmZRU4
         G46MLLefGvxwWpMzJYG3OODu/dsWXB5s4jyqjChA1DFimoRkRpwIRQ+w0Zjihrc852zM
         HWz4ibuCHnKXO51oOHIHxUsjYnvhKdWKTSXNwnI+XLR/Fcw4hiz0yaBbAFL+YVPDXRam
         7OCLYFrXeqBQxzCOGfGqJQyi1cnbbXLGmzIrC2Tz8yW/DWl8NLB+mxvvjOj5YsYeAT19
         b+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767484677; x=1768089477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=xQ2zXHPM4v8hSUDqXfXwdFrwHHe+iDg86RPS5E7h69tatn7JhjWixGmVe5wE8MMyNF
         OjfR5JqctIoztK3bCLO42mgaoBIukgQdTIGn2uWFVl5frdM7zdcnHuXniOts+Vj3MMXA
         KNgVPd2qjB2lWupld4Wh+AHbKwbsqDxQqaER14TIJK0MM8k7FEuDKfr9Me9YXi7amzK3
         SQ7P4aCebAlzi7vNuJSw/13Pb6tJSrGArRFhvm7BXxfzpmMdiVL4NhOWvADEYBQOODuy
         JuniwTXrsOGMK+POTgVMazZ4WwbIrDembYPfQtNmy067wWEidXW25XNjTUajjchCR8aK
         FqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc0rqRhMRaqF+gy+0gYonEJLd2k7vYMZEAJafvlPs4Xh9w/TfVK8gbcxm4037BWj9kEAi1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd33wA7fv9EeK4G9SKJjE07G1WIZ8InX+3xwWDtx0LdEaLOpYW
	btRd6A4n1pc3llWgtiamJbbJDDbgf7m7Yag/cBc3Pa9n2NxlXCLpUHx5TDx4zft31nA=
X-Gm-Gg: AY/fxX4FgSkm9c1ILartuYvS5Y9SROMS5EPfMis0BKD0yuExkxFpYUejuhNqmkl3suK
	Ii48tRD+B6ktIQZ112kZvMV7SaF7VKMzewc+3cdT4rb4zj7fBoZuhRp8IJROJYDfr9XjUXiW2ED
	Nu8oUdtemfXK7uQcbL5gJ9dWi7WYmD9X6MCJ8iudJ4IA4o0PbyDNUcdFGh4cH/PiCjOqKCvvSlP
	AfNhgnxTsvTzf2SkwdiTpoNnmq/ulCcFdPKNaOHX8iBaH79YcrNhB5/D/tVrNTmM3PxYgdB8Jav
	YadWDg4/CRfdlUkiSE1I+cjfCVF6qdRmkGZFuCBeNBYIwrBOhnXvy/gWuVL1EqnUmCFs+NBF3A0
	Fx0OtDrgra7Uvw1baPSkBuMi2Nw2ZiAd8pEOWhaWL6SytNM7RmVuUIPUPsOg3M2pLspgif4MW/T
	RZJmL7Kbt7nhuVuSDpyWc5hgaFTsZn4ejkiebs3Pj0JFFbo7UraiSheiIPqw2zx6je4g==
X-Google-Smtp-Source: AGHT+IHsnTa0hbn+0Wh1C3VR25cgPSQ44uvQseVE0kXGNojATuxFAd6n7Pd80xTUUipMQpgZdEmtvQ==
X-Received: by 2002:a05:6512:3ba3:b0:597:d7d6:eae1 with SMTP id 2adb3069b0e04-59a17d74eb7mr10048358e87.2.1767484677292;
        Sat, 03 Jan 2026 15:57:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm13558109e87.31.2026.01.03.15.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 15:57:55 -0800 (PST)
Message-ID: <ad801501-cd9f-41f5-97b3-bf8b628d6e1d@linaro.org>
Date: Sun, 4 Jan 2026 01:57:48 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Manivannan Sadhasivam <mani@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 14:38, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>>
>> Thanks for the cleanup.
>>
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>>
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>>
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
> 
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.

The made conversion changes are not exactly the ones, which were asked to
be done.

Commit 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped()
to automate of_node_put() handling") says it clearly:

     Note that, in the vast majority of cases, the _available_ form should be
     used and as code is converted to these scoped handers, we should confirm
     that any cases that do not check for available have a good reason not
     to.

So, likely this and many other similar changes miss information in their
commit messages, why for_each_available_child_of_node_scoped() form is
inapplicable, thus it still could be improved.

> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.
> 
>>
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.
> 

-- 
Best wishes,
Vladimir
