Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9A1BC9E2
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 23:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734650795; cv=none; b=o8p5eQMO7blIkxYS21fODhsI25pp1E1bBZf/nh2tyazJxXPmvc0TmfqgaZyJSUGCCgxt1JJtaPyyga8NIQgQDqKXeqVbIoK04MZtdFpOEv90Q4dwUmiYEB7Qozb2aYFfM+taaLpuFIgSxqixJuH4FAhOtKZ5ton7Z6+rMS2zc4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734650795; c=relaxed/simple;
	bh=SNsf2cDD4wYnXF1mwSQDE0NyzQU1QrkOH4gRuQ6OOIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IvECTYXovhao828hyirfg6tdMTJz8O/BAo5MjviBGsvHkflDapZWqs+WNelalGBtc8bs066ROoU3nKonOPcLxjx5sBhr+lyCbbByWtZEOtPeMgafH+txR2evs7nApSxHE0dHoJYA6ftLh//sFP7y1eFP8qS7Ejg5EYSEumjFmCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Z0ABol0H; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Z0ABol0H"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-38634c35129so991115f8f.3
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 15:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734650792; x=1735255592; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yQzQnFp2IhyVs3apwxUpaxFzHYZlLjZfIo7SiWZYwmA=;
        b=Z0ABol0HfCS2q+A8DeBPu2kXRVkeA3NjWfKgyfcuzLxjEzslqxfuDZhYdiDCQUDclp
         fv1JWZzFhbtTjAEjh4cucezPXLdvyyGAhD9a7XfAu2P3whHIOkg2nYQTZp45z+fRzCeG
         32Vh62ZpABjPXw+XHkLbpLB+RuNi+mWo1eR4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734650792; x=1735255592;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQzQnFp2IhyVs3apwxUpaxFzHYZlLjZfIo7SiWZYwmA=;
        b=W6GQfvyj8rnHjqNzwbuIYY0UGpR3g3cuV/V+GOeAcnktRHKzO0qujUyESVKJzTsAza
         jd6GFtqnQNEkvPt1865XahuMNUfzK/1viRq3jDK7Ygwhr4ZqfzKYjR2ePTgJQJCjLazF
         qlLmJLitV3S5nWmx6iDEEY+iI27d1PTQdqRO6gvUoQcl4wztBSDleq5OyYKjbXhIHqHq
         NyQN4fa75as2hCpLiQUvzfi9zCINRanA+Gjvb5kezfeOIlmqrbRUUpZS5PVtTiB5aFPK
         RuZaa9w5LKl2eRDaNJC7Ghe5EjQvXodi2YOSgW2qKPOKxtdboJ/N0SNqRkfl2PC4PyMo
         RGuA==
X-Forwarded-Encrypted: i=1; AJvYcCVVCwOWSb7nQrcSkx/uY8SX5EGL/2rFdZ+Kn64wgn/k2V00LofvwKODPTRKWxSeWlM9caOk@lists.linux.dev
X-Gm-Message-State: AOJu0YywipkoUrv4iLUgkqbdTgdSQlZwzB8VBui2lodIbpozh9u6QQsY
	jB1Xw4Z+5yHVXTgXP+YgZaPGAbSuwZfwUZBa0Xy1Pnm/Ku0uBgYlphUi1qMqN9g=
X-Gm-Gg: ASbGncv25QriVIpw6PyT8h247L8KFkBmXoIYBXgseQjoInuD9XIMaYQMRt6ZPzSVYE+
	sdC4wusrCU0oSW+tv+Seqr2y2CvsBhSPhbDx+aQhCMZGaGGdT9gRXeLJqe/N9bRVQlhaPq8B1VX
	oO04Iam1ukiSEJtTuZ6u3ppJb58K8dw4Uo2uZ/fEsSJR4iiiWYBPECMb7NhbwyvhyIowMBJInPR
	Q+t5bTjnIQR1qs43pKPnh1sEMcf41Xm0kgvdI0dqBqzw7xglrE1fpoBmRN45EABPaCaWlZHiDv0
	WskV1Gdsk7Xr3PpjmS99
X-Google-Smtp-Source: AGHT+IEE6KINFP4Lf4Jdy97zK+HyJlQLQpIV1kYbguLE5pLVsNiikJSZr7uZf4uF6HzFAdbVVyQYvg==
X-Received: by 2002:a5d:59af:0:b0:385:f560:7924 with SMTP id ffacd0b85a97d-38a221e2de9mr605690f8f.4.1734650792104;
        Thu, 19 Dec 2024 15:26:32 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm2564955f8f.24.2024.12.19.15.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 15:26:31 -0800 (PST)
Message-ID: <90640a5d-ff17-4555-adc6-ae9e21e24ebd@citrix.com>
Date: Thu, 19 Dec 2024 23:26:30 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com
Cc: Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>, Jan Beulich <jbeulich@suse.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
 <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
 <CA+icZUX98gQ54hePEWNauiU41XQV7qdKJx5PiiXzxy+6yW7hTw@mail.gmail.com>
 <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+icZUW-i53boHBPt+8zh-D921XFbPb_Kc=dzdgCK1QvkOgCsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2024 11:10 pm, Sedat Dilek wrote:
> On Thu, Dec 19, 2024 at 6:07 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> On Thu, Dec 19, 2024 at 5:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>> On 19/12/2024 4:14 pm, Sedat Dilek wrote:
>>>> Hi,
>>>>
>>>> Linux v6.12.6 will include XEN CVE fixes from mainline.
>>>>
>>>> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
>>>> from kernel.org.
>>>>
>>>> What does it mean in ISSUE DESCRIPTION...
>>>>
>>>> Furthermore, the hypercall page has no provision for Control-flow
>>>> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
>>>> malfunction in such configurations.
>>>>
>>>> ...when someone uses Clang-kCFI?
>>> The hypercall page has functions of the form:
>>>
>>>     MOV $x, %eax
>>>     VMCALL / VMMCALL / SYSCALL
>>>     RET
>>>
>>> There are no ENDBR instructions, and no prologue/epilogue for hash-based
>>> CFI schemes.
>>>
>>> This is because it's code provided by Xen, not code provided by Linux.
>>>
>>> The absence of ENDBR instructions will yield #CP when CET-IBT is active,
>>> and the absence of hash prologue/epilogue lets the function be used in a
>>> type-confused manor that CFI should have caught.
>>>
>>> ~Andrew
>> Thanks for the technical explanation, Andrew.
>>
>> Hope that helps the folks of "CLANG CONTROL FLOW INTEGRITY SUPPORT".
>>
>> I am not an active user of XEN in the Linux-kernel but I am willing to
>> test when Linux v6.12.6 is officially released and give feedback.
>>
> https://wiki.xenproject.org/wiki/Testing_Xen#Presence_test
> https://wiki.xenproject.org/wiki/Testing_Xen#Commands_for_presence_testing
>
> # apt install -t unstable xen-utils-4.17 -y
>
> # xl list
> Name                                        ID   Mem VCPUs      State   Time(s)
> Domain-0                                     0  7872     4     r-----     398.2
>
> Some basic tests LGTM - see also attached stuff.
>
> If you have any tests to recommend, let me know.

That itself is good enough as a smoke test.  Thankyou for trying it out.

If you want something a bit more thorough, try
https://xenbits.xen.org/docs/xtf/  (Xen's self-tests)

Grab and build it, and `./xtf-runner -aqq --host` will run a variety of
extra codepaths in dom0, without the effort of making/running full guests.

~Andrew
