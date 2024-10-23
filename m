Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482BBE56A
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729719711; cv=none; b=owxPJOyU4lw3zPaFk9uo9TMqVQXNxM6e8NI3XEXWuz4FB0KKeE/DLh2qCVA/bJ+CyN4A+Vqgu3LQT+q6UgG5S9FVa2MCxAKpR0+c2/LglYr19pr/YRv9xiZFCuoL8anWo62JDgkDkqzCT/DIUmq7AIMCwx0NrfY7QoT9DOl5fNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729719711; c=relaxed/simple;
	bh=y4763EOgL1q3ScAtkoeUAWGIOBqiMl/Y29seYHxlJmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwcYILtbaOjxO6ChoHZWjOo8frnpXNXm191qJ5+lCRtq6hdu7YLKysCYNMtSb9cD/2hSWhTexYNrMumLJd+zlF5XqzYCcs9WSjm4F+FZ1ebJxUsGaMxO4bKLBCjTFf762W/4wIHtWLrY/soS57UI6UE8MBkjyGE/mhZVgS2jFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Ru8OEuvY; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Ru8OEuvY"
Received: from [172.27.3.244] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 49NLexNv1411797
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 23 Oct 2024 14:40:59 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 49NLexNv1411797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2024101701; t=1729719661;
	bh=bD0HK2j0SgBCID4Iw/rZZNpJTyJpExrZmV8kuJQazzo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ru8OEuvYgotG68bpU1jy5B2NhwpTi60EKtvz/WmX2nl2K0CUUMLvyQSxCWTWJT1ia
	 8/9H2rGjgd/Jq71UH78VZKB9SBhlbLTnV6Nt75oIgGcW8ahyBxJF6gZznS8ObG7+11
	 HBJCHCgW8J4ZxwmFL9Y4BhQUfGi//nLpxAv5Dxb5BbmAivTxgqVl2gFPG1pYn7dH3a
	 pRMWpnJH8JWijyjWjGz0pWXC8oU7OISbUcrN4Xm/3ocjRMbYf0Xf/tI4cBCgjBirGg
	 oV23LZZvXfSK5N8YQz+45gs5+neVUVtDZwGH8lJP2KCFeYeaTHlzf/4ii6QqutY/gj
	 FPjIs/vi9ZWqA==
Message-ID: <20ed1295-3012-4d71-a4d3-9d6a63cdfdf3@zytor.com>
Date: Wed, 23 Oct 2024 14:40:59 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] x86/percpu: Cast -1 to argument type when
 comparing in percpu_add_op()
To: Dave Hansen <dave.hansen@intel.com>,
        "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ingo Molnar <mingo@kernel.org>, Uros Bizjak <ubizjak@gmail.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
References: <20240905170356.260300-1-andriy.shevchenko@linux.intel.com>
 <f02e0624-ad4f-473c-b172-6dadea37f600@intel.com>
 <20241016192011.GY17263@noisy.programming.kicks-ass.net>
 <de705cdf-ccce-460f-846e-dfc63c63af1a@intel.com>
 <20241017181859.GB17263@noisy.programming.kicks-ass.net>
 <c22fd9c5-6727-46c2-a811-784315edf7cb@intel.com>
 <4b1a26b2-cccb-75d8-ee2f-f30ae211e598@gentwo.org>
 <bc707fc1-b5fe-4c2d-af88-c44737198876@intel.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <bc707fc1-b5fe-4c2d-af88-c44737198876@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/24 10:15, Dave Hansen wrote:
> On 10/22/24 16:24, Christoph Lameter (Ampere) wrote:
>> On Tue, 22 Oct 2024, Dave Hansen wrote:
>>
>>> So I think Peter's version was the best.  It shuts up clang and also
>>> preserves the existing (good) gcc 'sub' behavior.  I'll send it out for
>>> real in a bit, but I'm thinking of something like the attached patch.
>> The desired behavior is a "dec". "sub" has a longer op code AFAICT.
> 
> Gah, yes, of course.  I misspoke.
> 
> We want "inc" and "dec" for +1 and -1.  "add" and "sub" are heftier and
> get used for everything else.

Do we really? I don't know if there are any microarchitectures where the 
partial register update still matters. It is only one byte difference.

	-hpa



